From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Wed, 18 Jan 2017 10:28:44 +0000
Subject: [RFC/RFT PATCH 4/4] drm/bridge: dw-hdmi: Take input format from
 plat_data
In-Reply-To: <1484656294-6140-5-git-send-email-narmstrong@baylibre.com>
References: <1484656294-6140-1-git-send-email-narmstrong@baylibre.com>
 <1484656294-6140-5-git-send-email-narmstrong@baylibre.com>
Message-ID: <e19f5c56-08d9-1e9a-a093-25c57fcc7138@synopsys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,


On 17-01-2017 12:31, Neil Armstrong wrote:
> Some display pipelines can only provide non-RBG input pixels to the HDMI TX
> Controller, this patch takes the pixel format from the plat_data if provided.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/dw-hdmi.c | 7 +++++--
>  include/drm/bridge/dw_hdmi.h     | 9 +++++++++
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
> index 8a6a183..fa4147c 100644
> --- a/drivers/gpu/drm/bridge/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/dw-hdmi.c
> @@ -1420,8 +1420,11 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
>  	hdmi->hdmi_data.video_mode.mpixelrepetitionoutput = 0;
>  	hdmi->hdmi_data.video_mode.mpixelrepetitioninput = 0;
>  
> -	/* TODO: Get input format from IPU (via FB driver interface) */
> -	hdmi->hdmi_data.enc_in_format = RGB;
> +	/* Get input format from plat data or fallback to RGB */
> +	if (hdmi->plat_data->input_fmt >= 0)
> +		hdmi->hdmi_data.enc_in_format = hdmi->plat_data->input_fmt;

Also not a big fan of this approach, but its better than it was.
BTW see relevant discussion about colorspace (this is more in the
output path) here [1].

[1] https://patchwork.kernel.org/patch/9495153/

> +	else
> +		hdmi->hdmi_data.enc_in_format = RGB;
>  
>  	hdmi->hdmi_data.enc_out_format = RGB;
>  
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index d6a0ab3..4f426c3 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -21,6 +21,14 @@ enum {
>  	DW_HDMI_RES_MAX,
>  };
>  
> +enum {
> +	DW_HDMI_INPUT_FMT_RGB = 0,
> +	DW_HDMI_INPUT_FMT_YCBCR444,
> +	DW_HDMI_INPUT_FMT_YCBCR422_16BITS,
> +	DW_HDMI_INPUT_FMT_YCBCR422_8BITS,

Hmm, did you test these two? I'm not sure if deep color can be
converted using CSC.

Best regards,
Jose Miguel Abreu

> +	DW_HDMI_INPUT_FMT_XVYCC444,
> +};
> +
>  enum dw_hdmi_phy_type {
>  	DW_HDMI_PHY_DWC_HDMI_TX_PHY = 0x00,
>  	DW_HDMI_PHY_DWC_MHL_PHY_HEAC = 0xb2,
> @@ -68,6 +76,7 @@ struct dw_hdmi_plat_data {
>  				 const struct dw_hdmi_plat_data *data);
>  	bool (*hdmi_read_hpd)(struct dw_hdmi *hdmi,
>  			      const struct dw_hdmi_plat_data *data);
> +	int input_fmt;
>  };
>  
>  int dw_hdmi_probe(struct platform_device *pdev,
