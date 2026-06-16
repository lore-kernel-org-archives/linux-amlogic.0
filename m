Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F41ECD98D2
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jun 2026 07:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b0O5ePuAEflp9Nq5WNHqdSzzxWEvkqdf6vscKAL1cuE=; b=KK+ww0WBUWw/c5
	YrUbLDx/78CWwq/I1pt61gPxv+n502sdnoAaA6IvMgoUQOU4B6lgF7CZdx6pH6Sjro7LZwuYUMUhk
	QZfBt+HoDMv4erf57U9OVSrWDtqHpEgNptvoJ3giETigDPf/c90as3/Re9ADkQgjinnHn0FMeUsfA
	AcMx3bnECCYkShaNeH6QGjmIpbd4zceeHcmClagoivyd9b9riwP3ABPeX33fPJ8+fhmZi9q5l/Lwn
	xUJGcKa9vp054NlP19B+I6yzp+pUbIxh75qfi0PhZIafljW2s6YztO5BJeufqARPso/4hKffLkOxQ
	URKJfjGW5TTOgqyyN6JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOYa-0000000FORY-0lEo;
	Tue, 16 Jun 2026 07:50:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOYX-0000000FOQa-1sCR
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Jun 2026 07:49:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490b64c8311so41932245e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 16 Jun 2026 00:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1781596195; x=1782200995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fw23X1FwjGe46vUwZBuX/t+y72XuixGwM1Rny5Zyri0=;
        b=VzKqc4Xf2468p0NKT7X/o/dU385YHTkp1uUQuPv382/z6AViGxBmebTyyQH7WxzWIx
         eMKk0nVsSvmMf28vpREe3HZWtItASYs8503Q9pIVdn7GHkTJbeaofNa+8lEHAPjgo7Kb
         mqaexf9nuN+TDv8Wl/dlY/UHfsvEpYQq4eW8nzp0Dt3TPDbw75ygL5R691oCzV2bRh7q
         RYfSLATLyNzM8U2HLdNba+zDOjkvSq1NTHoWQtoj9vozHWJjopEli4yhHe0ACthsORax
         5g0deTUXkCyjx9n7KTAz/IVdT9AFOS+mrr7/+ElJeIoI9bDT4leqQOWtButClnZL6+dX
         GibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781596195; x=1782200995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw23X1FwjGe46vUwZBuX/t+y72XuixGwM1Rny5Zyri0=;
        b=SB0ecJQu0ppG3rIU5942jO/0qpRgRVkG+jnUJUI6WXztTyz+D/cZZBmr89O/36wZyJ
         dGmnL2rEtopqQAOj1DnPydmA7XfPrVpYzsmmBvW2/a9eixmyvCSIZ8/viVAh4wZkMdf6
         leWu3W+Kbb1V6Nraggl5XuuVmIGcZABjw35oCv3eQLntQnufRavu0gNaJ7FvmsJqzSDU
         LpQokXktuH4Uxcn5Ws5tp3yomvJpmpPiOSeUFlazSO4ByTp7wyaXrE32bWK8tX87TuGB
         sOa63vZuR9/UExSzfBRzIY9Tb2e2LtZtPh63S3e5Ekyp5ChfNBxMLUPKy1hWnFc13pc3
         7VoQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Yii8Yod5CImuuNqnD1CYAzSLtuQuvQyYi8RpsBXb+2Pq7574B8jYRMx0AWXQdcQW8vRDmxSMkAeA0Iktc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh8MBWHu8JoUHQoEXvKXX/2VtWLMntmyBYCqySd47zY7CizD5M
	88bJa4g+sH143yyrVoZ0GdjxF7lDFB6yEadX/WPzf8R5luxPdKzjtE2T07WLlrJewcvl
X-Gm-Gg: Acq92OF4g8khVaSh+CddQ2TtdMdRUOS37tpAv+NiGwL8dMPL2fwQfBvzgEwEjHoRAva
	fwdVbVfX+MPIS6zoywdAghkomVt0uicdL5iv50JN/R7T3ZUKH2CoV3lBZ58kKKOtHXhGTarRzqx
	NLuM/eNueCEc8kcxHZAoI8MpUzX4WapwFfd7YixeN6L5G6A9QPZ1JTn49D/ByM8Xi2uWY4O4sI6
	Z8CUQ1m5QSkIzOrbOI4xGON9Z7B4ryGuwT4Zzeg2K4MlDrwkBmD42p2HHSvvk94uMll5613xyWM
	p/OkwWmYe6AvRJaHyLENGN4WYz3qnAwGa5SIfiXwSGk99kLZSV8aFrhdlMIlp8ckHMm6hs0IS3k
	AtlMSCxdhzliiS+lKsPEyPd93W1nCP6aeSrSHNIa+dft/m/8LiKDT3IgCYBbpuqcNnlqtXwnwbA
	vx71LM9Vu8sDwst6iMzVOtnN8ODp7kYpsIHbBT4hrZOxpbm9GNMpenyJ1Jc2haAYU6IYwbbRfQP
	erCE4fwCmZ3F2Qj912OxGMj0wlMo0muDmaYTihwvvfG7zf0zkEYUNJP
