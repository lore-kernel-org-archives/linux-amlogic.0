Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00367CD5BD0
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 May 2026 09:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=59dhBJ5MMZNHK83UCVjHZUrCEMhra4cBBsJ0wN+PWCE=; b=N8aOYwhwoyCFxZ
	v62n+B/dDkAPRZZQrSro4S/QuqxipgRaK5YvTkHRvKHJEEjcXv1NIVy60q8rhxJq+NmRA5KnnbYzB
	/VhUkOkN7MdYroTEEhVkZqmrdW553V+luPhzZCggohOZqME2M19CChl0vKCpAmNkNbXdNH7hJIrLk
	0FaHQj44o0E+pE+xXI/NaQ3pLUmwLW2h9l8cC3YMJj7Dwa0ze6rZILM9YFBpATcO17CCKpCQ/61HJ
	kRo3sSLeLlWPJ7AR/3GjcRlDeO5h/Bd0Rip/CPiZQNUGyMwFnb8qKR8WXUoLWk2C3G0FI0BM139nA
	eZojXfGrjEjgng9gzDjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGEo-00000008aUx-15LV;
	Sat, 30 May 2026 09:44:14 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGEl-00000008aTu-1qvw
	for linux-amlogic@lists.infradead.org;
	Sat, 30 May 2026 09:44:12 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-36d5b11201aso214155a91.2
        for <linux-amlogic@lists.infradead.org>; Sat, 30 May 2026 02:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134250; x=1780739050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOGv5iwSngrj41XE+piVh0d8DY2B1AD5Rx86ecpnAxY=;
        b=kvlCjEUnnv7c+RI8zOa281TbP47SzbPqs7NIQcADvxmrzV3uIF1hS2XDs19idkmk6n
         sNLJ1q6Rao5YBnv8nExuNVbGTHtl0Ey4KnjxpxlrkDnRqHATZ9xMxiTTCMGDq8fPyOmm
         bHKoFUqGKPWM9uINUOdrcj46YngzENsnnpEp4vLBRtvicrKc1aXFoMLXRl3Lr+BYkY7n
         s3H19KJaq+TfdtSCM4QPFfZFZ5xHnJ3d3ElbGaimsVIvrb6Odf+sYg4oJOvlzZmmKmVE
         jNLkSXAN6ZxVIZE7kdrIrcJ845Geb2szXNGzQuL1DvXmeIfNiv9jiRkfpEgRQ8rT6mXg
         y0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134250; x=1780739050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MOGv5iwSngrj41XE+piVh0d8DY2B1AD5Rx86ecpnAxY=;
        b=MjHS7q3mDZGShQfLXrJHTo/O1rmVthTv0OwoAdz0HrB67Wnq3mTG/r9nHoIEcOfic8
         sFg1a3Kr5jwwI9/23dmwYEAQ/Tn0d4ufWYtCZgYBL4lyiqeGfjXYXpN/8EJRF92U8jGZ
         iYez1P5IynmHDR+qdXMXNN7gQyNNnN0VoH4fyzqb5fs2daLIfsVf1B+XZCFlv+YsIl97
         cJrgcKZkjv9lZCViSQ19q5lvpxe90fJBGp0Z6WM0C9noEH6yMOC9EqrevQuiLTXg2qxa
         ZM6DEdXStjv5aGbr0yelRdNVoXkqNqdW9iFMaNAsQgN2S3wxH3XraAYbnfkKWxtet3Fs
         if8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+IGLOZQV/3GTtOrWU+u/ptAuhgi4pK8Z2EyimPD0WES2kR698gR7AjITAwEKObEpiGYw1ZvN5IX3bZ147b@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ7VAGxr42TfEFbFSI3Cjc4rTmglN8IZIp7kuVrh9kFH1E47VZ
	A8ZuULfvz2t136SqS6lr6KMUOSUMyNd4X49VIIp+cpFJSM1+UKHKtQv8
