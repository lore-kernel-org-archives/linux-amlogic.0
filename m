Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3856C001B0
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jul 2023 18:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xac3171ts8JH6yMEiSRTe31Yo2EAvd7grt0eLzZOAkg=; b=CFHuR8mYiXvdUA
	InlYGIzYBaAo4Xb9LVM+f37zX+5wMWVx51BXV/XcBs0H6FbfL8W1qhdysYBr6y/cCc6JsYXHVImFi
	oAdgB25MxUpvGqlkHuZX5r1PzaKJVRIs31uO1OJ4cNbzAmNbB/+6ONOvHLeQZpuJfwN21BXenzdHZ
	s5j//bHLVwTNVdWqsGODtQLce9TXHJnzKn2vOo6a8wQ3dq0hiLPNXFVscFmCAIN7xIf0VAvyQuEob
	Rj8+1BWbE3elsefoV+wgfSSu7+KCw4Zhc5zUceLPVfvMUpJYCTkQ8Cy98seSf7RApYaWluzWHBje0
	NVs+Oqubbb4v0Oe3NAuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH75d-00GjIo-0m;
	Wed, 05 Jul 2023 18:18:57 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH75V-00GjDS-0c;
	Wed, 05 Jul 2023 18:18:52 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id A87C4120072;
	Wed,  5 Jul 2023 21:18:47 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru A87C4120072
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688581127;
	bh=dFRSuVZiYwDdVCYDf8lScbiLvLEgKBhX1VHxXBr3arc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=cNsMGvyLTh7ygX0RBtlkGSvYULyqDP4PeCpzgueTC/FTwnlsnI5Ej/9pKJSFkV9Po
	 s/RJuXwWWTyffhy3RPUbi2k+1e88eaItXISuZLEIFrQTuGHnQOaR2ApWtjZGdoN4xn
	 +e86rfMxRL+ajNO+5G/39wut7rsMifLf/MssGVbt0FpKun0J/2IP0bsMHTEgCl3qrC
	 sKyz2VUWHLLkUznBBC3kHmh1rIgjpF2A8dK77+llbk5O+kCNN75T3RvHcfWGkOuXUR
	 AAITh4irSKUnsfn7hz9SAZ8y787vdtALakp6V5w9XyS+MzSjXUBcIFZwVO6hc0N1uf
	 0xT9PjQjv4fGg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  5 Jul 2023 21:18:47 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 5 Jul 2023 21:18:45 +0300
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
Subject: [PATCH v2 6/7] dt-bindings: serial: amlogic,meson-uart: support Amlogic A1
Date: Wed, 5 Jul 2023 21:18:32 +0300
Message-ID: <20230705181833.16137-7-ddrokosov@sberdevices.ru>
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
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/05 14:57:00 #21566867
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_111849_598541_299FF51B 
X-CRM114-Status: GOOD (  10.62  )
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

Introduce meson uart serial bindings for A1 SoC family.

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 .../devicetree/bindings/serial/amlogic,meson-uart.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 01ec45b3b406..f1ae8c4934d9 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -33,6 +33,7 @@ properties:
               - amlogic,meson8b-uart
               - amlogic,meson-gx-uart
               - amlogic,meson-s4-uart
+              - amlogic,meson-a1-uart
           - const: amlogic,meson-ao-uart
       - description: Always-on power domain UART controller on G12A SoCs
         items:
@@ -46,6 +47,7 @@ properties:
           - amlogic,meson8b-uart
           - amlogic,meson-gx-uart
           - amlogic,meson-s4-uart
+          - amlogic,meson-a1-uart
       - description: Everything-Else power domain UART controller on G12A SoCs
         items:
           - const: amlogic,meson-g12a-uart
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
