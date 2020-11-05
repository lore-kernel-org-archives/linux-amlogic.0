Return-Path: <SRS0=vaug=EL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032A2C00A89
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 09:57:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78D022080D
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 09:57:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XyQrIRmL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qL2v+cFy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78D022080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:From:References:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPgYYIqRIF/P0msngTNXxec371u6b8yqciKXFXVvwcM=; b=XyQrIRmL9H4SCXim3CKRk2ozIf
	GPVOqc89fJZiVcVZDDR4pdTYqMXaFVC0AilxPltxf86P1hvdZccUt7hQkDKA3XDTgUQMlDgzsDmQW
	nVQiTCl7xmXaVdIQvCPMaeBcUJQYUNa7bJ8eMJH4LaKexygBOW0ZvR3aXFr77RC5dlXPSzMdtmnwh
	Y+/AGvZtgXIjjcdIiPw4BB7G9R+YemBJGIACTrxjY8h9DktoL47s6yZ0WoApHPHIEHRZ136GSrPwp
	cMoQyAhJTvgBwQsqmm1h8oIDhKEPQxg0eGYR59xw1cGxoXgGYFk8SmN6pT23ITJE2SaPl0ehq68uM
	Uosz/QmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kac1X-0006wV-Dc; Thu, 05 Nov 2020 09:57:43 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kac1T-0006vA-Et
 for linux-amlogic@lists.infradead.org; Thu, 05 Nov 2020 09:57:40 +0000
Received: by mail-wm1-x344.google.com with SMTP id p22so938222wmg.3
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2020 01:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:message-id:date
 :mime-version; bh=+TGCsofaUmGr6nzBBKHycjrA1R9jwaok57A4MZa2F4s=;
 b=qL2v+cFyY+xkNZuz62SNoRVKfbb7gAFxwYzWEzvhFokyqCAW5pUpNM8cK/97gxBCWt
 8vjrtf2DfmiobWuHVXfZ5QDWUO3Y8pfBNX/XrTE7TFFiZe8GqFxDha31JZ8G8i1Zg0OS
 RNgjo36tkYcwTb/kcEYd8iZI82+iJrOdLruzhzcrJ/p2stPUiVekKH8gI6xmEjKdJCZ4
 JAkkBJioNpXPUJ4h4+S1l3juH2MUGNSXKkL+17dgUPhPeGsfqLeexUsovnjVxZ2EH/Gd
 itQnODenm3N+cKFm0VkruGfx40I9yh2gufwytLY08l/37xAp6GURsV1xAWNtiq0vLber
 Tg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:message-id:date:mime-version;
 bh=+TGCsofaUmGr6nzBBKHycjrA1R9jwaok57A4MZa2F4s=;
 b=TQgx7oCnkp0SFow9ESROTGaJtOBL9IJQ7EAGG10ROJGwgu0ot9eSuEjgX3gaVnyBMJ
 2V5wmxnSBiW3TwRh3/uUms57HB7Qw0FfWH+9w8xb1gz+91IzAqlxJ2aobhDLo1aRDeGK
 oHF/CZ+O9fGF9BWdKCScN1O4RUojnnomvcZ6AW1pIl5tZ8+TGpZ44FJ0UEjNgnyc1jm+
 yYFtlYrfpLnVO3xBmCJzAGdx4+h+7jEtGypcrjZa7HiZbbFnyby1zHjsBaZnkt2DF8Qc
 llCvfqaGUJdhmKgOxrBqmQpwt7Omb3qtHtqAn+T8Pg2vLUKfiMjiJtz9KW4eGHxpMYuX
 VYuA==
X-Gm-Message-State: AOAM531/n0hSUvg0NoCnEYyn864pwn6Qy4fAiNqhT/XwPDSdASq1LyfU
 uLjMQjW3wedROeSIExATNJxpOg==
X-Google-Smtp-Source: ABdhPJwBGELixNpYowvhX39sWRrOBjfWBHAiBmfYwVPE7T9/3PTG+y1zLuYgjRuTA/p1a4UY0LDemQ==
X-Received: by 2002:a1c:9695:: with SMTP id y143mr1821947wmd.70.1604570257085; 
 Thu, 05 Nov 2020 01:57:37 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
 by smtp.gmail.com with ESMTPSA id w11sm1936242wmg.36.2020.11.05.01.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 01:57:36 -0800 (PST)
References: <1604375323-33556-1-git-send-email-tiantao6@hisilicon.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Tian Tao <tiantao6@hisilicon.com>, ulf.hansson@linaro.org,
 khilman@baylibre.com, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mmc: meson-mx-sdio: replace spin_lock_irqsave by
 spin_lock in hard IRQ
In-reply-to: <1604375323-33556-1-git-send-email-tiantao6@hisilicon.com>
Message-ID: <1j361oazxs.fsf@starbuckisacylon.baylibre.com>
Date: Thu, 05 Nov 2020 10:57:35 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_045739_682937_6AB72E75 
X-CRM114-Status: GOOD (  14.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue 03 Nov 2020 at 04:48, Tian Tao <tiantao6@hisilicon.com> wrote:

> The code has been in a irq-disabled context since it is hard IRQ. There
> is no necessity to do it again.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  drivers/mmc/host/meson-mx-sdio.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
> index 1c5299c..d4a4891 100644
> --- a/drivers/mmc/host/meson-mx-sdio.c
> +++ b/drivers/mmc/host/meson-mx-sdio.c
> @@ -418,10 +418,9 @@ static irqreturn_t meson_mx_mmc_irq(int irq, void *data)
>  {
>  	struct meson_mx_mmc_host *host = (void *) data;
>  	u32 irqs, send;
> -	unsigned long irqflags;
>  	irqreturn_t ret;
>  
> -	spin_lock_irqsave(&host->irq_lock, irqflags);
> +	spin_lock(&host->irq_lock);
>  
>  	irqs = readl(host->base + MESON_MX_SDIO_IRQS);
>  	send = readl(host->base + MESON_MX_SDIO_SEND);
> @@ -434,7 +433,7 @@ static irqreturn_t meson_mx_mmc_irq(int irq, void *data)
>  	/* finally ACK all pending interrupts */
>  	writel(irqs, host->base + MESON_MX_SDIO_IRQS);
>  
> -	spin_unlock_irqrestore(&host->irq_lock, irqflags);
> +	spin_unlock(&host->irq_lock);
>  
>  	return ret;
>  }


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
