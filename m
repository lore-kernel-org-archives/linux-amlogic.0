Return-Path: <SRS0=oQoi=CE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A74BC433E5
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 14:58:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4937A2078D
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 14:58:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XouLxhPS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vP/Bl97+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4937A2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uP3QBEI8PckaKI4uIHYIkOpo0ylNo1qKk2LVLUsSQw=; b=XouLxhPSYlQlhHald0kiaQZTJi
	yNBNhKXkPz/fkxK8FduwQHoItLfrfi4ltw6x6Fg8BD7yH0cnNizxifbmVdFF27l7RiHH8NtUBKkKA
	x8YK3m2bznEPIdoEgul2yGpbG5PInMPyBbrh79xr4n2fZUfgrxvOJRQkF68EJL4TF+q7su6tcZbSH
	uqXEXSLlKd091LPRwgiqGP43Wcva2+Fag1EZu1stzxej5Y+K0y1QRKuATcY6ajJ4fGs2oGWIyY06t
	XlFz4+OmE5zXml8NTODCBApuLGfWTSBNnk5lQV7l7bDGoZKmBf02+IPXOzEGmAs1ZDao7xdPbopq+
	6ZnQmMmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAwsf-00057R-6D; Wed, 26 Aug 2020 14:58:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwnk-0002N8-2S; Wed, 26 Aug 2020 14:53:34 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3DB7921741;
 Wed, 26 Aug 2020 14:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598453602;
 bh=L62NHGTlHRmxfW0UXMzF8rz6Eg4TzDjh28d5OkWRb1E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=vP/Bl97+JtTx4OaxuqQf637JfAncWM+cvwXtDyt0M8X8AQGOnemx5q4V2euAPCZtf
 WMttIrtvRRJoKWifKDkfX1+8Lk9eoqJepIe0UPQtCofwtHrOo0FSV5Ulu90tABrKky
 CgwWyQQVxz02bZRXieUrcDYksXCsOiCqHlrCVigs=
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
 Jonathan Bakker <xc-racer2@live.ca>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 14/16] iio: light: isl29018: Simplify with dev_err_probe()
Date: Wed, 26 Aug 2020 16:51:51 +0200
Message-Id: <20200826145153.10444-14-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826145153.10444-1-krzk@kernel.org>
References: <20200826145153.10444-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_105324_251825_B3FCD180 
X-CRM114-Status: GOOD (  14.50  )
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
 drivers/iio/light/isl29018.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/light/isl29018.c b/drivers/iio/light/isl29018.c
index ac8ad0f32689..2689867467a8 100644
--- a/drivers/iio/light/isl29018.c
+++ b/drivers/iio/light/isl29018.c
@@ -746,12 +746,9 @@ static int isl29018_probe(struct i2c_client *client,
 	chip->suspended = false;
 
 	chip->vcc_reg = devm_regulator_get(&client->dev, "vcc");
-	if (IS_ERR(chip->vcc_reg)) {
-		err = PTR_ERR(chip->vcc_reg);
-		if (err != -EPROBE_DEFER)
-			dev_err(&client->dev, "failed to get VCC regulator!\n");
-		return err;
-	}
+	if (IS_ERR(chip->vcc_reg))
+		return dev_err_probe(&client->dev, PTR_ERR(chip->vcc_reg),
+				     "failed to get VCC regulator!\n");
 
 	err = regulator_enable(chip->vcc_reg);
 	if (err) {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
