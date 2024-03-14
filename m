Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE03C54E60
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2024 23:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trcrV2kUA8C/0nAcYYmsUgGO2773qYxOSkEdjovklGQ=; b=cGoqvu3xVvBFfZ
	VFBVc51pH69YrJZrJpM5zXHmu3UVAr8QjpfDz1SdOfH8Q6STGKMQKDx63PS+MqJ02siYgnSlPTcgY
	0kyph/YJDV4kATFej9iW+AzYEvwLNobam+KGc532idCwKDLd/Cp1K//+6YsMUbKVh2SON96o7rWdS
	qftp5jhdOnBPdwqYGqfhlH4feWxHZ2ChsKDuDYpeUw9KI6RsVMb0zPbdX7g+gW3ivGWF2YNSQAqCJ
	FupRC9pMaXIAyRCerpC1WMlpbDIUfr9Wj9H365ob6saLsKSEpxJYnPoobUutsfUyzLuNJZEoMd6WS
	0x3IO0QgjHehjny1Hm8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuSN-0000000FzJ5-1Qy8;
	Thu, 14 Mar 2024 23:25:51 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuPz-0000000FxmG-2xq0;
	Thu, 14 Mar 2024 23:23:27 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4170E10001A;
	Fri, 15 Mar 2024 02:23:07 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4170E10001A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710458587;
	bh=0bVC1Iflcx/84RT20lc/9qwd1tBRnDCCeramIv4oQPM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=MSeGExEHvqf/fh/PAEHhIyndDp7ReLBlRDix5xPvD5f9IFgvtJpKN9fcLtBgJc+QQ
	 UFrWCQnoOqwyGTeicReINzNPnhbbvPcsMXgxO0mRGz9lmSLQi72rAL2MxoDZA33Bsp
	 +k+463xS41TUqWf2ekUoBGuM4H8Nd2jql/cW/HanbakAMlf7UQiVsChHhVPQPQT8ix
	 wXWfaMhaIrHAtITSfQ0Oin4RkHDAPwvIWMR3yzEEONc2yM2TJgCkIsA4Z4Pi5ieNNM
	 kD3MFjROyRJ258oeBfsHAPqeDGbyOjjrORpN47qL2RmvlXtaCRNLe66Xzu/w8HMrSD
	 YIjJ0MZKzd9hQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 15 Mar 2024 02:23:07 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Mar 2024 02:23:06 +0300
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
CC: <kernel@salutedevices.com>
Subject: [PATCH 18/25] ASoC: dt-bindings: meson: axg-pdm: claim support of A1 SoC family
Date: Fri, 15 Mar 2024 02:21:54 +0300
Message-ID: <20240314232201.2102178-19-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_smtp_not_equal_from}, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_162324_657754_20D3B715 
X-CRM114-Status: GOOD (  10.69  )
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

Add "amlogic,a1-pdm" compatible string alias to "amlogic,axg-pdm".

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
index d2f23a59a6b6..b129b8053352 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
               - amlogic,g12a-pdm
               - amlogic,sm1-pdm
+              - amlogic,a1-pdm
           - const: amlogic,axg-pdm
       - const: amlogic,axg-pdm
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