X-Gm-Gg: Acq92OFImHJbmhvfIX4W3nQ9hlfLeP4FKZv7iFn6ggxw3Q3v8m5MAYdGqG2P1Kwnu7b
	9sTtbnI7Ef+F/PrAn9bn+7gOrmXB3bFyy22rY+8FmB5662jwphBa4FedqEgxTITBxDcA2zYPnLZ
	/N0iqQTXEdo08q09PjcJmt0Fv+/cMjd7dPlHliBMiBotN01K+6EfKvrYdyjW//CnrHq1OhyGAsT
	wxpIx7QQtI4dbx2ZCziGS9ujMDEqA+TQEZxd5KWSXAogNrczkkxwCITXy6mtrwSQckX0sEynTze
	AUuj4bD7u8QaQO4psxg+1AfGOFZu5S0gTN9QyrywVXUDIfYN5A/hbNNtayw0HhLcsjXjJIyn3bf
	bZJex/Q7Do9g/C2Pw74vZjNjHcYZi50ql4mOxU2v/wk9NwdouNdXxBYz4KipbZhXoONWDL6lEfO
	dELJDGwbWJlbOT5Bwy4Xm0t7gk7zgM+CM=
X-Received: by 2002:a17:903:a8f:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2bf36889991mr42155535ad.41.1780134250482;
        Sat, 30 May 2026 02:44:10 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:44:09 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v6 1/8] media: meson: vdec: Fix memory leaks and lifetime of m2m device
Date: Sat, 30 May 2026 15:12:47 +0530
Message-ID: <20260530094326.11892-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_024411_485969_DC0457C1 
X-CRM114-Status: GOOD (  19.90  )
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
Cc: Sashiko <sashiko-bot@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The driver was initializing the v4l2 m2m device instance per-session
within vdec_open() and releasing it inside vdec_close(). This approach
is faulty because the m2m device represents the hardware context and
should persist across multiple open sessions.

Fix this design flaw by shifting v4l2_m2m_init() to vdec_probe() and
v4l2_m2m_release() to vdec_remove(). Correspondingly, move the m2m_dev
pointer from struct amvdec_session to struct amvdec_core.

Additionally, this patch addresses two critical resource leaks:
1. Adds a missing v4l2_ctrl_handler_free() in vdec_close() to clean up
   allocated control handlers upon session closure.
2. Introduces proper unwinding logic via a new 'err_fh_del' label in
   vdec_open() to ensure that file handles (v4l2_fh) are fully deregistered
   if subsequent session resource allocations fail.

