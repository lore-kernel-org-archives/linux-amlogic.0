Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D86BC44507
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 19:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqEY+ekXIWi4/+GXx3J/Vqod/MLtB0XLgFoY55dVh10=; b=hkXpRcQ/ee1fFjp+jQ9r+asfi6
	PM/BYRtTMy565QSJDaGkEvFtDxfnYpW4Muo0aDQe6w5Gaznnu+lm7OVYBBk71agv4k5u3kwYmdZEM
	OttNIs0l3AvsXIRWvo4HZcBtaYZJ1darGCCyYVdF57rER5dUb380t+i6RzvuB+miyJwd1tOWOHl1l
	OY39/m9qYXOWfyc3gXa27FzgWDCZ6mf/7HXx7fmzdxWHYjkDxgclWqjXYJB006+adVpkoZ+Xa4vsx
	UNOlFPoD7hASLE2lSHMx0xtG21fLPRYuUaf/0lrmFgOtgfwfXNgctF1aoCBeNhaj+m6NFtZLhxHOe
	f5188Dqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMVC-0000000AIs7-2A8R;
	Mon, 13 Jul 2026 19:39:42 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMV8-0000000AIre-1fkg
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 19:39:41 +0000
Date: Mon, 13 Jul 2026 19:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1783971571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V7JScJ65S74OmQCfQVJCxmKPT8+6MQO8A69eSEkL4aw=;
	b=hZ1fStIXHoXebScgXEUY3rFwJ4+lq+D+AiAHgD1Zjm5eSt1/tO2fWFHEsAzuHkb0klf3XY
	RHz/lTKZssFrq2fYTFhqUtwYujNeZIYzpE8CYtYltMzx9nll/CTkdN4Xl2+zZANRlcb1sq
	5Pb8YS9f1MJ4RhTzbS83H7u4LZ5obWRIIoNkR42QsoWiQ11RMH5sOPna5O29OIHDGvqGYH
	cbVIYALjS3Vu3kjL3cf95I+2mwhkfk9sBnYqi1qoyss8UV6W22tN4bwqVjhfdy+bjMlcld
	+DVd48ntM2N5oQW7wyL0ugTUa9Gbj2EPuLK9am1jkzKsKlrOixQ2j77yxXsSag==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, Alfie Varghese <alfievarghese22@gmail.com>, neil.armstrong@linaro.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Alfie Varghese <alfievarghese22@gmail.com>
