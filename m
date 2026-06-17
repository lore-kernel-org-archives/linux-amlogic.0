Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FA8CD98E2
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2026 07:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dtfQFqb2uUNG+DT9NsTKpROX7cYYZmDS+aHalbcWlew=; b=SECvNEQrtlo63L
	OLBaL6tGcgE0htD9OysydUpRyl1lWLS6NzNMZ05R/MrXCzEQE7HE/Gff5lPAnCrysMObT96bCgr0l
	w4/7wVJbI4beHFLD1FojJP7hPgLwRHJ0uCKM/6shkNDXbZ65YMm5xnIWMwp2HsWipa/UxoyBeqCfd
	ROIzQTbP/JrjJayJ92mMjNn+0+ohpGxknIKdKHqtoHoNioRk1rJIeJGV8UgakLdsrrcMbjfosYu47
	sJXEGr27XAFLVsC28Q2FLHmAE2kYnJOEIKgTphX75F+Gy9sAnMS+Na5sRZILQVbV15UGNeBJk4wY1
	e1+fBN+7F6ET+8q1Rprw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZktv-0000000Gq2I-0mFv;
	Wed, 17 Jun 2026 07:41:31 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkts-0000000Gq1c-3FSZ
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Jun 2026 07:41:29 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45ef29c5561so2916689f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Jun 2026 00:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1781682086; x=1782286886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTKHX6NCn7vn/+gvhr4Pc1ts3vNTjwaHvcnrlwVBhzs=;
        b=WPAwDyKj+i0O3Zt+7lzhpH+oMizxO94WTA1T6CuOJK83TC6UcJAG/FGyVvRcZg0040
         Cz4cPDKre4oC+NuYUmYrZw2cfQypHMnJGQ6WdBH9GhEOfn3OS5fn35PPnMA/f+d3M8Nt
         EubiIqz8cVK3LxreZvN8hZJ1HChMRZwb5m1HzrNuThobfC30qB2YdaWqoZaj8LGHVgGx
         bSoaaCzNwW1mUjeIW8lE5QbhcjS24VfQDztSKEJNAdCoey78D0yQyMX/jbx/U9oYu0pb
         HGwnC2uUFnga7HNqENgavPksKP784uokAjwhYctkFxQvZnBTymBQfKvPF2dwWnRTaMK+
         pCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682086; x=1782286886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JTKHX6NCn7vn/+gvhr4Pc1ts3vNTjwaHvcnrlwVBhzs=;
        b=Be8ohTBGPyZCxnq4VcvynMqRfmGnsIxR//Qq58mtDySjpT95lY1RtXMFH+bqDhtSGC
         glE0Ht0Syva1JVpZL2rZaD6Q8ks0xYdDlHZGfSW39cy9NGR1LL8F3TVFuf284ac3B3vH
         +vqjQ3Ku1LXlTenf3pPX23CfFfcoWVVUOnvZayLFiIv7qrhtdlDHrq/pT1x4uTczmqDI
         2IHjVOZKY9f32jCoZNfL1Ztk1awedP+RnPvHxCLhAUXqyhaJ1cPp02aMqRdeSJUz2RDp
         oG9AS0AGDWYMwy5PDmq5s3lwbr3fXfgRW7gzuiBgcrXmjngqF1j55mJ0FAS21Hfzr/DF
         RShA==
X-Forwarded-Encrypted: i=1; AFNElJ+n+Jwaq52tH/yDHvijW75PwMCiBnO2WrLOe3UFLA+HRjoThE8OETFmnEAL1uwI514BHsfgB+yes0YeNGAy@lists.infradead.org
X-Gm-Message-State: AOJu0YxWALYvoj7XjdjfmlPTAwIjvVpUyrCd/Nmka+DawSKJPpmtlAvw
	iiyPoyyJJ23Eb1u8cLkLNfvtyysm3MM1urfhYpWzEMFr+4+5vJh0Z0mZ6rio3nViUeRV
