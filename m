From: p.zabel@pengutronix.de (Philipp Zabel)
Date: Thu, 16 Feb 2017 10:52:17 +0100
Subject: [PATCH] reset: fix shared reset triggered_count decrement on error
In-Reply-To: <1487182551-31517-1-git-send-email-jbrunet@baylibre.com>
References: <1487182551-31517-1-git-send-email-jbrunet@baylibre.com>
Message-ID: <1487238737.2377.3.camel@pengutronix.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, 2017-02-15 at 19:15 +0100, Jerome Brunet wrote:
> For a shared reset, when the reset is successful, the triggered_count is
> incremented when trying to call the reset callback, so that another device
> sharing the same reset line won't trigger it again. If the reset has not
> been triggered successfully, the trigger_count should be decremented.
> 
> The code does the opposite, and decrements the trigger_count on success.
> As a consequence, another device sharing the reset will be able to trigger
> it again.
> 
> Fixed be removing negation in from of the error code of the reset function.
> 
> Fixes: 7da33a37b48f ("reset: allow using reset_control_reset with shared reset")
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Hi Philipp,
> 
>  I found this issue while testing your patch [0]
>  It fixes a regression we have been having with usb. On meson-gxbb
>  platforms, usb0 and usb1 share the same reset line. Martin had
>  reports that usb0 recently got broken. In fact usb1 was able to
>  trigger the reset again because the issue mentioned above.

Thanks, applied with Martin's Acked-by. I'll send a pull request for
this later today.

regards
Philipp
