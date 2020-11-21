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
#pragma once

#include "HardwareBase.h"
#include "Vibrator.h"

namespace aidl {
namespace android {
namespace hardware {
namespace vibrator {

class HwApi : public Vibrator::HwApi, private HwApiBase {
  public:
    static std::unique_ptr<HwApi> Create() {
        auto hwapi = std::unique_ptr<HwApi>(new HwApi());
        // the following streams are required
        if (!hwapi->mActivate.is_open() || !hwapi->mDuration.is_open() ||
            !hwapi->mState.is_open()) {
            return nullptr;
        }
        return hwapi;
    }

    bool setAutocal(std::string value) override { return set(value, &mAutocal); }
    bool setOlLraPeriod(uint32_t value) override { return set(value, &mOlLraPeriod); }
    bool setActivate(bool value) override { return set(value, &mActivate); }
    bool setDuration(uint32_t value) override { return set(value, &mDuration); }
    bool setState(bool value) override { return set(value, &mState); }
    bool hasRtpInput() override { return has(mRtpInput); }
    bool setRtpInput(int8_t value) override { return set(value, &mRtpInput); }
    bool setMode(std::string value) override { return set(value, &mMode); }
    bool setSequencer(std::string value) override { return set(value, &mSequencer); }
    bool setScale(uint8_t value) override { return set(value, &mScale); }
    bool setCtrlLoop(bool value) override { return set(value, &mCtrlLoop); }
    bool setLpTriggerEffect(uint32_t value) override { return set(value, &mLpTrigger); }
    bool setLraWaveShape(uint32_t value) override { return set(value, &mLraWaveShape); }
    bool setOdClamp(uint32_t value) override { return set(value, &mOdClamp); }
    void debug(int fd) override { HwApiBase::debug(fd); }

  private:
    HwApi() {
        open("osc_cali", &mAutocal);
        open("lra_resistance", &mOlLraPeriod);
        //open("haptic_audio", &mOlLraPeriod);
        open("brightness", &mActivate);
        open("duration", &mDuration);
        open("state", &mState);
        open("rtp", &mRtpInput);
        open("register", &mMode);
        open("seq", &mSequencer);
        open("vmax", &mScale);
        open("loop", &mCtrlLoop);
        open("trigger", &mLpTrigger);
        open("haptic_osc_data", &mLraWaveShape);
        open("vmax", &mOdClamp);
    }

  private:
    std::ofstream mAutocal;
    std::ofstream mOlLraPeriod;
    std::ofstream mActivate;
    std::ofstream mDuration;
    std::ofstream mState;
    std::ofstream mRtpInput;
    std::ofstream mMode;
    std::ofstream mSequencer;
    std::ofstream mScale;
    std::ofstream mCtrlLoop;
    std::ofstream mLpTrigger;
    std::ofstream mLraWaveShape;
    std::ofstream mOdClamp;
};

}  // namespace vibrator
}  // namespace hardware
}  // namespace android
}  // namespace aidl
