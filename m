From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 15 Jan 2018 13:45:33 +0100
Subject: [RFT net-next v4 3/5] net: stmmac: dwmac-meson8b: fix internal
 RGMII clock configuration
In-Reply-To: <CAFBinCDCFAY3Mh7Oo3c-yUeRMBhReRjpqGCCadkWq=yqFFnqtg@mail.gmail.com>
References: <20180114214858.7217-1-martin.blumenstingl@googlemail.com>
 <20180114214858.7217-4-martin.blumenstingl@googlemail.com>
 <1516016986.2608.16.camel@baylibre.com>
 <CAFBinCDCFAY3Mh7Oo3c-yUeRMBhReRjpqGCCadkWq=yqFFnqtg@mail.gmail.com>
Message-ID: <1516020333.2608.24.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, 2018-01-15 at 13:08 +0100, Martin Blumenstingl wrote:
> can you share your thoughts how to do this?
> I can devm_kzalloc the memory for struct clk_mux, clk_divider and
> clk_fixed_factor in the function which registers these clocks. but I
> cannot declare them on the stack, because the clk-* implementations
> still need it during runtime

You can declare the init_data on the stack, CCF makes a copy of what it needs.
For clk_mux, clk_gate and friends, yes, use devm functions is the way to go

For the struct *clk, you can also use devm. Just keep a reference on the leaf
clock to be able to call set_rate() and prepare_enable(). You don't need the
rest.

> this would leave us with only the struct clk instances in meson8_dwmac

You may have a look at drivers/mmc/host/meson-gx-mmc.c. The clock scheme of this
IP is actually very clock the ethernet one.

Cheers
