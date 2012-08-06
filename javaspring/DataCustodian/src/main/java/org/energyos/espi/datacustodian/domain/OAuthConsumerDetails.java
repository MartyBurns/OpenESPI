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

package org.energyos.espi.datacustodian.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.security.oauth.provider.BaseConsumerDetails;

/* expose this for now, remove after integration testing is complete */
/* or when a better path forward is found */

@RooJavaBean
@RooToString
@RooJpaActiveRecord

public class OAuthConsumerDetails extends BaseConsumerDetails {

    /**
	 * serialVersionUID was added via AspectJ
	 */
	private static final long serialVersionUID = 1L;
	private String displayName;
    private String resourceName;
    private String resourceDescription;

    /**
     * The display name of the consumer.
     *
     * @return The display name of the consumer.
     */
    public String getDisplayName() {
	return displayName;
    }

    /**
     * The display name of the consumer.
     *
     * @param displayName The display name of the consumer.
     */
    public void setDisplayName(String displayName) {
	this.displayName = displayName;
    }

    /**
     * The name of the resource that this consumer can be granted access to.
     *
     * @return The name of the resource that this consumer can be granted access to.
     */
    public String getResourceName() {
	return resourceName;
    }

    /**
     * The name of the resource that this consumer can be granted access to.
     *
     * @param resourceName The name of the resource that this consumer can be granted access to.
     */
    public void setResourceName(String resourceName) {
	this.resourceName = resourceName;
    }

    /**
     * The description of the resource that this consumer can be granted access to.
     *
     * @return The description of the resource that this consumer can be granted access to.
     */
    public String getResourceDescription() {
	return resourceDescription;
    }

    /**
     * The description of the resource that this consumer can be granted access to.
     *
     * @param resourceDescription The description of the resource that this consumer can be granted access to.
     */
    public void setResourceDescription(String resourceDescription) {
	this.resourceDescription = resourceDescription;
    }
}
