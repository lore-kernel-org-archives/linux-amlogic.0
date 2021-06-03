Return-Path: <SRS0=VErV=K5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067A2C47096
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jun 2021 08:43:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77E186136E
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jun 2021 08:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77E186136E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n3/gm/r3XY0xvePoOAXbzPgYudPU2QNwag+pJ+xR/xk=; b=aNdMGGnb3KtJgZ
	t0IqBNaTW0XOPtybuFwz0nMOWv7W/08/9iY9d907Bw4CRgz39wMkOkgzDDWH2KN4QmFCzHto5Iopy
	PK8mynnNCIyh1jqjrjxdJQ/rSFOsaP82D9In7zcD6Z95BTCc4ReFqOCf8maIEQrGE78AJ7ImcVlWL
	m+zHg4XfAdtT/nidWuGXuIzImxaJF6ZY9RKNEWbWDu3qSRRapz9gRTnc1u413lACzZcXJ+M+S2jJG
	J8Pw7iXzbJ8zQbYRTQlYdHIx1/wH0QSjBYi4+fylRc6BdulGNLSFTNw+Mk+KrwOpKZIdEJllWtZdR
	YR5jg6/dCSeDRG8YUxnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loiwz-007jgA-H7; Thu, 03 Jun 2021 08:43:37 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loiwl-007jcS-3c
 for linux-amlogic@lists.infradead.org; Thu, 03 Jun 2021 08:43:24 +0000
Received: by mail-wr1-f48.google.com with SMTP id q5so4982437wrs.4
 for <linux-amlogic@lists.infradead.org>; Thu, 03 Jun 2021 01:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SNU7JKX7aSeTK7xjNMO/CkhBcJ6lCl+AhfJOU6hzNns=;
 b=UcYf/2lHKlayXrEaOKqNHbasHUf900ovmhEA4V0P1Wk+dboPkf+FzAxPxvGpW20HfP
 E9Lsg9z2e/fUjxqj/kWVjzzJot9pWBGJA5FhHZVRD3JIYrD/vr/SxIvR3nX5tOGm1iww
 5wznIGTaU/IafI8pnf7Kqn/+xJfnzs6kCRPAzfEsISk/ZVQ5gcEl0jC9AlRfKTadyPo/
 qgXba2AMoZN4TbYq3EbT9TM/F1NnsaF8jLGCBL76eS/68b6EXEvJi+Qxm8iiEhp+tI7t
 PfF3UDvcMS27xUTx7XYMuVZ4jov1tvOUN4xFF3UgZpFrBLdYgo+UuJpNPREsDfk96YKH
 KQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SNU7JKX7aSeTK7xjNMO/CkhBcJ6lCl+AhfJOU6hzNns=;
 b=JB07OIwXr0N1MmV4UO1/CDgQ3UAIz3an6Q9SIz/d8Fn0MSWlSr2B7Dg2cBma/TvuXw
 GlbLgaRqh++PuEDSo/3U3wJMkAx9mvEb9LmLPDQSqZHVtLECQsVDS16Q1kFJ5D7NqaSV
 rO/t2xES6YZcNq/ZkpV6g1bpC7qi9/L1GqCzQLdigWhVPRbfPPZgniJCe/aUf04szmRW
 bd5Wd6/8wfjo8Z0uBBGIArBJ02x4QkbAb5/l/mMoDHyShACHYigWGZSPvV4hmGZr3s5n
 LLZrRefSU5eUO0DapBmlrrWzu+0fq9D3KOlMZ8IYLowHOJvtMV4+xtskveMiGrmNFtdl
 zeWw==
X-Gm-Message-State: AOAM530/7ZX3y7xS+roLNhQPG5hdUQmBMN1Ix/WcYh+/6eaEso6qMB0H
 r6TAJ7LAOE+crwZoZNr48bUJxw==
X-Google-Smtp-Source: ABdhPJy7qovuJNSsahe4jvLCLnwO65bY2WkvJC3lTYs5vxvgnCuu7RfBP7fkELCrdwjh4mvAOlep/Q==
X-Received: by 2002:adf:c38a:: with SMTP id p10mr23301663wrf.138.1622709739038; 
 Thu, 03 Jun 2021 01:42:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:c7bb:ed8:463c:e094])
 by smtp.gmail.com with ESMTPSA id
 l3sm2075176wmh.2.2021.06.03.01.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 01:42:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] media: mexon-ge2d: fixup frames size in registers
