From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 29 Nov 2018 17:45:21 +0100
Subject: [PATCH 0/3] arm64: dts: meson: add clock controllers input clocks
Message-ID: <20181129164524.18670-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patchset is the first step that needs to be done so the
amlogic clock controllers properly claim their input clocks
through instead of relying on fixed names.

I'll be waiting for this hit mainline before sending the related
driver changes.

Jerome Brunet (3):
  dt-bindings: clk: meson: add ao controller clock inputs
  dt-bindings: clk: meson: add main controller clock input
  arm64: dts: meson: add clock controller clock inputs

 .../devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt     | 8 +++++++-
 .../devicetree/bindings/clock/amlogic,gxbb-clkc.txt       | 3 +++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi               | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                | 3 +++
 5 files changed, 19 insertions(+), 1 deletion(-)

-- 
2.19.1
