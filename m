Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E51C54E60
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2024 23:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8T89XZBnL42OHlPXRjK6tR0zJItfqHjSTmdhmmIKdRs=; b=l4Fy1PShd9tLg2
	eLTIRHD8kjgkRV//Uye3ZwDL8+SuemoC3I98Ht+qli/Q8l8W0Yk9gt+O/csQ8+YCPRpuYwg9PaZ/M
	owPjWKAPBDonHpc8Cfhu2qUiIeSFyiQzAejNZn6tBJ3DKGHND1hKv4ohW4Uwp3KbGlLWApZBYLK8P
	sJoc7CFeY55B3hb3G0esmqpurK9bHD+ttLLn6eR3frHamN4f0m5BASEtJOjUoXMEl34NC3Ti9WwYp
	moIDHgrnQoZyYxiVF9J7i7ny+4G3YUoQ9LjFgor3A4aIf99nwYieintEpHAlIU2LE6btnkHC7q9yD
	9YyHCJ77u1rsWNsFG+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuQF-0000000Fxzd-1JaR;
	Thu, 14 Mar 2024 23:23:39 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuPp-0000000FxbU-1k1A;
	Thu, 14 Mar 2024 23:23:18 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 2626812000C;
	Fri, 15 Mar 2024 02:23:03 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 2626812000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710458583;
	bh=CCvJrpEy8sCRXCr8dMiJp3FMH8ERqXOpfe0cLHeVGoc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=fbafMPhazDMHL8jLJUDMUBps9XXh6YqILIDeVkfRYxY4Kd3tiirAcAhWopKN5WZbg
	 zvpCNbU2sDk3hvJ7UklbC/di83AlfNXI71dC1VHjvZweGx909EMhXKazjofpxsxzoc
	 qJ3E6Amu1d0pcrcL7VVwO70Cgb10WM2+wkErXc2Lun5Md2iF2LUVz9gQ5l+Zv+rFXf
	 vd/+utQUEQmC11h6xelNs2rLl2K9FaK9T8RS2JuwM9lYxxytjk4YaL+2pt+NAr0IIl
	 tE8DBnDorVRb0zH91zidP3oOP3KPOy7lpa6IrAOiNJ6mZgD/6tgR2IQ9psAqCU3EZA
	 Pv8Kd0tCDTsaA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 15 Mar 2024 02:23:03 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Mar 2024 02:23:02 +0300
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
Subject: [PATCH 07/25] ASoC: meson: g12a-toacodec: rework the definition of bits
Date: Fri, 15 Mar 2024 02:21:43 +0300
Message-ID: <20240314232201.2102178-8-jan.dakinevich@salutedevices.com>
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
X-CRM114-CacheID: sfid-20240314_162314_479934_A9CEE03B 
X-CRM114-Status: GOOD (  15.30  )
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

There is a lot of defines, but almost all of them are not used. Lets
rework them:

 - keep separate the definition for different platforms to make easier
   checking that they match documentation.

 - use LSB/MSB sufixes for uniformity.

 - don't use hard-coded values for already declared defines.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 sound/soc/meson/g12a-toacodec.c | 77 ++++++++++++++++++++-------------
 1 file changed, 47 insertions(+), 30 deletions(-)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index b92de2235627..325cf420fd69 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -20,26 +20,35 @@
 #define G12A_TOACODEC_DRV_NAME "g12a-toacodec"
 
 #define TOACODEC_CTRL0			0x0
