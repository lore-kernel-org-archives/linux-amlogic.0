Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBD1C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:30:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B5F120714
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 19:30:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gDJpk7At";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ox3ATot+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B5F120714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejQ9nLjtL1ae4EFz2WQA+o6NYo+hTX5gCuCDJ8scHuQ=; b=gDJpk7AtPSQSx8LfSwlV0Q8Jg/
	xWqkXhwn/8LqFnH21mefQ86Eg0xt566AhilKiwPukvT+ZMO+eq7VrJDMDLa+uzUmOv/Z9zej1SNXh
	l0mDI/fir3hOEJ/7Uj1Ew700kT9YSEwxRK0soWTAhlrRSCTtFlJdFEgJTriINObI+MNXgfsQzH/O2
	Thj4F5DeMJK6lpqK38mUYld7P+/05j0/62bUw1kdfhPP7wxM3/3JFtZNfaki5bxaFL9G3deOq7+1S
	z40A/MN0QenWa0GsmFQEzhB8jGfrd94U66iIg6cdL/ApxEdoBmUDsE9ODmsU5Fpxvz4OOTuXs2oUU
	lh38YC/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBNb5-0007EY-Dz; Thu, 27 Aug 2020 19:30:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBNZW-0006Q5-Ub; Thu, 27 Aug 2020 19:28:32 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8AAA207CD;
 Thu, 27 Aug 2020 19:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598556510;
 bh=JDW+si4kpBNxVKzKilmgyZMG73ode2zg5DMZD3yhgec=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ox3ATot+EWc0ejxtrSSuOXWOBfPNHIY48U6UZqrsszLrWw2grNY5Ca0wTT0ZHuYIU
 PynzLstLMlDwxkT6dMacAIYEjrsGcxd7+HRuK/ZlBlJZEF3S5z5DNTmWpqMPFH0xs8
 CZsFrlTBBAwzKmqUzPKYyBoFTMIz2SxrvzqkJ/kE=
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
Subject: [PATCH v2 10/18] iio: amplifiers: hmc425a: Simplify with
 dev_err_probe()
Date: Thu, 27 Aug 2020 21:26:34 +0200
Message-Id: <20200827192642.1725-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827192642.1725-1-krzk@kernel.org>
References: <20200827192642.1725-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_152831_198119_43AEA251 
X-CRM114-Status: GOOD (  15.84  )
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

Changes since v1:
1. Wrap dev_err_probe() lines at 100 character
---
 drivers/iio/amplifiers/hmc425a.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/amplifiers/hmc425a.c b/drivers/iio/amplifiers/hmc425a.c
index 582708924e4f..bde11df4bb9e 100644
--- a/drivers/iio/amplifiers/hmc425a.c
+++ b/drivers/iio/amplifiers/hmc425a.c
@@ -201,12 +201,8 @@ static int hmc425a_probe(struct platform_device *pdev)
 	st->gain = st->chip_info->default_gain;
 
 	st->gpios = devm_gpiod_get_array(&pdev->dev, "ctrl", GPIOD_OUT_LOW);
-	if (IS_ERR(st->gpios)) {
-		ret = PTR_ERR(st->gpios);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "failed to get gpios\n");
-		return ret;
-	}
+	if (IS_ERR(st->gpios))
+		return dev_err_probe(&pdev->dev, PTR_ERR(st->gpios), "failed to get gpios\n");
 
 	if (st->gpios->ndescs != st->chip_info->num_gpios) {
 		dev_err(&pdev->dev, "%d GPIOs needed to operate\n",
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
