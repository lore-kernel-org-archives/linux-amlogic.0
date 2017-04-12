From: ulf.hansson@linaro.org (Ulf Hansson)
Date: Wed, 12 Apr 2017 16:11:38 +0200
Subject: [PATCH 0/2] mmc: meson-gx: add basic tuning
In-Reply-To: <1d60ec2c-54c9-6b1c-7eaa-40e96fcd5be5@gmail.com>
References: <1d60ec2c-54c9-6b1c-7eaa-40e96fcd5be5@gmail.com>
Message-ID: <CAPDyKFo17FaKET6_irR7ybQDq3kKT1YProXnS=gouF+9Mk2FLw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 4 April 2017 at 20:58, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> With a 128GB Hardkernel eMMC card my Odroid C2 boots up to 60MHz only
> (tons of CRC errors otherwise). I made some tests and with changed
> clock phase configuration it runs rock-solid with 200 MHz.
> Changing the clock phase configuration in general most likely wouldn't
> be a good idea as this might break other combinations of MMC device and
> speed.
> Therefore add basic tuning. So far it changes the rx clock phase only
> as default core and tx clock phase work fine.
>
> Heiner Kallweit (2):
>   mmc: meson-gx: introduce struct meson_tuning_params
>   mmc: meson-gx: add basic tuning for rx clock phase
>
>  drivers/mmc/host/meson-gx-mmc.c | 66 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 65 insertions(+), 1 deletion(-)
>
> --
> 2.12.1
>

Thanks, applied for next!

Kind regards
Uffe
