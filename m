Return-Path: <SRS0=RHkW=ZS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8800EC432C0
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Nov 2019 09:38:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F52F20722
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Nov 2019 09:38:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RdShW03L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="B0td/X/d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F52F20722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdET+A2J0F+XEPhYHxwB7mtqSJKYNtyoZSzJc1xuTow=; b=RdShW03LTX1YN/
	Fc4IATEhLYmohpx7t27hhn8gWSfgjmrNe/VtKRM2DEqJMgJI6XHRUtd922juDcsPmRivHnK/INnF6
	KXYn8H7FpSVqtRnQIyVJ6oP2OYkHkbqpBUtZ0Lj0W97p0jquYpm2JiEMBy/KJkYq694MNsM9YNsTL
	AOKPboO1qE2rWlky2zDUKkPWABBJoZJHTkOmXG2Tsd+OqAOs+J2P7B/+L4okf4CYsR31MHN3UvEbQ
	E7qodTGrS2xzvFrgtR6TjWRUyF2XsELgl2SUEhZwqYq9JP5DAh8jO7rAvD070xvYrfP/OIbUXCL1l
	bfLYD0zlKMdAl/P+ILOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZXIc-00088u-2v; Tue, 26 Nov 2019 09:38:22 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZXHu-0006Xm-B0
 for linux-amlogic@lists.infradead.org; Tue, 26 Nov 2019 09:37:43 +0000
Received: by mail-wm1-x344.google.com with SMTP id z19so2459531wmk.3
 for <linux-amlogic@lists.infradead.org>; Tue, 26 Nov 2019 01:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u1by8ZZCXHXcRVYxgvIFeXukv45RqjhkxvSYIKvsQ8w=;
 b=B0td/X/dd4Uq9eBWJ/qZUFtOcOtOI2YxrjKSOqFXuB3xpBnqJvrcMV2Z/WyiGcWmEh
 +jKhwGTLzXWovUknnC5Fdts6pVJvpMYbw9YzlAuY4FxFtp3SnwlkzIh32JXt2ng1Vd33
 aQsS2BaP7iQ5inKh7yl1gmapH5sCqtK9N7lVmZ9T5nBxBbGTy+x+SNY+yrHkBA2LY/Ga
 m2X0KhuHvl2oljSoYk7lGyQXuuQ4Vk8e04YgLcrC3RYeEzGFGhpRkzFpTX1bbK+Ftxb4
 DkSPyjtrVYsYDXCnRZUvMAALjt3P+M8cMvcOY3zRa7i3ix8HO8gH0z02jCRBnDXHIxtg
 aSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u1by8ZZCXHXcRVYxgvIFeXukv45RqjhkxvSYIKvsQ8w=;
 b=FzNAl0Dz3mIDzXcU6JE9HaVWm9zspdZtFLZpPCwPu+PvKKYHGMRcpeMTvyVJOdbhFM
 VolCiuZnL4avm5PTOxLMCJfHeVhHF/1ut0Wgf8DvAK030p4AotqZWrgNSjAw5fdg9tIb
 mjs5KK9/7DkXofWJRJKQ0O5qEZZRNDfNBBMgkj8iKipyOwyNsVYLuu8Zdn1fCAt4XP/h
 l86oe/oukFACW8JZPgA35Q7+xplwfL2qoUeEhx4ARBom4bvfXeHM5Di9BZC0yTunTgAR
 GXl3nXyej1wcj1HLtvv6SB8xcw8QYu+fgDFEkfyJGgV0PzffB8YkwPgRrvtove0+hF76
 O2Gg==
X-Gm-Message-State: APjAAAUfRuPs1nkjddlyar+i83Qg3MQPhwR0D2jTboxBciGITK0x8/K6
 OWisOusoIjky4DhT3imrZUhx3dcdWRVm/g==
X-Google-Smtp-Source: APXvYqxJpJjm2AeWVaU+kwrToax6R9oEnDaQdlz3xjITpyakptZxOSsBXZ2fE6JsQfAfVMowyHFOHw==
X-Received: by 2002:a1c:9917:: with SMTP id b23mr3295201wme.42.1574761056546; 
 Tue, 26 Nov 2019 01:37:36 -0800 (PST)
