/*
 * Open Hospital (www.open-hospital.org)
 * Copyright © 2006-2020 Informatici Senza Frontiere (info@informaticisenzafrontiere.org)
 *
 * Open Hospital is a free and open source software for healthcare data management.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * https://www.gnu.org/licenses/gpl-3.0-standalone.html
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */
package org.isf.patient;

import org.isf.patient.model.PatientMergedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class TestPatientMergedEventListener {

	private PatientMergedEvent patientMergedEvent;

	private boolean shouldFail;

	@EventListener
	public void handle(PatientMergedEvent patientMergedEvent) {
		this.patientMergedEvent = patientMergedEvent;
		if (shouldFail) {
			throw new RuntimeException("failure testing");
		}
	}

	public PatientMergedEvent getPatientMergedEvent() {
		return patientMergedEvent;
	}

	public void setShouldFail(boolean shouldFail) {
		this.shouldFail = shouldFail;
	}

}
