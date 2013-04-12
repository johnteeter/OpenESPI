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


// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.energyos.espi.thirdparty.common;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.energyos.espi.thirdparty.common.AccumulationBehaviorDataOnDemand;
import org.energyos.espi.thirdparty.common.CPPDataOnDemand;
import org.energyos.espi.thirdparty.common.CommodityDataOnDemand;
import org.energyos.espi.thirdparty.common.ConsumptionTierDataOnDemand;
import org.energyos.espi.thirdparty.common.CurrencyDataOnDemand;
import org.energyos.espi.thirdparty.common.DataQualifierDataOnDemand;
import org.energyos.espi.thirdparty.common.DirectionOfFlowDataOnDemand;
import org.energyos.espi.thirdparty.common.KindDataOnDemand;
import org.energyos.espi.thirdparty.common.PhaseCodeDataOnDemand;
import org.energyos.espi.thirdparty.common.RationalNumberDataOnDemand;
import org.energyos.espi.thirdparty.common.ReadingInterharmonicDataOnDemand;
import org.energyos.espi.thirdparty.common.ReadingType;
import org.energyos.espi.thirdparty.common.ReadingTypeDataOnDemand;
import org.energyos.espi.thirdparty.common.TOUDataOnDemand;
import org.energyos.espi.thirdparty.common.TimeAttributeDataOnDemand;
import org.energyos.espi.thirdparty.common.UnitMultiplierDataOnDemand;
import org.energyos.espi.thirdparty.common.UnitSymbolDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ReadingTypeDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ReadingTypeDataOnDemand: @Component;
    
    private Random ReadingTypeDataOnDemand.rnd = new SecureRandom();
    
    private List<ReadingType> ReadingTypeDataOnDemand.data;
    
    @Autowired
    AccumulationBehaviorDataOnDemand ReadingTypeDataOnDemand.accumulationBehaviorDataOnDemand;
    
    @Autowired
    DataQualifierDataOnDemand ReadingTypeDataOnDemand.dataQualifierDataOnDemand;
    
    @Autowired
    RationalNumberDataOnDemand ReadingTypeDataOnDemand.rationalNumberDataOnDemand;
    
    @Autowired
    CommodityDataOnDemand ReadingTypeDataOnDemand.commodityDataOnDemand;
    
    @Autowired
    ConsumptionTierDataOnDemand ReadingTypeDataOnDemand.consumptionTierDataOnDemand;
    
    @Autowired
    CPPDataOnDemand ReadingTypeDataOnDemand.cPPDataOnDemand;
    
    @Autowired
    CurrencyDataOnDemand ReadingTypeDataOnDemand.currencyDataOnDemand;
    
    @Autowired
    DirectionOfFlowDataOnDemand ReadingTypeDataOnDemand.directionOfFlowDataOnDemand;
    
    @Autowired
    ReadingInterharmonicDataOnDemand ReadingTypeDataOnDemand.readingInterharmonicDataOnDemand;
    
    @Autowired
    KindDataOnDemand ReadingTypeDataOnDemand.kindDataOnDemand;
    
    @Autowired
    TimeAttributeDataOnDemand ReadingTypeDataOnDemand.timeAttributeDataOnDemand;
    
    @Autowired
    PhaseCodeDataOnDemand ReadingTypeDataOnDemand.phaseCodeDataOnDemand;
    
    @Autowired
    UnitMultiplierDataOnDemand ReadingTypeDataOnDemand.unitMultiplierDataOnDemand;
    
    @Autowired
    TOUDataOnDemand ReadingTypeDataOnDemand.tOUDataOnDemand;
    
    @Autowired
    UnitSymbolDataOnDemand ReadingTypeDataOnDemand.unitSymbolDataOnDemand;
    
    public ReadingType ReadingTypeDataOnDemand.getNewTransientReadingType(int index) {
        ReadingType obj = new ReadingType();
        setDescription(obj, index);
        setIntervalLength(obj, index);
        setUuid(obj, index);
        return obj;
    }
    
    public void ReadingTypeDataOnDemand.setDescription(ReadingType obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void ReadingTypeDataOnDemand.setIntervalLength(ReadingType obj, int index) {
        Integer intervalLength = new Integer(index);
        obj.setIntervalLength(intervalLength);
    }
    
    public void ReadingTypeDataOnDemand.setUuid(ReadingType obj, int index) {
        String uuid = "uuid_" + index;
        obj.setUuid(uuid);
    }
    
    public ReadingType ReadingTypeDataOnDemand.getSpecificReadingType(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ReadingType obj = data.get(index);
        Long id = obj.getId();
        return ReadingType.findReadingType(id);
    }
    
    public ReadingType ReadingTypeDataOnDemand.getRandomReadingType() {
        init();
        ReadingType obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return ReadingType.findReadingType(id);
    }
    
    public boolean ReadingTypeDataOnDemand.modifyReadingType(ReadingType obj) {
        return false;
    }
    
    public void ReadingTypeDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = ReadingType.findReadingTypeEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ReadingType' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ReadingType>();
        for (int i = 0; i < 10; i++) {
            ReadingType obj = getNewTransientReadingType(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
