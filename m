From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed, 14 Nov 2018 11:19:23 +0100
Subject: [PATCH 0/2] arm64: dts: meson: add Libretech aml-s805x-ac support
Message-ID: <20181114101925.10526-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patchset adds support for the libretech aml-s805x-ac, aka 'La Frite'

Jerome Brunet (1):
  dt-bindings: arm: amlogic: add libretech aml-s805x-ac bindings

Neil Armstrong (1):
  arm64: dts: meson: add libretech aml-s805x-ac board

 .../devicetree/bindings/arm/amlogic.txt       |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-gxl-s805x-libretech-ac.dts  | 249 ++++++++++++++++++
 3 files changed, 251 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts

-- 
2.19.1
