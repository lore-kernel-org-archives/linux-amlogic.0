Return-Path: <SRS0=dZbC=S2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 773C9C10F11
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2019 14:39:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44B47218FD
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2019 14:39:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AxqfRhg2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLLENjS7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44B47218FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jT8tQdJKKWOOf4y2Y/J8MMWlJGk/28PoiL66GIqag1s=; b=AxqfRhg2Kke4FD
	StnxYb63V3zHukfmfWhrJYX3Vnm9udAgCRoRUZBawEx4DMQaTycsd2hVRWyfgau/fkvnOngqMxuDe
	Oej9CJ31db843mb1AL/pFh75ndGbpWQP2xQJoGCTnyz2bvswhLziaSV84WEZ75ES+yAywzsGsjBOv
	QotDXf/8EZPc9af3onf6jpPhvE60Mjcq88vjN+9+2cO1iLyb8l2ZZC8YI77OoK2yjPN0/Hv6JkQhs
	roijt3wJ9ikmtGlsphCx7zUT4F8j8dYAU2WAP6lWlWCJJgts6DZbpnMNJ1/BNNPRwnV9AT/dm38x4
	cmxV3idHGqKP11Dvz7BQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJJ3j-0002pX-MZ; Wed, 24 Apr 2019 14:39:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJJ3h-0002o4-5I
 for linux-amlogic@lists.infradead.org; Wed, 24 Apr 2019 14:39:38 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7ED3221906;
 Wed, 24 Apr 2019 14:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556116776;
 bh=o/h4DnBEnzZdaXHh6eMHzhB4cM1u9243Qa9rFUcS2ks=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cLLENjS7i6lUsmYMJMdCXqodToQ1XxeOzzzb+A0ttD9NPlGYCy2wAhcuOLWZbw1Dm
 wG8KddBNVfmH0cFepDrljPqYXJEV415IPjrwtlyDxnhvCCwPimyBwoltnV86HMavlR
 YRSTlyhYTwVovA87VPO4aJIkpeSlTt4qPPROCnoA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 11/52] reset: meson-audio-arb: Fix missing .owner
 setting of reset_controller_dev
Date: Wed, 24 Apr 2019 10:38:29 -0400
Message-Id: <20190424143911.28890-11-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190424143911.28890-1-sashal@kernel.org>
References: <20190424143911.28890-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_073937_215544_B971D318 
X-CRM114-Status: UNSURE (   8.78  )
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
Cc: Sasha Levin <sashal@kernel.org>, linux-amlogic@lists.infradead.org,
 Axel Lin <axel.lin@ingics.com>, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Axel Lin <axel.lin@ingics.com>

[ Upstream commit 13e8a05b922457761ddef39cfff6231bd4ed9eef ]

Set .owner to prevent module unloading while being used.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Fixes: d903779b58be ("reset: meson: add meson audio arb driver")
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/reset/reset-meson-audio-arb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-meson-audio-arb.c b/drivers/reset/reset-meson-audio-arb.c
index 91751617b37a..c53a2185a039 100644
--- a/drivers/reset/reset-meson-audio-arb.c
+++ b/drivers/reset/reset-meson-audio-arb.c
@@ -130,6 +130,7 @@ static int meson_audio_arb_probe(struct platform_device *pdev)
 	arb->rstc.nr_resets = ARRAY_SIZE(axg_audio_arb_reset_bits);
 	arb->rstc.ops = &meson_audio_arb_rstc_ops;
 	arb->rstc.of_node = dev->of_node;
+	arb->rstc.owner = THIS_MODULE;
 
 	/*
 	 * Enable general :
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
