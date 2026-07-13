Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BD1C43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 12:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WI4WnoF82xviqHqwjsXZoQ8fcBsbH70SdWRbhUiV7es=; b=4cfVocTu9JCNRn
	Yd/3BD1XMnEPKysLJWddBkDNbYLmS6brxxpDwDTwRCNYqxm5qnaJGIDEUfhLODVyqm3x1WxyCpApE
	uwf0yyy824dY4UJP579ykndipsWKP3ixb5Sul6Vm3NzqfQCJi/ojA5rGSKAQvY5dpqPB7w1jgcEuI
	YAmSS6U3VmZfb13oBvWQIL8kzF0F7zduHcsCI8pkp7JjmaEyuj0rgCqUkYh98oWqwx/YAXyGvO8RZ
	39GMVQ4a3DgWhRcRKi8+BN+hQe7Npm4FkLlATALMURB7d0VHZ0a7z6RmcuthQFaVgDqUwxT3iAAuN
	g3mRL719DdxmXkkUYbkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFT7-000000097wo-1ZUy;
	Mon, 13 Jul 2026 12:09:05 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFT5-000000097vm-1kkh
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 12:09:04 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-381891a9525so3417504a91.3
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 05:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944543; x=1784549343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARrER7TwdRrsnOsOCnXp0K3Qc6DycIa1Bph8QCPIN4s=;
        b=TDRjIfY0fj9daCcXpyuGiCrkR0BEcXD5awgxor1PYAgfAURpqA0aXhOtor4MW6qnQM
         b46kvvLtCzf5PjC/ko8DRlOjI/N3VUPvEvBAfHX6j5+qash8n2vmV99jp2A4ezdklU3P
         uGAnNDUxSGXowP+2rmOKVkIKr8KbR32G12NjWcK7W3+SPH4jryzyV+OmGrKXpRbkoHY6
         iJkDzC4YLJrVWuJ/pN/B7D35mOJHvYmiVHFj3oSgTQfoIgMF/bUjSgYfIOeFP14+NmMR
         oYNbnUkZuEn9irlDgoKPLjNjMjig8a+5ZUHLoT6PYp2vxFSxkG1aGhG9qSz3E6oIyzYu
         9GjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944543; x=1784549343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ARrER7TwdRrsnOsOCnXp0K3Qc6DycIa1Bph8QCPIN4s=;
        b=KEJgBsNhna70TLlaH+5JFTiduGXs4cGEKcREzQKN+u9b4uaQZCUAZujqkCfDl8+wjM
         YyVM/b7x/JWBCGJ1hKFpmz+t5TqAKGPNtJV4FXv0UoLCAMveU/QRqLFw1ORqxYvIIlct
         HNkJNMYpaVMzHo+5Kz0bTEVcbKT2zm35fLHiwfy6dXnJ6WSLtA4ViN5NQiWfH+JVbrK8
         jD/ZiavIKIYVH61Zm3A23FnnhOsPdynlwq1fjZOXZmaeh3RC2y/SfjuSUzsZOnUhkuXs
         KzlaDu5t9G5FWWhowvhllxZ76F2ESywbjZDOqxHw4XRBP9nBLCYPfdP6NopvY4FrDnxy
         3EDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0JWlb7SLz5psOQcqEYnsKBJv73nkv8pU/K2RJ+4Eot1byzn1T8gTAElPWYIYfepGMM5W52ktjFtYR1ciQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ+AN7cKubhuv1mbC7/x/TVf1iaXcbnoHOU7iakZ02nphQFejS
	RueAk09ZWN/Wlsr5YfhSc5inqdSMHm3y/p2bHuYpPRW7kY6rgUFRGIOc
