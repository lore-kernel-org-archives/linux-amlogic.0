Return-Path: <SRS0=aHVS=3F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3621EC3F68F
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 16:46:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B985207FF
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 16:46:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CFyIpRmI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzdkPVqp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B985207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2IrlAaucUAE+y3PIkN/4gFxLF7rzZ4Ckz6Mt4X3Ln6Y=; b=CFyIpRmIaeUHHf
	fnSd6ldd9haj3Eiycfz21T1uth+6i38t1WJZBqC31g0+O2OBj62sDjP4+5xAyunbMRi4Ek/qsH7sr
	OJC36Iy38IcQWZWFXFZwKEEVncKdzth3RQ5eh9fAdZKqE4KH79+tDIoWo1pJxXX5V6v5LSGuqWB86
	39CRNpzyYHVasPUK5iZfvlCczEJQwo2sglWZd1szzu8W+Utm2Tm18qq6QAeGl0fnFExWwQ93CRbGK
	97E/Hci6s3KjaPgDYTC+TGA+dzKhTmPYa4mUcnVJCd/0bQSBF6ZndojHGoULwckivfVp37IsbS1EL
	BwWZ15xPJdnNd27UuDMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is8Hh-00016N-5c; Thu, 16 Jan 2020 16:46:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8H4-0000ah-6U; Thu, 16 Jan 2020 16:45:41 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13D202081E;
 Thu, 16 Jan 2020 16:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579193137;
 bh=0DFAupzXdgEWbk2BQFDxOnnQLwkqnZ8OV7Swv5YwVrs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kzdkPVqpAyIamSpSXzB5sEMsQQsiW1gfscqX/nWtX5zFmb75Ju+QpDT8X4QWL4THa
 ayRhSrY/WmfeqyheUVEDPrDRh+GJbSC+o7TqvuVoxzhysJTVo0TjRzxd76Hj4+KniW
 4KNEzkeUZkNY5l7uMi4V5e+oGWv0OIiBLtJjjHdM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 032/205] clk: meson: axg-audio: fix regmap last
 register
Date: Thu, 16 Jan 2020 11:40:07 -0500
Message-Id: <20200116164300.6705-32-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116164300.6705-1-sashal@kernel.org>
References: <20200116164300.6705-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_084538_392044_39F5712C 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: Sasha Levin <sashal@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

[ Upstream commit 255cab9d27d78703f7450d720859ee146d0ee6e1 ]

Since the addition of the g12a, the last register is
AUDIO_CLK_SPDIFOUT_B_CTRL.

Fixes: 075001385c66 ("clk: meson: axg-audio: add g12a support")
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/meson/axg-audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 18b23cdf679c..aa2522624fd3 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -1001,7 +1001,7 @@ static const struct regmap_config axg_audio_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
-	.max_register	= AUDIO_CLK_PDMIN_CTRL1,
+	.max_register	= AUDIO_CLK_SPDIFOUT_B_CTRL,
 };
 
 struct audioclk_data {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
