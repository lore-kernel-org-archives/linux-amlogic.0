Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62796C04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 17:17:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A7A720848
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 17:17:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kBF0h8zo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lI657OQD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A7A720848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z63s3F1F4K3PTaMykSXFFGWZCYGYxa30wOyRlYKE368=; b=kBF0h8zoE8vHJi
	Mweu/mVdLWhlZaI9jw7dKCTj2H3gTOtaWLof2swO29CILgvMJNOcWppxC4VlDF5hAqj4qVrLooT19
	yZ2tscGnxrE4DoLpYcqoHqcRyaJ7HiLVJ6AG5z3BWD+dkJ/aukp6I127KPxlrivZT26q1gPLAHcQT
	e8w8I3bYxQgnVGa8W+AEYlrAEkggqeobiWuF8BI3IikoYKdtbCTCrOZaOajUawS5z3NczVl7r37yi
	T0WdPvMkBmitnYZZCjN5qvc5iEX0KLDnbzdeoax+0+raYt+dKjv8TtPCCzbRPYmyVNDSJk42a/t5g
	nE7hB9+/YuvNMt2RFBpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTrqN-00053H-To; Mon, 03 Dec 2018 17:17:15 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTrqJ-0004xD-NU
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 17:17:13 +0000
Received: by mail-wr1-x444.google.com with SMTP id z5so13018811wrt.11
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Dec 2018 09:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BP9ybMzJZp1+OKkGo/Adw1pBqXhAS19qiDN4KiHG7uY=;
 b=lI657OQDKrakfTgc4BLtHK9PXSKWLG9HAoPJGc0cDt2oW9/Y8CUqMtRwOPFksOr4jP
 a/nVLBdWv7VH19TkLByDN4ao7knJZsHj+0l/6auPWplaNTM9QQDGTzKuYsVSW8nLMSoc
 ut77wMz4zVP0UTGbg/vIrMf6ev5WbNuGPgmvpft9GrG5qaJ5QbvJYgQLwixDwwjJWlkX
 GETVYMlBMhPnIUnwb84bh0xXLtsd0oll1WfHTaKrK9ANsEa0KXWoXbABNczgo/vOInMI
 VfC2NM1IxlSQUxBae63354TCciURbNHBFcu1TZ9gTvDoCCq/3Mm4tuL+UC4pwUgiMPzj
 vxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BP9ybMzJZp1+OKkGo/Adw1pBqXhAS19qiDN4KiHG7uY=;
 b=uG/1Il4c45bwDsnCuzfGYdJg9GBYZwSXr1Aac0kq8sb9z/VVu8jz/2tYNLrxWAR08V
 h/8aqSgJp2Bd1/uncjRhX9PSAhSOXNcvghn+3bnWkha/893H8wlMQYvl4Gt3MdWGAanH
 xPI5TtY/nx96hHZVfDnR3jNK5MIX3uEor6d6ESlBIURScY7OG7rVvU26fLHTfVIlSW5B
 9uYzx5C8uJotpMgpsmV1eoRlFsxQd4XnWLmRkPRaPC+5Z8NtPyJxTtQuI49YQe6mOglj
 H7+yBQ9PaqWL//Fa2k2KGZRShRG8q+mnJS+8Sdfx+wr56pircwxmFhe1MFnd9RBAFEw2
 YK7g==
X-Gm-Message-State: AA+aEWa874ZHlWfOGJoSOcBoetuEKYI0vX/1rhvkX8/sBoTNIdu7rZ41
 4zEvFqumtdLeoI8WlFQkxhW4hA==
X-Google-Smtp-Source: AFSGD/WYpZtO5s+K3nIBr7Qc4rZxjoRyF939LAv6O1Vr0BW+sn9c95fmV2p0Do9WcdGMxC7ZLYS/qQ==
X-Received: by 2002:a5d:4a45:: with SMTP id v5mr14298280wrs.7.1543857420163;
 Mon, 03 Dec 2018 09:17:00 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 h203sm22494889wma.19.2018.12.03.09.16.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Dec 2018 09:16:59 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v3 3/3] arm64: dts: meson: add clock controller clock inputs
Date: Mon,  3 Dec 2018 18:16:40 +0100
Message-Id: <20181203171640.12110-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181203171640.12110-1-jbrunet@baylibre.com>
References: <20181203171640.12110-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_091711_850316_D832FF61 
X-CRM114-Status: UNSURE (   9.81  )
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
