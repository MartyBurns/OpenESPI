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

import java.util.HashMap;
import java.util.Iterator;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.bind.annotation.XmlType;

import org.energyos.espi.thirdparty.common.IdentifiedObject;
import org.energyos.espi.thirdparty.common.ApplicationInformation;
import org.energyos.espi.thirdparty.common.Authorization;
import org.energyos.espi.thirdparty.common.ElectricPowerQualitySummary;
import org.energyos.espi.thirdparty.common.ElectricPowerUsageSummary;
import org.energyos.espi.thirdparty.common.IntervalBlock;
import org.energyos.espi.thirdparty.common.MeterReading;
import org.energyos.espi.thirdparty.common.ReadingType;
import org.energyos.espi.thirdparty.common.Subscription;
import org.energyos.espi.thirdparty.common.TimeConfiguration;
import org.energyos.espi.thirdparty.common.UsagePoint;
import org.hibernate.mapping.List;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;


/**
 * This is a root class to provide common naming attributes for all classes needing naming attributes
 * 
 * <p>Java class for IdentifiedObject complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="IdentifiedObject">
 *   &lt;complexContent>
 *     &lt;extension base="{http://naesb.org/espi}Resource">
 *       &lt;sequence>
 *         &lt;element name="mRID" type="{http://naesb.org/espi}UUIDType" minOccurs="0"/>
 *         &lt;element name="description" type="{http://naesb.org/espi}String32" minOccurs="0"/>
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
@XmlType(name = "IdentifiedObject", propOrder = {
    "id", "version",
    "uuid",
    // "mrid",
    "description"
})
@XmlSeeAlso({
    MeterReading.class,
    UsagePoint.class,
    ElectricPowerUsageSummary.class,
    TimeConfiguration.class,
    ApplicationInformation.class,
    Authorization.class,
    Subscription.class,
    ElectricPowerQualitySummary.class,
    IntervalBlock.class,
    ReadingQuality.class
})

public class IdentifiedObject {

	@XmlElement
    private String uuid;
	
    @XmlElement
    private String description;
   
    public IdentifiedObject () {
        // TODO complete the construction of the URI
        HashMap classes = new HashMap();
        classes.put("IntervalBlock", "01");
        classes.put("MeterReading", "02");
        classes.put("UsagePoint", 03);
        classes.put("ElectricPowerUsageSummary", "04");
        classes.put("TimeConfiguration", "05" );
        classes.put("ApplicationInformation", "06");
        classes.put("Authorization", "07");
        classes.put("Subscription", "08");
        classes.put("ElectricPowerQualitySummary", "09");
        classes.put("ReadingType", "0a");
        classes.get("UsagePoint");
        /*
        // get the mRID of the data custodian
        String mRID = DataCustodian.getmRID();
        
    	Class theClass;
    	theClass = this.getClass();
    	if (this.getId() == null) {
    		uuidString = "0000-0000-000000000000";
    	} else {
    	   	// TODO need to xxxx-xxxx-xxxxxxxxxxxx it.
  	    	String uuidString = Long.toString(this.getId(), 16);
    	}
        // TODO Make an OpenESPI mRID
    	this.uuid = "00000000-" + classes.get(theClass.getSimpleName()) + "00-" + uuidString;
        */
       	this.uuid =  "00000000-0000-0000-0000-000000000000";
    	this.description = "OPENESPI: testDescription";
    }

    // constructor for use whe we are given the uuid from an import
    //
    public IdentifiedObject (String uuid) {
	    this.uuid = uuid;
	    this.description = "Description: " + uuid;
    }

	public static IdentifiedObject findIdentifiedObject(String uuid) {
		// TODO Auto-generated method stub
		// this is ugly but it works (sledgehammer:)
		IdentifiedObject result = null;
		IdentifiedObject temp;
		java.util.List<IdentifiedObject> allResources = IdentifiedObject.findAllIdentifiedObjects();
		Iterator<IdentifiedObject> itr = allResources.iterator(); 
		while(itr.hasNext()) {
			temp = itr.next();
			if (temp.uuid == uuid) {
				return temp;
			}
		}
		return null;
	}
    
}

