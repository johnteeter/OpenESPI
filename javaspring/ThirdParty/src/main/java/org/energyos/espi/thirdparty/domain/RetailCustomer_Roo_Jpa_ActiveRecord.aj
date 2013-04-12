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

package org.energyos.espi.thirdparty.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.energyos.espi.thirdparty.domain.RetailCustomer;
import org.springframework.transaction.annotation.Transactional;

privileged aspect RetailCustomer_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager RetailCustomer.entityManager;
    
    public static final EntityManager RetailCustomer.entityManager() {
        EntityManager em = new RetailCustomer().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long RetailCustomer.countRetailCustomers() {
        return entityManager().createQuery("SELECT COUNT(o) FROM RetailCustomer o", Long.class).getSingleResult();
    }
    
    public static List<RetailCustomer> RetailCustomer.findAllRetailCustomers() {
        return entityManager().createQuery("SELECT o FROM RetailCustomer o", RetailCustomer.class).getResultList();
    }
    
    public static RetailCustomer RetailCustomer.findRetailCustomer(Long id) {
        if (id == null) return null;
        return entityManager().find(RetailCustomer.class, id);
    }
    
    public static List<RetailCustomer> RetailCustomer.findRetailCustomerEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM RetailCustomer o", RetailCustomer.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void RetailCustomer.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void RetailCustomer.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            RetailCustomer attached = RetailCustomer.findRetailCustomer(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void RetailCustomer.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void RetailCustomer.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public RetailCustomer RetailCustomer.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        RetailCustomer merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
