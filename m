From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Fri, 3 Mar 2017 16:39:47 +0000
Subject: [PATCH v2 1/2] drm: bridge: dw-hdmi: Take input format from
 plat_data
In-Reply-To: <0ae7ae64-13ad-6691-ada7-7c8f2851b517@baylibre.com>
References: <1488468572-31971-1-git-send-email-narmstrong@baylibre.com>
 <1488468572-31971-2-git-send-email-narmstrong@baylibre.com>
 <2768953.c6tz7qsbuQ@avalon>
 <0ae7ae64-13ad-6691-ada7-7c8f2851b517@baylibre.com>
Message-ID: <3898e9a2-a751-abe4-fc31-7de18682c5da@synopsys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,


On 03-03-2017 11:31, Neil Armstrong wrote:
>
> Sure, but I was struggling about finding an equivalence.
>
> How should I replace these ?
>
> DW_HDMI_ENC_FMT_RGB
> DW_HDMI_ENC_FMT_YCBCR444
> DW_HDMI_ENC_FMT_YCBCR422_16BITS
> DW_HDMI_ENC_FMT_YCBCR422_8BITS
> DW_HDMI_ENC_FMT_XVYCC444
>
> I do not have the strict information about the bus format, what is RGB in 8bit per pixel ?
> Are the 3 samples transmitted separately ?
> What should be the RGB colorspace ?
> Should we use the "Packed" formats, LVDS or a new buf format ?
>
> Jose, what are the *exact* bus formats supported ?

Well, the controller supports everything that is in the HDMI spec
(1.4 and 2.0), the implementation is the one that limits the
supported formats. There is also a CSC but it does not convert
from anything to everything :)

I think you can safely add every MBUS code that is compatible
with HDMI. Namely:
    -    24/30/36/48-bit RGB 4:4:4
    -    24/30/36/48-bit YCbCr 4:4:4
    -    16/20/24-bit YCbCr 4:2:2
    -    24/30/36/48-bit YCbCr 4:2:0

And then let the glue drivers decide which they support in input
and what they want in output (the output is a little tricky
because it will depend in EDID, this should be handled by
userspace + drm core and not the drivers so let it fixed to RGB,
just in case).

>
> Same for DW_HDMI_ENC_FMT_YCBCR* stuff, are they packed ?

Hmm, this depends on the implementation. The controller always
receives 48bits of data per pixel, its the implementation that is
responsible to correctly align that data.

>
> I understand the YCBCR444/XVYCC444 needs a color space information instead.
>
> Could we use the following list ?
>
> Bus Format			| Colorspace 		| Encoding
> -------------------------------------------------------------------------------
> MEDIA_BUS_FMT_RGB888_1X24	| V4L2_COLORSPACE_SRGB	| V4L2_XFER_FUNC_SRGB
> MEDIA_BUS_FMT_RGB101010_1X30	| V4L2_COLORSPACE_SRGB	| V4L2_XFER_FUNC_SRGB
> MEDIA_BUS_FMT_RGB121212_1X36	| V4L2_COLORSPACE_SRGB	| V4L2_XFER_FUNC_SRGB
> MEDIA_BUS_FMT_VUY8_1X24		| V4L2_XFER_FUNC_709	| V4L2_YCBCR_ENC_709
> MEDIA_BUS_FMT_YUV10_1X30	| V4L2_XFER_FUNC_709	| V4L2_YCBCR_ENC_709
> MEDIA_BUS_FMT_YUV10_1X32	| V4L2_XFER_FUNC_709	| V4L2_YCBCR_ENC_709
> MEDIA_BUS_FMT_YUV10_1X32	| V4L2_XFER_FUNC_709	| V4L2_YCBCR_ENC_709
> MEDIA_BUS_FMT_YUV10_1X32	| V4L2_XFER_FUNC_709	| V4L2_YCBCR_ENC_XV709

I think the HDMI spec dictates the default colorspace+encoding
for each bus format, not sure though, Laurent?

Best regards,
Jose Miguel Abreu

>
> But all of these is complex, and I'm not sure how we should handle SDTV modes here,
> and without knowing the exact inputs types supported by the IP, this needs to be
> confirmed.
>
> Meanwhile, all this can be fixed later, at least this patch moves the
> definition out of the C file and uses better names for these custom enums.
>
