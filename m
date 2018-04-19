From: khilman@baylibre.com (Kevin Hilman)
Date: Thu, 19 Apr 2018 07:48:37 -0700
Subject: [PATCH v2 0/7] Meson GXL/GXM USB host mode support
In-Reply-To: <5c162f08-e285-c8c3-6021-0071e5ae4a2d@baylibre.com> (Neil
 Armstrong's message of "Wed, 28 Mar 2018 10:18:03 +0200")
References: <20180326211748.16488-1-martin.blumenstingl@googlemail.com>
 <CAFBinCDfjRaMOOXbSx8j1yNpRrovyf+wZBF2=cwyQD7HN2RMHw@mail.gmail.com>
 <5c162f08-e285-c8c3-6021-0071e5ae4a2d@baylibre.com>
Message-ID: <7h7ep35k1m.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 27/03/2018 23:33, Martin Blumenstingl wrote:
>> On Mon, Mar 26, 2018 at 11:17 PM, Martin Blumenstingl
>> <martin.blumenstingl@googlemail.com> wrote:
>>> the goal of this series is to enable USB host mode on Meson GXL and GXM.
>>> there are four dependencies to get this working:
>>> 1. "improvements and fixes for the phy-meson-gxl-usb2 driver" from [0]
>>>    (this is already queued for v4.17 and part of linux-next)
>>> 2. "DWC3 support for Amlogic Meson AXG and GXL SoCs from" [1] (this is
>>>    also queued for v4.17 and part of linux-next)
>>> 3. "initialize (multiple) PHYs for a HCD" from [3] (this is also queued
>>>    for v4.17 and part of linux-next)
>>> 4. "Meson GXL USB3 PHY driver" from [3] (this is also queued for v4.17
>>>    and part of linux-next)
>>> there is a soft dependency on the following series (currently dependency
>>> #3 from above breaks suspend on some TI SoCs, so there's a risk that #3
>>> will get reverted if the following series doesn't fix it):
>>> 5. "fix HCD PHY suspend handling" from [4] (not queued for v4.17 yet)
>> I just re-sent the series for dependency #5 in version 4: [0]
>> version 4 includes a Tested-by and Reviewed-by of the Mediatek and TI
>> USB maintainers. so chances are good that all pre-conditions for this
>> (USB on GXL/GXM devicetree) series will make it into v4.17
>
> Hi,
>
> I think these should go into 4.17 anyway since the DT nodes are conform to all bindings.
>

I've queued these, and will first attempt to get them early in
v4.17-rc.  If that doesn't work, They'll be first in the queue for
v4.18/dt64.

Kevin
