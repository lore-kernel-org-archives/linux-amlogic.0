From: laurent.pinchart@ideasonboard.com (Laurent Pinchart)
Date: Wed, 18 Jan 2017 22:49:41 +0200
Subject: [RFC/RFT PATCH 4/4] drm/bridge: dw-hdmi: Take input format from
 plat_data
In-Reply-To: <66fc9acc-5db9-d124-fbe5-31893a5bd5df@baylibre.com>
References: <1484656294-6140-1-git-send-email-narmstrong@baylibre.com>
 <e19f5c56-08d9-1e9a-a093-25c57fcc7138@synopsys.com>
 <66fc9acc-5db9-d124-fbe5-31893a5bd5df@baylibre.com>
Message-ID: <3138084.ubGyLVHoXm@avalon>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,

(CC'ing Hans Verkuil)

On Wednesday 18 Jan 2017 12:24:22 Neil Armstrong wrote:
> On 01/18/2017 11:28 AM, Jose Abreu wrote:
> > On 17-01-2017 12:31, Neil Armstrong wrote:
> >> Some display pipelines can only provide non-RBG input pixels to the HDMI
> >> TX Controller, this patch takes the pixel format from the plat_data if
> >> provided.
> >> 
> >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >> ---
> >> 
> >>  drivers/gpu/drm/bridge/dw-hdmi.c | 7 +++++--
> >>  include/drm/bridge/dw_hdmi.h     | 9 +++++++++
> >>  2 files changed, 14 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c
> >> b/drivers/gpu/drm/bridge/dw-hdmi.c index 8a6a183..fa4147c 100644
> >> --- a/drivers/gpu/drm/bridge/dw-hdmi.c
> >> +++ b/drivers/gpu/drm/bridge/dw-hdmi.c
> >> @@ -1420,8 +1420,11 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi,
> >> struct drm_display_mode *mode)
> >>  	hdmi->hdmi_data.video_mode.mpixelrepetitionoutput = 0;
> >>  	hdmi->hdmi_data.video_mode.mpixelrepetitioninput = 0;
> >> 
> >> -	/* TODO: Get input format from IPU (via FB driver interface) */
> >> -	hdmi->hdmi_data.enc_in_format = RGB;
> >> +	/* Get input format from plat data or fallback to RGB */
> >> +	if (hdmi->plat_data->input_fmt >= 0)
> >> +		hdmi->hdmi_data.enc_in_format = hdmi->plat_data->input_fmt;
> > 
> > Also not a big fan of this approach, but its better than it was.
> > BTW see relevant discussion about colorspace (this is more in the
> > output path) here [1].
> > 
> > [1] https://patchwork.kernel.org/patch/9495153/
> > 
> >> +	else
> >> +		hdmi->hdmi_data.enc_in_format = RGB;
> >> 
> >>  	hdmi->hdmi_data.enc_out_format = RGB;
> >> 
> >> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> >> index d6a0ab3..4f426c3 100644
> >> --- a/include/drm/bridge/dw_hdmi.h
> >> +++ b/include/drm/bridge/dw_hdmi.h
> >> @@ -21,6 +21,14 @@ enum {
> >> 
> >>  	DW_HDMI_RES_MAX,
> >>  
> >>  };
> >> 
> >> +enum {
> >> +	DW_HDMI_INPUT_FMT_RGB = 0,
> >> +	DW_HDMI_INPUT_FMT_YCBCR444,
> >> +	DW_HDMI_INPUT_FMT_YCBCR422_16BITS,
> >> +	DW_HDMI_INPUT_FMT_YCBCR422_8BITS,
> > 
> > Hmm, did you test these two? I'm not sure if deep color can be
> > converted using CSC.
> 
> I simply copied the dw-hdmi internal values.
> Proper handling of input formats capabilities and
> output format pixel clock handling should be added sometime.
> In the meantime, it's worth adding which input is supported.
> 
> This approach is very limited, should I add a bitmask with all
> support input formats and select between RGB, YUV444 or YUV422
> in dw_hdmi_setup ?

Ideally the bridge mode set operation should be extended to take format and 
colorspace information (or another bridge operation should be created for that 
purpose, I'm still undecided). As that's quite a big change, I'm fine if you 
start by passing a fixed format and colorspace through platform data. I would 
however like the format to use the media bus format codes defined in 
include/uapi/linux/media-bus-format.h.

As far as I'm aware we have no colorspace definitions in DRM, so we would need 
to fix that. V4L2 handles colorspaces, and the API went through several 
iterations before we got it working, with stupid mistakes that we don't want 
to repeat here.

Jose pointed to https://patchwork.kernel.org/patch/9495153/ as a starting 
point, and I would like to point out the format and colorspace are two 
different things. A colorspace is a combination of an encoding and  
quantization and transfer functions. Hans Verkuil has researched this topic 
for V4L2 (see https://gstreamer.freedesktop.org/data/events/gstreamer-conference/2015/Hans Verkuil - Colorspaces and HDMI.pdf and 
https://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/colorspaces.html), we 
*really* want to involve him in this discussion.

I believe colorspace information should be shared between V4L2 and DRM the 
same way we share the media bus formats (We should have done so for 4CCs as 
well but it's unfortunately too late for that).

> >> +	DW_HDMI_INPUT_FMT_XVYCC444,
> >> +};
> >> +
> >>  enum dw_hdmi_phy_type {
> >>  	DW_HDMI_PHY_DWC_HDMI_TX_PHY = 0x00,
> >>  	DW_HDMI_PHY_DWC_MHL_PHY_HEAC = 0xb2,
> >> @@ -68,6 +76,7 @@ struct dw_hdmi_plat_data {
> >>  				 const struct dw_hdmi_plat_data *data);
> >>  	bool (*hdmi_read_hpd)(struct dw_hdmi *hdmi,
> >>  			      const struct dw_hdmi_plat_data *data);
> >> +	int input_fmt;
> >>  };
> >>  
> >>  int dw_hdmi_probe(struct platform_device *pdev,

-- 
Regards,

Laurent Pinchart
