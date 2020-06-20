Return-Path: <SRS0=BR63=AB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E87C433E0
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 16:24:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 757C323EB0
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 16:24:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nL/xA5h8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="UPbBsYsK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 757C323EB0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T3CXwzU9TZ3NAWxVXMF6TxUD6N+R4mVfLDC7+abCe/E=; b=nL/xA5h8gvQeMm
	6UMhMJQw5WgfsCwsp6zHEn/XVb3tZs48etbUCtRTHe6Wm9g7Ysay2Zykv+W0uhFjoWzjfAiogfArO
	jQM2SErMu45k0b/1qFFqdHPNCcLzWdA5LgZAlI+It4X36Kls3nTegM8mdn8q5thJgO9MCAWNxH3Rt
	BtqbHRJodzlDjB1LhpKaOvuGOweiV6W18HgLlYKjBI1lx4kJ7KxBmjh7aW6g+sDSTCT5kUY81rbJ/
	t0ewLV3zvRb+YwYyVm1MGnonafA5kAdymSWiGdndMeTR+fxnij4lGSp/6aFhqnjP0wfYaxSlu4OPs
	513sXRO/pXIFAixvgLaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmgHo-0007S8-UI; Sat, 20 Jun 2020 16:24:08 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmgHl-0007RY-Cq; Sat, 20 Jun 2020 16:24:06 +0000
Received: by mail-ed1-x544.google.com with SMTP id y6so10198136edi.3;
 Sat, 20 Jun 2020 09:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RBB5+d9DExrRxU/V6V7qCMTYL5+l1zibZSgTJX3TLv4=;
 b=UPbBsYsKM2Y0CgcJM/oLWhxOlV7NPTH2Up5Sx9q8Aee3aY1fgQV2IK7bueXo4i/aFO
 anHS/QRTijSw6Nx+agm4d5Nw7S7wAyUES5PwxKphM6U33a2ULHcQJaJaa7hRavjQUo9U
 y4/CYeDa8WJZx7x//OhJZdoT8BKF+TmzzRa/wy7ACojHKQZOj2YU72oWyOV5K6HO50i9
 rLuc8D2lk0bifWwSOAGeo+aa7ERyOwxepJ2bHRfJ4hwaqOgbAewYd6LrglnyfMYEuKST
 XI+k/HyqB44kYl0HsKsxgp1apDRJgLNUp83DAfRF1B+RB2puHoRn3uaWoQmQjFcwrrpI
 1NVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RBB5+d9DExrRxU/V6V7qCMTYL5+l1zibZSgTJX3TLv4=;
 b=dadMDOpz7flC9eSGd655BLnh7LZI8iKW/TEbwDDCwkGwWMQ7Sa67Utoshh9DI5CAPW
 V6AJkDQXwg+q1H4BmpDa71btZOpNkMbUVBu5k04e7dpzCmfrp6JevdEFFA0ELwfIrO81
 hJozjStX0XcgHFQt9RHg84Mj+5qUzLfDvvNNhZ58WiTWCXRnZK1l6PfxviTleYGQX9Iy
 vyBMV9VMvmbdK/mxrcmPzQgWFNaRzclF573Kt+Lvp/x/aNVseY1fDJAjsCmnVzfd5WrS
 eXXvrHmSXCEQHeZznivYfp43xsqE3mFnP31PDjOytvhJx9m7/QqLeMclmren8XKigDYp
 NYPg==
X-Gm-Message-State: AOAM5323weliy71URyCjTYMZ6YPdsO9fHxE+J0JMcfMuApwBGAbfJZ76
 1OZubIS+b5p2XHP3qU5e7Uc=
X-Google-Smtp-Source: ABdhPJwLrOeWiRJI8vetnweyhKH5HKvsM+j56XPeJtK7Kup+7ho72bkQIjiCLZGezx2eQjwhQ+xKzQ==
X-Received: by 2002:aa7:c148:: with SMTP id r8mr8929513edp.108.1592670243932; 
 Sat, 20 Jun 2020 09:24:03 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371df700428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371d:f700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id l24sm7515582ejb.5.2020.06.20.09.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 09:24:03 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: khilman@baylibre.com,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2] arm64: dts: amlogic: Add the Ethernet "timing-adjustment"
 clock
Date: Sat, 20 Jun 2020 18:23:47 +0200
Message-Id: <20200620162347.26159-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200620_092405_453308_70F3568A 
X-CRM114-Status: GOOD (  10.39  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, andrew@lunn.ch,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the "timing-adjustment" clock now that we know how it is connected
to the PRG_ETHERNET registers. It is used internally to generate the
RGMII RX delay on the MAC side (if needed).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v1 at [0]:
- fixed all typos in the commit message (hopefully...). Thanks to Andrew
  for spotting the first ("no" -> "on") one and shame on me for having
  to find two more ("adjusment" -> "adjustment", "now" -> "know")


[0] https://patchwork.kernel.org/patch/11616101/


 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 6 ++++--
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++++--
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 5 +++--
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 5 +++--
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 8e6281c685fa..b9efc8469265 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -181,8 +181,10 @@ ethmac: ethernet@ff3f0000 {
 			interrupt-names = "macirq";
 			clocks = <&clkc CLKID_ETH>,
 				 <&clkc CLKID_FCLK_DIV2>,
-				 <&clkc CLKID_MPLL2>;
-			clock-names = "stmmaceth", "clkin0", "clkin1";
+				 <&clkc CLKID_MPLL2>,
+				 <&clkc CLKID_FCLK_DIV2>;
+			clock-names = "stmmaceth", "clkin0", "clkin1",
+				      "timing-adjustment";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 593a006f4b7b..41805f2ed8fc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -185,8 +185,10 @@ ethmac: ethernet@ff3f0000 {
 			interrupt-names = "macirq";
 			clocks = <&clkc CLKID_ETH>,
 				 <&clkc CLKID_FCLK_DIV2>,
-				 <&clkc CLKID_MPLL2>;
-			clock-names = "stmmaceth", "clkin0", "clkin1";
+				 <&clkc CLKID_MPLL2>,
+				 <&clkc CLKID_FCLK_DIV2>;
+			clock-names = "stmmaceth", "clkin0", "clkin1",
+				      "timing-adjustment";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 234490d3ee68..03c25b9facff 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -333,8 +333,9 @@ &efuse {
 &ethmac {
 	clocks = <&clkc CLKID_ETH>,
 		 <&clkc CLKID_FCLK_DIV2>,
-		 <&clkc CLKID_MPLL2>;
-	clock-names = "stmmaceth", "clkin0", "clkin1";
+		 <&clkc CLKID_MPLL2>,
+		 <&clkc CLKID_FCLK_DIV2>;
+	clock-names = "stmmaceth", "clkin0", "clkin1", "timing-adjustment";
 };
 
 &gpio_intc {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index fc59c8534c0f..60484bbc7272 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -131,8 +131,9 @@ &efuse {
 &ethmac {
 	clocks = <&clkc CLKID_ETH>,
 		 <&clkc CLKID_FCLK_DIV2>,
-		 <&clkc CLKID_MPLL2>;
-	clock-names = "stmmaceth", "clkin0", "clkin1";
+		 <&clkc CLKID_MPLL2>,
+		 <&clkc CLKID_FCLK_DIV2>;
+	clock-names = "stmmaceth", "clkin0", "clkin1", "timing-adjustment";
 
 	mdio0: mdio {
 		#address-cells = <1>;
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
