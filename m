From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Thu, 19 Jan 2017 15:21:05 +0000
Subject: [RFC/RFT PATCH 4/4] drm/bridge: dw-hdmi: Take input format from
 plat_data
In-Reply-To: <3138084.ubGyLVHoXm@avalon>
References: <1484656294-6140-1-git-send-email-narmstrong@baylibre.com>
 <e19f5c56-08d9-1e9a-a093-25c57fcc7138@synopsys.com>
 <66fc9acc-5db9-d124-fbe5-31893a5bd5df@baylibre.com>
 <3138084.ubGyLVHoXm@avalon>
Message-ID: <d40b0675-4a45-c14c-05ae-ddc38a86ea7d@synopsys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Laurent,


On 18-01-2017 20:49, Laurent Pinchart wrote:
>
> Ideally the bridge mode set operation should be extended to take format and 
> colorspace information (or another bridge operation should be created for that 
> purpose, I'm still undecided). As that's quite a big change, I'm fine if you 
> start by passing a fixed format and colorspace through platform data. I would 
> however like the format to use the media bus format codes defined in 
> include/uapi/linux/media-bus-format.h.
>
> As far as I'm aware we have no colorspace definitions in DRM, so we would need 
> to fix that. V4L2 handles colorspaces, and the API went through several 
> iterations before we got it working, with stupid mistakes that we don't want 
> to repeat here.
>
> Jose pointed to https://urldefense.proofpoint.com/v2/url?u=https-3A__patchwork.kernel.org_patch_9495153_&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=WHDsc6kcWAl4i96Vm5hJ_19IJiuxx_p_Rzo2g-uHDKw&m=BkyajeUCra1JNwll2fmexnvnkIDglOZPocC1ibkiNCQ&s=V21eO0BUlcWrbddiKml5I6ylkiX2ALOHPHmble7kxwI&e=  as a starting 
> point, and I would like to point out the format and colorspace are two 
> different things. A colorspace is a combination of an encoding and  
> quantization and transfer functions. Hans Verkuil has researched this topic 
> for V4L2 (see https://urldefense.proofpoint.com/v2/url?u=https-3A__gstreamer.freedesktop.org_data_events_gstreamer-2Dconference_2015_Hans&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=WHDsc6kcWAl4i96Vm5hJ_19IJiuxx_p_Rzo2g-uHDKw&m=BkyajeUCra1JNwll2fmexnvnkIDglOZPocC1ibkiNCQ&s=z9IMQn5gPepKFfsLUwUXiG8MA2s1SBB1jyQDE0JIKdk&e=  Verkuil - Colorspaces and HDMI.pdf and 
> https://urldefense.proofpoint.com/v2/url?u=https-3A__linuxtv.org_downloads_v4l-2Ddvb-2Dapis_uapi_v4l_colorspaces.html&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=WHDsc6kcWAl4i96Vm5hJ_19IJiuxx_p_Rzo2g-uHDKw&m=BkyajeUCra1JNwll2fmexnvnkIDglOZPocC1ibkiNCQ&s=QReIV1CxgeALvbP5QObIvfwIh7hjEL8J4fxiATaMVYc&e= ), we 
> *really* want to involve him in this discussion.
>
> I believe colorspace information should be shared between V4L2 and DRM the 
> same way we share the media bus formats (We should have done so for 4CCs as 
> well but it's unfortunately too late for that).
>
>

Hmm, I am always confusing this :/ So, what I was refering as
"color space" is in reality the encoding (pixel encoding). In
HDMI the pixel encoding can be RGB 4:4:4, YCbCr 4:4:4, YCbCr
4:2:2 and YCbCr 4:2:0. We also have color depth which can be from
8-bit to 16-bit. Besides this there is also colorimetry.

I've used media-bus-format.h to successfully pass information
across a V4L2 driver but I've used it in BGR24 only, which is RGB
4:4:4 8 bit, which in media-bust-format.h would correspond to
MEDIA_BUS_FMT_BGR888_1X24. So, I don't know exactly what is the
support for other encodings and what if there's support for color
depth. If there is then great, but if not then support for this
should also be added.

DRM already parses successfully the supported encodings from EDID
and stores them in a structure. Note that this is the output
encoding, not the input one. We can still have RGB as input and
then output at YCbCr using CSC. The missing point is the
selection of encoding (either from userspace or from some sort of
automatic mechanism by the kernel).

Best regards,
Jose Miguel Abreu
