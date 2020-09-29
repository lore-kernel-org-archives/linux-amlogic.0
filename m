Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394A3C2D0A8
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 00:36:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 887D82193E
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 00:36:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BSDEjmAo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="v69NAAku"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 887D82193E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VhBx1NpzBelQbscD9U+MDLDqnUNocDFXvqT1QgfIqek=; b=BSDEjmAoOnjdZ5EHQg9b16eFi
	yCB7lgYLKBZ6IyYWHShaj/rsbzxiJhozgqIT4KMqA4qMOQ3mpORw2JBOyHiaecT9gPt7nY7pjVSZt
	6VKa3OxmTtuUWmAUoCuL6IqDrFifpRUuCG6xSjob+S+PEy3udKoCcgkyWpbf/CiS+Ol5mHle4Jrg4
	ycHQGr8NPGs7ueTHyrOZNyC5GMCLv7ZxEM7Ge2Z8H3GKArw9Ww24dvzBgO3OHA/Dhpo3/W3KdKZvb
	4CK7fEBsxv96ftugC7Emv6ZtQQoHpI8GHq2FkDOup7esV5gVF5KtSRIgSNiYDUDEks6RXtcZERzu6
	B/jeoR+7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kN3ch-0003tu-K5; Tue, 29 Sep 2020 00:36:03 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kN3cc-0003sF-Aq
 for linux-amlogic@lists.infradead.org; Tue, 29 Sep 2020 00:35:59 +0000
Received: by mail-pl1-x643.google.com with SMTP id o8so50216pll.4
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Sep 2020 17:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=uaAgCWaphNg4XUpNx4joWU1xUSe7LvQcJOGZWvIHnHc=;
 b=v69NAAkuCTEr7hg3phUdSwS/jRxtb9RhagIGnDoxmqRXRs2S6C/CmnrYbXfDPrKmM7
 QKjikJoR6KEdqOFIQ0BMA2SDVoq2ov6NBMoBRH42AjSEXXz+zca8AQjnpe+FciLxsMNS
 mTm0/iSB/gGJ4zkbRi+9IGT69J067NB76CdJmDnGwpZ/eZqCO8nZ6G77J0x6C6sZn2Tf
 sarRvQVDFOV4eSjr1zdVf9CA+EwfAUiXpEjL+jpMGujhWiuo7JMxdHoy6SCk+CbR09Q3
 u8QlDxiw3bRifR3UEMb1QX9f82B+GzxbIkCVeaMBS+mMYhLjSMIZFQFQCl6DcBSG+mhW
 HwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=uaAgCWaphNg4XUpNx4joWU1xUSe7LvQcJOGZWvIHnHc=;
 b=TSMacreiGMet5EU1cekTVWWGNcX+EWtSY5M7/jCHbByhDtXjI+VmL8XQ/1gGOc6tq7
 3F+GpTM6OATEEI9HlGqpPt0UYqRBgWHnfp175YFQkmuQLhLknkdPWD1FqONnTA116ddo
 RtcCoXWxibWuPgtHlULH+k2JP1Ax2p6z743x2UugOYs9W5iqRxkXms+CQI7iHKR83eId
 JJRC1vhRJJVgd5E0SnM9gmBAIFIWBtw5nncfKyD/wp3TXoJiVhA5hANy4YIw0iUq9rxw
 ZRXGZkRlbyJ+WHe31YjRc49npCcdPERsDAxuB9fCzWvNpuPI2Ffb5qIIfoClbwtEWSoK
 PwJw==
X-Gm-Message-State: AOAM5325O96Bv+i7inBkTQ7opo+4m1BenDkxOd/GldCv8sn7suv/HFCP
 vn3P9RRGIoj7TR5jMEVyqkwo3w==
X-Google-Smtp-Source: ABdhPJw4qd17QzT6F2MmDcBshvhH/7FLRINF+lgsSnB4r4uMssLfw33w1g4TzP14kOgM0kQATT3GoA==
X-Received: by 2002:a17:90a:fc1:: with SMTP id
 59mr1653722pjz.156.1601339753340; 
 Mon, 28 Sep 2020 17:35:53 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id q16sm3127759pfj.117.2020.09.28.17.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 17:35:52 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Brad Harper <bjharper@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-mmc@vger.kernel.org
Subject: Re: [PATCH v2 1/1] mmc: host: meson-gx-mmc: fix possible deadlock
 condition for preempt_rt
In-Reply-To: <20200927025418.12382-2-bjharper@gmail.com>
References: <20200927025418.12382-1-bjharper@gmail.com>
 <20200927025418.12382-2-bjharper@gmail.com>
Date: Mon, 28 Sep 2020 17:35:50 -0700
Message-ID: <7hwo0dmnbt.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_203558_383687_89D12C2F 
X-CRM114-Status: GOOD (  16.35  )
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
Cc: Brad Harper <bjharper@gmail.com>, linux-rt-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Brad Harper <bjharper@gmail.com> writes:

> ---
>  drivers/mmc/host/meson-gx-mmc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)


This patch still needs changelog summarizing the problem and what is
being fixed by the patch.  Most of what's in the cover letter belongs
here.

The cover letter can be used to describe the history/background that you
don't want in the patch itself.  Alternatviely, you could include that
information in the a single patch email also because everything after
the "---" line does not end up in git history.

> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 08a3b1c05..3ba8f988d 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -146,6 +146,7 @@ struct sd_emmc_desc {
>  };
>  
>  struct meson_host {
> +	spinlock_t		lock;
>  	struct	device		*dev;
>  	struct	meson_mmc_data *data;
>  	struct	mmc_host	*mmc;
> @@ -1051,6 +1052,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
>  	host->mmc = mmc;
>  	host->dev = &pdev->dev;
>  	dev_set_drvdata(&pdev->dev, host);
> +	spin_lock_init(&host->lock);

I'm confused about what this lock is intended to do.  You init it here,
but it's never used anywhere.  

>  	/* The G12A SDIO Controller needs an SRAM bounce buffer */
>  	host->dram_access_quirk = device_property_read_bool(&pdev->dev,
> @@ -1139,7 +1141,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
>  	       host->regs + SD_EMMC_IRQ_EN);
>  
>  	ret = request_threaded_irq(host->irq, meson_mmc_irq,
> -				   meson_mmc_irq_thread, IRQF_ONESHOT,
> +				   meson_mmc_irq_thread, 0,
>  				   dev_name(&pdev->dev), host);
>  	if (ret)
>  		goto err_init_clk;

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
