Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C447C76190
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 23:41:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4E772238C
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 23:41:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qvobE1uk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NYZPG4YG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4E772238C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aeby3ywBY3SIACpmyba6X/jihPNfInospf9lm/JlAhs=; b=qvobE1ukYtFX3F
	VQvto9yR8IMCLhqzh7kgO4tMk/2pv/+CkKCikkpf6iYcAWbo4IWxupd+Tp5TcQwc6/4p6GQD8nvtu
	SWqd9YJxFBCiNH3e6Ri5P9nrhq/9DbumW5ZlOt42n4uqO7Rf06KDzn/U4hQGf9y06BeRTKobunn09
	HI9VUtznAxdHKILGtV8B+6v39X0++spLuXqm2RbyxAJ+SiyCFwaiaO+J/IDFvep2xfx+LGoXWwxMi
	BmFOGa+1/T6YzOMByN5fYH+ntFsUGckbyCDewn6tyZaNSfetUF5xNxOyVE9bIDPYMHMkckBtavSQI
	eN9GR+lFHWXgB8YmV91Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqnMX-0001oR-JW; Thu, 25 Jul 2019 23:41:29 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqnMU-0001nd-M2
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 23:41:28 +0000
Received: by mail-pg1-x543.google.com with SMTP id f25so23786485pgv.10
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Jul 2019 16:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=mfnZxOLDEeVO3qt5r3vvVtE+ErJ1uBMl6JY5u4LfgE8=;
 b=NYZPG4YGuOK9pb/2O879xjVVXKhk7WAvahsuMxvB98qIUqyPiOnrQfQ7P+Ixq3MPma
 duSsO5O/64u+E2DWqn5D9KXPJfVirf/E7wKVvcvQiNcVhx+9dgbDE55NwVx+TNdUFPtL
 HvSNEOHGX3NOIDAQ/pq7NQ+imv/wl1pWJXUdb6QOiYLbj793p9+d5af8/iOesOe5lQzm
 lS/0RgANQyEPvRMRa4YecacmiEKGzvpM819v62SGJVVAytNGiVNtL8m3osIFWFdWup3d
 3xF7zo67ZntoeI8Yaft3hgxhzcj+lGU7e4kaRtzhJehqB+RlDKNfFuNEkMxdc4aEElLS
 hXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=mfnZxOLDEeVO3qt5r3vvVtE+ErJ1uBMl6JY5u4LfgE8=;
 b=uebakpLpLu0bhDGYNd3CL77IVpUlP6zkd67ZLK53mDYKjyJyX/4RlXd8aNNigmjC6W
 ThKCYXb98VbcFcxPfxxgqLdnv48efCpmXbsS6owY69KJcmJuZk1lvJm9bDaXMR1aJ6+Z
 AC2PMcxHJiRrGYPdvxbArUqWiOwzgHIVxk6qSvqw/AFeB9kY4W3xTJmjX2y1qrD7kLG4
 GkLgq5VoWo2RyUKoWutpp0lZWXuL8fADu1dDR01JuC4kiNwvP6/UNKKPwwAj84AlQu7J
 bOQ4IxxeFR1WID0VnkeG6xV+mI5c0CiP0oQIDO9BxAWNXp7vU3kvKygrYOxKzeYG+DkK
 zz+Q==
X-Gm-Message-State: APjAAAUeZ95e0aLypCbpQTMiOw4pvCKh925sW0uNjcQrbuSW/p0Gb+m0
 Kq/lnXP9UZovyEDif6+LUM0eB/PPvcKSZw==
X-Google-Smtp-Source: APXvYqzhoS3YtUHt0ZnWmTrTLKzKcKwKjxpCWou1XYaUkEeTyPdkWoXNaQqca3bgA+hs4A+tDUQLAw==
X-Received: by 2002:aa7:8201:: with SMTP id k1mr18609232pfi.97.1564098085191; 
 Thu, 25 Jul 2019 16:41:25 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:c1da:f078:8d:a297])
 by smtp.googlemail.com with ESMTPSA id s11sm49036956pgv.13.2019.07.25.16.41.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Jul 2019 16:41:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Xavier Ruppen <xruppen@gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: odroid-n2: keep SD card regulator
 always on
In-Reply-To: <20190719192954.26481-1-xruppen@gmail.com>
References: <20190719192954.26481-1-xruppen@gmail.com>
Date: Thu, 25 Jul 2019 16:41:20 -0700
Message-ID: <7htvb9smvz.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_164126_751676_1B39C1EC 
X-CRM114-Status: GOOD (  11.13  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: narmstrong@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-kernel@vger.kernel.org, Xavier Ruppen <xruppen@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Xavier Ruppen <xruppen@gmail.com> writes:

> When powering off the Odroid N2, the tflash_vdd regulator is
> automatically turned off by the kernel. This is a problem
> when issuing the "reboot" command while using an SD card.
> The boot ROM does not power this regulator back on, blocking
> the reboot process at the boot ROM stage, preventing the
> SD card from being detected.
>
> Adding the "regulator-always-on" property fixes the problem.
>
> Signed-off-by: Xavier Ruppen <xruppen@gmail.com>

Thanks for the fix and the detailed background description.

Queued as a fix for v5.3.

Note that I also added this to the commit log, for the benefit of anyone
wanting to backport.

Fixes: c35f6dc5c377 ("arm64: dts: meson: Add minimal support for Odroid-N2")

>
> Here is what the boot ROM output looks like without this patch:
>
>     [root@alarm ~]# reboot 
>     [...]
>     [   24.275860] shutdown[1]: All loop devices detached.
>     [   24.278864] shutdown[1]: Detaching DM devices.
>     [   24.287105] kvm: exiting hardware virtualization
>     [   24.318776] reboot: Restarting system
>     bl31 reboot reason: 0xd
>     bl31 reboot reason: 0x0
>     system cmd  1.
>     G12B:BL:6e7c85:7898ac;FEAT:E0F83180:2000;POC:F;RCY:0;
>     EMMC:800;NAND:81;SD?:0;SD:400;USB:8;LOOP:1;EMMC:800;
>     NAND:81;SD?:0;SD:400;USB:8;LOOP:2;EMMC:800;NAND:81;
>     SD?:0;SD:400;USB:8;LOOP:3; [...]
>
> Other people can be seen having this problem on the odroid
> forum [1].
>
> The cause of the problem was found by Martin Blumenstingl
> on #linux-amlogic. We may want to add his Suggested-by tag
> if he agrees.

Added.

Thanks!

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
