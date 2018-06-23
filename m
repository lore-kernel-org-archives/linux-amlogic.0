From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 23 Jun 2018 16:59:58 +0200
Subject: [PATCH 0/1] enable the SAR ADC for all boards based on P23x and Q20x
Message-ID: <20180623145959.445-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This is compile-tested only - the goal is to remove some duplicate code
between the P230 and Q200 boards.
As a positive side-effect we also enable the SAR ADC on the P231 and Q201
boards (the only difference to the P230 and Q200 boards seems to be that
P230 and Q200 use an external RGMII Ethernet PHY, while P231 and Q201 use
the internal PHY).


Martin Blumenstingl (1):
  ARM64: dts: meson: enable the saradc node in meson-gx-p23x-q20x.dtsi

 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  | 12 ++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts | 12 ------------
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts       | 12 ------------
 3 files changed, 12 insertions(+), 24 deletions(-)

-- 
2.18.0
