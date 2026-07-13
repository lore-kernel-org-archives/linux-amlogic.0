Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FA0C44507
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 12:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jJ5rOQqurDioPEQ9FrHwVqxbtOVhbCIkIOMhHwBEXCQ=; b=PPbl6r7tZV5j2g
	NM6xPWzXTw62WTFC4yL5vkC6vh/ZntgISSA40DQzURb+UYSd5LGZNj68sU6xuDPsOt3JsGxvXtmTO
	ugNprD+eR7J+AhoDExoVAFJlIK5k/gXL8kyI7dyt1bp+n629oL3ugJgJTIU6845vYV5BWizM+MY/r
	vbwzU8Ux7PWfczESQlFDx962swJYlKueV0QSJq7pHj5gyh/Kd8VTBqDEsr4CKC+SM/LYbKikSX03z
	aOr39hCOB+FEyoLNhQXE7ZOu5v+wgNca/a37Kml9cozz/UbQSCqQSqikn9q7yt6uw2fzSmwv4P1Po
	ayoorKJsqjB0Wdmlgr1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFSv-000000097sY-0vc1;
	Mon, 13 Jul 2026 12:08:53 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFSs-000000097rG-46qE
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 12:08:52 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cea3004256so23065995ad.0
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944530; x=1784549330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FR0HREIu+ElJTqYD8DnR97TKZwOpP6adDHM14P7pQGE=;
        b=FWLdRo5hsZyH0MKks5v3PrkGQUb+srCsrIOAC/6vfMjk4bXSmnYhi/PH/8zxBxPGMv
         lI9t/eov3Bg3XGovaPweRcVfIxZ0iSBALJujRyV42bOFF1l5n+6vZuu7+GA3rgRGr9mz
         vTIe/T94ZqHytofGLyfWJpn7m1aqbMK2ypGjUE7Dj7djHAfMrxhxgymaOhi/SsQYP8wV
         lyBOEk6dyUtk/P/OSbg5wc5jfh33ff5FA+GSRD/7sGbDjD7vr3mG11EOtzFd/8TtxSjc
         ZyemRB7BSxg6R1AJLbRirWjhZhiMoFn3NLlgcKKo6u94KGa77F12yRzA9tQGgh3FeUo9
         8zIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944530; x=1784549330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FR0HREIu+ElJTqYD8DnR97TKZwOpP6adDHM14P7pQGE=;
        b=tVl4SKan8g1cuH9FgJDvwFJEqQSBh/DMDwQ8S4viu5NGGsbZwcR0gzdU6SSh6Yo9bp
         1xaaYaVGqW7QiGLfZDRcnmv3cyIXsvsrJ9oruETww9scm94NjB7ledjWfgzzkJx52kdl
         QrMYKDTamz1MuHWxKmDrV9e0uAgVcxgf8Dj6OrO0FTRqja5mqhnwZJbt4pf/2G/PNXPf
         Lg8Qq+aa9t9uY8TduFrUjGC7cYA0o8E2/NIU1pqzrUxWZZoRyva7BfOzTdXS25Lu2ei1
         0oMwxSYWd0k7NOu4IRLq1+5HyqCfbx9bIFLBNsCdPF+tFzKxo2anvisi+2PNXIhNLA95
         fkhw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6c6xRrZunFqUHc/HjFZwEz3mGZAX33ljRB2xxvmo4xAAC2c/eribBOfX4zYjQ+69aC5WdxdwM/U+WaNi8@lists.infradead.org
X-Gm-Message-State: AOJu0YxXoMWRC3NyR83R+0hzWGLrBfLSlpAhtxqA4XbTqAtvB5klnE8v
	Aud5etx0MDmDueZFI769yZ4ge+3gweB/cFeDmUxVpxRmUPcFl7N/P3wz
X-Gm-Gg: AfdE7ckiXi861flhLxJiD5Gb1RVyCQA2MBTol3YncZ+ux4aXpY0n3eMlcbYQ+L9mnbl
	8EqsRFK8Mw6BmCBTFkxlwmDTPpS0UNf8pi4x7HH5bMIT7KKDQeVuXY8a3qqM5dLr9svOY7HqJKN
	1EChHZDI0lADwJZRP9SmdfMM5FjoJKSZcQTNLi2WRD24OKidPQ3GGZy8Wp+QgsV2JpETTzpc/vK
	lTkbaFbSoYLnChW3DV28GPU6kdFztWYkzNa8if/DhDHikmQSDUk3MhQ3eHWMpbYO+H1E1Aq37s1
	NrshiL8R5dbflYpJ7izC3w2N6WPmuygYhrnzu0y9WfkQEcmTf4PJsedP2mr7vBUT5SCL9k21AKz
	PR8IxE7tUf3w82AFK1mk587bZunTpRz/dFte0mO7oPiagcCZW3s5sX/Y+L34176VC5SXdrLQjtC
	5n5mRGb8JZt/RVk/L0vMSpHG0OeQBPW9o=
