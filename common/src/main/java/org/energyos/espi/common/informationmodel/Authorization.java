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

import org.energyos.espi.common.eui.DateTimeInterval;



/**
 * Description of an authorization. Includes the information constraining and
 * defining access to the EUI. May include additional security elements, such as
 * signature, timestamp, nonce, etc. as well as callback to allow redirection of
 * the user agent.
 * @author Marty
 * @version 1.0
 * @created 22-Aug-2011 9:50:58 AM
 */
public class Authorization {

	/**
	 * An access token that has been authorized by the user by the Data Custodian. 
	 */
	public Token accessToken;
	/**
	 * The data resource to which the authorization was granted. 
	 */
	public DataResource data;
	/**
	 * An unauthorized token, issued by Data Custodian.
	 */
	public Token requestToken;
	/**
	 * The identifier issued to the Authorized Third Party by the Data Custodian.
	 */
	public ThirdPartyId thirdPartyID;
	/**
	 * The date time interval during which this access is authorized.
	 */
	public DateTimeInterval validityInterval;

	public Authorization(ThirdPartyId id, DataResource theData){
		thirdPartyID = id;
		data = theData;
		requestToken = new AccessToken (this);
       
	}

	public Authorization(ApplicationInformation applicationInformation) {
		thirdPartyID = new ThirdPartyId();
		data = null;
		requestToken = new AccessToken (this);
	}

	public void finalize() throws Throwable {

	}

	public boolean matchCustomerId(RetailCustomerId customerID) {
		// TODO Auto-generated method stub
		return false;
	}
}//end Authorization