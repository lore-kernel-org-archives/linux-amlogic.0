Return-Path: <SRS0=EyFj=YI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54529ECE588
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2019 11:33:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 288AD218DE
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2019 11:33:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uRHm1vsH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="G3fnqlIa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 288AD218DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XrrhU5l1udaUPYPFUl//GagZAUNHgXka05SojOsWyBo=; b=uRHm1vsHIs62kE
	2kWswwiWfZfg4zcRxTvoY7rAgwd+vDxmm7GcCKCo2dVPX1jtgYfVRWfJ7WIPyuDy2OEbSYyNOQFgk
	aqoZllfHsBhCCWS/Ez0yWQ9ueUEuPM1YzNo62hCpySKZsLhjFf8baoXfp3RinnKlYMpjAKxBege3E
	ZFdQea0pcaFd+vK4oVidQKeXj7Qkecn1ZDdsOhh7z2jFnEM73+wlQmqYgvveNTQyRe2b1miTNUehK
	2zskI8C6GsXUce2E3LLd/IbvOkJjkBH4FAisLIpQVwHOcGZB+V/U485h4raD2UPxW5cQlTPN6UeTF
	a68ZOJwNlDzwperrN2EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKL5D-0003ty-Hj; Tue, 15 Oct 2019 11:33:43 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKL4r-0003dD-8n
 for linux-amlogic@lists.infradead.org; Tue, 15 Oct 2019 11:33:24 +0000
Received: by mail-wm1-x343.google.com with SMTP id 7so20495011wme.1
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Oct 2019 04:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uCg5k9ZAbrV4GjqeNyvcbYZv8xwqr0DzEBoAapcuUF4=;
 b=G3fnqlIagUgIzXqdwH5ad+9LBWcqrcYgJb30mqH/lJuHES/QADTo7Q79HHx38JFeTw
 iBIq6Rqp2ebm7x8t/kgaoAOp5et70+eGTzJos/0qlpHJndcaijozRSQnJL5Pb5SnNQQU
 76EUgt79m8OWixvlxO89x8wmWLHnZEU5HTqvG3Kx1S6J5F6MtbDiVsqaEh2P25bnBjQo
 1qCm1lmgxaAGgzHHdCzFXDtXxj8y9Fb4mYBGRibzBCvjCSpudY/a0KPWikrkqfo7SO1S
 Nfl6Yz5EX2IvwfF6VL7q8qnMU7bhNWi1lRgDZt45RxD56XeB/EerY8fY66o2NLxJt+pB
 NTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uCg5k9ZAbrV4GjqeNyvcbYZv8xwqr0DzEBoAapcuUF4=;
 b=gwsxhajJ9z61LC23NKEeHvle2gN3fI34sASLegd9DNJniIGe2Sb0NhwspbsewbaOsW
 Wj0DS9oO28xLRspPKtMl6Q0lyUs5fsQ2tIXdq3BvxPJOiTqh/ObWLLCd70SirXhqDdwA
 TMCICdm/kv0/8wP2l2Rs/QDGgjlW+u+fxx/6NW2j177I80OqPw9OxTb9gtcXNrM/8O3V
 f3KjjBRAqZlQ7CmTwQiskXGrcSw/PYZV6xQdeZxXG2DiONlMq2e0kWYFzxl64ilzkw60
 ea2Ptgn++vVmq6Dsnnl/MS12pfthch7fJWKKzKLXUqbsWbJ1G/zwV6a1YouNgFWoipbD
 1Eqg==
X-Gm-Message-State: APjAAAXqsEp9TGY4w8UiehNObeFJABAN2i+p+rlkpyZrvvr70ZXp0VJe
 W1Iw1xlyCzW0pTDZ/zO0X/hsWA==
X-Google-Smtp-Source: APXvYqyIEaSI5PuyJnBq1t2p/C0YZ4qVez2hBxOerZiqkWm523CK/Be1suSrot9c87mv9lo9+TH4/g==
X-Received: by 2002:a7b:c313:: with SMTP id k19mr2446921wmj.6.1571139199425;
 Tue, 15 Oct 2019 04:33:19 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 63sm32395096wri.25.2019.10.15.04.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 04:33:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/meson: implement RDMA for AFBC reset on vsync
Date: Tue, 15 Oct 2019 13:33:14 +0200
Message-Id: <20191015113317.8870-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_043321_459149_5BA35D24 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The VPU embeds a "Register DMA" that can write a sequence of registers
on the VPU AHB bus, either manually or triggered by an internal IRQ
event like VSYNC or a line input counter.

The initial implementation handles a single channel (over 8), triggered
by the VSYNC irq and does not handle the RDMA irq.

The RDMA will be usefull to reset and program the AFBC decoder unit
on each vsync without involving the interrupt handler that can
be masked for a long period of time, producing display glitches.

For this we use the meson_rdma_writel_sync() which adds the register
write tuple (VPU register offset and register value) to the RDMA buffer
and write the value to the HW.

When enabled, the RDMA is enabled to rewritte the same sequence at the
next VSYNC event, until a new buffer is committed to the OSD plane.

The the Amlogic G12A is switched to RDMA, the Amlogic GXM Decoder
doesn't need a reset/reprogram at each vsync.

Neil Armstrong (3):
  drm/meson: add RDMA register bits defines
  drm/meson: add RDMA module driver
  drm/meson: use RDMA to reconfigure AFBC on vsync

 drivers/gpu/drm/meson/Makefile          |   2 +-
 drivers/gpu/drm/meson/meson_crtc.c      |  27 ++----
 drivers/gpu/drm/meson/meson_drv.c       |  14 ++-
 drivers/gpu/drm/meson/meson_drv.h       |   6 ++
 drivers/gpu/drm/meson/meson_osd_afbcd.c | 100 ++++++++++---------
 drivers/gpu/drm/meson/meson_rdma.c      | 123 ++++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_rdma.h      |  20 ++++
 drivers/gpu/drm/meson/meson_registers.h |  48 +++++++++
 8 files changed, 273 insertions(+), 67 deletions(-)
 create mode 100644 drivers/gpu/drm/meson/meson_rdma.c
 create mode 100644 drivers/gpu/drm/meson/meson_rdma.h

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
