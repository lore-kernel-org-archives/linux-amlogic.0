Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82C4C61DF4
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 09:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D+azpM2U2BFKdboeWaF4e7LFhgtE6pTJlyJC8ku0t6U=; b=zNH3nzNODFS4Q0
	2iMaLji5Zgnv88IjJIoQ859Z2/JSRB9jRxhuHletCWpi7SU/+pcx0mUrJUyqbjtESGApj2JNCNqTk
	T8KR6ijo2b07uuLcG/XH0C+Szlhd3bgBFKnq/4b+UA4sWPu2Py0W86K435IEyyqRTEaeTtFodmlt7
	FYHDVBmlaDZNWtX2GMeOm7XhrQkGkbPDA/mlEVu4VIayTmIdnDX8uu+vEmdnu6SPczUrSwo08h/e2
	9ywhQ+Iy3HPqSkSgU9JxPwjg2xPLnSD9pXlg2nE/hyYnaaZ4NavcqrVEfZmXyadb6khSd4aGYf6gl
	5wqfd25VI2zruzjDTagw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6SmK-006ia1-0E;
	Fri, 24 Nov 2023 09:47:16 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6SmH-006iXQ-2D
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Nov 2023 09:47:14 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5484ef5e3d2so2262715a12.3
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Nov 2023 01:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700819224; x=1701424024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m/gUZBIUzYMuHRAbSO088kKXpKpS1gNBs/8WDq2VIbQ=;
        b=m4DHzdMCKNfAuWnJZv5RtbRQxmuoR5HxmOnkCDusyNYpCgdG+MhcqmeY+RFttJxJ7q
         PShFaHAZIW/JDNMQXEXoIVshqmAb+7xbzazO+ByVCQisQd12TUxxFoAtRq4SYM/kFSB8
         aygizdRDXNj+FiYNa14E38dx3APEyA+kjsQkz+7mGePX05xKgLKMXYBxaBxlQYDDiBdE
         WdlocDJ0zcTgw5bURD+U0QsnkIHLjKEDSNsHFOFdziJ0va6YBI4t0kdbU9x3gIWuH+8V
         AYpbjuF1LoVYuJF23fHEB4FwtiW1pCitHUFHPTr5Qu4RxTCIChgTjRE/lPX7x8Mtum+H
         bvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700819224; x=1701424024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/gUZBIUzYMuHRAbSO088kKXpKpS1gNBs/8WDq2VIbQ=;
        b=Vn/i2cvSREBc7HlB9MNSmKcuW4tR8+gnxV7GLvvHdhHpBMdpzL3zj0VVv13Upunlrp
         1CoIJeBQRNkf4WTbRClDOwugHR6Ik0h2zmul7xQStPi5mtsl25TSSwnGPwiM53A4NTt+
         CkAK10Tgs1e9H304EAYDLrYNyhbfAouyyQgPDnZRxdm24MUY/J5y0qP+qp1/+UwXBydA
         RNoJogbbShpOZ/sLSMxTl/9K0PdaU1vl1e7Gnmz/jsRv/aKTIfuBGOvwSYXkteOQ59FW
         jvIk5gK9OHlrLgyK10KI7TXzGmi/gXio43gG9BZvzEIkfmNSV4intEzd5UjKMrIddV/E
         SHNg==
X-Gm-Message-State: AOJu0YzPD4q6/vXgHUN2YAbx58YsSTRwZqRVvubD77mMgaWSy/jpT4Wr
	YqhYgYrTSbWKEKa9gXmzCRbGcA==
X-Google-Smtp-Source: AGHT+IFMvp2KSIa0Xp2qSzbbXG24Z2Ciz59q7uri8yqqjGSTT4CLqK9Dzs88aSY4DgaBLqnb9qMAKw==
X-Received: by 2002:a17:906:7387:b0:9ff:6ae6:9fea with SMTP id f7-20020a170906738700b009ff6ae69feamr1467114ejl.55.1700819224271;
        Fri, 24 Nov 2023 01:47:04 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id n7-20020a170906378700b009b2cc87b8c3sm1852685ejc.52.2023.11.24.01.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 01:47:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: amlogic: minor whitespace cleanup around '='
Date: Fri, 24 Nov 2023 10:47:00 +0100
Message-Id: <20231124094700.58071-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_014713_722225_5921E1C8 
X-CRM114-Status: UNSURE (   9.44  )
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
