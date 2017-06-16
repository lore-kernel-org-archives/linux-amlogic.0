From: linus.walleij@linaro.org (Linus Walleij)
Date: Fri, 16 Jun 2017 11:10:05 +0200
Subject: [PATCH] pinctrl: meson-gxl: add tsin_a pins
In-Reply-To: <20170608130948.16426-1-jbrunet@baylibre.com>
References: <20170608130948.16426-1-jbrunet@baylibre.com>
Message-ID: <CACRpkdYftJ5a+VDpJ2J8sFD6Cdt22k9w4GvnOz7GVy=VoehqhQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Jun 8, 2017 at 3:09 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> Add Tsin A pins to bank DV and X.
> We don't have a driver for the tsin yet but since the tsin A pinmux is
> enabled by default at boot time, declaring this pinmux is required to
> properly operate on GPIOX.
>
> Without this change, GPIOX 8, 9, 10 and 11 can't be driven as GPIO output
> as the tsin A seems to have priority.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Patch applied with Neil's ACK.

Yours,
Linus Walleij
