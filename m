Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D2FC38142
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 08:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anhlEWelcHFieked/Fqrs1t3YJRTDBvNkLTgqBpsOmE=; b=u2sH+OTVAuHA6400R8jH92HLaL
	HbCFhR+r9MUxGuYFLvEF/piyqTHMrF/WwH55vrVJZCuYtwqKHiYIqBzwJr946kZC016gQvkJ77DpY
	AG0+p/JXq6cCCA3uRDjg5LHLaR54rm3VehUMy/bshTxRJU8Ssmi4q85elfgIqZh/tShvsoO5rE6Jl
	Fxyb6LXZFy9w77ZEUGiMbwifNXFUzeZU7GTDk/FMFnHIeO4t9W/gFkBbR4laQU6LrzZCnZTUJltqM
	96yYQLkcSTawjfSM/MvkaZUcaSSadcZp7fQ8Frqz2HtdS7zRa+ConumSIYxuO5xZQYM9AR3Dzfwyc
	5yxNLkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsY8-00GPdK-UC; Mon, 23 Jan 2023 08:51:32 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsY6-00GPXp-0G
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 08:51:31 +0000
Received: by mail-wr1-x432.google.com with SMTP id t5so10078593wrq.1
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 00:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wq4oxC5buz2E+s+BroZ/0SZWCgxAdvbZS0s80EVNBbM=;
        b=VAMN1A4mAJsh1F+t2xlr3cE95+Gexl9o2e++SHfnnifZaIYwcO/AHR4vLQ1sjZcLtE
         c3M//falD105XaFKZvknfn7UuRlNcIb0SRJRpLOWK1sKGJvcgt8QZoiFUDGSczgbyltd
         18pa5lbRon1N8+2K0tDCOe4BjoNcoua7SKoOfNdMcSm+MoRE51qKwU2brxbGr730htkC
         4rM5cBuzo7tkFUsZDmngeR03BA7Scu0yjYJzEViHymHqIpC0mzF/bJlHmIUG2iSOpvQr
         VkRfevIlfRs3zEMlwPSfIUspfSodAHT3r1xoSwBZsWlijQbEbinAi4YViGeQ4FSLbB6x
         zBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wq4oxC5buz2E+s+BroZ/0SZWCgxAdvbZS0s80EVNBbM=;
        b=2wpQKlpDvtUGQU8JijZ9ebpUqOmM10gKLM4zctGEgmchJCWrUW5jSKdp3bGmsMH0F8
         5cvHClyZhb2hd0XKy9iG8MLLQfkYcnsQy92LjSYhRFix0Q8ZSKGTTl3CijnmqrVgGoQ5
         dMVN2lCHRyjhkNVHCfs1EE/hYuPt/0kSoUYWA2No6YN0xgQmTLZHNPqcFXeG9QUeEh4s
         rg0hhDI1El17DHH/c5D/32zZDv3fIhd6C3ClvpthAJMKhmSg9i0lBpFHPpOgkk/tqW3D
         yHxVTc/wAyHNzND4oW0QTf+fRp/EzY1ZiePglwJknlIQxzbMP7TiImrtQ/L3VsoFE5xt
         3D6w==
X-Gm-Message-State: AFqh2krbch7X6Tm9cND6fqCku/NdG0D+8lRVE53w5CYyBoVuDW2w9UTC
	24bvdUiA9qG1OiHSArcvgsoLPN1bYSov+KB8Nj4=
X-Google-Smtp-Source: AMrXdXsdQgWZCpS1AtJWPqX/KLIQrSbqDRbAfeCYmmt51Clnv9Byjawpk1DpexppmgpYN7AFmSYRJQ==
X-Received: by 2002:adf:ee10:0:b0:2bd:d5f5:8820 with SMTP id y16-20020adfee10000000b002bdd5f58820mr20537410wrn.27.1674463889449;
        Mon, 23 Jan 2023 00:51:29 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id n8-20020a5d6608000000b002423dc3b1a9sm3649553wru.52.2023.01.23.00.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 00:51:29 -0800 (PST)
Message-ID: <c58e70ab-da4d-3045-debb-49e31c383999@linaro.org>
Date: Mon, 23 Jan 2023 09:51:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] arm64: dts: meson: move pwm_ef node in P212 dtsi
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230123065504.2669769-1-christianshewitt@gmail.com>
 <20230123065504.2669769-3-christianshewitt@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230123065504.2669769-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_005130_073044_87130CD9 
X-CRM114-Status: GOOD (  13.44  )
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
> Cosmetic-only change to alpha-sort the pwm_ef node.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   .../boot/dts/amlogic/meson-gxl-s905x-p212.dtsi   | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
> index 7055057d7942..a150cc0e18ff 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
> @@ -97,6 +97,14 @@ &ir {
>   	pinctrl-names = "default";
>   };
>   
> +&pwm_ef {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_e_pins>;
> +	pinctrl-names = "default";
> +	clocks = <&clkc CLKID_FCLK_DIV4>;
> +	clock-names = "clkin0";
> +};
> +
>   &saradc {
>   	status = "okay";
>   	vref-supply = <&vddio_ao18>;
> @@ -170,14 +178,6 @@ &sd_emmc_c {
>   	vqmmc-supply = <&vddio_boot>;
>   };
>   
> -&pwm_ef {
> -	status = "okay";
> -	pinctrl-0 = <&pwm_e_pins>;
> -	pinctrl-names = "default";
> -	clocks = <&clkc CLKID_FCLK_DIV4>;
> -	clock-names = "clkin0";
> -};
> -
>   /* This is connected to the Bluetooth module: */
>   &uart_A {
>   	status = "okay";

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
