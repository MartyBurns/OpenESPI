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


/**
 * Contains information about a Third Party Application requesting access to the DataCustodian services. Information requested may include items such as Organization Name, Website, Contact Info, Application Name, Description, Icon, Type, default Notification and Callback endpoints, and may also include agreement with terms of service.
 * 
 * <p>Java class for ApplicationInformation complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ApplicationInformation">
 *   &lt;complexContent>
 *     &lt;extension base="{http://naesb.org/espi}IdentifiedObject">
 *       &lt;sequence>
 *         &lt;element name="dataCustodianApplicationStatus" type="{http://naesb.org/espi}DataCustodianApplicationStatus" minOccurs="0"/>
 *         &lt;element name="dataCustodianDefaultBatchResource" type="{http://www.w3.org/2001/XMLSchema}anyURI" minOccurs="0"/>
 *         &lt;element name="dataCustodianDefaultSubscriptionResource" type="{http://www.w3.org/2001/XMLSchema}anyURI" minOccurs="0"/>
 *         &lt;element name="dataCustodianThirdPartyId" type="{http://naesb.org/espi}String32" minOccurs="0"/>
 *         &lt;element name="dataCustodianThirdPartySecret" type="{http://naesb.org/espi}String32" minOccurs="0"/>
 *         &lt;element name="thirdPartyApplicationDescription" type="{http://naesb.org/espi}String256" minOccurs="0"/>
 *         &lt;element name="thirdPartyApplicationLogo" type="{http://www.w3.org/2001/XMLSchema}anyURI" minOccurs="0"/>
 *         &lt;element name="thirdPartyApplicationName" type="{http://naesb.org/espi}String32" minOccurs="0"/>
 *         &lt;element name="thirdPartyApplicationStatus" type="{http://naesb.org/espi}ThirdPartyApplicatonStatus" minOccurs="0"/>
 *         &lt;element name="thirdPartyApplicationType" type="{http://naesb.org/espi}ThirdPartyApplicationType" minOccurs="0"/>
 *         &lt;element name="thirdPartyApplicationUse" type="{http://naesb.org/espi}ThirdPartyApplicationUse" minOccurs="0"/>
 *         &lt;element name="thirdPartyApplicationWebsite" type="{http://www.w3.org/2001/XMLSchema}anyURI" minOccurs="0"/>
 *         &lt;element name="thirdPartyDefaultBatchResource" type="{http://www.w3.org/2001/XMLSchema}anyURI" minOccurs="0"/>
 *         &lt;element name="thirdPartyDefaultNotifyResource" type="{http://www.w3.org/2001/XMLSchema}anyURI" minOccurs="0"/>
 *         &lt;element name="thirdPartyDefaultOAuthCallback" type="{http://www.w3.org/2001/XMLSchema}anyURI" minOccurs="0"/>
 *         &lt;element name="thirdPartyEmail" type="{http://naesb.org/espi}String64" minOccurs="0"/>
 *         &lt;element name="thirdPartyName" type="{http://naesb.org/espi}String64" minOccurs="0"/>
 *         &lt;element name="thirdPartyPhone" type="{http://naesb.org/espi}String32" minOccurs="0"/>
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
@XmlType(name = "ApplicationInformation", propOrder = {
    "dataCustodianApplicationStatus",
    "dataCustodianDefaultBatchResource",
    "dataCustodianDefaultSubscriptionResource",
    "dataCustodianThirdPartyId",
    "dataCustodianThirdPartySecret",
    "thirdPartyApplicationDescription",
    "thirdPartyApplicationLogo",
    "thirdPartyApplicationName",
    "thirdPartyApplicationStatus",
    "thirdPartyApplicationType",
    "thirdPartyApplicationUse",
    "thirdPartyApplicationWebsite",
    "thirdPartyDefaultBatchResource",
    "thirdPartyDefaultNotifyResource",
    "thirdPartyDefaultOAuthCallback",
    "thirdPartyEmail",
    "thirdPartyName",
    "thirdPartyPhone"
})
public class ApplicationInformation extends IdentifiedObject {

    @ManyToOne
    @XmlElement
    private DataCustodianApplicationStatus dataCustodianApplicationStatus;

    @XmlSchemaType(name = "anyURI")
    @XmlElement
    private URI dataCustodianDefaultBatchResource;

    @XmlSchemaType(name = "anyURI")
    @XmlElement
    private URI dataCustodianDefaultSubscriptionResource;

    @Size(min = 32, max = 32)
    @XmlElement
    private String dataCustodianThirdPartyId;

    @Size(min = 32, max = 32)
    @XmlElement
    private String dataCustodianThirdPartySecret;

    @XmlElement
    private String thirdPartyApplicationDescription;

    @XmlSchemaType(name = "anyURI")
    @XmlElement
    private URI thirdPartyApplicationLogo;

    @Size(min = 32, max = 32)
    @XmlElement
    private String thirdPartyApplicationName;

    @ManyToOne
    @XmlElement
    private ThirdPartyApplicationStatus thirdPartyApplicationStatus;

    @ManyToOne
    @XmlElement
    private ThirdPartyApplicationType thirdPartyApplicationType;

    @ManyToOne
    @XmlElement
    private ThirdPartyApplicationUse thirdPartyApplicationUse;

    @XmlSchemaType(name = "anyURI")
    @XmlElement
    private URI thirdPartyApplicationWebsite;

    @XmlSchemaType(name = "anyURI")
    @XmlElement
    private URI thirdPartyDefaultBatchResource;

    @XmlSchemaType(name = "anyURI")
    @XmlElement
    private URI thirdPartyDefaultNotifyResource;

    @XmlSchemaType(name = "anyURI")
    @XmlElement
    private URI thirdPartyDefaultOAuthCallback;

    @Size(max = 64)
    @XmlElement
    private String thirdPartyEmail;

    @Size(max = 64)
    @XmlElement
    private String thirdPartyName;

    @Size(max = 32)
    @XmlElement
    private String thirdPartyPhone;
}
