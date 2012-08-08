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

import java.net.URI;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.HexBinaryAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import org.energyos.espi.thirdparty.common.IdentifiedObject;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * A resource is an addressable unit of information, either a collection (List) or instance of an object (identifiedObject, or simply, Resource)
 * 
 * <p>Java class for Resource complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="Resource">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;attribute name="href" type="{http://www.w3.org/2001/XMLSchema}anyURI" />
 *       &lt;attribute name="replyTo" type="{http://www.w3.org/2001/XMLSchema}anyURI" />
 *       &lt;attribute name="responseRequired" type="{http://naesb.org/espi}HexBinary8" />
 *       &lt;attribute name="signatureRequired" type="{http://www.w3.org/2001/XMLSchema}boolean" />
 *       &lt;attribute name="subscribable" type="{http://www.w3.org/2001/XMLSchema}boolean" />
 *     &lt;/restriction>
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
@XmlType(name = "Resource")
@XmlSeeAlso({
    IdentifiedObject.class
})

public class Resource {
 
	@XmlAttribute
    @XmlSchemaType(name = "anyURI")
    private URI href;

    @XmlAttribute
    @XmlSchemaType(name = "anyURI")
    private URI replyTo;

    @Size(max = 8)
    @XmlAttribute
    // TODO need to encode the responseRequired
    // @XmlJavaTypeAdapter(HexBinaryAdapter.class)
    private String responseRequired;

    @XmlAttribute
    private Boolean signatureRequired;

    @XmlAttribute
    private Boolean subscribable;
}
