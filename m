Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F848C4828D
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Feb 2024 17:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKu/S6glJq9fuA5E7dDek1lFKr8Vt/WMOcsRQP25Fns=; b=1zdMACQ7Xpq4VI
	H+SDu5rw64rliZDqD3L0FFPbO2dMvRqSaJkawG1B8yyTh4H6uEwAFe0w/bk2HDnyZjhGkwVQmLw7+
	azABCSMQ+OXWtU5N0xUNHxZDcapWDTlOw9eRGRHDrMfvKERJ5jpieSSTzHxhQuOD7py+oEnkie3ju
	+Vy+MlsCVztvYchA1Q9ac7s3MfAZBRtjlSg13DsOT2vKkusQqO/MGqUOaYOwnfKm1ms48Pl5lxVOG
	xz5Z0+bip7ipHtTyImm32RSUKChh6KG96MUuCFh4g1CBoLA6Lwi4gkjmDETGxl+Nn5qwIJvoPHLa0
	SSAeZB6X2TxF0u0TzYwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2e2-0000000473V-3tFw;
	Mon, 05 Feb 2024 17:20:34 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2e0-00000004726-21An;
	Mon, 05 Feb 2024 17:20:33 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d780a392fdso39745605ad.3;
        Mon, 05 Feb 2024 09:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707153632; x=1707758432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwtrPptp9yS7J0efJI/zQfvo+vFL61xsfjw+Jvw6kY4=;
        b=FFpZr+lCnvp00tUOta8qrvQgzPoUM/0/5gmztnRKULsmhDYnK1o2QbO1ZLjb/aCORS
         YpS7rjWSz5AGrfm8Zx6aD1LvZOgeD1Fhgx4i5nHr2NT77CZKY7FtPg/DNWHJ+cUW+MR9
         HtOjoBz11NPmgu91JJFTTLZBLFyCOt5nOQsjlWgCro46wUi9Ic+4uU9zNywVoQvoDXMr
         rOfle8hcKIb7RACICSAfjgfQ9oaLklggN5A4l3iNg70snas5icRSvyHbbOz5vOvk88jn
         dk0zI4ecQVHjbj4MCmgK43U4310IpZYHGseP5ilEncXS1xMTh1XjQqLe0phdizeCm/zh
         sv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707153632; x=1707758432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwtrPptp9yS7J0efJI/zQfvo+vFL61xsfjw+Jvw6kY4=;
        b=R9X40ZEXXKGPN3h6UdoCU7olnEnjZBx0qpAOAZxezrcgKN7OXz0SmiMANpILQxgHwN
         qJqXaeN5tiOejSkjx9pP3cypyhkiOD485bsY9qYyyz2TGv4e+osG9f6x7PWkQTvbGV1L
         rfuSccXJB2aIpLtRyBXar5+hTlkqy5F/AgYxtgLWEejqrVKyX1M86JQnhRdfRpFlXoK+
         xt40o2qwlYN8mfwBDNMaywDWfxX3Nhax1m1uZPNXgOtSIrTWzhmse5GDffMBPUI2TiUA
         +adEf0aJWgftZKq7TzR1bYHqNrBc9evtFWXrQxxrxNQ2aMYg2QU4nDdEmowboxMgAhsX
         PKTw==
X-Forwarded-Encrypted: i=1; AJvYcCXVon13EDCW0rz1MQuq8GkI4LU7EzeW229F6IszWzHben0MElSbnAL4SskTUe+OnQbDG9vqmDvYkwVL1pD7yUBt7560HlLt0dzMYD8HD+Pnm1jivy9q/Hy+WCaH7buaaEBd8091s8a7sKU/S54V42JHePYta+tJlQ==
X-Gm-Message-State: AOJu0YzBJs3KYvj1XwpQzu/ubnzRE8eX2xm8VkGnRmU/zR3/5K5j36Xf
	OaebntsTpMfkzHUr86VtKY6A1nvDXvqyAxMhqhRhVaBY8S/Wm/YZ
X-Google-Smtp-Source: AGHT+IGSxOnN3RiqnWu/RNkjg6hUPZonpI1lU2dV8B3WFCeNtN3DdM4CDdzW5pXlOyizLnKrDbV9LA==
X-Received: by 2002:a17:902:e812:b0:1d9:b5d8:854c with SMTP id u18-20020a170902e81200b001d9b5d8854cmr116767plg.58.1707153631888;
        Mon, 05 Feb 2024 09:20:31 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVpn8zV0pf4QEYWgO3F0/g8SDqndzS7Tn92SKwwurjdmJ6DOkMNAYT/pA85lGPDRGkgiDKVMtXgV3BBwBwemsP7hPa0AshDujpJaxWT50+flioxQMKHWVgBJav+PvxyUgNfWLb6Xmd+WrVIkkADK4yGu5fXTZ+v5iTlYhacFRFfDiqqG60iKyWuZm6Ekhh2DsABsQjygzc9mtmKCOVE9QAcxP1dc1pSEgGGq6TvXpbFMKEWGjKkkAwBpt719i4qDlCi+SysxySW+9vZMI7LylW1rDeSceWWnYTcnOn5Jcnkz0Fq61YoUuPiUc1aJ7yFy1h2MZ/thbUcfxNFx5c7FguQnKa6gWitZuwE0lNwgScmLyGPlm6awvYPo20HeZsazmCU+BBXmf6GglZkerDtuR6d5llp+/MFYkFLhQaOU4ofAc32vU/nlhj5KDqFjmumNNcr6UWJ
Received: from localhost.localdomain ([113.30.217.222])
        by smtp.gmail.com with ESMTPSA id iy15-20020a170903130f00b001d8f3c7fb96sm107518plb.166.2024.02.05.09.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 09:20:31 -0800 (PST)
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
Subject: [PATCHv1 3/5] arm64: dts: amlogic: Add cache information to the Amlogic G12A SoCS
Date: Mon,  5 Feb 2024 22:49:21 +0530
Message-ID: <20240205171930.968-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240205171930.968-1-linux.amoon@gmail.com>
References: <20240205171930.968-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_092032_547631_55DF3797 
X-CRM114-Status: GOOD (  10.30  )
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

As per the S905X2 datasheet add missing cache information to the Amlogic
G12A SoC.

- Each Cortex-A53 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 512KB Unified L2 cache.

To improve system performance.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
No public dataheet available, since S905X2 support Arm Cortex-A53 cpu
nence used the same cache size as S905 and S905X.
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 27 +++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 543e70669df5..6e1e3a3f5f18 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -17,6 +17,12 @@ cpu0: cpu@0 {
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
 			#cooling-cells = <2>;
 		};
@@ -26,6 +32,12 @@ cpu1: cpu@1 {
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
 			#cooling-cells = <2>;
 		};
@@ -35,6 +47,12 @@ cpu2: cpu@2 {
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
 			#cooling-cells = <2>;
 		};
@@ -44,6 +62,12 @@ cpu3: cpu@3 {
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
 			#cooling-cells = <2>;
 		};
@@ -52,6 +76,9 @@ l2: l2-cache0 {
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
