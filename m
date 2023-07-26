Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD16C001B0
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jul 2023 11:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7djtz3Tx/gDWJj4s9kwEqGl7pA8BcmipUpGOxmn/PQ=; b=mCEt3xWAOTKefI
	oWOmsv7HlApUjp+0WjNPY4FDLlZ8YKVWAVJHGoCpVH1DzkgeEHSf9i+7GFosXcH9kPQmo2uPeXPsy
	HNCnxfi8j4z+Da6YY6kUmNhyRDKIRPWdafTNdDegY12nw/28mczGOYo7cn5xi3tyzcGNvzZE98Gr0
	gNPDvxEsm1mMwksly2xE2wPd3ADc8/mp/dpXTdfyw5VAVABJFUn+Rbcy6R80zqcObKVyBZqZRrQeB
	tsVWoy5LAAg3Cvspe2EsHAMY3a2qMl0j8jX2PpACzFm0Tj/Yi2vp74IBz0oitXCNj7/+YbDR24fTW
	0XKUFGzV0Ygvh65V2N4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOd7Y-00AGB6-21;
	Wed, 26 Jul 2023 11:56:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOd7W-00AG9H-1e;
	Wed, 26 Jul 2023 11:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VhboGLS11TzUzKPRjVJn6O99zy02+RjKyU78MoSm4AI=; b=na9Zug3UMGZTC+XrRe0fRBxMjY
	Q7UdyjUv+NyzlHholKg8Sc7BnVlV46sHiLljS/PWolJzb+Wy1vrcnD7Dr6K3knPR2fpaYupsZv9Bf
	8Abmo1UEXtRyy5xxYYybr83yu+JoSZ/z8LoVUmTmv88q1py8rGJOfw7J2aUgQvnpjaI2EROifsKXA
	eO4lmz0/NGMYbH0uFbkid4gjxZMQiyIph0J/5IS/u1V9og/RIW7HWH4aqTYbIEMrGN1SvBuVFmF/a
	BeEDKT05Tj60GewHzq/KMYcefjByo/E2v+wIorPID5D9/WXp3Q/mq0rzJGRayoxoNKalywZJY0BFy
	226W3fkg==;
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOcbX-005pDe-05;
	Wed, 26 Jul 2023 11:22:56 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 26 Jul 2023
 19:22:10 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH 4/4] arm64: dts: Add watchdog node for Amlogic-T7 SoCs
Date: Wed, 26 Jul 2023 19:21:46 +0800
Message-ID: <20230726112146.1127145-5-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230726112146.1127145-1-huqiang.qin@amlogic.com>
References: <20230726112146.1127145-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_122255_216450_77EBE61A 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
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

Add watchdog device.

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 1423d4a79156..6e34d11214b7 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -143,6 +143,12 @@ apb4: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			watchdog@2100 {
+				compatible = "amlogic,t7-wdt";
+				reg = <0x0 0x2100 0x0 0x10>;
+				clocks = <&xtal>;
+			};
+
 			uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
