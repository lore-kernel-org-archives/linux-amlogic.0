Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDE1C10F0E
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:28:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C5DF2183F
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:28:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eXVXydpN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aXSmLsC9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C5DF2183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4q15Lf6KJ3QTjUzNQAi6z72XW3PL4GXSU6+0YEVDOY=; b=eXVXydpNSw9LsX
	vRGZnMiXfpDR3qIHImwNjSAJkTij4johI8Sjh0ZEDNTwTOheiEMsEv/xk5oY7PlO8kUAa6EffAR8g
	ZTwuYX+Oh8Jd6PvHvIlVGhdXeCFOm5npJeUHNtHjEERwx8IAn/+9FLRVc5Y7wxXKN6TMxV5XJmKtQ
	7ap1IefUEG5aw9Nx5pgjGhFhVckOv3UxaZpggDLihxI4Dke/AqH4Bx8kLc7JWkaa/ygR5IQc6gL8a
	lP1VqBHLml00Ru7IrPgMM15dljUC8BrUJH3ofYpdbKbCYWLxI1X6mwHvP4j7MasTLpsyy/8LUP2+O
	B7T2z60FI6JAKx3RPe0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH69J-0001Qk-Aa; Thu, 18 Apr 2019 12:28:17 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH68Y-0000R2-Rm
 for linux-amlogic@lists.infradead.org; Thu, 18 Apr 2019 12:27:33 +0000
Received: by mail-wm1-x342.google.com with SMTP id c1so2546193wml.4
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2019 05:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/BGCe1eki0ypePWlklAvZFtE9hfEanLs5FHl2Y8rFBU=;
 b=aXSmLsC9kwcBB0jbrDsNrpTHQHqehGDEJBuAqz7aNLJhpICMqiZUCg0Nt9l5vi5Mpf
 UkOP8xOuPgh1FhldHPrHhbkeLERD4m/+oFcC5SAE3p28skoT1FBqpoxNKROFxU2Nndhd
 4roy1g/skQe9pAyyRTMdwDIo519tt0KCuxZD/byjEMgWvEZLLrUNw/BI9fWJWVpcpOAB
 NyvsIcox0mXqN83J99/X5ilweXV/vfNCeSdM4/Vpsj2wUuO8NW6YWFbe34E01KMq+T0p
 yZ+gF85BBy2d4I1i9wH0VLjIdngbZmPIrnHVK6ic/ZIVCZL/c8Lt/SLi83CMkk7X/zos
 QkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/BGCe1eki0ypePWlklAvZFtE9hfEanLs5FHl2Y8rFBU=;
 b=QQ85IjPdreJJ0IDfo9St+RxfqJWSUhenT/qc5cT3TtVe3ETkzs5uaGg8fsXHrgBgTV
 1gDHU4jiWXXc0HipIIJKttnS4QnE4w69Q3+aFjVH+Z29uOIr6FF2MP3RP6MjjneiMDT+
 fbf0gF6FCsbbthAjbdd4LNKzd7JrRFQmSJt5QLDhDIdj/uUXmVlSzAPqdrCfrHBC7ti9
 VeYbJ0rghOLqcvEFl3R1BTxQ16RYhPa4qgeWglXN0EoIL16hrgpDq3kzzlFHZGTBzvXx
 2YyW/gtn7SZqHEXMw3Ifa1rWaB8ZgBVUTd+kTRAkJfI1z42+paJ72EBd8Xr9qOgtHCxZ
 tviA==
X-Gm-Message-State: APjAAAWvlULSV35GgYcuszO/I4drr5vVrLXEft2ZnfHnMjSrC7zVA52t
 sp8vcw0N7hsPDBpi+0wfQXiBy2EqDFg=
X-Google-Smtp-Source: APXvYqyZFTYpcxXqgbPZlYOUI+ezl0irlZHBWbC3ZvtKC5Wl/crhT61zDLrxrpgqqcIOmGTNQKidcw==
X-Received: by 2002:a1c:dc09:: with SMTP id t9mr2963246wmg.142.1555590449560; 
 Thu, 18 Apr 2019 05:27:29 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z14sm1510110wro.81.2019.04.18.05.27.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Apr 2019 05:27:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 5/6] arm64: dts: meson: vim2: add missing clk-gate pinctrl
Date: Thu, 18 Apr 2019 14:27:13 +0200
Message-Id: <20190418122714.30805-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190418122714.30805-1-jbrunet@baylibre.com>
References: <20190418122714.30805-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_052731_159046_E559462E 
X-CRM114-Status: GOOD (  10.75  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

For some reason the vim2 is missing the clk-gate pinctrl setting all
the other board have. Just add this missing bit

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 27beb813015b..766194ab0aa8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -324,7 +324,8 @@
 &sd_emmc_a {
 	status = "okay";
 	pinctrl-0 = <&sdio_pins>;
-	pinctrl-names = "default";
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
 	#address-cells = <1>;
 	#size-cells = <0>;
 
@@ -349,7 +350,8 @@
 &sd_emmc_b {
 	status = "okay";
 	pinctrl-0 = <&sdcard_pins>;
-	pinctrl-names = "default";
+	pinctrl-1 = <&sdcard_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
 
 	bus-width = <4>;
 	cap-sd-highspeed;
@@ -366,7 +368,8 @@
 &sd_emmc_c {
 	status = "okay";
 	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
-	pinctrl-names = "default";
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
 
 	bus-width = <8>;
 	cap-sd-highspeed;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
