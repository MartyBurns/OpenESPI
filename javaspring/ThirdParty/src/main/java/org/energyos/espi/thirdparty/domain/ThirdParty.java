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
 ******************************************************************************
*/

package org.energyos.espi.thirdparty.domain;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.energyos.espi.thirdparty.common.ApplicationInformation;
import org.energyos.espi.thirdparty.common.Authorization;
import org.energyos.espi.thirdparty.common.AuthorizationStatus;
/*
import org.energyos.espi.thirdparty.common.Batch;
import org.energyos.espi.thirdparty.common.BatchList;
import org.energyos.espi.thirdparty.common.DataCustodianList;
import org.energyos.espi.thirdparty.common.RetailCustomerID;
*/
//import org.energyos.espi.thirdparty.common.DataCustodian;
import org.energyos.espi.thirdparty.domain.RetailCustomer;
import org.energyos.espi.thirdparty.common.DataCustodianApplicationStatus;
import org.energyos.espi.thirdparty.common.ServiceStatus;
import org.energyos.espi.thirdparty.common.IntervalBlock;
import org.energyos.espi.thirdparty.common.ThirdPartyApplicationType;
import org.energyos.espi.thirdparty.common.ThirdPartyApplicationUse;
import org.energyos.espi.thirdparty.common.IdentifiedObject;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
    public class ThirdParty implements org.energyos.espi.thirdparty.common.ThirdParty {

    @Size(min = 3, max = 30)
	private String name;

    @Size(max = 512)
	private String description;

    @NotNull
	private Boolean authorized;

    @OneToOne
	private DataCustodian authorizedDataCustodian;

    @NotNull
	@ManyToMany(cascade = CascadeType.ALL)
	private Set<RetailCustomer> retailCustomers = new HashSet<RetailCustomer>();

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<ApplicationInformation> applicationInformation = new HashSet<ApplicationInformation>();

    @ManyToOne
	private DataCustodianApplicationStatus dataCustodianApplicationStatus;

    @NotNull
	@ManyToMany(cascade = CascadeType.ALL)
	private Set<ThirdPartyApplicationType> applicationTypes = new HashSet<ThirdPartyApplicationType>();

    @ManyToMany(cascade = CascadeType.ALL)
	private Set<AuthorizationStatus> authorizationStatus = new HashSet<AuthorizationStatus>();

    @ManyToOne
	private ThirdPartyApplicationUse applicationUse;

    @ManyToOne
	private ServiceStatus serviceStatus;

    // to retrieve and ESPI Visible object via it's UUID
    //
    public IdentifiedObject getResource(String uuid) {
	// TODO find the ESPI visible resources managed by this data custodian
	return IdentifiedObject.findIdentifiedObject(uuid);
    }

    // "Official" ESPI interfaces that must be supported.
    // These are called from appropriate DataCustodianController methods

    /**
     * This is a non-standardized method to allow the Retail Customer to find his Data
     * Custodian.
     * 
     * @param reatilCustomerID
     */
    @Override
    public List <DataCustodian>_ReadDataCustodianList(String retailCustomerID) {
	// The list retrieved from GET http://localhost:8080/thirdparty/{id}/datacustodians
	//
	/*
	List <DataCustodian> dataCustodians = DataCustodian.findAllDataCustodians();
	List <DataCustodian> results = new List <DataCustodian>;
	
	for (DataCustodian dc : dataCustodians ) {
	    for (RetailCustomer customer : dc.getRetailCustomers() ) {
		if (retailCustomerID.equals(customer.getId().toString())) {
		    results.add(dc);
		}
	    }
	}
	return results;
	*/
	return null;
    }

    /**
     * This method represents the delivery of the request to authorize an access grant.
     * The normal flow implements this using a URL redirect, but other methods may be
     * possible.
     * 
     * @param authorization
     */
    @Override
	public boolean _RequestAuthorization(Authorization authorization) {
	// TODO Needs hooked into the OAuth infrastructure as the first entry point of the request process
	// this is handled by the OAuth controller. the authorization, as much as possible, will be intitialized 
	// when it gets here.
	// 
	//authorization.setAuthorizationStatus(AuthorizationStatus.findAuthorizationStatus(Active));
	return true;
    }

    /**
     * This method represents the callback after authorization of a request token.
     * 
     * @param authorization
     */
    @Override
	public boolean ProvideAuthorization(Authorization authorization) {
	// TODO This represents the call-back of the OAuth request process (OAuth infrastructure)
	// there is really nothing to do here. The authorization has already been created. If we allow
	// the constructure to default everything  orrectly, then it will be completely populated when it gets here
        // look for the real work to be done in the OAuth controllers.
	//authorization.setAuthorizationStatus(AuthorizationStatus.findAuthorizationStatus(Active));
	return true;
    }

    /**
     * This method allows for a Data Custodian to notify an Authorized Third Party
     * when an authorization has been modified, so that timely requests to extend
     * authorizations can be provided to Retail Customer, and so that the Authorized
     * Third Party can differentiate between problems and lack of authorization.
     * 
     * @param authorization
     */
    @Override
	public boolean NotifyUpdateAuthorization_(Authorization authorization) {
	// TODO used to notify the thirdParty that an authorization is about to expire
	// needs integration with OAuth infrastructure
        // this needs coorelated with the local timeToLive of the Authorization
	/*
	DateTimeInterval now = new DateTimeInterval();
	if (now > authorization.getPublishedPeriod()) {
	    if (now > authorization.getAuthorizedPeriod()) {
		authorization.setPublishedPeriod(now);
		authorization.setAuthorizationPeriod(now);
		return true;
	    }
	}
	*/
	return false;
    }

    /**
     * This optional method can be implemented in order to avoid having to poll for
     * new EUI. It is called by the Data Custodian to indicate that requested
     * authorized EUI is available via ReadData.
     * 
     * @param batchList
     */
    @Override
	public boolean NotifyData_(List batchList) {
	// TODO notice of availability of authorized EUI - cycle the batchList through readData
	// update the resource and enque a request to grab the list asynchronously
	return true;
    }

    /**
     * This method can be implemented by the Authorized Third Party to allow
     * asynchronous transfers to use the "push" model for delivery. If used, notify is
     * not used, and polling is avoided.
     * 
     * @param data
     */
    @Override
	public boolean UpdateData_(IntervalBlock data) {
	// TODO update EUI based upon push from the DataCustodian; mapped to POST of the uuid POST and PUT to the uuid
	// TODO unmarshall the data and stash it.
        // return true;
	return true;
    }

}
