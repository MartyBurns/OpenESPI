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
 * The combined version denotes the versions of the subpackages that have been
 * combined into the total CIM model. This is a convenience instead of having to
 * look at each subpackage.
 * @updated 22-Aug-2011 9:39:22 AM
 */
public class NAESB_EUI_Version {

	/**
	 * @author johnt
	 *
	 */
	public final static class AbsoluteDate {

		/**
		 * @param args
		 */
		private java.lang.String theDateString;
		
		public AbsoluteDate(java.lang.String string){
			theDateString = string;
		}
		
		public java.lang.String getAbsoluteDate () {
			return theDateString;
		}
	}

	/**
	 * Form is YYYY-MM-DD for example for January 5, 2009 it is 2009-01-05.
	 */
	public static final AbsoluteDate date = new AbsoluteDate("2010-10-22");
	/**
	 * Form is naesb_eui_vXX.YY where XX is the major version and YY is the minor
	 * version.
	 */
	public static final java.lang.String version = "naesb_eui_v01.00";

	public NAESB_EUI_Version(){

	}

	public void finalize() throws Throwable {

	}
}//end NAESB_EUI_Version