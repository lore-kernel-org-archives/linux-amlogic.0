From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 03 Nov 2016 17:57:56 +0100
Subject: stmmac/RTL8211F/Meson GXBB: TX throughput problems
In-Reply-To: <20161031112524.4c4ee8f8@gmail.com>
References: <CAFBinCALSL_-izJ2tEsAjevAw90kGNTrQ3na3D1YV8f1dS1=Xg@mail.gmail.com>
 <ce15ad26-2d07-655d-b813-947ad86696ac@st.com>
 <CAFBinCC0HiEXx5mELztH6jYfUq2f1u0Tb+pSzAvwQSu9vYydGQ@mail.gmail.com>
 <20161031112524.4c4ee8f8@gmail.com>
Message-ID: <1478192276.6632.34.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, 2016-10-31 at 11:25 +0100, Andr? Roth wrote:
> Hi all,
> ?
> > 
> > on my device this results in:
> > [0xc9410018] = 0x2000000
> > [0xc9410030] = 0x0
> > [0xc941003c] = 0x0
> > [0xc9411000] = 0x1100802
> > [0xc9411018] = 0x2202006
> > [0xc9411028] = 0x0
> > 
> > maybe someone else could try the command from above on his device
> > (running the original Amlogic kernel).
> 
> those registers have the same value on an original image from
> hardkernel:?
> 
> Linux odroid64 3.14.65-65 #1 SMP PREEMPT Sat May 28
> 02:50:51 BRT 2016 aarch64 aarch64 aarch64 GNU/Linux
> 
> > 
> > please also state if ethernet is working properly on the original
> > kernel (and preferably which device/board this is).
> 
> yes, the ethernet works flawless in 100 and 1000 Mbit/s on the 3.14
> kernel.

Andre, the 3.14 kernel you are talking, is it this one ? :?
https://github.com/hardkernel/linux/tree/odroidc2-3.14.y

Because in drivers/net/phy/realtek.c, they disable EEE, but
also?1000Base-T Full Duplex advertisement ?

+	/* disable 1000m adv*/
+	val = phy_read(phydev, 0x9);
+	phy_write(phydev, 0x9, val&(~(1<<9)));

If this is the kernel you are running, you should not be able to have
ethernet@1000MB/s ? Or is it in half duplex mode ?

> 
> I can now confirm that both 100 and 1000 Mbit/s do not work properly
> on the 4.8/integ branch. the network connection is interrupted after
> some outbound traffic. it can be recovered by running a ifdown/ifup
> which restarts dhclient, which I think is able to somehow reset the
> interface.?
> 
> Anything I can help to debug the issue further ?
> 
> Regards,
> 
> ?Andr?
> ?
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
