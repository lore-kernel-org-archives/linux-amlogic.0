From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 30 Nov 2018 11:26:41 +0100
Subject: [PATCH v3] ARM: meson: Add regmap support for clock driver
In-Reply-To: <20181127164118.20715-1-ldevulder@suse.de>
References: <20181127164118.20715-1-ldevulder@suse.de>
Message-ID: <a796c3df-0e92-68ce-e263-54dc968f0837@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Loic,

On 27/11/2018 17:41, Loic Devulder wrote:
> This patch modifies the meson clock driver to use syscon/regmap like
> the Linux kernel does, as it is needed if we want to share the same
> DTS files.
> 
> DTS files are synchronized from Linux 4.19.
> 
> Signed-off-by: Loic Devulder <ldevulder@suse.de>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> 
> Note: this patch needs to be merged *after* the whole
> 'u-boot-amlogic-20181126' changes!
> 
> Successfully tested on khadas-vim, khadas-vim2 and libretech-cc (Le
> Potato) boards.
> 
> Changes in v3:
> - SYSCON is already set in MESON64_COMMON by the big Amlogic patchset
> from Neil
> - merged clock and DTS update commits, as these changes need to be done
> at the same time
> Changes in v2:
> - rebased on the "Amlogic Meson cleanup for AXG SoC support" patchset
> from Neil
> 
>  arch/arm/dts/meson-gx.dtsi                    | 31 +++++++++++---
>  arch/arm/dts/meson-gxbb-nanopi-k2.dts         | 48 ++++++++++++++++++++++
>  arch/arm/dts/meson-gxbb.dtsi                  | 14 ++++---
>  arch/arm/dts/meson-gxl-mali.dtsi              |  2 +-
>  arch/arm/dts/meson-gxl-s905x-libretech-cc.dts |  5 +--
>  arch/arm/dts/meson-gxl-s905x-p212.dtsi        |  8 ++--
>  arch/arm/dts/meson-gxl.dtsi                   | 26 +++++-------
>  arch/arm/dts/meson-gxm-khadas-vim2.dts        | 24 +++++++++++
>  drivers/clk/clk_meson.c                       | 59 ++++++++++++++-------------
>  9 files changed, 151 insertions(+), 66 deletions(-)
> 

[...]
Applied,

thanks !

Neil
