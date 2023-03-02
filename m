Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32ACC6FA8E
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Mar 2023 09:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHJ5FLTaXcgSlfoway0/tQ+32PvArWVhaU9hmXMffzs=; b=1kS+m+XsT9AfJZHVAksMs7n13Q
	qwKyfZgQqW9FGXrCVKjzQHWMvtKFooxBT4YW24nbgAgCQgtjVUm19YDfHItpCb6CP3sLFKlTRArXq
	89P8vlEWmK6a/U1ic3m4qxFxuDI5rH6wjYQwAoFf1e2hkkiYyXuuAVFAgM17DNhwMdSkod4GRc3oy
	xStZraGdkBgoT5eRw6Iebs1DkVUW7K1Y6cN3BoXtj20mqufjuij2Wk03S+gvViIU7TorNJGxxeEkM
	7M07VfGX95A8YMQZmqxgDBcuwG9vwgMP1jI5q5uzqxwsV3LwWZFy5BQe6RvDJit6N1ncQYD/RuY2B
	OmxmQcyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfEy-001PTQ-2a; Thu, 02 Mar 2023 09:28:44 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfEv-001PSU-Kp
	for linux-amlogic@lists.infradead.org; Thu, 02 Mar 2023 09:28:42 +0000
Received: by mail-wr1-x436.google.com with SMTP id h11so4090372wrm.5
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Mar 2023 01:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677749318;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pN3D6KI8Uaa46h7G/TJdROkJgq6ZG8djshLY451h4ys=;
        b=ePgyFdWPqYzP5PsMiB6m/eTIZ/AdDvKD1geltdyzjjo+eHjCktcA4UW9yaInyU22lB
         qLoNyhRQW4r7akoe0EKzIqBMybTmuIvccUOgNupV9rLMLpH30V8n0VkdPAxvQn0oOX9/
         sDrZdoJbKfNw9F6Ju8EHhctCdgl8NUu0MYYSXqQVrrg5y8AaX/0Loebr+icGc8vsl0Qo
         4cCuXD8LRFnccVKoCCAv/oG0fbnKXF+dG0DRz02swexJqakmg8hUO1WrrnsT+vYGuxTH
         dl6l+KAJtKFZw3rPwVPn7PAL8P7PQPwiIaRkjo3qOHbOR8wruak4wkqNXXrAsV4HYd6J
         Sghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677749318;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pN3D6KI8Uaa46h7G/TJdROkJgq6ZG8djshLY451h4ys=;
        b=sUNCWhJ2yW4wtXBodG0dXK5YvThyo2C5LHRE/5ZOjOzTWG3nEbsMSeaHChr4Rg6pq7
         3E2gM2EM3ubEHXukBeaQqIRq+WsVSeXXYFgu+JNXGtFtUoP4kDElctI0k1pFwsb/kJgB
         u6jm4yDL3kFtXsNa1m2rFSpPwrPf3HCZJrVbT66Imed3mEIG8fBF7hivXjHd1ppHq4uH
         RjlRZTEMSmYoXK7/WyUAIcNsP9eofY5i3jY5ebQq3le20/H+wXWFaac5DrPGAKdtB4rI
         kB+4XKlvWp2dwaLAHmZVHoJ7AHzdueBh/YCz9ge0AkkUDpA1C9RmQOgYoIXLsoqrT9tH
         MURQ==
X-Gm-Message-State: AO0yUKWC8/hFeg2qRr8uUIZc14bah4Ewtok/tbDwNRkPOZoxbpNMxrBd
	5dyqr1joCx8ICkHqzN0RVHya5A==
X-Google-Smtp-Source: AK7set9CWhecrLx281ewib0dIvx7MkBYjpt4sHuc9tY87sRrdwUG5w1d7q9EEY+x2f6djdKm6v6IZw==
X-Received: by 2002:a5d:68cc:0:b0:2c9:850c:6b13 with SMTP id p12-20020a5d68cc000000b002c9850c6b13mr7334493wrw.67.1677749317874;
        Thu, 02 Mar 2023 01:28:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:217a:db24:fe27:6b35? ([2a01:e0a:982:cbb0:217a:db24:fe27:6b35])
        by smtp.gmail.com with ESMTPSA id d16-20020adff850000000b002c55306f6edsm14632513wrq.54.2023.03.02.01.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 01:28:37 -0800 (PST)
Message-ID: <78b44cd8-adf1-d5fb-b140-6849fb77c679@linaro.org>
Date: Thu, 2 Mar 2023 10:28:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: meson: add IR controller for Meson-S4 SoC
Content-Language: en-US
To: zelong dong <zelong.dong@amlogic.com>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20230302063402.42708-1-zelong.dong@amlogic.com>
 <20230302063402.42708-4-zelong.dong@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20230302063402.42708-4-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_012841_731006_474FD541 
X-CRM114-Status: GOOD (  14.66  )
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

On 02/03/2023 07:34, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add the IR controller device of Meson-S4 SoC family, and enable
> hardware IR decoder.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>   .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts   |  6 ++++++
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi        | 16 ++++++++++++++++
>   2 files changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> index 8ffbcb2b1ac5..4d3a81b3b762 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> @@ -28,3 +28,9 @@ memory@0 {
>   &uart_B {
>   	status = "okay";
>   };
> +
> +&ir {
> +	status = "disabled";

Why is this disabled ? disabled state is already set in dtsi, it should be "okay".

Neil

> +	pinctrl-0 = <&remote_pins>;
> +	pinctrl-names = "default";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index ad50cba42d19..309352a83eda 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -106,6 +106,14 @@ gpio: bank@4000 {
>   					#gpio-cells = <2>;
>   					gpio-ranges = <&periphs_pinctrl 0 0 82>;
>   				};
> +
> +				remote_pins: remote_pin {
> +					mux {
> +						groups = "remote_in";
> +						function = "remote_in";
> +						bias-disable;
> +					};
> +				};
>   			};
>   
>   			gpio_intc: interrupt-controller@4080 {
> @@ -133,6 +141,14 @@ reset: reset-controller@2000 {
>   				reg = <0x0 0x2000 0x0 0x98>;
>   				#reset-cells = <1>;
>   			};
> +
> +			ir: ir@84000 {
> +				compatible = "amlogic,meson-s4-ir";
> +				reg = <0x0 0x84040 0x0 0x54>;
> +				interrupts = <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
> +				amlogic,ir-support-hw-decode;
> +				status = "disabled";
> +			};
>   		};
>   	};
>   };


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
