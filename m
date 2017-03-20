From: hverkuil@xs4all.nl (Hans Verkuil)
Date: Mon, 20 Mar 2017 16:35:49 +0100
Subject: [PATCH v3 2/6] media: uapi: Add RGB and YUV bus formats for
 Synopsys HDMI TX Controller
In-Reply-To: <1488904944-14285-3-git-send-email-narmstrong@baylibre.com>
References: <1488904944-14285-1-git-send-email-narmstrong@baylibre.com>
 <1488904944-14285-3-git-send-email-narmstrong@baylibre.com>
Message-ID: <eac1864d-98e6-3915-04fe-cf81d8bc1db5@xs4all.nl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 03/07/2017 05:42 PM, Neil Armstrong wrote:
> In order to describe the RGB and YUB bus formats used to feed the
> Synopsys DesignWare HDMI TX Controller, add missing formats to the
> list of Bus Formats.
> 
> Documentation for these formats is added in a separate patch.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  include/uapi/linux/media-bus-format.h | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 2168759..7cc820b 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -33,7 +33,7 @@
>  
>  #define MEDIA_BUS_FMT_FIXED			0x0001
>  
> -/* RGB - next is	0x1018 */
> +/* RGB - next is	0x101b */
>  #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
> @@ -57,8 +57,11 @@
>  #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
>  #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
>  #define MEDIA_BUS_FMT_RGB888_1X32_PADHI		0x100f
> +#define MEDIA_BUS_FMT_RGB101010_1X30		0x1018
> +#define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
> +#define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
>  
> -/* YUV (including grey) - next is	0x2026 */
> +/* YUV (including grey) - next is	0x202c */
>  #define MEDIA_BUS_FMT_Y8_1X8			0x2001
>  #define MEDIA_BUS_FMT_UV8_1X8			0x2015
>  #define MEDIA_BUS_FMT_UYVY8_1_5X8		0x2002
> @@ -90,12 +93,18 @@
>  #define MEDIA_BUS_FMT_YVYU10_1X20		0x200e
>  #define MEDIA_BUS_FMT_VUY8_1X24			0x2024
>  #define MEDIA_BUS_FMT_YUV8_1X24			0x2025
> +#define MEDIA_BUS_FMT_UYVY8_1_1X24		0x2026
>  #define MEDIA_BUS_FMT_UYVY12_1X24		0x2020
>  #define MEDIA_BUS_FMT_VYUY12_1X24		0x2021
>  #define MEDIA_BUS_FMT_YUYV12_1X24		0x2022
>  #define MEDIA_BUS_FMT_YVYU12_1X24		0x2023
>  #define MEDIA_BUS_FMT_YUV10_1X30		0x2016
> +#define MEDIA_BUS_FMT_UYVY10_1_1X30		0x2027
>  #define MEDIA_BUS_FMT_AYUV8_1X32		0x2017
> +#define MEDIA_BUS_FMT_UYVY12_1_1X36		0x2028
> +#define MEDIA_BUS_FMT_YUV12_1X36		0x2029
> +#define MEDIA_BUS_FMT_YUV16_1X48		0x202a
> +#define MEDIA_BUS_FMT_UYVY16_1_1X48		0x202b
>  
>  /* Bayer - next is	0x3021 */
>  #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
> 

These new bus formats:

#define MEDIA_BUS_FMT_UYVY8_1_1X24		0x2026
#define MEDIA_BUS_FMT_UYVY10_1_1X30		0x2027
#define MEDIA_BUS_FMT_UYVY12_1_1X36		0x2028
#define MEDIA_BUS_FMT_UYVY16_1_1X48		0x202b

are all 4:2:0, right?

I think these should all be renamed to:

#define MEDIA_BUS_FMT_UYYVYY8_1X24		0x2026
#define MEDIA_BUS_FMT_UYYVYY10_1X30		0x2027
#define MEDIA_BUS_FMT_UYYVYY12_1X36		0x2028
#define MEDIA_BUS_FMT_UYYVYY16_1X48		0x202b

Conform the other 4:2:0 format MEDIA_BUS_FMT_YDYUYDYV8_1X16 (except without the 'D'!).

I am slightly unsure about the _1. Strictly speaking we're transferring two pixels per
bus-sample, so _0_5 might be more accurate. Sakari, what's your opinion about that?

Regards,

	Hans
