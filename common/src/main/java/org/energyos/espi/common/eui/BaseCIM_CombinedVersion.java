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

//ToDo: import EUI.NAESB_EUI_Version.AbsoluteDate;

/**
 * The combined version denotes the versions of the subpackages that have been
 * combined into the total CIM model. This is a convenience instead of having to
 * look at each subpackage.
 * @updated 22-Aug-2011 9:39:19 AM
 */
public class BaseCIM_CombinedVersion {

	/**
	 * Form is YYYY-MM-DD for example for January 5, 2009 it is 2009-01-05.
	 */
    //ToDo: public static final AbsoluteDate date = new AbsoluteDate ("2010-10-01");

	/**
	 * Form is IEC61970CIMXXvYY_IEC61968CIMXXvYY_combined where XX is the major CIM
	 * package version and the YY is the minor version, and different packages could
	 * have different major and minor versions. For example
	 * IEC61970CIM13v18_IEC61968CIM10v16_combined.  Additional packages might be added
	 * in the future.
	 */
	public static final java.lang.String version = "iec61970CIM15v06_iec61968CIM11v04_iec62325CIM00v00";

	public BaseCIM_CombinedVersion(){

	}

	public void finalize() throws Throwable {

	}
}//end BaseCIM_CombinedVersion