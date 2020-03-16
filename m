Return-Path: <SRS0=TbEC=5B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D691DC5ACC0
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2020 02:35:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BDBA2074C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2020 02:35:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jmlvPinf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="15z2Hr4N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BDBA2074C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTHXC+GT0+Q8ndP01F3bEqrFVfokvrFHttkv28y+4fY=; b=jmlvPinfqGnRpt
	OBShFZZG9XGaj83tz35Zv0ZQdqZV11Ofq7bDpPmmmeBVMPi40eIE3G2u7jCg5WbEosscxt09lmnzP
	q71wveR6iBOjhjnwAZSnINdG4C/abG4xpoVH2TmW0YFLej/6Tleg4pKmcmnezM7P61ETTOcsZStZF
	drhkEUcfynvH9UJMpUqMlzhnz4pPxq1RPP1YVCR/XqBfRq4tsPvcw8YsioO1+E3GBqi7Nei2NW/wB
	O6pJnM1byxiPtQWqTtvaizhI0hrgZKEECbE0CsU1G7MTwv5iVyuO1wl8YE6Z7YFgMhJBNw7iEbL9W
	ISKRhxzsg85/W0fG93PA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDfbX-0005AY-4s; Mon, 16 Mar 2020 02:35:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDfZM-0002Az-60; Mon, 16 Mar 2020 02:33:34 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28F8B20722;
 Mon, 16 Mar 2020 02:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584326011;
 bh=zfd67u+rmC+7o1QvaUow5GVSNreqIe3rocf3yS5pvKo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=15z2Hr4N62lgDadgu2e6hhFsEsBVengXHRV3veArs8MJzogYZAAdxI1NOUHxS9adh
 0Xx9A+ttRGdQNuCDWBnCZfhdYlkMr/yD8/d5EEuB/5vrVwOvcNWb3tEHNFmn7Fn4+v
 tpPGmV1/xwKc1LKtDOlUDXzVR1KDIZ+2xXaD83CE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 09/41] ASoC: meson: g12a: add tohdmitx reset
Date: Sun, 15 Mar 2020 22:32:47 -0400
Message-Id: <20200316023319.749-9-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316023319.749-1-sashal@kernel.org>
References: <20200316023319.749-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200315_193332_266588_132696A0 
X-CRM114-Status: UNSURE (   9.24  )
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
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

[ Upstream commit 22946f37557e27697aabc8e4f62642bfe4a17fd8 ]

Reset the g12a hdmi codec glue on probe. This ensure a sane startup state.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20200221121146.1498427-1-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/meson/g12a-tohdmitx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index 9cfbd343a00c8..8a0db28a6a406 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <sound/pcm_params.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
 
@@ -378,6 +379,11 @@ static int g12a_tohdmitx_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	void __iomem *regs;
 	struct regmap *map;
+	int ret;
+
+	ret = device_reset(dev);
+	if (ret)
+		return ret;
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
