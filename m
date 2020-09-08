Return-Path: <SRS0=WuYP=CR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14602C43461
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 15:19:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADE0C222E7
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 15:19:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bOY1QFX7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NJ62SxAY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADE0C222E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3trgpncWpFALBMeRtpADsrRdSV+21y9V5oRDJ1o77M4=; b=bOY1QFX7oGUtC3Wr66RluE+RHt
	fPFN41Zq0/JZJkzydV1rGdEk+lZ0z82++9SblpxkcZEoC3uGfUWNSbekUalVdw/VmKMeN4QWnKmAY
	P6V6z25CPqiqivRlNHXb3sFsUcje8rE+yUg4yy4Gg0WLBuagm4e9WAVw9p27CDa/AibfJ9jT9DUDN
	QTZLO2DxLmGj7WjQGsdp4+01nMdqNHGY4mb/E2sl61OkPevuNvV9GoPNrXjm9MCL0ghnFtwq9Cjjv
	60H9huVCkNaQKWbeR+ZG9ooc7Z6mYTKdhehO1I0hQy1JBBwxi5r69JbpCnQgTKe2RHuW1xUOB91Vl
	SDz5f0/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFfOg-0001QB-5K; Tue, 08 Sep 2020 15:19:02 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFfOc-0001Oo-VQ
 for linux-amlogic@lists.infradead.org; Tue, 08 Sep 2020 15:19:00 +0000
Received: by mail-wr1-x442.google.com with SMTP id w5so19542144wrp.8
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2020 08:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3a/pKfNTcctsi5NMPeYXrn0Dqu/AbgV0+iD767DAkfk=;
 b=NJ62SxAYUNxu4wcmx23rzjC0yurPxVJ86uAMywAwLtKYtunOkXMT5kgoHOR/25NA2R
 vYdYurAJ1EX+InbHWiXPsmj6g8LHhZdY7XCo0ZHf00lyrl1axgUFNprhhjXOkQVwCp1f
 zXXOL8kxE/98FJDIfQqSuGGU0QFzRNrogY7xjpAQ3fzwnjP11rJwvTEBeU6GtDCZ2Zf+
 6GuYjQlqpzeRgOGSZ0RTUuzPde+Dgpfon7qdQFhPz7KpzO5ayMlKTLNyK9JmLeCF0RmS
 KrFS7MfiUwxJF0wm0vyb4kkKCVg0KEIPGStgaWElGD8vwcnf8tKdcBPFPNSg0DrTlyHR
 bmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3a/pKfNTcctsi5NMPeYXrn0Dqu/AbgV0+iD767DAkfk=;
 b=DeMi9GTBcFFy855KKOA7RyHV+RrGgl+iAv7rnS7yKYQFrG8sVTt5QmGOMM0eKUxAsM
 INQY1MkzBbnjEQSDh7cnc8SSloPmJfIBQC3EuWcD8786m8mO29kwKJRfk5+ULfFULDQw
 wX6SqaODnZUk9gk07P/1xlqiCSNhcZNFAo/s30Qu4Nkk+W5eYK3afSKE+Y0b5uqxIE2f
 cJNr4slN+o0Y4bz5TbBp4/aH4JMx0lp2S8HJuzxeR4AicfhMhuUAaXdMmyzvp8+Q+ags
 M3ureubz5oOnxWy9GeJnALaagot8vY42dkwc+m/ainzTSBZDSaex5XFSBtJ5WGyz5D9C
 iNxQ==
X-Gm-Message-State: AOAM530bHxyeCU0PLbFYJ/grPuyGItD4CJ3d7G6XfzGVid77I0zahmvW
 0v4RJ76SYmdXlryfbiARDh+UQg==
X-Google-Smtp-Source: ABdhPJxoedfun5a5jObY/rI/dRKE9z7QNbsGMa2l9zbVlFHBZ6rsBniEq+5NHWlHqnC9szuSHALYXg==
X-Received: by 2002:a5d:684b:: with SMTP id o11mr137401wrw.101.1599578337783; 
 Tue, 08 Sep 2020 08:18:57 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id d25sm10004886wra.25.2020.09.08.08.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:18:57 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH 0/5] drm/panfrost: add Amlogic integration quirks
Date: Tue,  8 Sep 2020 17:18:48 +0200
Message-Id: <20200908151853.4837-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_111859_197064_F2ADC302 
X-CRM114-Status: GOOD (  10.82  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The T820, G31 & G52 GPUs integrated by Amlogic in the respective GXM, G12A/SM1 & G12B
SoCs needs a quirk in the PWR registers at the GPU reset time.

The coherency integration of the IOMMU in the Mali-G52 found in the Amlogic G12B SoCs
is broken and leads to constant and random faults from the IOMMU.

This serie adds the necessary quirks for the Amlogic integrated GPUs only.

Neil Armstrong (5):
  iommu/io-pgtable-arm: Add BROKEN_NS quirk to disable shareability on
    ARM LPAE
  drm/panfrost: add support specifying pgtbl quirks
  drm/panfrost: add support for reset quirk
  drm/panfrost: add amlogic reset quirk callback
  drm/panfrost: add Amlogic GPU integration quirks

 drivers/gpu/drm/panfrost/panfrost_device.h |  6 ++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 18 ++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 17 +++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h    |  2 ++
 drivers/gpu/drm/panfrost/panfrost_mmu.c    |  1 +
 drivers/gpu/drm/panfrost/panfrost_regs.h   |  3 +++
 drivers/iommu/io-pgtable-arm.c             |  7 ++++---
 include/linux/io-pgtable.h                 |  4 ++++
 8 files changed, 55 insertions(+), 3 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
