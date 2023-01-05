Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17794C3DA7A
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Jan 2023 21:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzszGmMsCZWMwyLpJPPp/2Ift/FCk4Py+zwxF7XbfQ4=; b=joB2H+BIacel//aQ3mu9RYlDGu
	JD/sHeNGQgyT9Rd/yUVThgpo9mIFm36nrooDMhlL5JQs5/X/yURrQootgZw6jpU8KdMbMwqPAy0nA
	5qok1ive72o0ZfhQR4c6UASZ3oMsGP3B5x79NZY2dWe7TVCBlnxxwYmpF8FyAS6iv34LD6zdv46b6
	j6p/eCUGJ8wu6/wUH4reppNdmHH5IMjhAuaUjZrtRTc3sG/xotpiqil0z5LIc/bD3tqxQgFx7Mbn4
	QH/G77U+8I816fQr6Lr7imt+UWjZpQxApzZsw8qRuTTu6/cF4JZxXb7IHNiANcwvuiQG95SNnWteL
	EA0pKv1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDXvH-00FArm-Nz; Thu, 05 Jan 2023 21:37:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDUz5-00Db5W-2R
	for linux-amlogic@bombadil.infradead.org; Thu, 05 Jan 2023 18:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=IOYcylfqadvbnUIa1UHwaD0MafvwA7ymmiBrCb7Otf0=; b=DUnbQMy/3Y20UmxP3byepIwgN3
	1e5mPLfFMKfmcjsAqzoTtJ9RDzkdc/XxG24ysNSt9Ecq2C2dr6p218s1PHK6rrFaOYFblTuImAWcN
	IZCvpZXKeKimPPfl3hpbkpHSiFyLd0eCTxwyGpBECoGDn67C34xGFDHMLHz6uZ22zEJZ3M8u0frjz
	moj+GUI2g1HXW+63Q3Y8yhixVYvZkvSxcHPFT49Xywc+zFMtbWUFQX8zM1MIDZsCJ1BeZJaANEJdN
	kJMrWWvzhZu7lFS2dPtYnGFd2eEusQ0rOZAtffl52imS/eVZtRvVb5Teb5iJH1UXTiOO1gVgRjktQ
	gvm+8dEA==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDQk1-001MYc-1I
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Jan 2023 13:57:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso1369612wmp.3
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Jan 2023 05:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IOYcylfqadvbnUIa1UHwaD0MafvwA7ymmiBrCb7Otf0=;
        b=InbRQeml9kedIFdUg87X9W69DtzhaEaws23NXH5hniNS6QUqnDuB36gl3VYaiUtW8y
         SNMb3MX/DBqNdyUNktb1QVwpXUKDBG5MBEm4Aftaht+kK+cilC7tu9lC7dliCBPChyau
         4C6XW6RDTvHgy1pAXICPZ7KgWd67UvfKoP2etkPt8LakYdoosV8UTyaTva5AnQUZTQpa
         0Pu5sslWHDKNXlzP/GXsGuslAMuPD70HUqn49rt1QgqAYtd2u4Ze7r8sA3XdTqvh6aMO
         3niaqLoKtPiuANviiZrath+G42f3BJNlW/uqW6pKxL5TtmMW8iUshATHbqfaHdsxmBI+
         W4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOYcylfqadvbnUIa1UHwaD0MafvwA7ymmiBrCb7Otf0=;
        b=xGv0x3XF3gV9jt00kBI9koscNyVwneoxgG68S7EqOQYpJ9OMfwEDKJMLPv/dqqn5Zx
         uaa3RekOrmQXvlfaecin3v50H+UL/c0isCB3aczf2dr1j0yCgAr/VQRwnR+ejpILoJFB
         4S/i/1S9V44uEwCLLfcoDGvD+MsRIOcl7YzDgBjH2gHTmpuJTqBYSigvaOOfQB7DYDam
         KZftL/YdVZEwuAlW2GVqYXv9TcNq1H1xU2Vsmb+qr1s4n817g2RtwC5L5AnCh+hpLZHk
         j3Vy3It2WteNzBixioWN7DdjTJqMMScCeR+tUoz9e5njgCy6DZeHZCXEUxDmHDy/rJCH
         iUpw==
X-Gm-Message-State: AFqh2krP/n06Fo8GKNR60LVXCO/LuV7hmbv1op1Onp0DxySLyhPojNN+
	SjPklFGlHDnmwNhs2M6ykFd3aw==
X-Google-Smtp-Source: AMrXdXv9COQLNi5l3RuPS+YrLswWkYNy+WavmRMB86HSiVFxFuKE1D3HS0ZK8AiW0EORpnZ7NUlHzQ==
X-Received: by 2002:a05:600c:1e24:b0:3d0:8643:caf1 with SMTP id ay36-20020a05600c1e2400b003d08643caf1mr37199837wmb.16.1672927032906;
        Thu, 05 Jan 2023 05:57:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1e12:c16d:1898:607c? ([2a01:e0a:982:cbb0:1e12:c16d:1898:607c])
        by smtp.gmail.com with ESMTPSA id i17-20020a05600c355100b003d99fad7511sm2901942wmq.22.2023.01.05.05.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 05:57:12 -0800 (PST)
Message-ID: <11a6f64e-be0f-bee5-6297-53aafb05cb64@linaro.org>
Date: Thu, 5 Jan 2023 14:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] Revert "arm64: dts: meson-sm1-odroid-hc4: disable
 unused USB PHY0"
Content-Language: en-US
To: Pierre-Olivier Mercier <nemunaire@nemunai.re>,
 martin.blumenstingl@googlemail.com
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230104140608.28432-1-nemunaire@nemunai.re>
 <20230105120206.28964-1-nemunaire@nemunai.re>
Organization: Linaro Developer Services
In-Reply-To: <20230105120206.28964-1-nemunaire@nemunai.re>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_135709_582704_A5019DD4 
X-CRM114-Status: GOOD (  12.74  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 05/01/2023 13:02, Pierre-Olivier Mercier wrote:
> This reverts commit 703e84d6615a4a95fb504c8f2e4c9426b86f3930.
> 
> USB device enumeration was not working on Odroid HC4 as both USB2 PHYs
> need to be enabled. This is inherited from the GLX USB design [1].
> 
> [1]: https://lore.kernel.org/all/20170814224542.18257-1-martin.blumenstingl@googlemail.com/T/
> 
> Signed-off-by: Pierre-Olivier Mercier <nemunaire@nemunai.re>
> ---
> v2:
>   - Fix commit log
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index e3486f60645a..a1f0c38ccadd 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -131,10 +131,6 @@ flash@0 {
>   };
>   
>   &usb {
> -	phys = <&usb2_phy1>;
> -	phy-names = "usb2-phy1";
> -};
> -
> -&usb2_phy0 {
> -	status = "disabled";
> +	phys = <&usb2_phy0>, <&usb2_phy1>;
> +	phy-names = "usb2-phy0", "usb2-phy1";
>   };

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
