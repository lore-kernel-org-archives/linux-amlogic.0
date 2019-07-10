Return-Path: <SRS0=benv=VH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D69FBC73C68
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2019 05:06:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC07220651
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2019 05:06:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="itqovzjg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC07220651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uULMO4k/vz5jSpItcJguSdZpHJhPImCAr+rA2hTHCPY=; b=itqovzjg7HHvM/58qEqt1T/Dpc
	oeLIvoFnLg2ERLHrwrapE8N3W76uH0ddJV1EhmNwgqxkrnJgF85MZjcoqC/EhOGvMAURSyCpo3eYm
	20dzCyd2UqTBir27hpO2idew5Vt1pepjf0A4NzweH98WIK6IOq+O9LV3jVrZNvhqiIm2SJSfaakvR
	a8llzZV75+tT/ZiGMtxRol6SsUPysikpMJRwbFSd30iA4nEOLQGE+O/XmIu/DK46sy/juDaypyfST
	40h3pVPqP5ycbZMLlMli8WXSi7c35F+ppXlbJHP+4DfwFeqEK6LXhbv70dAB6jOvCR4AVSCl5TI93
	mzwHLUPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hl4nu-0000ca-1s; Wed, 10 Jul 2019 05:06:06 +0000
Received: from smtprelay0197.hostedemail.com ([216.40.44.197]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hl4mj-0006y8-69; Wed, 10 Jul 2019 05:04:54 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 8C625180A68C9;
 Wed, 10 Jul 2019 05:04:44 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: field67_c1e6bf171f03
X-Filterd-Recvd-Size: 1754
Received: from joe-laptop.perches.com (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Wed, 10 Jul 2019 05:04:43 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 06/12] mmc: meson-mx-sdio: Fix misuse of GENMASK macro
Date: Tue,  9 Jul 2019 22:04:19 -0700
Message-Id: <94dcbeb13b08a67ae9f404aa590c1c1459bc5287.1562734889.git.joe@perches.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1562734889.git.joe@perches.com>
References: <cover.1562734889.git.joe@perches.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190709_220453_360735_8168BC2B 
X-CRM114-Status: UNSURE (   8.85  )
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
Cc: linux-amlogic@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Arguments are supposed to be ordered high then low.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/mmc/host/meson-mx-sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index 2d736e416775..ba9a63db73da 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -73,7 +73,7 @@
 	#define MESON_MX_SDIO_IRQC_IF_CONFIG_MASK		GENMASK(7, 6)
 	#define MESON_MX_SDIO_IRQC_FORCE_DATA_CLK		BIT(8)
 	#define MESON_MX_SDIO_IRQC_FORCE_DATA_CMD		BIT(9)
-	#define MESON_MX_SDIO_IRQC_FORCE_DATA_DAT_MASK		GENMASK(10, 13)
+	#define MESON_MX_SDIO_IRQC_FORCE_DATA_DAT_MASK		GENMASK(13, 10)
 	#define MESON_MX_SDIO_IRQC_SOFT_RESET			BIT(15)
 	#define MESON_MX_SDIO_IRQC_FORCE_HALT			BIT(30)
 	#define MESON_MX_SDIO_IRQC_HALT_HOLE			BIT(31)
-- 
2.15.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
