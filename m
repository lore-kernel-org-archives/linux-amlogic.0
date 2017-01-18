From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 18 Jan 2017 12:15:55 +0100
Subject: [RFC/RFT PATCH 3/4] drm/bridge: dw-hdmi: Enable CSC even for DVI
In-Reply-To: <888e2dfb-db21-04b5-90d3-9f917052f70a@synopsys.com>
References: <1484656294-6140-1-git-send-email-narmstrong@baylibre.com>
 <1484656294-6140-4-git-send-email-narmstrong@baylibre.com>
 <888e2dfb-db21-04b5-90d3-9f917052f70a@synopsys.com>
Message-ID: <62d628ce-265d-39b2-75e8-c1abff973724@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi jose,

On 01/18/2017 11:22 AM, Jose Abreu wrote:
> Hi Neil,
> 
> 
> On 17-01-2017 12:31, Neil Armstrong wrote:
>> If the input pixel format is not RGB, the CSC must be enabled in order to
>> provide valid pixel to DVI sinks.
>> This patch removes the hdmi only dependency on the CSC enabling.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> I was going to say that you should make sure the output
> colorspace is RGB or else DVI will fail to work, but I just
> noticed the output colorspace is fixed in the code to RGB.
> Though, that may change in the future.

Thanks for the review,
It would certainly need to enforce RGB output colorspace when in DVI mode.

Neil

> 
> Reviewed-by: Jose Abreu <joabreu@synopsys.com>
> 
> Best regards,
> Jose Miguel Abreu
> 
>> ---
>>  drivers/gpu/drm/bridge/dw-hdmi.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
>> index 923e250..8a6a183 100644
>> --- a/drivers/gpu/drm/bridge/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/dw-hdmi.c
>> @@ -1331,8 +1331,8 @@ static void dw_hdmi_enable_video_path(struct dw_hdmi *hdmi)
>>  		hdmi_writeb(hdmi, clkdis, HDMI_MC_CLKDIS);
>>  	}
>>  
>> -	/* Enable color space conversion if needed (for HDMI sinks only). */
>> -	if (hdmi->sink_is_hdmi && is_color_space_conversion(hdmi))
>> +	/* Enable color space conversion if needed */
>> +	if (is_color_space_conversion(hdmi))
>>  		hdmi_writeb(hdmi, HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_IN_PATH,
>>  			    HDMI_MC_FLOWCTRL);
>>  	else
> 
