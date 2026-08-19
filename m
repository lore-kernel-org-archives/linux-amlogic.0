Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A96C5DF81
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Aug 2026 13:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6PFRiKVN9Qs86MKxGYvrpvbHvPRp0DAZc6agDXgqzQ=; b=s1s8mjkJ/cjBMM
	MSDfpFh8JRNjopKAE8g8OKxNWNXrZrO8r8YX5wHkWgciujCmAIMYALObgkfK0N7H9GpxEKYDNDM4R
	9xWpGMnJhnNPeblhP2wlzPIANltoc/2t9uU4AIb0bIUq/8LJs6qLXdIRrD0cYXcu1Isu/FfXIQkF+
	ouVcmTj64Sb8MT//KaJRQy/LiePZCVDf5S1ZLNUdphctY0A+/mgDiVLyTMoqNJKFHZuSiDSxrNXuQ
	a+d8mF5x4yoi8tN8np227h/Bdvj2SNQg1qmgLHmFi3JsnUIWlZLK6Q+Ye16vCjmFv6eqtfD/1xCdK
	C+1mxvnk8YgDilRDwZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgSl-00000009smf-17Ws;
	Wed, 19 Aug 2026 13:36:15 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgSh-00000009sm6-1kCJ
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Aug 2026 13:36:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 59A2E1A1741;
	Wed, 19 Aug 2026 13:36:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D8445FF42;
	Wed, 19 Aug 2026 13:36:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EB8311C7570C;
	Wed, 19 Aug 2026 15:36:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787146563; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=5+UmtWGq+oMHHux+0HehZ/aRCJpMZvziH7JNziGQsos=;
	b=0rG0l2pHk+fEH/o1XxAD807Q9uWBMCC267HhjJmkCgNYcR7MZBcnWh0MsPxvJ2jCfC3jXa
	vO1LLHRjMSmgkdX89YAwrUA/jaKzr66jGgmn+ZPZUQfjUa/fNc+h3Zb/tD0f6IO08TYJXn
	0riNe2Y7A+FFzW30gPoZTaVHSlKaS5lEXpTP8Pgwpk0cvG9i9ZjNpuHTlSdce6YG6cvtkR
	PgRimfCBsrTRbnwalsI43HknSqPYn9GP7zetPfOq5dtIJKAoKqRIuo0VmulZPcNSNMdAlT
	KSderBxcRtXb8YGP5Shgx3LSI9RQUOUYuztT6WnIt/KMfrZr00yLXvIqW41cWQ==
Date: Wed, 19 Aug 2026 15:36:02 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: xianwei.zhao@amlogic.com
Cc: Yiting Deng <yiting.deng@amlogic.com>,
	linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: amlogic-a4: clear unsupported update interrupt
 feature
Message-ID: <20260819133602f197f6b5@mail.local>
References: <20260624-rtc-feature-v1-1-42dccd22c0ee@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260624-rtc-feature-v1-1-42dccd22c0ee@amlogic.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_063611_596995_BB3ED803 
X-CRM114-Status: GOOD (  16.85  )
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

Hello,

On 24/06/2026 07:24:34+0000, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> The Amlogic A4 RTC does not support update interrupt. Clear
> RTC_FEATURE_UPDATE_INTERRUPT before registering the RTC device to
> prevent userspace from enabling an unsupported RTC UIE function.
> 

Because the driver supports alarms, it should support UIE. Is there any
reason the RTC can't handle arming alarms every seconds?
There are some that would only support alarms avery 2s, in that case,
please set RTC_FEATURE_ALARM_RES_2S.

> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Clear RTC_FEATURE_UPDATE_INTERRUPT before registering the RTC device.
> ---
>  drivers/rtc/rtc-amlogic-a4.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
> index 50938c35af36..116cf095a9e9 100644
> --- a/drivers/rtc/rtc-amlogic-a4.c
> +++ b/drivers/rtc/rtc-amlogic-a4.c
> @@ -379,6 +379,7 @@ static int aml_rtc_probe(struct platform_device *pdev)
>  	rtc->rtc_dev->ops = &aml_rtc_ops;
>  	rtc->rtc_dev->range_min = 0;
>  	rtc->rtc_dev->range_max = U32_MAX;
> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtc_dev->features);
>  
>  	return devm_rtc_register_device(rtc->rtc_dev);
>  }
> 
> ---
> base-commit: 851d961ff248218f681c53cf0f7f08cf8201a117
> change-id: 20260624-rtc-feature-03ce3f3843a9
> 
> Best regards,
> -- 
> Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
