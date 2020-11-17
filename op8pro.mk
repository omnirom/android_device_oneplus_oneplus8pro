# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/oneplus/oneplus8pro/prebuilt/system,system) \
    $(call find-copy-subdir-files,*,device/oneplus/oneplus8pro/prebuilt/product,product) \
    $(call find-copy-subdir-files,*,device/oneplus/oneplus8pro/prebuilt/root,root)

PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl.recovery \
    bootctrl.kona.recovery \
    bootctrl.kona
