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

 

package org.energyos.espi.common.eui;



/**
 * Type of name. Possible values for attribute 'name' are implementation dependent
 * but standard profiles may specify types. An enterprise may have multiple
 * information technology systems each having its own local name for the same
 * object, e.g. a planning system may have different names from an energy
 * management system. An object may also have different names within the same IT
 * system, e.g. localName and aliasName as defined in CIM version 14. Their
 * definitions from CIM14 are
 * localName: A free text name local to a node in a naming hierarchy similar to a
 * file directory structure. A power system related naming hierarchy may be:
 * Substation, VoltageLevel, Equipment etc. Children of the same parent in such a
 * hierarchy have names that typically are unique among them. The localName is a
 * human readable name of the object. It is only used with objects organized in a
 * naming hierarchy.
 * aliasName: A free text alternate name typically used in tabular reports where
 * the column width is limited.
 * @author svanausdall
 * @version 1.0
 * @updated 22-Aug-2011 9:39:23 AM
 */
public class NameType {

	/**
	 * Name of the name type.
	 */
	public String name;
	/**
	 * Authority responsible for managing names of this type.
	 */
	public NameTypeAuthority NameTypeAuthority;

	public NameType(){

	}

	public void finalize() throws Throwable {

	}
}//end NameType