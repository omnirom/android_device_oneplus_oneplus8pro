/*
 * Copyright (C) 2019 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "HardwareBase.h"

#include <fstream>
#include <sstream>

#include <cutils/properties.h>
#include <log/log.h>

#include "utils.h"

namespace aidl {
namespace android {
namespace hardware {
namespace vibrator {

HwApiBase::HwApiBase() {
    mPathPrefix = std::getenv("HWAPI_PATH_PREFIX") ?: "";
    if (mPathPrefix.empty()) {
        ALOGE("Failed get HWAPI path prefix!");
    }
}

void HwApiBase::saveName(const std::string &name, const std::ios *stream) {
    mNames[stream] = name;
}

bool HwApiBase::has(const std::ios &stream) {
    return !!stream;
}

void HwApiBase::debug(int fd) {
    dprintf(fd, "Kernel:\n");

    for (auto &entry : utils::pathsFromEnv("HWAPI_DEBUG_PATHS", mPathPrefix)) {
        auto &path = entry.first;
        auto &stream = entry.second;
        std::string line;

        dprintf(fd, "  %s:\n", path.c_str());
        while (std::getline(stream, line)) {
            dprintf(fd, "    %s\n", line.c_str());
        }
    }

    mRecordsMutex.lock();
    dprintf(fd, "  Records:\n");
    for (auto &r : mRecords) {
        if (r == nullptr) {
            continue;
        }
        dprintf(fd, "    %s\n", r->toString(mNames).c_str());
    }
    mRecordsMutex.unlock();
}

}  // namespace vibrator
}  // namespace hardware
}  // namespace android
}  // namespace aidl
