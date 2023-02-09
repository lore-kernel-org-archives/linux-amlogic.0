Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B54C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Feb 2023 20:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gO6oNeLPTPo0kcKDZ3cWs7Qf2aDKq3boy6PZ+88YSfA=; b=Z6D05hIVZYm3Tv
	ZhJZE6rezKS22dRZUUuZkY4PnQsDniGHOqHX2mcToinxHUizEKwLXZWxTm0iRljMxsou87CfDu/tF
	jojHpt06s7k1p3QrqKIWuQYyzY6W8EESbJmPWhBT1snhUFtsj5VmLWrsivLXUvp4+Z8AFRa+CBaXK
	D2vw4CZaJI0lZ3SWKiCuDfXhcfWoXJP/QueXCkzmBcTY9SPobGDzhJolD58fkPFWwhdYdWIftSoem
	acI3K//5Kpd2+TAORnv4UGCrzwO32jxC5jk1fLO6dI2gfRZGVf6Giy8GaykVIpgBqGfmEXzK/tKEU
	BJeCP50AFzbtCO/nbdBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQDH8-00380Y-D9; Thu, 09 Feb 2023 20:12:10 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQDH0-0037wT-DG; Thu, 09 Feb 2023 20:12:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so4743342wmb.4;
        Thu, 09 Feb 2023 12:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXtmGcOp83SYDJQFPEFrPBZdWkFOFQJpPG0st0A7D/g=;
        b=ntXgAa39Gzuh2fE/jrOlaunLQdOf0/qZ/Xt9l0nzIw4NTKpTZRQZJotJ2KrN52m/GH
         Xlf5rQ0dgND6BZ6nOLjXL3Qm6GhGrUEPYsOFkuxqtZb+WYG/cV/cHPVapZJpd5veD6IV
         H3LIjyr+tsMPvIQqmhs0Pz3dHKglrBc3Ggad0N5uiWADWruQKq0xbd+WK3b+hsAgX0td
         cmadE+8jZtnUewqLuAGPayiyGaT5LCul79PLn8uhFASfBAcy9uYkYeokP5Ik36k/Lt9n
         BCETVflXNlgXcqmTWX7cSabLrQ2aRx97W9tHFFwj/2MS/4FVHp+z+cNLflcsc6TZpchT
         0p5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXtmGcOp83SYDJQFPEFrPBZdWkFOFQJpPG0st0A7D/g=;
        b=5gbhH8jv3Td2Xw2Tq4Z5kMkO2w1siHp1KHxNL0qvwIhY3yQ+LAXmVIsIMeEzASi/Xk
         tYMmg+6r3JpyNOitAzvBs9ZjJXEiS+JhRWdSXq0ga6KpMAtAStasF9+lp45S3zKE34wx
         /kLR30ADkqtmWVQ7lNkUMkucgtwQTg3Fln2l5mzH4+X6d/E5xE4qoA6y+blpMJB9pwzJ
         845COYgFuscJeMdfb62IyapiN1rD+dzYZqSSGb5kPYlx7x7Gxz0bRjVJUCEOTjIork9N
         oottlPX0z21xYklcxjaztA5YDyiAEDwwD+Ejprz3PFsaqn4UUt6N2nsWNhvaQkV65oTr
         eViQ==
X-Gm-Message-State: AO0yUKXhnapBypWv7abQxtYvOxVnqUnLDdWk9fyMmHHpg2ixw/+N4+XA
	QZpjyO1fEBc3smkfCqcBPJ4=
X-Google-Smtp-Source: AK7set8DQyrsC5CwB8Cxf+SlkhLmoHu6xkM2xqH4c4iBUueDVQ2nSh4a6Jc+qsWE7I+k8WJpngTh8w==
X-Received: by 2002:a05:600c:16c6:b0:3db:fc3:6de4 with SMTP id l6-20020a05600c16c600b003db0fc36de4mr10853872wmn.35.1675973518508;
        Thu, 09 Feb 2023 12:11:58 -0800 (PST)
Received: from ?IPV6:2a01:c23:c4df:e300:c146:1250:ead2:43ad? (dynamic-2a01-0c23-c4df-e300-c146-1250-ead2-43ad.c23.pool.telefonica.de. [2a01:c23:c4df:e300:c146:1250:ead2:43ad])
        by smtp.googlemail.com with ESMTPSA id c12-20020a05600c0a4c00b003dc34edacf8sm6564899wmq.31.2023.02.09.12.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 12:11:57 -0800 (PST)
Message-ID: <27d89baa-b8fa-baca-541b-ef17a97cde3c@gmail.com>
Date: Thu, 9 Feb 2023 21:11:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: [PATCH 2/3] arm64: dts: meson-g12-common: Make mmc host controller
 interrupts level-sensitive
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Nan Li <nan.li@amlogic.com>,
 Vyacheslav Bocharov <adeep@lexina.in>
References: <8a99341b-8546-8f90-c9a5-087d927cac48@gmail.com>
In-Reply-To: <8a99341b-8546-8f90-c9a5-087d927cac48@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_121202_486941_83B7FCAE 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

The usage of edge-triggered interrupts lead to lost interrupts under load,
see [0]. This was confirmed to be fixed by using level-triggered
interrupts.
The report was about SDIO. However, as the host controller is the same
for SD and MMC, apply the change to all mmc controller instances.

[0] https://www.spinics.net/lists/linux-mmc/msg73991.html

Fixes: 4759fd87b928 ("arm64: dts: meson: g12a: add mmc nodes")
Tested-by: FUKAUMI Naoki <naoki@radxa.com>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 585dd70f6..767412d3a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2324,7 +2324,7 @@ uart_A: serial@24000 {
 		sd_emmc_a: sd@ffe03000 {
 			compatible = "amlogic,meson-axg-mmc";
 			reg = <0x0 0xffe03000 0x0 0x800>;
-			interrupts = <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 			clocks = <&clkc CLKID_SD_EMMC_A>,
 				 <&clkc CLKID_SD_EMMC_A_CLK0>,
@@ -2336,7 +2336,7 @@ sd_emmc_a: sd@ffe03000 {
 		sd_emmc_b: sd@ffe05000 {
 			compatible = "amlogic,meson-axg-mmc";
 			reg = <0x0 0xffe05000 0x0 0x800>;
-			interrupts = <GIC_SPI 190 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 			clocks = <&clkc CLKID_SD_EMMC_B>,
 				 <&clkc CLKID_SD_EMMC_B_CLK0>,
@@ -2348,7 +2348,7 @@ sd_emmc_b: sd@ffe05000 {
 		sd_emmc_c: mmc@ffe07000 {
 			compatible = "amlogic,meson-axg-mmc";
 			reg = <0x0 0xffe07000 0x0 0x800>;
-			interrupts = <GIC_SPI 191 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 			clocks = <&clkc CLKID_SD_EMMC_C>,
 				 <&clkc CLKID_SD_EMMC_C_CLK0>,
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
