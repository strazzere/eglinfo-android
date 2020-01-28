LOCAL_PATH := $(call my-dir)

TARGET_PIE := true
NDK_APP_PIE := true

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
  eglinfo.c
LOCAL_C_INCLUDE := \

LOCAL_MODULE := eglinfo
LOCAL_MODULE_TAGS := optional

LOCAL_LDLIBS := -lEGL

NDK_TOOLCHAIN_VERSION := clang
ANDROID_NDK=/home/diff/Android/Sdk/ndk/20.0.5594570/
#CC="$ANDROID_NDK/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang -target armv7-none-linux-androideabi -gcc-toolchain $NDK_TOOLCHAIN"
#CXX="$ANDROID_NDK/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang++ -target armv7-none-linux-androideabi -gcc-toolchain $NDK_TOOLCHAIN"


# Allow execution on android-16+
LOCAL_CFLAGS += -fPIE #-Xclang -load -Xclang /home/diff/repo/android/fusor/build/fusor/libFusorPass.so
LOCAL_LDFLAGS += -fPIE -pie -LEGL

include $(BUILD_EXECUTABLE)

include $(call all-makefiles-under,$(LOCAL_PATH))
