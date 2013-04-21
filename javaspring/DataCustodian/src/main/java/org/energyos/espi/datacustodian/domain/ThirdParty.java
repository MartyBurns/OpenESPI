/*******************************************************************************
 * Copyright (c) 2011, 2012, 2013EnergyOS.Org
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
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Version;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlID;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import org.energyos.espi.datacustodian.common.ApplicationInformation;
import org.energyos.espi.datacustodian.common.AuthorizationStatus;
import org.energyos.espi.datacustodian.common.DataCustodianApplicationStatus;
import org.energyos.espi.datacustodian.common.ServiceStatus;
import org.energyos.espi.datacustodian.common.ThirdPartyApplicationType;
import org.energyos.espi.datacustodian.common.ThirdPartyApplicationUse;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@Entity
@RooJavaBean
@RooToString
@RooJpaActiveRecord

@XmlRootElement(name="ThirdParty")
@XmlAccessorType(XmlAccessType.FIELD)

public class ThirdParty {

    @Size(min = 3, max = 30)
    @XmlElement(name="name")
    private String name;

    @Size(max = 512)
    @XmlElement(name="description")
    private String description;

    @NotNull
    @Column(columnDefinition = "BIT")   // needed because of open hibernate bug 
    @XmlElement(name="authorized")
    private Boolean authorized;

    @OneToOne
    @XmlTransient
    private DataCustodian authorizedDataCustodian;

    @NotNull
    @ManyToMany(cascade = CascadeType.ALL)
    @XmlElementWrapper(name="retailCustomers")
    @XmlElement(name="RetailCustomer")
    private Set<RetailCustomer> retailCustomers = new HashSet<RetailCustomer>();

    @ManyToOne
    @XmlElement(name="applicationInformation")
    private ApplicationInformation applicationInformation;

    @ManyToOne
    @XmlElement(name="dataCustodianApplicationStatus")
    private DataCustodianApplicationStatus dataCustodianApplicationStatus;

    @NotNull
    @ManyToMany(cascade = CascadeType.ALL)
    @XmlElementWrapper(name="applicationTypes")
    @XmlElement(name="ThirdPartyApplicationType")
    private Set<ThirdPartyApplicationType> applicationTypes = new HashSet<ThirdPartyApplicationType>();

    @ManyToMany(cascade = CascadeType.ALL)
    @XmlElementWrapper(name="authorizationStatus")
    @XmlElement(name="AuthorizationStatus")
    private Set<AuthorizationStatus> authorizationStatus = new HashSet<AuthorizationStatus>();

    @ManyToOne
    @XmlElement(name="applicationUse")
    private ThirdPartyApplicationUse applicationUse;

    @ManyToOne
    @XmlElement(name="serviceStatus")
    private ServiceStatus serviceStatus;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

	@Version
    @Column(name = "version")
    private Integer version;

	public Long getId() {
        return this.id;
    }

	public void setId(Long id) {
        this.id = id;
    }

	public Integer getVersion() {
        return this.version;
    }

	public void setVersion(Integer version) {
        this.version = version;
    }
}
