Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E4B3C10F0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 09:24:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DCC321872
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 09:24:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q+EUh/xa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="daCDizCg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DCC321872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BmoOqlfHuAlWVmF4MwMXzrhgeROLMAC5Cp4JbHLXULM=; b=Q+EUh/xaygfaYM
	c61Z3/dGBLnCQm9BQqrVU89wjHL+qIjW/qThykUzrdsg8BuYduH5gylmE9dLNxUU+BHft5/CRLfgZ
	KnTSsie9+OT11vvVG66HoeYkulLv5ioGC0vmKcKGB0JjEUnnZBPgjWFxfOWYPq8Rf46ZOIXEprX+1
	ZYrb8tdGF1/bUl7aEhr6c7M9VHM5jL0CqDrlrMqTALm7VXLoCJ8Oo2UDaa+O2qIqXUHVDcbSD9y07
	VOLPztF+0l7d3oFH9/u9GzQCOJnxb6Hj6S3sGIam3QZXGaDvfof/vBP0Dl8nOk70Fe8UqsxxQY76U
	oMOxzWI2PY0NZAVHhNXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEsPz-0003wF-4h; Fri, 12 Apr 2019 09:24:19 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEsPP-0003Aw-Mw
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 09:23:45 +0000
Received: by mail-wm1-x343.google.com with SMTP id z24so10192522wmi.5
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 02:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6YLFvpKSspedOVUfA5GjHiMzd1X8HqEXPIfolwrN8PQ=;
 b=daCDizCgO1w6vqWcI7Yhg057xu6pSsZPI3MZiKHzWJ7/0gm93Jc+fwmgbHpRwGKpiO
 v73/Zg8w04muMKJp7Oc40mMbq84fzlgBdG7O0MSFABVxBHtT4R+LkrAmKK+Ng2x+EpjZ
 5ahr1uv8Za/fLoN7ksQaKxMga9BCm0jEByzAOha57qb8YDbhYxrkFH04l8QhtNuNJeb6
 YfE12ziy2S4yBwl3P6Zk/eaF/lixVJNy4AUDwD5npp24rpBARpMzsQRvXsgnFUeQav8y
 E/uA74/jFnGbwcgxkVEGLD7r4lXZHN2qT6wMwIuAx94ER1GzkUY+FX/ZTfJEuPzFArJf
 bunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6YLFvpKSspedOVUfA5GjHiMzd1X8HqEXPIfolwrN8PQ=;
 b=NjgwZj/5uTvM+ho5ePpniVWa0gwzQMe4wqJSQs11cfVtTraNC995ga8EBBCugraQBQ
 7Oya9Iv0qp8Vuy6BDnqCVpNn4kdMqkYUs/fpz1dRyjsI3UFaRwyzkC6Jfm4cyL+6HPF5
 oQYF/2SY9hnO1yRlTIVUm3hCzP/Op6tZ7kIHLrbnuBUTxiaDGdphFh1dGZ7OI1k4UMYF
 eUZ3BRjA1A7Os4JKyWWCvJmWzOhqUNSEykJ4xngPir9187RjzGWO92Fy7aYbKJaCspdB
 QBNPIh30yRbKf/XXVMygh61dZPlvhiZPx6u8m554WmuiGlLKKc3YODABu/M4TE/obqYr
 /Njw==
X-Gm-Message-State: APjAAAWn27OIFCLyMcdmcAqr/svhgNS1q+261yW7JA7o+acCBrkTtGS6
 pIUiX7BI1r3XRlDYqGulsCcKdg==
X-Google-Smtp-Source: APXvYqwil90u4HyUI0LZT8D+4OGQi3Mfriy+Xr2ZwpOvFONoeDPY2ZG4JFwxVjFFi5eu9eEDZEqj9w==
X-Received: by 2002:a7b:c00b:: with SMTP id c11mr9869697wmb.23.1555061022314; 
 Fri, 12 Apr 2019 02:23:42 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s21sm6630224wmh.22.2019.04.12.02.23.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 12 Apr 2019 02:23:41 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com
Subject: [PATCH 3/3] arm64: dts: meson-g12a: Add PWM nodes
Date: Fri, 12 Apr 2019 11:23:37 +0200
Message-Id: <20190412092337.6941-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190412092337.6941-1-narmstrong@baylibre.com>
References: <20190412092337.6941-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_022343_748711_92871432 
X-CRM114-Status: UNSURE (   9.64  )
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
Cc: linux-pwm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the EE and AO PWM nodes and the possible pinctrl settings.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 179 ++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 501496eb34c6..5b7c9076e2d1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -355,6 +355,94 @@
 						};
 					};
 
