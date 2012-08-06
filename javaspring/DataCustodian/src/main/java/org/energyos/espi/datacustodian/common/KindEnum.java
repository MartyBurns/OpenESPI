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

package org.energyos.espi.datacustodian.common;


public enum KindEnum {

    none, apparentPowerFactor, currency, current, currentAngle, currentImbalance, date, demand, distance, distortionVoltAmperes, energization, energy, energizationLoadSide, fan, frequency, Funds, ieee1366ASAI, ieee1366ASIDI, ieee1366ASIFI, ieee1366CAIDI, ieee1366CAIFI, ieee1366CEMIn, ieee1366CESMIn, ieee1366CTAIDI, ieee1366MAIFI, ieee1366MAIFIe, ieee1366SAIDI, ieee1366SAIFI, linelosses, losses, negativeSequence, phasorPowerFactor, phasorReactivePower, positiveSequence, power, powerFactor, quantityPower, sag, swell, switchPosition, tapPosition, tariffRate, temperature, totalHarmonicDistortion, transformerLosses, unipedeVoltageDip10to15, unipedeVoltageDip15to30, unipedeVoltageDip30to60, unipedeVoltageDip60to90, unipedeVoltageDip90to100, voltage, voltageAngle, voltageExcursion, voltageImbalance, volume, zeroFlowduration, zeroSequence, distortionPowerFactor, frequencyExcursion, applicationContext, apTitle, assetNumber, bandwidth, batteryVoltage, broadcastAddress, deviceAddressType1, deviceAddressType2, deviceAddressType3, deviceAddressType4, deviceClass, electronicSerialNumber, endDeviceID, groupAddressType1, groupAddressType2, groupAddressType3, groupAddressType4, ipAddress, macAdress, mfgAssignedConfigurationID, mfgAssignedSerialNumber, mfgAssignedProductNumber, mfgAssignedUniqueCommunicationAddress, multiCastAddress, oneWayAddress, signalStrength, twoWayAddress, signal20NoiseRatio, alarm, batteryCarryover, dataOverflowAlarm, demandLimit, demandReset, diagnostic, emergencyLimit, encoderTamper, ieee1366MomentaryInterruption, ieee1366MomentaryInterruptionEvent, ieee1366SustainedInterruption, interruptionBehavior, inversionTamper, loadInterrupt, loadShed, maintenance, physicalTamper, powerLossTamper, powerOutage, powerQuality, powerRestoration, programmed, pushbutton, relayActivation, relayCycle, removalTamper, reprogrammingTamper, reverseRotationTamper, switchArmed, switchDisabled, tamper, watchdogTimeout, billLastPeriod, billToDate, billCarryover, connectionFee, audibleVolume, volumetricFlow;
}
