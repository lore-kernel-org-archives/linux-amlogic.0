Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D1AC433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:30:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68AB9207DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:30:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rYCTBCgw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gsfd2cae"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68AB9207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cv6JuaXSOT8eOYO3TFIuw1ZXwhG2BMUbDPjQyc1M05c=; b=rYCTBCgwAxzMZnf4DojWeRnEiv
	8uDW0Ua52w7ZEn0qyh4LEBfoTd3xeG6azQfbxiSwv5TWb6otTcqF7UhUOpmr8+D5ljofnoURg4fpQ
	hxkJOsKimZaise8dKl+8IyAxMIKFJTbj3KxeCY3m0kPXy6eeFL9uE9MACuAeOwfuRi8Zdmx9fKJDt
	GuidhhfHLygmUFLflNdD1iYAwJjldxXyq0z4DylqKxY13SZwoN4xVHr98D/wV4EoAXcMQA0mBMTW0
	zd8R4jDD4H8iG4LlJAg5gN77eID8DTklGAFQPpFqgoPYdG51mGKQZp3CiGpAY1wcWZTxyteV/mw16
	OjZmIsBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBNb8-0007Gy-6F; Thu, 27 Aug 2020 19:30:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBNZe-0006U1-6J; Thu, 27 Aug 2020 19:28:39 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6FD6322CAF;
 Thu, 27 Aug 2020 19:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598556516;
 bh=X1W0PzSz8JAQ2Wim9RQvp9YS6C8n7Io0DSsH6zFBFQc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Gsfd2caeBHKY0vWdsUPo4XNAU+ooS5fvtQ2z5WHLpESCCzoR689Z9u9buf1i5PARP
 AVNXERHSAWrKZDJ5YR67LdHEDzY74qCW772IKe3wcoZj2OB23Qps8pvMkH0xsoyui8
 PmBIa4o9PfYpbUd/BL691P4eUcDuSfG88hTLJugY=
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
Subject: [PATCH v2 11/18] iio: chemical: scd30: Simplify with dev_err_probe()
Date: Thu, 27 Aug 2020 21:26:35 +0200
Message-Id: <20200827192642.1725-11-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827192642.1725-1-krzk@kernel.org>
References: <20200827192642.1725-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_152838_356251_04F1A016 
X-CRM114-Status: GOOD (  16.12  )
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
Acked-by: Tomasz Duszynski <tomasz.duszynski@octakon.com>

---

Changes since v1:
1. Wrap dev_err_probe() lines at 100 character
2. Add Ack
---
 drivers/iio/chemical/scd30_core.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/chemical/scd30_core.c b/drivers/iio/chemical/scd30_core.c
index eac76972f83e..4d0d798c7cd3 100644
--- a/drivers/iio/chemical/scd30_core.c
+++ b/drivers/iio/chemical/scd30_core.c
@@ -705,13 +705,8 @@ int scd30_probe(struct device *dev, int irq, const char *name, void *priv,
 	indio_dev->available_scan_masks = scd30_scan_masks;
 
 	state->vdd = devm_regulator_get(dev, "vdd");
-	if (IS_ERR(state->vdd)) {
-		if (PTR_ERR(state->vdd) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		dev_err(dev, "failed to get regulator\n");
-		return PTR_ERR(state->vdd);
-	}
+	if (IS_ERR(state->vdd))
+		return dev_err_probe(dev, PTR_ERR(state->vdd), "failed to get regulator\n");
 
 	ret = regulator_enable(state->vdd);
 	if (ret)
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
