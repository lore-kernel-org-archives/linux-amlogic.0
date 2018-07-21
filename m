From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 21 Jul 2018 21:40:47 +0200
Subject: [PATCH 0/2] meson-saradc: add support for the Meson8m2 SoC
Message-ID: <20180721194049.23265-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This is a trivial series which adds Meson8m2 support to the Meson
SAR ADC driver.
A separate compatible string is required because typically Meson8m2
inherits all IP blocks from Meson8. The ADC part of the SAR ADC is
indeed compatible, but the temperature calibration logic (not
supported yet, but I am working on this) is incompatible with
the Meson8 implementation (instead it uses the same variant as
Meson8m2).


Martin Blumenstingl (2):
  dt-bindings: iio: adc: add Meson8m2 support
  iio: adc: meson-saradc: add support for the Meson8m2 SoCs

 .../devicetree/bindings/iio/adc/amlogic,meson-saradc.txt | 1 +
 drivers/iio/adc/meson_saradc.c                           | 9 +++++++++
 2 files changed, 10 insertions(+)

-- 
2.18.0
