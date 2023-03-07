Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38207C678D5
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Mar 2023 08:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVWel+LbavRDKZLzHaWl9v4BbRLKKIVwK2TqEVTBH7c=; b=H1gZKVLFz/EHb3XBKouB5ROdzy
	Poey/7xodyHjNy2uCtHeXLahHOJ+ORLcD2QuSGKEjgMd2r5NnzwgnDeo0rf4sbr4Z55IqOEDP2H15
	7fQitmN2fRwO/hpYCdPs1oXIkvS41Cyq+VQ38AEPuNqFm0UGG150c+1YRFBV+Zr70Tzl9nlty8xT+
	20Qja6jELVsqdX4phglPSKZMqhj1UBZ1kmVGzFnE5DzSHKepqBcOfrlJIXT/ycNuK56T4kaZeeJVA
	Zi0XbeXR8qAffdAV3c8/nOZ3wT7Rgjqwud6+W9NiVWA7HbybMP4yS9VGlRyYzkFdKN9rGRNpTn39j
	pqoClorA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZSFg-00GZ20-8S; Tue, 07 Mar 2023 08:00:52 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZSFU-00GYxw-OJ
	for linux-amlogic@lists.infradead.org; Tue, 07 Mar 2023 08:00:42 +0000
Received: by mail-wr1-x434.google.com with SMTP id bx12so11179639wrb.11
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Mar 2023 00:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678176037;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ijEoAYIJJ5+odRylDAm2UWfSFdsaYTaLyRF8UzmTqYs=;
        b=zV24IqvnRETCGgK1BvWcspkXtXxEtsKqsnUGLw30uEv4VyHEnOxSgqLmPiDuSMMelD
         072MwQ3moInax0wm+YHR4KUU529vc9HKg702nItnzwz99PcJ6RUTIM4xXsNiJdsCTaam
         vzmJ1/VgBGo5fuMj/sxD2B58Q05F1v9YZJKNilkef3D4RXG81nUQKSLh10hRGHUll0W7
         nBvSCmcQ5Uw5yWQ1v4wCsZroe1uMm3UPVpW49JX965GKOF3G7f8eoq1EMMxdIoPcRNvI
         PtoolfPQvOLn3AbCZStuDapDeyl4rg60UmKY0DUF+ex0i2ByYtO6AC8CKsPwuc/yNrO8
         84Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678176037;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijEoAYIJJ5+odRylDAm2UWfSFdsaYTaLyRF8UzmTqYs=;
        b=MU+icf0pMV3aSAJxR7OyX/s+MVycnw4YyfUb1i6ofvn5Lnx8O0ss4lO6Mk6RmwGcLF
         UfZ1VeJ/jHcA2Jvrc1MlltR3WqvNMI46JgHmT9RTXD3AP5ZM8WytMB6dy9+rWUpK3M0d
         iuBCWUxm9s4IjdvwzNZ+3PXZoofA34rtVpUA7jtfwRUkdhZgdxiZRYDG6Of90/Fq9lRj
         OCWP8csfG7+t4F7vlzHznwSISnCi5zwlsjl6oS27tL89KipP/avUUuN3XkmHO9Ag1M2n
         fecJlhUlgQYL9U6L3Q6AKl7b91P4HKiJA55fJQE7c5+9QpJjrX2GAc7lLqnU5MT+oQ3N
         AEhQ==
X-Gm-Message-State: AO0yUKUVILWNYKWxpSKRczQOxkb0SEKcKeQ08F8AL/4CsVHsMR7TwFqq
	WYFMfyCKB0zUkQFi2eCd7BORTw==
X-Google-Smtp-Source: AK7set+TxhLq7JwU5QjThhhQelWeF10eqEhDIkLTdWn+y+uBaBK0ICJkwu0mOEc4uCOOHqjNhhs3Hg==
X-Received: by 2002:a05:6000:10cc:b0:2c7:e60:abe8 with SMTP id b12-20020a05600010cc00b002c70e60abe8mr12062223wrx.9.1678176037002;
        Tue, 07 Mar 2023 00:00:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6faa:6d13:586e:871d? ([2a01:e0a:982:cbb0:6faa:6d13:586e:871d])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b003db0ad636d1sm17430831wms.28.2023.03.07.00.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 00:00:35 -0800 (PST)
Message-ID: <9623bc3f-760a-e838-c80f-40d2f9b79f35@linaro.org>
Date: Tue, 7 Mar 2023 09:00:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 1/2] arm64: dts: meson-a1: add gpio_intc node
Content-Language: en-US
To: Alexey Romanov <avromanov@sberdevices.ru>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@sberdevices.ru
References: <20230202141520.40003-1-avromanov@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230202141520.40003-1-avromanov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_000040_835775_FB40B690 
X-CRM114-Status: GOOD (  12.33  )
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

On 02/02/2023 15:15, Alexey Romanov wrote:
> Add gpio interrupt controller node.
> 
> Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
> ---
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index 6268c323a810..a04ddf0f4cd3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -158,6 +158,16 @@ clkc_pll: pll-clock-controller@7c80 {
>   					 <&clkc_periphs CLKID_XTAL_HIFIPLL>;
>   				clock-names = "xtal_fixpll", "xtal_hifipll";
>   			};
> +
> +			gpio_intc: interrupt-controller@0440 {
> +				compatible = "amlogic,meson-a1-gpio-intc",
> +					     "amlogic,meson-gpio-intc";
> +				reg = <0x0 0x0440 0x0 0x14>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				amlogic,channel-interrupts =
> +					<49 50 51 52 53 54 55 56>;
> +			};
>   		};
>   
>   		gic: interrupt-controller@ff901000 {

The [PATCH 1/2] highly confused b4, anyway it's applied on v6.4/arm64-dt.

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
