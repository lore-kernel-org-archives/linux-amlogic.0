Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D043DC9830C
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2026 14:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5e5Wwjsini8YFxIJNPqmoXx+gZq+CJfPXsLCXlMnkE=; b=i5E5o5BZGYEYFw
	31t+Fdih+5+NY3X79N9Ne+19KZv8fQDdcjkXVrD+iMbMxM0iK1FjP/i5oQ3H6p7kISsakMCrKr/vO
	/t2ZZVzsSi48KCRPPt/Td3WdDuvSCW3wQpWKYpNSvjF7wpDAoUijW3wWCdeRJaLR6STRFlQBz1XIs
	7NKtzXbsM5ZYq33SECAubbpc3VOmc/8YlWi6R/Z4850rbwMENjz/gpeuF62+fh0AfDbnB5xZxSTmU
	4GbfbFe+H27rJXtn40yg8IKpY7Lkd3KNqTLz42Rlky1THMHXTzyw8rcv87jh0QNR3t6Z68u7QJRL7
	2ezjDtc7uPoS/QsC52bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O7Q-00000008Ycj-0UYh;
	Wed, 23 Sep 2026 14:38:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O7N-00000008Ybz-3xbI
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Sep 2026 14:38:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 59A7643B0E;
	Wed, 23 Sep 2026 14:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECBA9C2BCF4;
	Wed, 23 Sep 2026 14:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790174321;
	bh=2cp5TqtnmLKuQQO6egpZp0WLgpqr652FwOWFnsG50JI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LbMHK+ZkDZGRpGB7+udgFUr9y+GZxuHe3dnhcBdgGzk63weTQOuTGuu6m0l6LsEQ7
	 r5YSliNyYmk55+va5u7XIESoQqZExsSuhDRxF6Nf066byG4HdTN/Ab1wFHF3i9uow7
	 JlCfRdF0FJ6kcfcrzq10/hfyWmeZTeUB5HQIMpJFbKm5nhW1PfG9oLS7UK6VMJ6W2/
	 pMi5TwAqYJ1rMnexZtVUAGp/tDH4tDyj+roKIRxDXE856eiUjfUk3Bp0KltMeebnDS
	 HDx95iHKaGjXiw/R6U8qVzGzRG1wrWU0Wd2vMwN7teiUGxVYScQZ3RFIMQGUjL0bbo
	 4x/ikiSCFrIQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE823C9830C;
	Wed, 23 Sep 2026 14:38:40 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Wed, 23 Sep 2026 16:37:51 +0200
Subject: [PATCH v2 2/2] thermal/drivers/amlogic: switch to clk_bulk API to
 support multiple clocks
MIME-Version: 1.0
Message-Id: <20260923-fix-t7-thermal-clock-v2-2-bff7a09eb487@aliel.fr>
References: <20260923-fix-t7-thermal-clock-v2-0-bff7a09eb487@aliel.fr>
In-Reply-To: <20260923-fix-t7-thermal-clock-v2-0-bff7a09eb487@aliel.fr>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-pm@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2489;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=d3X7NjHQSZTVQAEva268K6UvycI2mQfSqEccqomqrNU=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9bmJ7HPb1p8btvjlPvoXNjC7e8YnrUx5W5pqDwfua7rS
 OnJDau/dpSyMIhxMciKKbL0z7U88e7y0TNf96inwMxhZQIZwsDFKQATOanDyDB/j4efWe4T5wlm
 Uq0RB2RXbg40Ndlz+ULDKWduZ8N2WVdGhjvr5rxQ4e46tPZrBceLTsGNj837jiTo/dUWZZ/9dtX
 ZdB4A
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The t7-thermal variant now exposes two clocks (bus and core) in its
devicetree binding, but the driver only knows how to get and manage
a single struct clk. Using devm_clk_get() would silently ignore the
second clock, so switch to devm_clk_bulk_get_all() and the matching
clk_bulk_prepare_enable()/clk_bulk_disable_unprepare() calls. This
lets the driver transparently handle however many clocks a given
compatible declares, without needing per-variant clock-handling code,
and keeps working for existing SoCs that only have one.

Fixes: 18d65de8157c ("thermal/drivers/amlogic: Add support for secure monitor calibration readout")
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/thermal/amlogic_thermal.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
index a0b530624b60c..60728de6968ac 100644
--- a/drivers/thermal/amlogic_thermal.c
+++ b/drivers/thermal/amlogic_thermal.c
@@ -100,7 +100,8 @@ struct amlogic_thermal {
 	const struct amlogic_thermal_data *data;
 	struct regmap *regmap;
 	struct regmap *sec_ao_map;
-	struct clk *clk;
+	struct clk_bulk_data *clks;
+	int num_clks;
 	struct thermal_zone_device *tzd;
 	u32 trim_info;
 	struct meson_sm_firmware *sm_fw;
@@ -142,7 +143,7 @@ static int amlogic_thermal_enable(struct amlogic_thermal *data)
 {
 	int ret;
 
-	ret = clk_prepare_enable(data->clk);
+	ret = clk_bulk_prepare_enable(data->num_clks, data->clks);
 	if (ret)
 		return ret;
 
@@ -156,7 +157,7 @@ static void amlogic_thermal_disable(struct amlogic_thermal *data)
 {
 	regmap_update_bits(data->regmap, TSENSOR_CFG_REG1,
 			   TSENSOR_CFG_REG1_ENABLE, 0);
-	clk_disable_unprepare(data->clk);
+	clk_bulk_disable_unprepare(data->num_clks, data->clks);
 }
 
 static int amlogic_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
@@ -323,9 +324,10 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
 	if (IS_ERR(pdata->regmap))
 		return PTR_ERR(pdata->regmap);
 
-	pdata->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(pdata->clk))
-		return dev_err_probe(dev, PTR_ERR(pdata->clk), "failed to get clock\n");
+	ret = devm_clk_bulk_get_all(dev, &pdata->clks);
+	if (ret <= 0)
+		return dev_err_probe(dev, ret ?: -ENOENT, "failed to get clocks\n");
+	pdata->num_clks = ret;
 
 	if (pdata->data->use_sm)
 		ret = amlogic_thermal_probe_sm(pdev, pdata);

-- 
2.49.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
