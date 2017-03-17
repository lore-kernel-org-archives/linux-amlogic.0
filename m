From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 17 Mar 2017 17:10:16 +0100
Subject: [PATCH v3 2/6] media: uapi: Add RGB and YUV bus formats for
 Synopsys HDMI TX Controller
In-Reply-To: <f57eefc2-8c37-ee0c-7b6e-06334d9d059d@codeaurora.org>
References: <1488904944-14285-1-git-send-email-narmstrong@baylibre.com>
 <1488904944-14285-3-git-send-email-narmstrong@baylibre.com>
 <f57eefc2-8c37-ee0c-7b6e-06334d9d059d@codeaurora.org>
Message-ID: <9b343849-d9cb-249a-b226-bced0bf14b24@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 03/16/2017 06:06 PM, Archit Taneja wrote:
> 
> 
> On 3/7/2017 10:12 PM, Neil Armstrong wrote:
>> In order to describe the RGB and YUB bus formats used to feed the
> 
> s/YUB/YUV

Thanks for pointing me this !

Neil

> 
>> Synopsys DesignWare HDMI TX Controller, add missing formats to the
>> list of Bus Formats.
>>
>> Documentation for these formats is added in a separate patch.
>>
> 
> Reviewed-by: Archit Taneja <architt@codeaurora.org>
> 
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  include/uapi/linux/media-bus-format.h | 13 +++++++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
>> index 2168759..7cc820b 100644
>> --- a/include/uapi/linux/media-bus-format.h
>> +++ b/include/uapi/linux/media-bus-format.h
>> @@ -33,7 +33,7 @@
>>
>>  #define MEDIA_BUS_FMT_FIXED            0x0001
>>
>> -/* RGB - next is    0x1018 */
>> +/* RGB - next is    0x101b */
>>  #define MEDIA_BUS_FMT_RGB444_1X12        0x1016
>>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE    0x1001
>>  #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE    0x1002
>> @@ -57,8 +57,11 @@
>>  #define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA    0x1012
>>  #define MEDIA_BUS_FMT_ARGB8888_1X32        0x100d
>>  #define MEDIA_BUS_FMT_RGB888_1X32_PADHI        0x100f
>> +#define MEDIA_BUS_FMT_RGB101010_1X30        0x1018
>> +#define MEDIA_BUS_FMT_RGB121212_1X36        0x1019
>> +#define MEDIA_BUS_FMT_RGB161616_1X48        0x101a
>>
>> -/* YUV (including grey) - next is    0x2026 */
>> +/* YUV (including grey) - next is    0x202c */
>>  #define MEDIA_BUS_FMT_Y8_1X8            0x2001
>>  #define MEDIA_BUS_FMT_UV8_1X8            0x2015
>>  #define MEDIA_BUS_FMT_UYVY8_1_5X8        0x2002
>> @@ -90,12 +93,18 @@
>>  #define MEDIA_BUS_FMT_YVYU10_1X20        0x200e
>>  #define MEDIA_BUS_FMT_VUY8_1X24            0x2024
>>  #define MEDIA_BUS_FMT_YUV8_1X24            0x2025
>> +#define MEDIA_BUS_FMT_UYVY8_1_1X24        0x2026
>>  #define MEDIA_BUS_FMT_UYVY12_1X24        0x2020
>>  #define MEDIA_BUS_FMT_VYUY12_1X24        0x2021
>>  #define MEDIA_BUS_FMT_YUYV12_1X24        0x2022
>>  #define MEDIA_BUS_FMT_YVYU12_1X24        0x2023
>>  #define MEDIA_BUS_FMT_YUV10_1X30        0x2016
>> +#define MEDIA_BUS_FMT_UYVY10_1_1X30        0x2027
>>  #define MEDIA_BUS_FMT_AYUV8_1X32        0x2017
>> +#define MEDIA_BUS_FMT_UYVY12_1_1X36        0x2028
>> +#define MEDIA_BUS_FMT_YUV12_1X36        0x2029
>> +#define MEDIA_BUS_FMT_YUV16_1X48        0x202a
>> +#define MEDIA_BUS_FMT_UYVY16_1_1X48        0x202b
>>
>>  /* Bayer - next is    0x3021 */
>>  #define MEDIA_BUS_FMT_SBGGR8_1X8        0x3001
>>
> 
