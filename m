From: jic23@kernel.org (Jonathan Cameron)
Date: Sun, 11 Jun 2017 15:01:46 +0100
Subject: [PATCH] iio: adc: meson-saradc: fix potential crash in
 meson_sar_adc_clear_fifo
In-Reply-To: <20170604132823.21928-1-martin.blumenstingl@googlemail.com>
References: <20170604132823.21928-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170611150146.67423c44@kernel.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun,  4 Jun 2017 15:28:23 +0200
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> meson_sar_adc_clear_fifo passes a 0 as value-pointer to regmap_read().
> In case of the meson-saradc driver this ends up in regmap_mmio_read(),
> where the value-pointer is de-referenced unconditionally to assign the
> value which was read.
> Fix this by passing an actual pointer, even though all we want to do is
> to discard the value.
> 
> As a side-effect this fixes a sparse warning ("Using plain integer as
> NULL pointer") as reported by Paolo Cretaro.
> 
> Fixes: 3adbf3427330 ("iio: adc: add a driver for the SAR ADC found in Amlogic Meson SoCs")
> Reported-by: Paolo Cretaro <paolocretaro@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Applied to the fixes-togreg branch of iio.git.

Thanks,

Jonathan
> ---
>  drivers/iio/adc/meson_saradc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index 81cd39a57fe3..83da50ed73ab 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -475,13 +475,13 @@ static void meson_sar_adc_unlock(struct iio_dev *indio_dev)
>  static void meson_sar_adc_clear_fifo(struct iio_dev *indio_dev)
>  {
>  	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
> -	int count;
> +	unsigned int count, tmp;
>  
>  	for (count = 0; count < MESON_SAR_ADC_MAX_FIFO_SIZE; count++) {
>  		if (!meson_sar_adc_get_fifo_count(indio_dev))
>  			break;
>  
> -		regmap_read(priv->regmap, MESON_SAR_ADC_FIFO_RD, 0);
> +		regmap_read(priv->regmap, MESON_SAR_ADC_FIFO_RD, &tmp);
>  	}
>  }
>  
