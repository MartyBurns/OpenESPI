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
 * A summary of power quality events. This information represents a summary of
 * power quality information typically required by customer facility energy
 * management systems. It is not intended to satisfy the detailed requirements of
 * power quality monitoring. All values are as defined by measurementProtocol
 * during the period. The standards typically also give ranges of allowed values;
 * the information attributes are the raw measurements, not the "yes/no"
 * determination by the various standards. See referenced standards for definition,
 * measurement protocol  and period.
 * @author svanausdall
 * @version 1.0
 * @updated 22-Aug-2011 9:39:21 AM
 */
public class ElectricPowerQualitySummary {

	/**
	 * A measurement of long term Rapid Voltage Change 
	 */
	public Float flickerPlt;
	/**
	 * A count of Rapid Voltage Change events during the summary interval period
	 */
	public Integer flickerPst;
	/**
	 * A measurement of the Harmonic Voltage during the period. For DC, distortion is
	 * with respect to a signal of zero Hz.
	 */
	public Float harmonicVoltage;
	/**
	 * A count of Long Interruption events (as defined by measurementProtocol) during
	 * the summary interval period.
	 */
	public Integer longInterruptions;
	/**
	 * A measurement of the Mains [Signaling] Voltage during the summary interval
	 * period.
	 */
	public Float mainsVoltage;
	/**
	 * A reference to the source used as the measurement protocol definition. e.g.
	 * "IEEE1519-2009", "EN50160"
	 */
	public String measurementProtocol;
	/**
	 * A measurement of the power frequency during the summary interval period.
	 */
	public Float powerFrequency;
	/**
	 * A count of Rapid Voltage Change events during the summary interval period
	 */
	public Integer rapidVoltageChanges;
	/**
	 * A count of Short Interruption events during the summary interval period 
	 */
	public Integer shortInterruptions;
	/**
	 * Interval of summary period
	 */
	public DateTimeInterval summaryInterval;
	/**
	 * A count of Supply Voltage Dip events during the summary interval period 
	 */
	public Integer supplyVoltageDips;
	/**
	 * A count of Supply Voltage Imbalance events during the summary interval period 
	 */
	public Integer supplyVoltageImbalance;
	/**
	 * A count of Supply Voltage Variations during the summary interval period 
	 */
	public Integer supplyVoltageVariations;
	/**
	 * A count of Temporary Overvoltage events (as defined by measurementProtocol)
	 * during the summary interval period 
	 */
	public Integer tempOvervoltage;

	public ElectricPowerQualitySummary(){

	}

	public void finalize() throws Throwable {

	}
}//end ElectricPowerQualitySummary