X-Gm-Gg: AfdE7cml2OYmPr1gPHtpi5mZdZaV0B1/iJfMtWhlpC75Pb6JwmpRRSkAqQ8HdpqJolu
	POn24bT1Y0egZaBYG3hqvg3u95LAr09xIqU1gjVLcp2lxB2c+oD2N3Nt1efB0+i1xLIOkXpZvVi
	/8BSseUKvme9XEKcnO7cUJGGjzUx89LAOG1D0HXUZsm47vdThzehnvTojPfKbwsGALUuvIPdxX+
	ZxyMvDHo+QYqL5wF/iVk5fNdROfMN/HR/1+5/dRC2uwKyHDB/lCLlhxlg3y8n+jI9iZnGioBqH8
	x3cqdH26kq+Rm3jKx5ENBjsudGhYG7juxr/eV4V6StFINjzCeTQNc7N+RZIqSxHhDLyNbs0EPgS
	9Bft0EKxQpD/40JGtx96J4uOceXfz5L6Qet+3XTAbZwNWbu4qr+P//KnSbugm9BzjLgc+qQO8R5
	Zqs3n1StUswFFwH5/eMEBkhkVDLlI+JXaspLd5Ioa8WPNnMiPuXv3AviWppmNRcsRtJNOWlpGhz
	UGOd6850JgtRsrEpRzZgCex2QnlM1u39zw=
X-Received: by 2002:a5d:6a87:0:b0:460:25f3:b25a with SMTP id ffacd0b85a97d-46238f980ccmr3573765f8f.34.1781682085876;
        Wed, 17 Jun 2026 00:41:25 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm52677098f8f.1.2026.06.17.00.41.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 00:41:24 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: neil.armstrong@linaro.org
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	hverkuil@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: Re: [PATCH v2] media: meson: vdec: fix use-after-free of decode work in stop/close path
Date: Wed, 17 Jun 2026 09:41:23 +0200
Message-ID: <20260617074123.32464-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616074952.93076-1-doruk@0sec.ai>
References: <20260616074952.93076-1-doruk@0sec.ai>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_004128_840357_65E84C57 
X-CRM114-Status: UNSURE (   6.92  )
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

Please drop v1 and v2 -- both are wrong, and the sashiko review was right
about the deadlock.

The underlying bug is real: vdec_close() does kfree(sess) (and
v4l2_m2m_ctx_release() frees sess->m2m_ctx) without cancelling
sess->esparser_queue_work, whose worker dereferences sess->lock and
sess->m2m_ctx -> UAF if it is pending/running at teardown.

But cancelling on the streamoff/poweroff path can't work:

1) Deadlock. The worker takes sess->lock. For an m2m fh the ioctl core
   takes m2m_ctx->q_lock (== sess->lock) for VIDIOC_STREAMOFF and holds it
   across the handler, so vdec_stop_streaming() -> vdec_poweroff() already
   runs under sess->lock; cancel_work_sync() there waits on a worker blocked
   on that same lock.

2) Use-after-power-down. v2 also cancelled after vdec_ops->stop(), which
   power-gates VDEC1 (__vdec_1_stop()), while the worker still reads a VDEC1
   register (vdec_1_vififo_level() -> VLD_MEM_VIFIFO_LEVEL).

The only deadlock-free point I see is vdec_close() (the ->release fop, not
under sess->lock), cancelling before v4l2_m2m_ctx_release() -- but that
still leaves the threaded VDEC ISR (amvdec_dst_buf_done() ->
schedule_work()) able to re-arm the worker, and there are adjacent teardown
issues (esparser_isr() vs the dos_parser_clk disable;
vdec_decoder_cmd()/esparser_queue_eos() without sess->lock).

I don't have Meson hardware to validate a corrected fix. Is a
vdec_close()-only cancel (plus quiescing the VDEC IRQ outside sess->lock)
the direction you'd want, or would you rather take it given the HW testing
and the surrounding teardown concerns?

Doruk

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
