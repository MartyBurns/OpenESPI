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
 * Interval of date and time.
 * @author svanausdall
 * @version 1.0
 * @updated 22-Aug-2011 9:39:20 AM
 */
public class DateTimeInterval {

	/**
	 * The duration of this interval, in seconds
	 */
	public Duration duration;
	/**
	 * Date and time that this interval ended.
	 */
	public AbsoluteDateTime end;
	/**
	 * Date and time that this interval started.
	 */
	public AbsoluteDateTime start;

	public DateTimeInterval(){

	}

    public DateTimeInterval(AbsoluteDateTime start, AbsoluteDateTime end){

	    this.start = start;
        this.end = end;

	}

    public DateTimeInterval(AbsoluteDateTime start, Duration duration){

	    this.start = start;
        this.duration = duration;

	}

    public java.lang.String getStartString () {
    	return this.start.toString();
    }
    
    public java.lang.String getEndString () {
    	return this.end.toString();
    }
    
    public java.lang.String getDurationString () {
    	return this.duration.toString();
    }
	public void finalize() throws Throwable {

	}
}//end DateTimeInterval