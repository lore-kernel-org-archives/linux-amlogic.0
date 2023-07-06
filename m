Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB96DEB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 07:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwG9toKt+na7NMm0A0gS5SKtvLQYAW7APaJUBuUvPVs=; b=PfZj+B3GAHVPoU1HNvuPl+5ahq
	2r/28+YxzhauEN3UPMxm/VVh2aPaG8Yvgaen8UEvOyLIVkVN8co8qmQLGd9rP7vPxnpyv7oH2U/kV
	gmslLIpMz4VD+/N1Bc3RBCEC6TNJw+w/cK6EKqaQtduwMi7JSehHQtPbxhDNdzejSl4bVcIXg9hkj
	tdT3fV4cwUHOVGtEbb+aww/VUGqTWWuewHKh3yTJO0uvJ2i1xGPzY8ZPSODy0zE4AgLW0Eaeb0sQx
	gJ0VxBSpd/VbeO3AdKa2bV6U7jI2KZYfAPlaOLMGAqLvWdMSM6k0NZo8gYVdX6kcvpRQgPqvxylYz
	xjdhTdCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJ85-000kK8-0r;
	Thu, 06 Jul 2023 07:10:17 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJ82-000kIX-1J
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jul 2023 07:10:15 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31441dfbf97so302069f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jul 2023 00:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688627412; x=1691219412;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=moTzOrhP2jv4mEj0XJL18rLy1OehAna2H1R87VD2hYA=;
        b=iqxf4K9V44dY2Z218o6zXfSMSWZr1TwwjgAgOVj7eo0o53YqM68rkRAP83eLvwqv6Z
         5xGzxdOXvApMqU3NGkHHe+KP0aEcZyWVqfakhFTsy7+0FZ/gDbF5OpqIzYPcDwo8sjmr
         9xSjv3G5/9IGlt1lEVhBXRYeD/60scayeO2TPy2tBmjsI71Cymwu9brNEbiS44VWXk/Y
         Pwe22stFsb/n9OgNFXhX7CN3wX0xFq+hQyTD6Dg+OqeDmGgHod35X0OpH0IZpte1ulHL
         GE4FyORKxU/ds/65xpagl6MnV50wtxweW2v6dWuvZLNrSeOVsUe12s5FXa6X1nR5UvQN
         damA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688627412; x=1691219412;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=moTzOrhP2jv4mEj0XJL18rLy1OehAna2H1R87VD2hYA=;
        b=Nzzjg0o9O5R5Fh6IrIl1wPOW2TGIVxDWqIra0teabVZHTf+wl2mLV7xsV6GJVJC1NU
         PYfhiLbz4M491st7okL7/eedcZoZoCpLHHbh6EY/Hz/BqY+heQ5nnCqWRPZ7zPVH+n8z
         KNUQjRQi14tq/VIwnRhThda8p4EOK8/EGRbBBmFsCz8YSGg+vcRzY44whhny14eDYkhT
         mWPFeIOO0RbEetdAmN2SLaNHCG2oDtsRSM1BHlRPmxC4lfKXGJLrzmZ4Njn9N/7Bga8S
         E/Vu0mrZoK1z1+iIzWJxliz9oTHk5vUmYCWnPnUWWbyluIa8ql7yAX4Va9RjDi6y2Cv3
         lWng==
X-Gm-Message-State: ABy/qLYdoz1jiaFdR7jK2sE4VSMVoXpMVlKaVJti6RZBTyqvN4eM8aDV
	Whj/DCgnQvp0aN9gDDGCtJISfw==
X-Google-Smtp-Source: APBJJlFueubgKVYMHwOORI74wg8se3YQAVmG40XVt55GH1mYfZakJ47RYWKjZKADuk84VaQcbPAqfQ==
X-Received: by 2002:a5d:6287:0:b0:313:fa0f:3a05 with SMTP id k7-20020a5d6287000000b00313fa0f3a05mr954991wru.14.1688627411939;
        Thu, 06 Jul 2023 00:10:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:15d1:2748:ead4:bdff? ([2a01:e0a:982:cbb0:15d1:2748:ead4:bdff])
        by smtp.gmail.com with ESMTPSA id z12-20020a056000110c00b0031423a8f4f7sm1027746wrw.56.2023.07.06.00.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 00:10:11 -0700 (PDT)
Message-ID: <d78b2a8e-2e38-e52c-2a2c-308675409a1f@linaro.org>
Date: Thu, 6 Jul 2023 09:10:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 7/7] arm64: dts: meson: a1: change uart compatible
 string
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, gregkh@linuxfoundation.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jbrunet@baylibre.com, jirislaby@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: kelvin.zhang@amlogic.com, xianwei.zhao@amlogic.com,
 kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230705181833.16137-1-ddrokosov@sberdevices.ru>
 <20230705181833.16137-8-ddrokosov@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230705181833.16137-8-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_001014_464708_47112BB2 
X-CRM114-Status: GOOD (  14.60  )
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

On 05/07/2023 20:18, Dmitry Rokosov wrote:
> In the current implementation, the meson-a1 configuration incorporates a
> unique compatibility tag "amlogic,meson-a1-uart' within the meson-uart
> driver due to its usage of the new console device name "ttyS".
> Consequently, the previous compatibility tag designated for the
> 'amlogic,meson-gx-uart' configuration has become obsolete and is no
> longer relevant to the current setup.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index c5567031ba12..6273b9c862b3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -344,7 +344,7 @@ mux {
>   			};
>   
>   			uart_AO: serial@1c00 {
> -				compatible = "amlogic,meson-gx-uart",
> +				compatible = "amlogic,meson-a1-uart",
>   					     "amlogic,meson-ao-uart";
>   				reg = <0x0 0x1c00 0x0 0x18>;
>   				interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
> @@ -354,7 +354,7 @@ uart_AO: serial@1c00 {
>   			};
>   
>   			uart_AO_B: serial@2000 {
> -				compatible = "amlogic,meson-gx-uart",
> +				compatible = "amlogic,meson-a1-uart",
>   					     "amlogic,meson-ao-uart";
>   				reg = <0x0 0x2000 0x0 0x18>;
>   				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
