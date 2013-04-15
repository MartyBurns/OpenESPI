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

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestOperations;

import flexjson.JSONDeserializer;

@Controller
public class OAuthClientController {

	private String resourceURL = "http://localhost:8080/testResource";
	
	@Autowired
	private RestOperations restTemplate;
	
	@RequestMapping("/quiz")
	public String accessProtectedResource(Model model) throws Exception {
		
		// Call the protected http://localhost:8080/testResource REST service
		String jsonResponse = restTemplate.getForObject(resourceURL, String.class);

		HashMap resourceResponse = new JSONDeserializer<HashMap>().deserialize(jsonResponse);
		
		model.addAttribute("question", resourceResponse.get("question"));
		model.addAttribute("answer", resourceResponse.get("answer"));		
		
		return "testResource";
	}

	public void setResourceURL(String resourceURL) {
		this.resourceURL = resourceURL;
	}
}