Date: Thu,  3 Jun 2021 10:42:15 +0200
Message-Id: <20210603084215.368764-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3555; h=from:subject;
 bh=fDG0y2ajd4sQMyG0ttCCWx537eEFDH2CjN5zlWNa1zc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBguJXDk1ouZJkvROuDyWlgJHb+IMnkKLSjCy8YlusE
 quTE+ByJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYLiVwwAKCRB33NvayMhJ0VhnEA
 COQ2pz5dPikIjqm1jDCwLx8nhXSLBFdWmsZY1qlZqYEd/NQP5xMY9dmAZvrhkMmQAxOM9UtbTw22Mv
 Y9SxNTE54KP4MHFCXKDjze5N9R1d0LFsx2IQo3N10+2Bz2YIV81zzWJX5XnGY2rkcKKtugUi3oOa1f
 ey0ZzNTZCW0t1qxTCx66gu+5rjYgXGomojS8bypnjSLk8n62wKvEhM/N/T8GcRHV6nPRusIPL4Co7m
 37hbQbmko1SaMyvai7mOUwM/rN9dTz5dAxxjCYsDR+AN1VnSHgx+2Xsabk50ika5EY9FlCyT8B9kVX
 xY87plF1bFPFGxV7fjobtBxVmF5Pg/Gh9/JuqHGNJxitrPa94q0jKB3LBn3XjBp9CQcbNVjv8BuiNj
 WS+VSvpaFvJi90vrTrCcjHSnKf0nPieHrcyl6h/X/KJxDudYzKhiM05BZeI7mQqM3Mspphg9j8OKPS
 /SuO9ig5f+qVNUrh43JkI+NcB2T304g1M6v85VMoklON/E1P/5YAoUsrssrwdtzpO/wxe4/P1DFdWj
 wvOlWjgDokwriuHM8FCbgpTGl3mfRrlIBbTBO3sFJdodtpdB855S58hVAhl1JXO6d0FkZswKYB4ou1
 idH+alnWju8Wqb539mGDpxjKgVuBWuXVbQUxB0/Q5W1VOt+Zkrj270KVTgVA==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_014323_157781_E1DAB845 
X-CRM114-Status: GOOD (  10.49  )
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

The CLIP, SRC & DST registers are coded to take the pixel/line start & end,
starting from 0. Thus the end should be the width/height minus 1.

It can be an issue with clipping and rotation, where it will add spurious
lines from uninitialized or unwanted data with a shift in the result.

Fixes: 59a635327ca7 ("media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/platform/meson/ge2d/ge2d.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/meson/ge2d/ge2d.c
index a1393fefa8ae..45b99964ea0a 100644
--- a/drivers/media/platform/meson/ge2d/ge2d.c
+++ b/drivers/media/platform/meson/ge2d/ge2d.c
@@ -215,35 +215,35 @@ static void ge2d_hw_start(struct meson_ge2d *ge2d)
 
 	regmap_write(ge2d->map, GE2D_SRC1_CLIPY_START_END,
 		     FIELD_PREP(GE2D_START, ctx->in.crop.top) |
-		     FIELD_PREP(GE2D_END, ctx->in.crop.top + ctx->in.crop.height));
+		     FIELD_PREP(GE2D_END, ctx->in.crop.top + ctx->in.crop.height - 1));
 	regmap_write(ge2d->map, GE2D_SRC1_CLIPX_START_END,
 		     FIELD_PREP(GE2D_START, ctx->in.crop.left) |
-		     FIELD_PREP(GE2D_END, ctx->in.crop.left + ctx->in.crop.width));
+		     FIELD_PREP(GE2D_END, ctx->in.crop.left + ctx->in.crop.width - 1));
 	regmap_write(ge2d->map, GE2D_SRC2_CLIPY_START_END,
 		     FIELD_PREP(GE2D_START, ctx->out.crop.top) |
-		     FIELD_PREP(GE2D_END, ctx->out.crop.top + ctx->out.crop.height));
+		     FIELD_PREP(GE2D_END, ctx->out.crop.top + ctx->out.crop.height - 1));
 	regmap_write(ge2d->map, GE2D_SRC2_CLIPX_START_END,
 		     FIELD_PREP(GE2D_START, ctx->out.crop.left) |
-		     FIELD_PREP(GE2D_END, ctx->out.crop.left + ctx->out.crop.width));
+		     FIELD_PREP(GE2D_END, ctx->out.crop.left + ctx->out.crop.width - 1));
 	regmap_write(ge2d->map, GE2D_DST_CLIPY_START_END,
 		     FIELD_PREP(GE2D_START, ctx->out.crop.top) |
-		     FIELD_PREP(GE2D_END, ctx->out.crop.top + ctx->out.crop.height));
+		     FIELD_PREP(GE2D_END, ctx->out.crop.top + ctx->out.crop.height - 1));
 	regmap_write(ge2d->map, GE2D_DST_CLIPX_START_END,
 		     FIELD_PREP(GE2D_START, ctx->out.crop.left) |
-		     FIELD_PREP(GE2D_END, ctx->out.crop.left + ctx->out.crop.width));
+		     FIELD_PREP(GE2D_END, ctx->out.crop.left + ctx->out.crop.width - 1));
 
 	regmap_write(ge2d->map, GE2D_SRC1_Y_START_END,
-		     FIELD_PREP(GE2D_END, ctx->in.pix_fmt.height));
+		     FIELD_PREP(GE2D_END, ctx->in.pix_fmt.height - 1));
 	regmap_write(ge2d->map, GE2D_SRC1_X_START_END,
-		     FIELD_PREP(GE2D_END, ctx->in.pix_fmt.width));
+		     FIELD_PREP(GE2D_END, ctx->in.pix_fmt.width - 1));
 	regmap_write(ge2d->map, GE2D_SRC2_Y_START_END,
-		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.height));
+		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.height - 1));
 	regmap_write(ge2d->map, GE2D_SRC2_X_START_END,
-		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.width));
+		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.width - 1));
 	regmap_write(ge2d->map, GE2D_DST_Y_START_END,
-		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.height));
+		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.height - 1));
 	regmap_write(ge2d->map, GE2D_DST_X_START_END,
-		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.width));
+		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.width - 1));
 
 	/* Color, no blend, use source color */
 	reg = GE2D_ALU_DO_COLOR_OPERATION_LOGIC(LOGIC_OPERATION_COPY,
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
