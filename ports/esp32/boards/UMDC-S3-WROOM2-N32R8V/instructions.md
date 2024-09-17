get_idf


cd ~/micropython
make -C mpy-cross



cd ~/micropython/ports/esp32
make submodules

make clean BOARD=UMDC-S3-WROOM2-N32R8V

esptool.py --chip esp32s3 --port /dev/ttyUSB0 erase_flash

make BOARD=UMDC-S3-WROOM2-N32R8V


python -m esptool --chip esp32s3 -b 460800 --before default_reset --after no_reset write_flash --flash_mode dout --flash_size 32MB --flash_freq 80m -z 0 build-UMDC-S3-WROOM2-N32R8V/bootloader/bootloader.bin 0x8000 build-UMDC-S3-WROOM2-N32R8V/partition_table/partition-table.bin 0x10000 build-UMDC-S3-WROOM2-N32R8V/micropython.bin

-----


python -m esptool --chip esp32s3 -b 460800 --before default_reset --after no_reset write_flash --flash_mode dout --flash_size 32MB --flash_freq 80m 0x0 build-UMDC-S3-WROOM2-N32R8V/bootloader/bootloader.bin 0x8000 build-UMDC-S3-WROOM2-N32R8V/partition_table/partition-table.bin 0x10000 build-UMDC-S3-WROOM2-N32R8V/micropython.bin


JP
python esptool.py -p /dev/ttyUSB0 -b 460800 --before default_reset --after hard_reset --chip esp32s3 write_flash --flash_mode keep --flash_size detect --flash_freq keep -z 0 build-UMDC-S3-WROOM2-N32R8V/bootloader/bootloader.bin 0x8000 build-UMDC-S3-WROOM2-N32R8V/partition_table/partition-table.bin 0x10000 build-UMDC-S3-WROOM2-N32R8V/micropython.bin


python -m esptool --chip esp32s3 -b 460800 --before default_reset --after no_reset write_flash --flash_mode dout --flash_size 32MB --flash_freq 80m 0x0 build-UMDC-S3-WROOM2-N32R8V/bootloader/bootloader.bin 0x8000 build-UMDC-S3-WROOM2-N32R8V/partition_table/partition-table.bin 0x10000 build-UMDC-S3-WROOM2-N32R8V/micropython.bin