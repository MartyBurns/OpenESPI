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
 *******************************************************************************/

 

package org.energyos.espi.common.atom;

/**
 * @author svanausdall
 * @version 1.0
 * @created 22-Aug-2011 9:43:45 AM
 */
public class commonAttributes extends org.apache.wink.common.model.atom.AtomCommonAttributes {

    public string any7;
    // - Inherited from AtomCommonAttributes
    // - note that the wink object structure inherits CommonAttributes to AtomEntry etc.
    // public xml:lang ref_attribute_lang;
    // public xml:base ref_attribute_base;
    
    public commonAttributes(){

    }

    public void finalize() throws Throwable {
	
    }
}//end commonAttributes