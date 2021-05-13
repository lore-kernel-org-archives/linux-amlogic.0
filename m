Return-Path: <SRS0=zCnM=KI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F8EC433B4
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 May 2021 22:03:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1892261406
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 May 2021 22:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1892261406
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=asp4QFraalk85SAbXi4wDpdgkW0+eJemKLBBJ42SGS0=; b=B6GInSkNJGgfps7gFriW8RddSe
	oOItLjPEq9VsyPNlWhQAYr96yHsCiJhj1VRraSDimyV7HEUOmhhZS55+r86f70cdlM+dLumTesJrK
	8/KgwLPBMo/BIPL0Q571S4/STDFL+2V3OmGz1jw5oTWRKH40npfIyzoOYlk49UZTeCkYqVGWKxqsu
	Xp/f1E6lTWhtgKD9qkonqKhPTbAoMmm+wyfzAHAUi9/5S80XPDSjvaXUnzfuF4Is6do5BVRoQNh0e
	7Ljkbg2S3eL9RrhdIphOotfdsV0HjVMgoF0QsGWAxMNYjb3F6bm6gVf+bWZMCzO69c+c+lbHUiTXO
	/1pix0Yg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhJQX-006Vhv-TA; Thu, 13 May 2021 22:03:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhJQU-006Vhn-Mi; Thu, 13 May 2021 22:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=fZ3Dp2/DoRtmwzbudsdCCvUwyZWAiB7dGnHQSo/CNn0=; b=CEUwCF5jCwfzH1/grKy2HAVtUa
 VKsbDGM/6/0dFay+EgrRLm2+p6kCGEMq/0UYeEdA9krhbxTamtZvsNUx5tK4lj3zt4lcT5TBSfZuX
 AvgyJpSH6EZ1O7W4XDuexdhLtWIVnve/vXbeaTVkLo7kHRahIwosA5q8DNET74cr6L7xCybeXzbUC
 SINDgIfLTRHsQJcldRdBnKKKbfgvqNPfCo4UorB4ysfrlb7iiS/6vY31Sv+d8PYX44K6ud4ZzQQMK
 m5F1iB/eq31tfnAXAIHw5xDydcJNQnXft5J7Tk+mqEN2fEtduUR09g7wRJwB8rNsMWWnyy966+yfv
 4Q+UhuIQ==;
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhJQS-00BYS4-6B; Thu, 13 May 2021 22:03:25 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1lhJQL-00078E-TH; Thu, 13 May 2021 22:03:17 +0000
From: Colin King <colin.king@canonical.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: meson: vdec: remove redundant initialization of
 variable reg_cur
Date: Thu, 13 May 2021 23:03:17 +0100
Message-Id: <20210513220317.137090-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_150324_235751_9A53B55A 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

From: Colin Ian King <colin.king@canonical.com>

The variable reg_cur is being initialized with a value that is never
read, it is being updated later on. The assignment is redundant and
can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/meson/vdec/vdec_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index 7f07a9175815..b9125c295d1d 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -183,7 +183,7 @@ int amvdec_set_canvases(struct amvdec_session *sess,
 	u32 pixfmt = sess->pixfmt_cap;
 	u32 width = ALIGN(sess->width, 32);
 	u32 height = ALIGN(sess->height, 32);
-	u32 reg_cur = reg_base[0];
+	u32 reg_cur;
 	u32 reg_num_cur = 0;
 	u32 reg_base_cur = 0;
 	int i = 0;
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
