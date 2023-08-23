Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27F1EE4993
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Aug 2023 15:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfP2Nm+O9zYo/LSWWCizB7grG7jgP35cg2nqLDTOPHo=; b=OsJHgVkGd2DsdM
	/Mcw01vEazfveaXHcUv4QG15oXTW4R8XZ02KPIlo7OAB0VEz5FewHlZ83GHkS8PT+RfyK1gGiT/ew
	nFvEZWj220SEixxCGv4/A60v7QE5NWgIXm6lzwz6sXUP2sOBHRMyxsZfOF29+lBkrL4xxtAH3sICM
	AXFewW9XlYO03XB+B0nxF2NsJFlSwQuwMnUsW1nK2gwEzUgxPJNYJxMwerSJYUIEQtywQI1738Vh/
	r74r2SlLFGvKNtvyahpz5MUwpylSQ6Y6IYigZh3lHFSSeFufBvT46eGSzcpqfDBFp9wenF2u/nWbr
	KA9oQhENn3HKyJhbacEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYq6A-0011Ad-1j;
	Wed, 23 Aug 2023 15:48:46 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYq67-00119I-36;
	Wed, 23 Aug 2023 15:48:45 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bf092a16c9so45228955ad.0;
        Wed, 23 Aug 2023 08:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692805721; x=1693410521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8RVO8QqpSGvwCTtzSEj1vfVHlrvdmi9jWM0i/g4wXFg=;
        b=pFLPKKwwMuUPRgUdp4DrC6Adp1yFskvPhC81gUI0SfmHdYwuaQ3Zc0rtitfPoqHiU2
         Ow7Nd4FKMzDl98iOvlNKlpwIJDxZ1wYtVmo9M7WTy+XmtlH7Z9quUIjsumGpRU4KzF1C
         15pAaCCUy0CDetch15cjXjH+rwQ+iiQO7hqJr4fmcMRylFV1YbHIfJqT+cqxPPrQZOLt
         GojFmYTP7VwCn6koRRlrorAxUMKqEyQkzOiy5O2IEOUus2YvaMtD3VDgiV+5Jphj9e3L
         oXpAQvYirKWho7zdxOSOJGdNDrTqfYCRGOx0uoASHqDSRWiv8okkCpYcXxN5ybn0ITrX
         czLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692805721; x=1693410521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RVO8QqpSGvwCTtzSEj1vfVHlrvdmi9jWM0i/g4wXFg=;
        b=ONu0mFLOYWWGVl0E398tXvKzUGQBt9WHFjz2PM06MvfcdsAgQLT9qFZzcblg01ijN1
         miDpHnRWyEXuEavVlnapFdhLC6eWBHCG+QSMGfJnzsWe5aEhH6GeeKHjOQU3NvY7fbED
         1taDnd2y/Aco4CpVG7MyeBAsUcRg/Gph++vABCdB0ou0F/4KKAC8r/DSO9hDq9UN7D1a
         AJktDFkUIu6W028PmAlaw0+q88uBKSHI7XtyB+voO7pVIMI5OQxrKepsoG/p6JEk9Mc7
         Tr7dLdY++rLmvRJGiAnYjC7G6bFDI97xEcXyf7LM6//s4aR79vdEtZExi0NSywsqGXLv
         2r6A==
X-Gm-Message-State: AOJu0YzFwgoGiJH9rAy+yl6+pEmR32+1TWn+TI+NL5wjMlrPDEhQp8SJ
	ANIGDy21YqsdWeDIz0aijKJLyqhiSks=
X-Google-Smtp-Source: AGHT+IHC16OTLZ0+ivhmKDzK81Q3Wf6FkNYZuDjC80GdNQmrIoepiTGx2xDRTvxp8HL6cwI0AwNAug==
X-Received: by 2002:a17:902:c943:b0:1bf:25a0:f874 with SMTP id i3-20020a170902c94300b001bf25a0f874mr15655824pla.65.1692805720977;
        Wed, 23 Aug 2023 08:48:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902ee4d00b001b8a3e2c241sm11144912plo.14.2023.08.23.08.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 08:48:40 -0700 (PDT)
Date: Wed, 23 Aug 2023 08:48:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: wim@linux-watchdog.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 3/4] watchdog: Add support for Amlogic-T7 SoCs
Message-ID: <ceabbef7-e952-4e74-af10-e49946cb9c62@roeck-us.net>
References: <20230802033222.4024946-1-huqiang.qin@amlogic.com>
 <20230802033222.4024946-4-huqiang.qin@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802033222.4024946-4-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_084844_003551_A2445796 
X-CRM114-Status: GOOD (  15.75  )
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

On Wed, Aug 02, 2023 at 11:32:21AM +0800, Huqiang Qin wrote:
> Compared with the previous Amlogic-GXBB, the watchdog of Amlogic-T7
> has a different reset enable bit.
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> V1 -> V2: Use the BIT() macro to build rst initial value.
> 
>  drivers/watchdog/meson_gxbb_wdt.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 18180d91543e..a48622d11ad7 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -147,8 +147,13 @@ static const struct wdt_params gxbb_params = {
>  	.rst = BIT(21),
>  };
>  
> +static const struct wdt_params t7_params = {
> +	.rst = BIT(22),
> +};
> +
>  static const struct of_device_id meson_gxbb_wdt_dt_ids[] = {
>  	 { .compatible = "amlogic,meson-gxbb-wdt", .data = &gxbb_params, },
> +	 { .compatible = "amlogic,t7-wdt", .data = &t7_params, },
>  	 { /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, meson_gxbb_wdt_dt_ids);

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
