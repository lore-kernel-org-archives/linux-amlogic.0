From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 26 Jun 2018 10:06:38 +0200
Subject: [PATCH 1/1] ARM64: dts: meson: enable the saradc node in
 meson-gx-p23x-q20x.dtsi
In-Reply-To: <20180623145959.445-2-martin.blumenstingl@googlemail.com>
References: <20180623145959.445-1-martin.blumenstingl@googlemail.com>
 <20180623145959.445-2-martin.blumenstingl@googlemail.com>
Message-ID: <eaa16e60-12af-bfd7-308f-af8e32747a69@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 23/06/2018 16:59, Martin Blumenstingl wrote:
> meson-gxl-s905d-p230.dts and meson-gxm-q200.dts enable the saradc node
> (and configure it's vref-supply "VDDIO_AO18") in their corresponding
> .dts file.
> Move both (the saradc node as well as the VDDIO_AO18 regulator) to
> remove some duplicate code.
> 
> As a positive side-effect this enables the saradc also for the P231 (GXL
> S905D) and Q201 (GXM S912) development boards which are similar to the
> P230/Q200 boards (P231 and Q201 use the internal 100Mbit/s PHY, while
> P230 and Q200 have an external RGMII PHY).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  | 12 ++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts | 12 ------------
>  arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts       | 12 ------------
>  3 files changed, 12 insertions(+), 24 deletions(-)
> 
[...]

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
