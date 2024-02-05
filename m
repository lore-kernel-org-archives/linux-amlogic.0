Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07474C48292
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Feb 2024 17:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XltetR/pWkAa040DnBR4H9y0OvhJ5Tkq8yUyec9rqEo=; b=uYPOO1LMF2xhRf
	YvJfHxCtnqCpmW6geuKVl7Dz9tyI+9TyVX9H/0nbzdy+yyUl7BbBJ0CVm+DeOSYYmocgat1DdxJOs
	2yA6lLPUFq5ovMBd+mgLziSzEoPgxVFZ0N0D1H6HE+X6qYTpAZTyecXFR5ZkrMvMZrv+VhzON/F9g
	phYVcdbf3vpbSvboi/7mpE4tbUXSAmhkR2rm1Z2BzPaEov4w8ZH4lXYrvYhoQhJRbzKEGqiihcF42
	WzcF59JAyt8Ls2SnbDkNZLferLYB0FoMI3G71MqC6cjwKdDCRm4zeiuhJYngI2ypWlzrclnU/J7Oc
	bULqMj5njnx8BL0A6SPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2du-000000046zA-1ndg;
	Mon, 05 Feb 2024 17:20:26 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2dq-000000046x5-2SOK;
	Mon, 05 Feb 2024 17:20:24 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d7354ba334so40937335ad.1;
        Mon, 05 Feb 2024 09:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707153621; x=1707758421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQKgDn03i1GuOds6l+szL2kWc+E6jwK9dMeqY6Pk45o=;
        b=duwnWM60MVujFgKKEs9LbfHU+e5HCyj2Em5h23OudmhH+8x4f/F9lJkqsSudGceAgF
         N9p9KK6BSKAex6lxpMSIZdBziL7Ytp41fl+gnW3W5DnQXZ92vJPVVpbItafwX+eDXt/z
         fxMfeM5EVxQSArrYBKjRS0Hk49CdmINqsqZAGEh/PWwxxmNnxouIN5NseqVjrK/z9UkM
         r2zVRAvTZsQUjTJD/zFC/hBTMCeIJGHmbiC09S6ESv4eLZ2neAv733SY0X6NbRTP2g0M
         OvBbwgjdzP0rg37ZTZx3LGArYqP7aKwl6Q7enFnZ19mrgXIYDmhGGBAZGuJQtfQI5ViB
         0Lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707153621; x=1707758421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQKgDn03i1GuOds6l+szL2kWc+E6jwK9dMeqY6Pk45o=;
        b=kYThGWkiZu+q29H35SCVr1UwSqw2fMRh14imy/JJ6jf+1788IpPf4vl838wgUDHFjS
         y5TMhkgm6U7MB+XpRz+kKfQFcfDPjHdxh9EKqkBpYT5wVO5yRt2mb3WMXlU47LurgawX
         cGC35mc5cWByEJEmyVs5armMYIHi6H3fyg5BEND+egJqLI6hTREG7YoJ+uzhQw4YqqaC
         tL29cQgrTpm+Vk6LjsSnVy7sTUyKQ3T2dzmoZLk5cJYt5W0ApXyydH1KHtFIXz93kJ5s
         STjH7afdSmCeAcE5hbU/tI65g7FHNJoQVxcI4Vpdzng8LDS7rqE/ViBjCmXpg08jTNwE
         lH8g==
X-Gm-Message-State: AOJu0Yy53kNbfimSe489/ResNAHchPuU9ZNUmEcDn6E1DsCtkg1BET4q
	cVo20TfTXma/G+l83IaVnoUHoKxWKE/b4CwM6rdxt9X2yOgEYpc1V7Ktrdid
X-Google-Smtp-Source: AGHT+IFqPTMGGZiQP3HR1CzvHwk7T9mUypcca+zTGAW/g1IqTd3017nW97CqgG7CXeTtQY9DilS0Qw==
X-Received: by 2002:a17:902:6b08:b0:1d9:c367:201b with SMTP id o8-20020a1709026b0800b001d9c367201bmr127932plk.29.1707153621183;
        Mon, 05 Feb 2024 09:20:21 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUFDNn7JCUbUV3ym9LXRogPi6B/69fTu5XgtGm6JfDORTFNSkvLThm4P3H00hXfqDGOngeghOPWvrt88Nclu682qJ+d7/MaTSyfYUtjHAUyynDy+tzzWPAVpGFWYNsFQfR/8D1WSFS6NeBRyeu6bxfWl1p+DI4zrxpj/B1ErQLccrRmEm+S3P06NnYEHk0yFrsVU/y2Ar/M7h3EDPYxffiKZukgfEQNRDLKb+3b2/5GLlwiFr49eTFbL71cohH+9hWi0jVBJAf4Re/mLDTnXxtXiQUC10r/O0XGH7ZoXg7HtlS3bQrn2A8T6dx6xKEu1yjHLFiK46vvLJVXT1ZZehieSXHkjKJyUs9DzVB04vS5Jz4+Z2tacBfzeAc/2nCVj6rMTvGTrJGPwcBEW2GsG3Zo/OAxMX/oQSurUHyitdfgYZF7ek7fWwl3tc36+Ydf6uTrDJKz
Received: from localhost.localdomain ([113.30.217.222])
        by smtp.gmail.com with ESMTPSA id iy15-20020a170903130f00b001d8f3c7fb96sm107518plb.166.2024.02.05.09.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 09:20:20 -0800 (PST)
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
Subject: [PATCHv1 1/5] arm64: dts: amlogic: Add cache information to the Amlogic GXBB and GXL SoC
Date: Mon,  5 Feb 2024 22:49:19 +0530
Message-ID: <20240205171930.968-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240205171930.968-1-linux.amoon@gmail.com>
References: <20240205171930.968-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_092022_646386_0AE14601 
X-CRM114-Status: GOOD (  10.06  )
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

As per S905 and S905X datasheet add missing cache information to
the Amlogic GXBB and GXL SoC.

- Each Cortex-A53 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 512KB Unified L2 cache.

To improve system performance.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Datasheet
[0] https://dn.odroid.com/S905/DataSheet/S905_Public_Datasheet_V1.1.4.pdf
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 2673f0dbafe7..e141ade5e49b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -95,6 +95,12 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 0>;
 			#cooling-cells = <2>;
@@ -105,6 +111,12 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 0>;
 			#cooling-cells = <2>;
@@ -115,6 +127,12 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 0>;
 			#cooling-cells = <2>;
@@ -125,6 +143,12 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 0>;
 			#cooling-cells = <2>;
@@ -134,6 +158,9 @@ l2: l2-cache0 {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
+			cache-size = <0x7d000>; /* L2. 512 KB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
 		};
 	};
 
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
