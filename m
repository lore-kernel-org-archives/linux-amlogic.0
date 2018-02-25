From: jbrunet@baylibre.com (Jerome Brunet)
Date: Sun, 25 Feb 2018 15:10:07 +0100
Subject: [PATCH v2 1/2] pinctrl: meson: meson8b: fix requesting GPIOs
 greater than GPIOZ_3
In-Reply-To: <20180225113854.20731-3-martin.blumenstingl@googlemail.com>
References: <20180225113854.20731-1-martin.blumenstingl@googlemail.com>
 <20180225113854.20731-3-martin.blumenstingl@googlemail.com>
Message-ID: <1519567807.4619.1.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, 2018-02-25 at 12:38 +0100, Martin Blumenstingl wrote:
> Reported-by: Linus L?ssing <linus.luessing@c0d3.blue>
> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Well done !
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>


> ---
>  drivers/pinctrl/meson/pinctrl-meson8b.c |  20 +++---
>  include/dt-bindings/gpio/meson8b-gpio.h | 121 ++++++++++++++++++++++++++++----
>  2 files changed, 120 insertions(+), 21 deletions(-)
