From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 2 Jan 2018 12:01:08 +0100
Subject: [RFC HACK 1/2] gpu: drm: meson: HACK - Meson8/Meson8b/Meson8m2
 support - WiP
In-Reply-To: <20180101213555.5519-2-martin.blumenstingl@googlemail.com>
References: <20180101213555.5519-1-martin.blumenstingl@googlemail.com>
 <20180101213555.5519-2-martin.blumenstingl@googlemail.com>
Message-ID: <7b8fc769-a91e-d836-51bc-57c69bfc8580@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Martin,

Thanks for the research !!!

Let me clarify this OSD1/2 stuff.

There is 2 OSD planes (that can get single-buffer input), and 2 Video plane that can get multi-planar video like YUV or NV12.
Only the OSD1 is enabled since it needs the Super Scaler in passthrought to automatically change the interlace field needed when you output in interlace mode on CVBS.

So :
- the OSD1 needs a CANVAS id where to get the data from, with other infos in the VIU_OSD1_BLK0_CFG_W0 reg
- the CANVAS id is only a logical id to define an entry in the CANVAS Manager where you can store every planes, so you only change the CANVAS ID in the VIU_OSD1_BLK0_CFG_W0 reg
- the Super Scaler needs a source to be configured from, my code is incorrect, I should not enable BIT(2), bits 0-1 should be 0
- The VPP_MISC register describes which OSD is enabled, and en eventual ordering, you may check in the kernel source if this register layout is the same

Looking at your code, you seem to still use ISD1, and only change a virtual logical CANVAS id, and you changed the Super Scaler register to use OSD2 as source, but it may be disabled.

Neil

On 01/01/2018 22:35, Martin Blumenstingl wrote:
> TODO:
> - canvas registers offsets on Meson8 / Meson8b are different
> - hardcoded register values
> - OSD2 is used for CVBS on Meson8 (at least on Meson8m2)
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/display/amlogic,meson-vpu.txt         | 18 +++++++++-----
>  drivers/gpu/drm/meson/meson_canvas.c               | 11 +++++++++
>  drivers/gpu/drm/meson/meson_canvas.h               |  4 ++--
>  drivers/gpu/drm/meson/meson_drv.c                  |  3 +++
>  drivers/gpu/drm/meson/meson_plane.c                |  5 ++--
>  drivers/gpu/drm/meson/meson_vclk.c                 | 21 ++++++++++++++--
>  drivers/gpu/drm/meson/meson_venc_cvbs.c            |  5 +++-
>  drivers/gpu/drm/meson/meson_viu.c                  |  5 +++-
>  drivers/gpu/drm/meson/meson_vpp.c                  | 28 ++++++++++++++++++++++
>  9 files changed, 86 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
> index 00f74bad1e95..f416cdc88f25 100644
> --- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
> @@ -53,6 +53,9 @@ VPU: Video Processing Unit
>  
>  Required properties:
>  - compatible: value should be different for each SoC family as :
> +	- Meson8 (S802) : "amlogic,meson8-vpu"
> +	- Meson8b (S805) : "amlogic,meson8b-vpu"
> +	- Meson8m2 (S812) : "amlogic,meson8m2-vpu"
>  	- GXBB (S905) : "amlogic,meson-gxbb-vpu"
>  	- GXL (S905X, S905D) : "amlogic,meson-gxl-vpu"
>  	- GXM (S912) : "amlogic,meson-gxm-vpu"
> @@ -72,12 +75,15 @@ bindings specified in Documentation/devicetree/bindings/graph.txt.
>  The following table lists for each supported model the port number
>  corresponding to each VPU output.
>  
> -		Port 0		Port 1
> ------------------------------------------
> - S905 (GXBB)	CVBS VDAC	HDMI-TX
> - S905X (GXL)	CVBS VDAC	HDMI-TX
> - S905D (GXL)	CVBS VDAC	HDMI-TX
> - S912 (GXM)	CVBS VDAC	HDMI-TX
> +			Port 0		Port 1
> +-----------------------------------------------------------
> + S802 (Meson8)		CVBS VDAC	not implemented yet
> + S805 (Meson8b)		CVBS VDAC	not implemented yet
> + S812 (Meson8m2)	CVBS VDAC	not implemented yet

Maybe N/A is better.

