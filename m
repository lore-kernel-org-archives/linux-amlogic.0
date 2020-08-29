Return-Path: <SRS0=Pllw=CH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1B1C433E6
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 06:50:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87F4C20E65
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 06:50:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rPbHs39p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tQ+mYcty"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87F4C20E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uB/3nQzAgz2vsIRZMoN//MEp6hw4bKKvAFRlvp63kPg=; b=rPbHs39pgczOTibVy7ZzJy89RI
	Nsjep3rPXhzcSgXkR+kW8df8zzaa5ftBRwxy5wtWwfVxVFn4mun3pY9CQ08GsMOu71405JKHWmmZ1
	jI6Ij96TGxsyLduB02jcf1P7Hm2igqePVJjim1erjKXKFG8sQo6mNMfQOXbxCG9fSzSznSG9qaegQ
	sV0s5XbvOmCRYxeIKpSLiJJqqBQQEzNB2ahgQfPq5y6LMbEeocprVIYkAkB8A53zboDun5qAcFwkP
	AEWPmO3XMGNZ+8XsWm8fbHYK8xOjTMOt5H/XKWM3Ovi+bSgo1nTviJFpzSQgZgpewJexyu8Gds7X6
	K3Eu8tow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBuhO-00043f-8i; Sat, 29 Aug 2020 06:50:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBufT-00030V-PQ; Sat, 29 Aug 2020 06:48:54 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E72942151B;
 Sat, 29 Aug 2020 06:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598683731;
 bh=NdE0qL8/9TQ4ofdmnRN532/vnFt98MJgcnCVFwewxjA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tQ+mYctyziyAIhdjRXZ+tpWU2GXq+jUCvq0rJfQp54a53yr+/3v+RdW1Z3JKk3gdZ
 UCfdsW9sbzvEEBFR4MFSsFLmph2+zWy+BxEiOwy8OXCLDrgR/4hCRR/Z5/XjKPGcQN
 Fy8GFEaunbF23avS3ip9Bbwc+3WKu5b31DnDCpE8=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Peter Rosin <peda@axentia.se>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 14/18] iio: light: isl29018: Simplify with dev_err_probe()
Date: Sat, 29 Aug 2020 08:47:22 +0200
Message-Id: <20200829064726.26268-14-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200829064726.26268-1-krzk@kernel.org>
References: <20200829064726.26268-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_024852_945433_903C8B6A 
X-CRM114-Status: GOOD (  14.27  )
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
