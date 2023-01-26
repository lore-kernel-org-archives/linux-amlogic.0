Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BDBC05027
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Jan 2023 07:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkgYWBwzs+hgFtFh2wRTOkDu5dEtsVoKqYbe+OyEUzw=; b=E2BDXAxJvn6aykwAKTl1yaJTPt
	QPTxbV0AyWASWpDVvD3RttTqe3Gq5zwbbQDvBGMrSBYkHN7OH9hBM0bejW2xBZYlElBpOSzQpheYM
	cw7s+CLQej6ZEo29ecfngdUdahupSifiHILDJTySKv5olGJEsP+201E36b7/88sK9P1T8Ep8hpuIP
	52bHAvbKzPaEZ3Mawn4zpHA4YDlZS5wi8ZlkoKlMT18dTY/I2Bml2fGJ6Ydp0DEQHy8kWDWdh3LyX
	praGOgbysbKEceuFfF1QcV39nppYf1El+WCtYkFkuWDdUPVfiEsyHNXfp0DfLH9wucgiuQ/M94ctQ
	wbReQSmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKx8c-009uMR-SY; Thu, 26 Jan 2023 07:57:38 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKx8R-009uJt-Ap
	for linux-amlogic@lists.infradead.org; Thu, 26 Jan 2023 07:57:28 +0000
Received: by mail-wr1-x42b.google.com with SMTP id bk16so857477wrb.11
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Jan 2023 23:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j7bKuxz9/q6B7L9b7W4NH5HpkfAWyixOSveAwekdQNk=;
        b=UhOdRcytBPiWbC3nMRyH4vV2wvoDhYlk8QaJUky7mkejFO11MjxMBKdTnQLyqQKwMh
         fBjaHsm3m0g/nMD4cWj31UsYLhlPrg/5aQ5PBwc9N3kt/OXcvXUuY35mQK/7l63gFO9k
         itIQJMuvQzeP5h722L0+9x5fxxilyncqDHQ1SXP2aGrwD5NZ9PD2CkXPLdbQspRFo5Vw
         GYUgCXb2RdYKFKc9eERsQ05M6TcWf2/HfyE1qgYsKe8nT8U6giElGa4m6auPxwP3bCaH
         RPZqSTLGMIdBClJDB0t1pwq5TPz8DF/0j+XkdXtGofOfhA8jCsjZV+57QmpTF2gTNZxz
         N1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7bKuxz9/q6B7L9b7W4NH5HpkfAWyixOSveAwekdQNk=;
        b=lWalwqpun5nbrZvjq+gwBhkGcGnHOD67njcvtysgY7iBWF5WgX4EUXcaXM5jaOzqSt
         vlRgVDZkKYdMu+lVw2qqUDEYzLH/q1lnl2QuguKxs1z46lVr2p2NzBuszhawiIxj9HTm
         7DF1V2wGjS2+BW+LtMgDsVsIH5+pvcYi6oJU1VI5dwDRpEnUY6pD9wGl+NGDQFQIb8Jt
         jOctPM6Fcx4bb+LIvsBwaBMMPhRpGZbfovICAyLDtsP1No009WnJMVHh/1iNHw70ttLR
         81mRS1CdT2PMaFeShM4709RNfGTcfCfrLrBQPVtXoTy9dO/udSqYvpPxkQjVZrtkDyVf
         +RAw==
X-Gm-Message-State: AFqh2krGMjoEKL/gCL1rKPox9IRzBJcFu0KlwOmlcVQpMk9WhAecJglf
	95JiCttm1w+i073ADegJZUKoJg==
X-Google-Smtp-Source: AMrXdXuUDPhLuBdPEv34MAe+K+6Z1KfnZZ9Nqnykj2Lafe5uX4QhwnKLoQg3XRq5QNeF8QrIT0Nk3w==
X-Received: by 2002:adf:eacd:0:b0:2bb:f4bf:e763 with SMTP id o13-20020adfeacd000000b002bbf4bfe763mr40833520wrn.51.1674719841074;
        Wed, 25 Jan 2023 23:57:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8586:171d:1523:4f41? ([2a01:e0a:982:cbb0:8586:171d:1523:4f41])
        by smtp.gmail.com with ESMTPSA id n6-20020adff086000000b002bdbead763csm537107wro.95.2023.01.25.23.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 23:57:20 -0800 (PST)
Message-ID: <6055791c-68d8-987b-0f2c-0526fde9686e@linaro.org>
Date: Thu, 26 Jan 2023 08:57:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: amlogic: Fix SDIO interrupt and make it
 level-sensitive
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <d9b72573-a59f-989f-a752-1aa8517cf8dc@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <d9b72573-a59f-989f-a752-1aa8517cf8dc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_235727_410464_C81C2A30 
X-CRM114-Status: GOOD (  20.61  )
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

Hi Heiner,

On 25/01/2023 08:00, Heiner Kallweit wrote:
> SDIO specification defines that the interrupt is level-sensitive.
> Fix the interrupt trigger type for emmc_a accordingly.
> See comment at beginning of the file wrt which is the SDIO port.
> mmc2 = &sd_emmc_a; /* SDIO */
> 
> The usage of edge-triggered interrupts lead to lost interrupts under load,
> see [0]. This was confirmed to be fixed by using level-triggered
> interrupts.
> 
> Note:
> SDIO interrupt support was added in Linux just recently, however other
> users of this dts may be affected too.

Switching from edge to level has already fixed performance issues on ethernet,
so I think this would be the right direction, but since the SDIO, eMMC and SD controllers
are basically the same IP, they should have the same interrupt setup.

It makes no sense to have level only for SDIO, so perhaps it would be right to
switch every controllers to LEVEL (including AXG) and test to see if there's no regressions.

Neil

> 
> [0] https://www.spinics.net/lists/linux-mmc/msg73991.html
> 
> Fixes: 1499218c80c9 ("arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi")
> Reported-by: Peter Suti <peter.suti@streamunlimited.com>
> Tested-by: Peter Suti <peter.suti@streamunlimited.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - rebase considering recent node name change sd -> mmc for sd_emmc_a
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 1a931d5c2..c09eb9f6f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -2324,7 +2324,7 @@ uart_A: serial@24000 {
>   		sd_emmc_a: mmc@ffe03000 {
>   			compatible = "amlogic,meson-axg-mmc";
>   			reg = <0x0 0xffe03000 0x0 0x800>;
> -			interrupts = <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
> +			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
>   			status = "disabled";
>   			clocks = <&clkc CLKID_SD_EMMC_A>,
>   				 <&clkc CLKID_SD_EMMC_A_CLK0>,
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index a79a35e84..ae1a5a568 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -603,7 +603,7 @@ apb: apb@d0000000 {
>   			sd_emmc_a: mmc@70000 {
>   				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
>   				reg = <0x0 0x70000 0x0 0x800>;
> -				interrupts = <GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;
> +				interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
>   				status = "disabled";
>   			};
>   


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
