Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09980C54E60
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2024 23:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3FsHzeI2PyWtXBtDUWVBWPw9M5vFi1nGVNvmTOmU5g=; b=HyXIWo3WhKGLCZ
	vi2Tub3NVAx5o2SmVM2kLcw0IiG+ZZ15jS/V6R3ck+DMCWMD345jDpwLJbMJag7RSzBpvlwEhbZxq
	qPK7/DCHUO2Lpk3L4us8Coy4UBFH0aY1/8bIRv1H/Tz01I0oNeuy7p7+FdghDPMZbeBZFXxp9QNbw
	cusSmjfcbBaFO0N548boOMKfO6EERZkgys5+TE40jyhpXQcQnpBxpLnuf1mrG6tjlpQkNZUoBs/0p
	mJnDsB/hwC5WBz/6yIh5F/cX9nmv6ELP6b5Z62m7D+o8b+N524vUceIgPNOYD6DxwyCxtT6HGhbmM
	/TRN3vlQA5winAs5yeBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuSK-0000000FzHz-3a36;
	Thu, 14 Mar 2024 23:25:48 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuPz-0000000Fxle-0sHj;
	Thu, 14 Mar 2024 23:23:26 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 5D8B8120016;
	Fri, 15 Mar 2024 02:23:08 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 5D8B8120016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710458588;
	bh=lfafaGrQIktQg/rWyr/aK5n5leCd1McAMyotoMmDk/s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=XJMIhSsdEN0VNh5LqWmllNaCWjm6KhGkX598dYM2LT2xyqTJXyNmOH1uARpOqQjrt
	 Y0IBu4MjycToMERvuohkmj/9GVCf6w14ND/wh0LQagQpowKY1HCnDG0Fr0cuegaolg
	 A7DsZZGsiEMIiRDTOCY1hh2RYFKhLyKnYJfmm14Vivg/01FKalrLfggCnTMI7f0qUi
	 IWsnv/c7+XZVpCu+Zw4aIbqVDB0BI1ea3Me55Bklwk3kYvDVeWmKAuzTTzqAxwYk59
	 nGB+UGsLjsJnbxQYPczYegFVjzx3iQHiUQ4vCp8FwgcShUTa1cLr7G5s192v2LTaJE
	 xysw/Jg2nPMYw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 15 Mar 2024 02:23:08 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Mar 2024 02:23:07 +0300
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
Subject: [PATCH 21/25] ASoC: dt-bindings: meson: axg-tdm-iface: claim support of A1 SoC family
Date: Fri, 15 Mar 2024 02:21:57 +0300
Message-ID: <20240314232201.2102178-22-jan.dakinevich@salutedevices.com>
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
X-CRM114-CacheID: sfid-20240314_162324_016474_02AD22D3 
X-CRM114-Status: GOOD (  11.28  )
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

Add "amlogic,a1-tdm-iface" compatible string alias to
"amlogic,axg-tdm-iface".

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 .../devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml    | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
index 45955d8a26d1..7c1af85b52b4 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml
@@ -14,7 +14,11 @@ allOf:
 
 properties:
   compatible:
-    const: amlogic,axg-tdm-iface
+    oneOf:
+      - const: amlogic,axg-tdm-iface
+      - items:
+          - const: amlogic,a1-tdm-iface
+          - const: amlogic,axg-tdm-iface
 
   "#sound-dai-cells":
     const: 0
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
