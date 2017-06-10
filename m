From: andrew@lunn.ch (Andrew Lunn)
Date: Sat, 10 Jun 2017 17:27:41 +0200
Subject: ARM GLX Khadas VIM Pro - Ethernet detected as only 10Mbps and
 stalled after some traffic
In-Reply-To: <CAG_g8w40V_u7JnX+EuNvCLmB2dAzuk_TgMkkKT9pn-SLBRi1pA@mail.gmail.com>
References: <CAG_g8w7PND+6r17cLoTG0rG0CqVDA-Z9kr8Zi+TOq5Qbpd9Gtw@mail.gmail.com>
 <CAG_g8w40V_u7JnX+EuNvCLmB2dAzuk_TgMkkKT9pn-SLBRi1pA@mail.gmail.com>
Message-ID: <20170610152741.GB26740@lunn.ch>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

> Also what Martin Blumenstingl wrote is following which is also crucial
> for fixing the issue:
> Amlogic has given their ethernet PHY driver some updates [2], it now
> includes wake-on-lan, and they now have an internal_phy_read_status
> which uses reset_internal_phy if there's a link and some error counter
> exceeds some magic value.

Hi Crow

You could probably just drop the Amlogic driver into mainline and see
if it works better. If that solves your problem, we can look at
merging the changes.

	Andrew
