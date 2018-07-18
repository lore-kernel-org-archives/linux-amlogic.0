From: tiwai@suse.de (Takashi Iwai)
Date: Wed, 18 Jul 2018 17:39:11 +0200
Subject: [alsa-devel] [PATCH RESEND 02/15] ASoC: meson: add axg fifo	base
 driver
In-Reply-To: <20180718115054.GI5700@sirena.org.uk>
References: <20180717154304.9973-1-jbrunet@baylibre.com>
 <20180717154304.9973-3-jbrunet@baylibre.com>
 <20180718115054.GI5700@sirena.org.uk>
Message-ID: <s5ha7qoblk0.wl-tiwai@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, 18 Jul 2018 13:50:54 +0200,
Mark Brown wrote:
> 
> On Tue, Jul 17, 2018 at 05:42:51PM +0200, Jerome Brunet wrote:
> 
> > +	return !status ? IRQ_NONE : IRQ_HANDLED;
> 
> Please just write normal conditional statements, it makes things a lot
> easier to read (the ! isn't helping either here).

... and there is the standard IRQ_RETVAL() macro for this purpose.


Takashi
