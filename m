From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 26 Nov 2018 16:12:20 +0100
Subject: [PATCH] drm/meson: Fix an Alpha Primary Plane bug on Meson
 GXL/GXM SoCs
In-Reply-To: <20181123105417.18948-1-narmstrong@baylibre.com>
References: <20181123105417.18948-1-narmstrong@baylibre.com>
Message-ID: <7ab852a3-91a5-b84c-04b4-d2ea0ef653b8@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi All,

On 23/11/2018 11:54, Neil Armstrong wrote:
> On the Amlogic GXL & GXM SoCs, a bug occurs on the OSD1 primaty plane when
> alpha is used where the alpha is not aligned with the pixel content.
> 
> The woraround Amlogic implemented is to reset the OSD1 plane hardware
> block each time the plane is updated, solving the issue.
> 
> In the reset, we still need to save the content of 2 registers which
> depends on the status of the plane, in addition to reload the scaler
> conversion matrix at the same time.

This patch needs much more work, it creates some screen flickering and shaking
in 4k modes, which is not really good.

Neil

> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_crtc.c |  6 ++++++
>  drivers/gpu/drm/meson/meson_viu.c  | 27 +++++++++++++++++++++++++++
>  drivers/gpu/drm/meson/meson_viu.h  |  1 +
>  3 files changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
> index 75d97f1b2e8f..2f9dfb1d408f 100644
> --- a/drivers/gpu/drm/meson/meson_crtc.c
> +++ b/drivers/gpu/drm/meson/meson_crtc.c
> @@ -200,6 +200,12 @@ void meson_crtc_irq(struct meson_drm *priv)
>  
>  	/* Update the OSD registers */
>  	if (priv->viu.osd1_enabled && priv->viu.osd1_commit) {
> +
> +		/* Reset OSD1 at updates on GXL+ SoCs */
> +		if (meson_vpu_is_compatible(priv, "amlogic,meson-gxm-vpu") ||
> +		    meson_vpu_is_compatible(priv, "amlogic,meson-gxl-vpu"))
> +			meson_viu_reset(priv);
> +
>  		writel_relaxed(priv->viu.osd1_ctrl_stat,
>  				priv->io_base + _REG(VIU_OSD1_CTRL_STAT));
>  		writel_relaxed(priv->viu.osd1_blk0_cfg[0],
> diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
> index 2dffb987ec65..a41dd6cc343e 100644
> --- a/drivers/gpu/drm/meson/meson_viu.c
> +++ b/drivers/gpu/drm/meson/meson_viu.c
> @@ -296,6 +296,33 @@ static void meson_viu_load_matrix(struct meson_drm *priv)
>  				 true);
>  }
>  
> +/* VIU OSD1 Reset as workaround for GXL+ Alpha OSD Bug */
> +void meson_viu_reset(struct meson_drm *priv)
> +{
> +	uint32_t osd1_fifo_ctrl_stat, osd1_ctrl_stat2;
> +
> +	/* Save these 2 registers state */
> +	osd1_fifo_ctrl_stat = readl_relaxed(
> +				priv->io_base + _REG(VIU_OSD1_FIFO_CTRL_STAT));
> +	osd1_ctrl_stat2 = readl_relaxed(
> +				priv->io_base + _REG(VIU_OSD1_CTRL_STAT2));
> +
> +	/* Reset OSD1 */
> +	writel_bits_relaxed(BIT(0), BIT(0),
> +			    priv->io_base + _REG(VIU_SW_RESET));
> +	writel_bits_relaxed(BIT(0), 0,
> +			    priv->io_base + _REG(VIU_SW_RESET));
> +
> +	/* Rewrite these registers state lost in the reset */
> +	writel_relaxed(osd1_fifo_ctrl_stat,
> +		       priv->io_base + _REG(VIU_OSD1_FIFO_CTRL_STAT));
> +	writel_relaxed(osd1_ctrl_stat2,
> +		       priv->io_base + _REG(VIU_OSD1_CTRL_STAT2));
> +
> +	/* Reload the conversion matrix */
> +	meson_viu_load_matrix(priv);
> +}
> +
>  void meson_viu_init(struct meson_drm *priv)
>  {
>  	uint32_t reg;
> diff --git a/drivers/gpu/drm/meson/meson_viu.h b/drivers/gpu/drm/meson/meson_viu.h
> index 073b1910bd1b..e4a6e2fba8fb 100644
> --- a/drivers/gpu/drm/meson/meson_viu.h
> +++ b/drivers/gpu/drm/meson/meson_viu.h
> @@ -59,6 +59,7 @@
>  #define OSD_REPLACE_EN		BIT(14)
>  #define OSD_REPLACE_SHIFT	6
>  
> +void meson_viu_reset(struct meson_drm *priv);
>  void meson_viu_init(struct meson_drm *priv);
>  
>  #endif /* __MESON_VIU_H */
> 
