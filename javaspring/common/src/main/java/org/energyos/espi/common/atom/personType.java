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
 * The Atom person construct is defined in section 3.2 of the format spec.
 * 
 * @author svanausdall
 * @version 1.0
 * @created 22-Aug-2011 9:45:28 AM
 */
public class personType extends org.apache.wink.common.model.atom.AtomPerson {

	public emailType email;
	public string name;
	public uriType uri;
	public commonAttributes m_commonAttributes;
	public ModelGroup4 m_ModelGroup4;

	public personType(){

	}

	public void finalize() throws Throwable {

	}
}//end personType