Return-Path: <SRS0=vaug=EL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B47C00A89
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 13:00:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7BFF206D4
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 13:00:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nxCP7oOW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XQxXbboD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7BFF206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3o8+BW4SmZR+KRExyWnhxk3jq7qjEh+tej/3XsHl0lQ=; b=nxCP7oOWJm5GJTsonGFUJdLVF
	ZvoA/s7jfFS1DOnweUv0s6fZeF5ZZyig2f5Ujc0LCHypbxIbvBrKKSORuGciffvtd93Iv+xPEspAy
	pk9gDv6QjswGVuEl1DUiYL3xAPyLjw0BWkDbfSCqnyzpGOTmcl0an1ivbPYvdJZ6UXQ7AODTAZNZf
	WbRSa3cF0/ZhpbI1yCssQafHa0uNcH+2ryjAs0QPV+VegBX1V6hl0c2yYbDoN/+OIHdyg5JEuiNM1
	kMwfzUys6p6Kvh+K805ev8/FQautlMS0dkBtVSLFHHW9soa+4yy9Df3wVJBuKBCqlgVgSCZog2wxp
	UJOlbk0xA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaerv-0005sO-Rn; Thu, 05 Nov 2020 13:00:00 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaern-0005mz-F3
 for linux-amlogic@lists.infradead.org; Thu, 05 Nov 2020 12:59:52 +0000
Received: by mail-vs1-xe43.google.com with SMTP id m16so701621vsl.8
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2020 04:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DQxEJYTnrFPdkb+SIqKXmZODsTPacZYJuDmLfP+J2k4=;
 b=XQxXbboDDYrNgWb5CeYdrF3FGkC+5Q6+wRSBmI+FXAaIwdtq+UdzWdpcVK4KKPTotX
 lE7KRoRGBMfJzRZ4iEfwFrNjq3PAjuXTq0Q2ZDiGkONZJx2AUtZac89l3kd7pT+oNtjc
 Im3lb7ynBI+i5nHFnIgI4ppc8jKGJQ0VFmhPvRfTeoIkKqYEvc2Bpe9hfzb7aLPtluDJ
 9q6LJkblDFdkgAyjDZp55LZczfikI2/vTSc6Et88yzN9TJWwhMbV/wEjdiG+JFVqeGeF
 BWSOLvGc+hKOskSC56Cit1Iq3rkj8x1+JgMsOtrftLz8VbeWFGteAO0Kpx0A+NDUr8IA
 w3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DQxEJYTnrFPdkb+SIqKXmZODsTPacZYJuDmLfP+J2k4=;
 b=C8L4eesTZ4OM9SMUUyaRcQeVBBVVEv72FfVZzy+X8kBqI1QtMJ7N9V5NX7e+de6JQN
 taDslU2Zu+Ko6S6suXyFuAEHPSTezL11gcq6n4MlR8id6Ah6XuJemL/pPaMrGfmoUZ+j
 OiWo2k28Y8cVXsKTSzBm+ACyknNS6XUX52qBzTxmNOk7UXxsxnfKH2PUg/7RgBiDNtBR
 WNNve2ZmnDBlPyI81Bc/izL9RB14DdJPnWYcHSFSgWKhve+C2Vvnpnv5qZGC82R6BkmV
 RdpYXxn2Ya8OYPQBeywexyUnYvJzBmquRfb+vkxsnft5JmykuIJfrUZFSn5YISMEQNKJ
 WIVg==
X-Gm-Message-State: AOAM530ngnvIn5fXV2eeJN612AeUE+hz1JqEYS9LAzqjeHyvEI57QM/0
 kANOMJg+Xi9tQGSqk1NYHQhwPiB9bNeK7K4mmNby5w==
X-Google-Smtp-Source: ABdhPJw9TiQhWBq5dN8EcB5mPqGr915+EBTr3nV6C4ziDQvzTbuZsaADvlcFFOVWGJ5j7vJZsK29Ln/YI1RA9wP46j4=
X-Received: by 2002:a67:3256:: with SMTP id y83mr1116773vsy.48.1604581185547; 
 Thu, 05 Nov 2020 04:59:45 -0800 (PST)
MIME-Version: 1.0
References: <1604375323-33556-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1604375323-33556-1-git-send-email-tiantao6@hisilicon.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Nov 2020 13:59:09 +0100
Message-ID: <CAPDyKFqT9OtZorNmi8OVNAFsbV14UgqZoDNCdkvZUvcHOEnG0w@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-mx-sdio: replace spin_lock_irqsave by
 spin_lock in hard IRQ
To: Tian Tao <tiantao6@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_075951_553869_F924309F 
X-CRM114-Status: GOOD (  17.26  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 3 Nov 2020 at 04:48, Tian Tao <tiantao6@hisilicon.com> wrote:
>
> The code has been in a irq-disabled context since it is hard IRQ. There
> is no necessity to do it again.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied for next, thanks!

Kind regards
Uffe


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
>         struct meson_mx_mmc_host *host = (void *) data;
>         u32 irqs, send;
> -       unsigned long irqflags;
>         irqreturn_t ret;
>
> -       spin_lock_irqsave(&host->irq_lock, irqflags);
> +       spin_lock(&host->irq_lock);
>
>         irqs = readl(host->base + MESON_MX_SDIO_IRQS);
>         send = readl(host->base + MESON_MX_SDIO_SEND);
> @@ -434,7 +433,7 @@ static irqreturn_t meson_mx_mmc_irq(int irq, void *data)
>         /* finally ACK all pending interrupts */
>         writel(irqs, host->base + MESON_MX_SDIO_IRQS);
>
> -       spin_unlock_irqrestore(&host->irq_lock, irqflags);
> +       spin_unlock(&host->irq_lock);
>
>         return ret;
>  }
> --
> 2.7.4
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
