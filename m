From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 19 Apr 2018 10:18:35 +0200
Subject: [PATCH] drm: bridge: dw-hdmi: Fix overflow workaround for Amlogic
 Meson GX SoCs
In-Reply-To: <1519386277-25902-1-git-send-email-narmstrong@baylibre.com>
References: <1519386277-25902-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <3b17d17b-cf3d-be54-2462-191e4f2af653@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Greg,

On 23/02/2018 12:44, Neil Armstrong wrote:
> The Amlogic Meson GX SoCs, embedded the v2.01a controller, has been also
> identified needing this workaround.
> This patch adds the corresponding version to enable a single iteration for
> this specific version.
> 
> Fixes: be41fc55f1aa ("drm: bridge: dw-hdmi: Handle overflow workaround based on device version")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

This patch is now present in linux master as commit 9c305eb442f3b371fc722ade827bbf673514123e
Could it be selected for 4.14 ?
The patch has been reworked to apply for 4.17 as indicated in the commit log, but the original patch will apply over 4.14.

Thanks,
Neil

> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index a38db40..f5018f9 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -1637,6 +1637,8 @@ static void dw_hdmi_clear_overflow(struct dw_hdmi *hdmi)
>  	 * (and possibly on the platform). So far only i.MX6Q (v1.30a) and
>  	 * i.MX6DL (v1.31a) have been identified as needing the workaround, with
>  	 * 4 and 1 iterations respectively.
> +	 * The Amlogic Meson GX SoCs (v2.01a) have been identifies as needing
> +	 * the workaround with a single iteration.
>  	 */
>  
>  	switch (hdmi->version) {
> @@ -1644,6 +1646,7 @@ static void dw_hdmi_clear_overflow(struct dw_hdmi *hdmi)
>  		count = 4;
>  		break;
>  	case 0x131a:
> +	case 0x201a:
>  		count = 1;
>  		break;
>  	default:
> 
