Return-Path: <SRS0=hrph=PL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BB7C43387
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jan 2019 22:06:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 277E721479
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jan 2019 22:06:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lIDS4B1l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hbd1jrD7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 277E721479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNXRdBMcWpIU8mvKBMAn7zLFn7BEi+mlo7K4dvqBfX8=; b=lIDS4B1lC5195Z
	zDNWUH6DAxGlkLxHOpvYuJGtknzoxXB5Zk0fEg9nQ1X8R+963aNRv7eO5B6IoqiTW1VNJhpfK2KzD
	PIVSLUYsUe7UECvhwTiu3VkmRKVZFa8/OMF7jZFmazbYYO8bTguaODuTK7Z5xeycFy5n6GcKYN5W3
	+zDrPLQn+IMuF36BNiduXeXO9nla2pnvxyWrOzFDe1R/EofDCenMIIcgJp143LdPO2WMd1LFfx9+g
	Vxo0E7gPMeEbPjGErJkzKI/HQUnSqBKQCYZgGAklE71zplzXjXlpkE1FpNPSvofTUrKuNXHBtEhg6
	ir0t0jUG4McC2QvqtK+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gfB85-0008PJ-Le; Thu, 03 Jan 2019 22:06:17 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfB82-0008Oc-QG
 for linux-amlogic@lists.infradead.org; Thu, 03 Jan 2019 22:06:16 +0000
Received: by mail-lf1-x143.google.com with SMTP id c16so24186942lfj.8
 for <linux-amlogic@lists.infradead.org>; Thu, 03 Jan 2019 14:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QANzhaPy2nInN5aENUoqLEJcdEF1QIInnXqWfKquhOc=;
 b=Hbd1jrD7A+vhILx94F/SWpVdty2SiC8QhLzF2aEBsuBUeqzp2oNXvc/PVHmpDewDC3
 SB68Nyh5j5/V+hKR7sawydxDYHMd/WQjC5uTkiQVHUlz3ghpiReKLvexEpHLg3j91Owy
 8+yLJ2xMs+JzwcJ5Z76kdmNmH4o0IV5gzrNuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QANzhaPy2nInN5aENUoqLEJcdEF1QIInnXqWfKquhOc=;
 b=nQ84DrkGACfy4PfCvhowbA6h+L8hl5GZ3laHN+sUXLi7KuhetGhe5vmazwTf6lJaBg
 tWRbTPgCZabkLdjCWWUpSYhxpiaMdfI/2FPpuV3wgDzvhVYg1mvEL78IsQpbml/gwxU2
 uvxy+6ezaH6tZg8J4Uo6k/1NkF1IWQ7r1JhPQjQVEKW5njHNht36paBX8iYRkSRSFmCw
 W1wxgWZm53KCPXPUd3LCiNLJxKlOwCsKUli+5NGsdCz7w6JNP8ILzqG/R9+rdfym69jG
 fPuWoDOXiU//RV42dVe+rOteEVL0bhXFnnV+0jdrZxukmFmCO2AEheZfbQhW9QB5j4Fi
 5Lfg==
X-Gm-Message-State: AA+aEWamIrMzY038RbkP1q2Vz0CE/9p+XMwHpIsQC8MOLKiDW9shVYcr
 xW3csXsDe9c07/oqtlac/SyQDjTeb4l7+Ng5ZCBNkg==
X-Google-Smtp-Source: AFSGD/V6sctot3rrsm0a1rVanqephXcBXWfb5keoZcQC1sH4d3mWuWxkF+m3ZZkEo45EGjf4qFfoZ73jur3SLZ8zHC0=
X-Received: by 2002:a19:41c4:: with SMTP id o187mr25749042lfa.32.1546553170201; 
 Thu, 03 Jan 2019 14:06:10 -0800 (PST)
MIME-Version: 1.0
References: <20190101194414.24766-1-martin.blumenstingl@googlemail.com>
 <20190101194414.24766-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190101194414.24766-2-martin.blumenstingl@googlemail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Jan 2019 23:05:57 +0100
Message-ID: <CACRpkda8cSt7J8+2P1xpOn13KkS_xmeO1MBRR9dXZcWXgzpQwQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mmc: core: don't override the CD GPIO level when
 "cd-inverted" is set
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190103_140614_855788_720FA0FE 
X-CRM114-Status: GOOD (  15.25  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Jan 1, 2019 at 8:44 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> Since commit 89a5e15bcba87d ("gpio/mmc/of: Respect polarity in the device
> tree") gpiolib-of parses the "cd-gpios" property and flips the polarity
> if "cd-inverted" is also set. This results in the "cd-inverted" property
> being evaluated twice, which effectively makes it a no-op:
> - first in drivers/gpio/gpiolib-of.c (of_xlate_and_get_gpiod_flags) when
>   setting up the CD GPIO
> - then again in drivers/mmc/core/slot-gpio.c (mmc_gpio_get_cd) when
>   reading the CD GPIO value at runtime
>
> On boards which are using device-tree with the "cd-inverted" property
> being set any inserted card are not detected anymore. This is due to the
> MMC core treating the CD GPIO with the wrong polarity.
>
> Disable "override_cd_active_level" for the card detection GPIO which is
> parsed using mmc_of_parse. This fixes SD card detection on the boards
> which are currently using the "cd-inverted" device-tree property (tested
> on Meson8b Odroid-C1 and Meson8b EC-100).
>
> This does not remove the CD GPIO inversion logic from the MMC core
> because there's at least one driver (sdhci-pci-core for Intel BayTrail
> based boards) which still passes "override_cd_active_level = true" to
> mmc_gpiod_request_cd(). Due to lack of hardware for testing this is left
> untouched.
> In the future the GPIO inversion logic for both, card and read-only
> detection can be removed once no driver is using it anymore.
>
> Fixes: 89a5e15bcba87d ("gpio/mmc/of: Respect polarity in the device tree")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

OK two steps forward, one step back, that's a good fix for now, I
can fix it properly for v4.22.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
