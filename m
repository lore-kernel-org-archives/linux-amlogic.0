Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACF6C38142
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 08:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqNjeXAhN4l7QHTJNGfQXelVKP4oEzqOesSum9dsSK4=; b=T7cYybeSSAoytLJgn4xwdYeRjl
	yAiZEIg1DjjSDqcB23fcIO0b/xDjtQlNdkUXKi2ARRQgRcpRTrMjHvdQrRyU6AFoGbccTDSpCvymd
	a7wGVJtlPyj2XjaESoERzq6zR0+t92RgOJkhHJl90Gd3VbUPLJdZOTs6ww9XC+ogtrjhWpgKFqV+9
	MQZqv7bNAtRSF30HVKu6Yy6oq9ishtGGmE/iO+vKdtRlTJpy7H0XD/avyGdi+sHfM/wbx+WUcVKLK
	kXaSY7vLPzE8n2f4kaeoPVT/BUdNlhKG7VlrvnlIbckOna3V/PRs5UpAbzAaRavaYwB+xd+c0jxE5
	fOBeLn3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsZO-00GQ5V-44; Mon, 23 Jan 2023 08:52:50 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsZC-00GPzd-QE
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 08:52:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id e19-20020a05600c439300b003db1cac0c1fso8547129wmn.5
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 00:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr7vqvJVlpxRui+FUTfQy19pwuzQyDWhmumOiFPc8HU=;
        b=qNh+xE+SKgb/0+aKHDKMwJKLe0v70rfrsroEg6aJ6Wh/HJq+xIRcmt67mxWq/f78GJ
         60yfbe6sd3TwEZzvll039+oQJXQfvgxNehZajtXkxOOqE2HIsMp8yZXKRXrgMZZUPQwP
         GPHKGr8N5CodfZwiJiy6KLHXF10gJ3ZRowZDe0QPj4wqwmwkCG3gN1WITOsdmwNQu1FW
         22lNMT3635c6DxsDHOmC1Df5oMWO7YpvkofaY+zT9Bg8nSEzMcuc2truGIBby3BNA2GN
         WByd87iq9Lk6yuhX77fIi24IxQqJxOJIP+6zAJNN+v//AEO06m0PdangexrnhH0Ghgpy
         tefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jr7vqvJVlpxRui+FUTfQy19pwuzQyDWhmumOiFPc8HU=;
        b=tDtUqSM16jH3TTPfRhGcErvevOLBJyfTuEwvzz5mDQEhHx0Mygl8qkIiuSHvFFP4JI
         VuEXMTlxNaZbquv3TBM7Jo3dDfhvpBS3ujaD8woToA+FgkiNXtPc8A18Y5SgahDLa1Sx
         jEV7nvr15hls7zS6tCcGIaFq1es9Iw4HtcggASdKyJ8oHysomN5NWX17XKysolKiwFBZ
         czB1WF1/LJwLunefJOv00CY40+rb6mkYdILlgynw/GWTpk0iVaBw8cL+JIXnYsGPBICm
         gC3ewSPtAAGugL3hQcLCYFZLA5SmUjcCAOGzmedI2wUIGL1Xes1naHOZ3PAKvzK8Mgmd
         7/1g==
X-Gm-Message-State: AFqh2kpPpG1VLrq11YAY5jKMkwPh3ic/8rQql2ZWjo9PC2BJfJDeCRNn
	UmT90SSZilOU1DQieZ/KuAmmvQ==
X-Google-Smtp-Source: AMrXdXsuae/e8VvvaHB4ifPigkBADdadOBuacj2j0C3Qi498flwkbacYg4v6ep4izvFrr8mLm/GwVA==
X-Received: by 2002:a05:600c:3b1e:b0:3cf:497c:c4f5 with SMTP id m30-20020a05600c3b1e00b003cf497cc4f5mr23381074wms.13.1674463954095;
        Mon, 23 Jan 2023 00:52:34 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id n9-20020adf8b09000000b00241d21d4652sm3875418wra.21.2023.01.23.00.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 00:52:33 -0800 (PST)
Message-ID: <42bbccf4-0ebe-ddfd-69c4-9cf26dce3ccb@linaro.org>
Date: Mon, 23 Jan 2023 09:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: meson: remove WiFi/BT nodes from Khadas
 VIM1
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230123065504.2669769-1-christianshewitt@gmail.com>
 <20230123065504.2669769-4-christianshewitt@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230123065504.2669769-4-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_005238_881270_AE1C8110 
X-CRM114-Status: GOOD (  13.18  )
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

On 23/01/2023 07:55, Christian Hewitt wrote:
> The Broadcom WiFi/BT SDIO nodes are now inherited from the P212 common dtsi
> so we can remove them from the VIM1 board dts.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts    | 15 ---------------
>   1 file changed, 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> index bee51e29015b..2f88f78de5b7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> @@ -220,21 +220,6 @@ &pwm_ef {
>   
>   &sd_emmc_a {
>   	max-frequency = <100000000>;
> -
> -	brcmf: wifi@1 {
> -		reg = <1>;
> -		compatible = "brcm,bcm4329-fmac";
> -	};
> -};
> -
> -&uart_A {
> -	bluetooth {
> -		compatible = "brcm,bcm43438-bt";
> -		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
> -		max-speed = <2000000>;
> -		clocks = <&wifi32k>;
> -		clock-names = "lpo";
> -	};
>   };
>   
>   /* This is brought out on the Linux_RX (18) and Linux_TX (19) pins: */

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
