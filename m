From: andrew@lunn.ch (Andrew Lunn)
Date: Sun, 11 Jun 2017 17:21:02 +0200
Subject: ARM GLX Khadas VIM Pro - Ethernet detected as only 10Mbps and
 stalled after some traffic
In-Reply-To: <CAG_g8w71SWc_X2U9pNWLVheO9Jf4ydPznAVp1x-Y9kwU3qhf1A@mail.gmail.com>
References: <CAG_g8w7PND+6r17cLoTG0rG0CqVDA-Z9kr8Zi+TOq5Qbpd9Gtw@mail.gmail.com>
 <CAG_g8w40V_u7JnX+EuNvCLmB2dAzuk_TgMkkKT9pn-SLBRi1pA@mail.gmail.com>
 <20170610152741.GB26740@lunn.ch>
 <CAG_g8w71SWc_X2U9pNWLVheO9Jf4ydPznAVp1x-Y9kwU3qhf1A@mail.gmail.com>
Message-ID: <20170611152102.GA16021@lunn.ch>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

> Thank your for the suggestion, and thanks Martin to explaining me over
> IRC what actually I should do.
> 
> I recompiled mainline kernel 4.12-rc4 with the Amlogic driver:
> replaced drivers/net/phy/meson-gxl.c with
> https://github.com/khadas/linux/blob/ubuntu-4.9/drivers/amlogic/ethernet/phy/amlogic.c
> 
> But this did not solve the issue. As soon as i start git clone i lose
> network connection to device (no session timeout/disconnect this time,
> but I am unable to reconnect over SSH or to get OK ping replay back).

So this shows it is more than a PHY problem. The Ethernet MAC driver
is probably also part of the problem.

Are there any mainline kernels which work O.K?

    Andrew
