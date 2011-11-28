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

import org.energyos.espi.common.atom.anyURI;
import org.energyos.espi.common.eui.Customer;

/**
 * Generalization of any data object that can be exchanged.
 * @author Marty
 * @version 1.0
 * @created 22-Aug-2011 9:52:11 AM
 */
public class DataResource {

	/**
	 * Create, Update, Delete
	 */
	public byte operation;
	private anyURI uri;                         // URI of the data resourse
	private Customer customer;                  // back pointer to the customer
	private DataCustodian dataCustodian;        // where the data resource lives
	private AuthorizationList authorizations;   // list of active authorizations
	private SubscriptionList subscriptions;     // list of active subscriptions

	public DataResource(){

	}

	public byte getOperation() {
		return operation;
	}

	public void setOperation(byte operation) {
		this.operation = operation;
	}

	public AuthorizationList getAuthorizations() {
		return authorizations;
	}

	public void setAuthorizations(AuthorizationList authorizations) {
		this.authorizations = authorizations;
	}

	public SubscriptionList getSubscriptions() {
		return subscriptions;
	}

	public void setSubscriptions(SubscriptionList subscriptions) {
		this.subscriptions = subscriptions;
	}

	public anyURI getUri() {
		return uri;
	}

	public Customer getCustomer() {
		return customer;
	}

	public DataCustodian getDataCustodian() {
		return dataCustodian;
	}

	public void finalize() throws Throwable {

	}
}//end DataResource