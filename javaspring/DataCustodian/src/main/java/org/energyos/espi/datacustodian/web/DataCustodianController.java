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

import java.io.UnsupportedEncodingException;
import java.io.StringWriter;
import java.io.Writer;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.energyos.espi.datacustodian.common.ApplicationInformation;
import org.energyos.espi.datacustodian.common.DataCustodianApplicationStatus;
import org.energyos.espi.datacustodian.common.DataCustodianType;
import org.energyos.espi.datacustodian.common.IdentifiedObject;
import org.energyos.espi.datacustodian.common.ServiceStatus;
import org.energyos.espi.datacustodian.domain.DataCustodian;
import org.energyos.espi.datacustodian.domain.RetailCustomer;
import org.energyos.espi.datacustodian.domain.ThirdParty;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;


@RequestMapping("/datacustodians")
@Controller
@RooWebScaffold(path = "datacustodians", formBackingObject = DataCustodian.class)
public class DataCustodianController {
                                                                                                                                                                                                                                               
	    @RequestMapping(method = RequestMethod.GET, value="/{id}", headers="Accept=application/atom+xml")
	    @ResponseBody
	    public String getResource(@PathVariable("id") Long id)  {

	        String xmlResult;
	        // get the resource                                                                                                                                                                                                                                                
	        DataCustodian resource = DataCustodian.findDataCustodian(id);
          
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
	                context = JAXBContext.newInstance(org.energyos.espi.datacustodian.domain.DataCustodian.class);
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
	            // we may want a response entity for response encapsulation rather than just the raw string                                                                                                                                                                    
	            //                                                                                                                                                                                                                                                             
	            //      return new ResponseEntity<byte[]>(out.toByteArray(), headers, HttpStatus.OK);                                                                                                                                                                          
	        }
	 
	    }

	    
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid DataCustodian dataCustodian, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, dataCustodian);
            return "datacustodians/create";
        }
        uiModel.asMap().clear();
        dataCustodian.persist();
        return "redirect:/datacustodians/" + encodeUrlPathSegment(dataCustodian.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new DataCustodian());
        return "datacustodians/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("datacustodian", DataCustodian.findDataCustodian(id));
        uiModel.addAttribute("itemId", id);
        return "datacustodians/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("datacustodians", DataCustodian.findDataCustodianEntries(firstResult, sizeNo));
            float nrOfPages = (float) DataCustodian.countDataCustodians() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("datacustodians", DataCustodian.findAllDataCustodians());
        }
        return "datacustodians/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid DataCustodian dataCustodian, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, dataCustodian);
            return "datacustodians/update";
        }
        uiModel.asMap().clear();
        dataCustodian.merge();
        return "redirect:/datacustodians/" + encodeUrlPathSegment(dataCustodian.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, DataCustodian.findDataCustodian(id));
        return "datacustodians/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        DataCustodian dataCustodian = DataCustodian.findDataCustodian(id);
        dataCustodian.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/datacustodians";
    }

	void populateEditForm(Model uiModel, DataCustodian dataCustodian) {
        uiModel.addAttribute("dataCustodian", dataCustodian);
        uiModel.addAttribute("applicationinformations", ApplicationInformation.findAllApplicationInformations());
        uiModel.addAttribute("datacustodianapplicationstatuses", DataCustodianApplicationStatus.findAllDataCustodianApplicationStatuses());
        uiModel.addAttribute("datacustodiantypes", DataCustodianType.findAllDataCustodianTypes());
        uiModel.addAttribute("servicestatuses", ServiceStatus.findAllServiceStatuses());
        uiModel.addAttribute("retailcustomers", RetailCustomer.findAllRetailCustomers());
        uiModel.addAttribute("thirdpartys", ThirdParty.findAllThirdPartys());
    }

	String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
}
