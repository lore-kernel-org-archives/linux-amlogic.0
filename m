Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3948AC433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jan 2022 10:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlU4CLd3T2GrNg40O64qmn10fbrsUo0YfeafihUqE0c=; b=mhgcrH7Py9jZ1T
	dIBHaJ3XtobTv/nhphg6/bkbuOabBDtFN4ExPJmlmGFvJC0bkbK14OZ+TmREO7GHyVWHKpqVM6NGp
	XReBv15hHUQbEFSD0noZHkfPdnFrLGH8JDn4OrvOaLVzRSVeB+501qbMJqpPbdJ9QIiEHsHi93/Pr
	cTCWNkyFitt9br6q1WBYq7gbiaaHQfcc79NS0F//oT0/Ej4M4GD/seLHXL+5+75zdpKnhMBQguVRg
	GDqarq06fNKUO8wVCrZ3o4xVtQ7lq9DRngFV7VNnZ9LF3s8T9vnTvjRRqg23R8j5BYl11DK9bmPmi
	XK8mPO45+sR5AD/VsgNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9376-00CJ2u-3w; Sun, 16 Jan 2022 10:50:20 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9373-00CJ2P-8c
 for linux-amlogic@lists.infradead.org; Sun, 16 Jan 2022 10:50:19 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id EC99C5C01DD;
 Sun, 16 Jan 2022 11:50:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1642330215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=23Ejah2uWRbfv6CyA6t6qcXAwX7LkLD/Ma6ASvyQNIE=;
 b=kH85Q7Do0DlM5rRsA7MC/mb2u6MH8voVfyEkO9ootQb6cpezuGkQLTnFhSgWiCP05G485d
 Hp6mKq5PeH91xlP3O1Ekzug5pJje8XG6gCtGw46Mr9BMRW/kiqg2QHrujROj5aUgyVpJD4
 2ofm1SFSXiVplzZeC5GY7bl6rSg/yZ8=
MIME-Version: 1.0
Date: Sun, 16 Jan 2022 11:50:14 +0100
From: Stefan Agner <stefan@agner.ch>
To: Alexander Stein <alexander.stein@mailbox.org>
Cc: narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: (EXT) HDMI CEC on ODROID-N2+
In-Reply-To: <2219762.iZASKD2KPV@kongar>
References: <d2ef8936c54567c9c2652b3c53a82f68@agner.ch>
 <8112d37eaed169735ca8b46e5d587210@agner.ch>
 <772e1613cd49ddac3941ae584e0e89c2@agner.ch> <2219762.iZASKD2KPV@kongar>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <3ed4754d39454354c6ac79ea2256c969@agner.ch>
X-Sender: stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_025017_661341_6095268E 
X-CRM114-Status: GOOD (  22.24  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Alexander,

On 2022-01-16 11:14, Alexander Stein wrote:
> Hi Stefan,
> 
> Am Samstag, 15. Januar 2022, 14:28:01 CET schrieb Stefan Agner:
>> That assumption turned out to be wrong: I used our mainline based U-Boot
>> 2021.10 instead of the Arch Linux ARM U-Boot, and HDMI CEC continued to
>> work.
> 
> Does the mainstream U-Boot work out of the box? Or does it require some 
> additional configuration?
> 

Yes mainline U-Boot works out of the box. Building it is somewhat
involved since it requires extra firmwares (there are build instructions
in the source tree in board/amlogic/w400/README.odroid-n2).

You need to add a boot script to your boot partition. I used the script
part of the uboot-odroid-n2-mainline package as inspiration [1]. It
needs some adjustments as it seems to try to boot from the root file
system directly (and my setup used the FAT/ext4 setup still).

We carry a single patch which improved reliability booting from eMMC,
see [2].


>> I then moved to 5.15.13 as well to rule out any kernel changes. But
>> still, in our configuration HDMI CEC did not work. I ended up diffing
>> configuration, and noticed that we are using built-in CONFIG_CEC_CORE
>> whereas Arch Linux uses it as a module. To build CONFIG_CEC_CORE as a
>> module I had to change some other configuration from built-in to module,
>> namely:
>>
>> - CONFIG_CEC_CORE=m
>> - CONFIG_DRM_DW_HDMI=m
>> - CONFIG_DRM_MESON=m
>> - CONFIG_DRM_MESON_DW_HDMI=m
>>
>> With that change, HDMI CEC started to work in my builds too!
>>
>> With that change, it also works on Linux 5.10.
>>
>> I guess there is some ordering issue or something which makes it fail
>> when those drivers are built-in? Note that I did not change
>> CONFIG_CEC_MESON_G12A_AO, that driver was already a module before.
> 
> You need all 4 options above to be modules? Or is it maybe enough to set 
> CONFIG_DRM_DW_HDMI_CEC=m? This should make CONFIG_CEC_CORE=m as well, while 
> the other modules are built-in.

In our builds I disabled CONFIG_DRM_DW_HDMI_CEC entirely actually.

It seems that CONFIG_DRM_DW_HDMI is tied to CEC_CORE through this
dependency:

config DRM_DW_HDMI
...
        select CEC_CORE if CEC_NOTIFIER

> I suspect at some point a -EPROBE_DEFER is missing.
> 
> Just FYI: Arch Linux aarch64 kernel config currently lacks some drivers for 
> HDMI audio. See [1].

Thanks for the link, just checked, it seems our kernel configuration
covers those.

--
Stefan

> 
> Best regards,
> Alexander
> 
> [1] https://github.com/archlinuxarm/PKGBUILDs/pull/1864

[1]
https://github.com/archlinuxarm/PKGBUILDs/blob/master/alarm/uboot-odroid-c2-mainline/boot.txt
[2]
https://github.com/home-assistant/operating-system/blob/rel-7/buildroot-external/board/hardkernel/patches/uboot/0001-HACK-mmc-meson-gx-limit-to-24MHz.patch

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
