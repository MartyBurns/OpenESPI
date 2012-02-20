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
 * Type of data conveyed by a specific Reading.
 * @author svanausdall
 * @version 1.0
 * @updated 22-Aug-2011 9:39:24 AM
 */
public class ReadingType {

	/**
	 * Characteristics of a data value conveyed by a specific Reading, which allow an
	 * application to understand how a specific Reading is to be interpreted.
	 */
	public QualityOfReading defaultQuality;
	/**
	 * Specifies the direction of flow of the measurement.
	 */
	public ReadingDirection direction;
	/**
	 * (if incremental reading value) Length of increment interval.
	 */
	public Duration intervalLength;
	/**
!	 * Kind of reading.
	 */
	public ReadingKind kind;
	/**
	 * Multiplier for 'unit'.
	 */
	public UnitMultiplier multiplier;
	/**
	 * The name is any free human readable and possibly non unique text naming the
	 * object.
	 */
	public String name;
	/**
	 * Unit for the reading value.
	 */
	public UnitSymbol unit;

	public ReadingType(){

	}

	public void finalize() throws Throwable {

	}
}//end ReadingType