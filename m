Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0356CD6E4A
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 May 2026 09:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T84zJq0dQFijcmEWdqsWTL8v/NAdzsSNv6LcADbKJao=; b=0q9n72p4kU820c
	BQJl4ga75TvBs9YRNbbgt0hzY9+EVkFnkkhb5w/yG6vNnO8t41jwwKSbWt+G6VzYks5/MVusvAswZ
	W2eXtjk7jMZcNw1v/7l9GHxpdmvOis/I5k/838OCMwV9y1XjxdMkx3M8LfM9GTb5yecoM5acmFEcf
	QaHQWussIXhLw/YVZwa4Gf3xwU7CoAruOLYJ4CXITuWdcM7LvaAZMpcjb8geGW9pxoSqm5axzEHP3
	x1cN9CGSI7eXUctfWln2+nJNPL/RWfYtDzsq3ZczrPe1R4hceo+/ajJNoe2vlPnwnWIq6rgaJB8fr
	eWNWN13ysvqVgtQHhXGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGEH-00000008aPV-0hfg;
	Sat, 30 May 2026 09:43:41 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGEE-00000008aOb-13DZ
	for linux-amlogic@lists.infradead.org;
	Sat, 30 May 2026 09:43:40 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2bf3781ca51so5982895ad.0
        for <linux-amlogic@lists.infradead.org>; Sat, 30 May 2026 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134216; x=1780739016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZTtXuk8VMOe/R1MOW9+2Ia+hoeCMO0OxOU+XGlScXw=;
        b=ID5bEGdUkmgsrcsBw8XdkdS7fvucVNl64SVMq0bDm0Yg9xd+KOPPLc7yfbKXIpbdhk
         Rs4je6pgbwoFLLdRLWneWKBKxQFIGio4z9ZtNMijT9b4bWpfzRebT7w56zjIVqJ1Z+j1
         65nhwHRvknKgKUy5Z3anHHTOczPMu1o1F1ogJA82U77TH+tMZWdELaEdFqr7DG/jct73
         zg7g2zNt/m9QhDP60cUNEHN2i0zwe2nv5I/VK3ZoWaGp+6kwXyLPbeFJFqSo8J+b1xdR
         YLrf1iB31aMzy6xQ+bXoSj/ZnWh1UeNlTmxO1O/tRhHl23w1s6wkhX/wLvkzvwQTNX01
         aDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134216; x=1780739016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZTtXuk8VMOe/R1MOW9+2Ia+hoeCMO0OxOU+XGlScXw=;
        b=frVDxGt831ZxzzXPMc2jrkhLVkISX2Z9ALhE+qwdcJL513m6klWd0nEDHIMLTKSxL7
         oE2mpTnClVfLbwZmNd8qRTXvdXt/xiUfTgMrzzaVzMkcasM4chcgEwLUWVh1yRPTVbQM
         RUDC+/B+AuWJxPPB/9WJDvFGtAmVjVykvCxkyMjk/Y1/siYK4kCEKGW8FIWLY5rP5roh
         OUVxGjksSvtzj5GguM+wvcqBzMho1nZZyhTUvajMt6m8J2FJqLRdDHsvCA3Jf1b0Fyci
         +pRKt4XwW9Li6Avt0l5pBlH/jMBFYa+GH9YADmCeikkfhQ7PStDqIDFgWWiBJkDYiGIn
         /9hQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FdI4AicZuEpVf9iuDCQNs/QNU+rp+5SJEUHINKsMTHeu9uNNxfXzYAQRuPDmUoFqm5NXgjeEJGuUIa35m@lists.infradead.org
X-Gm-Message-State: AOJu0Ywztk3YN4yyAfn3rO+OR4kmaQO3EXh1xFBpSdvHxhfFVp2WzmgK
	4RYFZKDF5e44Man2t9vO/hiqTUJsiwuSuKpgzDGsp2AUU4zDaHpyRX77
