Return-Path: <SRS0=5MM3=MV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1888BC4338F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 19:58:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC9E360720
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 19:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC9E360720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5obiQv3AZyiT+NgM2mno7WXfa92YG2YGdQUEbxLyp3Y=; b=w5gDDCwnmVDN4e
	DedkQvXgwig4OrFwqUHFexqW7oP+fTdAqUjFmRslHYVxkrJk0kxmZG08CoSVQMcFmo2B0mFuBtR4j
	0ncdENudfeJU5gc8/fcCnfpyONBVcqs85S/cTbfn2ldYC88zNaAd5BFi5KaH/+CzpZtBr/ERiInkh
	GC66mV2XaSLsma7O+XKWwLhgm4yZ6AKlaCpSzcwp7XPXhp2CRBCbiBYLE/KvyxZ2ctRVp7JNecOOj
	618DI5r6WYTyi8MTXDWoDf22nZQX0BAezUCGMNnEa5WSCiLDa9SzBC5u3Q8ACyFBh5LmLgnB1PJma
	AbwCtK6APdmDTDlf7EzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9CAW-005iev-0B; Thu, 29 Jul 2021 19:58:12 +0000
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9C9X-005iGc-6C
 for linux-amlogic@lists.infradead.org; Thu, 29 Jul 2021 19:57:12 +0000
Received: from localhost.localdomain ([86.243.172.93]) by mwinf5d56 with ME
 id b7pU2500D21Fzsu037pUqA; Thu, 29 Jul 2021 21:49:31 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 29 Jul 2021 21:49:31 +0200
X-ME-IP: 86.243.172.93
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: narmstrong@baylibre.com, mchehab@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: meson-ge2d: Fix rotation parameter changes detection
 in 'ge2d_s_ctrl()'
Date: Thu, 29 Jul 2021 21:49:25 +0200
Message-Id: <6cb8efcadcf8c856efb32b7692fc9bf3241e3bc3.1627588010.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_125711_430466_C8EF198F 
X-CRM114-Status: GOOD (  11.13  )
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

Fixes: 59a635327ca7 ("media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I've not looked deeply in the code, but why is this test needed in the
first place?
Couldn't we assigned 'ctx->out.pix_fmt = fmt' un-conditionally?
---
 drivers/media/platform/meson/ge2d/ge2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/meson/ge2d/ge2d.c
index a1393fefa8ae..be22bb60e7cf 100644
--- a/drivers/media/platform/meson/ge2d/ge2d.c
+++ b/drivers/media/platform/meson/ge2d/ge2d.c
@@ -780,7 +780,7 @@ static int ge2d_s_ctrl(struct v4l2_ctrl *ctrl)
 		 * parameters, take them in account
 		 */
 		if (fmt.width != ctx->out.pix_fmt.width ||
-		    fmt.height != ctx->out.pix_fmt.width ||
+		    fmt.height != ctx->out.pix_fmt.height ||
 		    fmt.bytesperline > ctx->out.pix_fmt.bytesperline ||
 		    fmt.sizeimage > ctx->out.pix_fmt.sizeimage)
 			ctx->out.pix_fmt = fmt;
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
