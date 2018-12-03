Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEAEC04EBF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 13:19:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41976206B7
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 13:19:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oHNuB6+7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bDV9EMIh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41976206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z63s3F1F4K3PTaMykSXFFGWZCYGYxa30wOyRlYKE368=; b=oHNuB6+7XSvHMk
	SmOtOVCZYipVjDShuNidyItrT1ScmokhbbmwofVA+pEBToJXA0/tySRm/fHd2FarACluhh0wxa2hX
	Q77SuwMPn6nyGvrmprJ1HyGPkDEbtVAtHD7WObglC9ihVnwLIrdw8WCwkz51AeNYbCN979uU1Wjm/
	fpVYEo7hdA9IFoTFE8tayhPcXGtkifuJCkUPOGc2ad/0CKZQEt86SpfFRNgK715+h/wmEnrMOBNBi
	xhAIpgNLknEWxL9OW0iXjUal84A3dgvvYhdhoTp7+DyhSsOYl5AvWbBldE37kj0Zia2wWL5iqAEuq
	yP9z9WQ0U9KTxKMSGusg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTo83-0007Il-Be; Mon, 03 Dec 2018 13:19:15 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTo80-0007Go-6Q
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 13:19:14 +0000
Received: by mail-wr1-x441.google.com with SMTP id v6so12098549wrr.12
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Dec 2018 05:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BP9ybMzJZp1+OKkGo/Adw1pBqXhAS19qiDN4KiHG7uY=;
 b=bDV9EMIhwTPWiIRtD7dUQqdKFnl9QcTVf0X3166IDXdJ+ca0ouuvwcGLYPTUCGZsk0
 EL7m/IKnyeGqdCDeiRzAYiWVVXaFm5Yr01LzYgw5+2RSx9n21Z4Tb2Hjm0+M1qZNB9Jn
 B0xz3j+FnvTS+C4II39Ulupi1WS4O9cApQCr0x7d0ZVZyseq7cVyq6pjQt5BF71GCW5Z
 wq1TuEjpYc/oP3nyV2g5Bz30GQWs8tLRHZxLRqqof75MUM2SOgs4fzJBKCj8vpl7jSjI
 YQfWolzAEBF3C6BLDEDMq1pM9zwDaeKOEaW7SSfj2raZUTXMs/s6mnZvR2zBClZEPJCS
 bxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BP9ybMzJZp1+OKkGo/Adw1pBqXhAS19qiDN4KiHG7uY=;
 b=eQMDr+Y7CHwUf0DjBelV2+VkW73g8ZbvjdD6HKH45uty+L+zqeWc9AP823lNY8boHk
 fHA3gNv/S7dGN9GL1z7tJ+AZcGIv1uLOLZjLXNwUgHdRIz1OwJ0aPjG2FDlhX6gVtaIy
 xzqVHbqDwe4XQkm+hYkRaTIunh9vqIEGTiufVFIPdeTTL/jFZTzDdF11lMgOIgFu8nO8
 KDyO/sJ7TstyiGZOxuhMmVdiGN5SJq8zx5q2nOcnJFuHLkpNSSjkcJB98J8Uj8iM30ST
 6aZBAGlATT2BDXmmGqQYfBpmaCdHq6YtPj7FnE/lAbf15v1jWRXSxzM3GTxISG0OjSkA
 Scjw==
X-Gm-Message-State: AA+aEWZFB0hdLCEiyuobakFaUMvmP9f/+MZH5rBfDpJ6YnVaPcZetp1m
 eJ8zL6OB+oNxWHQJhNqwvAOUkA==
X-Google-Smtp-Source: AFSGD/WeH7ptAAM3QeI82H+rjBO7yO+CYSkJwf7oQl1c2R+CMRQqTwfJwy72G4Pb9K42O0qHfE0OcA==
X-Received: by 2002:a05:6000:12c4:: with SMTP id
 l4mr13518622wrx.134.1543843144632; 
 Mon, 03 Dec 2018 05:19:04 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id n19sm6371063wmh.26.2018.12.03.05.19.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Dec 2018 05:19:04 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 3/3] arm64: dts: meson: add clock controller clock inputs
Date: Mon,  3 Dec 2018 14:18:50 +0100
Message-Id: <20181203131850.31388-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181203131850.31388-1-jbrunet@baylibre.com>
References: <20181203131850.31388-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_051912_246536_13A5D22C 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the clock inputs of the clock controllers

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi  | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 5f512c91471e..5f3ac275f1ab 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1089,6 +1089,8 @@
 				clkc: clock-controller {
 					compatible = "amlogic,axg-clkc";
 					#clock-cells = <1>;
+					clocks = <&xtal>;
+					clock-names = "xtal";
 				};
 			};
 		};
@@ -1334,6 +1336,8 @@
 					compatible = "amlogic,meson-axg-aoclkc";
 					#clock-cells = <1>;
 					#reset-cells = <1>;
+					clocks = <&xtal>, <&clkc CLKID_CLK81>;
+					clock-names = "xtal", "mpeg-clk";
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 6796d250985a..a7b883ced0a8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -299,6 +299,8 @@
 
 &clkc_AO {
 	compatible = "amlogic,meson-gxbb-aoclkc", "amlogic,meson-gx-aoclkc";
+	clocks = <&xtal>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "mpeg-clk";
 };
 
 &efuse {
@@ -334,6 +336,8 @@
 	clkc: clock-controller {
 		compatible = "amlogic,gxbb-clkc";
 		#clock-cells = <1>;
+		clocks = <&xtal>;
+		clock-names = "xtal";
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index ed278097825b..d5c3d78aafeb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -260,6 +260,8 @@
 
 &clkc_AO {
 	compatible = "amlogic,meson-gxl-aoclkc", "amlogic,meson-gx-aoclkc";
+	clocks = <&xtal>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "mpeg-clk";
 };
 
 &gpio_intc {
@@ -284,6 +286,8 @@
 	clkc: clock-controller {
 		compatible = "amlogic,gxl-clkc";
 		#clock-cells = <1>;
+		clocks = <&xtal>;
+		clock-names = "xtal";
 	};
 };
 
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
