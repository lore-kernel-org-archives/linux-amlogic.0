Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0354C001DE
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jul 2023 14:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyTrOW6VuAXvfpSi9PSMFwW6Coz3X+gxfEjfHRocM00=; b=A6uNakGmENjrmP
	wwqpDG+TbpRwhy1yo2M8ptidQV4x/vuuPCmg0seNw+9Rq6PbZLmZjK2svUMr4tQgObFoR2UMM1S7q
	rYnCa8IgD9gX67awCRFZSo/DV25t4lmjjXCtG47gga4/qugbyv6Nd3MX8Ydridbtn2SXJf5eefAj2
	z1sGr1gzGjrDXV4fQxLGEvracBT+OkjmYZNbnz9d7TD70FP63sORLtBXn/ZZCYpsFLsH+160LL9bA
	G9MPiR1suxeSWKk86rgTdufi90wOX2fTBaJvM+NFfYJIIkhregX+HJHKt3ACHgm3WVBf0dN56XbhV
	NFncBVEJVMSd/Jdl4d5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOIn8-007kK3-1Y;
	Tue, 25 Jul 2023 14:13:34 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOImu-007kDO-1w;
	Tue, 25 Jul 2023 14:13:23 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 27C5110002A;
	Tue, 25 Jul 2023 17:13:10 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 27C5110002A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1690294390;
	bh=mawpPFaFDwTi16n2aaHJjeloGu7ded/mpqmM2zhRfcg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=WWDcaoW/ck2ethiGWAsJOvPOfBp2HU57+a7LvmKR1ZwoQCPNZOD6uwnZfIjg2SwiI
	 ZV4C9jOwV+3IxvWDeKPlZ2W2WMexwYN19IRsUIEb2f+oWebP+a5lg5TGeSGogn6TcL
	 kDBclWGwiFXO8BfRc8d9/4ojpm4woPGwr0vZMTeorXYgFKNMCZhxsMresaFbO9oSZ+
	 BwSZN5NpfwbhsK9DJ3nnM3fvM9jEhZ7AmGvkStQMIGIdtZmSY6AR4bXB7tJwxlaeSK
	 XJCMxi76mBkbIKIkEbOaF6IPzw+ywLGLWWhnODsYACjY6QSaPIeYa7ChNgHXlM2pFr
	 ReYCKeAgezT5A==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 25 Jul 2023 17:13:10 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 25 Jul 2023 17:13:08 +0300
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
Subject: [PATCH v1 3/3] arch/arm64: dts: meson-s4: add hwrng node
Date: Tue, 25 Jul 2023 17:12:52 +0300
Message-ID: <20230725141252.98848-4-avromanov@sberdevices.ru>
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
X-KSMG-AntiSpam-Info: LuaCore: 525 525 723604743bfbdb7e16728748c3fa45e9eba05f7d, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/23 08:49:00 #21663637
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_071320_994170_FBF06DF7 
X-CRM114-Status: GOOD (  10.65  )
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

Using this node, we can obtain random numbers via
hardware random number generator.

Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index f24460186d3d..3e3348cc6c06 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -133,6 +133,11 @@ reset: reset-controller@2000 {
 				reg = <0x0 0x2000 0x0 0x98>;
 				#reset-cells = <1>;
 			};
+
+			hwrng: rng@440788 {
+				compatible = "amlogic,meson-rng-s4";
+				reg = <0x0 0x440788 0x0 0x0c>;
+			};
 		};
 	};
 };
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
