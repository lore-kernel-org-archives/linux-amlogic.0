Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5932C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:15:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9376120870
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:15:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UiyROVqJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="D9n9W/Wr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9376120870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cx9tpu8tZaQwZyVnzph1URv4/l/klR9Ft0rjwq5R88Y=; b=UiyROVqJr1dqan
	JGF/V9s+9G86dcscq14ZBBlpw46vZfkOkoFA6/V+xw2eLMLxKWGoqPfOb7OIQnBflnp6d1iuQmfIy
	pQblA6U0YwWDGuVv0100sESKWgy31qyL6tIWDU+5AWauixPI3Lq4Fn6XGCCjiQAShGTSSTZXzENH2
	Czwx+W5SjVonvneC6fB7qW6g1pwQSr7k4vWr6Ola3LUzyw60fjyeJMLfDK7hH3RbTZqtJOvG63Vw8
	ObEcJxXE+P/cDU3tv9vm0oY6go6qNYL66crg4x1qBX537sRHkf2Piqqn635JE9Ll2pl4ozjbdibIl
	GA6xf4BbRQ1s1WWxChyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8MdP-0002BK-VN; Mon, 25 Mar 2019 10:15:15 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8Md9-0000jw-Lc
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 10:15:03 +0000
Received: by mail-wr1-x442.google.com with SMTP id w10so9400681wrm.4
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 03:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mONwxENhpKvTTQwCoB1Esyjq9hiq9z607IfSptpkVMk=;
 b=D9n9W/WrhVnLyL14ZrVWWRMVU7NxLkg4o76ElZp6yLWBsLpiC26p5JWjtySyUyh3v1
 +tsIdKdw1UWSZNG+dBtb3nqWgikFvBVS8cH/sTeFTYWimpv+RgvfV8csX8RwXAppaEcW
 EGvNVHe6Dp7ZawdRJcR2JM/i6a/vWXZbqCypp/8/fBQuRQ1PR6BZYBLSOzd8ofNhJQDT
 iOKuupwE6xe2HEscaa7jhxLzv+CIXb5e8b4WIQIdve6Q8RKfugFYcpBSqNgwk631FuEc
 lRJ6zowts3tEWXtdUHq0eHsKYKJaQ4lv9YM+PhS8KsvM1vxIuMFkpOZLr3PMTRsy8gWJ
 HWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mONwxENhpKvTTQwCoB1Esyjq9hiq9z607IfSptpkVMk=;
 b=B8sO/B4mtBPVRQSEzQ0RAQtO2DaFdUBzotgprsp3KZH9AMysGzQu05dIy7MtVPfptH
 saUdScQCfB3ChubacNxTqSgarVquTAn8GTd5KFuHtK7GSVYNbijsn4nvzihtZZ+YzIB+
 VH5f7mNgbyYNhr8dXi6y7IMExFAo+RQlLcB2DZzA+ZRDFxMMwsOx2Q5C1ssFPkPzhGit
 NocbiK6ApnB3KMrIulYksWY4B+42Ph9NXt11OxwKJ9po9XHTEpfKzgAGjvm6aEX/2q78
 PS502bG+5Yh6uYhzideh/+b4iiftz8+wgnJBNjQvhz91pxCjr5wKMnwY4evoCchG8qo5
 6AOA==
X-Gm-Message-State: APjAAAXgIbHyYhr7wEZAN7pX6wf2X7QaxeD51K9FZVOno6UMqV+/hbbF
 LS5Ac95n7C7miuZYq3TvvngXRQ==
X-Google-Smtp-Source: APXvYqwY6vtF1bLLpkIF8ZiE5nBSl9EjUTCXx3wj95kqnSeBvfs2nPQ312T+uvVklUxQjj3p2kR9Gw==
X-Received: by 2002:a5d:6706:: with SMTP id o6mr11531637wru.36.1553508896881; 
 Mon, 25 Mar 2019 03:14:56 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v14sm20049484wrr.20.2019.03.25.03.14.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 03:14:56 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v3 1/6] arm64: dts: meson-g12a-x96-max: add regulators
Date: Mon, 25 Mar 2019 11:14:48 +0100
Message-Id: <20190325101453.3009-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325101453.3009-1-narmstrong@baylibre.com>
References: <20190325101453.3009-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_031459_710275_B2372FC2 
X-CRM114-Status: UNSURE (   9.34  )
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

Still missing
* VDD_EE (0.8V - PWM controlled)
* VDD_CPU (PWM controlled)

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 0edbd00b358f..0ba28491e2b0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -6,6 +6,8 @@
 /dts-v1/;
 
 #include "meson-g12a.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/gpio/meson-g12a-gpio.h>
 
 / {
 	compatible = "amediatech,x96-max", "amlogic,u200", "amlogic,g12a";
@@ -21,6 +23,71 @@
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
+	dc_in: regulator-dc_in {
+		compatible = "regulator-fixed";
+		regulator-name = "DC_IN";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
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
+		vin-supply = <&dc_in>;
+
+		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
+		enable-active-low;
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
+		vin-supply = <&dc_in>;
+		regulator-always-on;
+	};
 };
 
 &uart_AO {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
