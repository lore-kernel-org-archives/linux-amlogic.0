Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F851C3ABA2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ghv2Dv0GeAMTULO6BYyKrjteFBJFX68OFdRe9dIbGZU=; b=vrhgxju1L/t4c8
	On3fbm4fg4uKw0ZIdjgX1Z0lWX6/9DBj6/NEejIj6PDt1qIPU5utaZQb2nq61kifr7D1ExwmlYoO+
	3vXrzFdm38uzcw7WJp5s5YDw6rPP+DnwByho9GCbehCoXg+zN7MW3SYfinbIUq3BV7tYimRg2Okk6
	uM/1a2YdpZzFf3hbvF6N/PwCQMXlXhS39v6Jm2xW7MT95wVGFR8ekiI5DE/G3FTFWnLxAUlT0/TKn
	BwTYKzrzfjr4J0iFgG5+KZyL/QvHkQgAQ7F3n0vwt03ssiC3w3Q6bCJj3A7NUTYWItyzk5TrfWU5b
	zteiGm5Tima22/ywalYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6sJ-00000003Oop-1JlO;
	Mon, 16 Sep 2024 08:14:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6mu-00000003NCx-1QkH
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 08:08:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42cb7a2e4d6so33958005e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2024 01:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726474126; x=1727078926; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjHvRnnGg0bWNf9pKNsnu85764WCsCk+dDWy1pJT+SY=;
        b=bAfuNd9DeX57bayMwVRmR2//H77bqzJE300GqagIGDMXYUqq88fA2ZvCdkoNs1WOhB
         Oc5BrDUWPw8Sbox4V0w/jkfdIq56WowCtFCSHY70f+cQdMdwsBxu7CfHFMtoLNxsAnsP
         uy2sU2sslgx4aqKn7JiTvTdfXDpLMXuSxZdwdWW/CAHNeeaNcuGWSFrGczmcsIYTolzG
         svt0I+03nu+fi404+t4W6IOtsbAhLnsSECDpapn0n71NHSiMFtNpHiE4afTXduMLrj9r
         uJCJQuFHNxvpx1AR2Ry4lm2NX7Lr56QRBKJ2ftTng0qmArbdeAa68mbNMN2nhLAura1l
         dedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726474126; x=1727078926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjHvRnnGg0bWNf9pKNsnu85764WCsCk+dDWy1pJT+SY=;
        b=SBK+JO0VGoeVKSrcKeVoD+VZpFzKnPUz/rVy1xZGdUIEXnvwxirOB79P83xBx5Kw9z
         nFHjLNaYUGSwfobgjE1RM+qvPbwmfEuMZqxf64qtRQRvoIh4zsPnk2H0eNQp5FK5HT0i
         YWbFrZrgwZWg8GmpgqQSnmOJZeQgql4nb0QHM0lpnwvOFPJ+soo3pI0NzsmyxRzfdPks
         KrCWBCyEw32FDQKWYUZx8MfuVyhG/MQNydXKYE4AewKWX821wPtxazFlRTYtNShqoZ/I
         KVkh3E/u9oIAxuM2vJu9f0nap0ZBmZererjOWU0EhQFIxDuoDOZ9xB8KHyvNZ+A+J8DD
         fJlA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ3TRMkS0YfSin13aNNDquWNZS+H/56vVqkUXWMsL/19oK9fGoh2ITYO6QWjJebBsyNBT1J/brWAi7fNOS@lists.infradead.org
X-Gm-Message-State: AOJu0YxIy7puhWFetDXigp8KFQhzRonOJQdTOwfXn9Ityt3CqTKK/a2h
	MhvH3P1FG8SaFjhN1ZIoOCAVgc9g1qC5D2mYPX1OMDSgj99HjbIJbAd++BXEQ8w=
X-Google-Smtp-Source: AGHT+IH5Z43MBwfJ0oR7s8OXfSkb8OAaelpuDzn1yKcbKhwrYc3YbODjgMPSI1wZr+LELZcpdF8/0Q==
X-Received: by 2002:a05:600c:3514:b0:42c:bae0:f059 with SMTP id 5b1f17b1804b1-42cdb531943mr102665445e9.5.1726474126306;
        Mon, 16 Sep 2024 01:08:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22b900esm69309465e9.1.2024.09.16.01.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:08:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Sep 2024 10:08:33 +0200
Subject: [PATCH v2 04/11] ARM: dts: amlogic: meson6: remove support for
 ATV1200 board
