From: yangxuan8282@gmail.com (He Yangxuan)
Date: Mon, 5 Nov 2018 00:01:22 +0800
Subject: [PATCH v2 0/3] arm64: dts: meson-gxl: add support for phicomm n1
Message-ID: <20181104160122.rju4bzckhi2sy3vf@raspberrypi>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch adds support for the Phicomm N1. This device based on P230 reference design.
The phy is RTL8211F, need to disable Energy Efficient Ethernet (EEE) to make it stable.
And this box doesn't have cvbs, so disable related section in device tree.

Changes since v1:
 - rewrite external phy section
 - add phicomm vendor prefix
 - add phicomm n1 in Documentation/devicetree/bindings/arm/amlogic.txt

He Yangxuan (3):
  arm64: dts: meson-gxl: add support for phicomm n1
  dt-bindings: Add vendor prefix for PHICOMM Co., Ltd.
  dt-bindings: arm: amlogic: Add Phicomm N1

 Documentation/devicetree/bindings/arm/amlogic.txt  |  1 +
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 arch/arm64/boot/dts/amlogic/Makefile               |  1 +
 .../dts/amlogic/meson-gxl-s905d-phicomm-n1.dts     | 26 ++++++++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts

-- 
2.11.0
