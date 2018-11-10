From: yangxuan8282@gmail.com (He Yangxuan)
Date: Sat, 10 Nov 2018 11:01:00 +0800
Subject: [PATCH v4 0/3] arm64: dts: meson-gxl: add support for phicomm n1
Message-ID: <20181110030103.4091-1-yangxuan8282@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch adds support for the Phicomm N1. This device based on P230 reference design.
The phy is RTL8211F, need to disable Energy Efficient Ethernet (EEE) to make it stable.
And this box doesn't have cvbs, so disable related section in device tree.

Changes since v3:
 - remove external phy from device tree, will disable EEE in meson-gxl-s905d-p230.dts

Changes since v2:
 - remove changes section in commit message
 - add commit message for patch of vendor prefix and bindings documentation

Changes since v1:
 - rewrite external phy section
 - add phicomm vendor prefix
 - add phicomm n1 in Documentation/devicetree/bindings/arm/amlogic.txt

He Yangxuan (3):
  arm64: dts: meson-gxl: add support for phicomm n1
  dt-bindings: Add vendor prefix for PHICOMM Co., Ltd.
  dt-bindings: arm: amlogic: Add Phicomm N1

 Documentation/devicetree/bindings/arm/amlogic.txt     | 1 +
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 arch/arm64/boot/dts/amlogic/Makefile                  | 1 +
 3 files changed, 3 insertions(+)

-- 
2.11.0
