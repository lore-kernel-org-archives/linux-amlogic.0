Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E72C61DD6
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2026 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipDcTom+NFLc78fZUIwt6KqF+fvKyIPbi6FQ483E9bE=; b=INDOtEDySqkgxQ
	MvthGbmwG8Z+qJvASTVd+fb3C8JnFKxrGysYYt3NXa9uD+sBHo5HX6yIqijtRhrzGnSbgc4/0zrwl
	TPJLOAviRBVzlihvChDt/vMrp3MEA1CvMKBd4mtwu4rXBKwJujXnoVFQpqphtgDncma3CRlcOI3t5
	xbOnm4AT3PyB4GsyRoUG5FMLrIyOgcSy8eBoGURZzvB1Q/ZFeFEgYO8Qp0WNcjeuBk93HsoDhNoCc
	Y1Y6lb9REaM7P0Dpiixkv2DQbgJj+T6J2otmRcWjmt8LqK4rAZvCYv8d0M7x5ffkgzOu4htVzLbTH
	caXysNBetEY+vOGpRZyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0FfY-00000006tk4-1AnG;
	Sat, 29 Aug 2026 09:48:12 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0FfR-00000006tfS-2Bdy
	for linux-amlogic@lists.infradead.org;
	Sat, 29 Aug 2026 09:48:06 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-495590dde14so16789245e9.0
        for <linux-amlogic@lists.infradead.org>; Sat, 29 Aug 2026 02:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996883; x=1788601683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w58IcK8ZE/FUFrG95ZGCGEBUQTz0E4TGMIPiEQMb1Vg=;
        b=RZi/znAzS2khnlYhK0lThDyQhr89CE9eeC6h2Xl44m5NPzU/IX4Lrw7y3TSeKWnDg4
         QZ+fnJaA+J1UifhEbyvJZq7deJjOy4c7mKNs69XP0kiA2ef/6Lqpn2GjH6WiLyno6o3E
         CsM91Z3V3lk1PBIoG0yfAgLTVNEVMaNtqNK8pwFkOwHxgLeZ6qTJyAW5ybtJ7s9zffWf
         2JgRs0ICctwxSC86Wts9J6aRzaxcPc1p5T2DpckNmYB/NC77GROEcRm68Xl9Jwvo9nPP
         pZnBQBQuHqI0+F+kXBg90E6Y8Hlx6VWkHmXQ3JZEO9JbB81JSBQwm/9oateavxyppizM
         97mQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5STI/VHbPxEnoh1m4LaOjwsoXAKwcWXcshIX/48sDhG47vp9/3yx/BJl5c9F5CLFONo4gsKBmwQR5MnEx@lists.infradead.org
X-Gm-Message-State: AFuF++lQcXCC/nuIO+cN5gE6d9yPAr4Wpx4/EE4s9DU33UBk/WJ5puVn
	HJK2nx3JLss6ZODAQDDWRlR3gSRggaCnnv5WxjcKtSaj7GBE5VfovlEg
X-Gm-Gg: AR+sD125WtebSqHg3n58neLvecsvYkHo0SxRgokGxrlXo7+YPfP/17btpQU8qUQ0A9U
	15ng3d+hzMMfcCmLQu1Mzy7vxxEg5GQoTEANja6gVJ0e94LBoXVchUBDhGYq7xVHV/bzqWTdXDD
	ZTRm8cqZuHBycE3GyzdY3mss5hz39XOTgpcKQzhlp1CuMte6sKMEFG5z+dXF3GWgMi9CRwVwUXR
	EskYa343KdGEtM/wWgUlN3t/0xgrgBuDR3tX0q5j7fE7AxC5rce3nmb3R2iJd6lHqQBwnWP1WTE
	vhKjcHK5j5Bv6maXuuHs0LOEWnOiOLn8CqZNMdql/anJEg7+ykqeQULc+MLRZTv2DccttxcI/w9
	E6uP3CDg5nn2CXr7lzaBK8cJvCOaBmydoOxO2FCSdYO1NXkDJwKzsp/2P6WpGsyuhYL29rrMaJj
	CtlWApUBdQLmpHLbC/xle0TMlnWrhO++bAq2iatFvLdxMXc9asZVsSGIGH2Jeo79EbFhdx0ZfLo
	YGJaC+nZLwQ5qf8sYPHpg//hqA01p5qvCnj8Q==
X-Received: by 2002:a05:600c:8587:b0:499:dbae:43d3 with SMTP id 5b1f17b1804b1-49b91c489bbmr177775515e9.9.1787996883483;
        Sat, 29 Aug 2026 02:48:03 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:48:02 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM
Date: Sat, 29 Aug 2026 10:47:58 +0100
Message-ID: <20260829094758.23248-5-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_024805_597706_A3FAEE52 
X-CRM114-Status: GOOD (  11.09  )
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

The vsync PWM output can appear on either of two pins, but the
description named a single group that does not exist, so anything using
it would refuse to start.

Name the real groups instead, one entry per pin. No board describes this
output yet, so nothing changes today.

Fixes: 2a2a7b9701a7 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 8c4bd683cce0..719e111bc3dd 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -546,9 +546,17 @@ mux {
 					};
 				};
 
-				pwm_vs_pins: pwm-vs {
+				pwm_vs_y_pins: pwm-vs-y {
 					mux {
-						groups = "pwm_vs";
+						groups = "pwm_vs_y";
+						function = "pwm_vs";
+						bias-disable;
+					};
+				};
+
+				pwm_vs_h_pins: pwm-vs-h {
+					mux {
+						groups = "pwm_vs_h";
 						function = "pwm_vs";
 						bias-disable;
 					};
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
