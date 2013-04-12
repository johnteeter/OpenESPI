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

package org.energyos.espi.thirdparty.web;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.energyos.espi.thirdparty.common.StatusCode;
import org.energyos.espi.thirdparty.common.StatusCodeEnum;
import org.energyos.espi.thirdparty.web.StatusCodeController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect StatusCodeController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String StatusCodeController.create(@Valid StatusCode statusCode, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, statusCode);
            return "statuscodes/create";
        }
        uiModel.asMap().clear();
        statusCode.persist();
        return "redirect:/statuscodes/" + encodeUrlPathSegment(statusCode.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String StatusCodeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new StatusCode());
        return "statuscodes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String StatusCodeController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("statuscode", StatusCode.findStatusCode(id));
        uiModel.addAttribute("itemId", id);
        return "statuscodes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String StatusCodeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("statuscodes", StatusCode.findStatusCodeEntries(firstResult, sizeNo));
            float nrOfPages = (float) StatusCode.countStatusCodes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("statuscodes", StatusCode.findAllStatusCodes());
        }
        return "statuscodes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String StatusCodeController.update(@Valid StatusCode statusCode, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, statusCode);
            return "statuscodes/update";
        }
        uiModel.asMap().clear();
        statusCode.merge();
        return "redirect:/statuscodes/" + encodeUrlPathSegment(statusCode.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String StatusCodeController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, StatusCode.findStatusCode(id));
        return "statuscodes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String StatusCodeController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        StatusCode statusCode = StatusCode.findStatusCode(id);
        statusCode.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/statuscodes";
    }
    
    void StatusCodeController.populateEditForm(Model uiModel, StatusCode statusCode) {
        uiModel.addAttribute("statusCode", statusCode);
        uiModel.addAttribute("statuscodeenums", Arrays.asList(StatusCodeEnum.values()));
    }
    
    String StatusCodeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
