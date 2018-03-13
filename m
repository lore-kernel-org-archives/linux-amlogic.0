From: hias@horus.com (Matthias Reichl)
Date: Wed, 14 Mar 2018 00:31:29 +0100
Subject: [PATCH] media: rc: meson-ir: add timeout on idle
In-Reply-To: <20180312135811.g25jjzhmh3jnvgjr@gofer.mess.org>
References: <20180306174122.6017-1-hias@horus.com>
 <20180308164327.ihhmvm6ntzvnsjy7@gofer.mess.org>
 <20180309155451.gbocsaj4s3puc4cq@camel2.lan>
 <20180310112744.plfxkmqbgvii7n7r@gofer.mess.org>
 <20180310173828.7lwyicxzar22dyb7@camel2.lan>
 <20180311125518.pcob4wii43odmana@gofer.mess.org>
 <20180312132000.oqrj4xjdi7lvupnu@camel2.lan>
 <20180312135811.g25jjzhmh3jnvgjr@gofer.mess.org>
Message-ID: <20180313233128.ny46g6fuigbp5val@camel2.lan>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Sean,

On Mon, Mar 12, 2018 at 01:58:11PM +0000, Sean Young wrote:
> On Mon, Mar 12, 2018 at 02:20:00PM +0100, Matthias Reichl wrote:
> > On Sun, Mar 11, 2018 at 12:55:19PM +0000, Sean Young wrote:
> > > That makes complete sense. I'm actually keen to get this lowered, since
> > > this makes it possible to lower the repeat period per-protocol, see
> > > commit d57ea877af38 which had to be reverted (the ite driver will
> > > need fixing up as well before this can happen).
> > 
> > I remember the commit, this issue hit us in LibreELEC testbuilds
> > as well :-)
> > 
> > > Lowering to below 125ms does increase the risk of regressions, so I
> > > am weary of that. Do you think there is benefit in doing this?
> > 
> > I'd also say stick to the 125ms default. The default settings
> > should always be safe ones IMO.
> 
> Well, yes. I just wanted to explore the ideal situation before making
> up our minds.
> 
> > People who want to optimize for the last bit of performance can
> > easily do that on their own, at their own risk.
> > 
> > 
> > Personally I've been using gpio-ir-recv on RPi with the default 125ms
> > timeout and a Hauppauge rc-5 remote for about 2 years now and I've
> > always been happy with that.
> 
> Ok. We should try to get this change for meson-ir ready for v4.17. I can
> write a patch later.

Thanks, it worked fine!

> > I have to acknowledge though that the responsiveness of a remote
> > with short messages, like rc-5, in combination with a low timeout
> > (I tested down to 10ms) is pretty impressive.
> 
> I've been thinking about this problem. What we could do is have a 
> per-protocol maximum space length, and repeat period. The timeout
> can then be set to a maximum space length (+safety margin), and the
> keyup timer can be set to timeout + repeat period (+safety margin).

This sounds like a very good idea. It won't help much with IR
receivers that have no configurable timeout or a large minimum
timeout (ite-cir has 100ms min, probably a hardware limitation?),
but for other receivers this'll be a nice improvement.

> If memory serves, the lirc daemon always sets the timeout with
> LIRC_SET_REC_TIMEOUT, so it would not affect lirc daemon decoding.

Current versions of Lirc (0.9.4 and newer) don't seem to use
LIRC_SET_REC_TIMEOUT but handle timeouts on it's own via a
timeout value in poll().

There's still some generic code in lircd.cpp that supports setting
timeouts via LIRC_SET_REC_TIMEOUT but the default plugin (which
handles /dev/lircX) doesn't implement any of the required 
get/set timeout ioctls.

strace on lircd 0.10.0 also shows that only LIRC_GET_FEATURES is
used.

Older Lirc versions (checked with 0.9.1 source I had here)
seem to be using LIRC_SET_REC_TIMEOUT.

So I think we should be fine here.

Not sure if there are other users of the /dev/lirc interface
that could be affected, I'm only familiar with lirc and the
tools from v4l-utils.

> Anyway, just an idea. Not something for v4.17.

No need to rush things, your idea looks good to me but better
test it thoroughly.

Drop me a line if you have a first implementation, I'd be happy
to help with testing.

so long,

Hias
