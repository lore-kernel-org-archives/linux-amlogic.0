From: ulf.hansson@linaro.org (Ulf Hansson)
Date: Fri, 24 Mar 2017 08:27:59 +0100
Subject: [PATCH 0/5] mmc: meson-gx: add cmd23 and descriptor chain mode
In-Reply-To: <f1f8dae2-e976-4d42-99dc-34d08cb3d628@gmail.com>
References: <f1f8dae2-e976-4d42-99dc-34d08cb3d628@gmail.com>
Message-ID: <CAPDyKFrE97s3LohQDspy+9qDRfxC+ybcY_3FdLqpXupitqN2jw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 15 March 2017 at 20:16, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> Apart from three minor improvements this patch series adds support
> for CMD23 mode and switches the driver to descriptor chain mode.
>
> On my system with a 128GB eMMC card this increased the read
> performance from 10 - 15 MB/s to 140 MB/s.
>
> Successfully tested on a Odroid C2 with custom uboot based on recent
> mainline uboot. Behavior might be different with vendor uboot.
>
> Heiner Kallweit (5):
>   mmc: meson-gx: switch irq name to DT node name
>   mmc: meson-gx: improve response reading
>   mmc: meson-gx: use block mode also for just one block
>   mmc: meson-gx: add support for CMD23 mode
>   mmc: meson-gx: switch to descriptor chain mode
>
>  drivers/mmc/host/meson-gx-mmc.c | 258 ++++++++++++++++++++++------------------
>  1 file changed, 142 insertions(+), 116 deletions(-)
>
> --
> 2.12.0
>

Heiner,

As I just applied the series for the "small refactoring", how do you
want me to handle this one. Is it safe to apply on top or do you need
to re-base it?

Kind regards
Uffe
