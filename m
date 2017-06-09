From: linus.walleij@linaro.org (Linus Walleij)
Date: Fri, 9 Jun 2017 09:25:54 +0200
Subject: [PATCH] pinctrl: meson-gxbb: remove non-existing pin GPIOX_22
In-Reply-To: <77ac1caf-f2b1-efe8-70ea-5a358908cc87@gmail.com>
References: <77ac1caf-f2b1-efe8-70ea-5a358908cc87@gmail.com>
Message-ID: <CACRpkdY4beiDkj+EEe5qzSHeNEU03cRqXkEXwKOHf-EKxdh2ug@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, Jun 7, 2017 at 7:44 AM, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> After commit 34e61801a3b9 "pinctrl: meson-gxbb: Add missing GPIODV_18
> pin entry" I started to get the following warning:
>
> "meson-pinctrl c8834000.periphs:pinctrl at 4b0: names 119 do not match
> number of GPIOs 120"
>
> It turned out that not the mentioned commit has a problem, it just
> revealed another problem which had existed before.
>
> There is no PIN GPIOX_22 on Meson GXBB.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Patch applied with Neil's tags.

Yours,
Linus Walleij
