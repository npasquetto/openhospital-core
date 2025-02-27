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
package org.isf.dlvrrestype.test;

import static org.assertj.core.api.Assertions.assertThat;

import org.isf.dlvrrestype.model.DeliveryResultType;
import org.isf.utils.exception.OHException;

public class TestDeliveryResultType {

	private String code = "Z";
	private String description = "TestDescription";

	public DeliveryResultType setup(boolean usingSet) throws OHException {
		DeliveryResultType deliveryResultType;

		if (usingSet) {
			deliveryResultType = new DeliveryResultType();
			setParameters(deliveryResultType);
		} else {
			// Create DeliveryResultType with all parameters 
			deliveryResultType = new DeliveryResultType(code, description);
		}

		return deliveryResultType;
	}

	public void setParameters(DeliveryResultType deliveryResultType) {
		deliveryResultType.setCode(code);
		deliveryResultType.setDescription(description);
	}

	public void check(DeliveryResultType deliveryResultType) {
		assertThat(deliveryResultType.getCode()).isEqualTo(code);
		assertThat(deliveryResultType.getDescription()).isEqualTo(description);
	}
}
