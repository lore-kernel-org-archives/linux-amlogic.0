Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4F4C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Apr 2022 14:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JwRTxMXknf3sJ0UWFLlK8MKomXotGvxak8WrlG9MnZY=; b=Hpkhb7de4UejOT
	WETsefkYZSPrTPU1CfOAbyNQyqTWAToHkSrLaep/rHtmrYppKT5YWzynm4JjTrG5xSyth1bH5HAai
	vg/gcS9CSMYILQqmiwx8HqAkXiUIInU27JPirf39qv0tOH7kbd6714sofoMBsZlOEsQ5bDJBsvgcY
	XPO6XjODeCVc6wYDw230VtAl1QN8Rdu6bgzyQRMCu0kwahU67z6iXyS5wNzHYqEFLbxLnNhDdsFnr
	bra5hYTFZU7UXLT3aTTsnTeTshD/yj96SbU1cYZN3UTyOFmRN/CzQszu12aTjsIAlptXexKPbnLyB
	N/+QTES3cTSsGVglhU8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncT1g-00CKrS-Oa; Thu, 07 Apr 2022 14:22:20 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncT1d-00CKoI-KW
 for linux-amlogic@lists.infradead.org; Thu, 07 Apr 2022 14:22:19 +0000
Received: by mail-ed1-x52a.google.com with SMTP id k2so6577508edj.9
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Apr 2022 07:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nNOy5THDWbheBkCwuNFKp5hbaSXwJtJCl29fvVzZIxc=;
 b=g6vVoxh2JZOKzW5085vICQpcMRu6c1mU73SCHqk9+9Ihw55ggMFIkkIxB1W6yzXdYH
 uxKKhq3YdX0P0rlX2KwA9UMQHM+cxuOcWJkS88yECE5Xmb9yfMHqU+p+XVtAp5W5SEd5
 07ta8Q6+NevAPHQl8VYJ64gxsYIJMyf+QNcS0UTZW4gZkNj05vapei596ImMyKCJxKmQ
 higwFvrrKh6SSvgW14eTzkmhXGfZx/OStZMyWk5J8yRkAgTk8FPVi0bkbFwmwUK0mgqf
 eWYnybcqbPPnco8lASptmeRk+UjpHmFEI/qPi+wsH7AmG1yskUIAc43ufMVTU9kYdoFk
 FYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nNOy5THDWbheBkCwuNFKp5hbaSXwJtJCl29fvVzZIxc=;
 b=kLqvEXA36NZ+G19RgWW9cFa1IeEfffCt4jATi4e0Ac1MXoE5ZOzkHQyoFDyDsgame7
 oW1zrSLsNXnodS3Xi0sJGN4kvfqrUZ/71ZjkJM0sCH39159lMmDLMlzNhOCebrgjQcmY
 iJkVB7p/o9ZfbQSN+hVmu3FBLZnVGTgmuLVZH+jKU5mt2m+CaUDiT6TdKL1ldkHAbsTA
 F0HtJC+SpTsqyGYdUQSssDHr8D5OnGY0Jpn7od1wTT9vusJC8Isy2m5nQMZw3QYAp4TK
 3seV/WxtlTkxeCGNFf1je6cyPoXp/RapeysZH9jp1SbMT/r6C+TrAR2bJubHDdx6nhIm
 GoAA==
X-Gm-Message-State: AOAM532NklcPq8bs6POpKDN4C41mwO79D+3AjUkbe4LNzcshy3E/wq63
 B5Y6OgC9V6+wz6znbpt2HPEJJg==
X-Google-Smtp-Source: ABdhPJyn/dx+S9rLQlirNuj/lAIVKwPvohwq1QEPSFZKwFdmUwg1ZjYhRHaPr8tYZQUKGXHZfZBvaA==
X-Received: by 2002:a05:6402:90c:b0:415:d340:4ae2 with SMTP id
 g12-20020a056402090c00b00415d3404ae2mr14449897edz.331.1649341335146; 
 Thu, 07 Apr 2022 07:22:15 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 l20-20020a1709062a9400b006ce71a88bf5sm7569808eje.183.2022.04.07.07.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 07:22:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: meson: align SPI NOR node name with dtschema
Date: Thu,  7 Apr 2022 16:21:59 +0200
Message-Id: <20220407142159.293836-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220407142159.293836-1-krzysztof.kozlowski@linaro.org>
References: <20220407142159.293836-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_072217_731202_27C24CB6 
X-CRM114-Status: GOOD (  10.52  )
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

The node names should be generic and SPI NOR dtschema expects "flash".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi          | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts    | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts           | 2 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi              | 2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts            | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
index 2d7032f41e4b..bcdf55f48a83 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
@@ -416,7 +416,7 @@ &spifc {
 	pinctrl-names = "default";
 	status = "okay";
 
-	gd25lq128: spi-flash@0 {
+	gd25lq128: flash@0 {
 		compatible = "jedec,spi-nor";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
index 2d769203f671..213a0705ebdc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
@@ -298,7 +298,7 @@ &spifc {
 	pinctrl-0 = <&nor_pins>;
 	pinctrl-names = "default";
 
-	w25q32: spi-flash@0 {
+	w25q32: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
index 93d8f8aff70d..874f91c348ec 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
@@ -284,7 +284,7 @@ &spifc {
 	pinctrl-0 = <&nor_pins>;
 	pinctrl-names = "default";
 
-	nor_4u1: spi-flash@0 {
+	nor_4u1: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 86bdc0baf032..f43c45daf7eb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -374,7 +374,7 @@ &spifc {
 	pinctrl-0 = <&nor_pins>;
 	pinctrl-names = "default";
 
-	w25q32: spi-flash@0 {
+	w25q32: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "winbond,w25q16", "jedec,spi-nor";
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 3cf4ecb6d52e..c9705941e4ab 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -458,7 +458,7 @@ &spifc {
 	pinctrl-0 = <&nor_pins>;
 	pinctrl-names = "default";
 
-	w25q128: spi-flash@0 {
+	w25q128: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "winbond,w25q128fw", "jedec,spi-nor";
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index f3f953225bf5..e3486f60645a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -121,7 +121,7 @@ &spifc {
 	pinctrl-0 = <&nor_pins>;
 	pinctrl-names = "default";
 
-	spi-flash@0 {
+	flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
