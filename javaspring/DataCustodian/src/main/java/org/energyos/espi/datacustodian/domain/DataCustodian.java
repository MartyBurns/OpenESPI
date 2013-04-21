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



package org.energyos.espi.datacustodian.domain;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

import org.energyos.espi.datacustodian.common.ApplicationInformation;
import org.energyos.espi.datacustodian.common.Authorization;
import org.energyos.espi.datacustodian.common.DataCustodianApplicationStatus;
import org.energyos.espi.datacustodian.common.DataCustodianType;
import org.energyos.espi.datacustodian.common.DateTimeInterval;
import org.energyos.espi.datacustodian.common.ServiceStatus;
import org.energyos.espi.datacustodian.common.Resource;
import org.energyos.espi.datacustodian.common.ServiceStatus;
import org.energyos.espi.datacustodian.common._AccessToken;
import org.energyos.espi.datacustodian.common._Token;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.energyos.espi.datacustodian.common.IdentifiedObject;

@RooJavaBean
@RooToString
@RooJpaActiveRecord


@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "DataCustodian", propOrder = {
		"id",
		"version",
    "mRID",
    "name",
    "description",
    "serviceType",
    "retailCustomers",
    "applicationInformation",
    "authorizedThirdPartys",
    "dataCustodianApplicationStatus",
    "serviceStatus"
})

public class DataCustodian  implements org.energyos.espi.datacustodian.common.DataCustodian {

    @Size(min = 4, max = 4)
    @XmlElement
    static public String mRID; 

    @Size(min = 3, max = 30)
    @XmlElement
    private String name;

    @Size(max = 512)
    @XmlElement
    private String description;

    @ManyToOne
    @XmlElement
    private DataCustodianType serviceType;

    @ManyToMany(cascade = CascadeType.ALL)
    @XmlElementWrapper(name="authorizedThirdPartys")
    @XmlElement(name="ThirdParty")
    private Set<ThirdParty> authorizedThirdPartys = new HashSet<ThirdParty>();

    @ManyToMany(cascade = CascadeType.ALL)
    @XmlElementWrapper(name="retailCustomers")
    @XmlElement(name="RetailCustomer")
    private Set<RetailCustomer> retailCustomers = new HashSet<RetailCustomer>();

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<ApplicationInformation> applicationInformation = new HashSet<ApplicationInformation>();

    @ManyToOne
    @XmlElement
    private DataCustodianApplicationStatus dataCustodianApplicationStatus;

    @ManyToOne
    @XmlElement
    private ServiceStatus serviceStatus;

    // to retrieve and ESPI Visible object via it's UUID
    //
    public IdentifiedObject getResource(String uuid) {
	// TODO find the ESPI visible resources managed by this data custodian
	//	return IdentifiedObject.findIdentifiedObject(uuid);
	return null;
    }

    /**
     * to create a (DataCustodian) unique ThirdPartyId
     *     * Provides Authorized Third Party with service key and consumer secret.
     * 
     * @param ApplicationInformation
     */

    public Boolean createThirdPartyId (ApplicationInformation applicationInformation) {
	// TODO verify constructor of DataCustodian unique ThirdPartyId
	String result = "";
	// get the host unique component
	// String result = DataCustodian.getMiid()
        // append the instance unique componenet
	//    result += this.dcid;
	// and append the 
	result +=  ":0123456789ABCDE";
	// set the ThirdPartyId
	applicationInformation.setDataCustodianThirdPartyId (result);
	return true;
    }

    // "Official" ESPI interfaces that must be supported.
    // These are called from appropriate DataCustodianController methods
    //

    /**
     * Allows Data Custodian to obtain agreement to terms of service, contact
     * information and application details about a Authorized Third Party application.
     * Provides Authorized Third Party with service key and consumer secret.
     * 
     * @param ApplicationInformation
     */
    @Override
    public String _CreateThirdPartyId(ApplicationInformation applicationInformation) {
	// TODO to be subsumed by OAuth Security Integration
	// TODO if this is exposed beyond the OAuth package, we will assume the unmarshalling happens in the caller
	// in particular, the serviceKey and consumerSecret are within OAuth scope.
	// note the implicit structure of the returned string (serviceKey + consumerSecret)
	// applicationInformation.setDataCustodianThirdPartyID = new DataCustodianThirdPartyId;
	
	//	this.createThirdPartyId(applicationInformation);
	//	return applicationInformation.getDataCustodianThirdPartyId();
	return "";
    }

