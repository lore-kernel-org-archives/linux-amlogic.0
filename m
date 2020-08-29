Return-Path: <SRS0=Pllw=CH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF49C433E6
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 06:50:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E00CA20E65
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 06:50:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vY1qPMJw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="thEheuIY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E00CA20E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCZIsX+csQiXkeUjmHBmP1Bp+WbxAgLHCT/Fl/53uJY=; b=vY1qPMJwB5VoelQ/VCSbJxFx+W
	8O7EKks0Gp0TKCxPqINshk3FIZhcsNwE25Y/Hl6UhcVoNrW+pmVxweWRS2F7818Cjpe3ZtEP3LWdc
	Jm8MQtJ2njlYqXW6aJDBvrLrgNqzLUDEX7VJTIULKT655JhezwTs8woslTf3i9ox+XMUIb5RXCd5j
	CuJREBOxCYkwStJT+r0bkqi41FM1DznvxA8BCziD3dV6wVNcQyF22d4nyE/aG6R/xx4aCcCbNycYr
	ieJUZTCwcqH6GmgkCtLzTzaH6bNdxAMv/vEVFWS0Xvx0WP7a+hz5EYt0ygB2dYNPYXCi7xYUWrmcp
	2tQLwYPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBugp-0003gU-Bx; Sat, 29 Aug 2020 06:50:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBufF-0002uB-P5; Sat, 29 Aug 2020 06:48:39 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC1602145D;
 Sat, 29 Aug 2020 06:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598683717;
 bh=f6+Tik++luo2PZ4Mb2eOWG5RToVxg+N7sCh7U3p3bZ8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=thEheuIYmGXal/L7ScJpySupzF+kcZenN/wAYN1aU8WkvzbtgSihXdvgL+rLOi1i1
 UY59B5HgzprHiRaWT/pGM10SlFXQx8P6ay+BHX86+1rCtDJ/EML25//SBRyEpzjFMt
 qJZqhXWIq6e0ppCE+CaKTEG+FYiz9Q8cNiJa1Xt0=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Peter Rosin <peda@axentia.se>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 10/18] iio: amplifiers: hmc425a: Simplify with
 dev_err_probe()
Date: Sat, 29 Aug 2020 08:47:18 +0200
Message-Id: <20200829064726.26268-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200829064726.26268-1-krzk@kernel.org>
References: <20200829064726.26268-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_024837_919272_B9B3EDC8 
X-CRM114-Status: GOOD (  14.71  )
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

Changes since v2:
1. Wrap dev_err_probe() lines at 80 character

Changes since v1:
1. Wrap dev_err_probe() lines at 100 character
---
 drivers/iio/amplifiers/hmc425a.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/amplifiers/hmc425a.c b/drivers/iio/amplifiers/hmc425a.c
index 582708924e4f..9efa692151f0 100644
--- a/drivers/iio/amplifiers/hmc425a.c
+++ b/drivers/iio/amplifiers/hmc425a.c
@@ -201,12 +201,9 @@ static int hmc425a_probe(struct platform_device *pdev)
 	st->gain = st->chip_info->default_gain;
 
 	st->gpios = devm_gpiod_get_array(&pdev->dev, "ctrl", GPIOD_OUT_LOW);
-	if (IS_ERR(st->gpios)) {
-		ret = PTR_ERR(st->gpios);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "failed to get gpios\n");
-		return ret;
-	}
+	if (IS_ERR(st->gpios))
+		return dev_err_probe(&pdev->dev, PTR_ERR(st->gpios),
+				     "failed to get gpios\n");
 
 	if (st->gpios->ndescs != st->chip_info->num_gpios) {
 		dev_err(&pdev->dev, "%d GPIOs needed to operate\n",
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
