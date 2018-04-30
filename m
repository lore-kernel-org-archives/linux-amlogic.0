From: linus.walleij@linaro.org (Linus Walleij)
Date: Mon, 30 Apr 2018 10:55:32 +0200
Subject: [PATCH 3/3] pinctrl: meson: meson8: add the RGMII RXD2/RXD3 and
 TXD2/TXD3 signals
In-Reply-To: <20180422105330.4712-4-martin.blumenstingl@googlemail.com>
References: <20180422105330.4712-1-martin.blumenstingl@googlemail.com>
 <20180422105330.4712-4-martin.blumenstingl@googlemail.com>
Message-ID: <CACRpkdbqvq4gp58F39VeHRFdwU+O7tDUBu7L_Vg7+ZKjUy2Vtw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, Apr 22, 2018 at 12:53 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> These are only available on the Meson8m2 SoC (which uses the same
> DesignWare Ethernet MAC as Meson8b).
> The "eth_tx_clk_50m" signal either provides a 50MHz clock for the RMII
> PHYs or the RGMII TX clock (as far as we know the frequency is
> controlled by the PRG_ETHERNET registers in the Ethernet MAC "glue" IP
> block).
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied with Kevin's ACK.

Yours,
Linus Walleij
