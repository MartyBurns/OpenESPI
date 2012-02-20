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
 * The unit multipliers defined for the CIM
 * @author svanausdall
 * @version 1.0
 * @updated 22-Aug-2011 9:39:26 AM
 */
public enum UnitMultiplier {
	/**
	 * Pico 10**-12
	 */
	p,
	/**
	 * Nano 10**-9
	 */
	n,
	/**
	 * Micro 10**-6
	 */
	micro,
	/**
	 * Milli 10**-3
	 */
	m,
	/**
	 * Centi 10**-2
	 */
	c,
	/**
	 * Deci 10**-1
	 */
	d,
	/**
	 * Kilo 10**3
	 */
	k,
	/**
	 * Mega 10**6
	 */
	M,
	/**
	 * Giga 10**9
	 */
	G,
	/**
	 * Tera 10**12
	 */
	T,
	none
}