Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967F4C38159
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 08:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ileYnpMD/HT4CZcxkgpXGgp4HqmpHFmF7s0GYw3omk4=; b=A9i0FehUPqDQPx6C0R1MM05EWB
	sXrhSm883JcFa3WjCryGJ9NO48z5SwoS0g11SGK9ue4lkY4g8Mi6LeVLYQmU3HIFD6VXwm4gKwXDR
	KM+ZzPIQg6A0ZbNNDZAaIK1hDY9sQ6e9SiTlFLhvnuK0t0r2vGFfENjAbnufN5wZLeL/JZCUHmvfS
	mAke85tXNldXzENKptTtCQN7KDfy86BH+nnbOjHe9frQt3zfWxGMd7MXeajJldKqG1pasv2vimnob
	1tQfQdpVzNZH2wqEkKv7wu2KFmFZuBDM9ke6Tw9tjptkbcwwWtslVM9zDNTXjv5UosGLpk3MjZnTN
	fL2u/L4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3p5-00HTCT-1P; Wed, 18 Jan 2023 08:29:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3p2-00HTBK-L8
	for linux-amlogic@lists.infradead.org; Wed, 18 Jan 2023 08:29:30 +0000
Received: by mail-wm1-x335.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so901462wms.2
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Jan 2023 00:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FCQqfrft4nNMYWaf4oRTo5ElYIhffOhrEXz0Ei6E2KY=;
        b=OQFRPpW1P6EbBM0nhgrkuTB1o/48hyPGrfSk+caPmpM4wj9QIRHwtcGkzZSxxA1KoC
         hK/sOW3tjfLf7+26ygoRxl4FUrSzqblun8NNIH4PudEn6y9gj+X/Spy6s690+6QW5rdf
         3tO1tfNvPu0zeNQ+LMr7Rr3WBbDRUq8K9p4wlYrAZyK03VtqjB1ixFJxsNt+ElaMmqYo
         XXOti7Vu+TMfRp+O8lzWBTrRHS1mJMWZC92ig96gpYqNMOCfQ9u7L2BBWVJAPM8Oa00j
         xIPRd2WTAbpuJo23SDlpX52JXe2RRwwZ7KO+kPufpyB9214x9AkvOqIXYKBHtvYWSBUj
         pcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCQqfrft4nNMYWaf4oRTo5ElYIhffOhrEXz0Ei6E2KY=;
        b=NU9tIZbZNv3LpXS4xUekhH06jA0hUCyLoqH/quR5l8mQB0wq73mQ2RHNeJ9bn/zN/+
         h11EddYLD+LUEdWSwvhs7TnbBBpUEZ4fldLMkcaMAQMs/npM2FZAplx5rSYfLtH5QgqF
         7m0dsVbUjiVmR5aT8xalgFaVtmYJDx9gZ3UYLHDfo/+QM6JYF9z7Itq7JueX1aRRqHXr
         PkzEUOjLL8T7+3E3kO35OA8T/vfJtSQ8SjJ2HDSsyZ64esOdcGbI5O9yPU4u8rxiQvXB
         xGFCoCSgI8RT4oulfyuZePCYNV7FDA0gzrNUt85wlkDve0z2Pax0sx7Qk77OA41BBX4E
         nWbg==
X-Gm-Message-State: AFqh2komFmPn35yFDKMGh6Biyqjrj5SM15ecGX7jAmUSF1r0R9DaUssH
	JFZqYdQjrk6r1ytmhC7lOfBSAQ==
X-Google-Smtp-Source: AMrXdXtvgIwDo0loMiZXyN3wNMfe5sPwfyDF3BLvMsN+tfAR+7RYoBd2yaB9EHThbSOJ6AhBhhN4/w==
X-Received: by 2002:a05:600c:3596:b0:3da:1357:4ca2 with SMTP id p22-20020a05600c359600b003da13574ca2mr5999266wmq.11.1674030567354;
        Wed, 18 Jan 2023 00:29:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:37dc:5071:959c:93e4? ([2a01:e0a:982:cbb0:37dc:5071:959c:93e4])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c4fcc00b003daff80f16esm1598134wmq.27.2023.01.18.00.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 00:29:26 -0800 (PST)
Message-ID: <b112ee8e-93ab-2c30-ced3-82ff858884b4@linaro.org>
Date: Wed, 18 Jan 2023 09:29:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 7/9] arm64: dts: amlogic: Used onboard usb hub reset on
 odroid c4
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230118044418.875-1-linux.amoon@gmail.com>
 <20230118044418.875-8-linux.amoon@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230118044418.875-8-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_002928_738342_46DF98ED 
X-CRM114-Status: GOOD (  20.51  )
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

On 18/01/2023 05:44, Anand Moon wrote:
> On Odroid c4 previously use gpio-hog to reset the usb hub,
> switch to used on-board usb hub reset to enable the usb hub
> and enable power to hub.
> 
> USB hub is combination of USB 2.0 and USB 3.0 root hub so
> use peer-hub node to link then.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v2: - fix the compatible string.
>      - Fix the hub node to use peer-hub to link the usb 2.0 and usb 3.0.
> ---
>   .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 36 ++++++++++++-------
>   1 file changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> index 8c30ce63686e..d04768a66bfe 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> @@ -26,20 +26,30 @@ led-blue {
>   	sound {
>   		model = "ODROID-C4";
>   	};
> -};
>   
> -&gpio {
> -	/*
> -	 * WARNING: The USB Hub on the Odroid-C4 needs a reset signal
> -	 * to be turned high in order to be detected by the USB Controller
> -	 * This signal should be handled by a USB specific power sequence
> -	 * in order to reset the Hub when USB bus is powered down.
> -	 */
> -	hog-0 {
> -		gpio-hog;
> -		gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
> -		output-high;
> -		line-name = "usb-hub-reset";
> +	/* USB hub supports both USB 2.0 and USB 3.0 root hub */
> +	usb-hub {
> +		dr_mode = "host";

Is this really needed ?

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* 2.0 hub on port 1 */
> +		hub_2_0: hub@1 {
> +			compatible = "usb2109,2817";
> +			reg = <1>;
> +			peer-hub = <&hub_3_0>;
> +			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> +			vdd-supply = <&vcc_5v>;
> +		};
> +
> +		/* 3.1 hub on port 4 */
> +		hub_3_0: hub@2 {
> +			compatible = "usb2109,817";
> +			reg = <2>;
> +			peer-hub = <&hub_2_0>;
> +			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> +			vdd-supply = <&vcc_5v>;
> +		};

The final discussion in v1 was to drop this /usb-hub node and move the
hub_2_0 & hub_3_0 node under the dwc3 node.

Neil

>   	};
>   };
>   


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
