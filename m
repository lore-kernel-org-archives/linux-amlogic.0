Return-Path: <SRS0=3cfv=TI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E414EC04A6B
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 May 2019 23:06:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99DF821530
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 May 2019 23:06:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZCJgfjMa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0rKvv/Xt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99DF821530
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6TA1AaQXWH2YQfU62VPcHRCyljbnfc6Z+Up+e+bqbCY=; b=ZCJgfjMaIrWCnz
	SK+TJdzWO178kcIYGbfKo5Ue0Oe9Zw/zYTTejePR2D7onpqlPUWTxDT+x/9Oe7mHLmaM4brvwpqc7
	pPxpTRxAp1UmkW0RHK0Vsk9yO0mrftJ6AzdMuV62r+j9/D0LsnU7y8mhuRefnx9Ci2p6wYH0r6Bu3
	CImVg+DmVGAL1rLpI8p4A10T+DPEnMKluf2rxX9/0HoE8smU/vrFnQstPbYk8FSsGGLBsVvzZJ3g6
	L3AZbgbVzWOeE7FPU5kcDg91Ysu1AMxr+hfCb/zQq8hY15HpnSmnACml1iaLXH+w+/dvqmbkAgc21
	FjEIrMri7QlweVoH47LA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOVdK-0001Gh-T7; Wed, 08 May 2019 23:05:54 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOVdD-000191-6x
 for linux-amlogic@lists.infradead.org; Wed, 08 May 2019 23:05:48 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9so121318pls.8
 for <linux-amlogic@lists.infradead.org>; Wed, 08 May 2019 16:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=JVzET3Mp0wgIwXsop3AibeqFnQBKBmeFUsVe5B/2igU=;
 b=0rKvv/XtDafNC0HLsREuhHbQX3sZZdgl1ohKulh+yUeFrb3euPGdSWBs7/l+ot9V3V
 VqiCWj20+FRqtwNZjVhj+DlDPTnhYqhtbYOBuaGnTN7n5/ecNAer8W9o+F+ll0OeQJGj
 9za44ADWNvtCwycjOYleO1AsOP0tz8SVcGG5Ma7LT/bcmCLRI6w+MRk9ELoQ4wNNuHnx
 FDOoqgfPTIf7N9IPIHs8razwrXAsUEKkm2fSSmZuOywQY5DjxB1w8xxqnB+DBESJld1g
 Vn6K5/48kfvmfTjE3ExudhRgUx3LfAUsrV9zFk0kuxcA9wOU0KI7Joa6G1JMZ0iGqaYK
 38xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=JVzET3Mp0wgIwXsop3AibeqFnQBKBmeFUsVe5B/2igU=;
 b=JEtW5Mpw+r343YEFRyXUP84ih7pX2Elsz37TAu8tp/O3qR2uih0u1k//eixR7R5UY2
 ZWnAQXbGoaZY66s7rPmHHB3TstM/MsDlQX7usPLyqMPFitwOmKUi4gNROPtxeEEkJcwz
 f75Du3Ehgwge2v3QWRIneCEOamFj/r4k5rri/g+YBnM6I4UnJzDcu4jchSHfw//fj+2w
 0RoE6szE7s2WbuNeG1Nl+F7S6VJf5xq0fdoq+97rTj3efqlCO6hocFkw7Ryd2QOY0Kzo
 klTfSWTrBfUbTCk/VUP8+CCgcql2TwyDh/gc9FNuwQZlVdFGSg125yEhw+lwoMhVFg6w
 EmYQ==
X-Gm-Message-State: APjAAAXZfFiw2I3HXiVyAq9T1a0gbRqp0v9vtO4RacdFM8srdZlHDBTp
 5QTDydZkuKjx4aXyW6JGMpi5a70Ri2oUCg==
X-Google-Smtp-Source: APXvYqwzdLUIHtYovZPfiHC/rWX5PqOCpFvFETb+gOoJv6lyxwhlz3SYwF7UrkgeTr1V49rNHOuKxQ==
X-Received: by 2002:a17:902:b20f:: with SMTP id
 t15mr446060plr.341.1557356745584; 
 Wed, 08 May 2019 16:05:45 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:a864:57af:5348:a6ea])
 by smtp.googlemail.com with ESMTPSA id i65sm339785pgc.3.2019.05.08.16.05.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 16:05:44 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/3] arm64: dts: meson-g12a: Add IR nodes
In-Reply-To: <20190412100518.24470-2-narmstrong@baylibre.com>
References: <20190412100518.24470-1-narmstrong@baylibre.com>
 <20190412100518.24470-2-narmstrong@baylibre.com>
Date: Wed, 08 May 2019 16:05:44 -0700
Message-ID: <7h1s18im2f.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190508_160547_259466_563B5298 
X-CRM114-Status: GOOD (  12.24  )
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
Cc: baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Amlogic G12A SoCs uses the exact same IR decoder as previous
> families, add the IR node and the pintctrl setting.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index 734c5ee60efa..9cb76d325bb7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -559,6 +559,13 @@
>  						mux {
>  							groups = "pwm_ao_d_e";
>  							function = "pwm_ao_d";
> +						};
> +					};

nit: you had applied this based on top of the PWM series, but didn't
mention that in the cover letter.

Kevin

> +					remote_input_ao_pins: remote-input-ao {
> +						mux {
> +							groups = "remote_ao_input";
> +							function = "remote_ao_input";
>  							bias-disable;
>  						};
>  					};
> @@ -623,6 +630,13 @@
>  				status = "disabled";
>  			};
>  
> +			ir: ir@8000 {
> +				compatible = "amlogic,meson-gxbb-ir";
> +				reg = <0x0 0x8000 0x0 0x20>;
> +				interrupts = <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>;
> +				status = "disabled";
> +			};
> +
>  			saradc: adc@9000 {
>  				compatible = "amlogic,meson-g12a-saradc",
>  					     "amlogic,meson-saradc";
> -- 
> 2.21.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
