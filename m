Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29CCC43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 17:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zrECAUHatWntQPK40KxyiKAb1fVI+ci+xDpnDDxoyAs=; b=wrYzRoyonRQRUu
	yH46WzXkWqYi1vZIKZfPGg1FhRCI1QLUz8IgybIlIhcmv5s6vJqkJZi802jO2PcOf410gD3TkmqR5
	alYbUi0mpUFPk5FRRc8qqVziNE58lqNTiKFF8nQrxQE3mqDLSErwgvnEfWAFsZHN7gqT6yiPIL4Fz
	KqWA2ygveSbKxkOfCxLAhBk/xDOSUIfPaIGJe3jPZugIipJ+TESmIX2GTJc5DCcH8KuOV9zC401Ba
	KKIWtWL7YKmxMuFlN0LhoUsL7fvzVb5q6+Zuqz9ZoQVGQS8clc1FeOd0r59SectXvyLS/E3rE797X
	9xmNQqgnpIBiczw1g5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKcU-0000000A85C-3GNe;
	Mon, 13 Jul 2026 17:39:06 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKcR-0000000A84j-0ZAU
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 17:39:04 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cad8076b01so39940275ad.2
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 10:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783964342; x=1784569142; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJTXKcUVPMM2q094v4fU7tfA4D6n06AAOLUKvX0e/q8=;
        b=EiB1rJRRe89Q7s6QT8W+RYHWPuXVoMhVUsx30xTBH5W98xBmsqA2Ip/R2TnGyGj+N9
         hT2QO9Rbxl1jLD0fzLgivLVyesZ/L91n70lMIsvDZOPSGAwCH7uft98vwmr3MrDR2f2l
         uhnSbHvI6KsxqYk7OGLDfD4K6uWfKahzAyyqJlxDX/qdIm+tgDQCvTreOL98oeoAM/Fe
         XcFUHDgmW09n07/isDEQL/fYXmh2KhguAqoNduR0TizNi2mSv0y62zO1gD8yV2JxFgpj
         fHSXTrzoiV4f5Wh95dsVNDLJNZD/Zy3E0FrrLBcrbG5dLsAtgQGMyii2jTm/pgijQJcO
         M7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783964342; x=1784569142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJTXKcUVPMM2q094v4fU7tfA4D6n06AAOLUKvX0e/q8=;
        b=fjhM9575l0lfG9tQgw+0cgRDjJqPBzhmzhtmei/SPcORJigOFCh1410/AvC2xqm7e/
         GJ+xzvke1HsPMpG5Mn3ksgjGwlHF6iF5Ke1zqBkN2bh5EGbbfMqfaqAmwUYlXYZfi/du
         Q25VqHlIxbkFCgK5QHvHPdWp+RyFR6Kg99PJPrkIhOVkmQLAjHAIRJwjna05KGkLUPUo
         MHtGt7ljNCDxSfjKY0YEr1p87GE/N1nzIZYWmRCOPC91f4gBvzWgYJsTXTWIulUqMwmU
         HVZT+SeEAZ7ApCzncQCFcw9rjIyRFZH1jVwnrMAhWpmyBlCJK5KdsMyPIpIxm+syN0Hw
         /o6A==
X-Forwarded-Encrypted: i=1; AHgh+RpFXdvbnfk2xvN7Lwy0cnskKLXaCI+Ys7ltPgvc9XmwKP4KcITHKV6NLglYZaXdCYYbT0kyXzms9nfDEttK@lists.infradead.org
X-Gm-Message-State: AOJu0YwiwWW1kVoXdVnLFm/TUaraTbwkpcUVZz4HK1LakqELI/QRbQNX
	4NM5g6Q68dnk0SoTmk0np1U4el1R5ij1ialJVqwKj7c0SDXHCPxMrgMx
