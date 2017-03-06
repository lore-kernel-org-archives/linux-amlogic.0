From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 6 Mar 2017 11:41:06 +0100
Subject: [PATCH v2 1/2] drm: bridge: dw-hdmi: Take input format from
 plat_data
In-Reply-To: <3cadc66c-9ca8-5658-0023-45ad68ca5939@synopsys.com>
References: <1488468572-31971-1-git-send-email-narmstrong@baylibre.com>
 <1488468572-31971-2-git-send-email-narmstrong@baylibre.com>
 <2768953.c6tz7qsbuQ@avalon>
 <0ae7ae64-13ad-6691-ada7-7c8f2851b517@baylibre.com>
 <3898e9a2-a751-abe4-fc31-7de18682c5da@synopsys.com>
 <7ec0d5dc-a09d-2790-34db-669e87c89fa3@baylibre.com>
 <3cadc66c-9ca8-5658-0023-45ad68ca5939@synopsys.com>
Message-ID: <a69a053b-a026-37ca-ff3c-13bd88e3c3f6@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 03/03/2017 06:22 PM, Jose Abreu wrote:
> Hi Neil,
> 
> 
> On 03-03-2017 16:42, Neil Armstrong wrote:
>>
>> Sure, I was meaning the *input* format the controller receives from the
>> pixel encoder, I'm quite sure the format is strict.
>>
> 
> Hmm, not quite following you here. As far as the controller goes
> it supports the formats I mentioned:
>     -    8/10/12/16 bits RGB 4:4:4
>     -    8/10/12/16 bits YCbCr 4:4:4
>     -    8/10/12 bits YCbCr 4:2:2
>     -    8/10/12/16 bits YCbCr 4:2:0
> 
> As for the CSC it supports RGB 4:4:4 to/from YCbCr 4:4:4 or 4:2:2
> in every defined color depth.
> 
> So, everything except 4:2:0 (I had to check documentation, I
> though that CSC supported less formats).
> 
> Of course this is all limited by the implementation that HW team
> decides to choose.
> 
> Best regards,
> Jose Miguel Abreu
> 

Hi Jose,

Thanks for the clarifications.

I will try to add missing V4L formats

 - 8/10/12/16 bits RGB 4:4:4

MEDIA_BUS_FMT_RGB888_1X24
MEDIA_BUS_FMT_RGB101010_1X30 (to be added)
MEDIA_BUS_FMT_RGB121212_1X36 (to be added)
MEDIA_BUS_FMT_RGB161616_1X48 (to be added)

 - 8/10/12/16 bits YCbCr 4:4:4

MEDIA_BUS_FMT_YUV8_1X24
MEDIA_BUS_FMT_YUV10_1X30
MEDIA_BUS_FMT_YUV12_1X36 (to be added)
MEDIA_BUS_FMT_YUV16_1X48 (to be added)

 - 8/10/12 bits YCbCr 4:2:2

MEDIA_BUS_FMT_UYVY8_1X16
MEDIA_BUS_FMT_UYVY10_1X20
MEDIA_BUS_FMT_UYVY12_1X24

 - 8/10/12/16 bits YCbCr 4:2:0

Jose, how is supposed to be transmitted 4:2:0 over the controller ?

Amlogic uses clock doubling to transmit 4:2:0 in CrYCb format.

I assume, the transmission is in YYUYYV format in 2x clock.

So the formats should be (aligned on the MEDIA_BUS_FMT_YUYV8_1_5X8) :

MEDIA_BUS_FMT_YUYV8_1_1X24 (to be added)
MEDIA_BUS_FMT_YUYV10_1_1X30 (to be added)
MEDIA_BUS_FMT_YUYV12_1_1X36 (to be added)
MEDIA_BUS_FMT_YUYV16_1_1X48 (to be added)

to have the following transmissions scheme :

uuuuuuuu/yyyyyyyy/yyyyyyyy
vvvvvvvv/yyyyyyyy/yyyyyyyy

Can you confirm this ?

Neil
