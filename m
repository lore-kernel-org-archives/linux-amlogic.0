Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31916CD5BBF
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 May 2026 09:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bVfcR8Ib/8TExfHbPyiSDgfbgcMavJXdB8Kt8LDhdmY=; b=l8w+ruJtORI+IW
	26owmh+/Dq1encWg+2mhAaarIpHU8Frh1kwU5YS717G6rIlDsMhFxNgh7o/Au3Rt5J6d1z5M1tnmz
	Tyb5gpipl0uv/FI4j1xVVmt8mEjqi55jD7fzq8J5pwNvyR1pLh9a7xVcr6G/14uqOp7NTpLpEwVDv
	KDbGQHI9TM33fj72jyJlCyxX1MDwZesIvRZWT5T07PItgFxyoFn2RQYfy3+O7w2F2s+r/YfwWzBu4
	88tRFZlGH3s1NZ8YIQ+0ZPyfj1J2KadrZuRxi3PFCz5BgppdGwRu1bKJezVEpF9QAO/H7dl3uc0LJ
	OyR2YQul0CaLOfgKWBcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzz-0000000Gspm-43Ya;
	Mon, 25 May 2026 09:53:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzy-0000000GsnU-1wpq
	for linux-amlogic@bombadil.infradead.org;
	Mon, 25 May 2026 09:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AKwrXEXaLENw99YJowK3xb8rjn7NyiynQVbSpLY2vlI=; b=Gin17YnkW6vppUhdzC1/bAiuwE
	s0NdSJePxGx5KO0PD06MaWaQhA244cvIuY0AS1Wr87R/ge91FsPGoMtjD8505DqBbNNa/M0R9xDaS
	myePnSZ7qNZeXJSdXBY9joVk5WkKwabWDULTU/cwR9nsIuxLy3hxY+OUcEWu2jLC9XjqTcEi+Yl1C
	hFECGbXyZppMBmH/9phWtQtwXabmxtpBCNizDh3UghhOxYBezlI990M7N5BVHlRSznla1AKJ/Fxbw
	EQ6cIQsNfTeFwm2DUonnGGBHPezgTB/eP/vnqvj0Gy2jjmV0Nr20pyU5T5hagOWIiNWLOb4j0Y86z
	bX01sSPA==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzv-00000008wgI-1HYR
	for linux-amlogic@lists.infradead.org;
	Mon, 25 May 2026 09:53:25 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2b45cb89f7eso63454345ad.0
        for <linux-amlogic@lists.infradead.org>; Mon, 25 May 2026 02:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702802; x=1780307602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKwrXEXaLENw99YJowK3xb8rjn7NyiynQVbSpLY2vlI=;
        b=QvBsXgCQZV3UVx0UBG5v3OikZR2+rBckV+3IAvIVXvY9sTjstBDk+GzGO0QPWWhVFR
         jTfQypPVON3MB+y9Lf0f9cjyYzgHkQFjd5sVJtDe/qUQg8W0EqVa9PkbZseIXXERPFxg
         rM/kybAS6Ho1G5J1bnhIBSc3iy/rZQC7rbK3tpQvpaHSi2zye7+BopcNqiiu/erEwLBp
         L4SwZ6woNKvuReJku6DCfCB+C5tgDBPpRowUIQicBmkqVMQAaqVnwMv03h2rWPLmbEO1
         2doM5y1kUdmzYnevmULoSmTsGhsx9goUf50FrnKtvo+S1Mq4G+y6HK3d0Fx41x3mH4UX
         32Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702802; x=1780307602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AKwrXEXaLENw99YJowK3xb8rjn7NyiynQVbSpLY2vlI=;
        b=IGu5/ELBHjimku8xY5u3Z4QDWaYatsPOkPAfZ4gU5ACAPC7nwhq/8mYZsS7lsiLJoo
         yU+5/t89rfeGmFtc2EYvMPAhTfHTbrsV5tiq90W5fJBCqG9EcBzOYinjD32EReSd6FfM
         dsrO2l/xms1JC5BwTiICRwGW1OgZ+2iozoORE1HbPoc+/ySlTfO7rXRKFkl/847DciC5
         lAf3ZWt3zRq1mGv2NHubbwHBBMeYcS15mG8qoMKlZJIwrfTyBb0E8JRJtyheTO0ohpvI
         39R9pONouiaiW+KlOzOIBPkBDw9U+pEsdwhjygMml7SLnGr+NYpUtYgNDLXfxlaN8gxT
         ElXw==
