Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8610C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 05:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EeLUfVsv8NFfvwlDBAbR+j/LYRyg+fnf0jGIADivj7w=; b=b9qaP9uOaryGO9
	L8yD1pIMDsP+CSZCgldXmZ3vTeJSACQbA9nAkyKsI9GlHHB4Hl4ymkwGK92WhvYnKxbaJd2btQOFe
	ctN1+VBAZKs80VufThglUIa5VSRZD+WY04258dVHOvGMBMITRu/IQrCrZ1TL/FCOuPx5VjwNrSAqp
	0QyOALbuOTsd29kpVvYDJQLw6msAszH6FyEH+6TEVBQheYqXkiEemNRZ4mcthdXKdrUyh9MP3b+JR
	9EkgtNXLwikMRQQbUxv0E6WOb0atDNcpC9wHjCZF5019Uj35bkwkMAeSRyh3lht6r5k5moCt2paKQ
	6giV2DL9/2qxzkBqgH+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olkHr-005JGA-He; Fri, 21 Oct 2022 05:09:39 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olkHf-005JAL-SO; Fri, 21 Oct 2022 05:09:29 +0000
Received: by mail-pg1-x52e.google.com with SMTP id r18so1543757pgr.12;
        Thu, 20 Oct 2022 22:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ba9dLdgOZBOgG+Y/zhEkRy4LHyrM2NTx3VqdcRa7tz8=;
        b=JO5pUJWXDe6yMAmpZGe9HeFCZjsqKRSnxnoFGevEUfDgzex5fnqR4h4RB/YGKnbgpw
         vHWKzdcTs0BGsdyYklukTlJkeA3QmP92h83HAAQWoV1dW0Ew5xg9LLPwPyr5+/lk38+s
         eGFP5bJhd9g8vw0FEzafKvXmlwddS8gn5I9mRCwgdiWuaQQGvB6PTn7kF4D3q2cZHzcq
         BfyBCUPbcSxTD8wPxxe2gKlOZtejX1y/wkK/wknSr14WRN6cnOmzIxNfEs7x5OxpV0Yz
         7bgtnDHXrkxpXu/Xga6XCzgYSXIbrV4If/HA/XT3hh/cpOIe6eUkJ8sarB4szRWAtG+c
         RE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ba9dLdgOZBOgG+Y/zhEkRy4LHyrM2NTx3VqdcRa7tz8=;
        b=sqJ8F1cKT7ADnEfu9rcNi9LOOGDi6++qp9x2egZGqUXCGQmR78jljO5qfqCGx3Fen6
         sQ7NuSjURKpH10NssqtHtazeWy21OEKpDiCbVdwhwILLz8MevqVYumWfmd2iMWxEDr7T
         0vqjVdIbw8CCBON7GQJzKXqHHdW2ulFGUFjzXgffhFuf6bm927MdY3rP3m5sxBQJuveQ
         B72bjACGXKO+RAFMaOO/5XrCLZWrUSV1fCHJY3oK/BumXu1EOjJFLvYf8Xc33FNY5J6A
         30kcLatcDxP5gN9YVvHLhw/4Vk4n1xTHLlKCt6PQ4YPv4IKiYGMFnZJnPojYdYaeDZQz
         YhqA==
X-Gm-Message-State: ACrzQf3z2keCSNoQhkJ5YIMe62m+m1zt0VCzE/99stsq3GVdrd0A6v4e
	M+v/cW9vSrviKV4EpqCM4qU=
X-Google-Smtp-Source: AMsMyM59WgmWh7/zaSdlePpeiOjBk6mOvLdnDVwax23Fa9VVLugMGyWLWkUYZEEAcovwo69V/hk9mQ==
X-Received: by 2002:a65:56cb:0:b0:460:442e:b293 with SMTP id w11-20020a6556cb000000b00460442eb293mr14621854pgs.49.1666328966431;
        Thu, 20 Oct 2022 22:09:26 -0700 (PDT)
Received: from localhost.localdomain ([103.51.72.20])
        by smtp.gmail.com with ESMTPSA id ik3-20020a170902ab0300b00170d34cf7f3sm13520770plb.257.2022.10.20.22.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 22:09:25 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Anand Moon <linux.amoon@gmail.com>,
	Dan Johansen <strit@manjaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCHv2] arm64: dts: meson: Enable active coling using gpio-fan on Odroid N2/N2+
Date: Fri, 21 Oct 2022 05:09:03 +0000
Message-Id: <20221021050906.1158-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_220927_936186_039473D5 
X-CRM114-Status: GOOD (  11.51  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Odroid N2/N2+ support active cooling via gpio-fan controller.
Add fan controls and tip point for cpu and ddr thermal sensor
on this boards.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2: changes tip name cpu-active --> ddr-active
---
 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index fd3fa82e4c33..667d2b774924 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -39,6 +39,14 @@ emmc_pwrseq: emmc-pwrseq {
 		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
 	};
 
+	fan: gpio-fan {
+		compatible = "gpio-fan";
+		gpios = <&gpio_ao GPIOAO_10 GPIO_ACTIVE_HIGH>;
+		/* Using Dummy Speed */
+		gpio-fan,speed-map = <0 0>, <1 1>;
+		#cooling-cells = <2>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -410,6 +418,40 @@ &cpu103 {
 	clock-latency = <50000>;
 };
 
+&cpu_thermal {
+	trips {
+		cpu_active: cpu-active {
+			temperature = <60000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&cpu_active>;
+			cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&ddr_thermal {
+	trips {
+		ddr_active: ddr-active {
+			temperature = <60000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&ddr_active>;
+			cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &ext_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */

base-commit: aae703b02f92bde9264366c545e87cec451de471
-- 
2.38.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
