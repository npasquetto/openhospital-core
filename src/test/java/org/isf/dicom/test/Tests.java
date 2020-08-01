package org.isf.dicom.test;


import static org.hamcrest.Matchers.*;
import static org.junit.Assert.assertEquals;

import org.apache.poi.util.IOUtils;
import org.isf.dicom.manager.*;
import org.isf.dicom.model.FileDicom;
import org.isf.dicom.service.DicomIoOperations;
import org.isf.dicomtype.model.DicomType;
import org.isf.dicomtype.test.TestDicomType;
import org.isf.dicomtype.test.TestDicomTypeContext;
import org.aspectj.util.FileUtil;
import org.isf.generaldata.GeneralData;
import org.isf.menu.manager.Context;
import org.isf.utils.db.DbJpaUtil;
import org.isf.utils.exception.OHDicomException;
import org.isf.utils.exception.OHException;
import org.isf.utils.exception.OHServiceException;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import javax.swing.*;
import javax.xml.transform.Source;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Properties;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class Tests  
{
	public static final int PATIENT_ID = 0;
	public static final int FILE_ID = 0;
	public static final Long _4M = new Long(4194304);
	private static DbJpaUtil jpa;
	private static TestDicom testFileDicom;
	private static TestDicomContext testFileDicomContext;
	private static TestDicomType testDicomType;
	private static TestDicomTypeContext testDicomTypeContext;

    @Autowired
    DicomIoOperations dicomIoOperation;

	@Autowired
	private ApplicationContext applicationContext;

	private DicomManagerInterface fileSystemDicomManager;
	private FileDicom dicomFile;
	private SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");


	@BeforeClass
    public static void setUpClass()  
    {
    	jpa = new DbJpaUtil();
    	testFileDicom = new TestDicom();
    	testFileDicomContext = new TestDicomContext();
    	testDicomType = new TestDicomType();
    	testDicomTypeContext = new TestDicomTypeContext();
    	
        return;
    } 

    @Before
    public void setUp() throws OHException, OHDicomException {
        jpa.open();
		Context.setApplicationContext(applicationContext);
		fileSystemDicomManager = new FileSystemDicomManager(_getDicomProperties());
		DicomType dicomType;
		dicomType = testDicomType.setup(true);
		dicomFile = testFileDicom.setup(dicomType, true);
        _saveContext();
		
		return;
    }

	private Properties _getDicomProperties(){
		Properties properties = new Properties();
		properties.setProperty("dicom.manager.impl", "FileSystemDicomManager");
		properties.setProperty("dicom.storage.filesystem", "rsc-test/dicom");
		return properties;
	}

	@After
    public void tearDown() throws Exception
    {
        _restoreContext();   
        
        jpa.flush();
        jpa.close();
                
        return;
    }
    
    @AfterClass
    public static void tearDownClass() throws OHException 
    {
    	testFileDicom = null;
    	testFileDicomContext = null;
		_deleteSavedDicomFile();

		return;
    }

	private static void _deleteSavedDicomFile() {
		FileUtil.deleteContents(new File("rsc-test/dicom/0"));
		FileUtil.deleteContents(new File("rsc-test/dicom/dicom.storage"));
	}


	@Test
	public void testFileDicomGets() 
	{
		long code = 0;
			

		try 
		{	
			DicomType dicomType = testDicomType.setup(false);
			code = _setupTestFileDicom(false);
			_checkFileDicomIntoDb(code);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();		
			assertEquals(true, false);
		}
				
		return;
	}
	
	
	@Test
	public void testFileDicomSets()
	{
		long code = 0;
			

		try 
		{		
			code = _setupTestFileDicom(true);
			_checkFileDicomIntoDb(code);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();		
			assertEquals(true, false);
		}
		
		return;
	}
	
	
	@Test
	public void testIoGetSerieDetail() 
	{
		long code = 0;
		
		
		try 
		{		
			code = _setupTestFileDicom(false);
			FileDicom foundFileDicom = (FileDicom)jpa.find(FileDicom.class, code); 
			Long[] dicoms = dicomIoOperation.getSerieDetail(foundFileDicom.getPatId(), foundFileDicom.getDicomSeriesNumber());
			
			assertEquals(1, dicoms.length);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();		
			assertEquals(true, false);
		}
		
		return;
	}


	@Test
	public void testIoDeleteSerie() 
	{
		long code = 0;
		boolean result = false;
		

		try 
		{		
			code = _setupTestFileDicom(false);
			FileDicom foundFileDicom = (FileDicom)jpa.find(FileDicom.class, code); 
			result = dicomIoOperation.deleteSerie(foundFileDicom.getPatId(), foundFileDicom.getDicomSeriesNumber());
			
			assertEquals(true, result);
			result = dicomIoOperation.isCodePresent(code);			
			assertEquals(false, result);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();		
			assertEquals(true, false);
		}
		
		return;
	}
	
	
	@Test
	public void testIoLoadFileDicom() 
	{
		long code = 0;
		

		try 
		{		
			code = _setupTestFileDicom(false);
			FileDicom foundFileDicom = (FileDicom)jpa.find(FileDicom.class, code); 
			FileDicom dicom = dicomIoOperation.loadDetails(foundFileDicom.getIdFile(), foundFileDicom.getPatId(), foundFileDicom.getDicomSeriesNumber());
			FileDicom dicom2 = dicomIoOperation.loadDetails(new Long(foundFileDicom.getIdFile()), foundFileDicom.getPatId(), foundFileDicom.getDicomSeriesNumber());
			
			assertEquals(dicom.getDicomInstanceUID(), dicom2.getDicomInstanceUID());
			assertEquals(foundFileDicom.getDicomSeriesDescription(), dicom.getDicomSeriesDescription());
		} 
		catch (Exception e) 
		{
			e.printStackTrace();		
			assertEquals(true, false);
		}
		
		return;
	}


	@Test
	public void testIoLoadPatientFiles() throws Exception{
		long code = _setupTestFileDicom(false);
		FileDicom foundFileDicom = (FileDicom) jpa.find(FileDicom.class, code);
		FileDicom[] dicoms = dicomIoOperation.loadPatientFiles(foundFileDicom.getPatId());
		assertEquals(foundFileDicom.getDicomSeriesDescription(), dicoms[0].getDicomSeriesDescription());
	}

	
	@Test
	public void testIoExist() 
	{
		long code = 0;
		boolean result = false;
		

		try 
		{		
			code = _setupTestFileDicom(false);
			FileDicom foundFileDicom = (FileDicom)jpa.find(FileDicom.class, code); 
			result = dicomIoOperation.exist(foundFileDicom);

			assertEquals(true, result);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();		
			assertEquals(true, false);
		}
		
		
		return;
	}
	
		
	@Test
	public void testIoSaveFile() 
	{
		long code = 0;
			
		
		try 
		{		
			code = _setupTestFileDicom(false);
			FileDicom foundFileDicom = (FileDicom)jpa.find(FileDicom.class, code); 
			foundFileDicom.setDicomSeriesDescription("Update");
			dicomIoOperation.saveFile(foundFileDicom);
			FileDicom updateFileDicom = (FileDicom)jpa.find(FileDicom.class, code); 
			
			assertEquals("Update", updateFileDicom.getDicomSeriesDescription());
		} 
		catch (Exception e) 
		{
			e.printStackTrace();		
			assertEquals(true, false);
		}
		
		return;
	}




	@Test
	public void testSaveFile() throws OHServiceException, IOException {
		fileSystemDicomManager.saveFile(dicomFile);
		_checkIfExists(dicomFile);
	}

	private boolean _checkIfExists(FileDicom dicomFile) throws IOException {
		File dicomFileDir = new File("rsc-test/dicom/0/TestSeriesNumber");
		FileReader fr = new FileReader(new File(dicomFileDir, "1.properties"));
		Properties dicomProperties = new Properties();
		dicomProperties.load(fr);
		fr.close();
		assertEquals(3, dicomFileDir.listFiles().length);
		assertEquals("TestInteanceUid",  dicomProperties.getProperty("dicomInstanceUID"));


		return false;
	}

	@Test
	public void testLoadPatientFiles() throws OHServiceException {
		FileDicom[] fileDicoms = fileSystemDicomManager.loadPatientFiles(PATIENT_ID);
		assertTrue(fileDicoms.length > 0);

	}

	@Test
	public void testLoadDetails() throws OHServiceException {

		GeneralData.getGeneralData();
		FileDicom fileDicom = fileSystemDicomManager
				.loadDetails(2, 1, "TestSeriesNumber");


	}

	@Test
	public void testGetSerieDetail() throws OHServiceException {
		Long[] result = fileSystemDicomManager.getSerieDetail(PATIENT_ID, "TestSeriesNumber");
		assertTrue(result.length > 0);
	}


	@Test
	public void tesExist() throws OHServiceException {
		boolean fileExits = fileSystemDicomManager.exist(dicomFile);
		assertTrue(fileExits);
	}

	@Test
	public void testExistWhenDicomFileNoExist() throws OHServiceException {
		FileDicom dicomFile = new FileDicom();
		boolean fileExits = fileSystemDicomManager.exist(dicomFile);
		assertFalse(fileExits);
	}


	@Test
	public void testDeleteSerie() throws OHServiceException, OHException {
		int idPaziente = 2;
		DicomType dicomType;
		dicomType = testDicomType.setup(true);
		FileDicom dicomFile = testFileDicom.setup(dicomType, true);
		dicomFile.setDicomSeriesNumber("SeriesNumber");
		dicomFile.setPatId(idPaziente);
		fileSystemDicomManager.saveFile(dicomFile);
		boolean serieDeleted = fileSystemDicomManager.deleteSerie(idPaziente, "SeriesNumber");
		assertTrue(serieDeleted);
	}


	@Test
	public void testDicomManagerFactoryGetManager() throws OHDicomException {
		DicomManagerInterface manager = DicomManagerFactory.getManager();
		assertThat(manager, instanceOf(FileSystemDicomManager.class));
	}

	@Test
	public void testDicomManagerFactoryGetMaxDicomSize() throws OHDicomException {
		String maxDicomSize = DicomManagerFactory.getMaxDicomSize();
		assertEquals("4M", maxDicomSize);
	}



	@Test
	public void testDicomManagerFactoryGetMaxDicomSizeLong() throws OHDicomException {
		Long maxDicomSize = DicomManagerFactory.getMaxDicomSizeLong();
		assertEquals(_4M, maxDicomSize);
	}

	@Test
	public void testSourceFilesGenerateSeriesNumber() throws OHServiceException {
		String seriesNumber = SourceFiles.generateSeriesNumber(PATIENT_ID);
		assertFalse(seriesNumber.isEmpty());

	}

	@Test
	public void testSourceFilesLoadDicom() throws Exception {
		File file = _getFile("case3c_002.dcm");
		SourceFiles.loadDicom(dicomFile, file, PATIENT_ID);
		assertEquals("case3c_002.dcm", dicomFile.getFileName());
		assertEquals("Anonymized Hospital", dicomFile.getDicomInstitutionName());
		assertEquals("MRT Oberbauch", dicomFile.getDicomStudyDescription());

	}
	@Test
	public void testSourceFilesLoadDicomWhenImageFormatIsJpeg() throws Exception {
		File file = _getFile("image.0007.jpg");
		SourceFiles.loadDicom(dicomFile, file, PATIENT_ID);


	}

	@Test
	public void testSourceFilesPreloadDicom() throws Exception {
		String studyDate = "01/01/2001 10:22:33";
		String seriesDate ="14/05/2007 10:22:33";
		Date expectedSeriesDate = dateFormatter.parse(seriesDate);
		Date expectedStudyDate = dateFormatter.parse(studyDate);
		File file = _getFile("case3c_002.dcm");
		FileDicom fileDicom = SourceFiles.preLoadDicom(file, 1);

		assertEquals("case3c_002.dcm", fileDicom.getFileName());
		assertEquals(1, fileDicom.getFrameCount());
		assertTrue((expectedSeriesDate.getTime() - fileDicom.getDicomSeriesDate().getTime()) < 1000);
		assertTrue((expectedStudyDate.getTime() - fileDicom.getDicomStudyDate().getTime()) < 1000);
	}

	@Test
	public void testSourceFilesCountFiles() throws Exception {
		File file = _getFile("dicomdir");
		int count = SourceFiles.countFiles(file, 1);
		assertTrue(count > 0);

	}
	@Test
	public void testSourceFilesRun() throws Exception {
		AbstractDicomLoader dicomLoader = new AbstractDicomLoader(2, new JFrame()) {};
		AbstractThumbnailViewGui thumbnailViewGui = new AbstractThumbnailViewGui() {};
		File file = _getFile("dicomdir");
		SourceFiles sourceFiles =
				new SourceFiles(dicomFile,file,PATIENT_ID,2,thumbnailViewGui,dicomLoader);
		sourceFiles.run();

	}


	private File _getFile(String fileName){
		return new File(getClass().getResource(fileName).getFile());
	}





	private void _saveContext() throws OHException
    {
		testFileDicomContext.saveAll(jpa);
		testDicomTypeContext.saveAll(jpa);
        		
        return;
    }
	
    private void _restoreContext() throws OHException 
    {
		testFileDicomContext.deleteNews(jpa);
		testDicomTypeContext.deleteNews(jpa);
        
        return;
    }
        
	private long _setupTestFileDicom(
			boolean usingSet) throws OHException 
	{
		FileDicom dicom;
		DicomType dicomType;
		
		dicomType = testDicomType.setup(true);
		
    	jpa.beginTransaction();	
    	dicom = testFileDicom.setup(dicomType, usingSet);
    	jpa.persist(dicomType);
		jpa.persist(dicom);
    	jpa.commitTransaction();
    	
		return dicom.getIdFile();
	}
		
	private void  _checkFileDicomIntoDb(
			long code) throws OHException 
	{
		FileDicom foundFileDicom;
		

		foundFileDicom = (FileDicom)jpa.find(FileDicom.class, code); 
		testFileDicom.check(foundFileDicom);
		
		return;
	}	
}