/*
 * Open Hospital (www.open-hospital.org)
 * Copyright © 2006-2021 Informatici Senza Frontiere (info@informaticisenzafrontiere.org)
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
package org.isf.opetype.test;

import static org.assertj.core.api.Assertions.assertThat;

import org.isf.opetype.model.OperationType;
import org.isf.utils.exception.OHException;

public class TestOperationType {

	private String code = "ZZ";
	private String description = "TestDescription";

	public OperationType setup(boolean usingSet) throws OHException {
		OperationType operationType;

		if (usingSet) {
			operationType = new OperationType();
			setParameters(operationType);
		} else {
			// Create OperationType with all parameters 
			operationType = new OperationType(code, description);
		}

		return operationType;
	}

	public void setParameters(OperationType operationType) {
		operationType.setCode(code);
		operationType.setDescription(description);
	}

	public void check(OperationType operationType) {
		assertThat(operationType.getCode()).isEqualTo(code);
		assertThat(operationType.getDescription()).isEqualTo(description);
	}
}
