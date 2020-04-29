Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6B8C83000
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 20:19:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDCBB2083B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 20:19:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N2d0wvRc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="t/5HRvvi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDCBB2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ldwSsTvAVhQJsphDRbtNi/svMbERJnLAWFhI9j0B84A=; b=N2d0wvRcEVdlac
	sJYne1T8yXV9bJQrgb3ljlJZ3247Q06y87U/bn9tDZOMGGrri7HbxQt82zIvElT2qfgWA9q8RCLjI
	DfoosR+Uys1M7IbAZLiZROr+qp8TOhMeWYsPxY0nZmqQsH54R2q1uVGUuxyUXYNWjlTiT5v8Qb0tl
	D68dCKj9Sp+5y9leRbirwcU2lZXHqgnqbEb/W2vvvxlomjObzz+1mvASFKqZQqG2ASG7DchQw6hDR
	5ywrUVo1ValeRKnWszjTOrX586oGZiZzVDzXWIWMPG1qCZcxtd37ADe3RdB377H1h1jFjAVw2xuYG
	l/pDYaliOTNmFeJ9U6lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTtB7-0000Xa-UI; Wed, 29 Apr 2020 20:19:33 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTt91-00074G-W6; Wed, 29 Apr 2020 20:17:27 +0000
Received: by mail-wr1-x444.google.com with SMTP id f13so4066451wrm.13;
 Wed, 29 Apr 2020 13:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3VI9HOBgp8G2icbON78rq/SrCIcAl7ixV1OYcVb1+4o=;
 b=t/5HRvviYO4kjJxm01NMptBZjmYlb0VIQ0kDJH0hiQmwRaXgTMo3p2fVl1tLcBwfr+
 zbAW6+qwUqwwc1PutI6qJcHDDj8G2ZUT1T+VIXf05MnH6xPD5AptU0KMcVHmBVvGcqnP
 qoqD4KUdH5rYmhsJQT01Nkmffyc1vduDBr8DYNOIMzJaGmrojaOFWiQSSUO+fOSZ30WO
 Odhkaqj2w0AOeRndDoo7syz0RlT3TnTeTn8VT3E5TtQLAFtV3YCH3sQfdFQj5F/pncb0
 +I9bAodlOX4pu/2PxMdmCol3QZa/4T8I1tLK7mbaA3DoQhZSiF2NWZyXVACaB8aKrlv2
 1qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3VI9HOBgp8G2icbON78rq/SrCIcAl7ixV1OYcVb1+4o=;
 b=c0VyiPtL6e1UGzyzG98iIigoBg6rH9U/UfDeEyYtNGWfma0NRu5IRj+2m7eFlM7na2
 zAg6YT8+V2gWvNcrC/ifDyEz/Nz4U5A927XeeTKIJGlihQMAfr+OWiYnJneXIjslKzsl
 6s3YDs4nLhIbs1zv8/LQqYbUtGb8zeZF8TeGVlnfiX1keSHR3vEh8MTxRK7SzMKsJ/Uf
 CXsW01M85Lvu8ueYsEueZNpmSZNChwwTL3b5rqdCxaB9wsAnCvr5LxvMNdhzKhY1XxzQ
 zTwTknJnpQlR+7SriyrVpdSEM7n0COLPPLGuiBLbgXSlXj4YcSio4YhbbUpT1ABTRKc6
 +rag==
X-Gm-Message-State: AGi0PubYUse/+zThBnDVeJW9HUMk7Pi0C1NosgiupXPD2ZaclcmuyYrb
 k9/tYb/7b/bWxyqOBjB/17g=
X-Google-Smtp-Source: APiQypJmysRza8OPeM91P68Zxs+u1pXUMsxPYIl1dIDymhDEUk16xHeb8vxHNwRTwGrxuxfRF/fM9w==
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr40163691wrx.113.1588191442597; 
 Wed, 29 Apr 2020 13:17:22 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id q143sm9923623wme.31.2020.04.29.13.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 13:17:22 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, andrew@lunn.ch, f.fainelli@gmail.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH DO NOT MERGE v2 09/11] arm64: dts: amlogic: Add the Ethernet
 "timing-adjustment" clock
Date: Wed, 29 Apr 2020 22:16:42 +0200
Message-Id: <20200429201644.1144546-10-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
References: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_131724_258761_3AAA79EA 
X-CRM114-Status: GOOD (  10.83  )
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
Cc: jianxin.pan@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the "timing-adjusment" clock now that we now that this is connected
to the PRG_ETHERNET registers. It is used internally to generate the
RGMII RX delay no the MAC side (if needed).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 6 ++++--
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++++--
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 5 +++--
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 5 +++--
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index aace3d32a3df..b021d802807a 100644
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
index 0882ea215b88..f800bfc68832 100644
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
index 0cb40326b0d3..f6efa1cdb72b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -310,8 +310,9 @@ &efuse {
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
index 259d86399390..9d173e3c8794 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -92,8 +92,9 @@ &efuse {
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
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
