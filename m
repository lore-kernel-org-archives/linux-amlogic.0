From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 27 Apr 2018 12:15:39 -0700
Subject: [PATCH] ARM64: dts: meson: disable sd-uhs modes on the
 libretech-cc
In-Reply-To: <20180426105046.14817-1-jbrunet@baylibre.com> (Jerome Brunet's
 message of "Thu, 26 Apr 2018 12:50:46 +0200")
References: <20180426105046.14817-1-jbrunet@baylibre.com>
Message-ID: <7hvacczcis.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> There is a problem with the sd-uhs mode when doing a soft reboot.
> Switching back from 1.8v to 3.3v messes with the card, which no longer
> respond (timeout errors). According to the specification, we should
> perform a card reset (power cycling the card) but this is something we
> cannot control on this design.
>
> Then the only solution to restore the communication with the card is an
> "unplug-plug" which is not acceptable
>
> Until we find a solution, if any, disable the sd-uhs modes on this design.
> For the people using uhs at the moment, there will a performance drop as
> a result.
>
> Fixes: 3cde63ebc85c ("ARM64: dts: meson-gxl: libretech-cc: enable high speed modes")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied to v4.17/fixes, and adding a Cc to stable.

Thanks,

Kevin