> + S905 (GXBB)		CVBS VDAC	HDMI-TX
> + S905X (GXL)		CVBS VDAC	HDMI-TX
> + S905D (GXL)		CVBS VDAC	HDMI-TX
> + S912 (GXM)		CVBS VDAC	HDMI-TX
>  
>  Example:
>  
> diff --git a/drivers/gpu/drm/meson/meson_canvas.c b/drivers/gpu/drm/meson/meson_canvas.c
> index 08f6073d967e..cc741d06ccc4 100644
> --- a/drivers/gpu/drm/meson/meson_canvas.c
> +++ b/drivers/gpu/drm/meson/meson_canvas.c
> @@ -43,6 +43,17 @@
>  #define CANVAS_LUT_WR_EN        (0x2 << 8)
>  #define CANVAS_LUT_RD_EN        (0x1 << 8)
>  
> +u8 meson_canvas_id_osd1(struct meson_drm *priv)
> +{
> +	if (meson_vpu_is_compatible(priv, "amlogic,meson8-vpu") ||
> +	    meson_vpu_is_compatible(priv, "amlogic,meson8b-vpu") ||
> +	    meson_vpu_is_compatible(priv, "amlogic,meson8m2-vpu")) {
> +		return 0x43; // HACK: OSD1 = 0x40, OSD2 = 0x43
> +	} else {
> +		return 0x4e;
> +	}
> +}

This canvas ID is purely logical and any number should work here, since this same number is used to update the OSD config register aswell.

> +
>  void meson_canvas_setup(struct meson_drm *priv,
>  			uint32_t canvas_index, uint32_t addr,
>  			uint32_t stride, uint32_t height,
> diff --git a/drivers/gpu/drm/meson/meson_canvas.h b/drivers/gpu/drm/meson/meson_canvas.h
> index af1759da4b27..4f594c8a6f80 100644
> --- a/drivers/gpu/drm/meson/meson_canvas.h
> +++ b/drivers/gpu/drm/meson/meson_canvas.h
> @@ -22,8 +22,6 @@
>  #ifndef __MESON_CANVAS_H
>  #define __MESON_CANVAS_H
>  
> -#define MESON_CANVAS_ID_OSD1	0x4e
> -
>  /* Canvas configuration. */
>  #define MESON_CANVAS_WRAP_NONE	0x00
>  #define	MESON_CANVAS_WRAP_X	0x01
> @@ -33,6 +31,8 @@
>  #define	MESON_CANVAS_BLKMODE_32x32	0x01
>  #define	MESON_CANVAS_BLKMODE_64x64	0x02
>  
> +u8 meson_canvas_id_osd1(struct meson_drm *priv);
> +
>  void meson_canvas_setup(struct meson_drm *priv,
>  			uint32_t canvas_index, uint32_t addr,
>  			uint32_t stride, uint32_t height,
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 3b804fdaf7a0..96c77498ef55 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -378,6 +378,9 @@ static int meson_drv_probe(struct platform_device *pdev)
>  };
>  
>  static const struct of_device_id dt_match[] = {
> +	{ .compatible = "amlogic,meson8-vpu" },
> +	{ .compatible = "amlogic,meson8b-vpu" },
> +	{ .compatible = "amlogic,meson8m2-vpu" },
>  	{ .compatible = "amlogic,meson-gxbb-vpu" },
>  	{ .compatible = "amlogic,meson-gxl-vpu" },
>  	{ .compatible = "amlogic,meson-gxm-vpu" },
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index 17e96fa47868..9d9a491c4eba 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -93,6 +93,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
>  		.x2 = state->crtc_x + state->crtc_w,
>  		.y2 = state->crtc_y + state->crtc_h,
>  	};
> +	u8 canvas_index = meson_canvas_id_osd1(priv);
>  	unsigned long flags;
>  
>  	/*
> @@ -109,7 +110,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
>  				   OSD_BLK0_ENABLE;
>  
>  	/* Set up BLK0 to point to the right canvas */
> -	priv->viu.osd1_blk0_cfg[0] = ((MESON_CANVAS_ID_OSD1 << OSD_CANVAS_SEL) |
> +	priv->viu.osd1_blk0_cfg[0] = ((canvas_index << OSD_CANVAS_SEL) |
>  				      OSD_ENDIANNESS_LE);
>  
>  	/* On GXBB, Use the old non-HDR RGB2YUV converter */
> @@ -164,7 +165,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
>  	/* Update Canvas with buffer address */
>  	gem = drm_fb_cma_get_gem_obj(fb, 0);
>  
> -	meson_canvas_setup(priv, MESON_CANVAS_ID_OSD1,
> +	meson_canvas_setup(priv, canvas_index,
>  			   gem->paddr, fb->pitches[0],
>  			   fb->height, MESON_CANVAS_WRAP_NONE,
>  			   MESON_CANVAS_BLKMODE_LINEAR);
> diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
> index 47677047e42d..1b1e379501d4 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.c
> +++ b/drivers/gpu/drm/meson/meson_vclk.c
> @@ -247,7 +247,20 @@ static void meson_venci_cvbs_clock_config(struct meson_drm *priv)
>  	unsigned int val;
>  
>  	/* Setup PLL to output 1.485GHz */
> -	if (meson_vpu_is_compatible(priv, "amlogic,meson-gxbb-vpu")) {
> +	if (meson_vpu_is_compatible(priv, "amlogic,meson8-vpu") ||
> +	    meson_vpu_is_compatible(priv, "amlogic,meson8b-vpu") ||
> +	    meson_vpu_is_compatible(priv, "amlogic,meson8m2-vpu")) {
> +#if 0
> +		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL, 0x2001042d);
> +		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL2, 0x814d3928);
> +		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL3, 0x6b425012);
> +		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL4, 0x00000110);
> +		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL, 0x0001042d);
> +#else

