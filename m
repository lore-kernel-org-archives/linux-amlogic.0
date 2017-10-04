From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Wed, 4 Oct 2017 22:16:45 +0200
Subject: [PATCH] ARM: dts: meson8b: add reserved memory zone to fix
 silent freezes
In-Reply-To: <20171003105427.GZ6726@otheros>
References: <20171002155903.19511-1-linus.luessing@c0d3.blue>
 <CAFBinCCde249b0o9aKMErEbKznM7UQrg1FzhLQ2whej0x_XLAg@mail.gmail.com>
 <20171002234755.GA18646@ingrassia.epigenesys.com>
 <20171003072703.GY6726@otheros>
 <20171003082310.GA15501@ingrassia.epigenesys.com>
 <20171003105427.GZ6726@otheros>
Message-ID: <20171004201645.GA23053@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Linus,

On Tue, Oct 03, 2017 at 12:54:27PM +0200, Linus L?ssing wrote:
> On Tue, Oct 03, 2017 at 10:23:10AM +0200, Emiliano Ingrassia wrote:
> > I just completed those tests succesfully. See [0].
> > 
> > > Does the OOM killer work for you there?
> > > 
> > 
> > It seems that OOM killer worked correctly [1].
> 
> That looks good, indeed, weird. Would it be possible for you to
> share the compiled, binary uImage/uInitrd/DTB-file and u-boot you
> are using, which worked for you? I'd like to retry those on my
> Odroid C1+.

My configuration is:

- U-Boot odroidc-v2011.03 [0];
- kernel linux-stable 4.14-rc3 [1];
- Meson8b-odroidc1 USB patch [2], [3].

All compiled with gcc-4.9.4 cross compiler generated with
crosstool-ng 1.22.

Consider that I need to remove the line about address filtering
range in L2 cache node in meson8b.dtsi (arm,filter-ranges)
to boot linux. I think that something is already missing without
the full Martin's SMP patch. We discussed this point the past summer [4].
In this regard, are you experimenting the same issue ?

> Regards, Linus
> 

Regards,

Emiliano

[0] https://github.com/hardkernel/u-boot/tree/odroidc-v2011.03
[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/
[2] http://lists.infradead.org/pipermail/linux-amlogic/2017-September/004767.html
[3] http://lists.infradead.org/pipermail/linux-amlogic/2017-September/004749.html
[4] http://lists.infradead.org/pipermail/linux-amlogic/2017-July/004402.html

> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
