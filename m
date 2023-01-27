Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B12BC38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 08:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMpDRwQHIuLgR89pRyws0fJkNCulL2GyKu5evzIIhAk=; b=BrMVODVR8S2KO5
	I2GOl85VweSjAjyt8RXoneApfFQ3+iiuqeIdPprjh503YFXVSKlkFH34Gjls98nac9uOLHivu1Ws8
	lRYTQ8pzADnPBi1QsjPZZNr4F54H97mvgxluhNleTNgH8CcclxHVeoNA/0AeMRl3s0aLPzZU8eJyW
	az2oThHJJSLKlLAhDKxoFWunB1r8PqgqBR8sI2crka5DjfXXmCBNeECnxfPEAkV0eS5ENLpWk8Rei
	7Y2uUKXUvMmIx/6e2PMXKROvUlVcgEXZRPVfRN3Sim3gKOfM/QaTXuDwL7W8Eq4/Pgz0DwsmcY1XS
	4lJC10csrT27+LJNmJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLKVJ-00DYZ9-HU; Fri, 27 Jan 2023 08:54:37 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLKV5-00DYWo-SH
	for linux-amlogic@lists.infradead.org; Fri, 27 Jan 2023 08:54:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id j36-20020a05600c1c2400b003dc39cb9c33so535068wms.1
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Jan 2023 00:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=0Aq47BtuyFAjUm0GhCtLi/DfxLNu4Y6gfIRbj17cxck=;
        b=l9WEgyRR6YO39w+xZb/tVykmNrcx9QGGxsKHsAFdDcwKEvPukOAFBbJ/JqXO2/HJub
         8XKidXklL2aI+ZH5RubFofG8J+ik+cvREZmvR97+fkiOSJHXB/OaM7BwcKl2Usnp9/qQ
         6dXcBU3e7KhG/qQtUdz+JdKe+AMJ0IY6VDE6aVbUqcz/exrhrEdL8m0ddL4BHtqz/Ij1
         T9e0VOS1H/gn0M4b4KSEgLxdPq3Ze9Ey7HXkxLJOptJfjPCSk7L2AgsATJO3dayfQL95
         eVYFPzmrJW2hUtP3E+AzO3+vWuRVEdIQymYrOalD9ofB07zUPjaHc+mgsYTLZFlLIG6g
         FZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Aq47BtuyFAjUm0GhCtLi/DfxLNu4Y6gfIRbj17cxck=;
        b=LbarSSW8ARgVLdo2Tg93kTsgA3d0nSxlyBXb8aEma7NFXimuOEvnOwTbvFect8m75t
         2IZh5Qsl0EZJG+6o/fvAm5UWOWCfOCJx74JWWq7FStC6T465WVzb/hnwh0VJZA3U11PT
         8mb14KRHV2C0IGKT5G2htazaiPdAce2DIwo12gGStBs3eUqmWUOq61cq0ChWJtqaZC4T
         11Xxk+aW5GFvq8JpkLZ5ZaMZplOrHPrZVi5MnxQU16Wc6vigdjwlABA/OQ/IF4EpGye1
         jvlKZK+krUOrCqqdFCMZv2jPBjnAxqUWSgqRwA431WDx5RQZE4H2no/E5ZGa5tjaHECS
         ofrQ==
X-Gm-Message-State: AFqh2kruUs6hgfRAyzk88y583tHGaZntaVa8u2bTktg4oG6BeI0eQvgB
	w7f00oYqB6jhmz/kOsOg3cZP8g==
X-Google-Smtp-Source: AMrXdXuOEr4KHQE3WeLlWm0Ta83MDcHUBbweeDfYT9AuvvAUrdZUN2EynQr+nxewUbAJTYXZp0WAfA==
X-Received: by 2002:a05:600c:3583:b0:3d2:2d2a:d581 with SMTP id p3-20020a05600c358300b003d22d2ad581mr39628189wmq.30.1674809659374;
        Fri, 27 Jan 2023 00:54:19 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c2ccb00b003cf71b1f66csm4176708wmc.0.2023.01.27.00.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 00:54:18 -0800 (PST)
References: <d9721029-780e-09f1-0207-72d3897032a4@gmail.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v2] arm64: dts: amlogic: Make mmc host controller
 interrupts level-sensitive
Date: Fri, 27 Jan 2023 09:52:34 +0100
In-reply-to: <d9721029-780e-09f1-0207-72d3897032a4@gmail.com>
Message-ID: <1jlelo73yd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_005424_124045_15817E4C 
X-CRM114-Status: GOOD (  14.79  )
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


