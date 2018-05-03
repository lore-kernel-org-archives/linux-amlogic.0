From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Thu, 3 May 2018 19:06:35 +0200
Subject: [PATCH 0/1] Meson8b RGMII Ethernet pin cleanup
In-Reply-To: <20180501220045.2004-1-martin.blumenstingl@googlemail.com>
References: <20180501220045.2004-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180503170635.GA1925@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Martin,

the patch seems to work fine but I have two questions.

First, should we remove those pins from "ethernet_groups" structure
in "drivers/pinctrl/meson/pinctrl-meson8b.c" ?

Second, following the Odroid-C1+ schematics there are two pins,
"eth_rxd2" and "eth_rxd3" which are not configured by the pin controller
driver, nor included in the pins group in the relative device tree.
Should we configure and include them ?

Thanks,

Emiliano

On Wed, May 02, 2018 at 12:00:44AM +0200, Martin Blumenstingl wrote:
> Hi Emiliano, Hi Linus,
>
> could you please test the patch from this series on your Odroid-C1?
> I tested it on mine and Ethernet seems to be working fine with it.
>
> There should be no functional changes with this patch as it just
> removes an incorrect pad configuration for DIF_2_P and DIF_2_N for
> the TXD0 and TXD1 signal (as these are routed to GPIOH_5 and GPIOH_6
> on Odroid-C1).
>
>
> Martin Blumenstingl (1):
>   ARM: dts: meson8b: RGMII doesn't use the eth_txd1_1 and eth_txd0_1
>     pins
>
>  arch/arm/boot/dts/meson8b.dtsi | 2 --
>  1 file changed, 2 deletions(-)
>
> --
> 2.17.0
>
