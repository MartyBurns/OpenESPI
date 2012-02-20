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
 * Logical point on a network at which consumption or production is either
 * physically measured (e.g. metered) or estimated (e.g. unmetered street lights).
 * @author svanausdall
 * @version 1.0
 * @updated 22-Aug-2011 9:39:27 AM
 */
public class UsagePoint {

	/**
	 * A human readable description of the object. 
	 */
	public String description;
	/**
	 * The name is any free human readable and possibly non unique text naming the
	 * object.
	 */
	public String name;
	public UsageSummary UsageSummaries;
	public ServiceDeliveryPoint ServiceDeliveryPoints;
	public PositionPoint PositionPoint;
	public MeterReading MeterReadings;
	/**
	 * All end device assets at this usage point.
	 */
	public EndDeviceAsset EndDeviceAssets;
	public ElectricPowerQualitySummary ElectricPowerQualitySummaries;
	public Customer Customer;

	public UsagePoint(){

	}

	public void finalize() throws Throwable {

	}
}//end UsagePoint