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
 * Quality of a specific reading value or interval reading value. Note that more
 * than one quality may be applicable to a given reading. Typically not used
 * unless problems or unusual conditions occur (i.e., quality for each reading is
 * assumed to be 'good' unless stated otherwise in associated reading quality).
 * @author svanausdall
 * @version 1.0
 * @updated 22-Aug-2011 9:39:24 AM
 */
public class ReadingQuality {

	/**
	 * Quality, to be specified if different than ReadingType.defaultQuality.
	 */
	public QualityOfReading quality;
	/**
	 * Reading value to which this quality applies.
	 */
	public Reading Reading;
	/**
	 * Interval reading value to which this quality applies.
	 */
	public IntervalReading IntervalReading;

	public ReadingQuality(){

	}

	public void finalize() throws Throwable {

	}
}//end ReadingQuality