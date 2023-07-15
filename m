Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686E2EB64DC
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jul 2023 11:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8uz5u3/ztJnU1+DKA9bBxLQgzk2/tv3uEdyraXttvoQ=; b=MPeZ2mZU+FZab7
	Gm12FmZND2nLY3I204nl0zVKP3Dck0Nywg/r/oWSaUPITbQik4OcsddIIpkVpVE7U0TI2bU4xIKYy
	jV0dJRlSu4x6T3dJGSR2n00jv8k8vxSAbI7+IUicILIpsMt0Cy9lpcm5ynDuUbF4nrOHpbcPkghbu
	Kf5mbkJkWX99BntT1uX0IJx5p/q54eKwy3jvUCPiYxdiHyjH2IF9ccJG92+k9B9+6wU6BCwBn5vFM
	RZcPSEOTXBpzFSatUnHSE09leiaur8MAMGBZUFNyGu9Wqj5wb9TiPLlcTuLfVwtVjdDVWRYiAG+Bb
	3MGprErnoZZ5x3Rvr10A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKd7M-008XNA-0y;
	Sat, 15 Jul 2023 11:07:16 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKd7H-008XKe-2G;
	Sat, 15 Jul 2023 11:07:14 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6E90310000A;
	Sat, 15 Jul 2023 14:07:03 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6E90310000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689419223;
	bh=3mmX30I0FwXOJ51SYCtTE0imFkDvARZbsiRbScj96a4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=fxK9S0yGCJ66oe6he9tWrrxdTp0sj5iR3ghXAL1UZDufz/Yo53ZQjCXs8OhlV7ctF
	 +qFtfma4MKpl5o7El7xbt5Y7mjPIuxivPTgJ+gXcrxJWA3L482Vaa2a/N6JV+kONXY
	 n2/NXM4XTQD+fyeMZPuwD1t6DcBY4/3nARfYxG2hmvBa8ImcagiK8GEuRKLi7X89oM
	 /UuP8+kbmGI48eTwalZsXh3wxduRQny8vMAOo6KvVuwASEow55LbXJ2INyzEyM4VRQ
	 7QgPv7XQFQ8xZLBsXtiXHY9WVmQk7dUOPIAWL9rLC2FlvB69yFiX2mZRla+Ma3uy8x
	 Wzziy6SvKSLdw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sat, 15 Jul 2023 14:07:03 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Sat, 15 Jul 2023 14:06:23 +0300
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>
Subject: [PATCH v1 3/3] iio: adc: meson: init voltage control bits
Date: Sat, 15 Jul 2023 14:06:00 +0300
Message-ID: <20230715110654.6035-4-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230715110654.6035-1-gnstark@sberdevices.ru>
References: <20230715110654.6035-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178635 [Jul 15 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: GNStark@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 523 523 523027ce26ed1d9067f7a52a4756a876e54db27c, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/15 07:52:00 #21618415
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_040712_417660_FF17988F 
X-CRM114-Status: GOOD (  14.84  )
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

Define and init voltage configuration bits. Those bits are inited in
vendor boot code (bl2, bl33) already so do it in the driver to not depend
on other code.

Introduced bits:
REG11[0] - selects Vref. 0 - calibration voltage, 1 - VDDA. txlx and later
           SoCs support VDDA or calibration voltage as Vref, but others
           support only calibration voltage. For newer platforms vendor
	   uses VDDA as default.
REG11[1] - reserved bit. g12a and later SoCs must write 1, others SoCs
           write 0.
REG11[5] - Vref voltage. 0 - 0.9v, 1 - 1.8v. g12a and later SoCs must
           write 0, others SoCs write 1.
REG11[6] - selects common-mode voltage, 0: from AVDD, 1: from Vref.
           g12a and later SoCs must write 0, others SoCs write 1.

Signed-off-by: George Stark <gnstark@sberdevices.ru>
---
 drivers/iio/adc/meson_saradc.c | 48 ++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 806ba7cd7320..05fb30b81b8d 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -156,6 +156,10 @@
  */
 #define MESON_SAR_ADC_REG11					0x2c
 	#define MESON_SAR_ADC_REG11_BANDGAP_EN			BIT(13)
+	#define MESON_SAR_ADC_REG11_CMV_SEL                     BIT(6)
+	#define MESON_SAR_ADC_REG11_VREF_VOLTAGE                BIT(5)
+	#define MESON_SAR_ADC_REG11_EOC                         BIT(1)
+	#define MESON_SAR_ADC_REG11_VREF_SEL                    BIT(0)
 
 #define MESON_SAR_ADC_REG13					0x34
 	#define MESON_SAR_ADC_REG13_12BIT_CALIBRATION_MASK	GENMASK(13, 8)
@@ -216,6 +220,11 @@
 	.datasheet_name = "SAR_ADC_MUX_"#_sel,				\
 }
 
