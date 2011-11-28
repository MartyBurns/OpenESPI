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

 

package org.energyos.espi.common.informationmodel;

/**
 * Includes (non-standardized) information about the Authorized Third Party
 * Application requesting access to the DataCustodian services. Information
 * requested may include items such as Organization Name, Website, Contact Info,
 * Application Name, Description, Icon, Type, default Notification and Callback
 * endpoints, and may also include agreement with terms of service.
 * @author svanausdall
 * @version 1.0
 * @created 22-Aug-2011 9:50:47 AM
 */
public class ApplicationInformation {

	private nonStandardApplicationInformation information;
	
	public ApplicationInformation(nonStandardApplicationInformation theInformation){
      information = theInformation;
	}

	public nonStandardApplicationInformation getInformation() {
		return information;
	}


	public void finalize() throws Throwable {

	}
}//end ApplicationInformation