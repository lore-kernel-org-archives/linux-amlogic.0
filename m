Return-Path: <SRS0=oQoi=CE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F8EC433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 14:58:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3DBE2078D
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 14:58:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FGclgTIL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="s2IGm5sj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1yTKeOD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3DBE2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16ovxOmSrNjxpKydIctjavi+/vbdlm6tkmCIluP4l6w=; b=FGclgTILhuN2GHdj6Gm2VMX5Ta
	uPQFN4lOgigL+dawx3FtIXiwcjGLWvvVqu5LgipYdDJ2WkJ2HV1KRXU6MW1vaWr+1TvnVznMJOUjU
	4OSVCYa8RfNfxeXC0Jyi5Tn/j6iPKwTu6p0CK0jzvZ+ZVlPrvFT0BlCvDnFkjZIrdIY2JAST5xBIM
	ciQvcmEXC/+KfqxeatK3/A+yu0DodB230KiPdNAdaDxYIgRnlkyZIGNZVj0OHdP4S5mGRGyvaRjiT
	4Rcou/luZYpPAwcgIxwFqIo+m8KvG1VKig0eE3jEv0fUerPRVJK8D8oYPdg0FPy93F/8PZDiK+0nL
	nOtJKDXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAwss-0005HD-0j; Wed, 26 Aug 2020 14:58:42 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwo4-0002Xb-I8; Wed, 26 Aug 2020 14:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:To:From:Sender:Reply-To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Jkk9hnWdU6WDrK5hSc8ORqwJ59asznv/2+5x6DD2GXc=; b=s2IGm5sj5Ub7CAZnaBd65D1VNd
 5FlR5nwfqYn322+vrcj+IDk611WYnzcLp/Js0JPDdj18keATsyBonWXa0NCYaLhavzHGqxR3vQWuI
 BMZ8ae9zapb488MDk1WTi/Z3xn3JeMTlJPtz+178pSu3Nat8+RQ5hZq0Kef0YrLdRHhfpQm92mV9W
 576kOtxcnyIidY9eX91r+/GSVpMsQC10ODzlww26tOG2cibZKtJcjkyxQgQANgMlsWvtgXr/MEB7a
 2FHzgMOkm3i5uFBy5+ysR7d19/hMjlb/4ESlPFnSjRDHfSe/uX1Krne4yj1mbjAeHqL2lKlI2DGV6
 HTj5krvw==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwnx-0001qx-7B; Wed, 26 Aug 2020 14:53:40 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 06B9A2177B;
 Wed, 26 Aug 2020 14:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598453615;
 bh=v/Zb3PmGpo5l2DvxNKoEoZ/zVbV6OtENUtPofNroKvs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=G1yTKeODAnBmqu0tCCEEeOyfX9WSgWuaRVB3SQP1H4qDRVlOSt+hpoRkjYlGCBeok
 gmAK8tht/DTIU8dviczhNyYxIUUm3LiA3INTKD5WTXuyCsmJyzN0tD+pJ8COzkkiWo
 7i/+1mvilt2zqVD/ofW0B8ni0jFzO+qcRjHUi2ro=
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
Subject: [PATCH 16/16] iio: magnetometer: ak8974: Simplify with dev_err_probe()
Date: Wed, 26 Aug 2020 16:51:53 +0200
Message-Id: <20200826145153.10444-16-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826145153.10444-1-krzk@kernel.org>
References: <20200826145153.10444-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_155337_563230_FA404C0F 
X-CRM114-Status: GOOD (  12.64  )
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
 drivers/iio/magnetometer/ak8974.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/magnetometer/ak8974.c b/drivers/iio/magnetometer/ak8974.c
index cbb44e401c0a..fa6a8e1a815c 100644
--- a/drivers/iio/magnetometer/ak8974.c
+++ b/drivers/iio/magnetometer/ak8974.c
@@ -843,15 +843,9 @@ static int ak8974_probe(struct i2c_client *i2c,
 	ret = devm_regulator_bulk_get(&i2c->dev,
 				      ARRAY_SIZE(ak8974->regs),
 				      ak8974->regs);
-	if (ret < 0) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&i2c->dev, "cannot get regulators: %d\n", ret);
-		else
-			dev_dbg(&i2c->dev,
-				"regulators unavailable, deferring probe\n");
-
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&i2c->dev, ret,
+				     "cannot get regulators\n");
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ak8974->regs), ak8974->regs);
 	if (ret < 0) {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
