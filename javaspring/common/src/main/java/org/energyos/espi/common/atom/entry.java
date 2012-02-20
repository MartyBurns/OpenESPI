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
 * 
 * The Atom entry construct is defined in section 4.1.2 of the format spec.
 * 
 * @author svanausdall
 * @version 1.0
 * @created 22-Aug-2011 9:44:30 AM
 */
public class entry extends org.apache.wink.common.model.atom.AtomEntry {

    // -  inherited from AtomEntry
    // -- note the inherited attributes are private.
    //	public personType author;  
    //	public categoryType category;
    //	public contentType content;
    //	public personType contributor;
    //	public linkType link;
    //	public textType summary;
    //	public textType title;
    // - inherited from AtomCommonAttributes
    // -- note this includes base and lang
    //	public commonAttributes m_commonAttributes;
    // -  AtomEntry
    	public idType id;
    // - refined from AtomEntry (where XMLGregorianCalendar is used)
	public dateTimeType published;
	public dateTimeType updated;
    
    // - extensions to AtomEntry
	public textType rights;
	public textType source;
	public ModelGroup2 m_ModelGroup2;

	public entry(){

	}

	public void finalize() throws Throwable {

	}
}//end entry