X-Forwarded-Encrypted: i=1; AFNElJ+t8CKgBCAE7FvnG4sIkCfS1ZaMK5RX5gzTEITbLy7M/L8P0mvzdH+zZ7HF+UPU046g4i8gUE8tl6GIwnmD@lists.infradead.org
X-Gm-Message-State: AOJu0YxnXdAjhYMLYNuxTi36e/ik+GWDovGRHSp/BBT9X1RdEGd3lYmT
	lKqphPja1Pi2eYdMIHHfX1kop0T9ISQF+kbqN2spk9fOtgkk+wSnmEmu
X-Gm-Gg: Acq92OGkM/zzHRsCPorqeoUNi2ey6XDC+sYT0v2DjPxrshH1dbw9CMkEJvEiVazcD+S
	hwCnemqh7eO9ruailIvpck2b4uxEjjcw0+82u2dk9bU6VzGRCjtoc+mKiJjOE2hy2HtmVXulV3c
	9FNvm2aERojyg5+dQylpv35P33pjPtVDLSzFsl+wlFtMV1CaRMBCKp1VnxZynGaZ8pvgwqWblyy
	+Ir45gi+XltysXKxPBTEAyPg2OyFw1EYW3rATi19nnq1Sy2lqvq03HjpWLIabXf3VJfU+wkQkSN
	fSauLjYgosg5+6lXfHdCzwhHfAdGZwIh6bnVjf2+C2ZftK354zMvyjqVPup7k+JjupbwZQnBGkU
	cKqSbmxlxLhaAJkZHH1wv8PL2EhwJ+r7p4iYhvAVp2CPhZKqvf3xeL/+5Re0NSI48nBw9SLrkNh
	zwjXQoq9xtAZ/gm36GPVf8
X-Received: by 2002:a17:902:ebc2:b0:2ae:6259:5aff with SMTP id d9443c01a7336-2beb031adfdmr138558515ad.6.1779702802100;
        Mon, 25 May 2026 02:53:22 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:53:21 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 6/6] media: meson: vdec: Cancel esparser work in error and stop paths
Date: Mon, 25 May 2026 15:21:54 +0530
Message-ID: <20260525095216.12078-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260525095216.12078-1-linux.amoon@gmail.com>
References: <20260525095216.12078-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_105323_662563_1FC2BB49 
X-CRM114-Status: GOOD (  14.01  )
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

The esparser workqueue may remain pending when streaming is stopped or
the device is closed, leading to use-after-free if it runs after session
teardown. vdec_start_streaming(), vdec_stop_streaming(), and vdec_close()
did not cancel this work, leaving a race between session cleanup and
work execution.

Fix this by calling cancel_work_sync(&sess->esparser_queue_work) in all
cleanup paths. Unlocking and relocking sess->lock around the cancel
ensures the work handler cannot run concurrently with teardown. This
prevents dangling work items from accessing freed session memory and
eliminates a potential kernel crash.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: Tried to fix the order of cancel_work_sync() which could lead to
   a use-after-free. update the commit message.
---
 drivers/staging/media/meson/vdec/vdec.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 925537bd4d0b..296b387f3667 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -372,6 +372,10 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
+	mutex_unlock(&sess->lock);
+	cancel_work_sync(&sess->esparser_queue_work);
+	mutex_lock(&sess->lock);
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		sess->streamon_out = 0;
 		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
@@ -430,6 +434,9 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 			kthread_stop(sess->recycle_thread);
 
 		vdec_poweroff(sess);
+		mutex_unlock(&sess->lock);
+		cancel_work_sync(&sess->esparser_queue_work);
+		mutex_lock(&sess->lock);
 		vdec_free_canvas(sess);
 		dma_free_coherent(sess->core->dev, sess->vififo_size,
 				  sess->vififo_vaddr, sess->vififo_paddr);
@@ -948,6 +955,8 @@ static int vdec_close(struct file *file)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_fh_del(&sess->fh, file);
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