    @Override
    public List<Authorization> _ReadAuthorizationList(String customerID) {
        // TODO validate that customerID is indeed the retailCustomer.Id                                                                                                                                                                       
        //                                                                                                                                                                                                                                     
	/*
        List <Authorization> authorizations = Authorization.findAllAuthorizations();
        List <Authorization> results;
        for (Authorization auth : authorizations ) {
            for (RetailCustomer customer : auth.getRetailCustomers() ) {
                if (customerID.equals(customer.getId().toString())) {
		    results.add(auth);
                }
            }
        }
        return results;
	*/
	return null;
    }
    
    /**
     * Provides ability to update an existing Authorization.
     * 
     * @param authorization
     */
    @Override
    public boolean _UpdateAuthorization(Authorization authorization) {
	// TODO at this point, we assume the update has been unmarshalled into the authorization already. 
	// So there is nothing to do here:
	// POST /authorization/{uuid}/

	return true;
    }

    /**
     * Provides ability for Retail Customer to authenticate and verify desire to
     * authorize an Authorized Third Party request token. This results in a verifier
     * to be used with CreateAccessToken.
     * 
     * @param authorization
     */
    @Override
    public Authorization Authorize(Authorization authorization) {
	// TODO Verify that OAuth infrastructure subsumes this function
        // TODO possibly use this as a hook to set the serviceKey and consumerSecret
        // so it will be available through the CreateThirdPartyId interface
        //
	return null;
    }

    /**
     * Allows Authorized Third Party to exchange an authorized request token for an
     * access token.
     * 
     * @param authRequest
     */
    @Override
    public _AccessToken CreateAccessToken(Authorization authRequest) {
	// TODO Auto-generated method stub
	// Likely it is fully subsumed by the OAuth infrastructure
	return null;
	}

    /**
     * Allows Authorized Third Party to request an unauthorized request token.
     * 
     * @param authRequest
     */
    @Override
    public _Token CreateRequestToken(Authorization authRequest) {
	// TODO Auto-generated method stub
	// Likely it is fully subsumed by the OAuth infrastructure
	return null;
    }

    /**
     * Allows an Authorized Third Party to request ongoing updates to the EUI
     * associated with the specified Authorization, to be delivered asynchronously.
     * 
     * @param authorization
     */
    @Override
    public boolean CreateSubscription(Authorization authorization) {
	// create a new subscription based upon this authorization.
	// TODO hook into the scheduling and message queues
	return false;
    }

    /**
     * Removes the EUI associated with the specified Authorization from the
     * subscriptions.
     * 
     * @param authorization
     */
    @Override
    public boolean DeleteSubscription(Authorization authorization) {
	// TODO Auto-generated method stub
	// deconstruct the subscription associated with this authorization
	return false;
    }

    /**
     * Allows Authorized Third Party request ("pull") of asynchronously requested and
     * subscribed data.
     * 
     * @param batch
     */
    @Override
    public String ReadData(Resource batch) {
	// OAuth verification is completed prior to this entry
	// ToDo: Verify that the change from "BatchLocation" to Resource is correct for the input parameter
	// TODO return the requested object(s) for marshalling through GET
	// ToDo: Verify that the change of return value from "Batch" to String is appropriate (Assumes unMarshalling will happen within the calling object)
	// ToDo: Implement using WebTemplate construct to retrieve the Batch XML
	// note: this is really a behavior that should be provided by the controller. It knows the appropriate resource inherently from the framework dispatch.
        // note: so this just needs to add any appropriate (time) wrappers for the resource
        //
	/*
        String result = "";
	DateTimeInterval now = new DataTimeInterval ();
	URI resourceURI = batch.getHref();
	if (now.isIn(batch.getAuthorizedPeriod())) {
	    // throw an authorization exception
	    return null;
	}
	// all is well, return a starter string for the unmarshalling process
	*/

	return "";
    }

    /**
     * Allows "on demand" (synchronous) access to authorized EUI. Some Data Custodians
     * may choose not to make this method available.
     * 
     * @param authorization
     * @param requestedInterval
     */

    @Override
    public ApplicationInformation ReadData_(Authorization authorization,
					    DateTimeInterval requestedInterval) {
	// TODO This is exposed in the OpenESPI application. It allows for
        // GET operations to be undertaken on this authorization are to be valid during this time
	// 
	authorization.setAuthorizedPeriod(requestedInterval);
	authorization.setPublishedPeriod(requestedInterval);
	return new ApplicationInformation();
    }

    /**
     * Allows Authorized Third Parties to check their ability to access the Data
     * Custodian service, and its current status.
     */
    @Override
    public ServiceStatus ReadServiceStatus() {
	return this.getServiceStatus();
    }

	@Override
	public boolean RequestData(Authorization authorization) {
		// TODO Auto-generated method stub
		return false;
	}
    
}