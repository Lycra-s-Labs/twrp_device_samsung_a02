# Replace $$DEVICE$$ with your Device Name's Value.
# Replace $$BRAND$$ with your Brand's / Manufacturer's Value.
# The part of last line in mine looks like "omni_Primo_RX5.mk"


PRODUCT_MAKEFILES := \
	$(LOCAL_PATH)/twrp_a02.mk

COMMON_LUNCH_CHOICES := \
    twrp_a02-user \
    twrp_a02-userdebug \
	twrp_a02-eng