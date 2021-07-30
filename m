Return-Path: <SRS0=tAAW=MW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C2CC4338F
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 19:43:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 745FF60F36
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 19:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 745FF60F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cn63wtcPvPwzFBcfk9XFsEB5SwokfJSiKQzyNTCDOQU=; b=F1ZAtf115U/Roj
	obVaMIf+h82Vu6bqQSD6qLyRXJiOwjOoRwNU48Ty5vpDZLFf0pCE4OaEVdfyj3c3x4RjqEWpe7aR5
	Re97NHl3RdFCUV2Zvm1GtNR1cWqs8NbePbr5y/9zjIczgFJhOGTPKYZ5et1FAGC9IbnIS7fyAzRml
	tTepXQHa0ltxVVvr2S96Q/wtIZKajcFDftvSiSSykqYVk8IlrLX5SZk0JjOY2pqYIjKCiHv5TWl+2
	fDh7+wb2leOlIeqze31BVMN/bEuGpHW/dQTpeYbUx4DCXxhSetoZ7TREy8/Tj6HRPjRxQU7FQ9bEC
	Gd95c7digLFyVM/Sy+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9YPK-00A8zB-6V; Fri, 30 Jul 2021 19:42:58 +0000
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9YP7-00A8xg-GQ
 for linux-amlogic@lists.infradead.org; Fri, 30 Jul 2021 19:42:47 +0000
Received: from localhost.localdomain ([86.243.172.93]) by mwinf5d29 with ME
 id bXb62500421Fzsu03Xb7m6; Fri, 30 Jul 2021 21:35:11 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 30 Jul 2021 21:35:11 +0200
X-ME-IP: 86.243.172.93
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: narmstrong@baylibre.com, mchehab@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2] media: meson-ge2d: Fix rotation parameter changes
 detection in 'ge2d_s_ctrl()'
Date: Fri, 30 Jul 2021 21:35:05 +0200
Message-Id: <fccdeaa92b4e2f666ef6deeaa7975ccab5c98c3f.1627673587.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_124245_727346_E3E02E2D 
X-CRM114-Status: GOOD (  12.01  )
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

There is likely a typo here. To be consistent, we should compare
'fmt.height' with 'ctx->out.pix_fmt.height', not 'ctx->out.pix_fmt.width'.

Instead of fixing the test, just remove it and copy 'fmt' unconditionally.

Fixes: 59a635327ca7 ("media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
---
v2: axe the tests. The structure is small, and it is likely that it was
    already copied with the broken test.
---
 drivers/media/platform/meson/ge2d/ge2d.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/meson/ge2d/ge2d.c
index a1393fefa8ae..9b1e973e78da 100644
--- a/drivers/media/platform/meson/ge2d/ge2d.c
+++ b/drivers/media/platform/meson/ge2d/ge2d.c
@@ -779,11 +779,7 @@ static int ge2d_s_ctrl(struct v4l2_ctrl *ctrl)
 		 * If the rotation parameter changes the OUTPUT frames
 		 * parameters, take them in account
 		 */
-		if (fmt.width != ctx->out.pix_fmt.width ||
-		    fmt.height != ctx->out.pix_fmt.width ||
-		    fmt.bytesperline > ctx->out.pix_fmt.bytesperline ||
-		    fmt.sizeimage > ctx->out.pix_fmt.sizeimage)
-			ctx->out.pix_fmt = fmt;
+		ctx->out.pix_fmt = fmt;
 
 		break;
 	}
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
