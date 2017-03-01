From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 01 Mar 2017 10:01:55 -0800
Subject: [PATCH 0/4] mmc: add pwrseq-based hw_reset
In-Reply-To: <db739bb8-2ad1-75bb-0b65-8246f84da7e8@gmail.com> (Heiner
 Kallweit's message of "Wed, 8 Feb 2017 22:45:52 +0100")
References: <db739bb8-2ad1-75bb-0b65-8246f84da7e8@gmail.com>
Message-ID: <m2lgsozxik.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Ulf,

Heiner Kallweit <hkallweit1@gmail.com> writes:

> For implementing ops hw_reset in struct meson_host_ops often we can
> use what is available in pwrseq already, just with a small extension.
> For example all existing pwrseq drivers parse DT for a reset GPIO.

Do you have any thoughts on this series?

Kevin

> Meson GX is the first user of this extension.
>
> Heiner Kallweit (4):
>   mmc: pwrseq: add op reset to struct mmc_pwrseq_ops
>   mmc: pwrseq: implement reset operation in pwrseq_emmc
>   mmc: meson-gx: add pwrseq-based hw_reset
>   ARM64: dts: meson-gxbb-odroidc2: add hw-reset capability flag for emmc port
>
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 +
>  drivers/mmc/core/core.c                             | 6 ++++++
>  drivers/mmc/core/pwrseq.c                           | 8 ++++++++
>  drivers/mmc/core/pwrseq.h                           | 3 +++
>  drivers/mmc/core/pwrseq_emmc.c                      | 1 +
>  drivers/mmc/host/meson-gx-mmc.c                     | 1 +
>  include/linux/mmc/core.h                            | 1 +
>  7 files changed, 21 insertions(+)
