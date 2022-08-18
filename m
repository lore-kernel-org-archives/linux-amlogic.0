Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786D3C00140
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Aug 2022 07:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wnvtgTrDW66gMTfirPJRol844zIW7DGbQubzWv+5gIk=; b=yNlJDsgHldLXH/
	DrpO2CvNzmwjcSyIcdA1JTzKe4ecGqmVAJKc8l1zbAcw0MZb1CFyfrvNDPcO9YHxi5sNCDHSYk9TS
	D38j19EuAyOmMQMr9BnDkHgHz+3H9oJh84S5E0kgMCMQu0TasOXaqaIVc0t03HKMlVL+LrbD6OfA+
	Iq0LgY2koUtaOp1DpiAqr4MCVJbg/ylLHJdZcVXmOGrPH0KPfWEFN7LfpMg7kZVKaX7/DeqdMHx4d
	NEwbUFjYhXbB81EtxFovcskkbgheyjCO/BYMC/SmOQ0r4hGQ8DcdbvhODqRlGS41kGBSRoKwylV3e
	DqHrxqq1Z0fXLrzvKmDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOZsF-0002My-4F; Thu, 18 Aug 2022 07:23:27 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOZsA-0001vk-KS; Thu, 18 Aug 2022 07:23:25 +0000
X-QQ-mid: bizesmtp90t1660807358thkgk558
Received: from localhost.localdomain ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 18 Aug 2022 15:22:36 +0800 (CST)
X-QQ-SSF: 01400000002000D0U000B00A0000000
X-QQ-FEAT: eCJvJF4ptHBiBmR9azarm3lgcJ4dN65tE+tjAFsTWkhYPsqr/69XgUGBD+grm
	yR7HtMUrVdsfxz2r73Dl3qSc+ZIzIxF7xdtYffxYAUwW+v1GB93w9ae0izDtxWhoGpHfRgI
	yyjhBmJb1PyglhGtlONaCLJEEKFFVDixfKO9hMEA9KNsIXHvOqiY9uwtJLukLTdD1Y2vkV2
	u1bTHEohr7O9wO9llyQiSb/7nGsYSLa0o0JfFa8AiGyzrb8YLM3I49D+Imkehu68pVryty6
	YGrvsfsXi8k0kxfekvlptbZDoO0riJcwg+IAHsYDVdMUeGn1OAi/xFvlFOk50fE32l+wthU
	wtxq7ZE5iTdFNjs0z88xZpSMOR9V8WEj4wwUS2dLLIuRztK1aXx9if4iNPFew==
X-QQ-GoodBg: 2
From: zhaoxiao <zhaoxiao@uniontech.com>
To: thierry.reding@gmail.com,
	narmstrong@baylibre.com,
	khilman@baylibre.com
Cc: u.kleine-koenig@pengutronix.de,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH] pwm: meson: Simplify probe function with dev_err_probe()
Date: Thu, 18 Aug 2022 15:22:34 +0800
Message-Id: <20220818072234.9640-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_002323_426486_E67E70F7 
X-CRM114-Status: GOOD (  10.67  )
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

Switch to dev_err_probe() to remove all dev_err() -> return repeated
patterns, simplifying and shortening the probe function.

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 drivers/pwm/pwm-meson.c | 53 ++++++++++++++---------------------------
 1 file changed, 18 insertions(+), 35 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 57112f438c6d..43ce8d9a33d2 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -126,20 +126,16 @@ static int meson_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
 
 	if (channel->clk_parent) {
 		err = clk_set_parent(channel->clk, channel->clk_parent);
-		if (err < 0) {
-			dev_err(dev, "failed to set parent %s for %s: %d\n",
+		if (err < 0)
+			return dev_err_probe(dev, err, "failed to set parent %s for %s\n",
 				__clk_get_name(channel->clk_parent),
-				__clk_get_name(channel->clk), err);
-			return err;
-		}
+				__clk_get_name(channel->clk));
 	}
 
 	err = clk_prepare_enable(channel->clk);
-	if (err < 0) {
-		dev_err(dev, "failed to enable clock %s: %d\n",
-			__clk_get_name(channel->clk), err);
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(dev, err, "failed to enable clock %s\n",
+			__clk_get_name(channel->clk));
 
 	return 0;
 }
@@ -166,24 +162,18 @@ static int meson_pwm_calc(struct meson_pwm *meson, struct pwm_device *pwm,
 		duty = period - duty;
 
 	fin_freq = clk_get_rate(channel->clk);
-	if (fin_freq == 0) {
-		dev_err(meson->chip.dev, "invalid source clock frequency\n");
-		return -EINVAL;
-	}
+	if (fin_freq == 0)
+		return dev_err_probe(meson->chip.dev, -EINVAL, "invalid source clock frequency\n");
 
 	dev_dbg(meson->chip.dev, "fin_freq: %lu Hz\n", fin_freq);
 
 	pre_div = div64_u64(fin_freq * (u64)period, NSEC_PER_SEC * 0xffffLL);
-	if (pre_div > MISC_CLK_DIV_MASK) {
-		dev_err(meson->chip.dev, "unable to get period pre_div\n");
-		return -EINVAL;
-	}
+	if (pre_div > MISC_CLK_DIV_MASK)
+		return dev_err_probe(meson->chip.dev, -EINVAL, "unable to get period pre_div\n");
 
 	cnt = div64_u64(fin_freq * (u64)period, NSEC_PER_SEC * (pre_div + 1));
-	if (cnt > 0xffff) {
-		dev_err(meson->chip.dev, "unable to get period cnt\n");
-		return -EINVAL;
-	}
+	if (cnt > 0xffff)
+		return dev_err_probe(meson->chip.dev, -EINVAL, "unable to get period cnt\n");
 
 	dev_dbg(meson->chip.dev, "period=%u pre_div=%u cnt=%u\n", period,
 		pre_div, cnt);
@@ -200,10 +190,8 @@ static int meson_pwm_calc(struct meson_pwm *meson, struct pwm_device *pwm,
 		/* Then check is we can have the duty with the same pre_div */
 		duty_cnt = div64_u64(fin_freq * (u64)duty,
 				     NSEC_PER_SEC * (pre_div + 1));
-		if (duty_cnt > 0xffff) {
-			dev_err(meson->chip.dev, "unable to get duty cycle\n");
-			return -EINVAL;
-		}
+		if (duty_cnt > 0xffff)
+			return dev_err_probe(meson->chip.dev, -EINVAL, "unable to get duty cycle\n");
 
 		dev_dbg(meson->chip.dev, "duty=%u pre_div=%u duty_cnt=%u\n",
 			duty, pre_div, duty_cnt);
@@ -509,11 +497,8 @@ static int meson_pwm_init_channels(struct meson_pwm *meson)
 		channel->mux.hw.init = &init;
 
 		channel->clk = devm_clk_register(dev, &channel->mux.hw);
-		if (IS_ERR(channel->clk)) {
-			err = PTR_ERR(channel->clk);
-			dev_err(dev, "failed to register %s: %d\n", name, err);
-			return err;
-		}
+		if (IS_ERR(channel->clk))
+			return dev_err_probe(dev, PTR_ERR(channel->clk), "failed to register %s\n", name);
 
 		snprintf(name, sizeof(name), "clkin%u", i);
 
@@ -550,10 +535,8 @@ static int meson_pwm_probe(struct platform_device *pdev)
 		return err;
 
 	err = devm_pwmchip_add(&pdev->dev, &meson->chip);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to register PWM chip: %d\n", err);
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(&pdev->dev, err, "failed to register PWM chip\n");
 
 	return 0;
 }
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
