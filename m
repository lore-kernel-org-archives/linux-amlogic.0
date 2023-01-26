Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D774C05027
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Jan 2023 14:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=05Sqj1KvZdrkud85IEIETmIxzxQsXQiopkVM2ksjPxA=; b=4SRkouDaUMzpyF
	ADYx4y80khysB5TAySl27LchFNXldsOZnduZMb9fJ+MSnIbyZvz5lFtvdewtF6GB/dK2YaJIki1eI
	vR9VoDRClHvmv+Y0Zl9k7c+0sxh5NFfydnK04QDSRFLcIQ/3+gt7Mqt6ngakEj//mLJlJAQBKwUMZ
	+iVh0YCdf7vS1zIfD5JMvc3yt0u7OLa3TJq2oyNFONSfUu8XBtnpJUe/Y+UrGsaSlBvbWRB0GdmPw
	Kbnep1PbUFOiERrJVuLgt/6Cevnlza1vAQd7MPdgkLowWJdlSX8wDTQhlshk2Svyz/Ton58lyHn60
	uKlOmCH0lO8DmxLZXm+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL2qy-00B7Df-66; Thu, 26 Jan 2023 14:03:48 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL2qX-00B72c-FW; Thu, 26 Jan 2023 14:03:23 +0000
Received: by mail-wr1-x432.google.com with SMTP id y1so1887299wru.2;
        Thu, 26 Jan 2023 06:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:content-language:cc:to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1R+KSXXSI5OCkGmcSGPJ14BwDUs5OA3N1/+E4dOGM8=;
        b=ZAwFyqhgyWXc3bj80mlOg/P43NgKT7ALTQrsS7SDU4gtfkN4zLgSrcDcfsXSXFXlT4
         3uv4qVGo1SGXyLJNerfDIjajTY2ew5asWoHkHHOogFCC7GBwx11GPsDq6uvV0TV5r3qb
         MjCtxEXZnpqikMtl7WDrJtjmeVwBjErEWnwOgultJAOC90xLRYkA97MJOj8lCAhkFd3B
         GZfz/3cLIXYlVvr1fSOG5RzcMqFoCyqG+D/MHnrDBk7IfSwpZIOjqiACPAaaK/TSdP7x
         eIfPoxiO2XieSjHWM+D9nMve3CRy2BhNlyLJvINiErl8OYohCvONi0U/6wBkxDHMhBia
         jN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:content-language:cc:to:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b1R+KSXXSI5OCkGmcSGPJ14BwDUs5OA3N1/+E4dOGM8=;
        b=T5HrU4ZtyjUvEE61+b66OB9gzZLTfmFIOBD3Oa04np48RCdJo55i3hAB5MRRvJBFvF
         S/rPJKaChYnVAdITn2FP5DhSMM3OHufvSnezx+inE+QYCLyRvUwL+BhfxxMYKEFcHIIU
         Ow0LtbJjjiEmM0CzBhpy8O9xxt6VtVeNJa7BpMpiaJa0OweD+QrZtXULd8hWnUGPMUyB
         9v6Pq3thEsSizd4465VSHPxxKa1xRlHvM6QMj+G3bOk1zqQE0QPyxT3l27g3y/3ks4rW
         QKtyJDxB/q9rH25aplTTtzLFPzR4UY2uUs/FzKXQqtG/v0WzuU04t4valrY7H3Fth3X/
         fuuw==
X-Gm-Message-State: AFqh2ko4/fhwO/oOh8YLY6z8m8X+s5gL2emFdXokM5koTnF2pR5DCSF7
	NIK1g3Cyjn7Jwo8MwqtUe/0=
