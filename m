Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E3BC54E64
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2024 13:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T4nWX0YkyFrjZO26rTRHUY3LRovJUJyj94Lv+LJrYmU=; b=ZXJ6aoSf1J/Br2
	90SRff1UKpEplO8JIP8XSjzNqJOFyeAV2IU5KzWipBc6pdoNDMNDa1MWtg03K5rBurGESZpfsl9Nc
	LrwJ7mfZi3jnw8gy/YBRyNf3EmtgTy5bgW5NI6OlcJXTyF6Uhzk4cAO8w56wMIeHlYnxyQGNzd6Wr
	JhrYTHOHDPN1hR6ciTAOU/g7z5i95oSt8Uu8jb03rNkRbA2nq7p1/i9DyXC+4CROmGJOo9kWL0zuW
	wt3yjscteSqKESm7eCZ5KUDkLV9paDV3Ul8eFF+0ChnR7RsmeFZU9mL28jqlzyuQASmSL11heJ/1d
	BS4WwwSbPv4juCc/UIQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpq4S-0000000EAeu-49rC;
	Thu, 28 Mar 2024 13:45:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpq4Q-0000000EAcu-3trJ;
	Thu, 28 Mar 2024 13:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9CPwvn2kpzZJnAOi5N/hirprKnzIWIB81uV2cDqMcbY=; b=WcX8JMF7q1YDUCiEW2Uv/9f98g
	fnwLelenDyubwZbTuTw7cfJBtx78+yYpnjFrWHaIS6f+aSuBkyHCI3ixYW13ICidkt2NOIoyB7+Uv
	8FWTVEzvklGL+ajCh5FPY407yUQ+ASMgcZ+35/Q1lwlrBWBlj/xghRU3J57sureVNTU/FwoZ2QR9d
	eChDwpJkKYyQ/gQHucSBJCT8OFv7wgs5W/0BtWCCsQXFIN3Zq6MUauyJXxKIZ7drsGNTV0jh0ExxY
	DSxIo7cFAo/dy7xzCZpl19LJKELewQTqM2A8/nxscMUHDfAsY5Xp3KH26JlS8q7Zu+pgImWdNWARJ
	AwObEMgQ==;
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpq49-00000000zH0-1FQn;
	Thu, 28 Mar 2024 13:45:16 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DEACD120016;
	Thu, 28 Mar 2024 16:45:10 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DEACD120016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711633510;
	bh=9CPwvn2kpzZJnAOi5N/hirprKnzIWIB81uV2cDqMcbY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Go1erYTunGWvX7kXxUqgYWpokLxLg2Tn8v944gydddoaNTsIwlux/pfO3yf2jM6G8
	 f0szahcr3BbVsjl4colW11N77vk4J08U8ZCJJ2KQ9/pnpRv781I4iH511Nvgr75Qtx
	 CPvbAKlfdlrwQYUVkRdm2qquXjc5ialGip84yKm9+QL5UBTL0KJScZHM2zzWv4nc02
	 CzjzMRfWlF+2w1HUDy+tEAAklu34YVcUlv1tVQS1HwsrpL4tkiyraaiH0xorb/f847
	 scbGmi7MNCvB16CPhmHoP10yiUPiGBLS5BtbOV8rKG3C8oF780j0uT0DcJXX8NxJYr
	 IY65bM50ih6rg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 28 Mar 2024 16:45:10 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 16:45:10 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <glaroque@baylibre.com>,
	<rafael@kernel.org>, <daniel.lezcano@linaro.org>, <rui.zhang@intel.com>,
	<lukasz.luba@arm.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
Subject: [PATCH v1 3/3] arm64: dts: amlogic: ad402: setup thermal-zones
Date: Thu, 28 Mar 2024 16:44:39 +0300
Message-ID: <20240328134459.18446-4-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328134459.18446-1-ddrokosov@salutedevices.com>
References: <20240328134459.18446-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184470 [Mar 28 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/28 10:33:00 #24492761
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_134514_026771_01A2249C 
X-CRM114-Status: GOOD (  11.34  )
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

There is one thermal zone with 3 trip points: soc_passive, soc_hot, and
soc_critical, as well as two cooling maps.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 .../arm64/boot/dts/amlogic/meson-a1-ad402.dts | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts b/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
index 6c02301840ff..2d22e8b45c6d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "meson-a1.dtsi"
+#include <dt-bindings/thermal/thermal.h>
 
 #include <dt-bindings/gpio/gpio.h>
 
@@ -177,6 +178,50 @@ codec {
 			};
 		};
 	};
+
+	thermal-zones {
+		soc_thermal: soc_thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			sustainable-power = <130>;
+
+			thermal-sensors = <&cpu_temp>;
+
+			trips {
+				soc_passive: soc-passive {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				soc_hot: soc-hot {
+					temperature = <85000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				soc_critical: soc-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			soc_cooling_maps: cooling-maps {
+				map0 {
+					trip = <&soc_passive>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&soc_hot>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
 };
 
 /* Bluetooth HCI H4 */
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
