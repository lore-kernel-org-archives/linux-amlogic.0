Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3970C43460
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 07:23:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD48C61289
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 07:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD48C61289
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jCAv1HHeJ/MChXju639iGWAiIYA6IKrISf1unc+xYCw=; b=U1K+AlmQzFjDS9QzZ2Bkx5cdg
	GoAsqRevL9QY1I7ADSYEdgufrOqM1JIC3ZIat2WW73c7E1l1O5B33XuVDpxh25UW+FdWgX5Dl7sTA
	aXDchNfGKF+7jBiltbXtt6Jh4hLHnYscyAfVbixMVJP702CKRQt+2lsxF4XN6Kyp/DjqnatJanZVz
	r8eGf4MuVT8SSougySSAKDUPyTiVrbwJexMuZkZ3HW0FXSGn3O3aRx3+xWjBMzfkuqLgOvUuRlNFg
	uLmoamVcS0RjOr50e0dOM+/fZTT4sYcx3JzINJtRoISP5zZbk0WPD9svXZpdV5DmYgi8reJPNIoq1
	RrEfvuT/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc10i-005C0d-Eu; Thu, 29 Apr 2021 07:22:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc0ni-0059jN-Q0
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 07:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=lGQKcvz7hC4nUFEHdDadJU+QZacItzjYP+ScbOMh1Aw=; b=gudZkRO/kH3FwiwzLB/ZMn+Ohn
 9o9ow9cT3ZzNxcAv72sdHTLKIYFM+ccit7vnfTPYP69rOclj+lW8onChCmroi382ui+xnBx/I2ljI
 OiCo46JLDyO595jhKc9t0FbUDUVARKqK1bMlFZv/xQzwCr+LtjHU+HbzZ4xI+ijNHPxs53BcV3Ysf
 gobBQciaimRNPvaQVDqUbaItOiopwqZg7DQG1XH6bmWvu5IPwjOAqSCcqtpHcyZjQ+x7eYu3dyJDN
 VGSBNeizlp7SV78ZdzgEECCcSThIa+oRvD4+jaev98euaDkRFz63zC/Nmro80leA5wyssVEBYg4IO
 QjtYcY2Q==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc0na-000QsY-3z
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 07:09:29 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so10120874wmi.5
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 00:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lGQKcvz7hC4nUFEHdDadJU+QZacItzjYP+ScbOMh1Aw=;
 b=1E9n8OGXToC0MSju3Flt6bn5DIN3r1e1ekVoS9QnDIDsM7q9vgo6IIPwARbyDobdkZ
 DYzkqOzRpL/vSgZ66x5I3136OTtUE31feFT+8G5FxPJAwVQFjUikVImrBWBo3M5troG8
 MsHv3psM9NMtq3CNZgSaufEbg53GGNIgERZEavlQP9Q6tjFzyEJ93YbrKHeoJeBVP5Tu
 IbZi+bRyFeTziY3IUIF2Kbd1Aw6fFvihOy2rRu0r5JP/xzG4tuCyHLiDVRctI6/qAwDT
 vJZuzSWMGkxvEqNkKvDyInlXBC7nhORgrSdaYPmc+Ta91SGxZFttYb+IMKqese66fZ9q
 JYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lGQKcvz7hC4nUFEHdDadJU+QZacItzjYP+ScbOMh1Aw=;
 b=IDZWhAFe7vMOmoGmKGiba23OUOyhmWBD2yTaVw1i44vcZW5VeQj+Mdeu6xWGZvrQjM
 zusPSawbMU+bb0tifjOFL6O5sLU/DTkmckIP+BXWTJRji/iaczqJCQmcetTPyuNn//D1
 mh3JBvOW+phBm5bcaaZ5/h2hOocN47pMx4VhpV/bu5sn8AX5+FhtUPUN+1I9YNhvwUDT
 xaKB4mkhRShbo3EvjSnHqkD7U/mQWgarHE3u/aR17zFNEIIOHB/xie7spwORLFZgG3r3
 QZZSx/cXzhViYo5oZ0WEsabXYsKESYOS+PUMyf9wWGnDiE+HU8cikXGDPxLZrpg2cx7y
 KKQA==
X-Gm-Message-State: AOAM531VLRYfjZx/l/IwVH7XR8kVznCZdUV6YV++Rv68X34YO/+s76cU
 R4RPvuF4cIdXyX6d0ffz1EASIQ==
X-Google-Smtp-Source: ABdhPJzJCsoIlJD/C9JSCk3Ow6k2ys4QaWLWVgm6T6H5RWE8KSBa8ZvwFssGIDpCX3oPdWkMPE+efw==
X-Received: by 2002:a1c:f20d:: with SMTP id s13mr35571333wmc.92.1619680159135; 
 Thu, 29 Apr 2021 00:09:19 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:c304:4b2b:4a79:1da9?
 ([2a01:e0a:90c:e290:c304:4b2b:4a79:1da9])
 by smtp.gmail.com with ESMTPSA id e12sm3171283wrt.51.2021.04.29.00.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:09:18 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: meson-gxbb: nanopi-k2: Enable Bluetooth
To: Chen-Yu Tsai <wens@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210429060830.6266-1-wens@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <509d541c-a91a-a1f0-e37f-b239f1d3219b@baylibre.com>
Date: Thu, 29 Apr 2021 09:09:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210429060830.6266-1-wens@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_000922_194348_B99E2A70 
X-CRM114-Status: GOOD (  20.33  )
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

On 29/04/2021 08:08, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The NanoPi K2 has a AP6212 WiFi+BT combo module. The WiFi portion is
> already enabled. The BT part is connected via UART and I2S.
> 
> Enable the UART and add a device node describing the Bluetooth portion
> of the module.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> index 7273eed5292c..10f48fb1af61 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> @@ -385,9 +385,19 @@ &uart_AO {
>  
>  /* Bluetooth on AP6212 */
>  &uart_A {
> -	status = "disabled";
> +	status = "okay";
>  	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
>  	pinctrl-names = "default";
> +
> +	bluetooth {
> +		compatible = "brcm,bcm43438-bt";
> +		clocks = <&wifi_32k>;
> +		clock-names = "lpo";
> +		vbat-supply = <&vddio_ao3v3>;
> +		vddio-supply = <&vddio_ao18>;
> +		host-wakeup-gpios = <&gpio GPIOX_21 GPIO_ACTIVE_HIGH>;
> +		shutdown-gpios = <&gpio GPIOX_20 GPIO_ACTIVE_HIGH>;
> +	};
>  };
>  
>  /* 40-pin CON1 */
> 

Thanks !

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
