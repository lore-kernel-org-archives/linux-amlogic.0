From: robh@kernel.org (Rob Herring)
Date: Mon, 5 Nov 2018 16:16:15 -0600
Subject: [PATCH v2 1/2] dt-bindings: iio: adc: meson-saradc: add
 temperature sensor support
In-Reply-To: <20181103231024.659-2-martin.blumenstingl@googlemail.com>
References: <20181103231024.659-1-martin.blumenstingl@googlemail.com>
 <20181103231024.659-2-martin.blumenstingl@googlemail.com>
Message-ID: <20181105221615.GA5718@bogus>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun,  4 Nov 2018 00:10:23 +0100, Martin Blumenstingl wrote:
> The 32-bit Meson8 SoC can use the SAR ADC to read the chip temperature.
> This requires setting the correct TSC (temperature sensor coefficient),
> which is programmed into the eFuse during the manufacturing process.
> Meson8b and Meson8m2 are not supported yet because they have a 5-bit TSC
> and only the first four bits are stored inside the SAR ADC registers.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../devicetree/bindings/iio/adc/amlogic,meson-saradc.txt    | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
