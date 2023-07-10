Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64122C001DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jul 2023 10:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Hz3D9DLAkVZ+TYWaH1ldaVW2jnnwrh/cuvrv4BVrn8=; b=YjCSS77owUdbr7
	qBgB8sEzCFm28OJTee0qzuNJC6aSsEuc9DTO3/pqiKdLLG02Omett2m0847KpMe5v8c5UeKPPxyfn
	sz+2FBkZNXHRI4GwVSPCS/f30TP45KZgQlFq0TdwtWa4K4Aik3hNxoF6W9ZdusE8+EKKLwCrD1319
	4Cm/ZURSti0CIy5UDsrVC5MyMCznEb9sA3/4TiEkvqsxki0kTuC5G/G+N0A/IpRXvoQneKenI2SUA
	1PIZWwqp10uNrDDZgDRWvOZwzHvQjwzLPESgDA+d0XFSIL70tcBIr/u5dmXagWtw9ljMRmU78GDRu
	xvmdvtbnkXYiEms/ppUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIo7l-00BDzy-1m;
	Mon, 10 Jul 2023 10:28:09 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIo7c-00BDpt-2c;
	Mon, 10 Jul 2023 10:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688984880; x=1720520880;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1YMEKoH26Jvs8dKIC6vdH9uSV/g2LDeyMP+ZqFMU56I=;
  b=gkXLNTx4XfKawJNILdMgC79+nNBedQE9CEjugHKWsHTsXtn3Osl9TdN6
   FRO3xW/oDczMJpX+Dq9S00Y2ZSOj1ducalmKZNYT5+aorsl3WCuqGzxMJ
   FBag8yLSl5MGiKDooDHRFsKqTrxTacvalFvslGXpFGhMDziEcJMGhA5wX
   Bg/0lOtNxh29l5meh/wVswZgh61gv/LsIn6/QK18FsZLNlObIHZK9E66z
   smcVABEWGOvIN/K/rFlLlIM44RydYrCNI5ccl7Pd3a9V5iMdhT/gdH5X+
   J5XGoifsvBo64852b13cbGAhy6Ho4Ig1i9fR9Yy2Bcmc1X/bAda8SJXjA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="367803742"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="367803742"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 03:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="755956011"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="755956011"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 10 Jul 2023 03:27:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EDFD31D9; Mon, 10 Jul 2023 13:27:52 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Kris Bahnsen <kris@embeddedTS.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org
Cc: Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH v1 1/8] spi: Remove unneeded OF node NULL checks
Date: Mon, 10 Jul 2023 13:27:44 +0300
Message-Id: <20230710102751.83314-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_032800_901455_18B519AC 
X-CRM114-Status: GOOD (  13.35  )
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

In the couple of places the NULL check of OF node is implied by the call
that takes it as a parameter. Drop the respective duplicate checks.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 9291b2a0e887..8f3282a71c63 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2399,9 +2399,6 @@ static void of_register_spi_devices(struct spi_controller *ctlr)
 	struct spi_device *spi;
 	struct device_node *nc;
 
-	if (!ctlr->dev.of_node)
-		return;
-
 	for_each_available_child_of_node(ctlr->dev.of_node, nc) {
 		if (of_node_test_and_set_flag(nc, OF_POPULATED))
 			continue;
@@ -3134,7 +3131,7 @@ int spi_register_controller(struct spi_controller *ctlr)
 		if (WARN(id < 0, "couldn't get idr"))
 			return id == -ENOSPC ? -EBUSY : id;
 		ctlr->bus_num = id;
-	} else if (ctlr->dev.of_node) {
+	} else {
 		/* Allocate dynamic bus number using Linux idr */
 		id = of_alias_get_id(ctlr->dev.of_node, "spi");
 		if (id >= 0) {
-- 
2.40.0.1.gaa8946217a0b


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