X-Gm-Gg: Acq92OGkV7Sq9HeVhQrByVZLXgXumyqaRlFIpN6mipByP/MnHZZSgiTZqFrcusHr4+T
	VkCvgguvgpqzk19zOEdmoHTSZZNHIDvo+BWUNvdhvNc3TYbsof872e9K4fXSoCJ5vUnF58sAKrF
	GIS0Cju0cdV8ubAgUGHH3omrRv0Drllu0noaggp4ETAyOIAewxfpGebcGCE9YitMyhUxZeaNaIE
	7nvSAxGjvI02I2e3yTGe+eQXZLrf6IsnOv4yEXT+ElfxycyJltn4ruMHW/8LUF5U101u+JmWZUh
	2ERglnLfRTcYlV+0hoBgFM/EsLJf/tMMx1bMfSt+7PmpvsaSnxhqsDNFdnmjLmO4pzDm5CFV1WQ
	n7c2FDxZ45Nb637jwwGEUH5SzuiNdJyzo7649tAYZ9sa4LO9zeKMcW/c8lKqVppp0c8r/3iT2Hh
	hRG80ZR3nydGeHsgEK1aVYD0OODbOmyzM=
X-Received: by 2002:a17:903:46c4:b0:2c0:ab92:584c with SMTP id d9443c01a7336-2c0ab926140mr12404095ad.25.1780134216487;
        Sat, 30 May 2026 02:43:36 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:43:35 -0700 (PDT)
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
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v6 0/8] media: meson: Fix memory leak in error path in vdec
Date: Sat, 30 May 2026 15:12:46 +0530
Message-ID: <20260530094326.11892-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_024338_290920_0F9E982A 
X-CRM114-Status: GOOD (  15.31  )
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

v6: Changes

The previous approach had some technical issues, so this new version
takes a slightly different approach, I have fixed the DMA warnings
found during basic testing.

I have donse basic testing on the Odroid N2+ and found that
the clocks are not enabling for decoder.

It also seems some Mali GPU configurations are still missing.

You can reproduce the test case using:

mpv --hwdec=v4l2m2m Big_Buck_Bunny_1080_10s_30MB.mp4

Please let me know your feedback so we can discuss and address these
points!

Thanks
-Anand 

V5: Changes

[v5] https://lore.kernel.org/all/20260525095216.12078-2-linux.amoon@gmail.com/
 
Following chamges try to fix the memory leak reported by Sashiko

New issues:
- [High] The newly added error path in `vdec_start_streaming()` leaks
  `sess->priv` when `kthread_run()` fails.

Pre-existing issues:
- [Critical] Race condition between hardware power-on and `core->cur_sess`
   initialization leads to a NULL pointer dereference in the IRQ handler.
- [High] Returning buffers for both source and destination queues upon
    single-queue failure orphans active queue buffers.
- [High] Concurrent sessions can bypass the hardware exclusivity check,
  leading to simultaneous hardware programming.
--

V4: Changes:

v4: https://lore.kernel.org/all/20260521073449.10057-2-linux.amoon@gmail.com/

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

Thanks
-Anand

Anand Moon (8):
  media: meson: vdec: Fix memory leaks and lifetime of m2m device
  media: meson: vdec: Fix concurrent STREAMON / STREAMOFF race
    conditions
  media: meson: vdec: Handle kthread failure and free codec state
  media: meson: vdec: Condition buffer flushing on queue type in
    start_streaming
  media: meson: vdec: Cancel esparser work during teardown
  media: meson: vdec: Configure DMA mask and segment size in probe
  media: meson: vdec: Fix NULL pointer dereference in ISR handlers
  gpu: drm: meson: Fix DMA max segment size for DMABUF imports

 drivers/gpu/drm/meson/meson_drv.c       |   2 +
 drivers/staging/media/meson/vdec/vdec.c | 179 +++++++++++++++++-------
 drivers/staging/media/meson/vdec/vdec.h |   4 +-
 3 files changed, 136 insertions(+), 49 deletions(-)


base-commit: f5e5d3509bffb95c6648eb9795f7f236852ae62d
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
