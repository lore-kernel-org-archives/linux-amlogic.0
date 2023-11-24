Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC7FC61D97
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 09:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D+azpM2U2BFKdboeWaF4e7LFhgtE6pTJlyJC8ku0t6U=; b=iZa29XEUUCbuof
	1k+3I0+EbauUhOupOB5H/0TRsi+T+S37GBMbD2dw3iGFuUnsqP5dx1q5ScZjEnpwmqX49q9yXxK59
	D57OCS7uFl+7xJGjPLCuH81aVwqxZ2y09+m9VlUlaw8LSuMH6vD3vEP3c2udpTM/USW/26cxFSA5l
	4d4P7/nMLP42y5Bob82fh118G38st5qy47WgKTs4VZPDWn1CqqkKKB4hsJhpZLAOKtow/k5+OETSq
	U2Fo1WdPhovre6HHd0wKqsshuvoqGAPmO9YD3/ypD5wft4Ber0Aad1+BYk2joyhjsIyf3bgfHmCsh
	iX3vvHT6d1wTWjDnqbyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Smx-006im9-2A;
	Fri, 24 Nov 2023 09:47:55 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Smq-006iii-22
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Nov 2023 09:47:50 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a03a9009572so230701066b.3
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Nov 2023 01:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700819266; x=1701424066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/gUZBIUzYMuHRAbSO088kKXpKpS1gNBs/8WDq2VIbQ=;
        b=TEyS48ioZiMe9sTvYEh/KNaqYha3yrssVZ4GQuA5yQjkjEyeVpVPoAG5IsCRZnZNF0
         9sIpER58RKszm8HjkufV+JKkgdrRS6ysiJw9kxo440SdLGrAUf0FGHzQYrsw2Cv8ApSA
         CltaeCoPwnMzf1AfNPB9C8Fyar2Cjfi2SGjei4jInld5t/6BoTdToFScjXa0HuqJuMfF
         LzZB7m6C5hUT8F/tMtmyASOkGO5JZkwfI5JM8ArZecDqwtHX2pfJqJlI2PVsHN6sizST
         Plt7s4335q4rf+2lkfUFHtIuGgzDE/fc4f1yjL4UlehAIf0E2bdQpYmRHF2tG0ws7itM
         LHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700819266; x=1701424066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/gUZBIUzYMuHRAbSO088kKXpKpS1gNBs/8WDq2VIbQ=;
        b=OakhshJyqEVok9xxtaF1sCbIUSWp0HdGPDlih2GYYKhA01cMW0u237FSnOLWfBLpdK
         cczdoO5dU+tt6dzKVBHLiNTZ4xpZ6PxcJsWyg3+3gcKx3I2Mr4xHt26S14O7beRkebTi
         UsA29qWGVIRsvxfyJWRckCEw0FW4WKQrjVMV7TcN+gPpjaryLczjki4SPrCKdnVyqn7S
         xQXfFEgVBp8sWi8/jXPdcI0VNHB07Ek99TppokCfj/Tb2nilXvrfiBlMtoJSeIVYKIBU
         +UGVONnYSg5eflfDuGkmUUNuVkNZsbaLyAndo+l1cWkIXsMDtC3/98R71ld8Ovs07oyU
         XQhA==
X-Gm-Message-State: AOJu0YzwpAYpdJU6fDEllwFnfRpIVkwfAcTK4NBr5yvh2bCB5nUORG37
	EyIEM+yfQyC8FW7srAKaVM/izw==
X-Google-Smtp-Source: AGHT+IG8TcnMyfJZNuXyuR9DrsnnT7JMQWpOjEwPjC+zJ451rtsxnJuzVStJa2Z7v/P3VcHAfrivDA==
X-Received: by 2002:a17:907:c708:b0:9b2:d78c:afe9 with SMTP id ty8-20020a170907c70800b009b2d78cafe9mr2173777ejc.49.1700819266421;
        Fri, 24 Nov 2023 01:47:46 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id gr19-20020a170906e2d300b009de11bcbbcasm1859767ejb.175.2023.11.24.01.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 01:47:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: amlogic: minor whitespace cleanup around '='
Date: Fri, 24 Nov 2023 10:47:39 +0100
Message-Id: <20231124094739.58163-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124094739.58163-1-krzysztof.kozlowski@linaro.org>
References: <20231124094739.58163-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_014748_669644_32EE2CD5 
X-CRM114-Status: UNSURE (   9.98  )
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

The DTS code coding style expects exactly one space before and after '='
sign.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dts    | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi        | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dts b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dts
index 0062667c4f65..c9e84db0831a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dts
@@ -30,7 +30,7 @@ &sd_emmc_b {
 &uart_B {
 	bluetooth {
 		compatible = "realtek,rtl8822cs-bt";
-		enable-gpios  = <&gpio GPIOZ_7 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio GPIOZ_7 GPIO_ACTIVE_HIGH>;
 		host-wake-gpios = <&gpio GPIOZ_8 GPIO_ACTIVE_HIGH>;
 		device-wake-gpios = <&gpio GPIOZ_6 GPIO_ACTIVE_HIGH>;
 	};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
index 995ce10d5c81..08c33ec7e9f1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
@@ -369,7 +369,7 @@ &uart_A {
 
 	bluetooth {
 		compatible = "realtek,rtl8822cs-bt";
-		enable-gpios  = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
 		host-wake-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_HIGH>;
 		device-wake-gpios = <&gpio GPIOX_18 GPIO_ACTIVE_HIGH>;
 	};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
index 0a6a12808568..4b8db872bbf3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
@@ -487,7 +487,7 @@ &uart_A {
 
 	bluetooth {
 		compatible = "realtek,rtl8822cs-bt";
-		enable-gpios  = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		enable-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
 		host-wake-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_HIGH>;
 		device-wake-gpios = <&gpio GPIOX_18 GPIO_ACTIVE_HIGH>;
 	};
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
