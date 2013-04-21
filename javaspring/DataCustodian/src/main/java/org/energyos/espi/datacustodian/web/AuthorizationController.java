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


package org.energyos.espi.datacustodian.web;

import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

import org.energyos.espi.datacustodian.common.ApplicationInformation;
import org.energyos.espi.datacustodian.common.Authorization;
import org.springframework.http.HttpHeaders;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/authorizations")
@Controller
@RooWebScaffold(path = "authorizations", formBackingObject = Authorization.class)
public class AuthorizationController {
	
    @RequestMapping(method = RequestMethod.GET, value="/{id}", headers="Accept=application/atom+xml")
    @ResponseBody
    public String getResource(@PathVariable("id") Long id)  {

        String xmlResult;
        // get the resource                                                                                                                                                                                                                                                
        Authorization resource = Authorization.findAuthorization(id);
      
        if (resource == null) {
            // TODO establish the proper way to return the error streams                                                                                                                                                                                               
            // return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);   
            return "400: Resource Not Found";
        } else {
            // marshal the resource                                                                                                                                                                                                                                       
            JAXBContext context;
            Marshaller m;
            Writer w = null;

            try {
                context = JAXBContext.newInstance(org.energyos.espi.datacustodian.common.Authorization.class);
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
            HttpHeaders hdr = new HttpHeaders();
            hdr.set("Content-Type", "application/atom+xml");
            return xmlResult;
            // we may want a response entity for respance encapsulation rather than just the raw string                                                                                                                                                                    
            //                                                                                                                                                                                                                                                             
            //      return new ResponseEntity<byte[]>(out.toByteArray(), headers, HttpStatus.OK);                                                                                                                                                                          
        }
 
    }

}
