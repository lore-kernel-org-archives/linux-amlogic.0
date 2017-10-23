From: linus.luessing@c0d3.blue (Linus =?utf-8?Q?L=C3=BCssing?=)
Date: Mon, 23 Oct 2017 09:47:21 +0200
Subject: [PATCH] ARM: dts: meson8b: add reserved memory zone to fix
 silent freezes
In-Reply-To: <20171004201645.GA23053@ingrassia.epigenesys.com>
References: <20171002155903.19511-1-linus.luessing@c0d3.blue>
 <CAFBinCCde249b0o9aKMErEbKznM7UQrg1FzhLQ2whej0x_XLAg@mail.gmail.com>
 <20171002234755.GA18646@ingrassia.epigenesys.com>
 <20171003072703.GY6726@otheros>
 <20171003082310.GA15501@ingrassia.epigenesys.com>
 <20171003105427.GZ6726@otheros>
 <20171004201645.GA23053@ingrassia.epigenesys.com>
Message-ID: <20171023074721.GB2049@otheros>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Kevin,

Just wanted to let you know that Emiliano and I are currently
debugging further off-list.

So far I can reproduce that:

a) For the binary kernel image Emiliano sent me I can reproduce
his hang ups during boot on my Odroid C1+.
b) The 2MB reserved memory region this patch adds does not help
for this image.
c) Removing the "arm,filter-range" as proposed by Emiliano back
then instead of adding this reserved memory zone fixes my freezes
during boot in Emiliano's image and during stress-ng for my kernel
image, too.

I'm currently continuing to bisect which difference in Emiliano's
and my kernel image makes mine boot successfully but not
Emiliano's. (And I'm continuing reading and testing with the
filter-range option to better understand what it's presence - or
absence - does exactly)


If these observations ring a bell for anyone here, I'd be curious
to hear what they think.

Regards, Linus
