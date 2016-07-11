From: b.galvani@gmail.com (Beniamino Galvani)
Date: Mon, 11 Jul 2016 21:48:58 +0200
Subject: [U-Boot] [PATCH v7 0/4] Amlogic Meson GXBaby and ODROID-C2 support
In-Reply-To: <CALeDE9OM__RZT7Re1+bHn0h41Hku9=k_yj_0hqiW8REjsYx0Uw@mail.gmail.com>
References: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
 <57831945.2040009@suse.de>
 <CALeDE9OM__RZT7Re1+bHn0h41Hku9=k_yj_0hqiW8REjsYx0Uw@mail.gmail.com>
Message-ID: <20160711194858.GA12930@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Jul 11, 2016 at 05:23:15AM +0100, Peter Robinson wrote:
> On Mon, Jul 11, 2016 at 4:57 AM, Andreas F?rber <afaerber@suse.de> wrote:

> > Last output:
> >
> > NOTICE:  BL3-1: v1.0(debug):4d2e34d
> > NOTICE:  BL3-1: Built : 17:08:35, Oct 29 2015
> > INFO:    BL3-1: Initializing runtime services
> > INFO:    BL3-1: Preparing for EL3 exit to normal world
> > INFO:    BL3-1: Next image address = 0x1000000
> > INFO:    BL3-1: Next image spsr = 0x3c9
> >
> > I.e., no U-Boot SPL output on serial.
> 
> I see similar on Pine64 with 2016.07rc3

Here the first non-booting commit is:

commit d73718f3236c520a92efa401084c658e6cc067f3
Author: Mingkai Hu <mingkai.hu@nxp.com>
Date:   Thu Jul 7 12:22:12 2016 +0800

    armv8: Enable CPUECTLR.SMPEN for coherency


Mingkai, any ideas about how to debug or fix this?

Beniamino