X-Google-Smtp-Source: AMrXdXvdPCRqULeRDOEBpBU5avzxfRixDB/PhsGp2fDiMhS5+qqS1g2keVt7Azf1eetlAbpDKMot9A==
X-Received: by 2002:adf:f0c7:0:b0:2bd:e18d:c9e5 with SMTP id x7-20020adff0c7000000b002bde18dc9e5mr32108547wro.40.1674741799850;
        Thu, 26 Jan 2023 06:03:19 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0e4:9a00:bd2c:be74:a635:44ca? (dynamic-2a01-0c23-c0e4-9a00-bd2c-be74-a635-44ca.c23.pool.telefonica.de. [2a01:c23:c0e4:9a00:bd2c:be74:a635:44ca])
        by smtp.googlemail.com with ESMTPSA id a5-20020adfeec5000000b002bfae6b17d2sm1402122wrp.55.2023.01.26.06.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 06:03:19 -0800 (PST)
Message-ID: <d9721029-780e-09f1-0207-72d3897032a4@gmail.com>
Date: Thu, 26 Jan 2023 15:03:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Heiner Kallweit <hkallweit1@gmail.com>
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
Subject: [PATCH v2] arm64: dts: amlogic: Make mmc host controller interrupts
 level-sensitive
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_060321_639230_7182D784 
X-CRM114-Status: UNSURE (   9.70  )
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

Fixes: 1499218c80c9 ("arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi")
Reported-by: Peter Suti <peter.suti@streamunlimited.com>
Tested-by: Peter Suti <peter.suti@streamunlimited.com>
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- apply the fix also to meson-axg
- apply the fix to all host controller instances
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 +++---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index ed895fb32..a6a3095de 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1886,7 +1886,7 @@ apb: bus@ffe00000 {
 			sd_emmc_b: mmc@5000 {
 				compatible = "amlogic,meson-axg-mmc";
 				reg = <0x0 0x5000 0x0 0x800>;
-				interrupts = <GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
+				interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 				clocks = <&clkc CLKID_SD_EMMC_B>,
 					<&clkc CLKID_SD_EMMC_B_CLK0>,
@@ -1898,7 +1898,7 @@ sd_emmc_b: mmc@5000 {
 			sd_emmc_c: mmc@7000 {
 				compatible = "amlogic,meson-axg-mmc";
 				reg = <0x0 0x7000 0x0 0x800>;
-				interrupts = <GIC_SPI 218 IRQ_TYPE_EDGE_RISING>;
+				interrupts = <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 				clocks = <&clkc CLKID_SD_EMMC_C>,
 					<&clkc CLKID_SD_EMMC_C_CLK0>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 6d7272b2c..13fdaba21 100644
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
@@ -2336,7 +2336,7 @@ sd_emmc_a: mmc@ffe03000 {
 		sd_emmc_b: mmc@ffe05000 {
 			compatible = "amlogic,meson-axg-mmc";
 			reg = <0x0 0xffe05000 0x0 0x800>;
-			interrupts = <GIC_SPI 190 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 			clocks = <&clkc CLKID_SD_EMMC_B>,
 				 <&clkc CLKID_SD_EMMC_B_CLK0>,
@@ -2348,7 +2348,7 @@ sd_emmc_b: mmc@ffe05000 {
 		sd_emmc_c: mmc@ffe07000 {
 			compatible = "amlogic,meson-axg-mmc";
 			reg = <0x0 0xffe07000 0x0 0x800>;
-			interrupts = <GIC_SPI 191 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 			clocks = <&clkc CLKID_SD_EMMC_C>,
 				 <&clkc CLKID_SD_EMMC_C_CLK0>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index e3c12e0be..5eed15035 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -603,21 +603,21 @@ apb: apb@d0000000 {
 			sd_emmc_a: mmc@70000 {
 				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
 				reg = <0x0 0x70000 0x0 0x800>;
-				interrupts = <GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;
+				interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
 			sd_emmc_b: mmc@72000 {
 				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
 				reg = <0x0 0x72000 0x0 0x800>;
-				interrupts = <GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
+				interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 
 			sd_emmc_c: mmc@74000 {
 				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
 				reg = <0x0 0x74000 0x0 0x800>;
-				interrupts = <GIC_SPI 218 IRQ_TYPE_EDGE_RISING>;
+				interrupts = <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
 		};
-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
