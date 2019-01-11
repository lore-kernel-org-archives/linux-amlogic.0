Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80587C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 14:29:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 520B22063F
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 14:29:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SIHcD+q5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="f3xk4iLQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 520B22063F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ayu51MH6mKcDNCPTB7926O6LO/6XhLhqRukQUzsv/6A=; b=SIHcD+q5Yb/KEq
	p73UOuJbK41szJsriXOHqmveRHKy+p4UrSHL8W3hCz57y9bCS0z4iJJa8BmTggChDbC0FHBKWVR8M
	qg37QtZdiBtUlYXgVqhGrFGfNIsNVsUfmuW5Q4RhD0b5hZTvaEYwwbx+Joc0gO8f/PvSxZrs010x7
	t87FmM4IpYoSNYs5QSkT5cLQwZ4o9n/UK+FMlUxwy7L+V4KfbGu+wjmq4X64YJm9/lHJuAhfNxkXy
	moNnMnjmMahOfgQ7HU2SRMafuITVznlcMUZP8s+yMaH7tkvVxOsaC3Du+6ZNsI/vP1PqXYKueqojV
	b6RaV4Nkyb67foPSMj1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghxnv-0007AD-Vo; Fri, 11 Jan 2019 14:28:59 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghxnt-00079N-Lp
 for linux-amlogic@lists.infradead.org; Fri, 11 Jan 2019 14:28:59 +0000
Received: by mail-lf1-x143.google.com with SMTP id l10so10902978lfh.9
 for <linux-amlogic@lists.infradead.org>; Fri, 11 Jan 2019 06:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a68uOIb5ZDVt/3oFh0J5AJJs418dr+JmnW1hZ4ubUw4=;
 b=f3xk4iLQIbRtksZiPsGNWVpN2YF29MeyhjoPA7WsereW42MwDsyL2g1Ytp0E3vsNKm
 hIX7/zDnYD3A6256FUcucP2sY2xhhoRmKreDCQVpoLwEyGV4niu26sDcpcdlQxsuaUUw
 pO1M7u5DUxZRPIx5f/Lsp3DJzZLVwfV5253Kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a68uOIb5ZDVt/3oFh0J5AJJs418dr+JmnW1hZ4ubUw4=;
 b=HPhaKAO5KOJSImJJ5TvnKHwbetCXCuKn0NPabSJsSiNp63abZedqChxmGJtaqmhwrY
 0ghAdT9ahnod8L9XKG6mWvXbU+A34UQzftoBBPhkOWorewe1Xo0qCZFouqcf/GLvg62c
 DN9+V0HLbR7esIfvnsQLcNfUT5ZW8JwHPeutYjOHGGm0Hd7V9uV0AXsr00iCzYin1O4n
 0DFyJWWH9tChs2LgL7LO1qCSnV//Kh0uGUZn50JT2aS/SEXjLLMFf3pV+98OOB2o8S6i
 Vj0SlpAsQ8Qtw32/FUS0V6WE4fU4AX8L2VmQlmGoUUr+93aXiR3Se9jHy3PC9monygUf
 oBLw==
X-Gm-Message-State: AJcUukd4r1tL/WA+B85SSCjCIMTMOmFZKMLon2YXi7TWdY7R2/GU5MmT
 wsR4fL83nxsXcg1QnIPWte6MdomquniuMDa7bglizg==
X-Google-Smtp-Source: ALg8bN5hFINfVBmhOZ2HmXhdjlyAZ04TFQAsAfgHaLttPizJlepmSC215GQ61tU3bonAeZ2fHtisULHDFk9QejRZ09E=
X-Received: by 2002:a19:f813:: with SMTP id a19mr7894964lff.67.1547216935938; 
 Fri, 11 Jan 2019 06:28:55 -0800 (PST)
MIME-Version: 1.0
References: <20190101194414.24766-1-martin.blumenstingl@googlemail.com>
 <20190101194414.24766-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190101194414.24766-2-martin.blumenstingl@googlemail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jan 2019 15:28:44 +0100
Message-ID: <CACRpkdYTQjiPbLGQ8E_mByAY0e_byN8iW=jBVPw3QRxh4_fB_A@mail.gmail.com>
Subject: Re: [PATCH 1/1] mmc: core: don't override the CD GPIO level when
 "cd-inverted" is set
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_062857_738501_608C8CF9 
X-CRM114-Status: GOOD (  16.22  )
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

I applied this to the GPIO fixes with the ACKs.

Ulf is on vacation but I managed to get his ACK over chat,
so I will try to get this upstream ASAP.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
