Return-Path: <SRS0=GyIY=MA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AA5C07E96
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jul 2021 13:10:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9838561461
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jul 2021 13:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9838561461
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/cEk9ZhlErJXSjDHZOtCv3wDqUpMq5+z8TQ0GYebIM=; b=R6iNBxpqmLYQdg
	zUv1M9hmVBSOJSW6Pqw4xgH2g5ZDscZh2J59nXrNlZoYWryHZEPyldh+wcCi1stgajGN7UYuWQIwc
	IJYE8HkBhX/bj3pnl9WCLh3YX9gnuD4BuXEhyoQ3PlJMHocL2IGZ4EfHUlaocJRau3EPhOrlS4T2e
	XuUHga4EhaAg1UDtuFMP94spd1aDcwOWYscXvYOl2kxv3VB9i/Fsihs+bSA8lY3cvK7LSsmF6BWdn
	jZ8dotTALn5ypfuCjiVa5x3Mb8yTl7Q67pZXsuzJFudMTT1aady/OAO3kY7rLnL/fC0UHneTfBBL1
	7Lq+GM+YZuxso2TpAcnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1Tmx-00H2Kc-9X; Thu, 08 Jul 2021 13:09:59 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1Tmh-00H2HU-Te; Thu, 08 Jul 2021 13:09:47 +0000
Received: by mail-ed1-x535.google.com with SMTP id m17so8422408edc.9;
 Thu, 08 Jul 2021 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rVMZlgd8HuXH+Zr7CeIddNtS2E8VXF0s39JXMW69Eds=;
 b=lVCw9jTMb5lp5exvkpdXQ418ElmBbZFSFW2gy3wU7jTzyKswXLZXYm+IF1tIL4NJn2
 BohNTFGfgApKj0Gp9C3kEd32STFbV3umWDo6SwLQ3tHyRB//mhf7GmpOWrSIEF/wzIMA
 EEXtC6hXxnRJAozcBcFQVwQ23oN29mDCqmFitXm2tn8mI0YXZPUHx/a9VVwHNCvNClBm
 mmQ3RiMQhAFwI82vpjYu2ReLpjBApi1SF06+R4Z9ZOmOpNOV9RTiDeZvnChTlYU2dVMo
 6dFA8hZb1I+ZArLyghvJ5GDq/NYuemLoZjuJdG1xY4M6iIiSYHR0mEzFfwH9ufjwRpMR
 pCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rVMZlgd8HuXH+Zr7CeIddNtS2E8VXF0s39JXMW69Eds=;
 b=sCHJGbHrxSRarFSnHyjMRHr4tRYDfTul0PYtNQp768LXtdUFUbRghCWdzhiN/rDfXa
 obyU+sSJ3FisZhNd6hk5HHyW49LtSrHasEfO4JTdaFasc+969BEO786LeIy5CHgFotp/
 Q9rQk75v9AP3o6vlTkMlqPxG/gfSdTH9ndev1oobFqdWlFdnneVX8k89d2fHLNcjebYE
 Q9nJc7InHwSAuKzVPvDRWVLp/cfVCER7jUNqzb3FZ27Nf8UU1b3usT/9HpFbMTD3yOJJ
 EUXH5CVpl9r7qb49X43Z0Dni0BsPbvSNv3LPNwlgvfjub348H2bSZMDNDfKz2ywjsts7
 lW7Q==
X-Gm-Message-State: AOAM531B33B+yoHSvyh8CBHUrKyQZszffTBWa8bqUKlM9CFXvkOGjNSS
 ZERmyfE4FNHX4BjXW0MEpSFjRhCn+eMhHTzoyilALa/j
X-Google-Smtp-Source: ABdhPJwMuFfbqYswXBcN5yyjqiaonc89pYus9l6+a2zeMi0Vj6ymwjSLurSB4NuRp3SuW+C5oIeDeODQ0LtBBknkkM0=
X-Received: by 2002:a05:6402:510d:: with SMTP id
 m13mr37825520edd.179.1625749782093; 
 Thu, 08 Jul 2021 06:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210707141323.20757-1-viktor.prutyanov@phystech.edu>
 <20210707141323.20757-2-viktor.prutyanov@phystech.edu>
In-Reply-To: <20210707141323.20757-2-viktor.prutyanov@phystech.edu>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 8 Jul 2021 15:09:30 +0200
Message-ID: <CAFBinCDgQHA1vmunNBdER0BfiKt8XYZ+-VBs3c21+S3bYP7GZQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: rc: meson-irblaster: document device tree
 bindings
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org, 
 khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 jbrunet@baylibre.com, 
 linux-media <linux-media@vger.kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, rockosov@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_060944_013277_47DE91B2 
X-CRM114-Status: GOOD (  13.11  )
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

Hi Viktor,

On Wed, Jul 7, 2021 at 4:13 PM Viktor Prutyanov
<viktor.prutyanov@phystech.edu> wrote:
>
> This patch adds binding documentation for the IR transmitter
> available in Amlogic Meson SoCs.
>
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> ---
>  changes in v2:
>    - compatible = "amlogic,meson-g12a-irblaster" added
>    - clocks, clock-names and mod-clock updated
thanks for updating this patch with my feedback!

[...]
> +  mod-clock:
> +    maxItems: 1
in the change-log for this patch you mentioned that mod-clock is updated as well
I think that mod-clock (as a whole property) should only be added if
it's an external input to the IR blaster IP block


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
