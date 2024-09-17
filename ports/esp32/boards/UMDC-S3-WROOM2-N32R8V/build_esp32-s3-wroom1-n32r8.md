


# FLASH NEW DEVICE:
-----------------------------

```
python -m pip install --upgrade esptool
esptool.py --chip esp32s3 erase_flash


source ~/esp/esp-idf/export.sh 

cp -Rf /media/jprodriguez/data/nbs_git/cnx-umdc/micropython/* /media/jprodriguez/data/nbs_git/micropython/micropython/

cd /media/jprodriguez/data/nbs_git/micropython/micropython/
#git pull
#git submodule update --init --recursive --remote
cd /media/jprodriguez/data/nbs_git/micropython/micropython/
make -C mpy-cross
cd /media/jprodriguez/data/nbs_git/micropython/micropython/ports/esp32
make submodules


# UPDATE ALL AND CLEAN
cd /media/jprodriguez/data/nbs_git/micropython/micropython/ports/esp32
cp -Rf /media/jprodriguez/data/nbs_git/cnx-umdc/src/app/frozen/* /media/jprodriguez/data/nbs_git/cnx-umdc/libs/lib/
mkdir -p /media/jprodriguez/data/nbs_git/micropython/micropython/extmod/umdc/
cp -Rf /media/jprodriguez/data/nbs_git/cnx-umdc/src/app/umdc/* /media/jprodriguez/data/nbs_git/micropython/micropython/extmod/umdc/
cp -Rf /media/jprodriguez/data/nbs_git/cnx-umdc/libs/* /media/jprodriguez/data/nbs_git/cnx-umdc-libs/.
cp -Rf /media/jprodriguez/data/nbs_git/cnx-umdc-libs/* /media/jprodriguez/data/nbs_git/micropython/micropython/extmod/
make BOARD=UMDC-S3-WROOM2-N32R8V clean

# UPDATE libs, rebuild frozend and build
cd /media/jprodriguez/data/nbs_git/cnx-umdc
cd /media/jprodriguez/data/nbs_git/micropython/micropython/ports/esp32
cp -Rf /media/jprodriguez/data/nbs_git/cnx-umdc/src/app/frozen/* /media/jprodriguez/data/nbs_git/cnx-umdc-libs/lib/
cp -Rf /media/jprodriguez/data/nbs_git/cnx-umdc/libs/lib/manifest.py /media/jprodriguez/data/nbs_git/micropython/micropython/extmod/lib/manifest.py

cp -Rf /media/jprodriguez/data/nbs_git/cnx-umdc-libs/* /media/jprodriguez/data/nbs_git/micropython/micropython/extmod/
#cp -Rf /media/jprodriguez/data/nbs_git/cnx-umdc/libs/manifest.py /media/jprodriguez/data/nbs_git/micropython/micropython/ports/esp32/boards/manifest.py
cp -Rf /media/jprodriguez/data/nbs_git/cnx-umdc/micropython/ports/esp32/boards/UMDC-S3-WROOM2-N32R8V /media/jprodriguez/data/nbs_git/micropython/micropython/ports/esp32/boards/.
cp -Rf /media/jprodriguez/data/nbs_git/cnx-umdc/micropython/ports/esp32/partitions_umdc-s3-n32.csv /media/jprodriguez/data/nbs_git/micropython/micropython/ports/esp32/.
cp -Rf /media/jprodriguez/data/nbs_git/cnx-umdc/src/app/frozen/* /media/jprodriguez/data/nbs_git/micropython/micropython/extmod/lib/.
cp -Rf /media/jprodriguez/data/nbs_git/cnx-umdc/src/app/umdc/* /media/jprodriguez/data/nbs_git/micropython/micropython/extmod/umdc/
#cp -Rf /media/jprodriguez/data/nbs_git/cnx-umdc/doc/uart-fix/*.c /media/jprodriguez/data/nbs_git/micropython/micropython/ports/esp32/
rm /media/jprodriguez/data/nbs_git/micropython/micropython/ports/esp32/build-UMDC-S3-WROOM2-N32R8V/frozen_content.c
#make BOARD=UMDC-S3-WROOM2-N32R8V  MICROPY_PY_WIZNET5K=5500  -j16
#make BOARD=UMDC-S3-WROOM2-N32R8V  -j16 
make BOARD=UMDC-S3-WROOM2-N32R8V FROZEN_MANIFEST=/media/jprodriguez/data/nbs_git/cnx-umdc/micropython/ports/esp32/boards/UMDC-S3-WROOM2-N32R8V/manifest.py

# Save bin
#cp /media/jprodriguez/data/nbs_git/micropython/micropython/ports/esp32/micropython.bin /media/jprodriguez/data/nbs_git/micropython/micropython/ports/esp32/build-UMDC-S3-WROOM2-N32R8V/micropython.bin
cp build-UMDC-S3-WROOM2-N32R8V/micropython.bin /media/jprodriguez/data/nbs_git/umdc-s3-wroom2-n32r8.bin

# Show sizes
idf_size.py --archives build-UMDC-S3-WROOM2-N32R8V/micropython.map

# Flash erase and write
cd /media/jprodriguez/data/nbs_git/micropython/micropython/ports/esp32


#python3 ../../../../../../../../home/jprodriguez/esp/esp-idf/components/esptool_py/esptool/esptool.py -p /dev/ttyUSB0 -b 460800 --before default_reset --after hard_reset --chip esp32s3  write_flash --flash_mode keep --flash_size detect --flash_freq keep -z 0 build-UMDC-S3-WROOM2-N32R8V/bootloader/bootloader.bin 0x8000 build-UMDC-S3-WROOM2-N32R8V/partition_table/partition-table.bin 0x10000 build-UMDC-S3-WROOM2-N32R8V/micropython.bin


python3 ../../../../../../../../home/jprodriguez/esp/esp-idf/components/esptool_py/esptool/esptool.py -p /dev/ttyACM0 -b 460800 --before default_reset --after hard_reset --chip esp32s3  write_flash --flash_mode keep --flash_size detect --flash_freq keep -z 0 build-UMDC-S3-WROOM2-N32R8V/bootloader/bootloader.bin 0x8000 build-UMDC-S3-WROOM2-N32R8V/partition_table/partition-table.bin 0x10000 build-UMDC-S3-WROOM2-N32R8V/micropython.bin

