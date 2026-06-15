Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F603CD98CF
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jun 2026 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6JUm8EEM0MjGFVmAfj1VVdQPg62FEfz2vmJhPCyYxT0=; b=45ZrFEk315hx/w
	hG2aISKcIiYFiEp/NQaIuOioD/+vvKQHZ1faHHrd01FjTHOL4M8cHX56Ffli5HgGSRF+DULR7pKRJ
	euPSwTH2VQRSVLtfnKSvbeLRmc6fDlaZ4iETsoDBvx1UJk2hRdJEZMTFc2oDy8QMdcDxqb9aaMCgM
	6W7jRTJLBD5zqzBAY60torVGwuAuF7E9IYnc1uFf+SSUHxTYCkLpOj9JN8cIfa1l614GEc8h4TPfd
	3nkzwWAAcF73xNLZTxpqYAk4wPH91yn5WJluDNydJtE7ShCWcsVXOFIbhS+9g+pHHsAQFXpoJlP1k
	AiW/gN1aou2xejLqEUNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7wX-0000000EMEi-0GUP;
	Mon, 15 Jun 2026 14:05:37 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7wU-0000000EMCk-10g9
	for linux-amlogic@lists.infradead.org;
	Mon, 15 Jun 2026 14:05:35 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so2735411f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 15 Jun 2026 07:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1781532332; x=1782137132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6MN3j+7e1dFG2jfIP/6dw1N/4Etu3I0/uUny4h6HJVI=;
        b=M1ltKtRxxmNmTqzdhhdtwx6RRaHKUYvTHUNVeK6R0A/9dfZIi/g7vRHayABvfQq4IF
         mxRBE2s8O3BrK/CjN4FZ8QHbEmxqRH9GVnVCHEIC8yl+s1FTf1X59LmPCGHvHC0rxj3r
         i6dlfrLa2sJmLv4M4vt78ihBYI4BhAtO7IRMnxHBAlMgk4gy4Z8Ug27II/pjzKIMd79c
         HrdapsmQgiktzirDxlhxytC0B79tGGPJBCcUg/NIZwFggKbZjwZqrnQW9o/3TNbZiyyT
         uAU5Wmgs9ngHb6l9QY7YDuNv7+k1OnxlLuxWDS+VXiV0O+WO33U+kCT+SL/lPb3u83fb
         NpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532332; x=1782137132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MN3j+7e1dFG2jfIP/6dw1N/4Etu3I0/uUny4h6HJVI=;
        b=V1+2J2wHL5gJRFSSEiKX9h8arxtnZsEKsrlt9z2jQia8PODXfKgTwlXKz9jJV4NA8N
         PVT1JBB4RXSJPk7caXlOgHBMjdgZ1aRE49A+3cL3YJlQw4oeHWiFQuEpTb7XbhIRULIs
         JJAsolJ2v3n8Vrd4k0IuYQrzLT2LL7HEH+UGDrjQ46hmiB8RN1noDrTVJYnN33C8CHTD
         ECtwYU0a6YcFTfbxW5L+SeiOZibcdW/cHWG8VIAgqerxZ1+CoIFdL+CnHwUGFYtoQmc8
         Igj0Z6m9Y6zmSf0JxAefFVkey/WNafzH+l2XsDSgMCqfcNsbqNhxf+QA3QhZlQ3KRrVj
         A/qA==
X-Forwarded-Encrypted: i=1; AFNElJ+FltXcWimPu745O0ZRPYVBO0Q/RAJuRhHse3pUH2Ee9hl1lDBxzpX+UnI27/2iL9O5ufu8nbPE95v7O1co@lists.infradead.org
X-Gm-Message-State: AOJu0YxbccvNUykXHNrVuMAnEz9p7llYY9WeAhJfZZVcGIdR8KLUGDVO
	YkAoXbvKcIbu8GYXKL5vZfE3R96qgTaIXRmpMG5uFqXnILf5ReL35KhVo+CYVqsMqtuZ
