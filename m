Return-Path: <SRS0=k9nf=62=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5041FC54E8B
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 09:39:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2106F2078A
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 09:39:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EdRLN94/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="y2B0A32P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2106F2078A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCs2HCEbxSubIpSPvtrjou2PFuLzpESPe2gfH+6fHIU=; b=EdRLN94/r7b3hR
	pOF8xKulo7HgQHBr5lTarN3MFqifoP3LH2IG9tkvPvnXpz4ZSp8ENfRTz0hKXwZw6tlDR9K/KTBVv
	WBIgiqh+8X1Ax2hh/yh5N+kPmSi1gCmAC325ktDKGkK4pqYA4iECrnchKWVFfOEABeiuiA5bY70A7
	Dk93LHrd+3hkacvHnbzQ1K7BgEDtx+9K/4Uq7lzH5tk9Xr6uddt5X+JCGAPdOd7Lz6HCwfVGUW7J3
	k4EVCjzHw8vn/r1YNdMB9KURk3yYvVGUxYgyEFn3a8aDhnedyXI/jDNck0BcjFRUPCkXM0F57hDr6
	P1qAnmrkMrTgiLGV5wbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYRNy-0000qZ-UZ; Tue, 12 May 2020 09:39:38 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYRNk-0000eM-UI
 for linux-amlogic@lists.infradead.org; Tue, 12 May 2020 09:39:27 +0000
Received: by mail-wr1-x443.google.com with SMTP id y3so14507433wrt.1
 for <linux-amlogic@lists.infradead.org>; Tue, 12 May 2020 02:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rLSzS4IRRTC22sAo/0YCE5/fM6LeScWipcURZcTuUlk=;
 b=y2B0A32PUd58AQ/WKXzX5pDORK4KvHRz/yZKB1FLLnYF9nhSva0hElj+TsiNjT1/ad
 rRgQu2MmCufUtCt5ve4SnEmVg6CfKQ3CgB5Hd5hTjkjXxX+GAoF73IQw3+ZxSfelF4hd
 ccjl4Yx1ifiMwE6fQ9rJgZDzVObLxaRmYDm5EgcPk1GtIgKEFQ1NOA0wDFWYqgoiUM2w
 F2LlkR9n7JihUEFu55Biu16I/OFvF64tB4gqNxBWbjn6J5MJW/OGEAJrZN3chha8BcNE
 hc78aZ+F4/knVF5E4LWMuPhoPpV5kUBbPfuPorXquIF9+CS8S89lJvEZCXgFd7slT9V6
 N61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rLSzS4IRRTC22sAo/0YCE5/fM6LeScWipcURZcTuUlk=;
 b=RnTigGvMq3nXPeo3P0qHVG9FEcSNRBZlyBMQh90PcPyRs8B6zpiQa6UptzmDrej/Nx
 Sleai0/zVW487JJmc9UhUBVGGCixl6WDwbmHrbZRtGEPEN4CYN1/xfoq8sDiTqq0PFPk
 EEFO2lFw3Av7hy8xU1ISDMabXgurZjehlZn21viUdN3CwnkpNZN4Ee66ku68cT4AXbZd
 E45rnaGt213e82W7q2i1N87OrD83f680mIWxFsakwYEIDwa2Ea1flA7YFq4C8zqW5xnu
 ZcokS1fH2XFsHRyWx3ReJ8ZOjHogc7uVtzaUZjtEeREcAuHpRK/Q4Ru+OMPaM1e6rKkJ
 8FPw==
X-Gm-Message-State: AGi0PuY09IgBfbR88TmV1NA0OKArQNKxtH03SwPe7ew2VfP+JZdL8pem
 UlUzsa+vI7Rv1tkNR/hWr8ik8/81pI9nJw==
X-Google-Smtp-Source: APiQypKKQHEGoCykK41hPOsxclt/B7topaIHxJVk5eWKIkntIUzG/53aJNNsA05ov3iD0HzY1V8+2g==
X-Received: by 2002:a5d:6ca7:: with SMTP id a7mr23970573wra.391.1589276363221; 
 Tue, 12 May 2020 02:39:23 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:4460:3fd3:382:4a71])
 by smtp.gmail.com with ESMTPSA id
 81sm14037092wme.16.2020.05.12.02.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 02:39:22 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 1/2] arm64: dts: meson-g12b: move G12B thermal nodes to
 meson-g12b.dtsi
Date: Tue, 12 May 2020 11:39:15 +0200
Message-Id: <20200512093916.19676-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200512093916.19676-1-narmstrong@baylibre.com>
References: <20200512093916.19676-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_023924_972360_E58491AC 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The G12B thermal nodes should be in the meson-g12b.dtsi file.

Fixes: 195f140318a9 ("arm64: dts: meson: g12b: add cooling properties")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi  | 23 ---------------------
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 22 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
index 783e5a397f86..e932205badea 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
@@ -355,29 +355,6 @@
 	};
 };
 
-&cpu_thermal {
-	cooling-maps {
-		map0 {
-			trip = <&cpu_passive>;
-			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu102 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu103 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-		};
-		map1 {
-			trip = <&cpu_hot>;
-			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu102 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-					 <&cpu103 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-		};
-	};
-};
-
 &ethmac {
 	power-domains = <&pwrc PWRC_G12A_ETH_ID>;
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index 6dbc3968045b..9b8548e5f6e5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -113,3 +113,25 @@
 	compatible = "amlogic,g12b-clkc";
 };
 
+&cpu_thermal {
+	cooling-maps {
+		map0 {
+			trip = <&cpu_passive>;
+			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu102 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu103 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+		map1 {
+			trip = <&cpu_hot>;
+			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu102 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					 <&cpu103 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
