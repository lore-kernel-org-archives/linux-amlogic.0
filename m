Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B360FEB64D0
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jun 2023 15:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nh09MV1SFc0m83m4xZg0rb8bJ5n/V/s3lbkxbN6cWsI=; b=BXCRnRE+6oGQTN
	AvuA3HWtEZ0SKZZ0KVvM7OfFqqz5/PRY/GbldnAVQ2w88DeBKYxgjXQ2cSIhGD+9Ye1yJLfKXdsbo
	/n9E/xv+VEPcTxgIOlXLwKXoctm3iBJp5K2XIVOxztT6QECncCRngYQRMGKxQ4rLOqTBI4oxhkJWN
	7A59c8sNefQPxfvWkfRiHxj6wLPRERlZ0tP7KbDn38GBnS+p7aE85gQMZ/dB7VXJD7ZmKCoENGqyH
	e5syRVqxz6jeEAss7WCnM5hG+WmkQ9GbUYhbLoo/gUtOHvxenlx2PyDn9xZ1koOstdOhEAktGoX36
	lVn9u+FsaNa/P0NeBVKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q967p-008V7o-2z;
	Tue, 13 Jun 2023 15:40:05 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q967g-008V4B-0v
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jun 2023 15:40:04 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 38D923F26D
	for <linux-amlogic@lists.infradead.org>; Tue, 13 Jun 2023 15:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1686670786;
	bh=h2VB2F1nqgPgNlWNC2nzeOkEx2tuyJu/3uifBQZUmKY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=XCfQUOHTdZNwT5QFhWtQ1Sb2JLC5AUvLO1sfDEqmkH79uFytWAxbyL6Ke/JchgDPI
	 D61iZJfMCAfpKBwBkjxlaoqAQLvaIskHDx6qDGtilRDHk8Dbzsuf6eVhFXDzuhH8Yz
	 LlH/M/1tWGTXZF2iXK9I/siSIV9aHOIODMRHwHqqDXcPIIZd4x/OmxNllBaW2sRERw
	 hfeB6Tk95b2OfzgKSKD/O8990+I9Ajgrsbf265KKTeFMZ+vfkj3bF3oNWqwuzxWRvI
	 TqaoV+xeWjaYGdk8aD2uqJJxj9JJrjVk0StTILy8m73T9lZfAbhOarPZeQhSij+aPg
	 w/WFA+j7wuY5w==
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-30fc7ab9ff3so953885f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jun 2023 08:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686670784; x=1689262784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2VB2F1nqgPgNlWNC2nzeOkEx2tuyJu/3uifBQZUmKY=;
        b=VNS+RNln6ae1kbgmebnJxekDSsZbYFj9GZbMglgfPztQ9vks+3NhBiPqzS1Wf2tCAC
         93/OmNFmwC1DqAZhYSY7LmJvIpq1OeDeHLQxr0PgC6xgjMQ3p3jwc9QV5hvFuLcBYu6G
         UTthXSY4vfwasDfm7Nj6YpYy0HAxq5NzoFmkcnstaA1RhJEDJCH1VnRmP9jTGV2bNpGR
         5vjJY/gBH3a1G4ZfWgSGlSzFA5959jP4gJlk45hP90H+mUEhEXkL3X2BT5L4Rqrep+Sj
         UJd6cOt3YmLCbJdiNDy6WbJMeefG/Pef9+JL6UpAGvW8tV5ez4FUhA8mJrM5D9NibRpT
         Foew==
X-Gm-Message-State: AC+VfDzw8bhRUUtYPqFZbWSTjT0RwHnbCTn91UqDoj+33+sso7JQeSwu
	Wx3vO1dmYvpU75Klm3Mi6cgRibopLaOjYE3dmabJ7HCL38s59E6CDyHXiPI69LIMrDSIf1Nol3x
	q0D1mc433mO3fDdHm8DYgv+oheq9UHU+xW87ADNkRFPWJZkwl
X-Received: by 2002:a05:6000:1248:b0:2f8:3225:2bc2 with SMTP id j8-20020a056000124800b002f832252bc2mr6846732wrx.41.1686670783784;
        Tue, 13 Jun 2023 08:39:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7u6y5BjGv0z8bT/LB9RrsvWeO5qrDCAe7zl2OSeRDtbWoTqJ0KQBMBeO8sS2CFGRWa+dBvvw==
X-Received: by 2002:a05:6000:1248:b0:2f8:3225:2bc2 with SMTP id j8-20020a056000124800b002f832252bc2mr6846717wrx.41.1686670783535;
        Tue, 13 Jun 2023 08:39:43 -0700 (PDT)
Received: from localhost ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id b5-20020adff905000000b0030aedb8156esm15556257wrr.102.2023.06.13.08.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 08:39:43 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: gregkh@linuxfoundation.org,
	jbrunet@baylibre.com,
	khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	martin.blumenstingl@googlemail.com,
	mchehab@kernel.org,
	narmstrong@baylibre.com,
	linux-media@vger.kernel.org
Subject: [PATCH v2 resend 2] media: meson: vdec: Add MODULE_FIRMWARE macro
Date: Tue, 13 Jun 2023 17:39:39 +0200
Message-Id: <20230613153939.152457-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230126153258.1558471-1-juerg.haefliger@canonical.com>
References: <20230126153258.1558471-1-juerg.haefliger@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_083956_730270_D76F1BB8 
X-CRM114-Status: UNSURE (   8.83  )
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

The meson-vdec module loads firmware so add MODULE_FIRMWARE macros to
provide that information via modinfo.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

---
v2 resend 2:
  - cc linux-media@vger.kernel.org
v2:
  - Drop duplicates
  - Add Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/vdec_platform.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
index 88c9d72e1c83..70c9fd7c8bc5 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.c
+++ b/drivers/staging/media/meson/vdec/vdec_platform.c
@@ -280,3 +280,12 @@ const struct vdec_platform vdec_platform_sm1 = {
 	.num_formats = ARRAY_SIZE(vdec_formats_sm1),
 	.revision = VDEC_REVISION_SM1,
 };
+
+MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");
+MODULE_FIRMWARE("meson/vdec/g12a_vp9.bin");
+MODULE_FIRMWARE("meson/vdec/gxbb_h264.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_h264.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_vp9.bin");
+MODULE_FIRMWARE("meson/vdec/gxm_h264.bin");
+MODULE_FIRMWARE("meson/vdec/sm1_vp9_mmu.bin");
-- 
2.37.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
