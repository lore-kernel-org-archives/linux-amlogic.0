From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 4 Apr 2017 20:58:15 +0200
Subject: [PATCH 0/2] mmc: meson-gx: add basic tuning
Message-ID: <1d60ec2c-54c9-6b1c-7eaa-40e96fcd5be5@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

With a 128GB Hardkernel eMMC card my Odroid C2 boots up to 60MHz only
(tons of CRC errors otherwise). I made some tests and with changed
clock phase configuration it runs rock-solid with 200 MHz.
Changing the clock phase configuration in general most likely wouldn't
be a good idea as this might break other combinations of MMC device and
speed.
Therefore add basic tuning. So far it changes the rx clock phase only
as default core and tx clock phase work fine.

Heiner Kallweit (2):
  mmc: meson-gx: introduce struct meson_tuning_params
  mmc: meson-gx: add basic tuning for rx clock phase

 drivers/mmc/host/meson-gx-mmc.c | 66 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

-- 
2.12.1
