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

package org.energyos.espi.thirdparty.common;

import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;

/*
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
*/
import javax.xml.bind.annotation.XmlType;
/*
import javax.xml.bind.annotation.adapters.HexBinaryAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
*/

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * Includes elements that make it possible to include multiple transactions in a single (batch) request.
 * 
 * <p>Java class for BatchItemInfo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="BatchItemInfo">
 *   &lt;complexContent>
 *     &lt;extension base="{http://naesb.org/espi}Object">
 *       &lt;sequence>
 *         &lt;element name="name" type="{http://naesb.org/espi}HexBinary16" minOccurs="0"/>
 *         &lt;element name="operation" type="{http://naesb.org/espi}CRUDOperation" minOccurs="0"/>
 *         &lt;element name="statusCode" type="{http://naesb.org/espi}StatusCode" minOccurs="0"/>
 *         &lt;element name="statusReason" type="{http://naesb.org/espi}String256" minOccurs="0"/>
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

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "BatchItemInfo", propOrder = {
    "name",
    "operation",
    "statusCode",
    "statusReason"
})

public class BatchItemInfo {

	/*  from the jaxb compiler expansion of the xsd - but likely not needed in this representation
	@XmlElement(type = String.class)
	@XmlJavaTypeAdapter(HexBinaryAdapter.class)
	*/
    @Size(min = 16, max = 16)
    private String name;

    @ManyToOne
    private CRUDOperation operation;

    @ManyToOne
    private StatusCode statusCode;

    @Size(max = 256)
    private String statusReason;
}
