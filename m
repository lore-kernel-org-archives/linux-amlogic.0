From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 21 Feb 2017 02:58:14 +0100
Subject: [PATCH 0/2] hwrng: meson: add clock handling
In-Reply-To: <00b2a4cc-686e-0cc0-43e8-552b70a1e868@gmail.com>
References: <00b2a4cc-686e-0cc0-43e8-552b70a1e868@gmail.com>
Message-ID: <cac8bb2c-1a78-c710-ee12-46532c3d8d2e@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 02/19/2017 09:30 PM, Heiner Kallweit wrote:
> The HW randon number generator requires a clock and we shouldn't rely
> on the boot loader to enable it.
> 
> Heiner Kallweit (2):
>   hwrng: meson: expose RNG0 clock via DT
>   hwrng: meson: add clock handling to driver
> 
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi   |  2 +-
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi |  5 +++++
>  drivers/char/hw_random/meson-rng.c          | 27 ++++++++++++++++++++++++++-
>  include/dt-bindings/clock/gxbb-clkc.h       |  1 +
>  4 files changed, 33 insertions(+), 2 deletions(-)
> 

Hi Heiner,

Thanks for the fix, but can you also update the dt-bindings document ?
Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt

I also think this clock should be optional, to keep driver working using old bindings, set the core_clk to NULL if not available, clock_prepare_enable and clock_disable_unprepare won't fail with a NULL clock

Neil
