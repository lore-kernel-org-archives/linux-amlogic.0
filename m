From: jbrunet@baylibre.com (Jerome Brunet)
Date: Sun, 10 Sep 2017 17:08:25 +0200
Subject: Problems after recent changes to meson-gx-mmc driver
In-Reply-To: <6a4baa6c-e5f0-fe51-f958-adde9e39b4c9@gmail.com>
References: <e2171288-84ef-82db-2efc-300935e6c062@gmail.com>
 <1504965959.24771.42.camel@baylibre.com>
 <763e9339-92a4-c2c4-bbe6-ee9f831148ec@gmail.com>
 <6a4baa6c-e5f0-fe51-f958-adde9e39b4c9@gmail.com>
Message-ID: <1505056105.24771.53.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, 2017-09-09 at 22:20 +0200, Heiner Kallweit wrote:
> I checked further and setting the tx clock phase back to 0 fixes the issue for
> me.
> ("mmc: meson-gx: change default tx phase" changes it from 0 to 270.)
> But as you write 0 seems to break certain other systems.

That was my second guess ...

As I mentioned in the commit message, 270 is working fine for the setups I have
tested but I always wondered if that would be the case for every possible
setups/boards/modes.

Would you mind testing 90 and 180 as well with your setup ? I'll make another
pass on the different setups I have access to. Please stick to hs200 and drop
hs400 for this test. I'm still unsure if doubling the clock after doing the
tuning may affect the phase tuning ... lets keep that out of the way for now.
