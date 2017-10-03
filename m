From: linus.luessing@c0d3.blue (Linus =?utf-8?Q?L=C3=BCssing?=)
Date: Tue, 3 Oct 2017 12:54:27 +0200
Subject: [PATCH] ARM: dts: meson8b: add reserved memory zone to fix
 silent freezes
In-Reply-To: <20171003082310.GA15501@ingrassia.epigenesys.com>
References: <20171002155903.19511-1-linus.luessing@c0d3.blue>
 <CAFBinCCde249b0o9aKMErEbKznM7UQrg1FzhLQ2whej0x_XLAg@mail.gmail.com>
 <20171002234755.GA18646@ingrassia.epigenesys.com>
 <20171003072703.GY6726@otheros>
 <20171003082310.GA15501@ingrassia.epigenesys.com>
Message-ID: <20171003105427.GZ6726@otheros>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Oct 03, 2017 at 10:23:10AM +0200, Emiliano Ingrassia wrote:
> I just completed those tests succesfully. See [0].
> 
> > Does the OOM killer work for you there?
> > 
> 
> It seems that OOM killer worked correctly [1].

That looks good, indeed, weird. Would it be possible for you to
share the compiled, binary uImage/uInitrd/DTB-file and u-boot you
are using, which worked for you? I'd like to retry those on my
Odroid C1+.

Regards, Linus
