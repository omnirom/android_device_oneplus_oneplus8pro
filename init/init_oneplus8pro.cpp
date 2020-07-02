/*
   Copyright (c) 2015, The Linux Foundation. All rights reserved.
   Copyright (C) 2019 The OmniRom Project.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <android-base/properties.h>
#include <android-base/logging.h>
#include "property_service.h"
#include <sys/resource.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

namespace android {
namespace init {

using android::base::GetProperty;
using android::init::property_set;

void property_override(const std::string& name, const std::string& value)
{
    size_t valuelen = value.size();

    prop_info* pi = (prop_info*) __system_property_find(name.c_str());
    if (pi != nullptr) {
        __system_property_update(pi, value.c_str(), valuelen);
    }
    else {
        int rc = __system_property_add(name.c_str(), name.size(), value.c_str(), valuelen);
        if (rc < 0) {
            LOG(ERROR) << "property_set(\"" << name << "\", \"" << value << "\") failed: "
                       << "__system_property_add failed";
        }
    }
}

void vendor_load_properties()
{
    std::string name;
    LOG(INFO) << "Starting custom init";

    name = android::base::GetProperty("ro.product.vendor.name", "");
    LOG(INFO) << name;
    if (name == "OnePlus8Pro") {
        property_override("ro.build.fingerprint", "OnePlus/OnePlus8Pro/OnePlus8Pro:11/RKQ1.200507.003/2006111730:user/release-keys");
        property_override("ro.system.build.fingerprint", "OnePlus/OnePlus8Pro/OnePlus8Pro:11/RKQ1.200507.003/2006111730:user/release-keys");
        property_override("ro.product.build.fingerprint", "OnePlus/OnePlus8Pro/OnePlus8Pro:11/RKQ1.200507.003/2006111730:user/release-keys");
        property_override("ro.odm.build.fingerprint", "OnePlus/OnePlus8Pro/OnePlus8Pro:11/RKQ1.200507.003/2006111730:user/release-keys");
        property_override("ro.build.description", "OnePlus/OnePlus8Pro/OnePlus8Pro:11/RKQ1.200507.003/2006111730:user/release-keys");
        property_override("ro.build.model", "IN2023");
    }
    property_override("ro.build.date", "Thu Jul  2 19:37:20 CST 2020");
    property_override("ro.build.date.utc", "1593689840");
    property_override("ro.build.id", "QKQ1.191222.002");
    property_override("ro.build.kernel.id", "4.19-G2007021957");
    property_override("ro.boot.flash.locked", "1");
    property_override("ro.boot.verifiedbootstate", "green");
    property_override("ro.boot.warranty_bit", "0");
    property_override("ro.warranty_bit", "0");
    property_override("ro.boot.flash.locked", "1");
    property_override("ro.build.type", "user");
    property_override("ro.product.build.type", "user");
    property_override("ro.system.build.type", "user");
    property_override("ro.debuggable", "1");
}

}
}
