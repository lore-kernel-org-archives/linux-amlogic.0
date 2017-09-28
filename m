From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Thu, 28 Sep 2017 20:37:21 +0200
Subject: [PATCH] ARM: dts: meson: fixing USB support on Meson6, Meson8
 and Meson8b
In-Reply-To: <20170928155626.GH6726@otheros>
References: <20170922115708.GA14806@ingrassia.epigenesys.com>
 <20170924042803.GC2604@otheros>
 <20170925224802.GA31386@ingrassia.epigenesys.com>
 <20170928145141.GG6726@otheros> <20170928155626.GH6726@otheros>
Message-ID: <20170928183721.GA8724@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Linus,

On Thu, Sep 28, 2017 at 05:56:26PM +0200, Linus L?ssing wrote:
> Hi,
> 
> I just noticed this patch from Martin:
> 
>     8a7f0c5 ARM: dts: meson8: add reserved memory zones
> 
> And I simply copied those two reserved memory regions from
> meson8.dtsi to meson8b.dtsi.
> 
> It worked :-) \o/.
> 
> It fixed the following issues for me all together:
> 
> * stress-ng filesystem stressors as mentioned in previous mail all
>   worked now
> * stress-ng memory tests now worked without either not hanging the
>   kernel or at least:
> * fixed the OOM killer and reboot-on-panic. Before, on OOM the
>   system would just freeze silently, even with reboot-on-panic
>   configured (vm.panic_on_oom=1, kernel.panic=10 in systctl.conf)
> * fixed reboots. Before, a "$ reboot" would result in shutdown
>   just fine, but would hang when trying to load the kernel again,
>   right after u-boot (last line: "Starting kernel ...")
> 

Great work!

Would you mind to submit the same patch for Meson8b or ask Martin to do it ?

> Regards, Linus

Thank you,

Emiliano
