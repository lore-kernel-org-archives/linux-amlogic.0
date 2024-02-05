Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91EAC4828D
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Feb 2024 17:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRPsKRU/NjYFQ2KSG/6YK/xptIRUZynxyZZmb+N+6Qc=; b=b6ZYpREO3knHkv
	HhPEfo3iS+/8cT7AGCXQ+vSsjB7eGtC7tWoWesglEw+MCmG7P9PwJHEhcRSTDrxLdertIiYy4QR87
	h76/vsQAu2RU3zA85flH9Pl05REXeXruq1ks+Zfv3dZ26epPl1ARENnCOLzXZ/zl6NJ07KpDtp/LX
	DXLXctvgQKj2w6kuHuutpm/D42wV1r1Lm9o6+3mqmpYgbLh44Iqkg2ULXN+r+FAV6aj7UV6YFvDYS
	BXr2qANF5RLGdZfQOShlBf8XSQPaWOG4uSkgMPaQZS/or2mp6iNctSM8xfi7FmVuI5FC8bOJ6vxbE
	jCRifLjuxtvprNIz/uVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2eB-0000000479a-0ShL;
	Mon, 05 Feb 2024 17:20:43 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2e5-0000000475s-47U9;
	Mon, 05 Feb 2024 17:20:40 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d958e0d73dso26992125ad.1;
        Mon, 05 Feb 2024 09:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707153637; x=1707758437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hS6dIuUOs6IlT69yW9IpIjBL1L09bQr38oFgBY2DWIM=;
        b=hMfPOCRfpeMP3dXXVBqjmqpTkU31hM86cwar//mD2wDmP5d5zKvyfkxivDTY2yVCBb
         Ct9aLbCDtQqKuTMSkuZiQSiDQEqJJQohyB2LH4FNyLKFtX0X+FbOMBGBVXm4S0I94s8m
         Vi5n5BUc4Y9ElJKj+m+ieZ1CKHpoUt+IAbV8zFKP1g0+btuNniQ0lfzQbPN0Qqe9vhf9
         wBasxjFtF8f+EtNYJqfRBVp8A2ZzGi6McvsMyOyVatQk3fE/KItZHJB1xvPKV4hy7A+P
         7WJXUiXLnF6cKBRbN67C1Le+KO9I1f1TwLOF+o+ogwKfxdwb0/MQqqAiyGT4ok0T0qcP
         0kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707153637; x=1707758437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hS6dIuUOs6IlT69yW9IpIjBL1L09bQr38oFgBY2DWIM=;
        b=ew0oA7csHQNH8wNkr0kOGOQClNic7eGhNaBlaGad0/UfvOrfLUcZqmVL6Yyc95oBtY
         zz5TWQd1i9ajkJy+JQg6Tcx+0V15XyGK4fsUSyo0UUtPFBP62zQGKIHHJVdVO3Nb/uSu
         PJf5EZJN1crs/fgQ7wKQpoZyhe0/MooSlrByc/Y10tdErckA0HYf88QsA4wxlybwFY8Y
         +HhutOxj2cUpAf//HLAYTU6nR/QPgf5XuGEA9TTiLLTQ6L7CA6OPUC6XklmcI/aNZqoD
         HC9OhdpHZU5kSh4Mj8RkO3DmxrHmwP9nrcU9e/yMLpBMpSh0YjfkyVIi0Tz9xv0NUHHB
         L3oA==
X-Gm-Message-State: AOJu0YxSRqGFTJMzaBNd1TyU8nyl0nuUnBBGWoQoWO2lC8TPZRO1CEpn
	nOQn52umxPTGuWm+OlwKB+xc/D/a93pNxhy/oTOgPBstzutRimGH5+tfUdq4