This was identified via kmemleak:
unreferenced object 0xffff0000205d6878 (size 8):
  comm "v4l_id", pid 5289, jiffies 4294938580
  hex dump (first 8 bytes):
    40 d2 49 18 00 00 ff ff                          @.I.....
  backtrace (crc d3204599):
    kmemleak_alloc+0xc8/0xf0
    __kvmalloc_node_noprof+0x60c/0x850
    v4l2_ctrl_handler_init_class+0x1b4/0x2e8 [videodev]
    vdec_open+0x1f4/0x788 [meson_vdec]
    v4l2_open+0x144/0x460 [videodev]
    chrdev_open+0x1ac/0x500
    do_dentry_open+0x3f0/0xfe8
    vfs_open+0x68/0x320
    do_open+0x2d8/0x9a8
    path_openat+0x1d0/0x4f0
    do_filp_open+0x190/0x380
    do_sys_openat2+0xf8/0x1b0
    __arm64_sys_openat+0x13c/0x1e8
    invoke_syscall+0xdc/0x268
    el0_svc_common.constprop.0+0x178/0x258
    do_el0_svc+0x4c/0x70

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 33 ++++++++++++++-----------
 drivers/staging/media/meson/vdec/vdec.h |  4 +--
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..4ffebba2341d 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -153,7 +153,7 @@ static void vdec_m2m_job_abort(void *priv)
 {
 	struct amvdec_session *sess = priv;
 
-	v4l2_m2m_job_finish(sess->m2m_dev, sess->m2m_ctx);
+	v4l2_m2m_job_finish(sess->core->m2m_dev, sess->m2m_ctx);
 }
 
 static const struct v4l2_m2m_ops vdec_m2m_ops = {
@@ -873,23 +873,16 @@ static int vdec_open(struct file *file)
 
 	sess->core = core;
 
-	sess->m2m_dev = v4l2_m2m_init(&vdec_m2m_ops);
-	if (IS_ERR(sess->m2m_dev)) {
-		dev_err(dev, "Fail to v4l2_m2m_init\n");
-		ret = PTR_ERR(sess->m2m_dev);
-		goto err_free_sess;
-	}
-
-	sess->m2m_ctx = v4l2_m2m_ctx_init(sess->m2m_dev, sess, m2m_queue_init);
+	sess->m2m_ctx = v4l2_m2m_ctx_init(core->m2m_dev, sess, m2m_queue_init);
 	if (IS_ERR(sess->m2m_ctx)) {
 		dev_err(dev, "Fail to v4l2_m2m_ctx_init\n");
 		ret = PTR_ERR(sess->m2m_ctx);
-		goto err_m2m_release;
+		goto err_fh_del;
 	}
 
 	ret = vdec_init_ctrls(sess);
 	if (ret)
-		goto err_m2m_release;
+		goto err_free_sess;
 
 	sess->pixfmt_cap = formats[0].pixfmts_cap[0];
 	sess->fmt_out = &formats[0];
@@ -913,8 +906,8 @@ static int vdec_open(struct file *file)
 
 	return 0;
 
-err_m2m_release:
-	v4l2_m2m_release(sess->m2m_dev);
+err_fh_del:
+	v4l2_fh_exit(&sess->fh);
 err_free_sess:
 	kfree(sess);
 	return ret;
@@ -925,9 +918,9 @@ static int vdec_close(struct file *file)
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
-	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 
 	mutex_destroy(&sess->lock);
 	mutex_destroy(&sess->bufs_recycle_lock);
@@ -1057,10 +1050,17 @@ static int vdec_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	core->m2m_dev = v4l2_m2m_init(&vdec_m2m_ops);
+	if (IS_ERR(core->m2m_dev)) {
+		dev_err(dev, "Failed to initialize v4l2 m2m device\n");
+		return PTR_ERR(core->m2m_dev);
+	}
+
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret) {
 		dev_err(dev, "Couldn't register v4l2 device\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_m2m_release;
 	}
 
 	vdev = video_device_alloc();
@@ -1095,6 +1095,8 @@ static int vdec_probe(struct platform_device *pdev)
 err_vdev_release:
 	video_device_release(vdev);
 	v4l2_device_unregister(&core->v4l2_dev);
+err_m2m_release:
+	v4l2_m2m_release(core->m2m_dev);
 	return ret;
 }
 
@@ -1104,6 +1106,7 @@ static void vdec_remove(struct platform_device *pdev)
 
 	video_unregister_device(core->vdev_dec);
 	v4l2_device_unregister(&core->v4l2_dev);
+	v4l2_m2m_release(core->m2m_dev);
 }
 
 static struct platform_driver meson_vdec_driver = {
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index 7a5d8e871d70..cc0cfafb8a95 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -63,6 +63,7 @@ struct amvdec_session;
  * @vdec_hevcf_clk: VDEC_HEVCF clock
  * @esparser_reset: RESET for the PARSER
  * @vdev_dec: video device for the decoder
+ * @m2m_dev: v4l2 m2m device
  * @v4l2_dev: v4l2 device
  * @cur_sess: current decoding session
  * @lock: video device lock
@@ -87,6 +88,7 @@ struct amvdec_core {
 	struct reset_control *esparser_reset;
 
 	struct video_device *vdev_dec;
+	struct v4l2_m2m_dev *m2m_dev;
 	struct v4l2_device v4l2_dev;
 
 	struct amvdec_session *cur_sess;
@@ -183,7 +185,6 @@ enum amvdec_status {
  *
  * @core: reference to the vdec core struct
  * @fh: v4l2 file handle
- * @m2m_dev: v4l2 m2m device
  * @m2m_ctx: v4l2 m2m context
  * @ctrl_handler: V4L2 control handler
  * @ctrl_min_buf_capture: V4L2 control V4L2_CID_MIN_BUFFERS_FOR_CAPTURE
@@ -230,7 +231,6 @@ struct amvdec_session {
 	struct amvdec_core *core;
 
 	struct v4l2_fh fh;
-	struct v4l2_m2m_dev *m2m_dev;
 	struct v4l2_m2m_ctx *m2m_ctx;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *ctrl_min_buf_capture;
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
