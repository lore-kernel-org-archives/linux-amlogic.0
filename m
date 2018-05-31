From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 31 May 2018 14:41:01 +0200
Subject: problem after HDMI patch on Odroid C2
In-Reply-To: <CAFW1BFxsG+ahDBPYcX9jriqT9HHAPZb0=zuZmt-T8o1sSB2+Zw@mail.gmail.com>
References: <CAFW1BFxsG+ahDBPYcX9jriqT9HHAPZb0=zuZmt-T8o1sSB2+Zw@mail.gmail.com>
Message-ID: <c36677ad-8677-24eb-08d8-93eb7e103817@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Michal,

On 31/05/2018 10:25, Michal Lazo wrote:
> Hello
> I added HDMI patch for 4.17 rc7
> https://github.com/superna9999/meta-meson/blob/topic/mesa-lima/recipes-kernel/linux/linux-yocto-meson64-4.17/0001-dw-hdmi-fix-mutex-error.patch
> with uboot 2018.05
> 
> builded with armbian
> hw: odroid c2
> 
> and now I get this when I plug in HDMI cable
> https://pastebin.com/52XVWvKT
> 

Thanks for reporting this issue, it's a known issue without any consequences (for now ?)
and I started trying to fix it, but it has more consequences I need to figure out.

Thanks,
Neil

> Best Regards
> 
> 
> Michal Lazo
> michal.lazo at mdragon.org
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
