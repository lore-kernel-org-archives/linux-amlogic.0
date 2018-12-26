Return-Path: <SRS0=WmWE=PD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F84AC43387
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Dec 2018 22:40:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E9F221902
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Dec 2018 22:40:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d1J7ksTd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VV+YmzOf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E9F221902
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WVKnKj/XhdcqRnPHqdVFODOTOWoGwLXWPI5HyyxZPZo=; b=d1J7ksTd7HarlV
	y2uLUjh34N58WLuE3WIoeMHaB3+Euly/n7IV/PSRhwfZgyFODvbZg/Lov+PkWJpH6RABDoG3QDrsS
	dYzsgRX2Y334taWIAcYCtX2rhsSFDGG3VEGMXpdKz7BfRuZOeMrofiv4SsPIHYnx2Nv+YHKpD7hgu
	9NxhUMKW0k54vOI6gKDT3GA4K4LdJwhuIEtLGwLNJClyUdImXbakZYe+rKgino9q6cj8AKlMRZBG1
	0Qw3EdQ+5kMg6xi/zlD6OzE4pKe6ZhRJltOYJjzC6xQGxbRhThlFHYvdNxIw8298ZMmWBeVGesaXd
	ZBBeBnX9mBuHbMDs2Udw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcHqU-0001cu-3i; Wed, 26 Dec 2018 22:40:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcHqR-0000MJ-PJ
 for linux-amlogic@lists.infradead.org; Wed, 26 Dec 2018 22:40:09 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ADD812054F;
 Wed, 26 Dec 2018 22:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1545863997;
 bh=pP6hb9A13E/UpzViz3OCPKObvmNPMcAEWslKKvarim8=;
 h=From:To:Cc:Subject:Date:From;
 b=VV+YmzOf7j/RA7SE9/aEnyiPnzeWMf3v1ggHZ5nCB5A0e0VXQdDhrYqSSw1EDNs3y
 u/9K1BwbTWL0k9Y7swK7k4xGCig5yn8TYPHuANhgr0BeBW1Hgd6rG+h6VWomc/p0L6
 bp3bPbyQXwoGbME9bcQelvyQoocek9sK+tOkogV8=
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 01/59] pinctrl: meson: fix pull enable register
 calculation
Date: Wed, 26 Dec 2018 17:37:41 -0500
Message-Id: <20181226223839.150262-1-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181226_144007_847301_C02222FA 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

[ Upstream commit 614b1868a125a0ba24be08f3a7fa832ddcde6bca ]

We just changed the code so we apply bias disable on the correct
register but forgot to align the register calculation. The result
is that we apply the change on the correct register, but possibly
at the incorrect offset/bit

This went undetected because offsets tends to be the same between
REG_PULL and REG_PULLEN for a given pin the EE controller. This
is not true for the AO controller.

Fixes: e39f9dd8206a ("pinctrl: meson: fix pinconf bias disable")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 6c43322dbb97..2998941fdeca 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -272,7 +272,8 @@ static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
 		case PIN_CONFIG_BIAS_DISABLE:
 			dev_dbg(pc->dev, "pin %u: disable bias\n", pin);
 
-			meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
+			meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg,
+					       &bit);
 			ret = regmap_update_bits(pc->reg_pullen, reg,
 						 BIT(bit), 0);
 			if (ret)
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
