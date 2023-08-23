Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A1EC3DA6F
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Aug 2023 21:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MD4leCBSoHoMWKoG3hlBUgYLmy4im615wmKBl06qp0o=; b=HIfddkrpKcnxjF
	URCaec6VvUlq94EvMojUh+kpdq94Oil+rv2pEZoB6Dawex4KHmbecnkekGc/hOjKG8HrXOt/5ZbtX
	YLJ425dAoIc+F44jEqq2huLlzLCsxKGaNGZlXCgrn5iIougxaflCVgau8jlmE12bDFA/JhKpoE1x9
	eXARD9uOAhZJh4+EBeMPm07XcpyK+liOUdkHwBv6lY9U1Um7Dqb7TDCzp3t5RDk1vMDmwGqs3wSfh
	qK20GDOSYFs9hbR6kflgaLWpkYFgc9icE3NMfk/37p/A6jdH3xWe8D/xkZ0WUUoSkF0hRtDcqPXCo
	6MdG/K36ukNwTEJzz4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYvY6-001aot-06;
	Wed, 23 Aug 2023 21:37:58 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYvX3-001a9t-2k;
	Wed, 23 Aug 2023 21:36:55 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 2CFEE120006;
	Thu, 24 Aug 2023 00:36:50 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 2CFEE120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1692826610;
	bh=/l6bE+/XrXtEOVGkX/GB5PXGccTEAcvYMkTvkzjC9Do=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=AC9ceuHrbiRHodN9H2wVt5S7KKSyYMsGqnyXXlschSFH0ECfiRqUBCcCtHXpQBgs2
	 960Ld6r7ryhKsrwd0nW7PE9xS2fXpH44VI9lFFcmd7sc8MC8fYaBz++5Jy0t04b2WH
	 AEBfpKK9AkAW357ndj+qsiFmx5+sf9fjg/pVzMAiBU+L3SGJdP7oEoi+Fl3a5w8oSt
	 ewFF7rdXJF+5hmVRijT9iLxHOEGZGft/+FBqARv01VieI1TBklXDXESG55JYnYVx8M
	 0AQFUwzAPAtudFbI5/PoD/FE8EvIFqSMFzpMDUBSeta1+ir4IMxNKKgOceIdpA4qmh
	 ZIzcp8hobXs+g==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 24 Aug 2023 00:36:50 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 24 Aug 2023 00:36:46 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <conor+dt@kernel.org>
CC: <kernel@sberdevices.ru>, <sdfw_system_team@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: [PATCH v2 15/15] dt-bindings: arm: amlogic: add Amlogic AD402 bindings
Date: Thu, 24 Aug 2023 00:36:30 +0300
Message-ID: <20230823213630.12936-16-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230823213630.12936-1-ddrokosov@sberdevices.ru>
References: <20230823213630.12936-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179413 [Aug 23 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 527 527 5bb611be2ca2baa31d984ccbf4ef4415504fc308, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;salutedevices.com:7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/23 18:49:00 #21688451
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_143654_287391_0E3BDBDF 
X-CRM114-Status: GOOD (  10.64  )
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

Add the compatible for the Amlogic A1 Based AD402 board.

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 08d59842655c..15880abb7261 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -203,6 +203,7 @@ properties:
         items:
           - enum:
               - amlogic,ad401
+              - amlogic,ad402
           - const: amlogic,a1
 
       - description: Boards with the Amlogic C3 C302X/C308L SoC
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
