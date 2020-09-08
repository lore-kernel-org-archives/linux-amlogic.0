Return-Path: <SRS0=WuYP=CR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43491C433E2
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 15:19:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EED5720738
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 15:19:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lu3eY4AI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QClkfBuh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EED5720738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oHyshe9jhLjSzbkuyURasRIQ7SSWo0q2iOHhUCDakpU=; b=lu3eY4AIPv5kpiPSvFHIMuA4D
	U/44MgmUGCvDm1F+612Big4ryvO2dVM0eJeCpW+EHylKuBz8WBu8M1Mgy/KW92Knn71/mv2b+UORz
	xdMPy7zi08q3Ozg4IOsQaZchViAS2FWNKo+ZcpYbkrfRMnjq8LjtsIK+tQ51R7xF/t1BdGrMj2gz9
	nygKpM1gUpbue4cTsf8vDBsHahNdQBK0f4AxK+sL7uBvf4wVW+Mc11p1HHxNHIftJ6Hh4kdPFmD7u
	a3R2XBJuW4MCkJxPBWb6qORufcZV0ByhUnC+uiRcIAbAKQyK5ej1ct3GcatyiknQcdMjUalZH23Nd
	E0rNIKDzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFfPQ-0001lr-Ai; Tue, 08 Sep 2020 15:19:48 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFfOk-0001TC-7A
 for linux-amlogic@lists.infradead.org; Tue, 08 Sep 2020 15:19:15 +0000
Received: by mail-wr1-x441.google.com with SMTP id z1so19590677wrt.3
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2020 08:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E2h5/f7B8UduwNBWvSzemM2vuVc1bCQBvZ08jf0eflQ=;
 b=QClkfBuh7zRtKPZhArDNelPuXMie1hFY7FPB3XsPbRlBLzS1TUzcRStoDJaFj+3aVZ
 yTZZExlief7f9/Iaz2xUvIL7RcWsHwZQ+dr9MfSesaQgo3huHMHVokyq2FXgZ8GVlJDl
 1TS2E9clRVHW910paXbN65GvZZV+smkSMxbGfjOBBa0lyhHQztUhkmg7Dmm1Hfq2NVE6
 BmH23sbtkUVAVWuPHKhgTjjrX7RT936M3DSZzYqPmz+fKNSG9gOdKuHoLkvh0mK0u0G7
 awgJf92IvgOMOaHm6N4flJkgsHxhNKL/LKSivxXNIt9SKPgp9zu4AtvEo76gxXM6ojik
 zlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E2h5/f7B8UduwNBWvSzemM2vuVc1bCQBvZ08jf0eflQ=;
 b=D6HIFrWE5gD0PpriHl+k1uwYqsMiJOQD+yjfjzdISA/epm7Yk7X6JPaJOb78KTjj6F
 sIPZm8Q1N4q7Edxlxu1BbrBkWTf4VABXRzdaCOMTdjaj+d4woSYys9+SzzYRiS00qmFn
 O3+asoUw0TMWpLIp4tfzRgkhIXrbYbDP4nA4YB2b6LdWQiPY3465HDK/YAz9ebhbkjzF
 LoYUhx02OdLotR2z+U+T4FEDEYvQI04qShGjQjdrE9kNjHa2AthDsvPd+aJXOv9vzpKH
 /DXFFX1J9fc/u3R8FSGu0IlnIvIjZNIbIwvopswW2UNnJD1/WFWecawT4ekz1r9psSWW
 5UaQ==
X-Gm-Message-State: AOAM532dnwWX1pF6TOn1BtZlFx/J5fu21Avme6UG69oy7XNhfPHqNgl0
 DlzbyX2ePtJb9rUzBxvau3zauikjXUZmHEmH
X-Google-Smtp-Source: ABdhPJy2ANgwewAvMtdvyK0S7iJLntLssA/HK+zsOS39X389rZIqUtFcfuRkd6xLxKT6uQiYWITGiA==
X-Received: by 2002:adf:e690:: with SMTP id r16mr135272wrm.15.1599578345135;
 Tue, 08 Sep 2020 08:19:05 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id d25sm10004886wra.25.2020.09.08.08.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:19:04 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH 5/5] drm/panfrost: add Amlogic GPU integration quirks
Date: Tue,  8 Sep 2020 17:18:53 +0200
Message-Id: <20200908151853.4837-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200908151853.4837-1-narmstrong@baylibre.com>
References: <20200908151853.4837-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_111906_326899_5B502BC1 
X-CRM114-Status: GOOD (  12.83  )
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

This adds the required GPU quirks, including the quirk in the PWR registers at the GPU
reset time and the IOMMU quirk for shareability issues observed on G52 in Amlogic G12B SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 36463c89e966..efde5e2acc35 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -656,7 +656,25 @@ static const struct panfrost_compatible default_data = {
 	.pm_domain_names = NULL,
 };
 
+static const struct panfrost_compatible amlogic_gxm_data = {
+	.num_supplies = ARRAY_SIZE(default_supplies),
+	.supply_names = default_supplies,
+	.vendor_reset_quirk = panfrost_gpu_amlogic_reset_quirk,
+};
+
+static const struct panfrost_compatible amlogic_g12a_data = {
+	.num_supplies = ARRAY_SIZE(default_supplies),
+	.supply_names = default_supplies,
+	.vendor_reset_quirk = panfrost_gpu_amlogic_reset_quirk,
+	.pgtbl_quirks = IO_PGTABLE_QUIRK_ARM_BROKEN_SH,
+};
+
 static const struct of_device_id dt_match[] = {
+	/* Set first to probe before the generic compatibles */
+	{ .compatible = "amlogic,meson-gxm-mali",
+	  .data = &amlogic_gxm_data, },
+	{ .compatible = "amlogic,meson-g12a-mali",
+	  .data = &amlogic_g12a_data, },
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
 	{ .compatible = "arm,mali-t628", .data = &default_data, },
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
