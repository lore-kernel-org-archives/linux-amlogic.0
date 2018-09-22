From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 23 Sep 2018 00:20:59 +0200
Subject: [PATCH 0/3] meson-saradc: small code improvements
Message-ID: <20180922222102.12023-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The goal of this series is to simplify the code a bit.
This is a first preparation step for adding support for the temperature
sensor on the 32-bit Meson8, Meson8b and Meson8m2 SoCs later.


Martin Blumenstingl (3):
  iio: adc: meson-saradc: remove #define
    MESON_SAR_ADC_DELTA_10_TS_C_SHIFT
  iio: adc: meson-saradc: use of_device_get_match_data
  iio: adc: meson-saradc: simplify access to meson_sar_adc_param

 drivers/iio/adc/meson_saradc.c | 37 +++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 19 deletions(-)

-- 
2.19.0
