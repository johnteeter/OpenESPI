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

package org.energyos.espi.datacustodian.common;

import java.util.List;
import org.energyos.espi.datacustodian.common._ThirdParty;
import org.energyos.espi.datacustodian.common._ThirdPartyDataOnDemand;
import org.energyos.espi.datacustodian.common._ThirdPartyIntegrationTest;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect _ThirdPartyIntegrationTest_Roo_IntegrationTest {
    
    declare @type: _ThirdPartyIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: _ThirdPartyIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: _ThirdPartyIntegrationTest: @Transactional;
    
    @Autowired
    private _ThirdPartyDataOnDemand _ThirdPartyIntegrationTest.dod;
    
    @Test
    public void _ThirdPartyIntegrationTest.testCount_ThirdParties() {
        Assert.assertNotNull("Data on demand for '_ThirdParty' failed to initialize correctly", dod.getRandom_ThirdParty());
        long count = _ThirdParty.count_ThirdParties();
        Assert.assertTrue("Counter for '_ThirdParty' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void _ThirdPartyIntegrationTest.testFind_ThirdParty() {
        _ThirdParty obj = dod.getRandom_ThirdParty();
        Assert.assertNotNull("Data on demand for '_ThirdParty' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for '_ThirdParty' failed to provide an identifier", id);
        obj = _ThirdParty.find_ThirdParty(id);
        Assert.assertNotNull("Find method for '_ThirdParty' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for '_ThirdParty' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void _ThirdPartyIntegrationTest.testFindAll_ThirdParties() {
        Assert.assertNotNull("Data on demand for '_ThirdParty' failed to initialize correctly", dod.getRandom_ThirdParty());
        long count = _ThirdParty.count_ThirdParties();
        Assert.assertTrue("Too expensive to perform a find all test for '_ThirdParty', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<_ThirdParty> result = _ThirdParty.findAll_ThirdParties();
        Assert.assertNotNull("Find all method for '_ThirdParty' illegally returned null", result);
        Assert.assertTrue("Find all method for '_ThirdParty' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void _ThirdPartyIntegrationTest.testFind_ThirdPartyEntries() {
        Assert.assertNotNull("Data on demand for '_ThirdParty' failed to initialize correctly", dod.getRandom_ThirdParty());
        long count = _ThirdParty.count_ThirdParties();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<_ThirdParty> result = _ThirdParty.find_ThirdPartyEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for '_ThirdParty' illegally returned null", result);
        Assert.assertEquals("Find entries method for '_ThirdParty' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void _ThirdPartyIntegrationTest.testFlush() {
        _ThirdParty obj = dod.getRandom_ThirdParty();
        Assert.assertNotNull("Data on demand for '_ThirdParty' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for '_ThirdParty' failed to provide an identifier", id);
        obj = _ThirdParty.find_ThirdParty(id);
        Assert.assertNotNull("Find method for '_ThirdParty' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modify_ThirdParty(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for '_ThirdParty' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void _ThirdPartyIntegrationTest.testMergeUpdate() {
        _ThirdParty obj = dod.getRandom_ThirdParty();
        Assert.assertNotNull("Data on demand for '_ThirdParty' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for '_ThirdParty' failed to provide an identifier", id);
        obj = _ThirdParty.find_ThirdParty(id);
        boolean modified =  dod.modify_ThirdParty(obj);
        Integer currentVersion = obj.getVersion();
        _ThirdParty merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for '_ThirdParty' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void _ThirdPartyIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for '_ThirdParty' failed to initialize correctly", dod.getRandom_ThirdParty());
        _ThirdParty obj = dod.getNewTransient_ThirdParty(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for '_ThirdParty' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected '_ThirdParty' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected '_ThirdParty' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void _ThirdPartyIntegrationTest.testRemove() {
        _ThirdParty obj = dod.getRandom_ThirdParty();
        Assert.assertNotNull("Data on demand for '_ThirdParty' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for '_ThirdParty' failed to provide an identifier", id);
        obj = _ThirdParty.find_ThirdParty(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove '_ThirdParty' with identifier '" + id + "'", _ThirdParty.find_ThirdParty(id));
    }
    
}