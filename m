Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11E6CD343F
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 May 2026 07:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RVFIcaYVUPKKbBJlS3n1Ty9/f1/FvoQ9fqL1IfRNf4E=; b=R2Omvx+5pbjWGV
	8s8paD4zBFnclyaZPMIBLunbp5MXeYwVsWFCJ+5YSVr14Bed8FOWpij4Rll8DV+uvpKqwA740+Awv
	DM4gudEnF7w2/1t0Ti/XyXvwwGfnGfLjeyzEV0nKWDC2lg1BezTq3Jvyquviu/FVnu+33cHd2I6qs
	XDwUTL2sQd8SEkHVHGmugc5Wl3XpHuCMB63dVimTaL3YzgY39FO4z1/w374s6ivAPCyAHBrE1huq9
	8LR2D2A8Lwk7jHuuZPkOxz2uwUv/lKr29iPuPPMQGWVbZMIbO4PEEQDGxiXVBnOqv97OKeJ3ElNFu
	A11nWbxu9SzJGgAeDkcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxvu-00000006yW1-0OCT;
	Thu, 21 May 2026 07:35:06 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxvq-00000006yVF-48Av
	for linux-amlogic@lists.infradead.org;
	Thu, 21 May 2026 07:35:04 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-36608b2f2dcso3573958a91.2
        for <linux-amlogic@lists.infradead.org>; Thu, 21 May 2026 00:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779348901; x=1779953701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Nv3O98MdUPD4zHhAIH8Dw2e6iXe5AcQ+j+PSSnnErM=;
        b=YARh+ZuZfypRV4LZSsTFU174GCbiIOdfw5zD/ye1AbH4gsD1FKiV+nCggXpSPMuT4F
         Cpu8h+i93vykKzVrqz8m4aFsvlunsGszngzncmODEO1FhHCgjilAz7eDb+aaerI7N+iT
         0tc6z4qxaHggEucMr4iusBZGev3bq0RI1X9v9BlQmM14gLMPhjFnqjzce2kSpAIWUgIO
         PGo3CdWVuRXalQYdZ51hlUApfOpejhMxEuCGtKuYZus55u4aVn10mDCOJi8qdVUILVdq
         zV21JCrRaGYEtHMYT5zv5hCfV/XfLvaYmwusU/w+Xa8TbSY7GDwCIotzb2ez/u2HRgdm
         d4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348901; x=1779953701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Nv3O98MdUPD4zHhAIH8Dw2e6iXe5AcQ+j+PSSnnErM=;
        b=Tx3g/PNK5wLJDslVLJqhJcMwx8zOAScpyWp+dnWSvwF7iK3rF55sP9QKvku3wIAAzP
         VPq0GfZf4UN9DEDS564jDVEKjzc4Qk4fK4f6HSbEe0vSvEr/cXiSxRkhol6Eamt2j3Ff
         zBfI9SgRcFzDwYD5ngdZBDaA+eaYvjBXZICQK0lU09s9UjOFu/IcTMoCX/RcaV3/IMGV
         i+JDzAx4NqSc/58VIhL/9Aex87BD8+XpM6Cq8a1N6VHxb3MiwLYxwlnKpfXrveTY5lMg
         8FMclgkCxL6Sr9nh/jpRJ7i+xSmatcrNV/42WIv83fONNP+3q2QxvdQglTJS+UKOFn6t
         HxJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KjXgaevmZhlHtrSNqpW2LOyqiLm6iC52G9BERHA0rKVnf/b3fpWc8/5wOtpYmApyDvkGUmbghVxykfpT8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5+MsCaRn+gmsKAOS8vW2GYRF0xABWq6ac5LRG+o0tlzUpD+kR
	HmmSSpQwoq+ESxDZ540yS4KEMeLmfvyp3rxAJBiLvBOZ9p74HpIDjVP5
X-Gm-Gg: Acq92OHjmsbq5wizxrPQuxUb+mc39ZMK2ESyKeSRkviA1YIgtKhj1U/pfJ9pH8lw2nC
	d121N7b+fHSls1WzGJk3zIGVWTMjfis0h0bF1uMsDcES4yQR7YUyaKluPbfjQnkLBu9ZYxb0u6i
	+xU05Lry9FMKUp3MukxDx1L/P4OlcfHVMOaWAjjObJeRp3cJnp9ukWpeQHMbPxsDy5s8UBb4/TR
	aOnZaaDdSkzFIFC8FBBd+3aNN5meH50Srm8RW3K6ytVhdh1jB50gqTDCqWRIrpLI50s9/ncGw8w
	Un9E5perBTqUL5B33ZiI0L76GiF1l3q/va9yd2frjjDuf5s8OFbtTYKN0RMvuOwGjnEGwGmCOr+
	T4S1RVTdalBE2GdOSGLzxCf3q1VTOdNLkDaUXu0VsF7B5O+1M78vcm6PUfL9wFoN9MhhHKe/Y+d
	y0Y91RnxVVE0IL5lfTUdck
X-Received: by 2002:a17:90b:57ce:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-36a44f18393mr1788402a91.3.1779348901391;
        Thu, 21 May 2026 00:35:01 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a45c5decesm783833a91.1.2026.05.21.00.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:35:00 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 0/3] media: meson: Fix memory leak in error path in
Date: Thu, 21 May 2026 13:04:10 +0530
Message-ID: <20260521073449.10057-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_003503_016908_421E071A 
X-CRM114-Status: GOOD (  11.46  )
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
Cc: Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Following chamges try to fix the memory leak reported by Sashiko 

Pre-existing issues:
- [Critical] The `sess->esparser_queue_work` work item is not canceled
   before freeing the session context, leading to a potential Use-After-Free 
   vulnerability.
- [High] The patch attempts to fix a memory leak reported by kmemleak,
    but misdiagnoses the root cause and leaves the primary memory leak 
    (the V4L2 control handler) unresolved.
- [High] The driver does not verify if `kthread_run()` returns an `ERR_PTR`,
     leading to a kernel panic when `kthread_stop()` is called.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t

Thanks
-Anand

Anand Moon (3):
  media: meson: vdec: Fix memory leak in error path of vdec_open
  media: meson: vdec: Add error handling for recycle thread creation
  media: meson: vdec: Cancel esparser work in error and stop paths

 drivers/staging/media/meson/vdec/vdec.c | 27 +++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)


base-commit: 8bc67e4db64aa72732c474b44ea8622062c903f0
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
