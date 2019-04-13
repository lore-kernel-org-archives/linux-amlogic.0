Return-Path: <SRS0=Clcc=SP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F381EC282DA
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 18:55:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C03CF2147A
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 18:55:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iw1Dnm68"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C03CF2147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWpPIcy1wkb+QrmkUUsugOHKjbj9HbRFwR4TsbV9iTo=; b=iw1Dnm68Z/C4an
	sW1Vp9cC1KxCLBxLAyKKv0hqVQPCeCrYzPrDlk/pNmx5tB5S6U+BAeHT9PlrrPDh0kbElZRtt8cW4
	8eHk7+lwWdPVyg6od4Ip1+6/ZXkQPJesekbIGKIRHp6T6wc7LGkL0GPgOREFX4u6wULmJNCTkoqse
	4VcYtLtaKDNMaPP6aIbgFOkgWT3TGBmTSO8qabXiHh6fyuegAQYxgim23tLLDk8FvZph2Vm7rFsod
	Pp5MewULnsPq18SEhgz3LV0KpJVRhRpR8fh0Oz7WB4yEselbtB1pJ+21O+Q4Mima30uGUPqHxOhI9
	XFVC45bzUk+IVp0V87lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFNnj-0002Yd-8N; Sat, 13 Apr 2019 18:54:55 +0000
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFNnb-0002T8-Jc
 for linux-amlogic@lists.infradead.org; Sat, 13 Apr 2019 18:54:50 +0000
Received: from mail-qt1-f173.google.com ([209.85.160.173]) by mwinf5d69 with ME
 id zuue1z00D3klxEx03uufth; Sat, 13 Apr 2019 20:54:41 +0200
X-ME-Helo: mail-qt1-f173.google.com
X-ME-Auth: bWF4aS5qb3VyZGFuQHdhbmFkb28uZnI=
X-ME-Date: Sat, 13 Apr 2019 20:54:41 +0200
X-ME-IP: 209.85.160.173
Received: by mail-qt1-f173.google.com with SMTP id t28so14981843qte.6;
 Sat, 13 Apr 2019 11:54:39 -0700 (PDT)
X-Gm-Message-State: APjAAAVW0ZGpHoUk7eYXcZ/5Ul/tBxNtwWUK5KBqO3RrnkjcpyywWRu8
 3HiYRtoh76bLvBBilyYMIOz9LL4y4iyM9DPj49c=
X-Google-Smtp-Source: APXvYqyAIWGms/Ld5bHH3b4v+Cz5YdDsV/LyEGeqCqanUCVawbKdZ5JICupwPjN+cCQlPSW3cprP3aUaVOH0a3xXOj4=
X-Received: by 2002:ac8:38f5:: with SMTP id g50mr51218724qtc.119.1555181678353; 
 Sat, 13 Apr 2019 11:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190413171532.25967-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190413171532.25967-1-martin.blumenstingl@googlemail.com>
From: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
Date: Sat, 13 Apr 2019 20:54:27 +0200
X-Gmail-Original-Message-ID: <CAHStOZ5Pe9LvDk4cKAVB4SS5wgFcK-bweFTqU_mnEhOAyZKHuA@mail.gmail.com>
Message-ID: <CAHStOZ5Pe9LvDk4cKAVB4SS5wgFcK-bweFTqU_mnEhOAyZKHuA@mail.gmail.com>
Subject: Re: [PATCH 0/3] 32-bit Meson: add the canvas module
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_115447_923549_D4BA68FA 
X-CRM114-Status: GOOD (  23.24  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: mjourdan@baylibre.com, linux-amlogic <linux-amlogic@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,
On Sat, Apr 13, 2019 at 7:15 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> This adds the canvas module on Meson8, Meson8b and Meson8m2. The canvas
> IP is used by the video decoder hardware as well as the VPU (video
> output) hardware.
>
> Neither the VPU nor the video decoder driver support the 32-bit SoCs
> yet. However, we can still add the canvas module to have it available
> once these drivers gain support for the older SoCs.
>
> I have tested this on my Meson8m2 board by hacking the VPU driver to
> not re-initialize the VPU (and to use the configuration set by u-boot).
> With that hack I could get some image out of the CVBS connector. No
> changes to the canvas driver were required.
>
> Due to lack of hardware I could not test Meson8, but I'm following (as
> always) what the Amlogic 3.10 vendor kernel uses.
> Meson8b is also not tested because u-boot of my EC-100 doesn't have
> video output enabled (so I couldn't use the same hack I used on my
> Meson8m2 board).
>
> This series meant to be applied on top of "Meson8b: add support for the
> RTC on EC-100 and Odroid-C1" from [0]
>
>

The series looks good to me, however I wonder if we should maybe add a
new compatible ?

The canvas IP before the GX* generation does not handle what Amlogic
calls "endianness", the field that allows doing some byte-switching to
get proper NV12/NV21. So the following defines are unusable:

#define MESON_CANVAS_ENDIAN_SWAP16 0x1
#define MESON_CANVAS_ENDIAN_SWAP32 0x3
#define MESON_CANVAS_ENDIAN_SWAP64 0x7
#define MESON_CANVAS_ENDIAN_SWAP128 0xf

It wouldn't change much functionally, but we could have e.g a warning
if a m8 canvas user tries to set endianness even though it does
nothing.

Maxime

> [0] https://patchwork.kernel.org/cover/10899509/
>
>
> Martin Blumenstingl (3):
>   ARM: dts: meson8: add the canvas module
>   ARM: dts: meson8m2: update the offset of the canvas module
>   ARM: dts: meson8b: add the canvas module
>
>  arch/arm/boot/dts/meson8.dtsi   | 21 +++++++++++++++++++++
>  arch/arm/boot/dts/meson8b.dtsi  | 21 +++++++++++++++++++++
>  arch/arm/boot/dts/meson8m2.dtsi | 10 ++++++++++
>  3 files changed, 52 insertions(+)
>
> --
> 2.21.0
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
