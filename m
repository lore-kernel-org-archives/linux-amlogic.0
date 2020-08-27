Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912BBC433E5
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:27:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59B1622BEB
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:27:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L/ebJBYJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vDACDjMN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59B1622BEB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tDpX+35qbSFMmE3iJfZ73sDsior0TgGAEL8inQZmfN4=; b=L/ebJBYJsevcCXmPfsdZUJpEKW
	QgPzmT51dce/P+dRWEXklXgknWuJc5u/Cec8x5fQ0BdYAfGhtCv6gZqjQMUojvt4wZ9tDpn/Nb4Be
	OWeJGhRnXz3IxAYGGbLgp0y9dpl11R+JDRn85lJ/sa34mLBskgYV0so9TbLofJrOMFEL/1AifBstI
	kyBNJKZyLy4YzKETgeunxHsuQEMsheoNrxeV8sM4xIZohT41cjW6HOlckIZhiwxRV4TlQbzgCF9C4
	2x26Aex+velpX7rMuQdgaO13tuWv+39N+O7CdwNen+XusipNs9t8EgURUzxtDuQDxDrXphgxdRJPe
	Gz9C5ENw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBNYb-00061v-R3; Thu, 27 Aug 2020 19:27:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBNYZ-00061D-Pe; Thu, 27 Aug 2020 19:27:32 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 06074207CD;
 Thu, 27 Aug 2020 19:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598556450;
 bh=lwcapEqh1mnH2bnwZTOp+jWQ1z3sGCNA5lWoA1rbyV4=;
 h=From:To:Subject:Date:From;
 b=vDACDjMN6Ffk+dwJKEXdyHNYQl1LSRhWd4rY8FxqjQSlr3i+YVbeUVTTxaYwPuBLG
 Lr/cR0dCM+SEssxNVdI6rwYQTXpXr1iBRY3N+itjh9g+lhC9yZbflbrJ7DfFgCM4Ju
 wV+IT1ulsV3Xks9GuVRprBDSrQNGt8UtfSolXT94=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Peter Rosin <peda@axentia.se>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 01/18] iio: accel: bma180: Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 21:26:25 +0200
Message-Id: <20200827192642.1725-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_152731_903954_8AC5CEDF 
X-CRM114-Status: GOOD (  14.43  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
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
