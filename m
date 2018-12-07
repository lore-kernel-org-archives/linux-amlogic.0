Return-Path: <SRS0=njkK=OQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B79C07E85
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 04:14:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E54192082D
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 04:14:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I9MbzJ1r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Dj3/cZ/i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E54192082D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvBfIoHxFEIq1UOehFfvQGJSKhXvG3hy8QjNve/Zcck=; b=I9MbzJ1rWRjpYp
	XuwDPQIi6cft0J/wqoP8fZyBbx54i9rbkwHudIhHnr89YLZPL2qF4z0LiEf/6cCHznYCP8BDD3RLH
	YOV5v+eVATFC/9SsWIbs6kHRgcQxHV6BzMLL+Wg13n3hzKDWva3ANbjKNZpgHzKZPu2rUh5GuJIBF
	MsjeiGyXsCHKpuYayleM07O4jcEAIq3f2V0XG+KZYaJRSOLCYtYxRhn66j38pYGBM/SO+jQ5PvA7e
	Mq2pGT+1NDYwRkztVrjn6gK9SnY208BKSBSJbWf5jCM1XKiSlHvzpSrWN4IT/ujO8+8tGeWz/MDpg
	26K7TPrR8PbAGkeGPz5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gV7XL-0001G0-LB; Fri, 07 Dec 2018 04:14:47 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gV7XG-0001Eq-3c
 for linux-amlogic@lists.infradead.org; Fri, 07 Dec 2018 04:14:46 +0000
Received: by mail-pg1-x542.google.com with SMTP id n2so1126952pgm.3
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Dec 2018 20:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=P1bt02fANhFdAVD7g2rytmwCWGeqm8IJCrVWqQj7s78=;
 b=Dj3/cZ/iUTq1qZsvfJiGYeThnLz53HSQxl7LM3jpJxURSmG1u5sPjaV9hfMrnqQNDF
 OLIKasCBzpFunMGiD4M5Apc3+JDgzdcqhIZtzjn6lnHiX3/nrQXeBlwuyPPsDC7O/nSa
 wCdz7u/LKUjO/SDuFqlBJ8ZTg47DXRxmpfwIaEm/rjiOD7Y0OuLsump7dFGiRoI0EG2i
 kXteKiHgel3Ta4jIytsWtplWNS9Ds0b+OKvQFNR5RAKQunJAOvtPudKUPakF5P96Jg1k
 mwueBj7CBYLiMxTLA0AfRyQnQwL7cj5NvGzNAPFRQjszsye+mzXgs4iF+/2NgNmEgOiR
 o8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=P1bt02fANhFdAVD7g2rytmwCWGeqm8IJCrVWqQj7s78=;
 b=IrxFiwo9VE8hUN5YQ2CAkzu6ltmgqoXJuoa2etrb4AKLpnqeEC+CJfHW/tc4SAxJ75
 f2lQj7xIbEI4HOHOGEDlwTkQbun+hwAahAjKMTUvDoDEcfwmf1rpIlrKVMENR+euGBNr
 9mhSlTauVDMroEsNZlM1ufaA4NbYXnjQlO/Z+HwY0SPmMqAPqQu8QfvhDXqeoRf58TeZ
 wvnCS+MicZi7Hzg5LwMcsGq49Ie7dWaYbd+lYQwGGdXsTY052js0Tj6T0gOXvLuSACJM
 t+X0jGHhw7Qs4q/2nYSmYOPbISjHPUUiVUKjYj9DMlfD3LO9f6GFBS1dl+dJeEemIRAe
 PATw==
X-Gm-Message-State: AA+aEWbmvkCdZffod/st34xpcfKe4HdzYqb9d+gD2ORMecus1ssejr9A
 v9TYvbCxcP8hA+G5122ydiZ7Rg==
X-Google-Smtp-Source: AFSGD/VybCz8JxQe9x0JmayjV9wGDDCoH50TreUVeMuNu6N3kDsDr4uLU4amPeZ2CPDYFfjXa99OdQ==
X-Received: by 2002:a63:4f20:: with SMTP id d32mr641015pgb.47.1544156069426;
 Thu, 06 Dec 2018 20:14:29 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id g5sm3009362pgu.57.2018.12.06.20.14.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Dec 2018 20:14:28 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Carlo Caione <carlo@caione.org>
Subject: Re: [PATCH 0/4] mmc: meson-gx: chained descriptor fixup and
 improvements
In-Reply-To: <20181206151828.24417-1-jbrunet@baylibre.com>
References: <20181206151828.24417-1-jbrunet@baylibre.com>
Date: Thu, 06 Dec 2018 20:14:28 -0800
Message-ID: <7hva46x9az.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_201442_210754_F1FAC504 
X-CRM114-Status: GOOD (  13.69  )
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
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> The goal of the patchset was mainly to address the following warning:
>
> WARNING: CPU: 0 PID: 0 at /usr/src/kernel/drivers/mmc/host/meson-gx-mmc.c:1025 meson_mmc_irq+0xc0/0x1e0
> Modules linked in: crc32_ce crct10dif_ce ipv6 overlay
> CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         4.19.1 #1
> Hardware name: Some A113 Board (DT)
> pstate: 40000085 (nZcv daIf -PAN -UAO)
> pc : meson_mmc_irq+0xc0/0x1e0
> lr : __handle_irq_event_percpu+0x70/0x180
> sp : ffff000008003980
> x29: ffff000008003980 x28: 0000000000000000
> [...]
> x1 : ffff80001a71bd40 x0 : 0000000000000000
> Call trace:
>  meson_mmc_irq+0xc0/0x1e0
>  __handle_irq_event_percpu+0x70/0x180
>  handle_irq_event_percpu+0x34/0x88
>  handle_irq_event+0x48/0x78
>  handle_fasteoi_irq+0xa0/0x180
>  generic_handle_irq+0x24/0x38
>  __handle_domain_irq+0x5c/0xb8
>  gic_handle_irq+0x58/0xa8
>
> This happens when using the chained descriptor mode. If there is an
> error, we call mmc_request_done(), loosing any reference to the cmd. It
> turns out that the chained descriptor does really stops when we do so, at

I think you mean...

s/does really stops/does not really stop/

> least not completly. Most of the time, it can be seen with this harmless
> warning because the descriptor will raise another unexpected IRQ. On rare
> occasion, it will completly break the MMC.
>
> This is mostly adressed by patch #1.
> With this fixed, I took (yet) another look at the ultra-high speed modes
> and the tuning.
>
> I came up with new settings in patch 3 and 4. I've tested them on eMMC,
> sdcard and sdio on the following platforms:
>  * gxbb p200
>  * gxl p230, libretech (eMMC only), kvim.
>  * axg s400
>
> So far, these new settings seems to be working great but I think it
> would be nice if others could test this and provide their feedback.
> This why  patch 3 and 4 are RFT tagged.

For broader testing, I've added this to my v4.21/testing branch, which
is included in my integ branch which gets a spin through kernelCI.

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
