From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Tue, 21 Nov 2017 16:40:56 +0100
Subject: [PATCH 0/4] meson8b-odroidc1: ethernet support
In-Reply-To: <20171121115713.GA1752@otheros>
References: <cover.1506507688.git.ingrassia@epigenesys.com>
 <20171002195432.GX6726@otheros> <20171121115713.GA1752@otheros>
Message-ID: <20171121154056.GA17475@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Linus,

On Tue, Nov 21, 2017 at 12:57:13PM +0100, Linus L?ssing wrote:
> On Mon, Oct 02, 2017 at 09:54:32PM +0200, Linus L?ssing wrote:
> > I tried this patchset on an Odroid C1+ with a v4.14-rc3 kernel
> > plus these currently pending patches from this mailing list [0].
> > 
> > I'm observing the following issue:
> > 
> > [...]
> 
> I have some good and some bad news. The good news: I tried with
> a 4.14.0 kernel and did not observe the issue anymore. The bad
> news: I retried the same v4.14-rc3 uImage I used back then and
> could not reproduce it either :-(.
> 
> I'm unaware of having changed anything. Still using the same
> ethernet cable and same, dedicated USB network adapter as a
> counterpart. A couple of weeks ago I was even able to reproduce
> the issue with 4.14-rc6, but that image too does not seem to
> reproduce the issue anymore.
> 
> I'm blaming the cheap USB network adapter or ethernet cable or
> some other connectivity issue outside of the Odroid C1+ for now.
> Sorry :/.
> 

It's ok, don't worry! Thanks for the feedback.

> Regards, Linus
> 

Regards,

Emiliano

> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