-#define  CTRL0_ENABLE_SHIFT		31
-#define  CTRL0_DAT_SEL_SM1_MSB		19
-#define  CTRL0_DAT_SEL_SM1_LSB		18
-#define  CTRL0_DAT_SEL_MSB		15
-#define  CTRL0_DAT_SEL_LSB		14
-#define  CTRL0_LANE_SEL_SM1		16
-#define  CTRL0_LANE_SEL			12
-#define  CTRL0_LRCLK_SEL_SM1_MSB	14
-#define  CTRL0_LRCLK_SEL_SM1_LSB	12
-#define  CTRL0_LRCLK_SEL_MSB		9
-#define  CTRL0_LRCLK_SEL_LSB		8
-#define  CTRL0_LRCLK_INV_SM1		BIT(10)
-#define  CTRL0_BLK_CAP_INV_SM1		BIT(9)
-#define  CTRL0_BLK_CAP_INV		BIT(7)
-#define  CTRL0_BCLK_O_INV_SM1		BIT(8)
-#define  CTRL0_BCLK_O_INV		BIT(6)
-#define  CTRL0_BCLK_SEL_SM1_MSB		6
-#define  CTRL0_BCLK_SEL_MSB		5
-#define  CTRL0_BCLK_SEL_LSB		4
-#define  CTRL0_MCLK_SEL			GENMASK(2, 0)
+
+/* Common bits */
+#define CTRL0_ENABLE_SHIFT		31
+#define CTRL0_MCLK_SEL			GENMASK(2, 0)
+
+/* G12A bits */
+#define CTRL0_DAT_SEL_G12A_MSB		15
+#define CTRL0_DAT_SEL_G12A_LSB		14
+#define CTRL0_LANE_SEL_G12A_MSB		13
+#define CTRL0_LANE_SEL_G12A_LSB		12
+#define CTRL0_LRCLK_SEL_G12A_MSB	9
+#define CTRL0_LRCLK_SEL_G12A_LSB	8
+#define CTRL0_BLK_CAP_INV_G12A		BIT(7)
+#define CTRL0_BCLK_O_INV_G12A		BIT(6)
+#define CTRL0_BCLK_SEL_G12A_MSB		5
+#define CTRL0_BCLK_SEL_G12A_LSB		4
+
+/* SM1 bits */
+#define CTRL0_DAT_SEL_SM1_MSB		19
+#define CTRL0_DAT_SEL_SM1_LSB		18
+#define CTRL0_LANE_SEL_SM1_MSB		17
+#define CTRL0_LANE_SEL_SM1_LSB		16
+#define CTRL0_LRCLK_SEL_SM1_MSB		14
+#define CTRL0_LRCLK_SEL_SM1_LSB		12
+#define CTRL0_LRCLK_INV_SM1		BIT(10)
+#define CTRL0_BLK_CAP_INV_SM1		BIT(9)
+#define CTRL0_BCLK_O_INV_SM1		BIT(8)
+#define CTRL0_BCLK_SEL_SM1_MSB		6
+#define CTRL0_BCLK_SEL_SM1_LSB		4
 
 #define TOACODEC_OUT_CHMAX		2
 
@@ -108,7 +117,7 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
 }
 
 static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
-			    CTRL0_DAT_SEL_LSB,
+			    CTRL0_DAT_SEL_G12A_LSB,
 			    g12a_toacodec_mux_texts);
 
 static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0,
@@ -210,7 +219,7 @@ static int g12a_toacodec_component_probe(struct snd_soc_component *c)
 {
 	/* Initialize the static clock parameters */
 	return snd_soc_component_write(c, TOACODEC_CTRL0,
-				       CTRL0_BLK_CAP_INV);
+				       CTRL0_BLK_CAP_INV_G12A);
 }
 
 static int sm1_toacodec_component_probe(struct snd_soc_component *c)
@@ -229,11 +238,13 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
 };
 
 static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
-	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 2, 0),
+	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_G12A_LSB,
+		   CTRL0_LANE_SEL_G12A_MSB - CTRL0_LANE_SEL_G12A_LSB + 1, 0),
 };
 
 static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
-	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 2, 0),
+	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1_LSB,
+		   CTRL0_LANE_SEL_SM1_MSB - CTRL0_LANE_SEL_SM1_LSB + 1, 0),
 };
 
 static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
@@ -266,16 +277,22 @@ static const struct regmap_config g12a_toacodec_regmap_cfg = {
 
 static const struct g12a_toacodec_match_data g12a_toacodec_match_data = {
 	.component_drv	= &g12a_toacodec_component_drv,
-	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 14, 15),
-	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 8, 9),
-	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 5),
+	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_G12A_LSB,
+				    CTRL0_DAT_SEL_G12A_MSB),
+	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_G12A_LSB,
+				     CTRL0_LRCLK_SEL_G12A_MSB),
+	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_G12A_LSB,
+				    CTRL0_BCLK_SEL_G12A_MSB),
 };
 
 static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
 	.component_drv	= &sm1_toacodec_component_drv,
-	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 18, 19),
-	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
-	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
+	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_SM1_LSB,
+				    CTRL0_DAT_SEL_SM1_MSB),
+	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_SM1_LSB,
+				     CTRL0_LRCLK_SEL_SM1_MSB),
+	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_SM1_LSB,
+				    CTRL0_BCLK_SEL_SM1_MSB),
 };
 
 static const struct of_device_id g12a_toacodec_of_match[] = {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
