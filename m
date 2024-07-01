Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CB4C3065B
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2024 17:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jYp/FHNbBsXGZVbanx1hASLlfYRkNMJD7T8dSQeuPTU=; b=UMIKTJobYYfo6m
	7y7en2zi9fsOGxHKbkKnnTOsGNqxya3ugbDrZA8my8SO3TJo8QqaAqA8e0yIJa5WnAId8rSl85EfA
	1RKLPETzlf1McNXbilLi0RimrCubJ1ftlfZYTF7Ca7OCOk2TQImLuw6ZTmfcqfXv1J85AhHbFVUaY
	t7spgZw4sXUVDRL/GxERRqvTSMCO9OoTX9WIx0UZe3gsQSeKuKk7bIQyHLtAYtc9sG6FBQmNxCxUV
	vbJe6UqEyrb0rL7aOBmOTgKSDF7rTrQlRYWZg8tOogL/0p80s3TtU9FGc2tDNXZ4u3h07/uW3lOfu
	8258nHn42XuaBxQdktzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOKhc-00000004Hxg-1IGR;
	Mon, 01 Jul 2024 17:20:32 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOKhY-00000004HuO-2qY8;
	Mon, 01 Jul 2024 17:20:31 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B9F1C12000C;
	Mon,  1 Jul 2024 20:20:24 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B9F1C12000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1719854424;
	bh=MVrEHcT3w02APU44tB6WifIiHTjFlslKUbhO+5L4/wA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=OjvS0KAdRHucfTWybqd5mlVuBALqzpYPe5zNyxAuCiMEjGtU47J9QMAF4+hZrUc+4
	 +PJseiFkhtdIMU8JXJZvJdTZ5FepXZNdNwiLLvC+DNHmO+9/txib3lmrTtk8ZRh69B
	 3jd1/GMUVIUm4PaUGMyc/Y1X8ZAvXwqJWFXo6Uvs0Fl+LbnZyohw9eQXPpfbFuWpDD
	 zicYQ7KOgAEi9GoNAAB0R7oTgu0IJldVaGp4RJ5zeHNyZFf7kwnzq4jPnxgfj8mNkP
	 fv09zpI59Dg8BnPvlT8sHKBYSUJIPeFEJssYw5qHkPDqVDZr3OIbn3EhBCvm+21Vyc
	 1lVz3H3zhyWiA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  1 Jul 2024 20:20:24 +0300 (MSK)
Received: from work.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 1 Jul 2024 20:20:23 +0300
From: George Stark <gnstark@salutedevices.com>
To: <ukleinek@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<hkallweit1@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>, George Stark
	<gnstark@salutedevices.com>, Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: [PATCH v2 1/3] dt-bindings: pwm: amlogic: Add new bindings for meson A1 PWM
Date: Mon, 1 Jul 2024 20:20:14 +0300
Message-ID: <20240701172016.523402-2-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240701172016.523402-1-gnstark@salutedevices.com>
References: <20240701172016.523402-1-gnstark@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186247 [Jul 01 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 21 0.3.21 ebee5449fc125b2da45f1a6a6bc2c5c0c3ad0e05, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;100.64.160.123:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/01 15:14:00 #25789329
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_102029_421862_385946DA 
X-CRM114-Status: GOOD (  10.29  )
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

The chip has 3 dual-channel PWM modules PWM_AB, PWM_CD, PWM_EF.

Signed-off-by: George Stark <gnstark@salutedevices.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
index 1d71d4f8f328..da22cb3ed878 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
@@ -37,6 +37,10 @@ properties:
       - enum:
           - amlogic,meson8-pwm-v2
           - amlogic,meson-s4-pwm
+      - items:
+          - enum:
+              - amlogic,meson-a1-pwm
+          - const: amlogic,meson-s4-pwm
       - items:
           - enum:
               - amlogic,meson8b-pwm-v2
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
