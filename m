Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF87C98307
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2026 11:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFqlHItwUgDrKPEe+U1T637uJf+CC8s7r3IjF/2qRBo=; b=TXLG263TB1fvEd
	/wBYOZ4knqUmLf+89UDrKZ33XP8whHKvBhVVD507l8fvFX8lV/jox1ECH9LFo6aNaLpaJBXjMFdBl
	Vz+kxgHSLloRQVtY6/zkfaw2FpEMP4pmjOs/VoiYmEmDbbqaZfsPJooXx7DYQgq4yVX3PFyRjl9oJ
	PgWwY1H6oVEt5kMkKvW7KabeYgc3UMva0p6KLrvr74HBPsLAAjEYvb6Bu0QJXi2hcFcTcL8kGaTiB
	pU0JpYB3DnmxCerfnQP8HPp2tLlC/ZufT9FHyJojJkffa3DGLyggw47NYPUxtl/RghggZOTFkfsci
	KZ4sWr07n7iP25GRqEBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LWp-000000088UC-3Ovt;
	Wed, 23 Sep 2026 11:52:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LWo-000000088Sm-18Wy
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Sep 2026 11:52:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1DA0440B2;
	Wed, 23 Sep 2026 11:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8200C2BCFA;
	Wed, 23 Sep 2026 11:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790164365;
	bh=APmX+ZhRu2oIf8MMO1KHUlLlqrR5kvAOmZ4FceVRgMQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uKyNHwNnsHlU+uRen22QJk8ve9GyQ3bsLZytOfKJ7A3mvkLWkBrDqifae/0TYQ6YF
	 z3i8l3Y4v28YDHgX8H18u1Zq4cBx+1HA7fEp+R8n+b7ne8abuCz4wVaL03aNzDMgNd
	 j1GMmnyHm08qE+1sHnYItnvRjH5JTHstFHDXaw9NXkSyxhTyBlxWQx9dnOzHUk3iLg
	 llsez22oPvtkjSeUos8h77Z1S4HLkvGOTY6UbxUH/3xYhU+N2xdmIdOR91TfF/xRtz
	 /RAo1fGCTXSZbdetSjfdSIktDBESbRZHdHNOQ2g7/LTl7hEwiKZDH6zQKvIAMV8eg6
	 ETBX9YgzzttRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99B2C982FA;
	Wed, 23 Sep 2026 11:52:45 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Wed, 23 Sep 2026 13:51:03 +0200
Subject: [PATCH 2/2] thermal/drivers/amlogic: switch to clk_bulk API to
 support multiple clocks
MIME-Version: 1.0
Message-Id: <20260923-fix-t7-thermal-clock-v1-2-7d4c4682f182@aliel.fr>
References: <20260923-fix-t7-thermal-clock-v1-0-7d4c4682f182@aliel.fr>
In-Reply-To: <20260923-fix-t7-thermal-clock-v1-0-7d4c4682f182@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2477;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=ioP7fZ0RSW6MezWCgPIvZyXQs7PdrAR6YY8F77TqFTw=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9bmvdVmCr+z0k/9klS7ePj31Q+N6fOTrqxxahfjiLd6z
 CiouOF3RykLgxgXg6yYIkv/XMsT7y4fPfN1j3oKzBxWJpAhDFycAjARTTmG/2UPshqv86sluNfm
 NPx5fC+CRbTpZEbBjPD/6tolEl5+fowME8602/lPYTFks0uYfMviZ/P6af1uT3ttrx89YvFBbNI
 yRgA=
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
index a0b530624b60c..2e8d042067079 100644
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
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get clocks\n");
+	pdata->num_clks = ret;
 
 	if (pdata->data->use_sm)
 		ret = amlogic_thermal_probe_sm(pdev, pdata);

-- 
2.49.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
