Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8184CF436BE
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2026 16:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HrDM8k3ZtLyIMraRk5O1RFPTih/ykgHtLuyPl8BHAZ4=; b=Z/cxpV2ZcWW+8z
	oSCKGuQPiEPKnfqLzpgqG4Kg/eny2U4LiJ/dXlpLBUhpfIvveNZbab4z1qsxgC5wlXt9Y2xBt/RFe
	tDzlwUEbfJmNRLqsW+9mXpf0PCq4gPbm01U62jcjca4lgrdhJ0ornQa60wvzYfLPujAfzGMxAnL/M
	thl604kG5WG/qQi98AWp4HVeEwbTN4OkPaE8JAS9TMxFxLvdfn2h15It4U936kPABsYfK/MDDpiXw
	QfCAEPR+44gImT1TFf6VWco9OhWwSWn/MtIpC3CVhe0jUAuoViJlX95g399GxOGpoARmWyEhHgkEi
	hGNBgOqCJmantOphvMGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDmBq-00000004Grf-0AZS;
	Fri, 17 Apr 2026 16:37:10 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDmBl-00000004Gob-2YaK;
	Fri, 17 Apr 2026 16:37:08 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776443822;
	bh=OW1b2Q/DJTEMxPikE6mdf/p+H5KyL7TPJwoR6k9njCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H+NDf5jh8sVTkrPc44iNmFBBQsqlAQ6ZUrfo98N1XAUFJrs9QoCOKUEksbIdvTdaB
	 hrcT1oRRwqjJzHBCrMCjySQxios1NTCkqh8SQdTG2ouJ9irZh0x4dJJgpSa8xUB40q
	 4TX8VHJ7qiZuj88+Ysu+T37Jw3BHwLCj996AGvAQ=
Date: Fri, 17 Apr 2026 18:27:19 +0200
Subject: [PATCH v3 3/8] mfd: khadas-mcu: Add per-variant configuration
 infrastructure and VIM4 support
MIME-Version: 1.0
Message-Id: <20260417-add-mcu-fan-khadas-vim4-v3-3-a6a7f570b11b@aliel.fr>
References: <20260417-add-mcu-fan-khadas-vim4-v3-0-a6a7f570b11b@aliel.fr>
In-Reply-To: <20260417-add-mcu-fan-khadas-vim4-v3-0-a6a7f570b11b@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776443816; l=2417;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=OW1b2Q/DJTEMxPikE6mdf/p+H5KyL7TPJwoR6k9njCc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMCdn8xfIyM+fQy2ZDCjGnTo045FT82SqUp9xOk/xUk/qbhgtrh/EmI7WIP7cvfXg8tOMD64SAe
 Fkr9qda31sQU=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_093705_866484_8DC98690 
X-CRM114-Status: GOOD (  12.06  )
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

Introduce a per-variant configuration structure (khadas_mcu_data)
holding the regmap config and MFD cells,
selected at probe time via the of_device_id match data.
This makes adding other variants straightforward.

Also introduce khadas_mcu_fan_pdata to pass fan register address and
maximum level to the fan sub-driver, removing the hardcoded constants.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 include/linux/mfd/khadas-mcu.h | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/include/linux/mfd/khadas-mcu.h b/include/linux/mfd/khadas-mcu.h
index a99ba2ed0e4e0..75e275d3fa8d9 100644
--- a/include/linux/mfd/khadas-mcu.h
+++ b/include/linux/mfd/khadas-mcu.h
@@ -70,6 +70,13 @@
 #define KHADAS_MCU_WOL_INIT_START_REG		0x87 /* WO */
 #define KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG	0x88 /* WO */
 
+/* VIM4 specific registers */
+#define KHADAS_MCU_VIM4_REST_CONF_REG		0x2c /* WO - reset EEPROM */
+#define KHADAS_MCU_VIM4_LED_ON_RAM_REG		0x89 /* WO - LED volatile */
+#define KHADAS_MCU_VIM4_FAN_CTRL_REG		0x8a /* WO */
+#define KHADAS_MCU_VIM4_WDT_EN_REG		0x8b /* WO */
+#define KHADAS_MCU_VIM4_SYS_RST_REG		0x91 /* WO */
+
 enum {
 	KHADAS_BOARD_VIM1 = 0x1,
 	KHADAS_BOARD_VIM2,
@@ -82,10 +89,38 @@ enum {
  * struct khadas_mcu - Khadas MCU structure
  * @device:		device reference used for logs
  * @regmap:		register map
+ * @data:		pointer to variant-specific config
  */
 struct khadas_mcu {
-	struct device *dev;
-	struct regmap *regmap;
+	struct device			*dev;
+	struct regmap			*regmap;
+	const struct khadas_mcu_data	*data;
+};
+
+/**
+ * struct khadas_mcu_data - per-variant configuration
+ * @regmap_config:	regmap configuration
+ * @cells:		MFD sub-devices
+ * @ncells:		number of sub-devices
+ * @fan_cells:		MFD fan sub-devices
+ * @nfan_cells:		number of fan sub-devices
+ */
+struct khadas_mcu_data {
+	const struct regmap_config	*regmap_config;
+	const struct mfd_cell		*cells;
+	int				ncells;
+	const struct mfd_cell		*fan_cells;
+	int				nfan_cells;
+};
+
+/**
+ * struct khadas_mcu_fan_pdata - fan sub-driver configuration
+ * @fan_reg: register address to write the fan level
+ * @max_level: maximum fan level
+ */
+struct khadas_mcu_fan_pdata {
+	unsigned int fan_reg;
+	unsigned int max_level;
 };
 
 #endif /* MFD_KHADAS_MCU_H */

-- 
2.49.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
