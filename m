From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Fri, 3 Mar 2017 17:22:19 +0000
Subject: [PATCH v2 1/2] drm: bridge: dw-hdmi: Take input format from
 plat_data
In-Reply-To: <7ec0d5dc-a09d-2790-34db-669e87c89fa3@baylibre.com>
References: <1488468572-31971-1-git-send-email-narmstrong@baylibre.com>
 <1488468572-31971-2-git-send-email-narmstrong@baylibre.com>
 <2768953.c6tz7qsbuQ@avalon>
 <0ae7ae64-13ad-6691-ada7-7c8f2851b517@baylibre.com>
 <3898e9a2-a751-abe4-fc31-7de18682c5da@synopsys.com>
 <7ec0d5dc-a09d-2790-34db-669e87c89fa3@baylibre.com>
Message-ID: <3cadc66c-9ca8-5658-0023-45ad68ca5939@synopsys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,


On 03-03-2017 16:42, Neil Armstrong wrote:
>
> Sure, I was meaning the *input* format the controller receives from the
> pixel encoder, I'm quite sure the format is strict.
>

Hmm, not quite following you here. As far as the controller goes
it supports the formats I mentioned:
    -    8/10/12/16 bits RGB 4:4:4
    -    8/10/12/16 bits YCbCr 4:4:4
    -    8/10/12 bits YCbCr 4:2:2
    -    8/10/12/16 bits YCbCr 4:2:0

As for the CSC it supports RGB 4:4:4 to/from YCbCr 4:4:4 or 4:2:2
in every defined color depth.

So, everything except 4:2:0 (I had to check documentation, I
though that CSC supported less formats).

Of course this is all limited by the implementation that HW team
decides to choose.

Best regards,
Jose Miguel Abreu
