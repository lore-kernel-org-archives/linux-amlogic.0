From: afaerber@suse.de (=?UTF-8?Q?Andreas_F=c3=a4rber?=)
Date: Thu, 8 Jun 2017 15:49:34 +0200
Subject: [PATCH] pinctrl: meson-gxl: add tsin_a pins
In-Reply-To: <20170608130948.16426-1-jbrunet@baylibre.com>
References: <20170608130948.16426-1-jbrunet@baylibre.com>
Message-ID: <ed2befab-728b-6165-a86b-deb92f220996@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 08.06.2017 um 15:09 schrieb Jerome Brunet:
> Add Tsin A pins to bank DV and X.
> We don't have a driver for the tsin yet but since the tsin A pinmux is
> enabled by default at boot time, declaring this pinmux is required to
> properly operate on GPIOX.
> 
> Without this change, GPIOX 8, 9, 10 and 11 can't be driven as GPIO output
> as the tsin A seems to have priority.

Should this get a Fixes header then for stable backports?

> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson-gxl.c | 36 +++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)

Looks OK AFAICT.

Cheers,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N?rnberg, Germany
GF: Felix Imend?rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N?rnberg)
