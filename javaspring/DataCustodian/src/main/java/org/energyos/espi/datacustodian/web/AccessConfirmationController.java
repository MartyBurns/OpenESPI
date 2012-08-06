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

/* =====================================================================================
 * Copyright (c) 2011, 2012 EnergyOS.org
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification, are 
 * permitted provided that the following conditions are met:
 * - Redistributions of source code must retain the above copyright notice, this list of 
 *   conditions and the following disclaimer. 
 * - Redistributions in binary form must reproduce the above copyright notice, this list 
 *   of conditions and the following disclaimer in the documentation and/or other materials 
 *   provided with the distribution. 
 * - Neither the name of the EnergyOS.org nor the names of its contributors may be used to 
 *   endorse or promote products derived from this software without specific prior written
 *   permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
 * SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR 
 * TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * ========================================================================================
*/ 

package org.energyos.espi.datacustodian.web;

import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.oauth.provider.ConsumerDetails;
import org.springframework.security.oauth.provider.ConsumerDetailsService;
import org.springframework.security.oauth.provider.token.OAuthProviderToken;
import org.springframework.security.oauth.provider.token.OAuthProviderTokenServices;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import org.energyos.espi.datacustodian.domain.OAuthConsumerDetails;

/**
 * Controller for retrieving the model for and displaying the confirmation page for access to a protected resource.
 * 
 * @author Ryan Heaton
 * @author Dave Syer
 */

/* sourced from: package org.springframework.security.oauth.examples.sparklr.mvc; */

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RequestMapping("/authorizations")
@Controller
@RooWebScaffold(path = "authorizations", formBackingObject = OAuthConsumerDetails.class)

    public class AccessConfirmationController {

    private OAuthProviderTokenServices tokenServices;
    private ConsumerDetailsService consumerDetailsService;

    @RequestMapping("/oauth/confirm_access")
	public ModelAndView getAccessConfirmation(HttpServletRequest request, HttpServletResponse response)
	throws Exception {
	String token = request.getParameter("oauth_token");
	if (token == null) {
	    throw new IllegalArgumentException("A request token to authorize must be provided.");
	}

	OAuthProviderToken providerToken = tokenServices.getToken(token);
	ConsumerDetails consumer = consumerDetailsService
	    .loadConsumerByConsumerKey(providerToken.getConsumerKey());

	String callback = request.getParameter("oauth_callback");
	TreeMap<String, Object> model = new TreeMap<String, Object>();
	model.put("oauth_token", token);
	if (callback != null) {
	    model.put("oauth_callback", callback);
	}
	model.put("consumer", consumer);
	return new ModelAndView("access_confirmation", model);
    }

    public void setTokenServices(OAuthProviderTokenServices tokenServices) {
	this.tokenServices = tokenServices;
    }

    public void setConsumerDetailsService(ConsumerDetailsService consumerDetailsService) {
	this.consumerDetailsService = consumerDetailsService;
    }
}