X-Received: by 2002:a05:600c:6286:b0:490:b355:9c70 with SMTP id 5b1f17b1804b1-4922ff93b2cmr36681535e9.11.1781596194984;
        Tue, 16 Jun 2026 00:49:54 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm44475179f8f.0.2026.06.16.00.49.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 00:49:54 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: neil.armstrong@linaro.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: meson: vdec: fix use-after-free of decode work in stop/close path
Date: Tue, 16 Jun 2026 09:49:52 +0200
Message-ID: <20260616074952.93076-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_004957_544999_B19022DC 
X-CRM114-Status: GOOD (  17.62  )
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

The ESPARSER worker (esparser_queue_all_src(), scheduled via
sess->esparser_queue_work) dereferences sess->m2m_ctx and accesses the
ESPARSER/DOS registers. On the stop_streaming()/release() paths the
buffers and, on close, the m2m context are torn down while this worker
may still be pending or running, leading to a use-after-free of the
freed session state.

vdec_poweroff() previously only called vdec_ops->stop() and disabled the
clocks; it never synchronized against the worker. Two problems follow:

  - The decode (VDEC) interrupt is threaded
    (devm_request_threaded_irq(.., vdec_isr, vdec_threaded_isr, ..)) and
    its threaded handler re-arms the worker through amvdec_dst_buf_done()
    -> schedule_work(&sess->esparser_queue_work). A handler that is still
    in flight can therefore queue the worker again after teardown has
    begun.

  - The worker touches ESPARSER/DOS registers, so it must not run after
    the clocks have been disabled.

Quiesce everything in vdec_poweroff(), in order, before disabling the
clocks: vdec_ops->stop() masks the VDEC interrupt in hardware so no new
IRQ can be raised; synchronize_irq() on the VDEC line then drains any
threaded handler still in flight (the only context that re-arms the
worker); cancel_work_sync() finally cancels/waits for the worker. After
this nothing can re-arm the work, and the worker can no longer run with
clocks disabled or against a freed m2m context.

Only the VDEC interrupt is synchronized: the ESPARSER interrupt handler
(esparser_isr()) only acknowledges the start-code-found status and wakes
the internal wait queue used by esparser_write_data(); it never touches
the session or schedules the worker, so it cannot re-arm it.

stop_streaming()/release() run under the video device lock, not under
sess->lock (the mutex the worker takes), so cancel_work_sync() here
cannot deadlock against the worker.

The VDEC IRQ number is now stored in struct amvdec_core so it is
available to synchronize_irq() at teardown.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Cc: stable@vger.kernel.org
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v2: also synchronize_irq() before cancelling the work, so a delayed
    threaded IRQ cannot re-arm it after cancel_work_sync() (raised by
    automated review). Only the VDEC IRQ is synchronized, as the
    ESPARSER IRQ handler does not touch the session or schedule the work.
v1: https://lore.kernel.org/linux-media/20260615140529.52653-1-doruk@0sec.ai/

 drivers/staging/media/meson/vdec/vdec.c | 21 +++++++++++++++++++++
 drivers/staging/media/meson/vdec/vdec.h |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..5304987546fa 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -123,6 +123,25 @@ static void vdec_poweroff(struct amvdec_session *sess)
 		codec_ops->drain(sess);
 
 	vdec_ops->stop(sess);
+
+	/*
+	 * vdec_ops->stop() masks the VDEC interrupt at the hardware level, so
+	 * no new IRQ can be raised past this point. The threaded ISR re-arms
+	 * the ESPARSER worker via amvdec_dst_buf_done() (schedule_work()), so
+	 * drain any in-flight handler before cancelling the worker, otherwise
+	 * a late threaded IRQ could schedule it again after the cancel.
+	 *
+	 * The worker dereferences sess->m2m_ctx and touches the ESPARSER/DOS
+	 * registers, so it must be cancelled while m2m_ctx is still valid and
+	 * the clocks are still enabled, i.e. before the clk_disable below.
+	 *
+	 * This runs from the stop_streaming()/release() paths, which are
+	 * serialized by the video device lock, not by sess->lock (the lock the
+	 * worker takes), so cancel_work_sync() cannot deadlock here.
+	 */
+	synchronize_irq(sess->core->vdec_irq);
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	clk_disable_unprepare(sess->core->dos_clk);
 	clk_disable_unprepare(sess->core->dos_parser_clk);
 }
@@ -1053,6 +1072,8 @@ static int vdec_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	core->vdec_irq = irq;
+
 	ret = esparser_init(pdev, core);
 	if (ret)
 		return ret;
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index 7a5d8e871d70..9a50116a2665 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -66,6 +66,8 @@ struct amvdec_session;
  * @v4l2_dev: v4l2 device
  * @cur_sess: current decoding session
  * @lock: video device lock
+ * @vdec_irq: IRQ line of the VDEC, used to synchronize the threaded ISR
+ *	      against teardown
  */
 struct amvdec_core {
 	void __iomem *dos_base;
@@ -91,6 +93,7 @@ struct amvdec_core {
 
 	struct amvdec_session *cur_sess;
 	struct mutex lock;
+	int vdec_irq;
 };
 
 /**
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
