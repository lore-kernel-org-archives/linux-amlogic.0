From: laurent.pinchart@ideasonboard.com (Laurent Pinchart)
Date: Tue, 17 Jan 2017 16:40:07 +0200
Subject: [RFC/RFT PATCH 3/4] drm/bridge: dw-hdmi: Enable CSC even for DVI
In-Reply-To: <1484656294-6140-4-git-send-email-narmstrong@baylibre.com>
References: <1484656294-6140-1-git-send-email-narmstrong@baylibre.com>
 <1484656294-6140-4-git-send-email-narmstrong@baylibre.com>
Message-ID: <5149133.QFIYqnzeFl@avalon>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,

Thank you for the patch.

On Tuesday 17 Jan 2017 13:31:33 Neil Armstrong wrote:
> If the input pixel format is not RGB, the CSC must be enabled in order to
> provide valid pixel to DVI sinks.
> This patch removes the hdmi only dependency on the CSC enabling.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/dw-hdmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c
> b/drivers/gpu/drm/bridge/dw-hdmi.c index 923e250..8a6a183 100644
> --- a/drivers/gpu/drm/bridge/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/dw-hdmi.c
> @@ -1331,8 +1331,8 @@ static void dw_hdmi_enable_video_path(struct dw_hdmi
> *hdmi) hdmi_writeb(hdmi, clkdis, HDMI_MC_CLKDIS);
>  	}
> 
> -	/* Enable color space conversion if needed (for HDMI sinks only). */
> -	if (hdmi->sink_is_hdmi && is_color_space_conversion(hdmi))
> +	/* Enable color space conversion if needed */
> +	if (is_color_space_conversion(hdmi))
>  		hdmi_writeb(hdmi, 
HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_IN_PATH,
>  			    HDMI_MC_FLOWCTRL);
>  	else

-- 
Regards,

Laurent Pinchart
