Return-Path: <SRS0=YxYw=JJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30977C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Apr 2021 14:19:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFF966134F
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Apr 2021 14:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFF966134F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rVxN9cGHcda2iycI+amQNRErcnSPzdwhYCFpdtuOK5M=; b=T8IIXGNLkUVFyH4EGXUb+RIc83
	PxezehsuwbcT9IxZfH25vfgE8ZQpq/WX1Fsb0aM7QDcDIObN9jXzdnv74PpIkpClayoQLzWGiaD7G
	3LbcmW07+8ca+6fxpuVKzo9bE/4ld3CC7BJqvZCJIf22pUJbpAQEz39PyttGa9FQk3TRJFFODfPkq
	6Sr91roYvMp4bY8CW2UgZRItvJxBjjpKeIhJoW2v5poQHQyGOytgjjnu+PLvYTSGl4HDscOhoerX6
	Xkw7lThOAarOJnt5+/nDnCU6x+R8uXQJfaL1efv4E1c4E73z/gJI/g49jeGZmVJRfHWe/0hCHBZTH
	iTQBvx/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVxP2-006wf1-Gs; Mon, 12 Apr 2021 14:19:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxOz-006wef-Nj
 for linux-amlogic@desiato.infradead.org; Mon, 12 Apr 2021 14:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=gE1tFWhSzbHqAI5X9ftQT0mEeaEBuCfbMLq9XJpCJgo=; b=VwSRt4U8uoVHtV1Alajiddk9S/
 R/Dxym7d19TKp4QMQYUa1o/SG6mI5eWBsgx9Ak9Zp7W3EvXaVPGzdyX0AcGL8pT+WEVtW2kUyqZXK
 URWanAS1F95XRxHtrPmfHnMH6b5vlf3yBgLl31VvWZ5Quk97vll5ybwWjDTrkgJfO+6gD6Y/52Pa2
 tP2E7P6FJyYcYwEqI4eznxhg1UEHTecV+n6GhylvIZNHe24fEHez1UnuBi/l1bBAj2WgBxl1Qg+56
 M7qFRM6JBFQe+R/JV5jm6TVZhDQ0FuQb5FlhAB9w2Jvr5iHFXw3FBw2B/Cr+pwU1VNEHl3N1dfF6/
 f8oSdgJQ==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxOx-006IaW-Aa
 for linux-amlogic@lists.infradead.org; Mon, 12 Apr 2021 14:18:56 +0000
Received: by mail-pl1-x631.google.com with SMTP id w8so4106351plg.9
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Apr 2021 07:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=gE1tFWhSzbHqAI5X9ftQT0mEeaEBuCfbMLq9XJpCJgo=;
 b=kAr42R2krMprDasFsl+izamVChxE+LZ8Vd0aPw47+CCHoupj1Qgnq68hh9kaimTv7F
 37gTXi1cEh+NQk9l6uzuQrdIhj/8ScTKyLBVwYcOjRw9TDXI0peJmFyFq4ikp5qLPnzX
 fXZA72Vq8jWSg0VH0W7sfejshHq75rG60XhYxtyYvEwAThHqqIsFMZN6YEOUwTQWUuzh
 IIDTwHv7zQfSZXfOsovIERUgBePRT/8dJFfoWIc0HkJ8n5vCTJyCVaBu8e9rntDVYWXZ
 7nu29nmtdJzotxfPnQeWQ4tMZ6IxdL9d3i/LmtAqO7DlXrbp5Pj3xdetRHlCrKt+lMP3
 gANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=gE1tFWhSzbHqAI5X9ftQT0mEeaEBuCfbMLq9XJpCJgo=;
 b=rZ/LaJslp1EBkoyFgxG94QohSL00RWXulnXfQpuDk2/KDu4oUvn0N1N7q8v/jK5tnW
 Ab7CAcrKMYjHcPlwMMyOayy6yKHA0CHNAFvfscKEbOqB68dm//Io+7dspWlsyNV3wZAA
 zwSH4JFXE0AbUgUCXcQLQEXo57J2xGygi8LQyeiRViPN8wlfsbN24ONLJAGKazsK2YCv
 VxMcEqJbUAu744n6AcIxxUP5etJAd/NwEq2y2ojjY8ZW1+5NBz5OiiVpsM7ekSYomY3G
 gbX73UJRnh2/g4itQxQrqDDwm/0CeF8c0MKrX8ba0YH5Ddst5zJZz8aVMbyQ60FhvKnE
 Fxmw==
X-Gm-Message-State: AOAM532ZApwIpTE+vD58/lKcKx4gSbWixhf+mCjexTooHcK9srW8NY9J
 16H1rhvhR2nWoZk18O8UoKc=
X-Google-Smtp-Source: ABdhPJy1IOQSh91XC3ctGh4jru7zmv9U5bKzAJBmvP804WFF9A+NhYzJx1RaM2WGdTkFa91OwV6kOg==
X-Received: by 2002:a17:902:ac89:b029:e6:d199:29ac with SMTP id
 h9-20020a170902ac89b02900e6d19929acmr26586468plr.46.1618237134354; 
 Mon, 12 Apr 2021 07:18:54 -0700 (PDT)
Received: from kali ([103.141.87.254])
 by smtp.gmail.com with ESMTPSA id gb15sm11274248pjb.32.2021.04.12.07.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 07:18:54 -0700 (PDT)
Date: Mon, 12 Apr 2021 19:48:45 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: narmstrong@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
 mitali_s@me.iitr.ac.in, linux-amlogic@lists.infradead.org
Subject: Subject: [PATCH] staging: media: meson: vdec: declare u32 as static
 const
Message-ID: <YHRWxeXA9m+Gt+e+@kali>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_071855_403659_0E01CF31 
X-CRM114-Status: UNSURE (   9.96  )
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

Declared 32 bit unsigned int as static constant inside a function and
replaced u32[] {x,y} as canvas3, canvas4 in codec_h264.c
This indicates the value of canvas indexes will remain constant throughout execution.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/meson/vdec/codec_h264.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index c61128fc4bb9..ea86e9e1c447 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -287,10 +287,10 @@ static void codec_h264_resume(struct amvdec_session *sess)
 	struct amvdec_core *core = sess->core;
 	struct codec_h264 *h264 = sess->priv;
 	u32 mb_width, mb_height, mb_total;
+	static const u32[] canvas3 = { ANCO_CANVAS_ADDR, 0 };
+	static const u32[] canvas4 = { 24, 0 };
 
-	amvdec_set_canvases(sess,
-			    (u32[]){ ANC0_CANVAS_ADDR, 0 },
-			    (u32[]){ 24, 0 });
+	amvdec_set_canvases(sess, canvas3, canvas4);
 
 	dev_dbg(core->dev, "max_refs = %u; actual_dpb_size = %u\n",
 		h264->max_refs, sess->num_dst_bufs);
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
