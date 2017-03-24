From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 24 Mar 2017 16:19:58 -0700
Subject: [PATCH 4/4] mmc: meson-gx: add CMD23 mode
In-Reply-To: <51dcee34-1cfe-641e-5e06-aa7ef667831e@gmail.com> (Heiner
 Kallweit's message of "Fri, 24 Mar 2017 23:15:33 +0100")
References: <f6960395-370e-16b0-1a2a-2a1fce720d45@gmail.com>
 <51dcee34-1cfe-641e-5e06-aa7ef667831e@gmail.com>
Message-ID: <m2mvcadzz5.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Heiner Kallweit <hkallweit1@gmail.com> writes:

> CMD23 mode (use "set block count" command before transferring multiple
> data blocks) typically is more performant as host / card know upfront
> how many data blocks to expect. Therefore add support for this mode to
> the driver.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Kevin
