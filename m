Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70AAC61DBE
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2026 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MOfzTti+L2pMD2dORV7/ZHn/9gzLo8CtT4FbYeElP/4=; b=M5zUf5iDOhCSEG
	W+URswPTNNSOezLZOFEiKshu/YLxHLU2YBVjEJx19EUS0H6TjHmDbk22tDF9HJgxooA70vwoSmR0X
	jtO3bsrXk6rdoMP4/oSLWMvg/5N3HGtDphZcL8GKAbBhstPQrBRbTbipgSzVqTONW/evHZviLfcNo
	O1g2SmeQKN1KnDKWdiNlhFsO2a5Wrxe0nIOonysOaPgslw3hCwvRHPXUK2RPSeUWMlBhNKOe4krYM
	gS+Z8Fb9zth35FNxj87oQ4jD6/YqUcPR6w8WvKXZqCNnug6jE5qmzcuB1Q1hJtZ0uxIS5Qivo33Pi
	V/5LA3ynOSCwaYLhd8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0FfS-00000006thT-2v1D;
	Sat, 29 Aug 2026 09:48:06 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0FfP-00000006tdw-1ziR
	for linux-amlogic@lists.infradead.org;
	Sat, 29 Aug 2026 09:48:05 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso11065945e9.1
        for <linux-amlogic@lists.infradead.org>; Sat, 29 Aug 2026 02:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996882; x=1788601682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gisI60aIRI94sbsFoXYOhSYGpkylj0kQ6heuxGTepDA=;
        b=ckiW7qWpToiQ9M+DVDnWrzo1ba9MyABPCaCcxXz/yC8F7qvz0gVnwsHDTzIAPntGs5
         pmy/A/c5zZXKY/Bs4HuwpTeNKMaiIb+Cdnr4Di8rbll2OWYAG4NF7QXmteTpw38XQU2W
         vbq3xH9omJDzdCxThRTsjmfX+Y6n2qyGhuyAk1EEeQGAt0adflYsphviQlQWmL6hfdUK
         89ATk4/vDlRUdTlTjN0T3PRCGOtmwkJPO7AiKbeFYGMw23zE89xWK/itaW6Z5vvG7jJB
         jcsirzbAkjgdZmwpkLXM1hc3VxJ64jfjJH29WVy79asNEcmU9laeL67IwYNdQQlC0wnn
         D/ag==
X-Forwarded-Encrypted: i=1; AHgh+Rrftu7yhmX4fiZldUKo+qaN//YCbjyj9NBDsEVJ7By/MZV1VZSeXs0N5MSYvUI/8X2urp6opTZ+gz/ux5b/@lists.infradead.org
X-Gm-Message-State: AFuF++mYeL0sdoOUVlfGUDrTStp4X69n2BcbWAwxwBXmGWLPLGHuE4HB
	Au6Lpja7pOtgdxi4PgJWXfaOG0EgGpsQznM0g6zalCVLoXaK4HEy6/0h
X-Gm-Gg: AR+sD11vP2iOHDmt/9eFaPA011++2trjwstmXABC7QPFpIYYvRHzx3TaqvHRdQ5LmP5
	CUKVuOiCFSEwIEQMskQMzb8yUKDo/eacLavdP96Bcigk0hP5cYmXca2V+WVWAJa9G9yfEjUVZOW
	7qUvYIFQYllLP0nE1D4RSq4JiF3KDQJsNR8RRgNQx/zOO53apUvBINxTXo+YItOiF9q6hAIiSFE
	AYIQ8yWbdZBQNuPwyMKdYMqGaFW1ZQaBRa4XOzlVhjLwFip2tg2dKmk1hj1zIHUXaTRcfOmWq4R
	G8NNnGqkeWAj7I1g6ZCFacHDgbAAlPuuirDsRLRVp9bg+BOU0VG0k/8O/0CAyR1/rbK38iVuPTa
	mi//yw4OicXmrhtyOC8Ys5FAF173cYqYTutkTPS1/qtrv6Vjk6DNhV8VMHxcGc8y0tmv42Ae7Ru
	SifkT/8Kit6yIJFFWXEPRVwnVUg42Y9+sCi6XhYyTBCfnW0X7/FZ/sQk3SCOF0O1MY4PA4UhakX
	OFX5Zoj9hRaEaeSmFS7vWP9vUs=
X-Received: by 2002:a05:600c:858b:b0:49b:928a:3f9e with SMTP id 5b1f17b1804b1-49b928a4006mr137978955e9.5.1787996881702;
        Sat, 29 Aug 2026 02:48:01 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:48:00 -0700 (PDT)
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
Subject: [PATCH 2/4] arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
Date: Sat, 29 Aug 2026 10:47:56 +0100
Message-ID: <20260829094758.23248-3-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_024803_514310_0594E4A8 
X-CRM114-Status: GOOD (  11.46  )
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

Two of the PWM outputs can each appear on more than one pin, but the
description named a single group that does not exist, so anything using
it refused to start.

Name the real groups instead, one entry per pin, the same way the other
multi-pin PWM output is already described.

Fixes: 2a2a7b9701a7 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 32 ++++++++++++++++++---
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index c3dc479b137d..8c4bd683cce0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -458,9 +458,25 @@ mux {
 					};
 				};
 
-				pwm_ao_g_pins: pwm-ao-g {
+				pwm_ao_g_d11_pins: pwm-ao-g-d11 {
 					mux {
-						groups = "pwm_ao_g";
+						groups = "pwm_ao_g_d11";
+						function = "pwm_ao_g";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_g_d7_pins: pwm-ao-g-d7 {
+					mux {
+						groups = "pwm_ao_g_d7";
+						function = "pwm_ao_g";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_g_e_pins: pwm-ao-g-e {
+					mux {
+						groups = "pwm_ao_g_e";
 						function = "pwm_ao_g";
 						bias-disable;
 					};
@@ -474,9 +490,17 @@ mux {
 					};
 				};
 
-				pwm_ao_h_pins: pwm-ao-h {
+				pwm_ao_h_d5_pins: pwm-ao-h-d5 {
+					mux {
+						groups = "pwm_ao_h_d5";
+						function = "pwm_ao_h";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_h_d10_pins: pwm-ao-h-d10 {
 					mux {
-						groups = "pwm_ao_h";
+						groups = "pwm_ao_h_d10";
 						function = "pwm_ao_h";
 						bias-disable;
 					};
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
