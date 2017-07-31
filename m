From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 31 Jul 2017 18:20:04 +0200
Subject: mmc: UHS Voltage switch and operating frequency question
Message-ID: <1501518004.2759.5.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Ulf,

I am working on adding signal voltage switch callback to the meson mmc driver.
While testing, I noticed that a few cards fail to exit the busy state after the
voltage switch.

After tinkering with the driver a bit, I noticed that increasing the clock
frequency from 400kHz to 1MHz solve the problem. Strange, isn't it ?

I'm don't know MMC that much but is it possible that some card require a minimum
operating frequency to enter UHS mode ?

The simplified spec (Part 1 - Physical Layer) says that before CMD11, we should
have had CMD41 (Init Command) . After CMD41, the card should be operating at
Default Speed or SDR12. 

I believe that in both case, the frequency is "up to 25Mhz" ? This would be the
maximum, but is there a minimum ? 400kHz seems pretty low compared to 25Mhz ...

I hope you will able to shed light on this :)

Best Regards
jerome
