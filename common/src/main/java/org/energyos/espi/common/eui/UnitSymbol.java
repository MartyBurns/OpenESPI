/*******************************************************************************
 * Copyright (c) 2011, 2012 EnergyOS.Org
 *
 * Licensed by EnergyOS.Org under one or more contributor license agreements.
 * See the NOTICE file distributed with this work for additional information
 * regarding copyright ownership.  The EnergyOS.org licenses this file
 * to you under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License.  You may obtain a copy
 * of the License at:
 *  
 *   http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 *  
 *******************************************************************************/

 

package org.energyos.espi.common.eui;



/**
 * The units defined for usage in the CIM
 * @author svanausdall
 * @version 1.0
 * @updated 22-Aug-2011 9:39:26 AM
 */
public enum UnitSymbol {
	/**
	 * Apparent power in volt ampere
	 */
	VA,
	/**
	 * Active power in watt
	 */
	W,
	/**
	 * Reactive power in volt ampere reactive
	 */
	VAr,
	/**
	 * Apparent energy in volt ampere hours
	 */
	VAh,
	/**
	 * Real energy in what hours
	 */
	Wh,
	/**
	 * Reactive energy in volt ampere reactive hours
	 */
	VArh,
	/**
	 * Voltage in volt
	 */
	V,
	/**
	 * Resistance in ohm
	 */
	ohm,
	/**
	 * Current in ampere
	 */
	A,
	/**
	 * Capacitance in farad
	 */
	F,
	/**
	 * Inductance in henry
	 */
	H,
	/**
	 * Relative temperature in degrees Celsius. In the SI unit system the symbol is C.
	 * Electric charge is measured in coulomb that has the unit symbol C. To
	 * destinguish degree Celsius form coulomb the symbol used in the UML is degC.
	 * Reason for not using C is the special character is difficult to manage in
	 * software.
	 */
	degC,
	/**
	 * Time in seconds
	 */
	s,
	/**
	 * Time in minutes
	 */
	min,
	/**
	 * Time in hours
	 */
	h,
	/**
	 * Plane angle in degrees
	 */
	deg,
	/**
	 * Plane angle in radians
	 */
	rad,
	/**
	 * Energy in joule
	 */
	J,
	/**
	 * Force in newton
	 */
	N,
	/**
	 * Conductance in siemens
	 */
	S,
	/**
	 * Dimension less quantity, e.g. count, per unit, etc.
	 */
	none,
	/**
	 * Frequency in hertz
	 */
	Hz,
	/**
	 * Mass in gram
	 */
	g,
	/**
	 * Pressure in pascal (n/m2)
	 */
	Pa,
	/**
	 * Length in meter
	 */
	m,
	/**
	 * Area in square meters
	 */
	m2,
	/**
	 * Volume in cubic meters
	 */
	m3,
	/**
	 * Energy, in therms
	 */
	thm,
	/**
	 * Volumetric flow, in cubic meters per hour
	 */
	m3perh,
	/**
	 * Volumetric flow, in cubic feet per hour
	 */
	ft3perh
}