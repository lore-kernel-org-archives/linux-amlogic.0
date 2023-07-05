Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12CFEB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jul 2023 18:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSHZlxUyP3kpZFfm9KfImD0HkwY5DKsJ82gxJ9X473A=; b=IdsXG20X0Mmfe7
	hkPAOJTI2uVBMgXHrDESSP2+HIYiUrdnL5AY3TQDzRWV1kEnt+0arwzGIUyuVqZ7JsNkp1w+K57Xe
	QerqEYDNZTT/DKareI76MJEbmBTao9+OJlaL0tpU6o5I1pk1JepyYLISl9LxNivXSpibasOznIf8k
	RKL4WE7cxXnjbbnVCSnWUd4fM69MaGIkEJm5ARbrh6OGkqp0a8PVc4W7Jg5wxYJbCJGvlIcyNYQ1X
	aF8b2zZquyemux9dvtyw90kQG5Pil3WaedKWwXt5J6Y3g/zrkQuZ9S3FXbY2RuaXVZy2tiduZTwie
	9jYtFQNBTeblH8qJQW6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH75k-00GjOn-2d;
	Wed, 05 Jul 2023 18:19:04 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH75W-00GjEq-1h;
	Wed, 05 Jul 2023 18:18:54 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 114A810008A;
	Wed,  5 Jul 2023 21:18:49 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 114A810008A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688581129;
	bh=SVqe3A4FxeAdixEi7Nd7L65hAuANY8HEBhEw2Kj2u+8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=WHiJoQEoJApoLtBEzj03EJrI6awNmuGRtUyYBEpNbNn8VKD5kj3Uz+MydQTEb32Je
	 BFnt8YM5M778FzibKRA8ii/F2Qcdq+5/Ost7LLg7T6HBkCmpkXJG9MJQHF91/7dSCE
	 4FKS4cFcggNYWG1+DziLfxB8GIBF3+Q+pPFT3O6rSYh9h1bayvtgqF5ziAALyJDLFl
	 2v0289b8q44/EYA4drx8anDifV5LQ8oXtU+qpevAYFXFzHAC3PqbtVs2/7iDWaZA+u
	 wPKhXNm3w0rj1XqnEH3gMeMWItpaFjj+XcO21UkQB/W1JyMjpO8L+Nl3k8FjOf/OXj
	 2uxHbPLnwAfgA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  5 Jul 2023 21:18:48 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 5 Jul 2023 21:18:46 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <jbrunet@baylibre.com>, <jirislaby@kernel.org>,
	<khilman@baylibre.com>, <martin.blumenstingl@googlemail.com>
CC: <kelvin.zhang@amlogic.com>, <xianwei.zhao@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-serial@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>
Subject: [PATCH v2 7/7] arm64: dts: meson: a1: change uart compatible string
Date: Wed, 5 Jul 2023 21:18:33 +0300
Message-ID: <20230705181833.16137-8-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230705181833.16137-1-ddrokosov@sberdevices.ru>
References: <20230705181833.16137-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178461 [Jul 05 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;100.64.160.123:7.1.2;sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/05 14:57:00 #21566867
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_111850_943739_34DD7F27 
X-CRM114-Status: GOOD (  13.50  )
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

In the current implementation, the meson-a1 configuration incorporates a
unique compatibility tag "amlogic,meson-a1-uart' within the meson-uart
driver due to its usage of the new console device name "ttyS".
Consequently, the previous compatibility tag designated for the
'amlogic,meson-gx-uart' configuration has become obsolete and is no
longer relevant to the current setup.

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index c5567031ba12..6273b9c862b3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -344,7 +344,7 @@ mux {
 			};
 
 			uart_AO: serial@1c00 {
-				compatible = "amlogic,meson-gx-uart",
+				compatible = "amlogic,meson-a1-uart",
 					     "amlogic,meson-ao-uart";
 				reg = <0x0 0x1c00 0x0 0x18>;
 				interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
@@ -354,7 +354,7 @@ uart_AO: serial@1c00 {
 			};
 
 			uart_AO_B: serial@2000 {
-				compatible = "amlogic,meson-gx-uart",
+				compatible = "amlogic,meson-a1-uart",
 					     "amlogic,meson-ao-uart";
 				reg = <0x0 0x2000 0x0 0x18>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
