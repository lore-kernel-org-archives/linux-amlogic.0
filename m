From: jbrunet@baylibre.com (Jerome Brunet)
Date: Fri, 16 Nov 2018 10:39:36 +0100
Subject: [PATCH v2 0/2] arm64: dts: meson: add Libretech aml-s805x-ac support
Message-ID: <20181116093938.26373-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patchset adds support for the libretech aml-s805x-ac, aka 'La Frite'

Changes since v1: [0]
 * Update gpio line names to align on Neil's recent series [1]
 * fix typo in comment

[0]: https://lkml.kernel.org/r/20181114101925.10526-1-jbrunet at baylibre.com
[1]: https://lkml.kernel.org/r/1541587550-17842-1-git-send-email-narmstrong at baylibre.com

Jerome Brunet (1):
  dt-bindings: arm: amlogic: add libretech aml-s805x-ac bindings

Neil Armstrong (1):
  arm64: dts: meson: add libretech aml-s805x-ac board

 .../devicetree/bindings/arm/amlogic.txt       |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-gxl-s805x-libretech-ac.dts  | 248 ++++++++++++++++++
 3 files changed, 250 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts

-- 
2.19.1