X-Google-Smtp-Source: AGHT+IEr9WVh5tHKvU1HS2CVHP43BD/DeXPf5QOiaZJtxwQUCZ6uXzC4m2BBtTurEjLkD42+OzPOUg==
X-Received: by 2002:a17:903:1c2:b0:1d9:4143:5fe1 with SMTP id e2-20020a17090301c200b001d941435fe1mr493718plh.0.1707153637320;
        Mon, 05 Feb 2024 09:20:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXHjBVTNLFu0eYUL+Q+ORdz2rkEuW7AN4pMU/cmyWkcXb4xYBO+XdsypuclxP93NF30wnEhXUaxlpy5FGlZPE5w0cyhpE8f7SxllsREgXg9jgBdWA8aEyFEBtblK86wDEDaIHkzEaWDu6gLO3WM2gOWfbSA5hvsR5CGP/ExrOOmHy7kx7C/Aa6FQr6Ys9GF44yeg92uDc6IvrYGfBN53Cq+XC4SNDPuHm703BAUpv8dm3IJhzDkrtJ+Ie4mmIjq6mnQPQNN7wTGgvTyEzNWPiTZd+5D/cEVWYS7S+N7aljoeMjIkA+m80v79/YYhvAG1YWAA/jkPEMRRqeXubTPiKKITN9e/ekjV16ttM4uQtj+jv3FO2f9fTveftjiobMorBmc8JfVZQWsIUD2U1JUgNybxUUuwZhfHokUgToJnRreFFuDUEfJ1siGzIORSY4MXISg9fph
Received: from localhost.localdomain ([113.30.217.222])
        by smtp.gmail.com with ESMTPSA id iy15-20020a170903130f00b001d8f3c7fb96sm107518plb.166.2024.02.05.09.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 09:20:36 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Anand Moon <linux.amoon@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCHv1 4/5] arm64: dts: amlogic: Add cache information to the Amlogic S922X SoC
Date: Mon,  5 Feb 2024 22:49:22 +0530
Message-ID: <20240205171930.968-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240205171930.968-1-linux.amoon@gmail.com>
References: <20240205171930.968-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_092038_089349_2B571A5F 
X-CRM114-Status: GOOD (  11.29  )
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

As per S922X datasheet add missing cache information to the Amlogic
S922X SoC.

- Each Cortex-A53 core has 32 KB of instruction cache and
	32 KB of L1 data cache available.
- Each Cortex-A73 core has 64 KB of L1 instruction cache and
	64 KB of L1 data cache available.
- The little (A53) cluster has 512 KB of unified L2 cache available.
- The big (A73) cluster has 1 MB of unified L2 cache available.

To improve system performance.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
[0] https://dn.odroid.com/S922X/ODROID-N2/Datasheet/S922X_Public_Datasheet_V0.2.pdf
[1] https://en.wikipedia.org/wiki/ARM_Cortex-A73
[2] https://en.wikipedia.org/wiki/ARM_Cortex-A53
---
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 62 ++++++++++++++++++---
 1 file changed, 55 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index 86e6ceb31d5e..624c6fd763ac 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -49,7 +49,13 @@ cpu0: cpu@0 {
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <592>;
-			next-level-cache = <&l2>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 			#cooling-cells = <2>;
 		};
 
@@ -59,7 +65,13 @@ cpu1: cpu@1 {
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <592>;
-			next-level-cache = <&l2>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 			#cooling-cells = <2>;
 		};
 
@@ -69,7 +81,13 @@ cpu100: cpu@100 {
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			next-level-cache = <&l2>;
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
 		};
 
@@ -79,7 +97,13 @@ cpu101: cpu@101 {
 			reg = <0x0 0x101>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			next-level-cache = <&l2>;
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
 		};
 
@@ -89,7 +113,13 @@ cpu102: cpu@102 {
 			reg = <0x0 0x102>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			next-level-cache = <&l2>;
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
 		};
 
@@ -99,14 +129,32 @@ cpu103: cpu@103 {
 			reg = <0x0 0x103>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			next-level-cache = <&l2>;
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
 		};
 
-		l2: l2-cache0 {
+		l2_cache_l: l2-cache-cluster0 {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
+			cache-size = <0x80000>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+		};
+
+		l2_cache_b: l2-cache-cluster1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x100000>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
 		};
 	};
 };
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
