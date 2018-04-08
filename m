From: sjg@chromium.org (Simon Glass)
Date: Sun, 8 Apr 2018 09:50:40 -0400
Subject: [PATCH u-boot 2/2] ARM: meson: Add cpu info display for GX SoCs
In-Reply-To: <1522230877-21267-3-git-send-email-narmstrong@baylibre.com>
References: <1522230877-21267-1-git-send-email-narmstrong@baylibre.com>
 <1522230877-21267-3-git-send-email-narmstrong@baylibre.com>
Message-ID: <CAPnjgZ0w9v6_6Qiw0uzKzFcTOMThtcQ6C6Q0gnKfHnX9ZZihUQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

On 28 March 2018 at 05:54, Neil Armstrong <narmstrong@baylibre.com> wrote:
> The Amlogic SoCs have a registers containing the die revision
> and packaging type to determine the SoC family and package marketing
> name like S905X for the GXL SoC Family.
> This code is taken for the Linux meson-gx-socinfo driver and adapted
> to U-Boot printing.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm/include/asm/arch-meson/gx.h |   1 +
>  arch/arm/mach-meson/Makefile         |   2 +-
>  arch/arm/mach-meson/cpu_info.c       | 105 +++++++++++++++++++++++++++++++++++
>  configs/khadas-vim_defconfig         |   2 +-
>  configs/libretech-cc_defconfig       |   2 +-
>  configs/odroid-c2_defconfig          |   2 +-
>  configs/odroid_defconfig             |   1 +
>  configs/p212_defconfig               |   2 +-
>  8 files changed, 112 insertions(+), 5 deletions(-)
>  create mode 100644 arch/arm/mach-meson/cpu_info.c

Please can you use driver model's CPU interface for this?

Regards,
Simon
