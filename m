From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed, 25 Apr 2018 14:02:44 +0200
Subject: [PATCH v4 2/2] clk: meson: meson8b: add support for the NAND
 clocks
In-Reply-To: <20180423193509.30584-3-martin.blumenstingl@googlemail.com>
References: <20180423193509.30584-1-martin.blumenstingl@googlemail.com>
 <20180423193509.30584-3-martin.blumenstingl@googlemail.com>
Message-ID: <1524657764.4026.62.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, 2018-04-23 at 21:35 +0200, Martin Blumenstingl wrote:
> This adds the NAND clocks (from the HHI_NAND_CLK_CNTL register) to the
> Meson8b clock driver. There are three NAND clocks: a gate which enables
> or disables the NAND clock, a mux and a divider (which divides the mux
> output).
> Unfortunately the public S805 datasheet does not document the mux
> parents. However, the vendor kernel has a few hints for us which allows
> us to make an educated guess about the clock parents. To do this we need
> to have a look at set_nand_core_clk() from the vendor's NAND driver (see
> [0]):
> - XTAL = (4<<9) | (1<<8) | 0
> - 160MHz = (0<<9) | (1<<8) | 3)
> - 182MHz = (3<<9) | (1<<8) | 1)
> - 212MHz = (1<<9) | (1<<8) | 3)
> - 255MHz = (2<<9) | (1<<8) | 1)
> 
> While there is a comment for the XTAL parent (which indicates that it
> should only be used for debugging) we have to do a bit of math for the
> other parents: target_freq * divider = rate of parent clock
> Bit 8 above is the enable bit, so we can ignore it here. Bits 11:9 are
> the mux index and bits 6:0 are the 0-based divider (so we need to add
> 1). This gives us:
> - mux 0 (160MHz * 4) = fclk_div4 (actual rate = 637.5MHz, off by 2.5MHz)
> - mux 1 (212MHz * 4) = fclk_div3 (actual rate = 850MHz, off by 2MHz)
> - mux 2 (255MHz * 2) = fclk_div5 (matches exactly 510MHz)
> - mux 3 (182MHz * 2) = fclk_div7 (actual rate = 346.3MHz, off by 0.3MHz)
> 
> [0] https://github.com/khadas/linux/blob/9587681285cb/drivers/amlogic/amlnf/dev/amlnf_ctrl.c#L314
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

applied to next/drivers
Thx
