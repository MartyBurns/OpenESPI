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

import javax.persistence.ManyToOne;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ReadingType extends IdentifiedObject {

    @ManyToOne
    private AccumulationBehavior accumulationBehavior;

    @ManyToOne
    private Commodity commodity;

    @ManyToOne
    private DataQualifier dataQualifier;

    @ManyToOne
    private DirectionOfFlow flowDirection;

    private Integer intervalLength;

    @ManyToOne
    private Kind kind;

    @ManyToOne
    private PhaseCode phase;

    @ManyToOne
    private UnitMultiplier powerOfTenMultiplier;

    @ManyToOne
    private TimeAttribute timeAttribute;

    @ManyToOne
    private UnitSymbol uom;

    @ManyToOne
    private ConsumptionTier consumptionTier;

    @ManyToOne
    private CPP cpp;

    @ManyToOne
    private Currency currency;

    @ManyToOne
    private ReadingInterharmonic interharmonic;

    @ManyToOne
    private TimeAttribute measuringPeriod;

    @ManyToOne
    private TOU tou;

    @ManyToOne
    private DataQualifier aggregate;

    @ManyToOne
    private RationalNumber argument;
}
