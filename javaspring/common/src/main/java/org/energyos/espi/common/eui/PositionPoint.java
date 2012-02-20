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
 * Set of spatial coordinates that determine a point, defined in coordinate system
 * specified in 'Location.CoordinateSystem', or "WGS 84" if not specified
 * otherwise. Use a single position point instance to desribe a point-oriented
 * location. Use a sequence of position points to describe a line-oriented object
 * (physical location of non-point oriented objects like cables or lines), or area
 * of an object (like a substation or a geographical zone - in this case, have
 * first and last position point with the same values).
 * @author svanausdall
 * @version 1.0
 * @updated 22-Aug-2011 9:39:23 AM
 */
public class PositionPoint {

	/**
	 * X axis position.
	 */
	public String xPosition;
	/**
	 * Y axis position.
	 */
	public String yPosition;
	/**
	 * (if applicable) Z axis position.
	 */
	public String zPosition;

	public PositionPoint(){

	}

	public void finalize() throws Throwable {

	}
}//end PositionPoint