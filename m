Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5636C54E94
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 07:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8ZWMQT9L9KYyJCm4NZSCdqEqLPFMYJUcl1A/wdf+lfE=; b=i9RQjcTDxDShad
	oJt63TVUNIslmTa91dG2ohEju3rHUEv9Mhk/mjhD2j7toj39eAJUgIjlCh/rxpYBrzTSIqFySjFPC
	qe3tQTAsgYCdM3MTUhZy+p3PzqftRsqpU9n1QHs0oTdl5NQkcvvMlpB+Bh+A+3HFSOalywUjk8BD6
	rzj8SDhtxhM0+iLjpgDfTsyh0+juTqromxwgJvx8d57UAPUq9ImhJnGhdESl5JCp+CKF4M5CKBvq2
	rwW34Ucksmc4dMO4LisK5KkrLD3qTirPtlpP7HnctgHIhIHGnVfRWjXVqgUOyYjP90LtKE/EXNXCV
	nyIEwgfp2DCpOJr4HyzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKZlp-006Crh-Pu; Wed, 25 Jan 2023 07:00:33 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKZlf-006Cpi-0k; Wed, 25 Jan 2023 07:00:24 +0000
Received: by mail-ej1-x633.google.com with SMTP id kt14so45061066ejc.3;
        Tue, 24 Jan 2023 23:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6Cwt2zoj1KPqgoUGLAvd8YCYHAqAHUKRAPYtupMvBk=;
        b=WK/PtMneMUj8tYaCs0hjU3/vtSCK+BRocrMLX7QSpyl6mKPWxYXUXSZIfPnqvNw2A8
         O4Nn6BY3KcE3BU+6CnHNxnrorX2kNfuWu7HS3LYXQsDtCOhSuwQ/52IbkyezM/rgSjfC
         eaLx+1Os/7FjZNOxyeZUAAM+bl1A8SvKyO0mWZjCf9vRSBEs3UsaL6d2I0uy62W5dllD
         yIaDUoLbfzQ0q3Zd9KJAfSrJkRW3cs5p87pDgKpnkQ45dHD+PMsKMKNz3+yza0K2D5jP
         Fft70CAtkZblvHwKgXy0DsMBxu2Z3o+FXLHXDT/LOuZaIY8QgtEF898WfxhpwghblkwR
         BtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E6Cwt2zoj1KPqgoUGLAvd8YCYHAqAHUKRAPYtupMvBk=;
        b=gfcNA2sLA6KVLQ0FJsKzD5g09S0R3OqOpp9O3D7ZW/ZmZBt8Q4FgEJbpFKxmNRJRt4
         4n/bxV1fJBrCTDo/sBjvuyA384gR1E1TspNKNdUCSuWGNyKIiUjqoaf2OCLiQTt5ni78
         XnWNlDBVHAZpg9xmcAJLb55czWnSp9djtYxNYTLpEHuCyqlxGIfy8CtHYumbP49OpaRl
         Kr0XHoUlEVYese3VB2UwiQFVOAuQ/AP+zWzsZ5Joos7wbisM3DASFi9SHbmIOS+ZrLDi
         gsm2RqA40EGbwUIRqUMks2T7XfmtRrm3Uq5LRw+znrDRKqMCti/1ZAKckkorcxzO1mHy
         G/2A==
X-Gm-Message-State: AFqh2krtMXMQNo9C6FxE4ODKkPvGNTQ52LA1O3QoGW23p1LIfC4UW1va
	5+CZi93biZ0QFRG15snpY7A=
X-Google-Smtp-Source: AMrXdXu7XzWMtWj4fU35KOZJW2CN7axDgDTgii+/KdguY7A5KbrvJjkcpcmF+xi/PHwxXYz1riyAMQ==
X-Received: by 2002:a17:906:5fcb:b0:870:df7:300b with SMTP id k11-20020a1709065fcb00b008700df7300bmr32538975ejv.52.1674630018663;
        Tue, 24 Jan 2023 23:00:18 -0800 (PST)
Received: from ?IPV6:2a01:c22:720f:5a00:9008:755f:20dd:1de8? (dynamic-2a01-0c22-720f-5a00-9008-755f-20dd-1de8.c22.pool.telefonica.de. [2a01:c22:720f:5a00:9008:755f:20dd:1de8])
        by smtp.googlemail.com with ESMTPSA id q25-20020a17090676d900b00872a726783dsm1896190ejn.217.2023.01.24.23.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 23:00:18 -0800 (PST)
Message-ID: <d9b72573-a59f-989f-a752-1aa8517cf8dc@gmail.com>
Date: Wed, 25 Jan 2023 08:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] arm64: dts: amlogic: Fix SDIO interrupt and make it
 level-sensitive
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_230023_094499_77E6B47D 
X-CRM114-Status: GOOD (  11.04  )
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

SDIO specification defines that the interrupt is level-sensitive.
Fix the interrupt trigger type for emmc_a accordingly.
See comment at beginning of the file wrt which is the SDIO port.
mmc2 = &sd_emmc_a; /* SDIO */

The usage of edge-triggered interrupts lead to lost interrupts under load,
see [0]. This was confirmed to be fixed by using level-triggered
interrupts.

Note:
SDIO interrupt support was added in Linux just recently, however other
users of this dts may be affected too.

[0] https://www.spinics.net/lists/linux-mmc/msg73991.html

Fixes: 1499218c80c9 ("arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi")
Reported-by: Peter Suti <peter.suti@streamunlimited.com>
Tested-by: Peter Suti <peter.suti@streamunlimited.com>
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- rebase considering recent node name change sd -> mmc for sd_emmc_a
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 1a931d5c2..c09eb9f6f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2324,7 +2324,7 @@ uart_A: serial@24000 {
 		sd_emmc_a: mmc@ffe03000 {
 			compatible = "amlogic,meson-axg-mmc";
 			reg = <0x0 0xffe03000 0x0 0x800>;
-			interrupts = <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 			clocks = <&clkc CLKID_SD_EMMC_A>,
 				 <&clkc CLKID_SD_EMMC_A_CLK0>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index a79a35e84..ae1a5a568 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -603,7 +603,7 @@ apb: apb@d0000000 {
 			sd_emmc_a: mmc@70000 {
 				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
 				reg = <0x0 0x70000 0x0 0x800>;
-				interrupts = <GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;
+				interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