MIME-Version: 1.0
Message-Id: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-4-0b20ed4f0571@linaro.org>
References: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
In-Reply-To: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3677;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=SZYBb5Gb2zyHYcoisQWNTlkCB+hwRbA2qHwkFS7i5yY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm5+eFFhvUQki0w6tRrd2l1gzQUlpb/3hbDUG3jH5I
 LTX5UfyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZufnhQAKCRB33NvayMhJ0Z+ND/
 0SAfO8+X1qM06OGjhuFtpf/fP4LVyI2nXl/PtDn9Yyvv3J1PqnGG19c1lPIFfSrWpOuAY8RuzIGTKm
 JHo5YW/leThE8feMOl/C57ZRuoZ0Dvzfx9KS4CRsGHT71F2NGU/4WbyjTqv22uDtjjpB/5LRKfYy/U
 EwxlVDzfuHEvvpfvqwsz9izCcQ9T2oVztqAVQyGN/KEvvB3r+yKkmpxtgB8xQCX1kl9g7BFJSH8ngD
 E+baT62i8S/eeVYauQDsZpicoQADtbCtKzTZ7IBjmwQ41bDupbphVPu7IHPyKQ4CJdAE8ntkKT0g3Y
 hv47sthPAbNh3Aa+KYtC/TsnOvL8cPCPzV5kCjvASdLl7bJ7qpZwr3leGJhuuoAwSSOLj8+WrDEbtj
 Gtts4thLz0SC4hHiaSlwM5xvpEzWpMk5+LhPgwu6FWOR3KucxHPZfdJnpbjGq+m85Zl6C6RDBFHv6T
 epGCF0fpKx5hqgsxy3kpKzA6mwLdlaSs5b3Yi5YxtgWaCG8XtLZu9Oe/rxNTEQE9XOd5WvAIBHJW+R
 mrDj+C1XB2kKOrWY1/nFOMAMpHoD/Q6AQIHDuZSsBm4RUrJIDM790RVSsxbdgTTVe2d+ZaRr3VV78U
 Hsx/mYQMAk/QwFS3oI5o+2e4lkM2II3cESODCmLTbBVwbFXc/+T+QgNs6RBw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_010848_596965_A2DE7A5C 
X-CRM114-Status: GOOD (  12.22  )
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

The meson6 atv1200 has a lot of dtbs check errors, but since
no active contributor have any boards with Meson6 SoC, plus
no upstream GPIO, pinctrl, clock, MMC... for that SoC either,
let's start decommissioning Meson6 support by removing the Device
Tree files first then remove the MACH_MESON6 in a second time.

If someone is interested in Meson6 support they should bring it back
along with a few more patches for upstream support of further
peripherals.

Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/amlogic/Makefile           |  2 -
 arch/arm/boot/dts/amlogic/meson6-atv1200.dts | 33 -------------
 arch/arm/boot/dts/amlogic/meson6.dtsi        | 73 ----------------------------
 3 files changed, 108 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/Makefile b/arch/arm/boot/dts/amlogic/Makefile
index a84310780ea3..504c533b1173 100644
--- a/arch/arm/boot/dts/amlogic/Makefile
+++ b/arch/arm/boot/dts/amlogic/Makefile
@@ -1,6 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_MACH_MESON6) += \
-	meson6-atv1200.dtb
 dtb-$(CONFIG_MACH_MESON8) += \
 	meson8-minix-neo-x8.dtb \
 	meson8b-ec100.dtb \
diff --git a/arch/arm/boot/dts/amlogic/meson6-atv1200.dts b/arch/arm/boot/dts/amlogic/meson6-atv1200.dts
deleted file mode 100644
index 98e1c94c0261..000000000000
--- a/arch/arm/boot/dts/amlogic/meson6-atv1200.dts
+++ /dev/null
@@ -1,33 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0 OR MIT
-/*
- * Copyright 2014 Carlo Caione <carlo@caione.org>
- */
-
-/dts-v1/;
-#include "meson6.dtsi"
-
-/ {
-	model = "Geniatech ATV1200";
-	compatible = "geniatech,atv1200", "amlogic,meson6";
-
-	aliases {
-		serial0 = &uart_AO;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	memory {
-		device_type = "memory";
-		reg = <0x40000000 0x80000000>;
-	};
-};
-
-&uart_AO {
-	status = "okay";
-};
-
-&ethmac {
-	status = "okay";
-};
diff --git a/arch/arm/boot/dts/amlogic/meson6.dtsi b/arch/arm/boot/dts/amlogic/meson6.dtsi
deleted file mode 100644
index 1c4ea7266f66..000000000000
--- a/arch/arm/boot/dts/amlogic/meson6.dtsi
+++ /dev/null
@@ -1,73 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0 OR MIT
-/*
- * Copyright 2014 Carlo Caione <carlo@caione.org>
- */
-
-#include "meson.dtsi"
-
-/ {
-	model = "Amlogic Meson6 SoC";
-	compatible = "amlogic,meson6";
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu@200 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a9";
-			next-level-cache = <&L2>;
-			reg = <0x200>;
-		};
-
-		cpu@201 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a9";
-			next-level-cache = <&L2>;
-			reg = <0x201>;
-		};
-	};
-
-	apb2: bus@d0000000 {
-		compatible = "simple-bus";
-		reg = <0xd0000000 0x40000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x0 0xd0000000 0x40000>;
-	};
-
-	clk81: clk81 {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <200000000>;
-	};
-}; /* end of / */
-
-&efuse {
-	status = "disabled";
-};
-
-&timer_abcde {
-	clocks = <&xtal>, <&clk81>;
-	clock-names = "xtal", "pclk";
-};
-
-&uart_AO {
-	clocks = <&xtal>, <&clk81>, <&clk81>;
-	clock-names = "xtal", "pclk", "baud";
-};
-
-&uart_A {
-	clocks = <&xtal>, <&clk81>, <&clk81>;
-	clock-names = "xtal", "pclk", "baud";
-};
-
-&uart_B {
-	clocks = <&xtal>, <&clk81>, <&clk81>;
-	clock-names = "xtal", "pclk", "baud";
-};
-
-&uart_C {
-	clocks = <&xtal>, <&clk81>, <&clk81>;
-	clock-names = "xtal", "pclk", "baud";
-};

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
