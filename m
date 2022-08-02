Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5A1C19F29
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Aug 2022 08:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5glulEvvWk22m4uCqezLMf3uLc8P8uvIf8NV4Drpz/M=; b=cdJupzk8wNg8S4
	6Tc8RGj78uH48c106jmqrAlYnPq2TM0V/XDm3D/qkoBV9R5Lz6eb+ntGXypCbYd1tlOQRhweiGXtS
	OANXu3dIRwc3alo/+8hdZJ6R3qyxA4pyC7TQxHyKVWvTylzq072SZN9wY0uTDVoLk9/t6zq6Y8V5c
	oosa8lSzZ3usZzuLXCAvDWpuhTZvyDPU3CFAVOUY7d9kDK4Gp5tI9Nbj9HSWiWySioHKhPg0rsQK+
	m8QrDxAGs6uRzpiuCQYTqdvtuT2Q+dE7gMrp/mc1fKSvD6ilzBksk9KX/tjv4Myn6c9y+gIx+v4FO
	FGBhyntufLuN1nGtxjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImuO-00BeUl-Me; Tue, 02 Aug 2022 08:05:44 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImu2-00BeGf-TI
	for linux-amlogic@lists.infradead.org; Tue, 02 Aug 2022 08:05:27 +0000
Received: by mail-lf1-x12b.google.com with SMTP id u1so10584218lfq.4
        for <linux-amlogic@lists.infradead.org>; Tue, 02 Aug 2022 01:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=56zrn37C4l7p2DAkni03ePVpqDUmjAfKCMc+oB4Stlk=;
        b=zU6yAKCdfwACj1LN8M8wvnZF8gHg+PW6MbaJtxOXfjPZTwJFcbsX5rh/4PcyIWFme1
         7U3JuH6zupd8cH8x4qCM0FHKfjfSOT6oqCxTeBe5iYp/cla6mcBJ6lT6OVcXC5NFs4PH
         nwLe/i8HdU1F3EaiUhFefSu+O0CnNTDpzr9XET2CF+sSPkT3cfq5eqeTUiyD73P3gTPW
         td+OZMByUgxO/Xn5SDPI2aJR6TKFVzFjrnRRARwQWY3bzO0BzIq0XTKJifXR2B9sQBt0
         HH5llronv3dhWHsrTL7p/qsgSkDXD95M2lxNP+KXHPOy6YZsi6aXySPVvltlGIXeUj9w
         J3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=56zrn37C4l7p2DAkni03ePVpqDUmjAfKCMc+oB4Stlk=;
        b=hGheufbBhwG09Qv3xRoixSXtX9XvtazaVtU/wVpo2SbzFvpc3OGaMS5tlEK/nz1lg2
         NSX2TomauJzVko76UbQVTFYwMu7mpvzXRgeuW4JlspLeznDqxmtd76gOXdf0BoqU9XQq
         R4Xz0X05Irq1rgjK0B4YgCpLpqqg0bcXjOTBmI32l0aCvEihjaYDju+Oo6Pr57o4yYj1
         4bGvIbXCkATrgvOL5lNAZctEUnpLct0LNC3cGyshVEJ4qpYZ7FWlYOi8rE8hqrJe7Acl
         YJ8y6HSBfpWMD13iBaK+851TacLLBlXz9LeWrff9Mk+XxicjERePbV2LqcBV12mlfxCN
         5aUg==
X-Gm-Message-State: AJIora/1IJ6q3lCOt1a7ta+phHDnjpi8xskkroYJGvu8LoUQbJ+TEDJV
	2GktbtGtVEQkR4t5zZ/kaaTU8g==
X-Google-Smtp-Source: AA6agR62HyYSvC+LgEWXptx8UvHMaf3t1Teq0GYaR98724D7kJpvXdUM92sSva+zoy1yTiI605wHtw==
X-Received: by 2002:ac2:4e0d:0:b0:48a:bc83:7fb8 with SMTP id e13-20020ac24e0d000000b0048abc837fb8mr6560745lfr.623.1659427520594;
        Tue, 02 Aug 2022 01:05:20 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id c14-20020a2e9d8e000000b0025e5b5474a4sm190805ljj.85.2022.08.02.01.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 01:05:20 -0700 (PDT)
Message-ID: <9ef21f8e-163e-fc31-636d-c0d6d004f27f@linaro.org>
Date: Tue, 2 Aug 2022 10:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 3/4] arm64: dts: meson: Add DDR PMU node
Content-Language: en-US
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chris Healy <cphealy@gmail.com>
References: <20220801060049.1655177-1-jiucheng.xu@amlogic.com>
 <20220801060049.1655177-3-jiucheng.xu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220801060049.1655177-3-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_010523_040083_A8258827 
X-CRM114-Status: GOOD (  13.52  )
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

On 01/08/2022 08:00, Jiucheng Xu wrote:
> Add DDR PMU device node for G12 series SoC
> 
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> ---
> Changes v2 -> v3:
>   - No change
> 
> Changes v1 -> v2:
>   - Remove model, dmc_nr, chann_nr properties
>   - Add g12a-ddr-pmu, g12b-ddr-pmu, sm1-ddr-pmu compatibles as
>     identifier
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 7 +++++++
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi       | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi       | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi        | 4 ++++
>  4 files changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 45947c1031c4..7e556fe575be 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -2146,6 +2146,13 @@ hdmi_tx_out: endpoint {
>  			};
>  		};
>  
> +		ddr_pmu: ddr_pmu@ff638000 {
> +			compatible = "amlogic,g12-ddr-pmu";

No. Test your DTS against bindings first.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
