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


package org.energyos.espi.datacustodian.common;

import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.HexBinaryAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import org.energyos.espi.datacustodian.domain.Address;
import org.energyos.espi.datacustodian.domain.DataCustodian;
import org.energyos.espi.datacustodian.domain.Location;
import org.energyos.espi.datacustodian.domain.RetailCustomer;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;


/**
 * Logical point on a network at which consumption or production is either physically measured (e.g., metered) or estimated (e.g., unmetered street lights).
 * 
 * <p>Java class for UsagePoint complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="UsagePoint">
 *   &lt;complexContent>
 *     &lt;extension base="{http://naesb.org/espi}IdentifiedObject">
 *       &lt;sequence>
 *         &lt;element name="roleFlags" type="{http://naesb.org/espi}HexBinary16" minOccurs="0"/>
 *         &lt;element name="ServiceCategory" type="{http://naesb.org/espi}ServiceCategory" minOccurs="0"/>
 *         &lt;element name="status" type="{http://naesb.org/espi}UInt8" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/extension>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */

@RooJavaBean
@RooToString
@RooJpaActiveRecord

@XmlAccessorType(XmlAccessType.NONE)
@XmlType(name = "UsagePoint", propOrder = {
    "roleFlags",
    "serviceCategory",
    "status"
})

public class UsagePoint extends IdentifiedObject {

    @XmlElement(type = String.class)
    //@XmlJavaTypeAdapter(HexBinaryAdapter.class)
    private Short roleFlags;

    @ManyToOne
    @XmlElement(name = "ServiceCategory")
    private ServiceCategory serviceCategory;

    @XmlElement
    private Byte status;

    @ManyToOne
    private Address address;

    @ManyToOne
    private Location location;

    @OneToOne
    private RetailCustomer retailCustomer;

    @OneToOne
    private DataCustodian dataCustodian;
}
