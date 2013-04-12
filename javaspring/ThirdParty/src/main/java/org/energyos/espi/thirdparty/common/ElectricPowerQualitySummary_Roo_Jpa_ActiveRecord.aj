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

import java.util.List;
import org.energyos.espi.thirdparty.common.ElectricPowerQualitySummary;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ElectricPowerQualitySummary_Roo_Jpa_ActiveRecord {
    
    public static long ElectricPowerQualitySummary.countElectricPowerQualitySummarys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ElectricPowerQualitySummary o", Long.class).getSingleResult();
    }
    
    public static List<ElectricPowerQualitySummary> ElectricPowerQualitySummary.findAllElectricPowerQualitySummarys() {
        return entityManager().createQuery("SELECT o FROM ElectricPowerQualitySummary o", ElectricPowerQualitySummary.class).getResultList();
    }
    
    public static ElectricPowerQualitySummary ElectricPowerQualitySummary.findElectricPowerQualitySummary(Long id) {
        if (id == null) return null;
        return entityManager().find(ElectricPowerQualitySummary.class, id);
    }
    
    public static List<ElectricPowerQualitySummary> ElectricPowerQualitySummary.findElectricPowerQualitySummaryEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ElectricPowerQualitySummary o", ElectricPowerQualitySummary.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public ElectricPowerQualitySummary ElectricPowerQualitySummary.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ElectricPowerQualitySummary merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
