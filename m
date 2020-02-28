Return-Path: <SRS0=AcXA=4Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B5BC3F2CF
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2020 06:13:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A34902468A
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2020 06:13:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="peWB+ANy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsxo5mfK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A34902468A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=y/wf2T0wc4M0GBDxue2E/6UH1wC0SOfuD5H66vuIdM0=; b=peW
	B+ANyqZ1vOcnFJBSCIr5WQ+tnLPIE6XX7dqHitODThWa7KQ2iiIPr7Us9TZL5cvCHXmp+b1X2PUo1
	OcW7zHbOjXXHMbhb/b0m+iS1+ptkTZ1top8NzeXaqbM2oPu8OFC2QJ1sWodrIZbQXKSrLK0fUI40J
	q2V+fXe7sI3n9VXiEPYKJSjP0wOhVqji2C9Q4U7k5GkSz8O3Mm8VbRlX3ieu0Qozf+6Q8uYrFe20U
	npspNQBPs0lO/sNyatj3DB01MyWBoVOzZdLcuxMbxtyyMgffMmKiXtjqGx+zTE9BfQHEKPaIbeUVE
	CeNdXjW4XFT2DCV0hf9IxqKgHWG9JBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7Ytv-000059-2i; Fri, 28 Feb 2020 06:13:31 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7Yti-0008OU-RE; Fri, 28 Feb 2020 06:13:20 +0000
Received: by mail-lj1-x244.google.com with SMTP id q8so1981697ljj.11;
 Thu, 27 Feb 2020 22:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7dy/Kujh8oupW/pVHgPs57WktyNPAbW19eFPb391nVY=;
 b=fsxo5mfKJg6j7cF0VkdAc/Hf3t4sJlFk33XPf59uRYualOkUrk/UJzxZ7KWH04ia5n
 xj09T9DCmsQsThEtDPqXm6TCNRL/V0/Lo5ep2lfIavLQJo3HYvJKrTSzdqx/Yzf5mO00
 VF7rP+MEuKyBGOJkzXioIcKPm3D4Bd/8L7gC18p0gjCpv47SQ7fmbsA7MChCo3obBPzc
 cZHCMZpRZKtIIDnVpEcx/ZiwPUmgcs//DbDVz7kuc/Fsh19/Pip/fLXsvHsw4p91DTD4
 JHfZNCChQdQ5o0KyQF7A4LgJmrUTZZks0/rLgCEwkJERmzE26+Ey7oxRSzBYMq74e4ae
 u+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7dy/Kujh8oupW/pVHgPs57WktyNPAbW19eFPb391nVY=;
 b=YGnQu2B7ySgg464ArkMWGFm4O7iYR4635w6Elnl29s9VT+uAS8V/2CsrsceJoeDmlT
 UFJ6fAeJMPfk6bKTz6WTxffQO+0CGDI/9WRUykUh/fHQZYCbD61bi1KJgELtgVJGA/4X
 jdhz9HEp6ayKpD6gze3+TwybPvXyH4QVE3vckPip4CxULGB0xLUH2bStgygNsYlN4TNv
 9rAXzp4FPdXEEZjPvj9vLR+0aCsJu43P1igyPgIm107sxcMyyCwvlkneKMRDUipntG5k
 9Z1INaqFQe9h2UeEYJUSb5Excj/4waEbCsJOW/UWP4GXGngtVlbCveONiD6zFnpozSj7
 DDAA==
X-Gm-Message-State: ANhLgQ051CYed9wvxbM4Fx0/Ge8rKJsLm4oBHvq1j/ItF8mnihrGYEq/
 w3uTuOPVhCHd+M0ApIrcurI=
X-Google-Smtp-Source: ADFU+vu9lkUYGTP4dyLaBRdQUY25f/Yt3QOACVP1pzgNmvrwnRgocQ5ZZOd/qLXvw4ZmQ/Mhq32Jtg==
X-Received: by 2002:a2e:9a93:: with SMTP id p19mr1812515lji.177.1582870397017; 
 Thu, 27 Feb 2020 22:13:17 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id f14sm4149299lfh.40.2020.02.27.22.13.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 27 Feb 2020 22:13:16 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: add thermal zones to gxl-s905x-khadas-vim
Date: Fri, 28 Feb 2020 10:12:26 +0400
Message-Id: <1582870346-74145-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_221318_881965_01626778 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>, Nick Xie <nick@khadas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add thermal zones to the VIM1 board, copying the zone config from the
existing VIM2 board.

Suggested-by: Nick Xie <nick@khadas.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 440bc23..2c198c4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "meson-gxl-s905x-p212.dtsi"
 
@@ -63,6 +64,39 @@
 			};
 		};
 	};
+
+	thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <250>; /* milliseconds */
+			polling-delay = <1000>; /* milliseconds */
+
+			thermal-sensors = <&scpi_sensors 0>;
+
+			trips {
+				cpu_alert0: cpu-alert0 {
+					temperature = <70000>; /* millicelsius */
+					hysteresis = <2000>; /* millicelsius */
+					type = "active";
+				};
+
+				cpu_alert1: cpu-alert1 {
+					temperature = <80000>; /* millicelsius */
+					hysteresis = <2000>; /* millicelsius */
+					type = "passive";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert1>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
 };
 
 &cec_AO {
@@ -72,6 +106,22 @@
 	hdmi-phandle = <&hdmi_tx>;
 };
 
+&cpu0 {
+	#cooling-cells = <2>;
+};
+
+&cpu1 {
+	#cooling-cells = <2>;
+};
+
+&cpu2 {
+	#cooling-cells = <2>;
+};
+
+&cpu3 {
+	#cooling-cells = <2>;
+};
+
 &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
