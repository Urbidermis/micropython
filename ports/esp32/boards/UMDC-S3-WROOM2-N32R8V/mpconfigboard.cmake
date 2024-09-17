set(IDF_TARGET esp32s3)


set(SDKCONFIG_DEFAULTS
boards/sdkconfig.base
boards/sdkconfig.usb
boards/sdkconfig.ble
boards/sdkconfig.spiram_oct
boards/UMDC-S3-WROOM2-N32R8V/sdkconfig.board
)




#set(MICROPY_FROZEN_MANIFEST ${MICROPY_BOARD_DIR}/manifest.py)

set(MICROPY_PY_BLUETOOTH 0)
set(MICROPY_BLUETOOTH_NIMBLE 0)
set(MICROPY_BLUETOOTH_BTSTACK 0)

#set(MICROPY_PY_NETWORK_WIZNET5K W5500)
#set(MICROPY_PY_NETWORK_WIZNET5K 5500)
    

