Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACBB9C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 10:04:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E0AB206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 10:04:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dO0Y9DfO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vZEN+DW+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E0AB206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1ZUB92/oyi91IpsWFTnFCDnYHRAv37dJDs6OOaAJqQ=; b=dO0Y9DfOkc05Gx
	T2rZa5WL/BbsQJ/OWjNTyUqrjt7+FYGOMiIBGWqagrXA4iH8qTFU+vSdHQtkfg76qWfNQPsDISAMS
	S8a6io1N7+P/k2kw/wwPDIoPcbuQYhLA2LxDeBbf7HpS+0pfhYULmaOyU6UwMQb+dxR01czFYAS4C
	M3jvuUVSmBQ2Y6bCJruV7NYQfH9e88BcN8f3UvxRdfR8Rl4iHfvI7U7xmZjMM+WJV+Y4W/FUfu2jV
	PVAWveETwHPTizNRKXW1OAZclyWJPDufE7l/q6sg+4DKUqo5s0dxAIsdga6imtqP9vvBTkhhaG3PU
	886vHETv80CRMQ7Fie7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3Hmv-0005fy-1r; Mon, 11 Mar 2019 10:04:05 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3HfS-0000Fv-TW
 for linux-amlogic@lists.infradead.org; Mon, 11 Mar 2019 09:56:27 +0000
Received: by mail-wm1-x343.google.com with SMTP id q187so3720604wme.5
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Mar 2019 02:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iWYrpJ4u6j7Px4ea6cF8sUAOQBRW0gQe+bRpxndR0M0=;
 b=vZEN+DW+EXX4Ss4jOWBxKRGsmJsRS3b0NxgmxxYR2he3u43Mq0iNladnMjAVmFVhU+
 boB8tXLCW3K8zYq6mSi6OBdmKCZSoqf53YjGkFPeiN+S6F1nucUTEE700M0echqH8QHF
 03rUfua/RjZONQJFHF7xfB7CLwRhBww48hzZHmRlaaC5Gy5FLMefiSIKs1s1hNRrxCg9
 LWfSqNAUrjv+GITY1dUB+6KURJDiltqVeSMEDOSnOwSQsDEBl19aM1Hu9PiJR2nevI4f
 xWiPEjj8hLRNr0Sp5UWH0G6YgEbSZBrmEMTawPXgmiBWyNEZVjsnin52SLp5o6ztrCSh
 jfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iWYrpJ4u6j7Px4ea6cF8sUAOQBRW0gQe+bRpxndR0M0=;
 b=sYkJuBJmMABzYvaJfzYOPavTZbt6gkfXqEuI20fL4mmM92GWutu6wYt1bcCyPoqXSt
 UnfMVzPB+i6T2MfYQ/LT7M2r32Qy/OJyy4ksXLdobj5pUQH1PAn9XiNLpwH21exDDE0K
 sm7z+Yu0E7ZJ4B9lvBFwLNQlO56TxDipVX8TU35mnq2enRP9ej7STV9nxp5xONRscE4z
 EES2EqBRsZz+57oxo4suUCAG3aodJ+WaRwc6Cuv4MeGiNI4DHrNOLTSG36HlVB88k5i6
 5zZv23lTAcCIQqCdXYqA5sr/ahPGJs1bQkTCoLCGjsmkLl9bbD1WshUzeD66MYRzSlhp
 JKkw==
X-Gm-Message-State: APjAAAWiJ+tBGQoWYT4apFBneK9+zRr1Bx06Pzhyg4Uwbh4kP074A29Y
 gpE/d3j42Qf+ypQi0pgA0TN8Tg==
X-Google-Smtp-Source: APXvYqzo0P9itClJMbIJLsoCZUD7VcIW3axRTvJ/oWmFsJHAvXCPOXkPLoZ8g9tUf+Hh2E3mWOs3yQ==
X-Received: by 2002:a1c:a74a:: with SMTP id q71mr17349119wme.45.1552298181499; 
 Mon, 11 Mar 2019 02:56:21 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e12sm4764737wrs.91.2019.03.11.02.56.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 11 Mar 2019 02:56:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 06/11] arm64: dts: meson-g12a-x96-max: add regulators
Date: Mon, 11 Mar 2019 10:56:08 +0100
Message-Id: <20190311095613.11371-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311095613.11371-1-narmstrong@baylibre.com>
References: <20190311095613.11371-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_025623_111519_75346E23 
X-CRM114-Status: UNSURE (   8.99  )
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
Cc: linux-amlogic@lists.infradead.org,
 Guillaume La Roque <glaroque@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Guillaume La Roque <glaroque@baylibre.com>

Add system regulators for the X96 Max Set-Top-Box.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 0edbd00b358f..21e5de48613e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -21,6 +21,71 @@
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
+
+	flash_1v8: regulator-flash_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "FLASH_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+		regulator-always-on;
+	};
+
+	main_12v: regulator-main_12v {
+		compatible = "regulator-fixed";
+		regulator-name = "12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+	};
+
+	vcc_1v8: regulator-vcc_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+		regulator-always-on;
+	};
+
+	vcc_3v3: regulator-vcc_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+		/* FIXME: actually controlled by VDDCPU_B_EN */
+	};
+
+	vcc_5v: regulator-vcc_5v {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&main_12v>;
+
+		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
+		enable-active-high;
+	};
+
+	vddao_1v8: regulator-vddao_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	vddao_3v3: regulator-vddao_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&main_12v>;
+		regulator-always-on;
+	};
 };
 
 &uart_AO {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