X-Gm-Gg: AfdE7ckNPsVmBM5AfKk7ZI+sG5vPwdZTF+2oosNvgIcBrkPJ0OQ+CseXnR9ze6OHSlo
	8pi/DpBO4ZSiQ4esgUZMJoyx7Ew8iMx/WgRaqF3EsMzQpR7ovt02Gm4YjCHgqU/DQKtr8DHAoiC
	caOlc1Bya7eIsAxjNc1I75KXdLSqurB3sGXw645ixyVYLRjlRD+xUzhmhio+i4q1zWV3Dt3gGTJ
	FABRUYjNkeV6fhGK5Ygr5Wf6Ytadoos4I4bCmqijTSwry+0QzPYNZY//1DvV+uVfGkLqfsMk8Wk
	Dtze1x+dCTircXQFtmILsAyOwKSj25BfAqRtdJO2BHh+rcwtFFjyH8uQbsHlCQxqBLU2ga4Z1k6
	08HMhGQMv+SjOMZQpzL99Wf5KfEva3qv4lZUlQ/m8f1zWAOcMbIqNUtOwPW9qRLg6SXnhL0+A6G
	mVwk/beTV2tQ==
X-Received: by 2002:a17:90b:2750:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-38dc75ebea3mr8633908a91.16.1783944542617;
        Mon, 13 Jul 2026 05:09:02 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:01 -0700 (PDT)
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
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v7 01/19] media: meson: vdec: Fix m2m device lifetime and cleanup path
Date: Mon, 13 Jul 2026 17:36:56 +0530
Message-ID: <20260713120840.17427-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_050903_466205_97982FF5 
X-CRM114-Status: GOOD (  18.92  )
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
Cc: Doruk Tan Ozturk <doruk@0sec.ai>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The vdec driver was incorrectly initializing a new v4l2_m2m device
instance per session inside vdec_open() and releasing it in vdec_close().
This design is faulty because the m2m device models the core hardware
engine and must persist across multiple sessions.

Fix the lifetime by moving v4l2_m2m_init() into vdec_probe() and
releasing it in vdec_remove() which resolves passing the global
core->m2m_dev down to session contexts so all sessions share the
same hardware instance.

This change aligns the driver with proper v4l2_m2m usage, ensuring
the hardware device lifetime is tied to the platform driver core,
not individual sessions, and making teardown safe and predictable.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 36 +++++++++++++------------
 drivers/staging/media/meson/vdec/vdec.h |  4 +--
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index a039d925c0fe5..6ae3471155a87 100644
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
+		goto err_free_sess;
 	}
 
 	ret = vdec_init_ctrls(sess);
 	if (ret)
-		goto err_m2m_ctx_release;
+		goto err_release_ctx;
 
 	sess->pixfmt_cap = formats[0].pixfmts_cap[0];
 	sess->fmt_out = &formats[0];
@@ -913,10 +906,8 @@ static int vdec_open(struct file *file)
 
 	return 0;
 
-err_m2m_ctx_release:
+err_release_ctx:
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
-err_m2m_release:
-	v4l2_m2m_release(sess->m2m_dev);
 err_free_sess:
 	kfree(sess);
 	return ret;
@@ -927,9 +918,9 @@ static int vdec_close(struct file *file)
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
-	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 
 	mutex_destroy(&sess->lock);
 	mutex_destroy(&sess->bufs_recycle_lock);
@@ -1059,16 +1050,23 @@ static int vdec_probe(struct platform_device *pdev)
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
 	if (!vdev) {
 		ret = -ENOMEM;
-		goto err_vdev_release;
+		goto err_v4l2_unregister;
 	}
 
 	core->vdev_dec = vdev;
@@ -1096,7 +1094,10 @@ static int vdec_probe(struct platform_device *pdev)
 
 err_vdev_release:
 	video_device_release(vdev);
+err_v4l2_unregister:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_m2m_release:
+	v4l2_m2m_release(core->m2m_dev);
 	return ret;
 }
 
@@ -1105,6 +1106,7 @@ static void vdec_remove(struct platform_device *pdev)
 	struct amvdec_core *core = platform_get_drvdata(pdev);
 
 	video_unregister_device(core->vdev_dec);
+	v4l2_m2m_release(core->m2m_dev);
 	v4l2_device_unregister(&core->v4l2_dev);
 }
 
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index 7a5d8e871d708..cc0cfafb8a951 100644
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
