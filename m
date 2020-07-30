Return-Path: <SRS0=1HBj=BJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9629DC433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 11:57:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60E7020829
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 11:57:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A9lED4vM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Mm45+XM1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60E7020829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QEJgai9j06Kj9oDF+lBse2q/q+h/i4fZ0tHzOguYF54=; b=A9lED4vMA5emVU4NGdt+cJ2nV
	B6JLGikD2uWT+QWUNjrUnxM0qWjYUejZ9M5jRJo9lj7sCPPiWB4djaYtm9a0OwotkLqcXmuWrxzv0
	y/Q3Cjbvw2ZYycUMPs4bJbIfeSS08EY49QhD4M4d40CuMXyLNugOhWFJMTMoexVL1R5GlKIwt6rM7
	K72qg2Uj9DP7UTBYtLjy/LR4lFREazm+AU33T7nR9mpyqOJAcFYcuenF30jiRpBXDQFCu6+vyXdRp
	i+tAQe0/UPl6PmUqt/DurLVbpoJZ8ns+dLFY4xZxoR6I6ytVnbYvICRFpaYLUxIRRp0anl2VSyc0t
	J/8/Po7VA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k17Bk-0008O6-35; Thu, 30 Jul 2020 11:57:32 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k17Bg-0008NE-4l
 for linux-amlogic@lists.infradead.org; Thu, 30 Jul 2020 11:57:29 +0000
Received: by mail-wr1-x441.google.com with SMTP id a15so24607096wrh.10
 for <linux-amlogic@lists.infradead.org>; Thu, 30 Jul 2020 04:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=Lk0vtaJ/HwDFlBgWWnoYso6B2Zcq+TTu5FHszftlqR0=;
 b=Mm45+XM1hEHj6wncZG4txKaVupTlTcQ/HnbDx+C3/9sBFXsM6SU/fwzotTVN5kUqTr
 VuOeSA+vXJuv8DV3H/p6koTsuRI/xKIJEdc9KTYBfotxpOeYwt/VmezgagcQ/HuVWoWd
 GtqUMCnOEsbzePC0ATALEq5DCKoBz8u1rob0Yc01ZvRf6TkgS4qmxzOshPHSBlaf37+T
 Y9gxLmwwG96YSzVoDwczXKH2McYjZowQAAb6J+Z9JA+8o7LpdnIlG/zdJxHUf5tjtzPm
 mVnfy39Y8/COKt6Woqsmm6EKiiAicHRpyMEFNZOuNMYOkNWMcrruFOEzUqWPN/pOLsQ3
 oDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=Lk0vtaJ/HwDFlBgWWnoYso6B2Zcq+TTu5FHszftlqR0=;
 b=gKOcz5s7Fd7da2PHyk6EZXgSNx1lQLMUFt20GZ7BEwxLH0chek5fB8gK6yw647ThiQ
 aYIhGNohyKi+oj2XU1ANt/BS/O6USTgx9gpZLGTNw7j6ADk8SwZOLa2TRa0137fT2z5Z
 SYHRmT4Dfh4xwLrUUR3musPMRO2YTSYUQ565tUA0xXZnJ3iarROGsnN8voN2qYw/9Bbv
 a+kkTpjwm3BRXR26qbvxa2zsXEhEDDmDMWm17/p2R+pYr83VFCZYs+1BN6PEVW4g+6o2
 wsEn+INvJEiqf0HQ3LX8M3quJHJnvlkPdoy53PCw9aJXdyUOkj55VKfU301x4Z5AW6/c
 +3qw==
X-Gm-Message-State: AOAM531LpWNnbwieke2DFGmTeVCqZuSb15dHXW5DpQmqLRwhHrxCxw2u
 IMj3+aQVRPD17x93DWKGk07Akw==
X-Google-Smtp-Source: ABdhPJyJLQpjqs5e+nauT4xj/WRjIxKQlhAAydhv+/Ol5/5Ev4HmBpRX0WlricV0ioMnQDKza1LyhA==
X-Received: by 2002:adf:fe05:: with SMTP id n5mr26970112wrr.237.1596110247192; 
 Thu, 30 Jul 2020 04:57:27 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s19sm11185960wrb.54.2020.07.30.04.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 04:57:26 -0700 (PDT)
References: <20200730100209.793-1-linux.amoon@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v1 0/3] Add missing ethernet reset ID for Amlogic SoC
In-reply-to: <20200730100209.793-1-linux.amoon@gmail.com>
Date: Thu, 30 Jul 2020 13:57:25 +0200
Message-ID: <1jeeot8bbu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_075728_336198_28E31F8A 
X-CRM114-Status: GOOD (  11.58  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 30 Jul 2020 at 12:02, Anand Moon <linux.amoon@gmail.com> wrote:

> These patch fix the Ethernet issue on Odroid C2 & Odroid N2 
> Some time Ethernet interface come up but no DHCP request
> is forwaded to the Router, this happens quite offern on
> my side. Adding Reset controller to ethernet node FIx the
> inilization issue.
>

I'm seeing this on other device as well. Strange that it pops up only
now. Change tested on S905x, seems to help.

> -Anand
>
> Anand Moon (3):
>   arm64: dts: amlogic: meson-gx: add missing ethernet reset ID
>   arm64: dts: amlogic: meson-axg: add missing ethernet reset ID
>   arm64: dts: amlogic: meson-g12: add missing ethernet reset ID

None of the patches apply, please rebase on kevin's dt64 branch.

With that, you can add

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

>
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 2 ++
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 ++
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 3 +++
>  3 files changed, 7 insertions(+)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