X-Gm-Gg: AfdE7claLjDi964bZh3WkY/dKcpVro1R5f0SZ4+J0FEVdvErvy/NeOnAoE6kNTSWaB0
	mnS6U+a4jo5thDeVoM+rF1pZUtioILFgbqAN0FwvWoSp+4cbPR+v/2ySmU/teFb3PSieU/JqKXy
	JCPyfvOQi8/Pvd1z5CXneE/2SNq851qJgnCV2UBHs4bbhmz7DZBmCvWz2IpcjUZPA7+g1jFdX/W
	Uc8TnYgCMO5VnP0piQ7g/OAQJNJzesCBlB4EZGmLoFbSYy9QPKCTlqpXobSWjViZXKCDYRYO58P
	0MkzvQ5+Bh9qwSmzIJk3DkaX6jNkvYCG13Nycm8NTecdCZ+2Bs83hVhpd518uchwCtL3anKEHj8
	9vmIUfmKTJOlhnVLIK/zcN1lrdW3WtKb7VFGDKY5uAZRVq+3Ypo2TK/xsvJ2V1u19YI0BzQcxu4
	mHNDq/r8bejyGD6eDslHDA9Vs6GnjZbmlDB4b99PRxjgNBqlBYyLSyJDgqGV/QyPIddj3SGGaUh
	ZsKGcU7lb0GUVpsGNYKKg3aNHmULB+t3jvni/6REulDDug=
X-Received: by 2002:a17:90b:134b:b0:37d:ee77:78ac with SMTP id 98e67ed59e1d1-38e17dce582mr175439a91.19.1783964341727;
        Mon, 13 Jul 2026 10:39:01 -0700 (PDT)
Received: from OMEN ([103.184.238.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm48273547eec.26.2026.07.13.10.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:39:01 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alfie Varghese <alfievarghese22@gmail.com>
Subject: [PATCH] staging: media: meson: vdec: fix UAF, memory leak and NULL derefs
Date: Mon, 13 Jul 2026 23:08:59 +0530
Message-ID: <20260713173859.643-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_103903_180733_12E4581E 
X-CRM114-Status: GOOD (  11.07  )
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

This combined commit fixes several pre-existing issues identified in the
Amlogic video decoder driver:

1. Fix a critical Use-After-Free in vdec_close() by synchronously
   canceling the sess->esparser_queue_work before freeing the session.
2. Fix a memory leak in vdec_close() by freeing the session control
   handler via v4l2_ctrl_handler_free().
3. Prevent a potential NULL pointer dereference in vdec_probe() by adding
   a NULL check for of_match_node()'s return value.
4. Prevent a potential NULL pointer dereference in vdec_isr() and
   vdec_threaded_isr() by adding NULL checks for core->cur_sess.

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index a039d925c0fe..b794ad53711c 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -926,11 +926,15 @@ static int vdec_close(struct file *file)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
 
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
+
 	mutex_destroy(&sess->lock);
 	mutex_destroy(&sess->bufs_recycle_lock);
 
@@ -953,6 +957,9 @@ static irqreturn_t vdec_isr(int irq, void *data)
 	struct amvdec_core *core = data;
 	struct amvdec_session *sess = core->cur_sess;
 
+	if (!sess)
+		return IRQ_NONE;
+
 	sess->last_irq_jiffies = get_jiffies_64();
 
 	return sess->fmt_out->codec_ops->isr(sess);
@@ -963,6 +970,9 @@ static irqreturn_t vdec_threaded_isr(int irq, void *data)
 	struct amvdec_core *core = data;
 	struct amvdec_session *sess = core->cur_sess;
 
+	if (!sess)
+		return IRQ_NONE;
+
 	return sess->fmt_out->codec_ops->threaded_isr(sess);
 }
 
@@ -1020,6 +1030,8 @@ static int vdec_probe(struct platform_device *pdev)
 		return PTR_ERR(core->canvas);
 
 	of_id = of_match_node(vdec_dt_match, dev->of_node);
+	if (!of_id)
+		return -ENODEV;
 	core->platform = of_id->data;
 
 	if (core->platform->revision == VDEC_REVISION_G12A ||

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
