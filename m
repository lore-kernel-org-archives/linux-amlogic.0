From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 23 Nov 2018 15:39:22 +0100
Subject: [PATCH RFC 1/8] drm/bridge: dw-hdmi: Add SCDC and TMDS Scrambling
 support
In-Reply-To: <18593437.RcPPLLf6y1@avalon>
References: <20181123140221.15700-1-narmstrong@baylibre.com>
 <1880382.AeP59NOuia@avalon>
 <ca86b176-603b-8983-f6af-95e2bdce4aab@baylibre.com>
 <18593437.RcPPLLf6y1@avalon>
Message-ID: <931fd1f8-3c13-2d46-68ab-d375bffc2e53@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 23/11/2018 15:33, Laurent Pinchart wrote:
> Hi Neil,
> 
> On Friday, 23 November 2018 16:29:15 EET Neil Armstrong wrote:
>> On 23/11/2018 15:25, Laurent Pinchart wrote:
>>> On Friday, 23 November 2018 16:02:14 EET Neil Armstrong wrote:
>>>> Add support for SCDC Setup for TMDS Clock > 3.4GHz and enable TMDS
>>>> Scrambling when supported or mandatory.
>>>>
>>>> This patch also adds an helper to setup the control bit to support
>>>> the hight TMDS Bit Period/TMDS Clock-Period Ratio as required with
>>>
>>> s/hight/high/ ?
>>
>> Thanks for catching !
>>
>>>> TMDS Clock > 3.4GHz for HDMI2.0 3840x2160 at 60/50 modes.
>>>
>>> Why do you need a helper for this, is there no way it could be handled
>>> internally ?
>>
>> I could, but all the platforms would also do it internally... seems better
>> to have common helper, no ? And it will be usable by the PHY models handler
>> in the dw-hdmi driver aswell.
> 
> I meant internally in the dw-hdmi driver, not in the glue layer.

No since the spec says you must setup div40 support in the SCDC right before
enabling the TMDS stream and wait 100ms minimum, it would eventually work
from the dw-hdmi driver, but we cannot presume how the platforms PHYs are
setup.

> 
>>>> These changes were based on work done by Huicong Xu <xhc@rock-chips.com>
>>>> and Nickey Yang <nickey.yang@rock-chips.com> to support HDMI2.0 modes
>>>> on the Rockchip 4.4 BSP kernel at [1]
>>>>
>>>> [1] https://github.com/rockchip-linux/kernel/tree/release-4.4
>>>>
>>>> Cc: Nickey Yang <nickey.yang@rock-chips.com>
>>>> Cc: Huicong Xu <xhc@rock-chips.com>
>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>> ---
>>>>
>>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 45 +++++++++++++++++++++--
>>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.h |  1 +
>>>>  include/drm/bridge/dw_hdmi.h              |  1 +
>>>>  3 files changed, 44 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c index
>>>> 5971976284bf..523508af70b0 100644
>>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> 
> [snip]
> 
>>>> @@ -1562,6 +1581,26 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
>>>>  		vsync_len /= 2;
>>>>  	}
>>>>
>>>> +	/* Scrambling Control */
>>>> +	if (hdmi_info->scdc.supported) {
>>>> +		if (vmode->mpixelclock > 340000000 ||
>>>> +		    hdmi_info->scdc.scrambling.low_rates) {
>>>> +			drm_scdc_readb(&hdmi->i2c->adap, SCDC_SINK_VERSION,
>>>> +				       &bytes);
>>>> +			drm_scdc_writeb(&hdmi->i2c->adap, SCDC_SOURCE_VERSION,
>>>> +					bytes);
>>>
>>> Shouldn't the source version be min(sink version, highest supported source
>>> version) ?
>>
>> How should the "highest supported source version" be defined ?
> 
> That's the highest version supported by the DW HDMI TX controller, and is an 
> intrinsic property of the IP core. With the above code, a sink newer than the 
> DW HDMI TX will incorrectly be told that the source supports the same version 
> as the sink.

You are right, we could be ourselves on the already-know dw-hdmi IP version we know
to determine a currently known max version for the current platforms using dw-hdmi.

> 
>>>> +			drm_scdc_set_scrambling(&hdmi->i2c->adap, 1);
>>>> +			hdmi_writeb(hdmi, (u8)~HDMI_MC_SWRSTZ_TMDSSWRST_REQ,
>>>> +				    HDMI_MC_SWRSTZ);
>>>> +			hdmi_writeb(hdmi, 1, HDMI_FC_SCRAMBLER_CTRL);
>>>> +		} else {
>>>> +			hdmi_writeb(hdmi, 0, HDMI_FC_SCRAMBLER_CTRL);
>>>> +			hdmi_writeb(hdmi, (u8)~HDMI_MC_SWRSTZ_TMDSSWRST_REQ,
>>>> +				    HDMI_MC_SWRSTZ);
>>>> +			drm_scdc_set_scrambling(&hdmi->i2c->adap, 0);
>>>> +		}
>>>> +	}
>>>> +
>>>>  	/* Set up horizontal active pixel width */
>>>>  	hdmi_writeb(hdmi, mode->hdisplay >> 8, HDMI_FC_INHACTV1);
>>>>  	hdmi_writeb(hdmi, mode->hdisplay, HDMI_FC_INHACTV0);
> 
> [snip]
> 
