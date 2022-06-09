Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBF6C43334
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jun 2022 11:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tHiBWfkWvDPVth8XoZeUOK1CbxrFDAm5BdK8blwRrk=; b=lXEe+xDmeljftV
	HVM9+DevTNjLaMyROWGbJA55SrE4Mqlw/DOBrSVUlMKL+lvgvlO3xocyddpD4k/Dr2zvzLn3dXr/c
	+cyn0bggWNmDFm9XQ9VrAgSNO2cYnz2okaN8uhjK2UeZ4g78n4c0C+PUs92UkOBCpZfye8oqUH1M1
	4gSEceV+HoIaFA9EZeRU7NnGqOk8PNsaz1/1IREAm1TTvTvafyzJbeQ6BBxX16fQeuN2UPL5F8hDH
	uF3cbl7DTP2Dhm54/MJ6MXsf+6LKYLJhPLgkdOH4swrJSVjq820X37i1PMAFOKXHIZTZ8KNAGUqPA
	xhS6tBe5Ib1FPH8NheJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGXi-001PrQ-L9; Thu, 09 Jun 2022 11:41:38 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGVi-001Oog-4d
	for linux-amlogic@lists.infradead.org; Thu, 09 Jun 2022 11:39:36 +0000
Received: by mail-ed1-x530.google.com with SMTP id n28so30815299edb.9
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Jun 2022 04:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=moyo8KWDYD1Sw7v39IoJtDJxVuleCUkjc8zzaL8h67s=;
        b=aY58Eyp/oD4ErEbOY4zHZiaIvRUCdLzGhe26XILJWGeJ5qA1isPZOhDq5/RqXtUQZf
         XBklI52EapnvH2OPYq9DNGaULO94GxSobSDDq7clP59LhTHITTlvxzMBoYMMs04H3p4C
         HiHcYqoiY6nBx91Zb/DGOhgCNr03qzvP5M0mgdJTQJaG3xSPwOT193YOXoHqmd2d0NLU
         4ZIHD0jukYdjF774IvCk3cwq6giHMxc7EHu+B2DPGoB4H+BoiH9GmflcLkSplsPLMgIY
         t1abRppSqVEzXBJJ6aVnT5Zvy8xf2ZqcMaZVfkM/ssdp8i3XHlvkA6eMbccro8MbW3w0
         vMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=moyo8KWDYD1Sw7v39IoJtDJxVuleCUkjc8zzaL8h67s=;
        b=fu4gutPoF4TOh6CacmcA6Inq2mulTOY9eQBMGGGgxZrY74chvCnwPnSLdbywGsOffK
         snoKNg4bmlRPV2KdA96LrjuVZMkj3nbCfy9a5GtRRkeGG5EpVVul5WnR4rZFv1XYYEc7
         3crIomlviTHFeufnM1FIWLQA8zw+8jwdDuBRgCvPKSlU/aYfyF7yLMHCi+HlpXfKd+dG
         NyG2dfUIv9V69rKgQMNV4DLhjcmaeGxUvL8DancwOx9RZ83Ta0YapOyDT56TXBQb4nDP
         XpQg3Fz4iMvA9+RLjAd8+zJX4BIOwNeZ/2s02F3Lns7IiA74DtG1ZXJdgSEkmTcp2Wnx
         YwrQ==
X-Gm-Message-State: AOAM530m6gqjt1AL5XeJ03MPaq5EX4Dt3FHCipgkPurAG8Lf8RfKgTx5
	Yob9W3ioSCkG3cAfhilzxoC01A==
X-Google-Smtp-Source: ABdhPJxNWpQCygCIS3enUIsR+XqOJyd9NdAUtnRSVKLoNE/vwqCX3MSchbBiqeaPMSb5jXkyLlQBhg==
X-Received: by 2002:a05:6402:5212:b0:42e:2fa:41a7 with SMTP id s18-20020a056402521200b0042e02fa41a7mr44238163edd.22.1654774770535;
        Thu, 09 Jun 2022 04:39:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u14-20020aa7d54e000000b0042e21f8c412sm11898495edr.42.2022.06.09.04.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:39:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 08/48] arm64: dts: amlogic: align gpio-key node names with dtschema
Date: Thu,  9 Jun 2022 13:39:10 +0200
Message-Id: <20220609113911.380368-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_043934_274614_88476793 
X-CRM114-Status: GOOD (  10.73  )
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

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index a5d79f2f7c19..603337ca5608 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -48,7 +48,7 @@ emmc_pwrseq: emmc-pwrseq {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		key1 {
+		key-1 {
 			label = "A";
 			linux,code = <BTN_0>;
 			gpios = <&gpio GPIOH_6 GPIO_ACTIVE_LOW>;
@@ -56,7 +56,7 @@ key1 {
 			interrupts = <34 IRQ_TYPE_EDGE_BOTH>;
 		};
 
-		key2 {
+		key-2 {
 			label = "B";
 			linux,code = <BTN_1>;
 			gpios = <&gpio GPIOH_7 GPIO_ACTIVE_LOW>;
@@ -64,7 +64,7 @@ key2 {
 			interrupts = <35 IRQ_TYPE_EDGE_BOTH>;
 		};
 
-		key3 {
+		key-3 {
 			label = "C";
 			linux,code = <BTN_2>;
 			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
@@ -72,7 +72,7 @@ key3 {
 			interrupts = <2 IRQ_TYPE_EDGE_BOTH>;
 		};
 
-		mic_mute {
+		key-mic-mute {
 			label = "MicMute";
 			linux,code = <SW_MUTE_DEVICE>;
 			linux,input-type = <EV_SW>;
@@ -81,7 +81,7 @@ mic_mute {
 			interrupts = <99 IRQ_TYPE_EDGE_BOTH>;
 		};
 
-		power_key {
+		key-power {
 			label = "PowerKey";
 			linux,code = <KEY_POWER>;
 			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_LOW>;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
