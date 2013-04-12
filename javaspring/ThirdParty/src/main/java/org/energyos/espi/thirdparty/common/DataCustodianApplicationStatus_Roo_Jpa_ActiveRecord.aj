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
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.energyos.espi.thirdparty.common.DataCustodianApplicationStatus;
import org.springframework.transaction.annotation.Transactional;

privileged aspect DataCustodianApplicationStatus_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager DataCustodianApplicationStatus.entityManager;
    
    public static final EntityManager DataCustodianApplicationStatus.entityManager() {
        EntityManager em = new DataCustodianApplicationStatus().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long DataCustodianApplicationStatus.countDataCustodianApplicationStatuses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM DataCustodianApplicationStatus o", Long.class).getSingleResult();
    }
    
    public static List<DataCustodianApplicationStatus> DataCustodianApplicationStatus.findAllDataCustodianApplicationStatuses() {
        return entityManager().createQuery("SELECT o FROM DataCustodianApplicationStatus o", DataCustodianApplicationStatus.class).getResultList();
    }
    
    public static DataCustodianApplicationStatus DataCustodianApplicationStatus.findDataCustodianApplicationStatus(Long id) {
        if (id == null) return null;
        return entityManager().find(DataCustodianApplicationStatus.class, id);
    }
    
    public static List<DataCustodianApplicationStatus> DataCustodianApplicationStatus.findDataCustodianApplicationStatusEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM DataCustodianApplicationStatus o", DataCustodianApplicationStatus.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void DataCustodianApplicationStatus.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void DataCustodianApplicationStatus.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            DataCustodianApplicationStatus attached = DataCustodianApplicationStatus.findDataCustodianApplicationStatus(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void DataCustodianApplicationStatus.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void DataCustodianApplicationStatus.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public DataCustodianApplicationStatus DataCustodianApplicationStatus.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        DataCustodianApplicationStatus merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
