From: hs@denx.de (Heiko Schocher)
Date: Mon, 20 Nov 2017 13:39:21 +0100
Subject: [PATCH 1/2] i2c: add Amlogic Meson driver
In-Reply-To: <20171029090901.24299-2-b.galvani@gmail.com>
References: <20171029090901.24299-1-b.galvani@gmail.com>
 <20171029090901.24299-2-b.galvani@gmail.com>
Message-ID: <2b885b34-1b23-034a-37d9-256100e1d13b@denx.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hello Beniamino,

Am 29.10.2017 um 10:09 schrieb Beniamino Galvani:
> Add a driver for the I2C controller available on Amlogic Meson SoCs.
> 
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>   arch/arm/include/asm/arch-meson/i2c.h |  11 ++
>   drivers/i2c/Kconfig                   |   6 +
>   drivers/i2c/Makefile                  |   1 +
>   drivers/i2c/meson_i2c.c               | 263 ++++++++++++++++++++++++++++++++++
>   4 files changed, 281 insertions(+)
>   create mode 100644 arch/arm/include/asm/arch-meson/i2c.h
>   create mode 100644 drivers/i2c/meson_i2c.c

Applied to u-boot-i2c master

Thanks!

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs at denx.de
