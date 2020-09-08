Return-Path: <SRS0=WuYP=CR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EC5C2BBD0
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 15:19:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1013220738
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 15:19:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pZGJMHya";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ORyY4Zqf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1013220738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=thTtwp41YeWkFQ035ayLw1Yup8Ud8ApPRR2rIY0yB9o=; b=pZGJMHyatJr8rMkX8A7BWoeAQ
	2nExguDttCx7XBgyAurLBN8ou2Ty5+E/lXbz4jCBMLs9HzycFOtAXpcQ+AcqXGDPpY2o6rXHVS/64
	+J+tVBMB7m1rlN7xq6M6NmYDb25R40LPXhpppDsypjBEN9Nncp00jST4gbjCiUtYbOaAHnrs9Cfwl
	yJXVV9l4p/eCgvgEqoElNaNHQEpHu3suI44Puh5ZFR5lcTANyB+fuhw0a22HJMjBIBPTVYZOtJ1/A
	VSL+cjPc8TB0wFe5IG7CK0MSy+MzaM4hxRb3ucwIN8Z5XcV9fi4IEQJoJSpnr0iKX0EX3X3foSd1C
	2OEVQhJSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFfP7-0001cr-D3; Tue, 08 Sep 2020 15:19:29 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFfOf-0001Q7-RR
 for linux-amlogic@lists.infradead.org; Tue, 08 Sep 2020 15:19:03 +0000
Received: by mail-wr1-x442.google.com with SMTP id z1so19590429wrt.3
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2020 08:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O5HUPZey23fpZ7O0ISBcnmoDeQoSvAOa5PK6DE6zp90=;
 b=ORyY4ZqfDcrdXYjsjTXTEtrUaQe1RJldbGO+pqANb858Ya+JjB4iH1ncEJwkByFE3d
 cvYPX+8JBt8+2Wov00EdDqAMHvKSEsRwmOVae7HKFzAi8a9LM7+VE9WE6w4pARa9Ox1x
 /ahRnbLC4gcZoGEORtUuxneW2DLP1pdu8Ol/m53qs6fnlTkDYEodVKtywKTDBQzApoU1
 GQlb0LTW7BmwiHtiu2r/3kR4FFdu4bFblA3jYjH2vVIAP3WNcxTFgYY3IKzl4j7ojkEK
 mYooRqXepx9HdE+veBwBnbnNIubUixtUQd1iCTaBJhk1jxmYyWfkQCIc1ZTaHlMQiRg+
 ITOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O5HUPZey23fpZ7O0ISBcnmoDeQoSvAOa5PK6DE6zp90=;
 b=SFmfKH1JMhRdijRsGB/1HyVlj+6QT374z1Gs1IH+lKPZEU7itGuPGS7ONbr7Tg1QHi
 LWB20OJU4Op9smYzgx7WFmVjdAmMW0cddwrswliziTQ6QucuNQ68ePPViUMhG1xyIdLm
 yMOpkFLI5RJl0o+xpJtjaNRA2FuiZYbpVjeVApQV1/R+atrvdx3NQq4FAbje0zU2LwI7
 vOlxZEumDHn/80F2XjeL8/MM/y8pMwS4WIfwLkDvv2bXPTnmJuxHPLixyRU/pK7Tsqyr
 hcHt+RX5ubW2mSnz6E6nTeqGPtvJmjg58J0UOTrKQcvTU2bUdiMGd+otvsfC2ic/0Oc2
 pphQ==
X-Gm-Message-State: AOAM530gF65XWqwS7Sn8uJqL8zkKSZb+07TV/NaSV/k/3/RI1x0qx2Aq
 +9IMltsFngX8xh4+XwpV3nQSnQ==
X-Google-Smtp-Source: ABdhPJzcrzBmN5nUV5nRaVbaFFXi/hKg4wRQw/mW6OU7rGvxpIpYuoFbrS9YqopA0v/jdvJCmxWXjQ==
X-Received: by 2002:a5d:67d2:: with SMTP id n18mr119063wrw.223.1599578340777; 
 Tue, 08 Sep 2020 08:19:00 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id d25sm10004886wra.25.2020.09.08.08.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:19:00 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH 2/5] drm/panfrost: add support specifying pgtbl quirks
Date: Tue,  8 Sep 2020 17:18:50 +0200
Message-Id: <20200908151853.4837-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200908151853.4837-1-narmstrong@baylibre.com>
References: <20200908151853.4837-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_111901_978189_455E7922 
X-CRM114-Status: GOOD (  13.37  )
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

Add a pgtbl_quirks entry in the compatible specific table to permit specyfying IOMMU
quirks for platforms.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h | 3 +++
 drivers/gpu/drm/panfrost/panfrost_mmu.c    | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 953f7536a773..2cf1a6a13af8 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -70,6 +70,9 @@ struct panfrost_compatible {
 	int num_pm_domains;
 	/* Only required if num_pm_domains > 1. */
 	const char * const *pm_domain_names;
+
+	/* IOMMU quirks flags */
+	unsigned long pgtbl_quirks;
 };
 
 struct panfrost_device {
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index e8f7b11352d2..55a846c70e46 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -368,6 +368,7 @@ int panfrost_mmu_pgtable_alloc(struct panfrost_file_priv *priv)
 	mmu->as = -1;
 
 	mmu->pgtbl_cfg = (struct io_pgtable_cfg) {
+		.quirks = pfdev->comp ? pfdev->comp->pgtbl_quirks : 0,
 		.pgsize_bitmap	= SZ_4K | SZ_2M,
 		.ias		= FIELD_GET(0xff, pfdev->features.mmu_features),
 		.oas		= FIELD_GET(0xff00, pfdev->features.mmu_features),
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