+					pwm_a_pins: pwm-a {
+						mux {
+							groups = "pwm_a";
+							function = "pwm_a";
+							bias-disable;
+						};
+					};
+
+					pwm_b_x7_pins: pwm-b-x7 {
+						mux {
+							groups = "pwm_b_x7";
+							function = "pwm_b";
+							bias-disable;
+						};
+					};
+
+					pwm_b_x19_pins: pwm-b-x19 {
+						mux {
+							groups = "pwm_b_x19";
+							function = "pwm_b";
+							bias-disable;
+						};
+					};
+
+					pwm_c_c_pins: pwm-c-c {
+						mux {
+							groups = "pwm_c_c";
+							function = "pwm_c";
+							bias-disable;
+						};
+					};
+
+					pwm_c_x5_pins: pwm-c-x5 {
+						mux {
+							groups = "pwm_c_x5";
+							function = "pwm_c";
+							bias-disable;
+						};
+					};
+
+					pwm_c_x8_pins: pwm-c-x8 {
+						mux {
+							groups = "pwm_c_x8";
+							function = "pwm_c";
+							bias-disable;
+						};
+					};
+
+					pwm_d_x3_pins: pwm-d-x3 {
+						mux {
+							groups = "pwm_d_x3";
+							function = "pwm_d";
+							bias-disable;
+						};
+					};
+
+					pwm_d_x6_pins: pwm-d-x6 {
+						mux {
+							groups = "pwm_d_x6";
+							function = "pwm_d";
+							bias-disable;
+						};
+					};
+
+					pwm_e_pins: pwm-e {
+						mux {
+							groups = "pwm_e";
+							function = "pwm_e";
+							bias-disable;
+						};
+					};
+
+					pwm_f_x_pins: pwm-f-x {
+						mux {
+							groups = "pwm_f_x";
+							function = "pwm_f";
+							bias-disable;
+						};
+					};
+
+					pwm_f_h_pins: pwm-f-h {
+						mux {
+							groups = "pwm_f_h";
+							function = "pwm_f";
+							bias-disable;
+						};
+					};
+
 					uart_a_pins: uart-a {
 						mux {
 							groups = "uart_a_tx",
@@ -632,6 +720,62 @@
 							bias-disable;
 						};
 					};
+
+					pwm_ao_a_pins: pwm-ao-a {
+						mux {
+							groups = "pwm_ao_a";
+							function = "pwm_ao_a";
+							bias-disable;
+						};
+					};
+
+					pwm_ao_b_pins: pwm-ao-b {
+						mux {
+							groups = "pwm_ao_b";
+							function = "pwm_ao_b";
+							bias-disable;
+						};
+					};
+
+					pwm_ao_c_4_pins: pwm-ao-c-4 {
+						mux {
+							groups = "pwm_ao_c_4";
+							function = "pwm_ao_c";
+							bias-disable;
+						};
+					};
+
+					pwm_ao_c_6_pins: pwm-ao-c-6 {
+						mux {
+							groups = "pwm_ao_c_6";
+							function = "pwm_ao_c";
+							bias-disable;
+						};
+					};
+
+					pwm_ao_d_5_pins: pwm-ao-d-5 {
+						mux {
+							groups = "pwm_ao_d_5";
+							function = "pwm_ao_d";
+							bias-disable;
+						};
+					};
+
+					pwm_ao_d_10_pins: pwm-ao-d-10 {
+						mux {
+							groups = "pwm_ao_d_10";
+							function = "pwm_ao_d";
+							bias-disable;
+						};
+					};
+
+					pwm_ao_d_e_pins: pwm-ao-d-e {
+						mux {
+							groups = "pwm_ao_d_e";
+							function = "pwm_ao_d";
+							bias-disable;
+						};
+					};
 				};
 			};
 
@@ -659,6 +803,13 @@
 				status = "disabled";
 			};
 
+			pwm_AO_cd: pwm@2000 {
+				compatible = "amlogic,meson-g12a-ao-pwm";
+				reg = <0x0 0x2000 0x0 0x20>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
 			uart_AO: serial@3000 {
 				compatible = "amlogic,meson-gx-uart",
 					     "amlogic,meson-ao-uart";
@@ -681,6 +832,13 @@
 				status = "disabled";
 			};
 
+			pwm_AO_ab: pwm@7000 {
+				compatible = "amlogic,meson-g12a-ao-pwm";
+				reg = <0x0 0x7000 0x0 0x20>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
 			ir: ir@8000 {
 				compatible = "amlogic,meson-gxbb-ir";
 				reg = <0x0 0x8000 0x0 0x20>;
@@ -774,6 +932,27 @@
 				#reset-cells = <1>;
 			};
 
+			pwm_ef: pwm@19000 {
+				compatible = "amlogic,meson-g12a-ee-pwm";
+				reg = <0x0 0x19000 0x0 0x20>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_cd: pwm@1a000 {
+				compatible = "amlogic,meson-g12a-ee-pwm";
+				reg = <0x0 0x1a000 0x0 0x20>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_ab: pwm@1b000 {
+				compatible = "amlogic,meson-g12a-ee-pwm";
+				reg = <0x0 0x1b000 0x0 0x20>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
 			clk_msr: clock-measure@18000 {
 				compatible = "amlogic,meson-g12a-clk-measure";
 				reg = <0x0 0x18000 0x0 0x10>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
