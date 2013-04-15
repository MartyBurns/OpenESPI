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
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;
import org.energyos.espi.thirdparty.common.ApplicationInformation;
import org.energyos.espi.thirdparty.common.DataCustodianApplicationStatus;
import org.energyos.espi.thirdparty.common.DataCustodianType;
import org.energyos.espi.thirdparty.common.ServiceStatus;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class DataCustodian {

    @Size(min = 3, max = 30)
    private String name;

    @Size(max = 512)
    private String description;

    @ManyToOne
    private DataCustodianType serviceType;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<ThirdParty> authorizedThirdPartys = new HashSet<ThirdParty>();

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<RetailCustomer> retailCustomers = new HashSet<RetailCustomer>();

    @ManyToOne
    private ApplicationInformation applicationInformation;

    @ManyToOne
    private DataCustodianApplicationStatus dataCustodianApplicationStatus;

    @ManyToOne
    private ServiceStatus serviceStatus;

    @Size(min = 4, max = 4)
    private String mRID;
}