Received: from bender.baylibre.local (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id y67sm2464082wmy.31.2019.11.26.01.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 01:37:36 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mchehab@kernel.org,
	hans.verkuil@cisco.com
Subject: [PATCH v2 1/3] media: v4l2-mem2mem: mark DONE any OUTPUT queued
 buffer after CMD_STOP
Date: Tue, 26 Nov 2019 10:37:31 +0100
Message-Id: <20191126093733.32404-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191126093733.32404-1-narmstrong@baylibre.com>
References: <20191126093733.32404-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_013738_380163_CE3948BD 
X-CRM114-Status: GOOD (  15.99  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

If a decoder needs a minimal buffer count to be queued on it's CAPTURE
queue, if a CMD_STOP is sent after a STREAMON but before all the required
buffers are queued, it should comply to the drain sequence and mark the
last queued buffer with V4L2_BUF_FLAG_LAST and mark it done to be dequeued.

This introduces a v4l2-mem2mem ioctl decoder command to track the command
sent to the decoder, and should be called by the affected drivers.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Suggested-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 61 +++++++++++++++++++++++++-
 include/media/v4l2-mem2mem.h           | 14 ++++++
 2 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 1afd9c6ad908..b09616f9f102 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -556,6 +556,28 @@ int v4l2_m2m_querybuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_querybuf);
 
+static void v4l2_m2m_flag_last_buf_done(struct vb2_queue *q)
+{
+	struct vb2_buffer *vb;
+	struct vb2_v4l2_buffer *vbuf;
+	unsigned int i;
+
+	if (WARN_ON(q->is_output))
+		return;
+	if (list_empty(&q->queued_list))
+		return;
+
+	vb = list_first_entry(&q->queued_list, struct vb2_buffer, queued_entry);
+	for (i = 0; i < vb->num_planes; i++)
+		vb2_set_plane_payload(vb, i, 0);
+
+	vb->state = VB2_BUF_STATE_ACTIVE;
+	atomic_inc(&q->owned_by_drv_count);
+	vbuf = to_vb2_v4l2_buffer(vb);
+	vbuf->flags |= V4L2_BUF_FLAG_LAST;
+	vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
+}
+
 int v4l2_m2m_qbuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		  struct v4l2_buffer *buf)
 {
@@ -570,11 +592,22 @@ int v4l2_m2m_qbuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 			__func__);
 		return -EPERM;
 	}
+
 	ret = vb2_qbuf(vq, vdev->v4l2_dev->mdev, buf);
-	if (!ret && !(buf->flags & V4L2_BUF_FLAG_IN_REQUEST))
+	if (ret)
+		return ret;
+
+	/*
+	 * If the capture queue isn't streaming and we were asked to
+	 * stop, DONE the buffer instantly and flag as LAST
+	 */
+	if (!V4L2_TYPE_IS_OUTPUT(vq->type) && m2m_ctx->stopped &&
+	    vb2_is_streaming(vq) && !vb2_start_streaming_called(vq))
+		v4l2_m2m_flag_last_buf_done(vq);
+	else if ((buf->flags & V4L2_BUF_FLAG_IN_REQUEST))
 		v4l2_m2m_try_schedule(m2m_ctx);
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_qbuf);
 
@@ -1225,6 +1258,30 @@ int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_decoder_cmd);
 
+int v4l2_m2m_decoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
+			 struct v4l2_decoder_cmd *dc)
+{
+	if (dc->cmd != V4L2_DEC_CMD_STOP && dc->cmd != V4L2_DEC_CMD_START)
+		return -EINVAL;
+
+	if (dc->cmd == V4L2_DEC_CMD_STOP)
+		m2m_ctx->stopped = true;
+	else
+		m2m_ctx->stopped = false;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_decoder_cmd);
+
+int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *priv,
+			       struct v4l2_decoder_cmd *dc)
+{
+	struct v4l2_fh *fh = file->private_data;
+
+	return v4l2_m2m_decoder_cmd(file, fh->m2m_ctx, dc);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_decoder_cmd);
+
 int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh,
 					     struct v4l2_decoder_cmd *dc)
 {
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 1d85e24791e4..4c083cffdd86 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -98,6 +98,8 @@ struct v4l2_m2m_ctx {
 
 	bool				new_frame;
 
+	bool				stopped;
+
 	/* internal use only */
 	struct v4l2_m2m_dev		*m2m_dev;
 
@@ -312,6 +314,16 @@ int v4l2_m2m_streamon(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 int v4l2_m2m_streamoff(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		       enum v4l2_buf_type type);
 
+/**
+ * v4l2_m2m_decoder_cmd() - execute a decoder command
+ *
+ * @file: pointer to struct &file
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ * @dc: pointer to the decoder command
+ */
+int v4l2_m2m_decoder_cmd(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
+			 struct v4l2_decoder_cmd *dc);
+
 /**
  * v4l2_m2m_poll() - poll replacement, for destination buffers only
  *
@@ -704,6 +716,8 @@ int v4l2_m2m_ioctl_streamon(struct file *file, void *fh,
 				enum v4l2_buf_type type);
 int v4l2_m2m_ioctl_streamoff(struct file *file, void *fh,
 				enum v4l2_buf_type type);
+int v4l2_m2m_ioctl_decoder_cmd(struct file *file, void *fh,
+			       struct v4l2_decoder_cmd *dc);
 int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file, void *fh,
 				   struct v4l2_encoder_cmd *ec);
 int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
