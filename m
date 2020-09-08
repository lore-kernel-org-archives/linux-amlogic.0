Return-Path: <SRS0=WuYP=CR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531EBC433E2
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 15:19:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06A5820738
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 15:19:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bRvAwJ7z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1fRpOHn2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06A5820738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vD/jLhcwMa3GWtUYQpCEBGMgFEQGm/gsvfZQcIGTQDU=; b=bRvAwJ7z499RwhAo5R8PFztvA
	jo6UE85KWEl42xo9KRxHYgTsXpVlyl4QWJ8ouHrnEMULV33qE0hEoxRy0z8cIe+Jwgzsu+KVZAbwa
	bQUGP1y/YdJfSATwYU4vx7lMhewfXC90IFyuvgkjEvdzzR4aSYYmtPyDyY6mbEESGXr87YRoFYtpb
	feHYc3Zm4VViNPs9eAcHb1NEvzf3b3+nENxseeTnfx3srnhk8FfkDAJFj4u4vHLMRUiGyQfEfCOe3
	gIAJHTL68u2JrPv5J84WuFN1bDEO/LsI5BQN2P7ejr9KgS8skHc8ammNCV5drhjbhDzNltQLAOAHM
	+fWTfMJRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFfPG-0001gK-ED; Tue, 08 Sep 2020 15:19:38 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFfOh-0001R4-7k
 for linux-amlogic@lists.infradead.org; Tue, 08 Sep 2020 15:19:07 +0000
Received: by mail-wr1-x442.google.com with SMTP id c18so19508637wrm.9
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2020 08:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EjvSHXG3RI2RmufIBrYIZQgGCbPKahWO302cZe4SW9Q=;
 b=1fRpOHn2lUTg/rLqc5FK572t6QTaVx2cYu+zLDiJpPqs8Msd6mxRGNwuQj7o/RemeB
 lp9id7bzG8bubb29ko3iwRYgZzddu8jc1z5ySmEpJQbi81n/gngRijw8+0G4Hmtjajt3
 VkvFnYnB70FT/9x3O7OLKvsN8UDOhKP5dcVjqfmkLO3lasTdS+d5yCZZxHw7Ga9Zja2n
 1y6vyBkEwXn/0qvCvQTQjk71wPIDCn2g6OnC0vEEUSS8gU1hzC2FE/iYN4+XkIbnAbOg
 otF3YD6EqWDUDKMsSqkb8xASmC62YkldJ00uUh8OxuTRQbumbWBoRkx7YxQGBkWdFmmm
 Szvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EjvSHXG3RI2RmufIBrYIZQgGCbPKahWO302cZe4SW9Q=;
 b=ifMhibGXlWYmiGiWSRU612v4nrQ2L/IMQlP4zlhFDIrXxBSyIZrBjq023vh3uxgexI
 x6Qo8riOxViCib7NglECZ+4BusTCyXViRxQbiGcwKg3T5RRwi3tnMM2qT0fb7yIw0cXb
 Gnzzc/V5bFwvnpIeqwoXNQOp3pLLiFTGmxpR7lsZTauq62S+LKFQp3gAHTFMFJ1IAGLy
 +gzncr1hHDzhMvyLxzCdc2XHVx8ZKVeXiOrTfxGJVDrw+HJjnTRMUIba9t8BrBDjuGKD
 b14zNyX2Cs0a+mQK2rE3VCO01/WpkYUMpl+/G0tLRTe5I+jxkKGYENtpy5a4kVX1lqdk
 wAHQ==
X-Gm-Message-State: AOAM5326K8b4UKxjXeBn+6f+nu7BvjNVsaYchklHAXUgwdnhtqOOKwqe
 NiBF+POgmPj+k1BIt8hRRpTdQQ==
X-Google-Smtp-Source: ABdhPJyN+wVgZwcIGrsQVVJMowKAn9fgE7m5lBvFEuTQvke5O9KsubvDObKWcbTu0XD7mkbW64TA/Q==
X-Received: by 2002:adf:f50a:: with SMTP id q10mr110043wro.319.1599578342220; 
 Tue, 08 Sep 2020 08:19:02 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id d25sm10004886wra.25.2020.09.08.08.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:19:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH 3/5] drm/panfrost: add support for reset quirk
Date: Tue,  8 Sep 2020 17:18:51 +0200
Message-Id: <20200908151853.4837-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200908151853.4837-1-narmstrong@baylibre.com>
References: <20200908151853.4837-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_111903_386537_F33A626F 
X-CRM114-Status: GOOD (  14.10  )
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

The T820, G31 & G52 GPUs integratewd by Amlogic in the respective GXM, G12A/SM1 & G12B
SoCs needs a quirk in the PWR registers at the GPU reset time.

This adds a callback in the device compatible struct of permit this.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h | 3 +++
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 2cf1a6a13af8..4c9cd5452ba5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -73,6 +73,9 @@ struct panfrost_compatible {
 
 	/* IOMMU quirks flags */
 	unsigned long pgtbl_quirks;
+
+	/* Vendor implementation quirks at reset time callback */
+	void (*vendor_reset_quirk)(struct panfrost_device *pfdev);
 };
 
 struct panfrost_device {
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index e0f190e43813..c129aaf77790 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -62,6 +62,10 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
 	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_RESET_COMPLETED);
 	gpu_write(pfdev, GPU_CMD, GPU_CMD_SOFT_RESET);
 
+	/* The Amlogic GPU integration needs quirks at this stage */
+	if (pfdev->comp->vendor_reset_quirk)
+		pfdev->comp->vendor_reset_quirk(pfdev);
+
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + GPU_INT_RAWSTAT,
 		val, val & GPU_IRQ_RESET_COMPLETED, 100, 10000);
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
