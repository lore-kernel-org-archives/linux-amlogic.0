Return-Path: <SRS0=1Oxc=QC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1640EC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Nov 2021 09:57:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5434604D1
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Nov 2021 09:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5434604D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+yAAc0HC6vzGgNO5K+5uUsNZ0uV2cGVbJCD55+LsOUM=; b=rgs3hlwmW5EQVLiyvozJEAHlDT
	OkPbuLW5bXxYz2HRqX3KdVzcp3RIhP9LqIwwb7eQFl14+cioHhBm4mhjh8hFrLgLIpjIxlu2H/TZx
	jRyaCpLBKHr6nI7rc2o2RAd9RTEwkzVDhuCtzrpZkH+Pq/RFDt0G6x2JHl0yjm6vSQ0bOKMJvnJ1e
	QvWI633Bv9EXUkhZJvYs6Hs9EhWipcAwDNQA/qsbXLaML6FVY2o5iDpTuA4PybpkHnbu3z0WBJwe0
	qRP86lRywAooidLW0GnfEKyWOEoILw9QUCpeZpSPcz4F+opb7yU1Wb8dSx4eL1OKIht8PYYLaXObg
	NINp31qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYjZ-00F2bx-5m; Mon, 15 Nov 2021 09:57:05 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYEj-00EuhR-0u
 for linux-amlogic@lists.infradead.org; Mon, 15 Nov 2021 09:25:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id u1so29262098wru.13
 for <linux-amlogic@lists.infradead.org>; Mon, 15 Nov 2021 01:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q56pxBIS1WlDqqoLNnvpb0MNdsfXj3HDaGEh+gHhZCw=;
 b=PaCHbIXuSPCdDANjN4U9zKwOXJtO7jNqk9GilGYFrqwAaQxNfGRMU8FD2Ep2Wpz0kJ
 /CuuOI3lHr8hXKXwYukDKT6CYaAqTtfwpESArqWWIL78T9kfNvADDwedKoPx7VdLKhwT
 ZU1YQILcJyfTQbjjT9KeI96sTt4Tz3X4+JnWXP46lezgxRmfSL7XrowWGM2P3SjiXu2M
 Y/W+0J3CHSV7ukj6JxItJyZAEyxEXHXghCNIyJjVwVQFk2G36rX9sOjoKaVEgjru9tI3
 l2K1aNu+ElE7tpyTxAasl91jB8StZw6yIfdiJpYgnRZHcRmArWRfX4vfOg45oI4GAc+u
 y3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Q56pxBIS1WlDqqoLNnvpb0MNdsfXj3HDaGEh+gHhZCw=;
 b=3xXk0xJk5tgxY2tqCvouH3/yEopUKCRsnN+tFC5hNQ8/s7US+RUFaXozZT6tp52gwL
 Yk7KaBWQYBpQRBPPvWjzA/t6JmGoYXb2RSaQzaeBcwgx/2GS4P6SQsvsuHpBqYIjjxFH
 gmnWTP+xDnum+EmhUK+STM/3PA10GDTY9QTutHdMaz9m5AVsW7hDVjzAnnd0WFWB0UPq
 U6SrShxvHbEbvrh0/4Pl9g9KgHg5PLe9eOMIVNTgejrgvGOq1edBo0jlHG/6Sjp89gkC
 hse63HgJ8Y6GejPgvJssY/coOw4YQR+SZKlx9qV1HpElkaqSVvNe3buprspagny1LEqi
 ZhBg==
X-Gm-Message-State: AOAM530bHe50Yd2ZgRYTnvxNfGlz0GM+rKX62qq42sSFlqm6/u+99LG0
 fMfnshFbkCcGVwsjhxXDvSU4aQ==
X-Google-Smtp-Source: ABdhPJwS9Fqbw9DfB3Wz6gbqs5XRxFnnVuhmfXM8K2OMm9THO4OZYoLKqWkTLP+HsQM2T9+YrleMIQ==
X-Received: by 2002:adf:ef52:: with SMTP id c18mr45839204wrp.162.1636968311298; 
 Mon, 15 Nov 2021 01:25:11 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:f56f:2409:301:93ad?
 ([2001:861:44c0:66c0:f56f:2409:301:93ad])
 by smtp.gmail.com with ESMTPSA id h16sm15190587wrm.27.2021.11.15.01.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 01:25:10 -0800 (PST)
Subject: Re: [PATCH 3/3] arm64: dts: meson-gxbb-wetek: use updated LED bindings
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211012052522.30873-1-christianshewitt@gmail.com>
 <20211012052522.30873-4-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <d8bac7a1-0d0f-7c07-ad50-7d317f22fab5@baylibre.com>
Date: Mon, 15 Nov 2021 10:25:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012052522.30873-4-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_012513_161557_A22FAA71 
X-CRM114-Status: GOOD (  17.80  )
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

On 12/10/2021 07:25, Christian Hewitt wrote:
> Update the dts to use the newer style of LED bindings.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
> index a4d34398da35..94dafb955301 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
> @@ -7,6 +7,7 @@
>  
>  #include "meson-gxbb.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
>  
>  / {
>  	aliases {
> @@ -26,8 +27,10 @@
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		led-system {
> -			label = "wetek-play:system-status";
> +		led-power {
> +			/* red in suspend or power-off */
> +			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_POWER;
>  			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_HIGH>;
>  			default-state = "on";
>  			panic-indicator;
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
