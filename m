Return-Path: <SRS0=TbEC=5B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F8CC18E5B
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2020 16:23:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A766320658
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2020 16:23:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mpVnlk+I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qG8PxbkW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A766320658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uYMYgC3ZZdGbcbDWsyaj12ZBqrhQmmB05Jzpxsii/qY=; b=mpVnlk+IaPr9Xz
	Xt4kmKf1nwuy/srnuDAS9yizVCygJwUeHe73qLSF5HikxaG+7KKXZpscVJurtqQtCspHhLLANMu01
	GAOc5FIAPNX0bWDj/7QMtztZPaRgDLqALLkvxBjlm7HrzuBH+1IuMMYdikdFrzliWp/tYkRXJETb/
	xDJhYDft5InU/plWbI/G5a3LXavrapQLVQ/ZC1p3vXnjZWmbtzzWnLgsC7XmFm6qDq4hYIBuDHg/J
	59qAkEap6H0+vxGadSjF6W6PAHnHQdgEY8+XXu5ih+7Md592fvhRu42r7yXa/nGj/P2Ndv7sAukKX
	TMvgba8gam5zij6W86Bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDsWm-0001IO-4u; Mon, 16 Mar 2020 16:23:44 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDsWX-00015w-J9
 for linux-amlogic@lists.infradead.org; Mon, 16 Mar 2020 16:23:31 +0000
Received: by mail-pg1-x542.google.com with SMTP id u12so10020847pgb.10
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Mar 2020 09:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ys4/S0tvAwTvTJf5RJkfy3c1yIHeW683iadOwgFcprg=;
 b=qG8PxbkWIbuy+9Qc3nMWdGGFXM1kqFsA1skjDvOKTMf7Up6HmyD9CPoLqXI2V5kpGy
 I3/5lAZuyWRnwHN+FhV5f5pIjwjRtEQu9DsII6msx1ddPDIDv9X0cKWTe9aJLO3mNoEQ
 Lp6vlkuNNWB34rdnv0HyMxwNgoAiDQ6c8379u6fb02bIYFNIZULMiWV6XpiyHOLKYFJ9
 vwIb4GVU28gTAhiuFIkXkFpODnnGuGFJvf9+cJ2D5Q8ZHYlpkhI7qXD8UA3N5+OZ1WME
 akPHRRVPOdQPPuqm1eOiYZfaR/KWrASRxj6StEwYQXgUOEAAJ0olraavqiILAmFiGikz
 iHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ys4/S0tvAwTvTJf5RJkfy3c1yIHeW683iadOwgFcprg=;
 b=ttyY7VScOG6TJIHcN9Z5LaUa9yRDqoEpAv3C+IxMrtM9aoNe2ETt5+ETKJF35kmsol
 YDLvHBEKpbxOcpmt+DcDsn1evm/e7l+Wjo5UkM4btsoEXq1zYrTbZxPHq73ra9h/vwAe
 OVoQg9Jgcz5gCk0IED2zmuqCIECvytrIAj0qH/7ZvKT6DRO3eTPMwfxB7ctsY/v1EY04
 Uny/vmn2B2rOL5TfxvL2E/AVYg8tb5EPQw83bm0kB0O29Is0GGEw+Hu077bLra9ksckb
 jdyYmDq+95f0nXOr7ppE9w1vCgksdaKQL+2QD5c2ginu8wOw4tYOE24DprjHpIAsItto
 FSlg==
X-Gm-Message-State: ANhLgQ3GLnwYqeZ4PPI/2bTvCWis3K2o4y3JZCzCKlV2Ma96m7PMjPSW
 GMQWZ8TBxMl5DLOcstbWPFRYLA==
X-Google-Smtp-Source: ADFU+vvIkI5Q4X0j5d7XavYPHjHZylGz9Mto6CG3F5sDaCzyi5q3jYipZTJ9iAg6VhbrUPWCeuQi7w==
X-Received: by 2002:a63:67c5:: with SMTP id b188mr605662pgc.111.1584375808216; 
 Mon, 16 Mar 2020 09:23:28 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:dcc4:2a10:1b38:3edc])
 by smtp.gmail.com with ESMTPSA id q91sm313466pjb.11.2020.03.16.09.23.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Mar 2020 09:23:27 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Hanjie Lin <hanjie.lin@amlogic.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v9 3/3] arm64: dts: meson: a1: Enable USB2 PHY and DWC3
 controller
In-Reply-To: <1581990859-135234-4-git-send-email-hanjie.lin@amlogic.com>
References: <1581990859-135234-1-git-send-email-hanjie.lin@amlogic.com>
 <1581990859-135234-4-git-send-email-hanjie.lin@amlogic.com>
Date: Mon, 16 Mar 2020 09:23:26 -0700
Message-ID: <7hd09cw9oh.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_092329_721379_7DE571CB 
X-CRM114-Status: GOOD (  11.09  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>, Victor
 Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-usb@vger.kernel.org, Yue Wang <yue.wang@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liang Yang <liang.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jian Hu <jian.hu@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Hanjie,

Hanjie Lin <hanjie.lin@amlogic.com> writes:

> Enable USB2 PHY and DWC3 controller for Meson A1 SoC.
>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 43 +++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index 6fdc0dd..3b7ca50 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -6,6 +6,9 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/power/meson-a1-power.h>
> +#include <dt-bindings/reset/amlogic,meson-a1-reset.h>
> +#include <dt-bindings/clock/a1-pll-clkc.h>
> +#include <dt-bindings/clock/a1-clkc.h>

The driver is now merged, but the DT cannot be merged because it has
dependencies on the A1 clock series which is still under review.

When that is merged, please resend this patch.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
