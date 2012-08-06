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

package org.energyos.espi.thirdparty.web;

import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Date;
import java.util.List;

import org.springframework.http.HttpHeaders;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.energyos.espi.thirdparty.domain.ThirdParty;
import org.energyos.espi.thirdparty.common.IdentifiedObject;

@RequestMapping("/thirdpartys")
@Controller
    @RooWebScaffold(path = "thirdpartys", formBackingObject = ThirdParty.class)
    public class ThirdPartyController {

	private ThirdParty thirdpartyService;
    
	// from OAuth Example                                                                                                                                                                
	@RequestMapping(method = RequestMethod.GET, value="/services/{UUID}", headers="Accept=application/atom+xml")
    @ResponseBody
	    public String getResource(@PathVariable("UUID") String id) throws IOException {
	    
	    String xmlResult;
	    // get the resource                                                                                                                                                              
	    IdentifiedObject resource = thirdpartyService.getResource(id);
	    if (resource == null) {
		// TODO establish the proper way to return the error streams
		// return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		return "400: Resource Not Found";
	    } else {
		// marshall the resource                                                                                                                                                     
		JAXBContext context;
		Marshaller m;
		Writer w = null;

		try {
		    context = JAXBContext.newInstance(IdentifiedObject.class);
		    m = context.createMarshaller();
		    m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
		    w = new StringWriter();
		    m.marshal(resource, w);
		} catch (JAXBException e1) {
		    // TODO Auto-generated catch block                                                                                                                                       
		    e1.printStackTrace();
		}
		xmlResult = w.toString();
		try {
		    w.close();
		} catch (IOException e) {
		    e.printStackTrace();
		}
		HttpHeaders headers = new HttpHeaders();
		headers.set("Content-Type", "application/atom+xml");
		return xmlResult;
		// we may want a response entity for respance encapsulation rather than just the raw string                                                                                  
		//                                                                                                                                                                           
		//      return new ResponseEntity<byte[]>(out.toByteArray(), headers, HttpStatus.OK);                                                                                        
	    }
	}

	public void setThirdPartyService(ThirdParty thirdparty) {
	    this.thirdpartyService = thirdparty;
	}

	// end map from OAuth example                                                                                                                                                        

	// end map from OAuth example                                                                                                                                                        

	@RequestMapping(method = RequestMethod.GET, value="/{id}", headers="Accept=application/atom+xml")
    @ResponseBody
	    public String getXML(@PathVariable("id") Long id, Model uiModel, HttpServletRequest httpServletRequest) {

            // ToDo: instantiate a marshaler and serialize the XML representation                                                                                                        
            //                                                                                                                                                                           
            // 1 - find the appropriate entity                                                                                                                                           
            // 2 - create the marshaler                                                                                                                                                  
            // 3 - Serialize the appropriate resource                                                                                                                                    
            // 4 - return the appropriate StatusCode with Serialized (XML) string                                                                                                        
            String xmlResult = "";

            ThirdParty thirdParty = ThirdParty.findThirdParty(id);
            // create JAXB context and instantiate marshaler                                                                                                                             
	    JAXBContext context;
	    Marshaller m;
	    Writer w = null;

	    try {
		context = JAXBContext.newInstance(ThirdParty.class);
		m = context.createMarshaller();
		m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
		w = new StringWriter();
                m.marshal(thirdParty, w);
	    } catch (JAXBException e1) {
		// TODO Auto-generated catch block                                                                                                                       
		e1.printStackTrace();
	    }
	    xmlResult = w.toString();
	    try {
		w.close();
	    } catch (IOException e) {
		e.printStackTrace();
	    }
	    /*                                                                                                                                                                       
            xmlResult = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";                                                                                                                  
            xmlResult += "<feed xmlns=\"http://www.w3.org/2005/Atom\"";                                                                                                                  
            xmlResult += "xsi:schemaLocation=\"http://naesb.org/espi espiDerived.xsd\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\n ";                                     
            xmlResult += "<id>uri:uuid:000-000-0001</id>\n";                                                                                                                             
            xmlResult += "<title>OpenESPI Data Custodian</title>\n";                                                                                                                     
            xmlResult += "<link rel=\"self\" href=\"http://localhost:8080/thirdparty/\" />\n";                                                                                        
            xmlResult += "<updated>" + new Date().toString() + "</updated>\n";                                                                                                           
            xmlResult += "  <item><title>" + thirdparty.getName() + "</title>\n";                                                                                                     
            xmlResult += "    <description>" + thirdparty.getDescription() + "</description>\n";                                                                                      
            xmlResult += "  </item>\n";                                                                                                                                                  
            xmlResult += "</feed>\n";                                                                                                                                                    
	    */
            return xmlResult;
	}

	@RequestMapping(method = RequestMethod.GET, value="/{id}/resource/{uuid}", headers="Accept=application/atom+xml")
    @ResponseBody
	    public String getResource(@PathVariable("id") Long id, @PathVariable("uuid") String uuid, Model uiModel, HttpServletRequest httpServletRequest) {

            // ToDo: instantiate a marshaler and serialize the XML representation                                                                                                        
            //                                                                                                                                                                           
            // 1 - find the appropriate entity                                                                                                                                           
            // 2 - create the marshaler                                                                                                                                                  
            // 3 - Serialize the appropriate resource                                                                                                                                    
            // 4 - return the appropriate StatusCode with Serialized (XML) string                                                                                                        
            String xmlResult = "";

            ThirdParty thirdParty = ThirdParty.findThirdParty(id);
            IdentifiedObject resource = thirdParty.getResource(uuid);
            // need to cast the IdentifiedObject to the appropriate class b/f marshalling
            // use the 2 bytes in the uuid to make the determination
            //
            // create JAXB context and instantiate marshaler                                                                                                                             
	    JAXBContext context;
	    Marshaller m;
	    Writer w = null;

	    try {
		context = JAXBContext.newInstance(IdentifiedObject.class);
		m = context.createMarshaller();
		m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
		w = new StringWriter();
                m.marshal(resource, w);
	    } catch (JAXBException e1) {
		// TODO Auto-generated catch block                                                                                                                       
		e1.printStackTrace();
	    }
	    xmlResult = w.toString();
	    try {
		w.close();
	    } catch (IOException e) {
		e.printStackTrace();
	    }

            return xmlResult;
	}
    
    }