+enum meson_sar_adc_vref_sel {
+	VREF_CALIBATION_VOLTAGE = 0,
+	VREF_VDDA = 1,
+};
+
 enum meson_sar_adc_avg_mode {
 	NO_AVERAGING = 0x0,
 	MEAN_AVERAGING = 0x1,
@@ -314,6 +323,12 @@ struct meson_sar_adc_param {
 	unsigned int				temperature_multiplier;
 	unsigned int				temperature_divider;
 	u8					disable_ring_counter;
+	bool					has_reg11;
+	bool					has_vref_select;
+	u8					vref_select;
+	u8					cmv_select;
+	u8					adc_eoc;
+	enum meson_sar_adc_vref_sel		vref_volatge;
 };
 
 struct meson_sar_adc_data {
@@ -974,6 +989,29 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
 			   MESON_SAR_ADC_REG3_CTRL_CONT_RING_COUNTER_EN,
 			   regval);
 
+	if (priv->param->has_reg11) {
+		regval = FIELD_PREP(MESON_SAR_ADC_REG11_EOC, priv->param->adc_eoc);
+		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
+				   MESON_SAR_ADC_REG11_EOC, regval);
+
+		if (priv->param->has_vref_select) {
+			regval = FIELD_PREP(MESON_SAR_ADC_REG11_VREF_SEL,
+					    priv->param->vref_select);
+			regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
+					   MESON_SAR_ADC_REG11_VREF_SEL, regval);
+		}
+
+		regval = FIELD_PREP(MESON_SAR_ADC_REG11_VREF_VOLTAGE,
+				    priv->param->vref_volatge);
+		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
+				   MESON_SAR_ADC_REG11_VREF_VOLTAGE, regval);
+
+		regval = FIELD_PREP(MESON_SAR_ADC_REG11_CMV_SEL,
+				    priv->param->cmv_select);
+		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
+				   MESON_SAR_ADC_REG11_CMV_SEL, regval);
+	}
+
 	ret = clk_set_parent(priv->adc_sel_clk, priv->clkin);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to set adc parent to clkin\n");
@@ -1195,6 +1233,9 @@ static const struct meson_sar_adc_param meson_sar_adc_gxbb_param = {
 	.bandgap_reg = MESON_SAR_ADC_REG11,
 	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
 	.resolution = 10,
+	.has_reg11 = true,
+	.vref_volatge = 1,
+	.cmv_select = 1,
 };
 
 static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
@@ -1204,6 +1245,9 @@ static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
 	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
 	.resolution = 12,
 	.disable_ring_counter = 1,
+	.has_reg11 = true,
+	.vref_volatge = 1,
+	.cmv_select = 1,
 };
 
 static const struct meson_sar_adc_param meson_sar_adc_g12a_param = {
@@ -1213,6 +1257,10 @@ static const struct meson_sar_adc_param meson_sar_adc_g12a_param = {
 	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
 	.resolution = 12,
 	.disable_ring_counter = 1,
+	.has_reg11 = true,
+	.adc_eoc = 1,
+	.has_vref_select = true,
+	.vref_select = VREF_VDDA,
 };
 
 static const struct meson_sar_adc_data meson_sar_adc_meson8_data = {
-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
