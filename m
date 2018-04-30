From: linus.walleij@linaro.org (Linus Walleij)
Date: Mon, 30 Apr 2018 10:54:20 +0200
Subject: [PATCH 2/3] pinctrl: meson: meson8: add support for the Meson8m2
 SoC
In-Reply-To: <20180422105330.4712-3-martin.blumenstingl@googlemail.com>
References: <20180422105330.4712-1-martin.blumenstingl@googlemail.com>
 <20180422105330.4712-3-martin.blumenstingl@googlemail.com>
Message-ID: <CACRpkdb+tS_7B+k+Fir71EPavu-1iZOhYJb3aQ2xr2MMtfUwzQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, Apr 22, 2018 at 12:53 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> Add Meson8m2 support to the existing Meson8 pinctrl driver. Since there
> are only very few changes (Meson8m2 has an extra signal on 10 CBUS pins,
> no other differences were found so far).
> Add the new compatible strings for Meson8m2 to the existing Meson8
> driver so we don't have to duplicate the whole driver.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied with Kevin's ACK.

Yours,
Linus Walleij
