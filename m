From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 19 Jul 2018 09:55:53 +0200
Subject: [alsa-devel] [PATCH RESEND 02/15] ASoC: meson: add axg fifo
 base driver
In-Reply-To: <s5ha7qoblk0.wl-tiwai@suse.de>
References: <20180717154304.9973-1-jbrunet@baylibre.com>
 <20180717154304.9973-3-jbrunet@baylibre.com>
 <20180718115054.GI5700@sirena.org.uk> <s5ha7qoblk0.wl-tiwai@suse.de>
Message-ID: <1531986953.26720.21.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, 2018-07-18 at 17:39 +0200, Takashi Iwai wrote:
> On Wed, 18 Jul 2018 13:50:54 +0200,
> Mark Brown wrote:
> > 
> > On Tue, Jul 17, 2018 at 05:42:51PM +0200, Jerome Brunet wrote:
> > 
> > > +	return !status ? IRQ_NONE : IRQ_HANDLED;
> > 
> > Please just write normal conditional statements, it makes things a lot
> > easier to read (the ! isn't helping either here).

Indeed. I'll correct this in a follow up patch

> 
> ... and there is the standard IRQ_RETVAL() macro for this purpose.

I was not aware of it. Thanks for the tip Takashi

> 
> 
> Takashi
