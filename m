Return-Path: <SRS0=sGw/=2Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E8EC2D0C8
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 02:38:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1538A20740
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 02:38:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qi8fr2Ly"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1538A20740
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GR6o0pI3dKnNloZYObk59VVkI9PwQsw2fvOHRa9v91s=; b=Qi8fr2LyaF8FwQ
	Ly1ErY8flb1BI7TV8fKQa6UEAI5rrjMsXQ3NnSSqPdZq83tSjK+lpw7Pag2R3XzMMMGYo06VADR5W
	AbfZrhvOBX89IpPBF+8o8jpWuJ2udazVcaHVB/CL04YKsTOUajLG1yt4Jfm0mkAo29fl3wt8x/KoV
	tPnvsG9eAyE1LUFlxeca/h6Qaqn7jy20DZI3JSQLslhWwHQIKw5V+ndIuLLuYlfsORUAYO6pcssOh
	gnZXPPmfMyDW98PXq3mLW8fJn2y08s20qmBGW68m/jhWUgLxvgztF6ksDP0eVL+1otwv/6KqKzOcw
	tHLBLnUiNofPXmTwo5PQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikJ2M-0001oV-Tr; Thu, 26 Dec 2019 02:38:06 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikJ2C-0001g2-1W; Thu, 26 Dec 2019 02:37:57 +0000
Received: from localhost.localdomain (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Thu, 26 Dec 2019
 10:37:57 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH] pinctrl: meson: Fix wrong shift value when get drive-strength
Date: Thu, 26 Dec 2019 10:37:34 +0800
Message-ID: <20191226023734.9631-1-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191225_183756_083699_FADF4421 
X-CRM114-Status: UNSURE (   6.43  )
X-CRM114-Notice: Please train this message.
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
Cc: Qianggui Song <qianggui.song@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Xingyu Chen <xingyu.chen@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

In meson_pinconf_get_drive_strength, variable bit is calculated by
meson_calc_reg_and_bit, this value is the offset from the first pin of a
certain bank to current pin, while Meson SoCs use two bits for each pin
to depict drive-strength. So a left shift by 1 should be done or node
pinconf-pins shows wrong message.

Fixes: 6ea3e3bbef37 ("pinctrl: meson: add support of drive-strength-microamp")

Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 3c80828a5e50..bbc919bef2bf 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -441,6 +441,7 @@ static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
 		return ret;
 
 	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
+	bit = bit << 1;
 
 	ret = regmap_read(pc->reg_ds, reg, &val);
 	if (ret)
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
