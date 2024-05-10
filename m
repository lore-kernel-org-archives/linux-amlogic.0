Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAD4C25B4F
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2024 09:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJAXSAoifdg7u52gnqZFNNMkkOSLvH898oqqbZdMrBA=; b=c46tm0z98wddNb
	pJ5fxXLEt/LgReadJj+IutxX9wI+WbS/DvYMo8nd/nBtkR+A2+Vx8D/CqhM5fxecLDa8ZnhU7lI36
	Zd2xUKog9GrbQiZa5HlLtYsMQdOUOgBK+sTyQdF9qxbxFDfPBHMXONIo5nf8XMe0gOdTk7UI2yTwW
	JOf+yQ0T2nhZHRCByBwgIDfRA49elSYMZCnwOro28Bvn1f3Ml8xvH/YCSOYrPj/5xoZRKOj7HzgLi
	fDVZpo7P/neva8RdE5PZML4oi2IflyLv/4W/+afbV/NP2K/fZ94JEYaUjK0oeWViXH7YQUiUdTiQx
	SQUk1EN6E15AaH/Mvh0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MKB-00000004e7j-0OOn;
	Fri, 10 May 2024 09:13:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MJO-00000004dUy-1ltX;
	Fri, 10 May 2024 09:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Qg4pXQQl5Lta582hsxBt1jkX2lzQKNXAMhqzfSLdzUI=; b=JDP1JspCBjfavCcB2gqf5iCuqu
	RcHAYCDdpjskcW/sbYOWrF+gf62r8J02YRdF/x2IGe1Isli4slnB3zKUSXLS5QqLB46Sf1MwB73Eg
	gYdwyYAHM0ZJghCxY+HKAGQl124vFAEzbtE8Azd9vJcYGrKSszxRMsXKJETLW+SbPQLuQ58zi64BX
	ysElhnuc906odj3GjK8jkI0bTenfewc+iZJWFKBZgjIsUBJuQ4qAFJkFVeEQ/c/UWN5rz7jjpihGX
	Zsd23FUSHDh6/FMnABgz/rJJmDRwq0idq34SyWJ8JNtH7dnzzFInaYvjUCPLS0ObGdUC3SycAYQMl
	sNlQkPBQ==;
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MJK-00000003KQn-0mDQ;
	Fri, 10 May 2024 09:13:04 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 3D0C8100007;
	Fri, 10 May 2024 12:13:00 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 3D0C8100007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715332380;
	bh=Qg4pXQQl5Lta582hsxBt1jkX2lzQKNXAMhqzfSLdzUI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=BZgcQ6Cq/su+5ejJmXEURFGJdKwzScavwUXNFiZQu/eT3oteTQ1YFAS8R9N53ZjMZ
	 F/CQnSED1jjoi9RQCQKDUDOVqN3z2pOGvzDsej5Fqnd0REFVlRbO3Ca7nK9Mj54Q1i
	 OZAUz7xGiHE71rE7Gwr+XZ5E8mdT/U+hBj0Oz0a5bD5G2NCI28bEL+OFPXqnMnbwYH
	 fjRgdJ1ewNXGkGJHRERqp0H9w2lJcIwIVzxZhmNEIEDtL9JMgFGB7/8D0NriuX1cUI
	 FJST16/Rhfc5WK9uhS5P9gVshyKGKpSIoCdZqzmmDxlVEK0NU+bt5OCZ6JZlICtRHR
	 xtZJrPKhxygTg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 10 May 2024 12:13:00 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 10 May 2024 12:12:59 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
Subject: [PATCH v2 2/4] arm64: dts: amlogic: a1: declare cpu clock controller
Date: Fri, 10 May 2024 12:12:24 +0300
Message-ID: <20240510091251.20086-3-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240510091251.20086-1-ddrokosov@salutedevices.com>
References: <20240510091251.20086-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185158 [May 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/10 07:36:00 #25144647
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_101302_506200_FAFDAAA1 
X-CRM114-Status: GOOD (  11.20  )
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

The Amlogic A1 SoC family relies on the CPU clock controller to generate
CPU clocks, serving a crucial function. It has 4 inputs: main
oscillator, fixed clocks and system pll.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index feed2bd7ae48..afb5d7361177 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
  */
 
+#include <dt-bindings/clock/amlogic,a1-cpu-clkc.h>
 #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
 #include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
 #include <dt-bindings/clock/amlogic,a1-audio-clkc.h>
@@ -94,6 +95,19 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		clkc_cpu: clock-controller@fd000000 {
+			compatible = "amlogic,a1-cpu-clkc";
+			reg = <0 0xfd000080 0 0x8>;
+			#clock-cells = <1>;
+
+			clocks = <&clkc_pll CLKID_FCLK_DIV2>,
+				 <&clkc_pll CLKID_FCLK_DIV3>,
+				 <&clkc_pll CLKID_SYS_PLL>,
+				 <&xtal>;
+			clock-names = "fclk_div2", "fclk_div3",
+				      "sys_pll", "xtal";
+		};
+
 		spifc: spi@fd000400 {
 			compatible = "amlogic,a1-spifc";
 			reg = <0x0 0xfd000400 0x0 0x290>;
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
