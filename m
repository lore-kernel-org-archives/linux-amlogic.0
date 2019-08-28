Return-Path: <SRS0=aHUU=WY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDB3C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 20:28:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DFEA20856
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 20:28:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="so4OQv9Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwTmL3UF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DFEA20856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LyWEhCHoYDg0eaexHuYpUQ5riCCbVq9EEmDgUykJrBY=; b=so4OQv9Q9rdWH5
	y7mkXfTERx4ytARXvCOSYjjbNOZ3LGZducoPfyqk6b0gtKYk8AnvnRaIwQGBI1vRflQnWHwpuXwfw
	4IonrNjNB3ihs0KM2O1nAUIHubvj8/rgkK6lTA5AaAki3FBmc1g8Ecru205y1CieCzabttB/g2AKy
	HbEEwUq/DBbh9YrpS0qaNKDO2Oz6CnEQRs2RQc9j1ePYrlOCaVd8oPLtek7bxNm0DGGLkdirac4cw
	1AlhjabtPZayX7YjlpabwyxCR3X587YGoZSnRRKAVuBrFHFjEKQcug2jR1x4GBzGmBjnoj3BG5Oic
	2cpU8Td9y3O6YM5zgDeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i34Y4-0000vX-7m; Wed, 28 Aug 2019 20:28:08 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i34Xa-0000Nr-On; Wed, 28 Aug 2019 20:27:40 +0000
Received: by mail-pf1-x441.google.com with SMTP id c81so492931pfc.11;
 Wed, 28 Aug 2019 13:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j1pl7hKHvoRN9rKZ44OFvuHqn1oOaD+2L3N6f/r4iwo=;
 b=bwTmL3UFS/3ZHo2sB29Zs6EIFhpyS4XPne89/9dyM+rewUVwIhbpFFHv+5Hzj96cGU
 kqsxKPvxSE6UXpg1xk6PQ3oGOoq2tf97SMwCDgzEMhffbyQEAfBUcDLvB+N5SJrCbtPX
 J3kX560Q9sEC5574UjhBr5agzBW6kkKkBXh8BkthKW2pLVkPDmHeeuigzN5l+xqbdtr4
 qVaivr0uFagenYzoSOtDE/Oz+G8qfvWDZeB78DpPerJMwwfEoSxPhcUXM4tDle8qDB0F
 juQ9tLSoPMo+ifHQzm1HRVvogmThCRswBu43ADIwufvbK7dR42euG5SXvf8UVAJPs6X3
 BehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j1pl7hKHvoRN9rKZ44OFvuHqn1oOaD+2L3N6f/r4iwo=;
 b=sLeBqS2049slvkarXYg/+U5AwcPRjNRzWJXFcLCdCT+baJWd1XnGDd2O1PSn9V62uK
 j6JypYOfDIizdn/1UTUWNWKWo/XyxH0QbaUdPTlQGmskq0zV4mK3W8Dklvi3zXuu1/d5
 5DIEtAPLPGzCSE3IBbFqVwhEMvzO186+Mk/1Rkmc7fd4MzJ65lHB1PVxgOdMFg1Lx5xy
 PIizvDyToB6JpGnZ6ncaoOjM342qHPHuiVn8HAoGwrzgwqjHEH7YTA8v2PWbqxuKZsiq
 GrXMPxXMxmqbuA6U7BzoE2Qw1slQqKLT3uFRhNt4v6+3RLrAUuscnggh/RAW5UpHjgma
 6mbg==
X-Gm-Message-State: APjAAAXmJtHLveVsaGeTNJZXg4d3JHu9qBrrDGX1f483y/iL0eULc65Y
 Z6bfmHy7D8AF7pR50BgF77E=
X-Google-Smtp-Source: APXvYqzMIFDEdoAuL1ig04OF0ieGs/x4bz10vDEIipXOU7KSUPo5K4JME5xcSl3J2TTzgdk/CXa/9g==
X-Received: by 2002:a17:90a:17c4:: with SMTP id
 q62mr5951116pja.135.1567024058007; 
 Wed, 28 Aug 2019 13:27:38 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.111])
 by smtp.gmail.com with ESMTPSA id g2sm253373pfq.88.2019.08.28.13.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 13:27:37 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCHv1 1/3] arm64: dts: meson: odroid-c2: Add missing regulator
 linked to P5V0 regulator
Date: Wed, 28 Aug 2019 20:27:21 +0000
Message-Id: <20190828202723.1145-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190828202723.1145-1-linux.amoon@gmail.com>
References: <20190828202723.1145-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_132739_006744_5826CA87 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

As per shematics VDDIO_AO18, VDDIO_AO3V3/VDD3V3 DDR3_1V5/DDR_VDDC:
fixed regulator output which is supplied by P5V0.

Rename vcc3v3 regulator node to vddio_ao3v3 as per shematics.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 29 +++++++++++++++++--
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 792698a60a12..98e742bf44c1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -104,11 +104,34 @@
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vcc3v3: regulator-vcc3v3 {
+	vddio_ao1v8: regulator-vddio-ao1v8 {
 		compatible = "regulator-fixed";
-		regulator-name = "VCC3V3";
+		regulator-name = "VDDIO_AO1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		/* U17 RT9179GB */
+		vin-supply = <&p5v0>;
+	};
+
+	vddio_ao3v3: regulator-vddio-ao3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		/* U11 MP2161GJ-C499 */
+		vin-supply = <&p5v0>;
+	};
+
+	vddc_ddr: regulator-vddc-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "DDR_VDDC";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+		/* U15 MP2161GJ-C499 */
+		vin-supply = <&p5v0>;
 	};
 
 	emmc_pwrseq: emmc-pwrseq {
@@ -301,7 +324,7 @@
 	mmc-hs200-1_8v;
 
 	mmc-pwrseq = <&emmc_pwrseq>;
-	vmmc-supply = <&vcc3v3>;
+	vmmc-supply = <&vddio_ao3v3>;
 	vqmmc-supply = <&vcc1v8>;
 };
 
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
