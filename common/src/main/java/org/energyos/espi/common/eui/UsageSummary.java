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
 * Summary of usage for a billing period
 * @author svanausdall
 * @version 1.0
 * @updated 22-Aug-2011 9:39:27 AM
 */
public class UsageSummary {

	/**
	 * The billing period to which the included measurements apply
	 */
	public DateTimeInterval billingPeriod;
	/**
	 * The amount of the bill for the previous period
	 */
	public Float billLastPeriod;
	/**
	 * The bill amount related to the billing period as of the date received
	 */
	public Float billToDate;
	/**
	 * Additional charges from the last billing period
	 */
	public Float costAdditionalLastPeriod;
	/**
	 * The ISO 4217 code indicating the currency applicable to the bill amounts in the
	 * summary. See list at http://www.unece.
	 * org/cefact/recommendations/rec09/rec09_ecetrd203.pdf
	 */
	public String currency;
	/**
	 * The total consumption for the billing period
	 */
	public SummaryMeasurement currentBillingPeriodOverAllConsumption;
	/**
	 * The amount of energy consumed one year ago 
	 */
	public SummaryMeasurement currentDayLastYearNetConsumption;
	/**
	 * Net consumption for the current day (delivered - received)
	 */
	public SummaryMeasurement currentDayNetConsumption;
	/**
	 * Overall energy consumption for the current day
	 */
	public SummaryMeasurement currentDayOverallConsumption;
	/**
	 * Peak demand recorded for the current period
	 */
	public SummaryMeasurement peakDemand;
	/**
	 * The amount of energy consumed on the previous day one year ago 
	 */
	public SummaryMeasurement previousDayLastYearOverallConsumption;
	/**
	 * Net consumption for the previous day
	 */
	public SummaryMeasurement previousDayNetConsumption;
	/**
	 * The total consumption for the previous day
	 */
	public SummaryMeasurement previousDayOverallConsumption;
	/**
	 * Indication of the quality of the summary readings
	 */
	public SummaryQuality qualityOfReading;
	/**
	 * The current ratchet demand value for the ratchet demand period
	 */
	public SummaryMeasurement ratchetDemand;
	/**
	 * The period over which the ratchet demand applies
	 */
	public DateTimeInterval ratchetDemandPeriod;

	public UsageSummary(){

	}

	public void finalize() throws Throwable {

	}
}//end UsageSummary