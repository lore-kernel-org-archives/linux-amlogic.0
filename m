From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 3 Mar 2017 12:31:27 +0100
Subject: [PATCH v2 1/2] drm: bridge: dw-hdmi: Take input format from
 plat_data
In-Reply-To: <2768953.c6tz7qsbuQ@avalon>
References: <1488468572-31971-1-git-send-email-narmstrong@baylibre.com>
 <1488468572-31971-2-git-send-email-narmstrong@baylibre.com>
 <2768953.c6tz7qsbuQ@avalon>
Message-ID: <0ae7ae64-13ad-6691-ada7-7c8f2851b517@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 03/02/2017 04:45 PM, Laurent Pinchart wrote:
> Hi Neil,
> 
> Thank you for the patch.
> 
> On Thursday 02 Mar 2017 16:29:31 Neil Armstrong wrote:
>> Some display pipelines can only provide non-RBG input pixels to the HDMI TX
>> Controller, this patch takes the pixel format from the plat_data if
>> provided.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/gpu/drm/bridge/dw-hdmi.c | 59 ++++++++++++++++++-------------------
>>  include/drm/bridge/dw_hdmi.h     |  9 ++++++
>>  2 files changed, 39 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c
>> b/drivers/gpu/drm/bridge/dw-hdmi.c index 026a0dc..653ecd7 100644
>> --- a/drivers/gpu/drm/bridge/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/dw-hdmi.c
>> @@ -35,12 +35,6 @@
>>
>>  #define HDMI_EDID_LEN		512
>>
>> -#define RGB			0
>> -#define YCBCR444		1
>> -#define YCBCR422_16BITS		2
>> -#define YCBCR422_8BITS		3
>> -#define XVYCC444		4
>> -
>>  enum hdmi_datamap {
>>  	RGB444_8B = 0x01,
>>  	RGB444_10B = 0x03,
>> @@ -94,8 +88,8 @@ struct hdmi_vmode {
>>  };
>>
>>  struct hdmi_data_info {
>> -	unsigned int enc_in_format;
>> -	unsigned int enc_out_format;
>> +	enum dw_hdmi_color_enc_format enc_in_format;
>> +	enum dw_hdmi_color_enc_format enc_out_format;
>>  	unsigned int enc_color_depth;
>>  	unsigned int colorimetry;
>>  	unsigned int pix_repet_factor;
>> @@ -569,7 +563,7 @@ static void hdmi_video_sample(struct dw_hdmi *hdmi)
>>  	int color_format = 0;
>>  	u8 val;
>>
>> -	if (hdmi->hdmi_data.enc_in_format == RGB) {
>> +	if (hdmi->hdmi_data.enc_in_format == DW_HDMI_ENC_FMT_RGB) {
>>  		if (hdmi->hdmi_data.enc_color_depth == 8)
>>  			color_format = 0x01;
>>  		else if (hdmi->hdmi_data.enc_color_depth == 10)
>> @@ -580,7 +574,7 @@ static void hdmi_video_sample(struct dw_hdmi *hdmi)
>>  			color_format = 0x07;
>>  		else
>>  			return;
>> -	} else if (hdmi->hdmi_data.enc_in_format == YCBCR444) {
>> +	} else if (hdmi->hdmi_data.enc_in_format == DW_HDMI_ENC_FMT_YCBCR444) 
> {
>>  		if (hdmi->hdmi_data.enc_color_depth == 8)
>>  			color_format = 0x09;
>>  		else if (hdmi->hdmi_data.enc_color_depth == 10)
>> @@ -591,7 +585,8 @@ static void hdmi_video_sample(struct dw_hdmi *hdmi)
>>  			color_format = 0x0F;
>>  		else
>>  			return;
>> -	} else if (hdmi->hdmi_data.enc_in_format == YCBCR422_8BITS) {
>> +	} else if (hdmi->hdmi_data.enc_in_format ==
>> +					DW_HDMI_ENC_FMT_YCBCR422_8BITS) {
>>  		if (hdmi->hdmi_data.enc_color_depth == 8)
>>  			color_format = 0x16;
>>  		else if (hdmi->hdmi_data.enc_color_depth == 10)
>> @@ -627,20 +622,20 @@ static int is_color_space_conversion(struct dw_hdmi
>> *hdmi)
>>
>>  static int is_color_space_decimation(struct dw_hdmi *hdmi)
>>  {
>> -	if (hdmi->hdmi_data.enc_out_format != YCBCR422_8BITS)
>> +	if (hdmi->hdmi_data.enc_out_format != DW_HDMI_ENC_FMT_YCBCR422_8BITS)
>>  		return 0;
>> -	if (hdmi->hdmi_data.enc_in_format == RGB ||
>> -	    hdmi->hdmi_data.enc_in_format == YCBCR444)
>> +	if (hdmi->hdmi_data.enc_in_format == DW_HDMI_ENC_FMT_RGB ||
>> +	    hdmi->hdmi_data.enc_in_format == DW_HDMI_ENC_FMT_YCBCR444)
>>  		return 1;
>>  	return 0;
>>  }
>>
>>  static int is_color_space_interpolation(struct dw_hdmi *hdmi)
>>  {
>> -	if (hdmi->hdmi_data.enc_in_format != YCBCR422_8BITS)
>> +	if (hdmi->hdmi_data.enc_in_format != DW_HDMI_ENC_FMT_YCBCR422_8BITS)
>>  		return 0;
>> -	if (hdmi->hdmi_data.enc_out_format == RGB ||
>> -	    hdmi->hdmi_data.enc_out_format == YCBCR444)
>> +	if (hdmi->hdmi_data.enc_out_format == DW_HDMI_ENC_FMT_RGB ||
>> +	    hdmi->hdmi_data.enc_out_format == DW_HDMI_ENC_FMT_YCBCR444)
>>  		return 1;
>>  	return 0;
>>  }
>> @@ -652,13 +647,14 @@ static void dw_hdmi_update_csc_coeffs(struct dw_hdmi
>> *hdmi) u32 csc_scale = 1;
>>
>>  	if (is_color_space_conversion(hdmi)) {
>> -		if (hdmi->hdmi_data.enc_out_format == RGB) {
>> +		if (hdmi->hdmi_data.enc_out_format == DW_HDMI_ENC_FMT_RGB) {
>>  			if (hdmi->hdmi_data.colorimetry ==
>>  					HDMI_COLORIMETRY_ITU_601)
>>  				csc_coeff = &csc_coeff_rgb_out_eitu601;
>>  			else
>>  				csc_coeff = &csc_coeff_rgb_out_eitu709;
>> -		} else if (hdmi->hdmi_data.enc_in_format == RGB) {
>> +		} else if (hdmi->hdmi_data.enc_in_format ==
>> +					DW_HDMI_ENC_FMT_RGB) {
>>  			if (hdmi->hdmi_data.colorimetry ==
>>  					HDMI_COLORIMETRY_ITU_601)
>>  				csc_coeff = &csc_coeff_rgb_in_eitu601;
>> @@ -730,8 +726,8 @@ static void hdmi_video_packetize(struct dw_hdmi *hdmi)
>>  	struct hdmi_data_info *hdmi_data = &hdmi->hdmi_data;
>>  	u8 val, vp_conf;
>>
>> -	if (hdmi_data->enc_out_format == RGB ||
>> -	    hdmi_data->enc_out_format == YCBCR444) {
>> +	if (hdmi_data->enc_out_format == DW_HDMI_ENC_FMT_RGB ||
>> +	    hdmi_data->enc_out_format == DW_HDMI_ENC_FMT_YCBCR444) {
>>  		if (!hdmi_data->enc_color_depth) {
>>  			output_select = HDMI_VP_CONF_OUTPUT_SELECTOR_BYPASS;
>>  		} else if (hdmi_data->enc_color_depth == 8) {
>> @@ -746,7 +742,8 @@ static void hdmi_video_packetize(struct dw_hdmi *hdmi)
>>  		} else {
>>  			return;
>>  		}
>> -	} else if (hdmi_data->enc_out_format == YCBCR422_8BITS) {
>> +	} else if (hdmi_data->enc_out_format ==
>> +					DW_HDMI_ENC_FMT_YCBCR422_8BITS) {
>>  		if (!hdmi_data->enc_color_depth ||
>>  		    hdmi_data->enc_color_depth == 8)
>>  			remap_size = HDMI_VP_REMAP_YCC422_16bit;
>> @@ -1138,15 +1135,16 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi,
>> struct drm_display_mode *mode) /* Initialise info frame from DRM mode */
>>  	drm_hdmi_avi_infoframe_from_display_mode(&frame, mode);
>>
>> -	if (hdmi->hdmi_data.enc_out_format == YCBCR444)
>> +	if (hdmi->hdmi_data.enc_out_format == DW_HDMI_ENC_FMT_YCBCR444)
>>  		frame.colorspace = HDMI_COLORSPACE_YUV444;
>> -	else if (hdmi->hdmi_data.enc_out_format == YCBCR422_8BITS)
>> +	else if (hdmi->hdmi_data.enc_out_format ==
>> +					DW_HDMI_ENC_FMT_YCBCR422_8BITS)
>>  		frame.colorspace = HDMI_COLORSPACE_YUV422;
>>  	else
>>  		frame.colorspace = HDMI_COLORSPACE_RGB;
>>
>>  	/* Set up colorimetry */
>> -	if (hdmi->hdmi_data.enc_out_format == XVYCC444) {
>> +	if (hdmi->hdmi_data.enc_out_format == DW_HDMI_ENC_FMT_XVYCC444) {
>>  		frame.colorimetry = HDMI_COLORIMETRY_EXTENDED;
>>  		if (hdmi->hdmi_data.colorimetry == HDMI_COLORIMETRY_ITU_601)
>>  			frame.extended_colorimetry =
>> @@ -1154,7 +1152,7 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi,
>> struct drm_display_mode *mode) else /*hdmi->hdmi_data.colorimetry ==
>> HDMI_COLORIMETRY_ITU_709*/ frame.extended_colorimetry =
>>  				HDMI_EXTENDED_COLORIMETRY_XV_YCC_709;
>> -	} else if (hdmi->hdmi_data.enc_out_format != RGB) {
>> +	} else if (hdmi->hdmi_data.enc_out_format != DW_HDMI_ENC_FMT_RGB) {
>>  		frame.colorimetry = hdmi->hdmi_data.colorimetry;
>>  		frame.extended_colorimetry = 
> HDMI_EXTENDED_COLORIMETRY_XV_YCC_601;
>>  	} else { /* Carries no data */
>> @@ -1443,10 +1441,13 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi,
>> struct drm_display_mode *mode)
>> hdmi->hdmi_data.video_mode.mpixelrepetitionoutput = 0;
>>  	hdmi->hdmi_data.video_mode.mpixelrepetitioninput = 0;
>>
>> -	/* TODO: Get input format from IPU (via FB driver interface) */
>> -	hdmi->hdmi_data.enc_in_format = RGB;
>> +	/* Get input format from plat data or fallback to RGB */
>> +	if (hdmi->plat_data->input_fmt >= 0)
>> +		hdmi->hdmi_data.enc_in_format = hdmi->plat_data->input_fmt;
>> +	else
>> +		hdmi->hdmi_data.enc_in_format = DW_HDMI_ENC_FMT_RGB;
>>
>> -	hdmi->hdmi_data.enc_out_format = RGB;
>> +	hdmi->hdmi_data.enc_out_format = DW_HDMI_ENC_FMT_RGB;
>>
>>  	hdmi->hdmi_data.enc_color_depth = 8;
>>  	hdmi->hdmi_data.pix_repet_factor = 0;
>> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
>> index bcceee8..8c0cc13 100644
>> --- a/include/drm/bridge/dw_hdmi.h
>> +++ b/include/drm/bridge/dw_hdmi.h
>> @@ -21,6 +21,14 @@ enum {
>>  	DW_HDMI_RES_MAX,
>>  };
>>
>> +enum dw_hdmi_color_enc_format {
>> +	DW_HDMI_ENC_FMT_RGB = 0,
>> +	DW_HDMI_ENC_FMT_YCBCR444,
>> +	DW_HDMI_ENC_FMT_YCBCR422_16BITS,
>> +	DW_HDMI_ENC_FMT_YCBCR422_8BITS,
>> +	DW_HDMI_ENC_FMT_XVYCC444,
>> +};
>> +
>>  enum dw_hdmi_phy_type {
>>  	DW_HDMI_PHY_DWC_HDMI_TX_PHY = 0x00,
>>  	DW_HDMI_PHY_DWC_MHL_PHY_HEAC = 0xb2,
>> @@ -62,6 +70,7 @@ struct dw_hdmi_plat_data {
>>  	struct regmap *regm;
>>  	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
>>  					   struct drm_display_mode *mode);
>> +	enum dw_hdmi_color_enc_format input_fmt;
> 
> As reported before, I think we should use a combination of media bus format 
> and color space information instead of a custom enum. Ideally this should also 
> be queried at runtime, but that could be done in a second step.
> 

Sure, but I was struggling about finding an equivalence.

How should I replace these ?

DW_HDMI_ENC_FMT_RGB
DW_HDMI_ENC_FMT_YCBCR444
DW_HDMI_ENC_FMT_YCBCR422_16BITS
DW_HDMI_ENC_FMT_YCBCR422_8BITS
DW_HDMI_ENC_FMT_XVYCC444

I do not have the strict information about the bus format, what is RGB in 8bit per pixel ?
Are the 3 samples transmitted separately ?
What should be the RGB colorspace ?
Should we use the "Packed" formats, LVDS or a new buf format ?

Jose, what are the *exact* bus formats supported ?

Same for DW_HDMI_ENC_FMT_YCBCR* stuff, are they packed ?

I understand the YCBCR444/XVYCC444 needs a color space information instead.

Could we use the following list ?

Bus Format			| Colorspace 		| Encoding
-------------------------------------------------------------------------------
MEDIA_BUS_FMT_RGB888_1X24	| V4L2_COLORSPACE_SRGB	| V4L2_XFER_FUNC_SRGB
MEDIA_BUS_FMT_RGB101010_1X30	| V4L2_COLORSPACE_SRGB	| V4L2_XFER_FUNC_SRGB
MEDIA_BUS_FMT_RGB121212_1X36	| V4L2_COLORSPACE_SRGB	| V4L2_XFER_FUNC_SRGB
MEDIA_BUS_FMT_VUY8_1X24		| V4L2_XFER_FUNC_709	| V4L2_YCBCR_ENC_709
MEDIA_BUS_FMT_YUV10_1X30	| V4L2_XFER_FUNC_709	| V4L2_YCBCR_ENC_709
MEDIA_BUS_FMT_YUV10_1X32	| V4L2_XFER_FUNC_709	| V4L2_YCBCR_ENC_709
MEDIA_BUS_FMT_YUV10_1X32	| V4L2_XFER_FUNC_709	| V4L2_YCBCR_ENC_709
MEDIA_BUS_FMT_YUV10_1X32	| V4L2_XFER_FUNC_709	| V4L2_YCBCR_ENC_XV709

But all of these is complex, and I'm not sure how we should handle SDTV modes here,
and without knowing the exact inputs types supported by the IP, this needs to be
confirmed.

Meanwhile, all this can be fixed later, at least this patch moves the
definition out of the C file and uses better names for these custom enums.

>>
>>  	/* Vendor PHY support */
>>  	const struct dw_hdmi_phy_ops *phy_ops;
> 
