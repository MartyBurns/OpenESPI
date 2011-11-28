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

import java.util.LinkedList;

/**
 * The Authorized Third Party service interface contains methods to be called by
 * the Data Custodian.
 * @author Marty
 * @version 1.0
 * @created 22-Aug-2011 9:48:43 AM
 */


public interface ThirdParty {

	/**
	 * @author johnt
	 *
	 */
	public class DataCustodianList extends LinkedList <DataCustodian> {

		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
		/**
		 * 
		 */
		public DataCustodianList() {
			// TODO Auto-generated constructor stub
		}

	}

	/**
	 * This is a non-standardized method to allow the Retail Customer to find his Data
	 * Custodian.
	 * 
	 * @param reatilCustomerID
	 */
	public DataCustodianList _ReadDataCustodianList(RetailCustomerId reatilCustomerID);

	/**
	 * This method represents the delivery of the request to authorize an access grant.
	 * The normal flow implements this using a URL redirect, but other methods may be
	 * possible.
	 * 
	 * @param authorization
	 */
	public boolean _RequestAuthorization(Authorization authorization);

	/**
	 * This optional method can be implemented in order to avoid having to poll for
	 * new EUI. It is called by the Data Custodian to indicate that requested
	 * authorized EUI is available via ReadData.
	 * 
	 * @param batchList
	 */
	public boolean NotifyData_(BatchList batchList);

	/**
	 * This method allows for a Data Custodian to notify an Authorized Third Party
	 * when an authorization has been modified, so that timely requests to extend
	 * authorizations can be provided to Retail Customer, and so that the Authorized
	 * Third Party can differentiate between problems and lack of authorization.
	 * 
	 * @param authorization
	 */
	public boolean NotifyUpdateAuthorization_(Authorization authorization);

	/**
	 * This method represents the callback after authorization of a request token.
	 * 
	 * @param authorization
	 */
	public boolean ProvideAuthorization(Authorization authorization);

	/**
	 * This method can be implemented by the Authorized Third Party to allow
	 * asynchronous transfers to use the "push" model for delivery. If used, notify is
	 * not used, and polling is avoided.
	 * 
	 * @param data
	 */
	public boolean UpdateData_(Batch data);

}