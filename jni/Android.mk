LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_MODULE := libz
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -O3 -DUSE_MMAP
LOCAL_SDK_VERSION := 15
define all-cpp-files-under
	$(patsubst ./%,%, \
	  $(shell cd $(LOCAL_PATH) ; \
	          find $(1) -name "*.cpp" -or -name "*.cc" -or -name "*.c" -and -not -name ".*" -and -not -name "testxxx.cpp") \
	 )
endef

define all-subdir-cpp-files
	$(call all-cpp-files-under,./)
endef
LOCAL_SRC_FILES := \
				$(call all-subdir-cpp-files)
include $(BUILD_SHARED_LIBRARY)
