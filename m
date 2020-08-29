Return-Path: <SRS0=Pllw=CH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A29C433E7
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 06:48:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D1C821527
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 06:48:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f1eKUzZD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="v1itUy8P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D1C821527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HYfWGd3PIaVjjNVsl+4/GqYbbbL+CkDNaypp4RLyJCo=; b=f1eKUzZDTKSiDDQ37qggc/O5Ao
	1wePwCU2Dua5UvK/C6ejx1SjPGaSgC2VhQ1IdoWWksff6dbm/7pZ1GziRPpbVVtc84MZAhNidXiq3
	xI0uN6Tj0449ls9PaQX47Io+WdUHShiK8M+lDk2uDMQgoqaW+UNmu5tnhUGw0VG2dxUiGxJChsJPv
	xYBDNyxy1XgVNQaWWkJShv32YRQgBNUnAKjsWUJA9ghGYOgg+TWBEAxIIYk4PiPE/gic64oD7mpk+
	XladQjPVcDRBNvEITbIl1XsKg7namRnXOUeJ8Sb+3cCpooyx+UXsl7sO42jwmoLvCtBnqdaCAInU3
	EylYepZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBuem-0002iV-Vn; Sat, 29 Aug 2020 06:48:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBuel-0002i0-4S; Sat, 29 Aug 2020 06:48:07 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8734B20838;
 Sat, 29 Aug 2020 06:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598683685;
 bh=yjKI4zUzuXR+IVjk7uHyPqKHxj0RHDSmODneNvcyT0g=;
 h=From:To:Cc:Subject:Date:From;
 b=v1itUy8PJxMJU90/s/P4twMjMOdkFOc+jJ43EZmEUWpZ1BwoaDCntjPop5LrTaebQ
 l+VF63Yd2eaCVhuqI5BNiG5LmTZ2abboHxbQkBOJnNZ0KUc0o+rm19ThGyKxS+1H3W
 aExY/a1lCtxl0Fg/Geuvk5zMc54z1F3BuXftNjvg=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Peter Rosin <peda@axentia.se>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 01/18] iio: accel: bma180: Simplify with dev_err_probe()
Date: Sat, 29 Aug 2020 08:47:09 +0200
Message-Id: <20200829064726.26268-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_024807_264443_3B935B9B 
X-CRM114-Status: GOOD (  13.52  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/iio/accel/bma180.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/accel/bma180.c b/drivers/iio/accel/bma180.c
index 5b7a467c7b27..448faed001fd 100644
--- a/drivers/iio/accel/bma180.c
+++ b/drivers/iio/accel/bma180.c
@@ -1000,19 +1000,15 @@ static int bma180_probe(struct i2c_client *client,
 		return ret;
 
 	data->vdd_supply = devm_regulator_get(dev, "vdd");
-	if (IS_ERR(data->vdd_supply)) {
-		if (PTR_ERR(data->vdd_supply) != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get vdd regulator %d\n",
-				(int)PTR_ERR(data->vdd_supply));
-		return PTR_ERR(data->vdd_supply);
-	}
+	if (IS_ERR(data->vdd_supply))
+		return dev_err_probe(dev, PTR_ERR(data->vdd_supply),
+				     "Failed to get vdd regulator\n");
+
 	data->vddio_supply = devm_regulator_get(dev, "vddio");
-	if (IS_ERR(data->vddio_supply)) {
-		if (PTR_ERR(data->vddio_supply) != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get vddio regulator %d\n",
-				(int)PTR_ERR(data->vddio_supply));
-		return PTR_ERR(data->vddio_supply);
-	}
+	if (IS_ERR(data->vddio_supply))
+		return dev_err_probe(dev, PTR_ERR(data->vddio_supply),
+				     "Failed to get vddio regulator\n");
+
 	/* Typical voltage 2.4V these are min and max */
 	ret = regulator_set_voltage(data->vdd_supply, 1620000, 3600000);
 	if (ret)
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
