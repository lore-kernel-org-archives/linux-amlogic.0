From: laurent.pinchart@ideasonboard.com (Laurent Pinchart)
Date: Thu, 19 Jan 2017 18:45:36 +0200
Subject: [RFC/RFT PATCH 4/4] drm/bridge: dw-hdmi: Take input format from
 plat_data
In-Reply-To: <c7e57984-00a4-b72a-4831-bb636b830c87@cisco.com>
References: <1484656294-6140-1-git-send-email-narmstrong@baylibre.com>
 <d40b0675-4a45-c14c-05ae-ddc38a86ea7d@synopsys.com>
 <c7e57984-00a4-b72a-4831-bb636b830c87@cisco.com>
Message-ID: <41264092.NJkav44OGl@avalon>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Hans and Jose,

On Thursday 19 Jan 2017 16:30:57 Hans Verkuil wrote:
> On 01/19/17 16:21, Jose Abreu wrote:
> > On 18-01-2017 20:49, Laurent Pinchart wrote:
> >> Ideally the bridge mode set operation should be extended to take format
> >> and colorspace information (or another bridge operation should be created
> >> for that purpose, I'm still undecided). As that's quite a big change, I'm
> >> fine if you start by passing a fixed format and colorspace through
> >> platform data. I would however like the format to use the media bus
> >> format codes defined in include/uapi/linux/media-bus-format.h.
> >> 
> >> As far as I'm aware we have no colorspace definitions in DRM, so we would
> >> need to fix that. V4L2 handles colorspaces, and the API went through
> >> several iterations before we got it working, with stupid mistakes that
> >> we don't want to repeat here.
> >> 
> >> Jose pointed to
> >> https://patchwork.kernel.org/patch/9495153/ as a starting point, and I
> >> would like to point out the format and colorspace are two different
> >> things. A colorspace is a combination of an encoding and quantization
> >> and transfer functions. Hans Verkuil has researched this topic for V4L2
> >> (see https://gstreamer.freedesktop.org/data/events/gstreamer-> >> conference/2015/Hans Verkuil - Colorspaces and HDMI.pdf and
> >> https://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/colorspaces.html), we
> >> *really* want to involve him in this discussion.
> >> 
> >> I believe colorspace information should be shared between V4L2 and DRM
> >> the same way we share the media bus formats (We should have done so for
> >> 4CCs as well but it's unfortunately too late for that).
> > 
> > Hmm, I am always confusing this :/ So, what I was refering as
> > "color space" is in reality the encoding (pixel encoding). In
> > HDMI the pixel encoding can be RGB 4:4:4, YCbCr 4:4:4, YCbCr
> > 4:2:2 and YCbCr 4:2:0. We also have color depth which can be from
> > 8-bit to 16-bit. Besides this there is also colorimetry.

There's two separate concepts here, the color encoding and the pixel format. 
The color encoding defines how non-linear R'G'B' is transformed to non-linear 
Y'CbCr (or whether to stick to R'G'B' of course). It's a mathematical formula, 
and along with the quantization defines how the numerical Y'CbCr values are 
obtained. The pixel format then defines the number of bits per sample, as well 
as the subsampling factors.

The media bus codes thus roughly correspond to pixel formats (although they 
also define whether the color encoding uses RGB or YCbCr, but don't define the 
color encoding itself or the quantization method).

> > I've used media-bus-format.h to successfully pass information
> > across a V4L2 driver but I've used it in BGR24 only, which is RGB
> > 4:4:4 8 bit, which in media-bust-format.h would correspond to
> > MEDIA_BUS_FMT_BGR888_1X24. So, I don't know exactly what is the
> > support for other encodings and what if there's support for color
> > depth. If there is then great, but if not then support for this
> > should also be added.

We have a bunch of YUV media bus formats defined in the kernel (see 
https://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/subdev-formats.html#v4l2-mbus-pixelcode). We're missing some that would be needed here (namely YUV 
4:4:4 in 12bpp and I believe the 4:2:0 formats), but it's just a matter of 
adding new definitions with the related documentation.

> > DRM already parses successfully the supported encodings from EDID
> > and stores them in a structure. Note that this is the output
> > encoding, not the input one. We can still have RGB as input and
> > then output at YCbCr using CSC. The missing point is the
> > selection of encoding (either from userspace or from some sort of
> > automatic mechanism by the kernel).

We need to select both the input and output formats and encodings, and, yes, I 
believe that at least the output format and encoding should come from 
userspace.

> The list of supported encodings for video capture depends on the HW
> capabilities. So the driver will list the supported formats (ENUMFMT)
> and userspace then selects a format (S_FMT) from that list.

Please note that this is about HDMI encoders and the DRM/KMS subsystem :-)

> Most HDMI receivers can convert the input to various RGB/YCbCr formats.
> 
> Deep color support for HDMI has not been added (surprisingly nobody needed
> it apparently), but it is pretty easy: new V4L2_PIX_FMT defines should be
> added for those.

New media bus formats in this case.

> When talking about RGB/YCbCr I prefer the term 'color encoding', since
> this has nothing to do with colorspaces (sRGB. AdobeRGB, BT.2020, etc.)

-- 
Regards,

Laurent Pinchart
