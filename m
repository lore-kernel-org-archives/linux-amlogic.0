Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF493C27C52
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9jojyNST4Vf4EpEthCsOzkjCVwti/P2g2waWnGopA6k=; b=JHoLle6eOoZnZ3
	q4J5NOeabKlGE9hZXW1bk9UHwXxJojl/o90w6CuqEGcsPs70nuO7htt79H+0jBMmBH3xtThdhn2sV
	xYZicDFhSV1Y6uVkWLuG/8LH3Y9GKUVdIsi5Hh0qlBSIgEzzYAgzhohTq2pCTyOHMaD/aTpnconvj
	p0hqQCJ9ov/YH5c1XrXEm3uxKp71WvRFFSOY0mrcU0HbipMj+el/hjIWPoth0mx/YuqSUHBIxc13/
	pClrs+2RNEB8QtCGGiFlQuKzVX/OnQeOAZ1co49ku6OUydyx/kq5NoYhQI5pQb9K1g3+FFElVeWLm
	7Ed6pEugP9fgnS1oyx1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF94m-0000000918q-3NWX;
	Thu, 06 Jun 2024 09:06:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF94i-0000000915B-0gSR;
	Thu, 06 Jun 2024 09:06:25 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42155e7084cso7680995e9.2;
        Thu, 06 Jun 2024 02:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717664780; x=1718269580; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4rgFWRbmc/mITagCbJLY2C7AsEpsBUmMdP3ARGdK//c=;
        b=bvxlFCv1wftWy1q0OEjs2XyXXi6/HvMFbVu1alnV84VOC5xonXtmcRh5BBDGtX9mW/
         +qmSaAy/hNjmI/Fcu5A5dNbJ85PVEqEeMaXxHtHHceEDYD9dF2DVxAut/9oyet5Z58B7
         sqvqpY+SneMCXjpGrf2xYCzNd8nXBXh3y5zP620QRzwgWXFrbxJ70e4ZlrGkKnTjA9T4
         qcLuVkkPhEaLRqDoSCNST/cVALpbeFZ5s054Jr3MipsS2LyjztE/NULmM+4L9HnIkm0S
         JVAEEYMBqrtNe6VrUYwLmm025ZwHj0MyDnUKqrKPQRfOBmK21cTB3BB/4B2M4z0HZ9pl
         JQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717664780; x=1718269580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rgFWRbmc/mITagCbJLY2C7AsEpsBUmMdP3ARGdK//c=;
        b=ssaM3nzVx1kfQRaByoS5C/e2lp4TEdziPwYGnS4/W5nh7XKiQbRnvutKJhnXq1sial
         F4rfY9oFg/q3ypK6GfDjm727U0TixlgstEVJQMS80MQor8xXkujZmabK96NJIiRaDYK8
         aaEVfMPU/me4yCehVLLwCzdC9g0oepl+GV3iuMet+sxb2U8fAQTTEiS/wsvXQrMEFYDQ
         2GZ9ehd2acjR/BY8+zNRcK49tVKQkPswjFaoY8iB8Q+6FUgSG7vPXtfS0S4PWgf+oBTL
         y1+6Fm4VQ8KkSINzY6TrAB/Y76+HBTryyYDqFtCgXOmJggcleOmAarn0oYRKnTeiUvP9
         7Jfw==
X-Forwarded-Encrypted: i=1; AJvYcCWoy6KQHUIBZAqH2k+Ej2lmq1ZPIT2luXQbHiK2X8Gk4wXU4rcDb02mHruBS9IPuf5rrNhPX+Q5385A3CMVe8K9R0lYn9QJWfbiql4S/VtSLYc38z9mmXanoy4DLyl3eF6Qefpp03DwwchI3pJqFEVLW6ZocnHHmQ==
X-Gm-Message-State: AOJu0YyhUxytTSGqvcKQ6PkcOukZP6OeTSMp/5iTTdq045eu3GbYPZf2
	qaRs4pcsAMiQ8QRQfZw46n/Ec7MAwbpyy/lpEsmrUvlXRCt2GC67
X-Google-Smtp-Source: AGHT+IEO0mxczR/mD4wLnGOWDtPXarRkHd0Rx/ObbVCaBZXqNJf3Cix3+QyXppwMd8bDvj8jMfKeAw==
X-Received: by 2002:a05:600c:1e0b:b0:421:5a37:d45e with SMTP id 5b1f17b1804b1-4215a37d578mr23685335e9.37.1717664779758;
        Thu, 06 Jun 2024 02:06:19 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215814f141sm48483655e9.42.2024.06.06.02.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 02:06:19 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: meson: radxa-zero2: add pwm-fan support
Date: Thu,  6 Jun 2024 09:06:15 +0000
Message-Id: <20240606090615.3946433-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_020624_225788_13563D11 
X-CRM114-Status: GOOD (  10.68  )
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
Cc: Yuntian Zhang <yt@radxa.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The A311D on Zero2 needs active cooling and the board includes a header to
connect a simple fan. Add pwm-fan support with basic thermal properties so
the fan runs when connected.

Suggested-by: Yuntian Zhang <yt@radxa.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
Changes since v1: [0]
- Drop min/max state to comply with bindings
- Drop ddr_thermal node
- Add cpu_thermal trips
- Use cooling map2 to avoid clashing with dtsi inherited maps

[0] https://patchwork.kernel.org/project/linux-amlogic/patch/20231028075445.3515664-1-christianshewitt@gmail.com/

 .../dts/amlogic/meson-g12b-radxa-zero2.dts    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
index 890f5bfebb03..8445701100d0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
@@ -33,6 +33,13 @@ memory@0 {
 		reg = <0x0 0x0 0x0 0x80000000>;
 	};
 
+	fan0: pwm-fan {
+		compatible = "pwm-fan";
+		#cooling-cells = <2>;
+		cooling-levels = <0 64 128 192 255>;
+		pwms = <&pwm_AO_ab 0 40000 0>;
+	};
+
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
 		poll-interval = <100>;
@@ -286,6 +293,23 @@ &cpu103 {
 	clock-latency = <50000>;
 };
 
+&cpu_thermal {
+	trips {
+		cpu_active: cpu-active {
+			temperature = <70000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map2 {
+			trip = <&cpu_active>;
+			cooling-device = <&fan0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &frddr_a {
 	status = "okay";
 };
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
