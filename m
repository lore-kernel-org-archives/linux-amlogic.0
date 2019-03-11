Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F7DC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 10:04:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79970206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 10:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qYerc0z0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xTNsRIDy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79970206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UkfpYiFYhHz70A5U2kMwnQvbFFQhCWCBefjiUz+AN2Q=; b=qYerc0z0+wA5Z2
	ZRs+mPoFyo61pgva2t3WXmduO9cz68mPdXE289H23UY7sWyxbefC/2b3gLARQxuMiqACe6eSKXWM3
	iNAxpfjiHahc5ikuHGJbsIfhSnenrkxmWsvAZShPLG5sWTfJr8pYRolRuvLBJfEztYxv0in56yFgU
	IX6l1Sxsdkgp+rCBuiIZ6Zgv6mYcRgaIO5YnkWJjWqKlOtQJZ0dBXxYDbdewbVxt8Xrqn1NO9hMq4
	ld2j2uGt8Fpxg60K7/ACTkPU0dnTiXSVz9poBCM8fD7+AujVQcVkWzk3f6UwS7n6otTrlwGrLClv8
	QXJzsWZ1FArfuKwVRErg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3Hml-0005QP-Ug; Mon, 11 Mar 2019 10:03:55 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3HfS-0000FN-BF
 for linux-amlogic@lists.infradead.org; Mon, 11 Mar 2019 09:56:25 +0000
Received: by mail-wm1-x344.google.com with SMTP id g20so3555797wmh.5
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Mar 2019 02:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1vd80S55Frb6CGjHBLvPF+QFGjEdspA5jjiX4inId9o=;
 b=xTNsRIDydRcgWEh+tsTla52WubKGreooa9VLwv8JP6SkimjYefF8rx8p6emQJh26Jm
 wtlmKGwOyiADzlLZly43pzSH8ngPmwqPD8niYNnmVPAh2aRAZDH7xTFd5Nw5z9zikU1y
 NvJe8oz/CmLFVNBKd7pdKVJhtylR1YRRUS0w7W1NE/YoWua6qPJKYMPbUE3fn2D5UzcB
 efTdtwRW06z8WtFHAb10aVTDm6dZFfXJm49wAHnV+Cf2K6W3jOcSczG562ggX47YOQuG
 9hi7hid5FCDr40p7PeoPY6xkmXt7XWa+YrXppizOUHEV0HarOuv0K3E6gIU4tyqvgYWr
 KJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1vd80S55Frb6CGjHBLvPF+QFGjEdspA5jjiX4inId9o=;
 b=ZrNV+vQEeFallAlHLdG0+9CCTB4Bwkq2V0opRu3ulVXsK6NzbcoDkl4lykrKALmGnh
 49ccInDuvcCXkMgs0zFsGzRt1N3fucfJZYW14gQIdTN0RruHB7R/sInSeyHdhg8AnUQ9
 ng/eUCCmgCAb4BhT+C2hnovRC3blM9mFR1h3D+UIEijY5BF6yjD2hnqTIG/VAe+mf1jA
 UFQD4Y65LOt6cj03KkhVbCUn36AHKqkS8v2zaobxoWhC/m3d2MPslDSUZ5vRnhSBNDW/
 zHXb6O8OJ4h/yrIMxN9wcU7GiVqwLu+UIR4hUprQOkzsIWhM/LWCezuwb+jGU9ujVotB
 TPyA==
X-Gm-Message-State: APjAAAVO9DK23XIOBlNmXqSSIMib1m8t5kscZ8szZ3dAAmru7u7FMKxA
 Qd+8TPyZILoUCH3niJzSGEbwaw==
X-Google-Smtp-Source: APXvYqyFPBiX/Dzj3+1uGcZxa0ESCGxxzjzLSjAg4zYz/BoOSpwSCmtAQPGJePmtlVc6NgV2ysdnaA==
X-Received: by 2002:a05:600c:246:: with SMTP id
 6mr16982360wmj.150.1552298180816; 
 Mon, 11 Mar 2019 02:56:20 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e12sm4764737wrs.91.2019.03.11.02.56.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 11 Mar 2019 02:56:20 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 05/11] arm64: dts: meson-g12a-sei510: add regulators
Date: Mon, 11 Mar 2019 10:56:07 +0100
Message-Id: <20190311095613.11371-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311095613.11371-1-narmstrong@baylibre.com>
References: <20190311095613.11371-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_025622_393788_9D7594A0 
X-CRM114-Status: UNSURE (   8.72  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

Add some regulators. Still missing
* VDD_EE (0.8V - PWM controlled)
* VDD_CPU(PWM controlled)
* VDDQ1_5

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 63c515fe4996..2b11b5893958 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -15,10 +15,36 @@
 		serial0 = &uart_AO;
 	};
 
+	ao_5v: regulator-ao_5v {
+		compatible = "regulator-fixed";
+		regulator-name = "AO_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&dc_in>;
+		regulator-always-on;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	dc_in: regulator-dc_in {
+		compatible = "regulator-fixed";
+		regulator-name = "DC_IN";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	emmc_1v8: regulator-emmc_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "EMMC_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
@@ -31,6 +57,35 @@
 			no-map;
 		};
 	};
+
+	vddao_3v3: regulator-vddao_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&dc_in>;
+		regulator-always-on;
+	};
+
+	vddao_3v3_t: regultor-vddao_3v3_t {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3_T";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vddao_3v3>;
+		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
+		enable-active-high;
+	};
+
+	vddio_ao1v8: regulator-vddio_ao1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
 };
 
 &uart_AO {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
