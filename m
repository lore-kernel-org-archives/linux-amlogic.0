From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed, 16 May 2018 10:30:41 +0200
Subject: [PATCH] clk: meson: use SPDX license identifiers consistently
In-Reply-To: <152640711006.34267.13271626390751114709@swboyd.mtv.corp.google.com>
References: <20180515164229.4606-1-jbrunet@baylibre.com>
 <152640711006.34267.13271626390751114709@swboyd.mtv.corp.google.com>
Message-ID: <1526459441.2897.54.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, 2018-05-15 at 10:58 -0700, Stephen Boyd wrote:
> Quoting Jerome Brunet (2018-05-15 09:42:29)
> > diff --git a/drivers/clk/meson/clk-audio-divider.c b/drivers/clk/meson/clk-audio-divider.c
> > index f7ab5b1db342..ac0743cd0f2f 100644
> > --- a/drivers/clk/meson/clk-audio-divider.c
> > +++ b/drivers/clk/meson/clk-audio-divider.c
> > @@ -1,18 +1,7 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> 
> This is GPL2 or later.
> 
> >  /*
> >   * Copyright (c) 2017 AmLogic, Inc.
> >   * Author: Jerome Brunet <jbrunet@baylibre.com>
> > - *
> > - * This program is free software; you can redistribute it and/or modify it
> > - * under the terms and conditions of the GNU General Public License,
> > - * version 2, as published by the Free Software Foundation.
> > - *
> > - * This program is distributed in the hope it will be useful, but WITHOUT
> > - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > - * more details.
> > - *
> > - * You should have received a copy of the GNU General Public License along with
> > - * this program.  If not, see <http://www.gnu.org/licenses/>.
> 
> But this looks like GPL2 only because there isn't an "or later" part of
> the text. Is it intentional to relicense to GPL2+ instead of GPL2 only?

Nope, no re-licensing intended. Thanks a lot for the explanation.
I'll recheck the rest of the patch for this error.

> If so, please add that into the commit text.
> 
