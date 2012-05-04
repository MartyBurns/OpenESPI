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

package org.energyos.espi.datacustodian.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.Size;

import org.energyos.espi.common.eui.DateTimeInterval;
import org.energyos.espi.common.informationmodel.*;

@RooJavaBean
@RooToString
@RooEntity
public class DataCustodian implements org.energyos.espi.common.informationmodel.DataCustodian {

    @Size(min = 3, max = 30)
    private String name;

    @Size(max = 512)
    private String description;

	@Override
	public ThirdPartyId _CreateThirdPartyId(
			ApplicationInformation ApplicationInformation) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AuthorizationList _ReadAuthorizationList(RetailCustomerId customerID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean _UpdateAuthorization(Authorization authorization) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Authorization Authorize(Authorization authorization) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AccessToken CreateAccessToken(Authorization authRequest) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Token CreateRequestToken(Authorization authRequest) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean CreateSubscription(Authorization authorization) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean DeleteSubscription(Authorization authorization) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Batch ReadData(BatchLocation batch) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DataResource ReadData_(Authorization authorization,
			DateTimeInterval requestedInterval) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ServiceStatus ReadServiceStatus() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean RequestData(Authorization authorization) {
		// TODO Auto-generated method stub
		return false;
	}
}
