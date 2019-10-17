Return-Path: <SRS0=5tHY=YK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AA7ECE58E
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 09:48:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D96C2089C
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 09:48:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hul3p5UY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Q5lA972D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D96C2089C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YIihpW7Z5O1VkZQsQXDC0aPUdXzEIn4bwgsrV2Ijb0k=; b=hul3p5UYBbLTQU
	RcDR1/0gyXFIgJlLtTvarBziO3jjApaZJbh4vE0CKGNizVrKKjMDBeAHrDYq12SSs8yHAbBIFBwOA
	zZpyBt7D/aK591so3kJeeIDwAx9uDwjMq5ayKD84rw4RG4KJLvNCRODhBsSDPladuu6EgOrOod3jY
	zIbIys1gi4nTidstH13SRTu8ZYPdvVdxLjvN96HQcSF33KMh70QfpWtpwHP1+DWZkEDbT/oFjD4u6
	HKXQGGmeen7CXxr/ezSvdvLDoD6NqfSTq2zJi/rFeMlumGbOeqcwKXg735RvGRjuDEKo/kEL154I5
	FIo9bm+cNfbULpxH/r2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL2Od-0005t6-Ro; Thu, 17 Oct 2019 09:48:39 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL2OX-0005jh-71
 for linux-amlogic@lists.infradead.org; Thu, 17 Oct 2019 09:48:35 +0000
Received: by mail-wr1-x444.google.com with SMTP id o15so1135474wru.5
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Oct 2019 02:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ycCmZDffE4SSe1RIfJEgO6drqf4qkUDKv8PrM8jzmGs=;
 b=Q5lA972D7OIIkFBlV5IpEVNZrb3KvRhz42JwEx9gFIFhMJIEh7PRi51gHsbX+wVRxD
 PZdmgX4rNQCIkN/h9XwxrMRc5ZAdx0B38BM9AGTBua1KG2hpq0tfxa+ou7YncWQ5eQD8
 ByFlhwF5PxIEgeShlB+E4flH+rb5F54YoLfjJSbRtf9T+dvI5PjcV+LPVXKxm+SPrapo
 FSxLHrw/dLIteXR99i8EOR6s0EDwU7VPXxUVkvKBi+p3lMLg6ChAWalbPShydhGdVTTo
 c2V9aTiYgVRHJyee9Is2v0Jor6zmPb6TEq/YV68iBVZB21b0vLXVaHPLbsMKnoEKQ9Wx
 JqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ycCmZDffE4SSe1RIfJEgO6drqf4qkUDKv8PrM8jzmGs=;
 b=pIKFR7WeZ+fsEMZyxzi5PES5ffhSuKYvZDANRafu1UnjVcxU4f/4Xhel8tXms9/T7P
 EfZuO5tu8RXOmtc+8b8ZCO23Im1GzolPquE2+wjh7maRSU6ZvMi4HCrEYTRen4W/Iv5j
 SilVyefP+QSV3dv7qUwDIzW1d0I5gk6GCIH68f1KwMD27DUc1iF+vC/84l0vrr4pF5j/
 mK2oyhZU6kQ9iyfp/W/6Mm0aRaYSeHl+/Eot8nCnaGI2r42iP4g+8wO9dGWyxFcQlbv8
 2XdJHJkntDDZHBRdy0tGDyWlsTOixsW2keuj9OEd0F5N7SQxkKleM0YHlcLf/LViho+k
 a/tg==
X-Gm-Message-State: APjAAAXEm5WTj0ehxQmEXLrIOXwyxZg8C/uu/M8s9gWDq6ObPnI7l3+t
 UEVQJsjUUXfPT0/A+/iqw/C4mbMjew+nVg==
X-Google-Smtp-Source: APXvYqz7lZeF4JPmS/79/W03GEEs4vSLOmEToTSvkJdKYaxmzoCNaHLXPQWRtoZxQiaqzU8AiTTmsQ==
X-Received: by 2002:adf:92e7:: with SMTP id 94mr2311076wrn.199.1571305711121; 
 Thu, 17 Oct 2019 02:48:31 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t83sm2764506wmt.18.2019.10.17.02.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 02:48:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/meson: implement RDMA for AFBC reset on vsync
Date: Thu, 17 Oct 2019 11:48:23 +0200
Message-Id: <20191017094826.21552-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_024833_275331_677B50A5 
X-CRM114-Status: UNSURE (   9.75  )
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

Changes since v1 at [1]:
- Fixed a regression when AFBC was not used, adding a reset() call for the afbc module
- Added a define for the RDMA descriptor size
- Fixed overflow detection

[1] https://patchwork.freedesktop.org/series/68021/#rev1

Neil Armstrong (3):
  drm/meson: add RDMA register bits defines
  drm/meson: add RDMA module driver
  drm/meson: use RDMA to reconfigure AFBC on vsync

 drivers/gpu/drm/meson/Makefile          |   2 +-
 drivers/gpu/drm/meson/meson_crtc.c      |  27 ++---
 drivers/gpu/drm/meson/meson_drv.c       |  14 ++-
 drivers/gpu/drm/meson/meson_drv.h       |   6 ++
 drivers/gpu/drm/meson/meson_osd_afbcd.c | 100 ++++++++++--------
 drivers/gpu/drm/meson/meson_rdma.c      | 132 ++++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_rdma.h      |  21 ++++
 drivers/gpu/drm/meson/meson_registers.h |  48 +++++++++
 8 files changed, 283 insertions(+), 67 deletions(-)
 create mode 100644 drivers/gpu/drm/meson/meson_rdma.c
 create mode 100644 drivers/gpu/drm/meson/meson_rdma.h

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