On Thu 26 Jan 2023 at 15:03, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> The usage of edge-triggered interrupts lead to lost interrupts under load,
> see [0]. This was confirmed to be fixed by using level-triggered
> interrupts.
> The report was about SDIO. However, as the host controller is the same
> for SD and MMC, apply the change to all mmc controller instances.
>
> [0] https://www.spinics.net/lists/linux-mmc/msg73991.html
>
> Fixes: 1499218c80c9 ("arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi")
> Reported-by: Peter Suti <peter.suti@streamunlimited.com>
> Tested-by: Peter Suti <peter.suti@streamunlimited.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

On the vim3:
Tested-by: Jerome Brunet <jbrunet@baylibre.com>

Thanks a lot for this !

> ---
> v2:
> - apply the fix also to meson-axg
> - apply the fix to all host controller instances
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 4 ++--
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 +++---
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 6 +++---
>  3 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index ed895fb32..a6a3095de 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -1886,7 +1886,7 @@ apb: bus@ffe00000 {
>  			sd_emmc_b: mmc@5000 {
>  				compatible = "amlogic,meson-axg-mmc";
>  				reg = <0x0 0x5000 0x0 0x800>;
> -				interrupts = <GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
> +				interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>;
>  				status = "disabled";
>  				clocks = <&clkc CLKID_SD_EMMC_B>,
>  					<&clkc CLKID_SD_EMMC_B_CLK0>,
> @@ -1898,7 +1898,7 @@ sd_emmc_b: mmc@5000 {
>  			sd_emmc_c: mmc@7000 {
>  				compatible = "amlogic,meson-axg-mmc";
>  				reg = <0x0 0x7000 0x0 0x800>;
> -				interrupts = <GIC_SPI 218 IRQ_TYPE_EDGE_RISING>;
> +				interrupts = <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>;
>  				status = "disabled";
>  				clocks = <&clkc CLKID_SD_EMMC_C>,
>  					<&clkc CLKID_SD_EMMC_C_CLK0>,
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 6d7272b2c..13fdaba21 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -2324,7 +2324,7 @@ uart_A: serial@24000 {
>  		sd_emmc_a: mmc@ffe03000 {
>  			compatible = "amlogic,meson-axg-mmc";
>  			reg = <0x0 0xffe03000 0x0 0x800>;
> -			interrupts = <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
> +			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
>  			status = "disabled";
>  			clocks = <&clkc CLKID_SD_EMMC_A>,
>  				 <&clkc CLKID_SD_EMMC_A_CLK0>,
> @@ -2336,7 +2336,7 @@ sd_emmc_a: mmc@ffe03000 {
>  		sd_emmc_b: mmc@ffe05000 {
>  			compatible = "amlogic,meson-axg-mmc";
>  			reg = <0x0 0xffe05000 0x0 0x800>;
> -			interrupts = <GIC_SPI 190 IRQ_TYPE_EDGE_RISING>;
> +			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
>  			status = "disabled";
>  			clocks = <&clkc CLKID_SD_EMMC_B>,
>  				 <&clkc CLKID_SD_EMMC_B_CLK0>,
> @@ -2348,7 +2348,7 @@ sd_emmc_b: mmc@ffe05000 {
>  		sd_emmc_c: mmc@ffe07000 {
>  			compatible = "amlogic,meson-axg-mmc";
>  			reg = <0x0 0xffe07000 0x0 0x800>;
> -			interrupts = <GIC_SPI 191 IRQ_TYPE_EDGE_RISING>;
> +			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
>  			status = "disabled";
>  			clocks = <&clkc CLKID_SD_EMMC_C>,
>  				 <&clkc CLKID_SD_EMMC_C_CLK0>,
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index e3c12e0be..5eed15035 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -603,21 +603,21 @@ apb: apb@d0000000 {
>  			sd_emmc_a: mmc@70000 {
>  				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
>  				reg = <0x0 0x70000 0x0 0x800>;
> -				interrupts = <GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;
> +				interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
>  				status = "disabled";
>  			};
>  
>  			sd_emmc_b: mmc@72000 {
>  				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
>  				reg = <0x0 0x72000 0x0 0x800>;
> -				interrupts = <GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
> +				interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>;
>  				status = "disabled";
>  			};
>  
>  			sd_emmc_c: mmc@74000 {
>  				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
>  				reg = <0x0 0x74000 0x0 0x800>;
> -				interrupts = <GIC_SPI 218 IRQ_TYPE_EDGE_RISING>;
> +				interrupts = <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>;
>  				status = "disabled";
>  			};
>  		};


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
