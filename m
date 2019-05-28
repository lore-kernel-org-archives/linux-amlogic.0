Return-Path: <SRS0=WX2S=T4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC705C04AB6
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2019 07:27:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8072520883
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2019 07:27:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XxY0rFzo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o1TsHp1R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8072520883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fPZKWWu6d1V1iOVbEcXx07qxB4kGxirG6a7iEbkSHDA=; b=XxY0rFzoFtvJWdldyFIw0yc2i
	4Ea312j95zHHLjZm5AMhGhWGpP+NIivka0LKx0YYoMM5OPIA2v+Rh2nubwgfmu3XhL89/uE+1jcpR
	FxbY0JKaSdMsH6wGClG2+q6qaU+FCbFZy+AWyFoQgYFDGRnjHf+eRS3QzwEgtQqxk13VsX5pq8Mp3
	+8DuIW1oeVA3qKGloon0XfS27Q0Kb3lCcrfYDSwn68TFoU4/c3ORyuSLkgWlouYO/kBPRpB8gob0g
	QKMtqhzTRCx1bAq90nTGz1zVf0iA3OEy0TedQL42r7jRvYAYiDKytadePEBEBM38uWH20v6k95xHK
	Pti02XyUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVWW6-0001Ok-JA; Tue, 28 May 2019 07:27:26 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVWW3-0001Nq-LT
 for linux-amlogic@lists.infradead.org; Tue, 28 May 2019 07:27:25 +0000
Received: by mail-pl1-x641.google.com with SMTP id c5so7959008pll.11
 for <linux-amlogic@lists.infradead.org>; Tue, 28 May 2019 00:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gd99PMPFJDNN97/m1Xc5Z5yEsmfPQoIA8ErP+1/NeNQ=;
 b=o1TsHp1R8T8aB9jUprTmkPlBMcX4GSTekb6GAaaTrYUJ8b++KMHFwVl3wtG8iu1QVX
 BwykifL2WmW/OZBCmjx8GVHJQNxU3ASZOxx8UARRfykmtmCvkC+Ym0esJqfEhpp1KGmm
 NIzckkUr+O79w9ZY3CfcFzRrsB/L5LHo0auRkJoy65+gX3UP/Txw9NSp/JdRIj3eVyxU
 Hl8ho4inr4Up4ysRV2sp8HQl4/LryT/d+jH98vSUKIizE8rm+ARh2fENRah/x6i8dfYN
 Sfdd+P4CzlQxJ7TXaDjTGpX08ocBZwQc2e2/UMSNsrBNjsJZrMCs+DmTYfQZUuDoJfkN
 y4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gd99PMPFJDNN97/m1Xc5Z5yEsmfPQoIA8ErP+1/NeNQ=;
 b=ds2vUTHIj56NIm2QxS1JQGrD2HSEP3DZY8Dj5pV+PyRLbsJ1nypTbreywZVldEkalW
 M0N1AFj/hETrW3NiOiz3nps99kj7dCdCfGbo7APMmIkVcvf4RH26O0T1dsaGcYoDsOLj
 22LnxEOZI50DjcwRBwPd28eFykRD8GpDBdwsmYvfVXSuw74Msf2a2q3KzwO3aHcFbGwK
 78QzDkDG3c+DrrST1TKVlxE5caOPMtYPzJGHzygmV5CFaBl+1iENwORSHoOwsjoytg6O
 b3jxV+eoj6muIR3stfdTuwZz5hWjp86GfcK01Pel/N33GfkscCSokxf5HauT9G2mHRK1
 z70Q==
X-Gm-Message-State: APjAAAWhOia7hUfqNnDLJXCF1RM8EBmtHOphkCBQeA+3PvT9mqo1SPrA
 btkcdCMFTGSDEdiRrxbNYKY11li+wso=
X-Google-Smtp-Source: APXvYqwyD67Ev4HArmTeE5xIhkSRsaqQgUA+ci0w1XvOYhg8JGl1RQyxwhAxievjTsGbEzOWQ4NFrg==
X-Received: by 2002:a17:902:29e6:: with SMTP id
 h93mr23939164plb.297.1559028440959; 
 Tue, 28 May 2019 00:27:20 -0700 (PDT)
Received: from ?IPv6:2402:b801:2855:200:d90c:5599:3fa5:5f45?
 ([2402:b801:2855:200:d90c:5599:3fa5:5f45])
 by smtp.gmail.com with ESMTPSA id k14sm20796720pga.5.2019.05.28.00.27.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 00:27:19 -0700 (PDT)
Subject: Re: [PATCH] mmc: meson-gx: fix irq ack
To: Jerome Brunet <jbrunet@baylibre.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
References: <20190523145950.7030-1-jbrunet@baylibre.com>
From: Brad Harper <bjharper@gmail.com>
Message-ID: <4786e031-b070-f4b0-c7ba-1ffe1a2eab2d@gmail.com>
Date: Tue, 28 May 2019 17:27:16 +1000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190523145950.7030-1-jbrunet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_002723_725244_C0B72336 
X-CRM114-Status: GOOD (  18.91  )
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
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 24/05/2019 12:59 am, Jerome Brunet wrote:
> While cleaning the ISR of the meson-gx and acking only raised irqs,
> the ack of the irq was moved at the very last stage of the function.
> 
> This was stable during the initial tests but it triggered issues with
> hs200, under specific loads (like booting android). Acking the irqs
> after calling the mmc_request_done() causes the problem.
> 
> Moving the ack back to the original place solves the issue. Since the
> irq is edge triggered, it does not hurt to ack irq even earlier, so
> let's do it early in the ISR.
> 
> Fixes: 9c5fdb07a28d ("mmc: meson-gx: ack only raised irq")
> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/mmc/host/meson-gx-mmc.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 6ef465304052..cb3f6811d69a 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -873,6 +873,9 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>   	if (WARN_ON(!host) || WARN_ON(!host->cmd))
>   		return IRQ_NONE;
>   
> +	/* ack all raised interrupts */
> +	writel(status, host->regs + SD_EMMC_STATUS);
> +
>   	cmd = host->cmd;
>   	data = cmd->data;
>   	cmd->error = 0;
> @@ -919,9 +922,6 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>   	if (ret == IRQ_HANDLED)
>   		meson_mmc_request_done(host->mmc, cmd->mrq);
>   
> -	/* ack all raised interrupts */
> -	writel(status, host->regs + SD_EMMC_STATUS);
> -
>   	return ret;
>   }
>   
> 
This patch resolves issues I was having with hung tasks waiting for emmc 
& sd cards on the odroid N2.

Tested-by: Brad Harper <bjharper@gmail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
