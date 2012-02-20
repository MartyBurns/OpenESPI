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
 * AssetContainer that performs one or more end device functions. One type of
 * EndDeviceAsset is a MeterAsset which can perform metering, load management,
 * connect/disconnect, accounting functions, etc. Some EndDeviceAssets, such as
 * ones monitoring and controlling air conditioner, refrigerator, pool pumps may
 * be connected to a MeterAsset. All EndDeviceAssets may have communication
 * capability defined by the associated ComFunction(s). An EndDeviceAsset may be
 * owned by a consumer, a service provider, utility or otherwise.
 * There may be a related end device function that identifies a sensor or control
 * point within a metering application or communications systems (e.g., water, gas,
 * electricity).
 * Some devices may use an optical port that conforms to the ANSI C12.18 standard
 * for communications.
 * @author svanausdall
 * @version 1.0
 * @updated 22-Aug-2011 9:39:21 AM
 */
public class EndDeviceAsset {

	/**
	 * The name is any free human readable and possibly non unique text naming the
	 * object.
	 */
	public String name;

	public EndDeviceAsset(){

	}

	public void finalize() throws Throwable {

	}
}//end EndDeviceAsset