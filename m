From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed, 2 May 2018 00:03:14 +0200
Subject: [PATCH 0/1] Meson8b RGMII Ethernet pin cleanup
In-Reply-To: <20180501220045.2004-1-martin.blumenstingl@googlemail.com>
References: <20180501220045.2004-1-martin.blumenstingl@googlemail.com>
Message-ID: <CAFBinCDVbZPU6dfYMwHhvS78LU9Pg5nOfwUfzHgOoOt6QUPw6Q@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, May 2, 2018 at 12:00 AM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> Hi Emiliano, Hi Linus,
>
> could you please test the patch from this series on your Odroid-C1?
> I tested it on mine and Ethernet seems to be working fine with it.
I forgot to mention: if you want to test this with v4.17-rc3 then you
need the following patches on top of v4.17-rc3:
- clk: meson: meson8b: fix meson8b_fclk_div3_div clock name [0]
- clk: meson: meson8b: fix meson8b_cpu_clk parent clock name [1]
- clk: meson: meson8b: mark fclk_div gate clocks as CLK_IS_CRITICAL [2]

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


[0] https://patchwork.kernel.org/patch/10354473/
[1] https://patchwork.kernel.org/patch/10358009/
[2] https://patchwork.kernel.org/patch/10374537/