The HDMI PLL should also be totally different.

> +		/* TODO! */
> +		return;
> +#endif
> +	} else if (meson_vpu_is_compatible(priv, "amlogic,meson-gxbb-vpu")) {
>  		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL, 0x5800023d);
>  		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL2, 0x00404e00);
>  		regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL3, 0x0d5c5091);
> @@ -428,7 +441,11 @@ void meson_hdmi_pll_set(struct meson_drm *priv,
>  {
>  	unsigned int val;
>  
> -	if (meson_vpu_is_compatible(priv, "amlogic,meson-gxbb-vpu")) {
> +	if (meson_vpu_is_compatible(priv, "amlogic,meson8-vpu") ||
> +	    meson_vpu_is_compatible(priv, "amlogic,meson8b-vpu") ||
> +	    meson_vpu_is_compatible(priv, "amlogic,meson8m2-vpu")) {
> +		return; // TODO
> +	} else if (meson_vpu_is_compatible(priv, "amlogic,meson-gxbb-vpu")) {
>  		switch (base) {
>  		case 2970000:
>  			regmap_write(priv->hhi, HHI_HDMI_PLL_CNTL, 0x5800023d);
> diff --git a/drivers/gpu/drm/meson/meson_venc_cvbs.c b/drivers/gpu/drm/meson/meson_venc_cvbs.c
> index 79d95ca8a0c0..1affa6b19170 100644
> --- a/drivers/gpu/drm/meson/meson_venc_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_venc_cvbs.c
> @@ -179,7 +179,10 @@ static void meson_venc_cvbs_encoder_enable(struct drm_encoder *encoder)
>  	/* VDAC0 source is not from ATV */
>  	writel_bits_relaxed(BIT(5), 0, priv->io_base + _REG(VENC_VDAC_DACSEL0));
>  
> -	if (meson_vpu_is_compatible(priv, "amlogic,meson-gxbb-vpu"))
> +	if (meson_vpu_is_compatible(priv, "amlogic,meson8-vpu") ||
> +	    meson_vpu_is_compatible(priv, "amlogic,meson8b-vpu") ||
> +	    meson_vpu_is_compatible(priv, "amlogic,meson8m2-vpu") ||
> +	    meson_vpu_is_compatible(priv, "amlogic,meson-gxbb-vpu"))
>  		regmap_write(priv->hhi, HHI_VDAC_CNTL0, 1);
>  	else if (meson_vpu_is_compatible(priv, "amlogic,meson-gxm-vpu") ||
>  		 meson_vpu_is_compatible(priv, "amlogic,meson-gxl-vpu"))
> diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
> index 6bcfa527c180..4b65f9166d78 100644
> --- a/drivers/gpu/drm/meson/meson_viu.c
> +++ b/drivers/gpu/drm/meson/meson_viu.c
> @@ -303,9 +303,12 @@ void meson_viu_init(struct meson_drm *priv)
>  	/* Disable OSDs */
>  	writel_bits_relaxed(BIT(0) | BIT(21), 0,
>  			priv->io_base + _REG(VIU_OSD1_CTRL_STAT));
> +#if 0
>  	writel_bits_relaxed(BIT(0) | BIT(21), 0,
>  			priv->io_base + _REG(VIU_OSD2_CTRL_STAT));
> -
> +#else
> +	printk("%s: VIU_OSD2_CTRL_STAT = 0x%08x\n", __func__, readl(priv->io_base + _REG(VIU_OSD2_CTRL_STAT)));
> +#endif

You should try enabling/disabled each OSD to see if something shows.

>  	/* On GXL/GXM, Use the 10bit HDR conversion matrix */
>  	if (meson_vpu_is_compatible(priv, "amlogic,meson-gxm-vpu") ||
>  	    meson_vpu_is_compatible(priv, "amlogic,meson-gxl-vpu"))
> diff --git a/drivers/gpu/drm/meson/meson_vpp.c b/drivers/gpu/drm/meson/meson_vpp.c
> index 27356f81a0ab..c66c16473989 100644
> --- a/drivers/gpu/drm/meson/meson_vpp.c
> +++ b/drivers/gpu/drm/meson/meson_vpp.c
> @@ -61,6 +61,7 @@ void meson_vpp_setup_mux(struct meson_drm *priv, unsigned int mux)
>  void meson_vpp_setup_interlace_vscaler_osd1(struct meson_drm *priv,
>  					    struct drm_rect *input)
>  {
> +#if 0
>  	writel_relaxed(BIT(3) /* Enable scaler */ |
>  		       BIT(2), /* Select OSD1 */
>  			priv->io_base + _REG(VPP_OSD_SC_CTRL0));
> @@ -79,6 +80,33 @@ void meson_vpp_setup_interlace_vscaler_osd1(struct meson_drm *priv,
>  	writel_relaxed(BIT(25), priv->io_base + _REG(VPP_OSD_VSC_PHASE_STEP));
>  
>  	writel_relaxed(0, priv->io_base + _REG(VPP_OSD_HSC_CTRL0));


The scaler is used here to change the interlace field automatically, otherwise we should change it using an irq handler....

In fact the :
>  		       BIT(2), /* Select OSD1 */
is false....

The bits 0-1 are :
osd_sc_sel, 00: select osd1 input, 01: select osd2 input, 10: select vd1 input, 11: select vd2 input after matrix

I wonder why I set BIT(2) here... I must got it from the u-boot source.

U-boot 2016-08-18 has :
	/* enable osd scaler path */
	if (index == OSD1)
		data32 = 8;
	else {
		data32 = 1;       /* select osd2 input */
		data32 |= 1 << 3; /* enable osd scaler path */
	}

in drivers/display/osd/osd_hw.c

> +#else
> +	printk("%s: VPP_OSD_SC_CTRL0 = 0x%08x\n", __func__, readl(priv->io_base + _REG(VPP_OSD_SC_CTRL0)));
> +	printk("%s: VPP_OSD_SCI_WH_M1 = 0x%08x\n", __func__, readl(priv->io_base + _REG(VPP_OSD_SCI_WH_M1)));
> +	printk("%s: VPP_OSD_SCO_H_START_END = 0x%08x\n", __func__, readl(priv->io_base + _REG(VPP_OSD_SCO_H_START_END)));
> +	printk("%s: VPP_OSD_SCO_V_START_END = 0x%08x\n", __func__, readl(priv->io_base + _REG(VPP_OSD_SCO_V_START_END)));
> +	printk("%s: VPP_OSD_VSC_INI_PHASE = 0x%08x\n", __func__, readl(priv->io_base + _REG(VPP_OSD_VSC_INI_PHASE)));
> +	printk("%s: VPP_OSD_VSC_PHASE_STEP = 0x%08x\n", __func__, readl(priv->io_base + _REG(VPP_OSD_VSC_PHASE_STEP)));
> +	printk("%s: VPP_OSD_HSC_CTRL0 = 0x%08x\n", __func__, readl(priv->io_base + _REG(VPP_OSD_HSC_CTRL0)));
> +
> +	writel_relaxed(BIT(3) /* Enable scaler */ |
> +		       BIT(0), /* Select OSD2 - FIXME */
> +			priv->io_base + _REG(VPP_OSD_SC_CTRL0));
> +
> +//	writel_relaxed(((drm_rect_width(input) - 1) << 16) |
> +//		       (drm_rect_height(input) - 1),
> +//			priv->io_base + _REG(VPP_OSD_SCI_WH_M1));
> +
> +//	writel_relaxed((drm_rect_height(input) - 1),
> +//		       priv->io_base + _REG(VPP_OSD_SCO_H_START_END));
> +
> +	writel_relaxed(0x04ff02cf, priv->io_base + _REG(VPP_OSD_SCI_WH_M1));
> +	writel_relaxed(0x000002cf, priv->io_base + _REG(VPP_OSD_SCO_H_START_END));
> +	writel_relaxed(0x0000011f, priv->io_base + _REG(VPP_OSD_SCO_V_START_END));
> +	writel_relaxed(0x40000000, priv->io_base + _REG(VPP_OSD_VSC_INI_PHASE));
> +	writel_relaxed(0x02800000, priv->io_base + _REG(VPP_OSD_VSC_PHASE_STEP));
> +	writel_relaxed(0x00400124, priv->io_base + _REG(VPP_OSD_HSC_CTRL0));
> +#endif
>  
>  	writel_relaxed((4 << 0) /* osd_vsc_bank_length */ |
>  		       (4 << 3) /* osd_vsc_top_ini_rcv_num0 */ |
> 