Subject: Re: [PATCH v2] staging: media: meson: vdec: fix advanced concurrency and UAF bugs
References: <20260713181602.773-1-alfievarghese22@gmail.com>
In-Reply-To: <20260713181602.773-1-alfievarghese22@gmail.com>
Message-ID: <ti4p9r.3t6o48on8v4gw@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_123939_184465_12F3FD6C 
X-CRM114-Status: GOOD (  21.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 13 Jul 2026 18:16, Alfie Varghese <alfievarghese22@gmail.com> wrote:
>This commit fixes several deep concurrency and race condition issues identified
>in the Amlogic video decoder driver:
>
>1. Fix a Use-After-Free window in vdec_close() by moving
>   cancel_work_sync(&sess->esparser_queue_work) to execute after the hardware
>   is stopped via v4l2_m2m_ctx_release(), preventing interrupts from re-arming it.
>2. Fix a Use-After-Free relating to v4l2_m2m_release(). The driver incorrectly
>   allocated the m2m_dev per-session rather than per-device. Moved the
>   m2m_dev allocation to vdec_probe() and cleanup to vdec_remove() to fix
>   the structural UAF when background m2m jobs were pending.
>3. Fix a TOCTOU race condition in vdec_isr() by adding synchronize_irq()
>   in vdec_stop_streaming() after clearing core->cur_sess, ensuring that
>   running interrupt handlers finish before freeing session data.
>4. Fix a potential NULL/ERR pointer dereference in vdec_start_streaming()
>   by checking the return value of kthread_run() and handling errors gracefully.
>5. Fix a memory leak in vdec_close() by freeing the session control
>   handler via v4l2_ctrl_handler_free().
>6. Prevent a potential NULL pointer dereference in vdec_probe() by adding
>   a NULL check for of_match_node().
>
>Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
>---
> drivers/staging/media/meson/vdec/vdec.c |  52 ++-
> drivers/staging/media/meson/vdec/vdec.h | 586 ++++++++++++------------
> 2 files changed, 331 insertions(+), 307 deletions(-)
>
>diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
>index a039d925c0fe..f57c473da5e1 100644
>--- a/drivers/staging/media/meson/vdec/vdec.c
>+++ b/drivers/staging/media/meson/vdec/vdec.c
>@@ -337,9 +337,16 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
> 
> 	sess->sequence_cap = 0;
> 	sess->sequence_out = 0;
>-	if (vdec_codec_needs_recycle(sess))
>+	if (vdec_codec_needs_recycle(sess)) {
> 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
> 						   "vdec_recycle");
>+		if (IS_ERR(sess->recycle_thread)) {
>+			ret = PTR_ERR(sess->recycle_thread);
>+			sess->recycle_thread = NULL;
>+			vdec_poweroff(sess);
>+			goto vififo_free;
>+		}
>+	}
> 
> 	sess->status = STATUS_INIT;
> 	core->cur_sess = sess;
>@@ -404,7 +411,7 @@ static void vdec_stop_streaming(struct vb2_queue *q)
> 	    sess->status == STATUS_INIT ||
> 	    (sess->status == STATUS_NEEDS_RESUME &&
> 	     (!sess->streamon_out || !sess->streamon_cap))) {
>-		if (vdec_codec_needs_recycle(sess))
>+		if (vdec_codec_needs_recycle(sess) && sess->recycle_thread)
> 			kthread_stop(sess->recycle_thread);
> 
> 		vdec_poweroff(sess);
>@@ -416,6 +423,7 @@ static void vdec_stop_streaming(struct vb2_queue *q)
> 		kfree(sess->priv);
> 		sess->priv = NULL;
> 		core->cur_sess = NULL;
>+		synchronize_irq(core->irq);
> 		sess->status = STATUS_STOPPED;
> 	}
> 
>@@ -873,18 +881,11 @@ static int vdec_open(struct file *file)
> 
> 	sess->core = core;
> 
>-	sess->m2m_dev = v4l2_m2m_init(&vdec_m2m_ops);
>-	if (IS_ERR(sess->m2m_dev)) {
>-		dev_err(dev, "Fail to v4l2_m2m_init\n");
>-		ret = PTR_ERR(sess->m2m_dev);
>-		goto err_free_sess;
>-	}
>-
>-	sess->m2m_ctx = v4l2_m2m_ctx_init(sess->m2m_dev, sess, m2m_queue_init);
>+	sess->m2m_ctx = v4l2_m2m_ctx_init(core->m2m_dev, sess, m2m_queue_init);
> 	if (IS_ERR(sess->m2m_ctx)) {
> 		dev_err(dev, "Fail to v4l2_m2m_ctx_init\n");
> 		ret = PTR_ERR(sess->m2m_ctx);
>-		goto err_m2m_release;
>+		goto err_free_sess;
> 	}
> 
> 	ret = vdec_init_ctrls(sess);
>@@ -915,8 +916,6 @@ static int vdec_open(struct file *file)
> 
> err_m2m_ctx_release:
> 	v4l2_m2m_ctx_release(sess->m2m_ctx);
>-err_m2m_release:
>-	v4l2_m2m_release(sess->m2m_dev);
> err_free_sess:
> 	kfree(sess);
> 	return ret;
>@@ -927,10 +926,12 @@ static int vdec_close(struct file *file)
> 	struct amvdec_session *sess = file_to_amvdec_session(file);
> 
> 	v4l2_m2m_ctx_release(sess->m2m_ctx);
>-	v4l2_m2m_release(sess->m2m_dev);
>+	cancel_work_sync(&sess->esparser_queue_work);
> 	v4l2_fh_del(&sess->fh, file);
> 	v4l2_fh_exit(&sess->fh);
> 
>+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
>+
> 	mutex_destroy(&sess->lock);
> 	mutex_destroy(&sess->bufs_recycle_lock);
> 
>@@ -953,6 +954,9 @@ static irqreturn_t vdec_isr(int irq, void *data)
> 	struct amvdec_core *core = data;
> 	struct amvdec_session *sess = core->cur_sess;
> 
>+	if (!sess)
>+		return IRQ_NONE;
>+
> 	sess->last_irq_jiffies = get_jiffies_64();
> 
> 	return sess->fmt_out->codec_ops->isr(sess);
>@@ -963,6 +967,9 @@ static irqreturn_t vdec_threaded_isr(int irq, void *data)
> 	struct amvdec_core *core = data;
> 	struct amvdec_session *sess = core->cur_sess;
> 
>+	if (!sess)
>+		return IRQ_NONE;
>+
> 	return sess->fmt_out->codec_ops->threaded_isr(sess);
> }
> 
>@@ -1020,6 +1027,8 @@ static int vdec_probe(struct platform_device *pdev)
> 		return PTR_ERR(core->canvas);
> 
> 	of_id = of_match_node(vdec_dt_match, dev->of_node);
>+	if (!of_id)
>+		return -ENODEV;
> 	core->platform = of_id->data;
> 
> 	if (core->platform->revision == VDEC_REVISION_G12A ||
>@@ -1049,6 +1058,8 @@ static int vdec_probe(struct platform_device *pdev)
> 	if (irq < 0)
> 		return irq;
> 
>+	core->irq = irq;
>+
> 	ret = devm_request_threaded_irq(core->dev, irq, vdec_isr,
> 					vdec_threaded_isr, IRQF_ONESHOT,
> 					"vdec", core);
>@@ -1065,10 +1076,17 @@ static int vdec_probe(struct platform_device *pdev)
> 		return -ENOMEM;
> 	}
> 
>+	core->m2m_dev = v4l2_m2m_init(&vdec_m2m_ops);
>+	if (IS_ERR(core->m2m_dev)) {
>+		dev_err(dev, "Failed to init v4l2 m2m dev\n");
>+		ret = PTR_ERR(core->m2m_dev);
>+		goto err_v4l2_unreg;
>+	}
>+
> 	vdev = video_device_alloc();
> 	if (!vdev) {
> 		ret = -ENOMEM;
>-		goto err_vdev_release;
>+		goto err_m2m_release;
> 	}
> 
> 	core->vdev_dec = vdev;
>@@ -1096,6 +1114,9 @@ static int vdec_probe(struct platform_device *pdev)
> 
> err_vdev_release:
> 	video_device_release(vdev);
>+err_m2m_release:
>+	v4l2_m2m_release(core->m2m_dev);
>+err_v4l2_unreg:
> 	v4l2_device_unregister(&core->v4l2_dev);
> 	return ret;
> }
>@@ -1105,6 +1126,7 @@ static void vdec_remove(struct platform_device *pdev)
> 	struct amvdec_core *core = platform_get_drvdata(pdev);
> 
> 	video_unregister_device(core->vdev_dec);
>+	v4l2_m2m_release(core->m2m_dev);
> 	v4l2_device_unregister(&core->v4l2_dev);
> }
> 

