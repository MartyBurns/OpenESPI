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

/*
 *  * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Authorization">
 *   &lt;complexContent>
 *     &lt;extension base="{http://naesb.org/espi}IdentifiedObject">
 *       &lt;sequence>
 *         &lt;element name="accessToken" type="{http://naesb.org/espi}String32" minOccurs="0"/>
 *         &lt;element name="authorizationServer" type="{http://www.w3.org/2001/XMLSchema}anyURI" minOccurs="0"/>
 *         &lt;element name="authorizedPeriod" type="{http://naesb.org/espi}DateTimeInterval" minOccurs="0"/>
 *         &lt;element name="publishedPeriod" type="{http://naesb.org/espi}DateTimeInterval" minOccurs="0"/>
 *         &lt;element name="resource" type="{http://www.w3.org/2001/XMLSchema}anyURI" minOccurs="0"/>
 *         &lt;element name="status" type="{http://naesb.org/espi}AuthorizationStatus" minOccurs="0"/>
 *         &lt;element name="thirdParty" type="{http://naesb.org/espi}String32" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/extension>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */

package org.energyos.espi.datacustodian.common;

import java.net.URI;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord

@XmlAccessorType(XmlAccessType.NONE)
@XmlType(name = "Authorization", propOrder = {
    "accessToken",
    "authorizationServer",
    "authorizedPeriod",
    "publishedPeriod",
    "resource",
    "status",
    "thirdParty"
})

public class Authorization extends IdentifiedObject {

    @Size(min = 32, max = 32)
    @XmlElement
    private String accessToken;
    
    @XmlSchemaType(name = "anyURI")
    @XmlElement
    private URI authorizationServer;

    @ManyToOne
    @XmlElement
    private DateTimeInterval authorizedPeriod;

    @ManyToOne
    @XmlElement
    private DateTimeInterval publishedPeriod;

    @XmlSchemaType(name = "anyURI")
    @XmlElement
    private URI resource;

    @ManyToOne
    @XmlElement
    private AuthorizationStatus status;

    @Size(min = 32, max = 32)
    @XmlElement
    private String thirdParty;
}
