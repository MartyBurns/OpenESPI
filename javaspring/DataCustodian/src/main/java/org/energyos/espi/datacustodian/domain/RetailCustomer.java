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

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlIDREF;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;

import org.energyos.espi.datacustodian.common.UsagePoint;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord

@XmlType(name = "RetailCustomer")
@XmlAccessorType(XmlAccessType.FIELD)

public class RetailCustomer {

    @Size(min = 3, max = 30)
    @XmlElement(name="firstName")
    private String firstName;

    @Size(min = 3, max = 30)
    @XmlElement(name="lastName")
    private String lastName;

    @Size(min = 6, max = 30)
    @XmlElement(name="email")
    private String email;

    @NotNull
    @Past
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    @XmlElement(name="customerSince")
    private Date customerSince;

    @OneToOne
    @XmlTransient
    private DataCustodian authorizedDataCustodian;

    @ManyToMany(cascade = CascadeType.ALL)
    //@XmlElementWrapper(name="thirdPartys")
    //@XmlElement(name="ThirdParty")
    @XmlTransient
    private Set<ThirdParty> thirdPartys = new HashSet<ThirdParty>();

    @ManyToMany(cascade = CascadeType.ALL)
    @XmlElementWrapper(name="usagePoints")
    @XmlElement(name="UsagePoint")
    private Set<UsagePoint> usagePoints = new HashSet<UsagePoint>();
}
