From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Tue, 25 Sep 2018 00:13:24 +0200
Subject: [PATCH 0/2] meson-saradc: preparations for temperature sensor support
Message-ID: <20180924221326.2871-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This is a follow-up of my previous series "meson-saradc: small code
improvements" from [0].

I broke these smaller patches out of my big "add support for the chip's
temperature sensor" patch to make that easier to review. That patch
will also depend on a change to the clock controller's dt-bindings on
Meson8, Meson8b and Meson8m2 - see my patch "dt-bindings: clock:
meson8b: use the registers from the HHI syscon" from [1].

I can also post an RFC version of the actual temperature sensor patches
if it makes the code-review of these smaller ones easier (so you see
the "big picture").


Regards
Martin


[0] https://www.spinics.net/lists/linux-iio/msg40632.html
[1] https://patchwork.kernel.org/patch/10539027/

Martin Blumenstingl (2):
  iio: adc: meson-saradc: do not use meson_sar_adc_iio_channels directly
  iio: adc: meson-saradc: use the address attribute from iio_chan_spec

 drivers/iio/adc/meson_saradc.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

-- 
2.19.0
