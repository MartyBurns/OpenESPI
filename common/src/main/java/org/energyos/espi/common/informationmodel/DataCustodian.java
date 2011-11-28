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
 * The DataCustodian service interface contains methods to be called by Authorized
 * Third Party in order to authorize and receive EUI.
 * @author Marty
 * @version 1.0
 * @created 22-Aug-2011 9:48:00 AM
 */
public interface DataCustodian {

	/**
	 * Allows Data Custodian to obtain agreement to terms of service, contact
	 * information and application details about a Authorized Third Party application.
	 * Provides Authorized Third Party with service key and consumer secret.
	 * 
	 * @param ApplicationInformation
	 */
	public ThirdPartyId _CreateThirdPartyId(ApplicationInformation ApplicationInformation);

	/**
	 * Allows Retail Customer to choose an existing Authorization. Is not standardized,
	 * since the method involves user input.
	 * 
	 * @param customerID
	 */
	public AuthorizationList _ReadAuthorizationList(RetailCustomerId customerID);

	/**
	 * Provides ability to update an existing Authorization.
	 * 
	 * @param authorization
	 */
	public boolean _UpdateAuthorization(Authorization authorization);

	/**
	 * Provides ability for Retail Customer to authenticate and verify desire to
	 * authorize an Authorized Third Party request token. This results in a verifier
	 * to be used with CreateAccessToken.
	 * 
	 * @param authorization
	 */
	public Authorization Authorize(Authorization authorization);

	/**
	 * Allows Authorized Third Party to exchange an authorized request token for an
	 * access token.
	 * 
	 * @param authRequest
	 */
	public AccessToken CreateAccessToken(Authorization authRequest);

	/**
	 * Allows Authorized Third Party to request an unauthorized request token.
	 * 
	 * @param authRequest
	 */
	public Token CreateRequestToken(Authorization authRequest);

	/**
	 * Allows an Authorized Third Party to request ongoing updates to the EUI
	 * associated with the specified Authorization, to be delivered asynchronously.
	 * 
	 * @param authorization
	 */
	public boolean CreateSubscription(Authorization authorization);

	/**
	 * Removes the EUI associated with the specified Authorization from the
	 * subscriptions.
	 * 
	 * @param authorization
	 */
	public boolean DeleteSubscription(Authorization authorization);

	/**
	 * Allows Authorized Third Party request ("pull") of asynchronously requested and
	 * subscribed data.
	 * 
	 * @param batch
	 */
	public Batch ReadData(BatchLocation batch);

	/**
	 * Allows "on demand" (synchronous) access to authorized EUI. Some Data Custodians
	 * may choose not to make this method available.
	 * 
	 * @param authorization
	 * @param requestedInterval
	 */
	public DataResource ReadData_(Authorization authorization, DateTimeInterval requestedInterval);

	/**
	 * Allows Authorized Third Parties to check their ability to access the Data
	 * Custodian service, and its current status.
	 */
	public ServiceStatus ReadServiceStatus();

	/**
	 * Allows Third Parties to request initial transfer of existing authorized EUI, or
	 * re-transfer of same. Results are delivered asynchronously.
	 * 
	 * @param authorization
	 */
	public boolean RequestData(Authorization authorization);

}