From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 08 Jun 2017 15:53:36 +0200
Subject: [PATCH] pinctrl: meson-gxl: add tsin_a pins
In-Reply-To: <ed2befab-728b-6165-a86b-deb92f220996@suse.de>
References: <20170608130948.16426-1-jbrunet@baylibre.com>
 <ed2befab-728b-6165-a86b-deb92f220996@suse.de>
Message-ID: <1496930016.3552.45.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, 2017-06-08 at 15:49 +0200, Andreas F?rber wrote:
> Am 08.06.2017 um 15:09 schrieb Jerome Brunet:
> > Add Tsin A pins to bank DV and X.
> > We don't have a driver for the tsin yet but since the tsin A pinmux is
> > enabled by default at boot time, declaring this pinmux is required to
> > properly operate on GPIOX.
> > 
> > Without this change, GPIOX 8, 9, 10 and 11 can't be driven as GPIO output
> > as the tsin A seems to have priority.
> 
> Should this get a Fixes header then for stable backports?

Nothing is wrong with what is already in. This is merely an addition.

If we go that way, all commit to this file should have a Fixes to the
initial commit. This seems a bit extreme to me ...

> 
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> > ?drivers/pinctrl/meson/pinctrl-meson-gxl.c | 36
> > +++++++++++++++++++++++++++++++
> > ?1 file changed, 36 insertions(+)
> 
> Looks OK AFAICT.
> 
> Cheers,
> Andreas
> 
