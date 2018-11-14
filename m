From: jagan@amarulasolutions.com (Jagan Teki)
Date: Wed, 14 Nov 2018 15:03:57 +0530
Subject: [U-Boot] [PATCH u-boot v2] spi: Add Amlogic Meson SPI Flash
 Controller driver
In-Reply-To: <7402e7f8-7501-d452-3625-cc82129f2947@baylibre.com>
References: <20181113104944.16800-1-narmstrong@baylibre.com>
 <CAMty3ZBM-qVrEyOZvpCd1QgbFwJSLnvqzZMjvgAD1mE+Zjqd_Q@mail.gmail.com>
 <7402e7f8-7501-d452-3625-cc82129f2947@baylibre.com>
Message-ID: <CAMty3ZD6k8TVHQ4qBFnhWYnD9dvBduxfrs+d7EXMPdTEx6SvWQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, Nov 14, 2018 at 2:54 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 14/11/2018 05:25, Jagan Teki wrote:
> > On Tue, Nov 13, 2018 at 4:20 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> The Amlogic Meson SoCs embeds a Flash oriented SPI Controller name SPIFC.
> >> This driver, ported from the Linux meson-spi-spifc driver, add support
> >> for this controller on the Amlogic Meson GX SoCs in U-Boot.
> >>
> >> [ported from linux version commit 2f58ea64bd8931bd7709732fe0a96e0bfb44a00b]
> >>
> >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >> ---
> >> Changes since v1 :
> >> - removed the meson_spifc_claim_bus/meson_spifc_release_bus enabling disabling
> >>   the clock and making register access with the clock disabled
> >>
> >>  drivers/spi/Kconfig       |   8 +
> >>  drivers/spi/Makefile      |   1 +
> >>  drivers/spi/meson_spifc.c | 335 ++++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 344 insertions(+)
> >>  create mode 100644 drivers/spi/meson_spifc.c
> >>
> >> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> >> index 516188ea88..6085788481 100644
> >> --- a/drivers/spi/Kconfig
> >> +++ b/drivers/spi/Kconfig
> >> @@ -116,6 +116,14 @@ config ICH_SPI
> >>           access the SPI NOR flash on platforms embedding this Intel
> >>           ICH IP core.
> >>
> >> +config MESON_SPIFC
> >> +       bool "Amlogic Meson SPI Flash Controller driver"
> >> +       depends on ARCH_MESON
> >> +       help
> >> +         Enable the Amlogic Meson SPI Flash Controller SPIFC) driver.
> >> +         This driver can be used to access the SPI NOR flash chips on
> >> +         Amlogic Meson SoCs.
> >> +
> >>  config MT7621_SPI
> >>         bool "MediaTek MT7621 SPI driver"
> >>         depends on ARCH_MT7620
> >> diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
> >> index 7242ea7e40..67b42daf4e 100644
> >> --- a/drivers/spi/Makefile
> >> +++ b/drivers/spi/Makefile
> >> @@ -31,6 +31,7 @@ obj-$(CONFIG_FSL_QSPI) += fsl_qspi.o
> >>  obj-$(CONFIG_ICH_SPI) +=  ich.o
> >>  obj-$(CONFIG_KIRKWOOD_SPI) += kirkwood_spi.o
> >>  obj-$(CONFIG_LPC32XX_SSP) += lpc32xx_ssp.o
> >> +obj-$(CONFIG_MESON_SPIFC) += meson_spifc.o
> >>  obj-$(CONFIG_MPC8XX_SPI) += mpc8xx_spi.o
> >>  obj-$(CONFIG_MPC8XXX_SPI) += mpc8xxx_spi.o
> >>  obj-$(CONFIG_MT7621_SPI) += mt7621_spi.o
> >> diff --git a/drivers/spi/meson_spifc.c b/drivers/spi/meson_spifc.c
> >> new file mode 100644
> >> index 0000000000..df516d3e4c
> >> --- /dev/null
> >> +++ b/drivers/spi/meson_spifc.c
> >> @@ -0,0 +1,335 @@
> >> +// SPDX-License-Identifier: GPL-2.0+
> >> +/*
> >> + * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
> >> + * Copyright (C) 2018 BayLibre, SAS
> >> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> >> + *
> >> + * Amlogic Meson SPI Flash Controller driver
> >> + */
> >> +
> >> +#include <common.h>
> >> +#include <spi.h>
> >> +#include <clk.h>
> >> +#include <dm.h>
> >> +#include <regmap.h>
> >> +#include <errno.h>
> >> +#include <asm/io.h>
> >> +#include <linux/bitfield.h>
> >> +
> >> +/* register map */
> >> +#define REG_CMD                        0x00
> >> +#define REG_ADDR               0x04
> >> +#define REG_CTRL               0x08
> >> +#define REG_CTRL1              0x0c
> >> +#define REG_STATUS             0x10
> >> +#define REG_CTRL2              0x14
> >> +#define REG_CLOCK              0x18
> >> +#define REG_USER               0x1c
> >> +#define REG_USER1              0x20
> >> +#define REG_USER2              0x24
> >> +#define REG_USER3              0x28
> >> +#define REG_USER4              0x2c
> >> +#define REG_SLAVE              0x30
> >> +#define REG_SLAVE1             0x34
> >> +#define REG_SLAVE2             0x38
> >> +#define REG_SLAVE3             0x3c
> >> +#define REG_C0                 0x40
> >> +#define REG_B8                 0x60
> >> +#define REG_MAX                        0x7c
> >> +
> >> +/* register fields */
> >> +#define CMD_USER               BIT(18)
> >> +#define CTRL_ENABLE_AHB                BIT(17)
> >> +#define CLOCK_SOURCE           BIT(31)
> >> +#define CLOCK_DIV_SHIFT                12
> >> +#define CLOCK_DIV_MASK         (0x3f << CLOCK_DIV_SHIFT)
> >> +#define CLOCK_CNT_HIGH_SHIFT   6
> >> +#define CLOCK_CNT_HIGH_MASK    (0x3f << CLOCK_CNT_HIGH_SHIFT)
> >> +#define CLOCK_CNT_LOW_SHIFT    0
> >> +#define CLOCK_CNT_LOW_MASK     (0x3f << CLOCK_CNT_LOW_SHIFT)
> >> +#define USER_DIN_EN_MS         BIT(0)
> >> +#define USER_CMP_MODE          BIT(2)
> >> +#define USER_CLK_NOT_INV       BIT(7)
> >> +#define USER_UC_DOUT_SEL       BIT(27)
> >> +#define USER_UC_DIN_SEL                BIT(28)
> >> +#define USER_UC_MASK           ((BIT(5) - 1) << 27)
> >> +#define USER1_BN_UC_DOUT_SHIFT 17
> >> +#define USER1_BN_UC_DOUT_MASK  (0xff << 16)
> >> +#define USER1_BN_UC_DIN_SHIFT  8
> >> +#define USER1_BN_UC_DIN_MASK   (0xff << 8)
> >> +#define USER4_CS_POL_HIGH      BIT(23)
> >> +#define USER4_IDLE_CLK_HIGH    BIT(29)
> >> +#define USER4_CS_ACT           BIT(30)
> >> +#define SLAVE_TRST_DONE                BIT(4)
> >> +#define SLAVE_OP_MODE          BIT(30)
> >> +#define SLAVE_SW_RST           BIT(31)
> >> +
> >> +#define SPIFC_BUFFER_SIZE      64
> >> +
> >> +struct meson_spifc_priv {
> >> +       struct regmap                   *regmap;
> >> +       struct clk                      clk;
> >> +};
> >> +
> >> +/**
> >> + * meson_spifc_wait_ready() - wait for the current operation to terminate
> >> + * @spifc:     the Meson SPI device
> >> + * Return:     0 on success, a negative value on error
> >> + */
> >> +static int meson_spifc_wait_ready(struct meson_spifc_priv *spifc)
> >> +{
> >> +       u32 data;
> >> +       ulong tbase = get_timer(0);
> >> +
> >> +       do {
> >> +               regmap_read(spifc->regmap, REG_SLAVE, &data);
> >> +               if (data & SLAVE_TRST_DONE)
> >> +                       return 0;
> >> +       } while (get_timer(tbase) < 5 * CONFIG_SYS_HZ);
> >> +
> >> +       return -ETIMEDOUT;
> >> +}
> >
> > I believe we can do this wait_for_bit*, otherwise all look fine for me.
> >
>
> Sure, but we need a regmap variant !
>
> Linux has regmap_read_poll_timeout() for this, but could be imported for future use.

Sure you can import, no issues.
