Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F67C001DE
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jul 2023 14:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMHGvPz9yv6f9GfmdHp3FXW0AMe0JmbYnUQn2Q4gp/8=; b=DnvZZJ5YIIzwsb
	3shQOuWaHsJY/MQEfvvVHN5GlUUoV0h8qWuU/UIefZNXOsG8UWVCcwvJL/KA2tmEfY9nBXiHjYmet
	OS9whLSizCEkTuRhDuQs8NTVREwEYUEE7Ix8TzX4aBUSEd2WfcHUiPb/zFbqAuMZ/h+HW7xc2zqz4
	0xJKh58gbn2kSp1Zm5/NII61aFc0vfBGS9uzR84TB2aFwBJDzjombAzqWzLKwp2BWke+l+OcVN04g
	MZXe7q1hxh/QMNjg6MrTYy2pOHI7xD5SZif3k1dNvjEHf6rpl4/M1yyiLcwuzO8vY/VfG7w6IOxme
	dQ26vXXGewTi57dplJMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOImx-007kGd-1J;
	Tue, 25 Jul 2023 14:13:23 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOImt-007kDG-2h;
	Tue, 25 Jul 2023 14:13:22 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 233BE12002C;
	Tue, 25 Jul 2023 17:13:08 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 233BE12002C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1690294388;
	bh=6myps1HXZYmue0aJgbKQCN4BRm8x3qGkis7uH4bm6UY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ON6BmYwlpB7VAb1NJeOhtAIQl2WrX8fPTc/3DWQnh4+4iBdJovlmUd3Hmzc814zwt
	 A6VIr3dCqTT8A7AvL3MUOYpSTHyyf0Gx92iSpfvfMouxkIrde7ykdLsxIzaU1aQ/vr
	 kfby2J+g39dXmurX9+uhGa+lq1OY/8VySPYad81dlpcRT22xAkiLZhKwTPs22QZGoM
	 N0Y+ttlZXz7RVGA+M+2bScCERxPynyAvWCew93Hbtp+wRXsxytR0NlugjjiNv6VFfE
	 5CqbX6qpBRcv8zH63Vay7m6aG86Ng51sAIpnPHGz4pZjFv0kutdvsyxaMh8146XR73
	 zMUCL9V+mNiYw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 25 Jul 2023 17:13:07 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 25 Jul 2023 17:13:06 +0300
From: Alexey Romanov <avromanov@sberdevices.ru>
To: <narmstrong@baylibre.com>, <neil.armstrong@linaro.org>,
	<olivia@selenic.com>, <herbert@gondor.apana.org.au>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <f.fainelli@gmail.com>,
	<hkallweit1@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<kernel@sberdevices.ru>, Alexey Romanov <avromanov@sberdevices.ru>
Subject: [PATCH v1 2/3] dt-bindings: rng: meson: add meson-rng-s4 compatible
Date: Tue, 25 Jul 2023 17:12:51 +0300
Message-ID: <20230725141252.98848-3-avromanov@sberdevices.ru>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230725141252.98848-1-avromanov@sberdevices.ru>
References: <20230725141252.98848-1-avromanov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178796 [Jul 22 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVRomanov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 525 525 723604743bfbdb7e16728748c3fa45e9eba05f7d, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/23 08:49:00 #21663637
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_071320_223550_679C5A40 
X-CRM114-Status: GOOD (  10.11  )
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

Now the driver has a separate algo for S4 SoC.

Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
---
 Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
index 457a6e43d810..6f51506c0f65 100644
--- a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     enum:
       - amlogic,meson-rng
+      - amlogic,meson-rng-s4
 
   reg:
     maxItems: 1
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
