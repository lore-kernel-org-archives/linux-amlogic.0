From: marex@denx.de (Marek Vasut)
Date: Wed, 11 Apr 2018 16:59:39 +0200
Subject: [PATCH v2 u-boot 1/3] usb: host: Add simple of glue driver for
 DWC3 USB Controllers integration
In-Reply-To: <b4c270c1-201d-70b6-8a34-d458e211bb25@baylibre.com>
References: <1523456947-4242-1-git-send-email-narmstrong@baylibre.com>
 <1523456947-4242-2-git-send-email-narmstrong@baylibre.com>
 <f073d38e-1196-6bd6-0081-fcf4f87c7fd6@denx.de>
 <b4c270c1-201d-70b6-8a34-d458e211bb25@baylibre.com>
Message-ID: <2b758956-b970-8675-c4db-28f878524a63@denx.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 04/11/2018 04:53 PM, Neil Armstrong wrote:
> Hi Marek,
> 
> On 11/04/2018 16:37, Marek Vasut wrote:
>> On 04/11/2018 04:29 PM, Neil Armstrong wrote:
>>> This is a port of the dwc3-of-simple driver from Linux to enable/deassert
>>> clock and resets of a simple DWC3 Controller HW glue.
>>>
>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>
>> Looks good, except can we reduce the number of ifdefs, ie. by using
>> empty functions if DM_* is not defined ?
> 
> For reset, yes, for clock only the get_bulk and release_bulk...

Any reduction of the omnipresent ifdefs would be nice.

> Should I re-spin ?

That'd be nice, thanks.

-- 
Best regards,
Marek Vasut
