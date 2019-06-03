Return-Path: <SRS0=ej2R=UC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DFBC282CE
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 10:04:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE1AA28071
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 10:04:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kH2O2Jwq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mQjf4XGR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE1AA28071
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+0GuHXU7yaOMPLsApJPeBzNwFsEXofMXH7vqPtV3VA=; b=kH2O2JwqSfMdyf
	7lQMldki9ptyoHXIy/FLvCQFpdrsxlMa47StO5NvbB5YlqUDfWYgut0gLwZMVA4qJjizHelugrmYQ
	ExdwcrvXJTQ67ZJ/CywuA73HEtUcBqGaMEaeo+vV67/MCjqVIv3Q9VRAcIos84lCP0+iEQqJF4kFU
	Mo7sl4RV4puiK+R2UdqdxuYEX1OqMeTc95X1XxXscOUvhNL418wfzWpjrvGBgOlxm7Q3rFlZUkEMf
	/Be9/5rOE4QgKjttfaRDFiVMywXSlJeSHoQuASFg1OlaU0Exqqd7z8ScJFWrWAJkB0+ARNF3EcdSp
	KitV9s1mmPJkE6LRgsrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXjpW-0007Je-Hh; Mon, 03 Jun 2019 10:04:38 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXjow-0006Tz-Bg
 for linux-amlogic@lists.infradead.org; Mon, 03 Jun 2019 10:04:04 +0000
Received: by mail-wr1-x444.google.com with SMTP id b18so11321624wrq.12
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jun 2019 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4v96Sj0Qqu2ejZctq3FfqZCKiRWA7yMLpPyqtKhrPu8=;
 b=mQjf4XGRiMhjsw15YSdxSbc4D532wGUB1SC1JiM96Iuh4ExSD4X4vMaXYztqMT1xUc
 GF6Ez8SgjvVVD5eP6GKe87SrgMMDrTJdO5e7VKnX5hWXYkhlc3lDcX5AIlILYf8wtePK
 +m/w6M19ox54sQdzt6EZzaeMP/cf3NbfmpaZG4J3VWjt2DC61rKdAevIQkt2oVk61GO0
 kSWAeo/ulhesWM/Zea3Y7cxS4r/umA3QotghlhN8CTOCJc1Rr6S76lp9WahxPiDbfgDV
 OiEy/ZsnSjOMCbwzHzpaRJm2oT1flAJO5GVRcASt9aG2JmOHpgK36PdkZChnqsqGt94T
 +hqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4v96Sj0Qqu2ejZctq3FfqZCKiRWA7yMLpPyqtKhrPu8=;
 b=OQ7geEP1fUydXxVNbkGw8flLgBGJmzHN6r1hVM7Mcml5M7lBORx8wxqHN4f6yySMfv
 Tnxjzdktozu+bI/UruGiIho30Ag5tr8l3zsDdhsJlIW5g2xwqaIi6IziVczV6rsRTjAM
 5iRBrnk0lTh3nppHQqYEweYrPbGEybwK4YuQNXvGmAhhI0Qa3esM16xznbmFEdQ0P7ZM
 3vexpVc1nn3ewr6HtxobDMAaW3F12OTZWt1OR/u1iC3UJk+05cNfgW2i9mH4a64h1bA9
 DzrAom41QEYyDjrdGkx76YQwPpageGooPIyOuTC7AYBLkZOytfjwsoX8lRh1cetz3NIz
 vJag==
X-Gm-Message-State: APjAAAV7nyXBffgYsuLTkLsgbBBHi5MecIWwuCUhmxbwfjRxtzZEJmwj
 bhCIB2Rce+dSN3+pSxVs8u0/+g==
X-Google-Smtp-Source: APXvYqzlpNzQaH9IoXOQExNqojzpEeThG85jB71pNzHO58lbsxgDEDHdv44UZx74BlqdIfJdRiKwtw==
X-Received: by 2002:a5d:6b12:: with SMTP id v18mr15831689wrw.306.1559556240934; 
 Mon, 03 Jun 2019 03:04:00 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o3sm11282098wrv.94.2019.06.03.03.04.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 03 Jun 2019 03:04:00 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 2/4] arm64: dts: meson-g12a-x96-max: add support for sdcard
 and emmc
Date: Mon,  3 Jun 2019 12:03:55 +0200
Message-Id: <20190603100357.16799-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603100357.16799-1-narmstrong@baylibre.com>
References: <20190603100357.16799-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_030402_468338_C47C4834 
X-CRM114-Status: GOOD (  11.14  )
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
Cc: linux-amlogic@lists.infradead.org,
 Guillaume La Roque <glaroque@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Guillaume La Roque <glaroque@baylibre.com>

Add nodes to support SDCard and onboard eMMC on the X96 Max.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 5cdc263b03e6..69aae6c03dc5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -45,6 +45,11 @@
 		};
 	};
 
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
+	};
+
 	flash_1v8: regulator-flash_1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "FLASH_1V8";
@@ -172,3 +177,38 @@
 	status = "okay";
 	dr_mode = "host";
 };
+
+/* SD card */
+&sd_emmc_b {
+	status = "okay";
+	pinctrl-0 = <&sdcard_c_pins>;
+	pinctrl-1 = <&sdcard_clk_gate_c_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <100000000>;
+	disable-wp;
+
+	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddao_3v3>;
+};
+
+/* eMMC */
+&sd_emmc_c {
+	status = "okay";
+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	max-frequency = <100000000>;
+	non-removable;
+	disable-wp;
+
+	mmc-pwrseq = <&emmc_pwrseq>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&flash_1v8>;
+};
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