X-Gm-Gg: Acq92OHi27fYZdq2AnV2s0QJuBO6FDlMXuJIPR/4zerB9pNok1vJDq1zMIQTIEFnWGU
	T9yj46s0b/G5L6yYXnU+QGllajUzLXsdY+CYH6oqP/aDQ/tdaCYWAJYVMHQaaIrGxkizwGdbUqq
	yyvcnDRxsjRYLWxBcJO5LKKiqwtz1n8VkKpKX6hpQnIZXw1qvroMkXGn81GbJOyMSb8pkbcu2bs
	Ow3vLw83azWqvg+wPppgOteFLtfbnl3K0OmX2XeA4pdDOA9BCw6+uDeF9E+2d0X9JhvJI0yLM2u
	KqLY7m2kNYY9p+sttwws+IGOMJmO41NXP1Pg47EMBO5ptMokQrVsxrkrOyZURZkxi46BHfVGcP6
	+4C0HrAsupMJPbgjbAFQMrRwWCPsHeP/01ZGCWuUYTm0Uj1Rco1vfwBZ6MJhs7p0oJOmBJXTkhn
	Qu2QlL56/kD5mWxDJj52RY8E2gVj+hsWHL/OllfQo6voMAAqtkCqwCnTGhxgyfNtYbgQQPXY595
	47IA1Dtg055WxHd9GUWQJWrav8O1U7uD3RxzYtW6/RJIg==
X-Received: by 2002:a05:6000:1844:b0:439:c18f:5aaf with SMTP id ffacd0b85a97d-4606dbf15f5mr21550537f8f.34.1781532332022;
        Mon, 15 Jun 2026 07:05:32 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f3basm33177359f8f.12.2026.06.15.07.05.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jun 2026 07:05:31 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: neil.armstrong@linaro.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	mjourdan@baylibre.com,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	stable@vger.kernel.org
Subject: [PATCH] media: meson: vdec: fix use-after-free of decode work in stop/close path
Date: Mon, 15 Jun 2026 16:05:29 +0200
Message-ID: <20260615140529.52653-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_070534_299043_6D721CA7 
X-CRM114-Status: GOOD (  12.47  )
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

vdec_close() calls v4l2_m2m_ctx_release() and then kfree(sess) without
ever cancelling sess->esparser_queue_work. The worker
esparser_queue_all_src() takes sess->lock and walks the source buffers
of sess->m2m_ctx, so if it is still pending or running when the session
is torn down it dereferences freed memory.

The work is (re-)armed from several places, including amvdec_buf_done(),
which runs from the decode-completion/IRQ path. That makes the obvious
fixes insufficient:

  - v4l2_m2m_ctx_release() frees m2m_ctx (and runs stop_streaming via
    vb2_queue_release()), but never cancels the work. Cancelling in
    vdec_close() after v4l2_m2m_ctx_release() would wait on a worker that
    may already be dereferencing the now-freed m2m_ctx.

  - Cancelling in vdec_close() before v4l2_m2m_ctx_release() keeps
    m2m_ctx valid, but the hardware is still live, so amvdec_buf_done()
    can re-arm the work right after the cancel, reintroducing the UAF.

Cancel the work in vdec_stop_streaming() instead, right after
vdec_poweroff() has quiesced the hardware (so its IRQ can no longer
re-arm the work) and while sess->m2m_ctx is still valid. Because
v4l2_m2m_ctx_release() always tears the queues down through
vb2_queue_release() -> __vb2_queue_cancel() -> stop_streaming, this
single cancel covers both the STREAMOFF and the close paths.

This does not deadlock: the queue lock (sess->lock, shared by both vb2
queues) is taken by the worker, but neither the STREAMOFF path
(video_ioctl2 serialises on vdev->lock == core->lock, and
v4l2_m2m_streamoff() calls the lockless vb2_streamoff()) nor the close
path (vb2_queue_release()) holds sess->lock when stop_streaming runs, so
cancel_work_sync() can safely wait for the worker.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Cc: stable@vger.kernel.org
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/meson/vdec/vdec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..42822064cf8d 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -419,6 +419,16 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 		sess->status = STATUS_STOPPED;
 	}
 
+	/*
+	 * The esparser_queue_work worker dereferences sess->m2m_ctx and
+	 * sess->lock. The hardware (and its IRQ, which re-arms the work via
+	 * amvdec_buf_done()) has been quiesced by vdec_poweroff() above, so
+	 * no new work can be scheduled past this point. m2m_ctx is still
+	 * valid here. Wait for any in-flight worker to finish before the
+	 * buffers and (on the close path) m2m_ctx are torn down.
+	 */
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
 			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
