Return-Path: <SRS0=oQoi=CE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37ED2C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 14:58:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03589214F1
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 14:58:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I80tF8Gw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CVR5kVy6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMZgura2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03589214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJ7t3oM8NpqKAFxccuYwKx6Y8ZYhhptNPwu9i3Ro958=; b=I80tF8GwCF2ytk8LhLTFyxsTjs
	tRaLKI9+9qyJGV9jhhe3hZDty/mH7PGjGKPWnIo0ImHz18j1ZbW0dXiyflLFzOBDRuzVmICznTP4d
	mHSYy5Mrr+WqwZN41FXux75UXhJi/ZPn5oLOBdUGFlreye/aNO1m+hmgV9P94I0r+5usgjLJFiDw0
	gIiZF+riN+0dNRLhJQ7kSSZH1JRzHfkm+hunwCSXEpzjej4lBe/zF4tYDybL/6Sq9ZVbqnhqzsWYK
	p+D/NjkoSt5aPqVmsApQPs5SzQ+lbnCkUa51nVBdUXTICcjI/VimppyP9p9drBhfIb/a31kc71BZ/
	qJpKJYQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAwsd-00056H-BQ; Wed, 26 Aug 2020 14:58:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwnp-0002QY-HJ; Wed, 26 Aug 2020 14:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:To:From:Sender:Reply-To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=65LwSDsbVRrnHT4boryZGcGzfgJVnPr8SUWO4niX+ig=; b=CVR5kVy6ZAFSB3TePBzd7w1N6f
 MTazIsCd3RBAHBnFvx07NXv8QyITHIl1jRkj8gZlvy+XgxN4MdExeZUuq3MohDQdyKrq/n7QkZkj4
 PXKZGgTghpKOuauUgWIOB59NQJxFcO7gW5Q+07Ds/No6Tucj3lMnbWNyTQWD1PuW8Ito2E64M+NoG
 JuwfM+Hrzt4DHiT6r5Vxhe1uPkJxNTnORIQxALhlbQ8wlaCewivMjMIGdq07h2Vby0tjtva/H3MCR
 UxBYeMM3QHShmz9X+gxPlzc3ZeZw5VpaPKdsT0lasNOank3AUS/kMfCexW4psz/uh6FqltB2Mab+w
 avTRtaWQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwnk-0001nJ-0m; Wed, 26 Aug 2020 14:53:27 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 86DCB2177B;
 Wed, 26 Aug 2020 14:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598453594;
 bh=Qo3LbyvmpBGQKG4D/yZypYAesoTm5jVx4P7R/QfNlcY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qMZgura2EYsW2bxG0xHLWT3v4KZYKNJn4qop8HRQH5iq+4faVf9nQrwTotbcbEPkY
 MZsl9iKjz8CrXVxC2l/VPlpgA+2HXRrHV7Y8WdFm9cVVtqlF94M9CeMdr1QLXcUsso
 byEgtFP2Z/C+qUUmdT2VClwjlQ5CO1F4n3kxGbIo=
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
Subject: [PATCH 13/16] iio: imu: inv_mpu6050: Simplify with dev_err_probe()
Date: Wed, 26 Aug 2020 16:51:50 +0200
Message-Id: <20200826145153.10444-13-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826145153.10444-1-krzk@kernel.org>
References: <20200826145153.10444-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_155324_430920_352386E5 
X-CRM114-Status: GOOD (  12.02  )
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
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
index 3fee3947f772..18a1898e3e34 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
@@ -1475,22 +1475,14 @@ int inv_mpu_core_probe(struct regmap *regmap, int irq, const char *name,
 	}
 
 	st->vdd_supply = devm_regulator_get(dev, "vdd");
-	if (IS_ERR(st->vdd_supply)) {
-		if (PTR_ERR(st->vdd_supply) != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get vdd regulator %d\n",
-				(int)PTR_ERR(st->vdd_supply));
-
-		return PTR_ERR(st->vdd_supply);
-	}
+	if (IS_ERR(st->vdd_supply))
+		return dev_err_probe(dev, PTR_ERR(st->vdd_supply),
+				     "Failed to get vdd regulator\n");
 
 	st->vddio_supply = devm_regulator_get(dev, "vddio");
-	if (IS_ERR(st->vddio_supply)) {
-		if (PTR_ERR(st->vddio_supply) != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get vddio regulator %d\n",
-				(int)PTR_ERR(st->vddio_supply));
-
-		return PTR_ERR(st->vddio_supply);
-	}
+	if (IS_ERR(st->vddio_supply))
+		return dev_err_probe(dev, PTR_ERR(st->vddio_supply),
+				     "Failed to get vddio regulator\n");
 
 	result = regulator_enable(st->vdd_supply);
 	if (result) {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
