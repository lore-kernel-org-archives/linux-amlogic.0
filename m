From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 23 Jun 2018 21:38:27 +0200
Subject: [PATCH 0/1] move wifi node out of meson-gx-p23x-q20x.dtsi
Message-ID: <20180623193828.6047-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

while working on support for the S905W SoC I had a look at
meson-gx-p23x-q20x.dtsi. this defines that the board uses a Broadcom
SDIO wifi chip.
I discovered that NEXBOX A1 includes that .dtsi, but it comes with a
QCA9377 SDIO wifi chip (thus not Broadcom based).



This patch is based on my patch ([0]) from the series "enable the
SAR ADC for all boards based on P23x and Q20x"


[0] https://patchwork.kernel.org/patch/10483679/


Martin Blumenstingl (1):
  ARM64: dts: meson-gx-p23x-q20x: move the wifi node to each board's
    .dts

 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  | 5 -----
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts | 7 +++++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dts | 7 +++++++
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts       | 7 +++++++
 arch/arm64/boot/dts/amlogic/meson-gxm-q201.dts       | 7 +++++++
 5 files changed, 28 insertions(+), 5 deletions(-)

-- 
2.18.0
