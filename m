Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DDDC531DC
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2024 15:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pgwJUfoJ114I9m3CeQCc7RlfG8hwgpNBFw5tPlQcgaE=; b=zyfPtR5L6JaGOI
	dVex3OInP47X3d2xolHdQb+uye635Y1Qj0JBLxPx49SybOBqMTrNAL8IO2EETTww2xOJ9NAwiaSwB
	l3SsFgcKFI8xLT2yNstRh+FLwd//CgHic5sSrXGWjZoyueZACpHUoju04j2Y8lx1eRMrOhUMf7frw
	DwmFAtcluhq/itil2DinP7wxBMLh8ghTosWfeIF6HmSX4PZn+VfdjW8qpp50ohvF4t7xApQIHCsCI
	8md8e0Zcwl9lrs2DRBoc41FavxLsM6ruIJbPbaoZsZRz9A+eTR51K82QJgX3IwADAJKF6sM8ZIgKT
	EjYMMMfVvLquEtU83vPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQUX-00000005jOm-3fdv;
	Tue, 20 Aug 2024 15:09:49 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQIM-00000005fSl-1B8u;
	Tue, 20 Aug 2024 14:57:15 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id DFA47100036;
	Tue, 20 Aug 2024 17:57:12 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru DFA47100036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1724165832;
	bh=1N6OdtLrU8I/bH2Q/9Je2zQ4wcksMaZ86n0y3ecnQ04=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Nt9JJkHFdC1vx6IG3vYhp+HPEHxQPaTrZKgC4PDsA9vUFzeQnjpogB0Gdex6ofNZa
	 8BVJz0R3Mgg4hHzJ20KC0jD6YgYtp4+a4M/HdRotbOgzZjVBVfaPbvfmD7adYx4Di0
	 fgnXdK+sgfM8xFpf6piGmzTUWfO8xzTm4o3by9/1GF64FlmkUOlH7hd1VwwYv1J85E
	 KviRWZDBct1dOJHSXxjQH8R5M5Rmej/N5/YbiVHRbkm+a4kkhwWNNwbJ9Y13VWUxk8
	 6cjHXSyiN2lXvqeem8V437OkOAn0SOspZx+9XnQ9ZZ8BiP+1y1XGTi0DSTZeIwxx/I
	 llStjoEB+ooqg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 20 Aug 2024 17:57:12 +0300 (MSK)
From: Alexey Romanov <avromanov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <clabbe@baylibre.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <vadim.fedorenko@linux.dev>
CC: <linux-crypto@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kernel@salutedevices.com>, Alexey
 Romanov <avromanov@salutedevices.com>
Subject: [PATCH v9 20/23] arch: arm64: dts: meson: a1: add crypto node
Date: Tue, 20 Aug 2024 17:56:20 +0300
Message-ID: <20240820145623.3500864-21-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820145623.3500864-1-avromanov@salutedevices.com>
References: <20240820145623.3500864-1-avromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [84.252.147.252]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 187181 [Aug 20 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avromanov@s2b.tech
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 27 0.3.27 71302da218a62dcd84ac43314e19b5cc6b38e0b6, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;s2b.tech:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/08/20 03:45:00 #26365304
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_075714_686573_28AB030A 
X-CRM114-Status: GOOD (  10.47  )
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

This patch adds a crypto node declaration. With the
Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 42cd5381bad3..89dd09b9f231 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -162,6 +162,12 @@ spifc: spi@fd000400 {
 			status = "disabled";
 		};
 
+		clk81: clk81 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <64000000>;
+		};
+
 		apb: bus@fe000000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xfe000000 0x0 0x1000000>;
@@ -972,6 +978,14 @@ sd_emmc: sd@10000 {
 				status = "disabled";
 			};
 
+			crypto: crypto@6000 {
+				compatible = "amlogic,a1-crypto";
+				reg = <0x0 0x6000 0x0 0x48>;
+				interrupts = <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clk81>;
+				power-domains = <&pwrc PWRC_DMA_ID>;
+			};
+
 			acodec: audio-controller@4800 {
 				compatible = "amlogic,t9015-a1";
 				reg = <0x0 0x4800 0x0 0x14>;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