It probably would be better to split into multiple commits to make
it easier for maintainers to review your patch.

>diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
>index 7a5d8e871d70..b2a606e965b4 100644
>--- a/drivers/staging/media/meson/vdec/vdec.h
>+++ b/drivers/staging/media/meson/vdec/vdec.h
>@@ -1,292 +1,294 @@
>-/* SPDX-License-Identifier: GPL-2.0+ */
>-/*
>- * Copyright (C) 2018 BayLibre, SAS
>- * Author: Maxime Jourdan <mjourdan@baylibre.com>
>- */
>-
>-#ifndef __MESON_VDEC_CORE_H_
>-#define __MESON_VDEC_CORE_H_
>-
>-#include <linux/irqreturn.h>
>-#include <linux/regmap.h>
>-#include <linux/list.h>
>-#include <media/videobuf2-v4l2.h>
>-#include <media/v4l2-ctrls.h>
>-#include <media/v4l2-device.h>
>-#include <linux/soc/amlogic/meson-canvas.h>
>-
>-#include "vdec_platform.h"
>-
>-/* 32 buffers in 3-plane YUV420 */
>-#define MAX_CANVAS (32 * 3)
>-
>-struct amvdec_buffer {
>-	struct list_head list;
>-	struct vb2_buffer *vb;
>-};
>-
>-/**
>- * struct amvdec_timestamp - stores a src timestamp along with a VIFIFO offset
>- *
>- * @list: used to make lists out of this struct
>- * @tc: timecode from the v4l2 buffer
>- * @ts: timestamp from the VB2 buffer
>- * @offset: offset in the VIFIFO where the associated packet was written
>- * @flags: flags from the v4l2 buffer
>- * @used_count: times this timestamp was checked for a match with a dst buffer
>- */
>-struct amvdec_timestamp {
>-	struct list_head list;
>-	struct v4l2_timecode tc;
>-	u64 ts;
>-	u32 offset;
>-	u32 flags;
>-	u32 used_count;
>-};
>-
>-struct amvdec_session;
>-
>-/**
>- * struct amvdec_core - device parameters, singleton
>- *
>- * @dos_base: DOS memory base address
>- * @esparser_base: PARSER memory base address
>- * @regmap_ao: regmap for the AO bus
>- * @dev: core device
>- * @dev_dec: decoder device
>- * @platform: platform-specific data
>- * @canvas: canvas provider reference
>- * @dos_parser_clk: DOS_PARSER clock
>- * @dos_clk: DOS clock
>- * @vdec_1_clk: VDEC_1 clock
>- * @vdec_hevc_clk: VDEC_HEVC clock
>- * @vdec_hevcf_clk: VDEC_HEVCF clock
>- * @esparser_reset: RESET for the PARSER
>- * @vdev_dec: video device for the decoder
>- * @v4l2_dev: v4l2 device
>- * @cur_sess: current decoding session
>- * @lock: video device lock
>- */
>-struct amvdec_core {
>-	void __iomem *dos_base;
>-	void __iomem *esparser_base;
>-	struct regmap *regmap_ao;
>-
>-	struct device *dev;
>-	struct device *dev_dec;
>-	const struct vdec_platform *platform;
>-
>-	struct meson_canvas *canvas;
>-
>-	struct clk *dos_parser_clk;
>-	struct clk *dos_clk;
>-	struct clk *vdec_1_clk;
>-	struct clk *vdec_hevc_clk;
>-	struct clk *vdec_hevcf_clk;
>-
>-	struct reset_control *esparser_reset;
>-
>-	struct video_device *vdev_dec;
>-	struct v4l2_device v4l2_dev;
>-
>-	struct amvdec_session *cur_sess;
>-	struct mutex lock;
>-};
>-
>-/**
>- * struct amvdec_ops - vdec operations
>- *
>- * @start: mandatory call when the vdec needs to initialize
>- * @stop: mandatory call when the vdec needs to stop
>- * @conf_esparser: mandatory call to let the vdec configure the ESPARSER
>- * @vififo_level: mandatory call to get the current amount of data
>- *		  in the VIFIFO
>- */
>-struct amvdec_ops {
>-	int (*start)(struct amvdec_session *sess);
>-	int (*stop)(struct amvdec_session *sess);
>-	void (*conf_esparser)(struct amvdec_session *sess);
>-	u32 (*vififo_level)(struct amvdec_session *sess);
>-};
>-
>-/**
>- * struct amvdec_codec_ops - codec operations
>- *
>- * @start: mandatory call when the codec needs to initialize
>- * @stop: mandatory call when the codec needs to stop
>- * @load_extended_firmware: optional call to load additional firmware bits
>- * @num_pending_bufs: optional call to get the number of dst buffers on hold
>- * @can_recycle: optional call to know if the codec is ready to recycle
>- *		 a dst buffer
>- * @recycle: optional call to tell the codec to recycle a dst buffer. Must go
>- *	     in pair with @can_recycle
>- * @drain: optional call if the codec has a custom way of draining
>- * @resume: optional call to resume after a resolution change
>- * @eos_sequence: optional call to get an end sequence to send to esparser
>- *		  for flush. Mutually exclusive with @drain.
>- * @isr: mandatory call when the ISR triggers
>- * @threaded_isr: mandatory call for the threaded ISR
>- */
>-struct amvdec_codec_ops {
>-	int (*start)(struct amvdec_session *sess);
>-	int (*stop)(struct amvdec_session *sess);
>-	int (*load_extended_firmware)(struct amvdec_session *sess,
>-				      const u8 *data, u32 len);
>-	u32 (*num_pending_bufs)(struct amvdec_session *sess);
>-	int (*can_recycle)(struct amvdec_core *core);
>-	void (*recycle)(struct amvdec_core *core, u32 buf_idx);
>-	void (*drain)(struct amvdec_session *sess);
>-	void (*resume)(struct amvdec_session *sess);
>-	const u8 * (*eos_sequence)(u32 *len);
>-	irqreturn_t (*isr)(struct amvdec_session *sess);
>-	irqreturn_t (*threaded_isr)(struct amvdec_session *sess);
>-};
>-
>-/**
>- * struct amvdec_format - describes one of the OUTPUT (src) format supported
>- *
>- * @pixfmt: V4L2 pixel format
>- * @min_buffers: minimum amount of CAPTURE (dst) buffers
>- * @max_buffers: maximum amount of CAPTURE (dst) buffers
>- * @max_width: maximum picture width supported
>- * @max_height: maximum picture height supported
>- * @flags: enum flags associated with this pixfmt
>- * @vdec_ops: the VDEC operations that support this format
>- * @codec_ops: the codec operations that support this format
>- * @firmware_path: Path to the firmware that supports this format
>- * @pixfmts_cap: list of CAPTURE pixel formats available with pixfmt
>- */
>-struct amvdec_format {
>-	u32 pixfmt;
>-	u32 min_buffers;
>-	u32 max_buffers;
>-	u32 max_width;
>-	u32 max_height;
>-	u32 flags;
>-
>-	struct amvdec_ops *vdec_ops;
>-	struct amvdec_codec_ops *codec_ops;
>-
>-	char *firmware_path;
>-	u32 pixfmts_cap[4];
>-};
>-
>-enum amvdec_status {
>-	STATUS_STOPPED,
>-	STATUS_INIT,
>-	STATUS_RUNNING,
>-	STATUS_NEEDS_RESUME,
>-};
>-
>-/**
>- * struct amvdec_session - decoding session parameters
>- *
>- * @core: reference to the vdec core struct
>- * @fh: v4l2 file handle
>- * @m2m_dev: v4l2 m2m device
>- * @m2m_ctx: v4l2 m2m context
>- * @ctrl_handler: V4L2 control handler
>- * @ctrl_min_buf_capture: V4L2 control V4L2_CID_MIN_BUFFERS_FOR_CAPTURE
>- * @lock: cap & out queues lock
>- * @fmt_out: vdec pixel format for the OUTPUT queue
>- * @pixfmt_cap: V4L2 pixel format for the CAPTURE queue
>- * @src_buffer_size: size in bytes of the OUTPUT buffers' only plane
>- * @width: current picture width
>- * @height: current picture height
>- * @colorspace: current colorspace
>- * @ycbcr_enc: current ycbcr_enc
>- * @quantization: current quantization
>- * @xfer_func: current transfer function
>- * @pixelaspect: Pixel Aspect Ratio reported by the decoder
>- * @esparser_queued_bufs: number of buffers currently queued into ESPARSER
>- * @esparser_queue_work: work struct for the ESPARSER to process src buffers
>- * @streamon_cap: stream on flag for capture queue
>- * @streamon_out: stream on flag for output queue
>- * @sequence_cap: capture sequence counter
>- * @sequence_out: output sequence counter
>- * @should_stop: flag set if userspace signaled EOS via command
>- *		 or empty buffer
>- * @keyframe_found: flag set once a keyframe has been parsed
>- * @num_dst_bufs: number of destination buffers
>- * @changed_format: the format changed
>- * @canvas_alloc: array of all the canvas IDs allocated
>- * @canvas_num: number of canvas IDs allocated
>- * @vififo_vaddr: virtual address for the VIFIFO
>- * @vififo_paddr: physical address for the VIFIFO
>- * @vififo_size: size of the VIFIFO dma alloc
>- * @bufs_recycle: list of buffers that need to be recycled
>- * @bufs_recycle_lock: lock for the bufs_recycle list
>- * @recycle_thread: task struct for the recycling thread
>- * @timestamps: chronological list of src timestamps
>- * @ts_spinlock: spinlock for the timestamps list
>- * @last_irq_jiffies: tracks last time the vdec triggered an IRQ
>- * @last_offset: tracks last offset of vififo
>- * @wrap_count: number of times the vififo wrapped around
>- * @fw_idx_to_vb2_idx: firmware buffer index to vb2 buffer index
>- * @status: current decoding status
>- * @priv: codec private data
>- */
>-struct amvdec_session {
>-	struct amvdec_core *core;
>-
>-	struct v4l2_fh fh;
>-	struct v4l2_m2m_dev *m2m_dev;
>-	struct v4l2_m2m_ctx *m2m_ctx;
>-	struct v4l2_ctrl_handler ctrl_handler;
>-	struct v4l2_ctrl *ctrl_min_buf_capture;
>-	struct mutex lock;
>-
>-	const struct amvdec_format *fmt_out;
>-	u32 pixfmt_cap;
>-	u32 src_buffer_size;
>-
>-	u32 width;
>-	u32 height;
>-	u32 colorspace;
>-	u8 ycbcr_enc;
>-	u8 quantization;
>-	u8 xfer_func;
>-
>-	struct v4l2_fract pixelaspect;
>-
>-	atomic_t esparser_queued_bufs;
>-	struct work_struct esparser_queue_work;
>-
>-	unsigned int streamon_cap, streamon_out;
>-	unsigned int sequence_cap, sequence_out;
>-	unsigned int should_stop;
>-	unsigned int keyframe_found;
>-	unsigned int num_dst_bufs;
>-	unsigned int changed_format;
>-
>-	u8 canvas_alloc[MAX_CANVAS];
>-	u32 canvas_num;
>-
>-	void *vififo_vaddr;
>-	dma_addr_t vififo_paddr;
>-	u32 vififo_size;
>-
>-	struct list_head bufs_recycle;
>-	struct mutex bufs_recycle_lock; /* bufs_recycle list lock */
>-	struct task_struct *recycle_thread;
>-
>-	struct list_head timestamps;
>-	spinlock_t ts_spinlock; /* timestamp list lock */
>-
>-	u64 last_irq_jiffies;
>-	u32 last_offset;
>-	u32 wrap_count;
>-	u32 fw_idx_to_vb2_idx[32];
>-
>-	enum amvdec_status status;
>-	void *priv;
>-};
>-
>-static inline struct amvdec_session *file_to_amvdec_session(struct file *filp)
>-{
>-	return container_of(file_to_v4l2_fh(filp), struct amvdec_session, fh);
>-}
>-
>-u32 amvdec_get_output_size(struct amvdec_session *sess);
>-
>-#endif
>+/* SPDX-License-Identifier: GPL-2.0+ */
>+/*
>+ * Copyright (C) 2018 BayLibre, SAS
>+ * Author: Maxime Jourdan <mjourdan@baylibre.com>
>+ */
>+
>+#ifndef __MESON_VDEC_CORE_H_
>+#define __MESON_VDEC_CORE_H_
>+
>+#include <linux/irqreturn.h>
>+#include <linux/regmap.h>
>+#include <linux/list.h>
>+#include <media/videobuf2-v4l2.h>
>+#include <media/v4l2-ctrls.h>
>+#include <media/v4l2-device.h>
>+#include <linux/soc/amlogic/meson-canvas.h>
>+
>+#include "vdec_platform.h"
>+
>+/* 32 buffers in 3-plane YUV420 */
>+#define MAX_CANVAS (32 * 3)
>+
>+struct amvdec_buffer {
>+	struct list_head list;
>+	struct vb2_buffer *vb;
>+};
>+
>+/**
>+ * struct amvdec_timestamp - stores a src timestamp along with a VIFIFO offset
>+ *
>+ * @list: used to make lists out of this struct
>+ * @tc: timecode from the v4l2 buffer
>+ * @ts: timestamp from the VB2 buffer
>+ * @offset: offset in the VIFIFO where the associated packet was written
>+ * @flags: flags from the v4l2 buffer
>+ * @used_count: times this timestamp was checked for a match with a dst buffer
>+ */
>+struct amvdec_timestamp {
>+	struct list_head list;
>+	struct v4l2_timecode tc;
>+	u64 ts;
>+	u32 offset;
>+	u32 flags;
>+	u32 used_count;
>+};
>+
>+struct amvdec_session;
>+
>+/**
>+ * struct amvdec_core - device parameters, singleton
>+ *
>+ * @dos_base: DOS memory base address
>+ * @esparser_base: PARSER memory base address
>+ * @regmap_ao: regmap for the AO bus
>+ * @dev: core device
>+ * @dev_dec: decoder device
>+ * @platform: platform-specific data
>+ * @canvas: canvas provider reference
>+ * @dos_parser_clk: DOS_PARSER clock
>+ * @dos_clk: DOS clock
>+ * @vdec_1_clk: VDEC_1 clock
>+ * @vdec_hevc_clk: VDEC_HEVC clock
>+ * @vdec_hevcf_clk: VDEC_HEVCF clock
>+ * @esparser_reset: RESET for the PARSER
>+ * @vdev_dec: video device for the decoder
>+ * @v4l2_dev: v4l2 device
>+ * @m2m_dev: v4l2 m2m device
>+ * @cur_sess: current decoding session
>+ * @lock: video device lock
>+ * @irq: decoder irq
>+ */
>+struct amvdec_core {
>+	void __iomem *dos_base;
>+	void __iomem *esparser_base;
>+	struct regmap *regmap_ao;
>+
>+	struct device *dev;
>+	struct device *dev_dec;
>+	const struct vdec_platform *platform;
>+
>+	struct meson_canvas *canvas;
>+
>+	struct clk *dos_parser_clk;
>+	struct clk *dos_clk;
>+	struct clk *vdec_1_clk;
>+	struct clk *vdec_hevc_clk;
>+	struct clk *vdec_hevcf_clk;
>+
>+	struct reset_control *esparser_reset;
>+
>+	struct video_device *vdev_dec;
>+	struct v4l2_device v4l2_dev;
>+	struct v4l2_m2m_dev *m2m_dev;
>+
>+	struct amvdec_session *cur_sess;
>+	struct mutex lock;
>+	int irq;
>+};
>+
>+/**
>+ * struct amvdec_ops - vdec operations
>+ *
>+ * @start: mandatory call when the vdec needs to initialize
>+ * @stop: mandatory call when the vdec needs to stop
>+ * @conf_esparser: mandatory call to let the vdec configure the ESPARSER
>+ * @vififo_level: mandatory call to get the current amount of data
>+ *		  in the VIFIFO
>+ */
>+struct amvdec_ops {
>+	int (*start)(struct amvdec_session *sess);
>+	int (*stop)(struct amvdec_session *sess);
>+	void (*conf_esparser)(struct amvdec_session *sess);
>+	u32 (*vififo_level)(struct amvdec_session *sess);
>+};
>+
>+/**
>+ * struct amvdec_codec_ops - codec operations
>+ *
>+ * @start: mandatory call when the codec needs to initialize
>+ * @stop: mandatory call when the codec needs to stop
>+ * @load_extended_firmware: optional call to load additional firmware bits
>+ * @num_pending_bufs: optional call to get the number of dst buffers on hold
>+ * @can_recycle: optional call to know if the codec is ready to recycle
>+ *		 a dst buffer
>+ * @recycle: optional call to tell the codec to recycle a dst buffer. Must go
>+ *	     in pair with @can_recycle
>+ * @drain: optional call if the codec has a custom way of draining
>+ * @resume: optional call to resume after a resolution change
>+ * @eos_sequence: optional call to get an end sequence to send to esparser
>+ *		  for flush. Mutually exclusive with @drain.
>+ * @isr: mandatory call when the ISR triggers
>+ * @threaded_isr: mandatory call for the threaded ISR
>+ */
>+struct amvdec_codec_ops {
>+	int (*start)(struct amvdec_session *sess);
>+	int (*stop)(struct amvdec_session *sess);
>+	int (*load_extended_firmware)(struct amvdec_session *sess,
>+				      const u8 *data, u32 len);
>+	u32 (*num_pending_bufs)(struct amvdec_session *sess);
>+	int (*can_recycle)(struct amvdec_core *core);
>+	void (*recycle)(struct amvdec_core *core, u32 buf_idx);
>+	void (*drain)(struct amvdec_session *sess);
>+	void (*resume)(struct amvdec_session *sess);
>+	const u8 * (*eos_sequence)(u32 *len);
>+	irqreturn_t (*isr)(struct amvdec_session *sess);
>+	irqreturn_t (*threaded_isr)(struct amvdec_session *sess);
>+};
>+
>+/**
>+ * struct amvdec_format - describes one of the OUTPUT (src) format supported
>+ *
>+ * @pixfmt: V4L2 pixel format
>+ * @min_buffers: minimum amount of CAPTURE (dst) buffers
>+ * @max_buffers: maximum amount of CAPTURE (dst) buffers
>+ * @max_width: maximum picture width supported
>+ * @max_height: maximum picture height supported
>+ * @flags: enum flags associated with this pixfmt
>+ * @vdec_ops: the VDEC operations that support this format
>+ * @codec_ops: the codec operations that support this format
>+ * @firmware_path: Path to the firmware that supports this format
>+ * @pixfmts_cap: list of CAPTURE pixel formats available with pixfmt
>+ */
>+struct amvdec_format {
>+	u32 pixfmt;
>+	u32 min_buffers;
>+	u32 max_buffers;
>+	u32 max_width;
>+	u32 max_height;
>+	u32 flags;
>+
>+	struct amvdec_ops *vdec_ops;
>+	struct amvdec_codec_ops *codec_ops;
>+
>+	char *firmware_path;
>+	u32 pixfmts_cap[4];
>+};
>+
>+enum amvdec_status {
>+	STATUS_STOPPED,
>+	STATUS_INIT,
>+	STATUS_RUNNING,
>+	STATUS_NEEDS_RESUME,
>+};
>+
>+/**
>+ * struct amvdec_session - decoding session parameters
>+ *
>+ * @core: reference to the vdec core struct
>+ * @fh: v4l2 file handle
>+ * @m2m_ctx: v4l2 m2m context
>+ * @ctrl_handler: V4L2 control handler
>+ * @ctrl_min_buf_capture: V4L2 control V4L2_CID_MIN_BUFFERS_FOR_CAPTURE
>+ * @lock: cap & out queues lock
>+ * @fmt_out: vdec pixel format for the OUTPUT queue
>+ * @pixfmt_cap: V4L2 pixel format for the CAPTURE queue
>+ * @src_buffer_size: size in bytes of the OUTPUT buffers' only plane
>+ * @width: current picture width
>+ * @height: current picture height
>+ * @colorspace: current colorspace
>+ * @ycbcr_enc: current ycbcr_enc
>+ * @quantization: current quantization
>+ * @xfer_func: current transfer function
>+ * @pixelaspect: Pixel Aspect Ratio reported by the decoder
>+ * @esparser_queued_bufs: number of buffers currently queued into ESPARSER
>+ * @esparser_queue_work: work struct for the ESPARSER to process src buffers
>+ * @streamon_cap: stream on flag for capture queue
>+ * @streamon_out: stream on flag for output queue
>+ * @sequence_cap: capture sequence counter
>+ * @sequence_out: output sequence counter
>+ * @should_stop: flag set if userspace signaled EOS via command
>+ *		 or empty buffer
>+ * @keyframe_found: flag set once a keyframe has been parsed
>+ * @num_dst_bufs: number of destination buffers
>+ * @changed_format: the format changed
>+ * @canvas_alloc: array of all the canvas IDs allocated
>+ * @canvas_num: number of canvas IDs allocated
>+ * @vififo_vaddr: virtual address for the VIFIFO
>+ * @vififo_paddr: physical address for the VIFIFO
>+ * @vififo_size: size of the VIFIFO dma alloc
>+ * @bufs_recycle: list of buffers that need to be recycled
>+ * @bufs_recycle_lock: lock for the bufs_recycle list
>+ * @recycle_thread: task struct for the recycling thread
>+ * @timestamps: chronological list of src timestamps
>+ * @ts_spinlock: spinlock for the timestamps list
>+ * @last_irq_jiffies: tracks last time the vdec triggered an IRQ
>+ * @last_offset: tracks last offset of vififo
>+ * @wrap_count: number of times the vififo wrapped around
>+ * @fw_idx_to_vb2_idx: firmware buffer index to vb2 buffer index
>+ * @status: current decoding status
>+ * @priv: codec private data
>+ */
>+struct amvdec_session {
>+	struct amvdec_core *core;
>+
>+	struct v4l2_fh fh;
>+	struct v4l2_m2m_ctx *m2m_ctx;
>+	struct v4l2_ctrl_handler ctrl_handler;
>+	struct v4l2_ctrl *ctrl_min_buf_capture;
>+	struct mutex lock;
>+
>+	const struct amvdec_format *fmt_out;
>+	u32 pixfmt_cap;
>+	u32 src_buffer_size;
>+
>+	u32 width;
>+	u32 height;
>+	u32 colorspace;
>+	u8 ycbcr_enc;
>+	u8 quantization;
>+	u8 xfer_func;
>+
>+	struct v4l2_fract pixelaspect;
>+
>+	atomic_t esparser_queued_bufs;
>+	struct work_struct esparser_queue_work;
>+
>+	unsigned int streamon_cap, streamon_out;
>+	unsigned int sequence_cap, sequence_out;
>+	unsigned int should_stop;
>+	unsigned int keyframe_found;
>+	unsigned int num_dst_bufs;
>+	unsigned int changed_format;
>+
>+	u8 canvas_alloc[MAX_CANVAS];
>+	u32 canvas_num;
>+
>+	void *vififo_vaddr;
>+	dma_addr_t vififo_paddr;
>+	u32 vififo_size;
>+
>+	struct list_head bufs_recycle;
>+	struct mutex bufs_recycle_lock; /* bufs_recycle list lock */
>+	struct task_struct *recycle_thread;
>+
>+	struct list_head timestamps;
>+	spinlock_t ts_spinlock; /* timestamp list lock */
>+
>+	u64 last_irq_jiffies;
>+	u32 last_offset;
>+	u32 wrap_count;
>+	u32 fw_idx_to_vb2_idx[32];
>+
>+	enum amvdec_status status;
>+	void *priv;
>+};
>+
>+static inline struct amvdec_session *file_to_amvdec_session(struct file *filp)
>+{
>+	return container_of(file_to_v4l2_fh(filp), struct amvdec_session, fh);
>+}
>+
>+u32 amvdec_get_output_size(struct amvdec_session *sess);
>+
>+#endif

What is this huge diff?

>-- 
>2.54.0.windows.1
>
>
>_______________________________________________
>linux-amlogic mailing list
>linux-amlogic@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-amlogic

Best regards,
Ferass

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