X-Received: by 2002:a17:90a:d64c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-38dc7296c33mr7622430a91.0.1783944529816;
        Mon, 13 Jul 2026 05:08:49 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:08:49 -0700 (PDT)
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
Subject: [PATCH v7 00/19] media: meson: vdec: Fix lifecycles, race conditions, and stability bugs
Date: Mon, 13 Jul 2026 17:36:55 +0530
Message-ID: <20260713120840.17427-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_050851_025364_5A3A187C 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: Doruk Tan Ozturk <doruk@0sec.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch series addresses a collection of critical race conditions,
memory leaks, use-after-free bugs, and resource management issues
within the Amlogic Meson video decoder (meson-vdec) driver and
associated components.

The primary focus is tightening session lifecycles, safely synchronising
the V4L2 m2m framework callbacks, hardening work queue operations
(esparser_queue_work), and correcting buffer validations to prevent
stability issues like KASAN out-of-bounds errors or stream-on timeouts.

Summary of Changes:
* Race Conditions & Synchronisation: Fixes multi-threading and
  execution races across stream-on, stream-off, job abort, and
  teardown pathways.
* Memory Lifecycle: Eliminates memory leaks and use-after-free
  vulnerabilities by safely pinning, canceling, and sequencing
  device removals.
* VP9 & Buffer Hardening: Addresses payload handling bugs in the ES
  parser, properly tracks ongoing buffers via atomic counters, and
  prevents invalid memory writes.
* Platform/DMA Adjustments: Adjusts DMA segment configurations,
  canvas handling, and buffer sizes to match modern hardware demands.

Note on an outstanding issue:
An execution deadlock occurs in the driver workqueue path during high
stress or long playback sessions. This stall is triggered when the
Amlogic hardware internal video FIFO buffer becomes completely full.
When esparser_queue_all_src runs, the capacity validation check is
tripped due to a design limitation in how buffer exhaustion is handled.
This blocks progress and leaves the workqueue worker waiting indefinitely
on a core mutex lock.

The resulting hung task call trace shows the worker thread blocking
on the internal lock:

Workqueue: events esparser_queue_all_src [meson_vdec]
...
__mutex_lock
mutex_lock_nested
esparser_queue_all_src

I have tried to address this issue, but the underlying deadlock persists
under extreme conditions.

Any feedback on this new appock is welcome.

Testing was done using v4l2-compliance and active decoding pipelines
on Meson platforms (like Hardkernel ODROID-N2+ and ODROID-C4) SBCs.

The v4l2-compliance tests passed successfully via:
$ v4l2-compliance -s -v -d /dev/video0

Pipelines were validated using the following GStreamer script.

[1] https://gist.github.com/moonlinux/08295ba1f17ce7155550773f2d2cb6e5

Previous changes:
v6: https://lore.kernel.org/all/20260530094326.11892-2-linux.amoon@gmail.com/

Thanks
-Annad

Anand Moon (19):
  media: meson: vdec: Fix m2m device lifetime and cleanup path
  media: meson: vdec: Fix STREAMON / STREAMOFF race conditions and
    session teardown
  media: meson: vdec: Fix lifecycle leaks and race conditions in
    recycle_thread
  media: meson: vdec: Fix use-after-free race between teardown and ISR
    routines
  media: meson: vdec: Fix race condition and synchronize esparser IRQ
  media: meson: vdec: Fix race condition by canceling work sync
  media: meson: vdec: Refactor esparser work queue and fix teardown race
  media: meson: vdec: Fix concurrent execution races and unsafe teardown
  media: meson: vdec: Fix vp9 header update failure on invalid payloads
  media: meson: vdec: Fix race conditions and leaks in esparser pipeline
  media: meson: vdec: Update core m2m stream state during transitions
  media: meson: vdec: Coordinate m2m task execution inside async loop
  media: meson: vdec: Fix race conditions in job abort sequence
  media: meson: vdec: Correct atomic counter placement in dst_buf_done
  media: meson: vdec: Fix concurrent firmware loading race and hardware
    timeout
  media: meson: vdec: Configure DMA mask and segment size in probe
  media: meson: canvas: Fix Use-After-Free by linking canvas provider
    device
  media: meson: vdec: Increase VIFIFO buffer size to 32 MiB
  gpu: drm: meson: Fix DMA segment size limits and maximize allocation
    boundaries

 drivers/gpu/drm/meson/meson_drv.c             |   6 +
 drivers/soc/amlogic/meson-canvas.c            |  14 +-
 drivers/staging/media/meson/vdec/esparser.c   | 127 +++++--
 drivers/staging/media/meson/vdec/vdec.c       | 320 ++++++++++++++----
 drivers/staging/media/meson/vdec/vdec.h       |   8 +-
 drivers/staging/media/meson/vdec/vdec_1.c     |  16 +-
 .../staging/media/meson/vdec/vdec_helpers.c   |   3 +
 7 files changed, 388 insertions(+), 106 deletions(-)


base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
