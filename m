Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D37C54E94
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Jan 2023 15:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9k8i2jUCOM0XgAIhOeYJ1bwuHreANdhfpX79bBrTSc=; b=o7LmP9MzfKxQwX
	QZU6lQcmNpcoi61Oe+0CrnyRiCV87QnyYyuvLc01iPEBldVSX5qlkNf4j/VG8wX98qMq1XE1W+VUH
	xeHFmuYOTVH2ge79E/y1tuaeQo1eGhHoc7/5yZzCOQfPVMsHMaEDt01J/AAQoc/fh0iyq8SOOWwMv
	A14peAWi1hycWe6xknetTsDul/w1kK+6Nqh1WNsoEkoWLDuVmrYLOg2TLczRzjgpQ5tsg3BFvOv17
	KLIwe59/BhyEqCjbgcqLbaX4RMEfQG037gsZt0cl4R3xWNrccNivvDZxTdvweleKubxFvrdBjcj76
	c2vzjlU1+45Wy07n7OZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4Gr-00BYLg-Bm; Thu, 26 Jan 2023 15:34:37 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4G8-00BXyI-Vn
	for linux-amlogic@lists.infradead.org; Thu, 26 Jan 2023 15:33:57 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 82A0C3F2F6
	for <linux-amlogic@lists.infradead.org>; Thu, 26 Jan 2023 15:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1674747225;
	bh=QSepvCE+QvU8qyq2q6n9pYjju+rfRtTHn1zPijhNAtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=jFM07lZ9N602ZtRGn2jqQIdVIV9kUsZfPmvvGutzWkERD7OZD4tZYa1+zXfcEM0G5
	 lmgz6OWcNhO0hhhICxoIxKuW1nc0IBinPHbu3SHWaq71cg1vWLneOMPB5REac5cxLl
	 YOu0Q+20aBX8L2COTLFz6ImfQfOO48dxgpZD7d0s30FT/CjKz6/Rg5Rf/zbjfVKNRX
	 ui/8gwBxEje6zdigegfie3mcmH1hTfdhaoS/g8Lqi35R5lWDOVDXHOg74NnVS5//5Q
	 OzCaYTEAtt5xGAbaQPfnyOJRLWB7aY7zFriwufY1NQB2F1h99XqbJxdiPMAiSnXQFy
	 mOFb04/nwz/1w==
Received: by mail-ej1-f70.google.com with SMTP id sa8-20020a170906eda800b0087875c99e6bso695641ejb.22
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Jan 2023 07:33:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSepvCE+QvU8qyq2q6n9pYjju+rfRtTHn1zPijhNAtQ=;
        b=rRGu3iqzkgX4mEZABUwXg4ZqokdN4Tzvw77GlismzHLiHVywur0O3WCTthajnhFBo/
         YylkFMANyG5fxaL8wgYjAvJR3kIqrrHycQzX70STRBqPXlUgcDgHTa31NJhAGCvzSE33
         lP7S4FlOWoTK2AemAHe6qL6lQ7gCmhV5mQ//1WL6hdQv8DnC6+PDIqoDoAvmCOGfPsyK
         /tBbT/YIAiFlrNSphBn47HrG71kr77yA0Kwg9AzTROgSnRrex58LFk12b4fob9k/IMph
         TC3pNtMenOWOByZkjfxCH51nQOtU2Jk0wSXkfOtjk4RSqJRLRYfMqc5gWz4P2xJkJu+e
         mLhA==
X-Gm-Message-State: AFqh2kpqIM+WuVwJM51DQX6KPurcPhh6aUsmA7s9DwzviSsBgjRhX0RX
	DseCLLH0gWQy6ZlskTPnU+pU4nbv3r52NxqbZh62ilKwGLNtAFZbAGMXDCOa3d916Vmm2Kt+s5f
	rjaS7WRz1iG/tuDdA1FV2Qi9qSG45+q/n019sjfOEIYpXMbuJ
X-Received: by 2002:a17:906:25c5:b0:84d:47e3:fe49 with SMTP id n5-20020a17090625c500b0084d47e3fe49mr35905491ejb.39.1674747223512;
        Thu, 26 Jan 2023 07:33:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsAha39SMJh+dIs31L8P5oRWYkNCJsasKCeyOKDBVSTao7E4ia4lwRK4rgCwDXA08+pLu3zqg==
X-Received: by 2002:a17:906:25c5:b0:84d:47e3:fe49 with SMTP id n5-20020a17090625c500b0084d47e3fe49mr35905463ejb.39.1674747223261;
        Thu, 26 Jan 2023 07:33:43 -0800 (PST)
Received: from localhost.localdomain ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id ec14-20020a0564020d4e00b0048c85c5ad30sm876174edb.83.2023.01.26.07.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 07:33:42 -0800 (PST)
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
	narmstrong@baylibre.com
Subject: [PATCH v2 resend] media: meson: vdec: Add MODULE_FIRMWARE macro
Date: Thu, 26 Jan 2023 16:32:58 +0100
Message-Id: <20230126153258.1558471-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220818064810.17856-1-juerg.haefliger@canonical.com>
References: <20220818064810.17856-1-juerg.haefliger@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_073353_293019_6369FEF6 
X-CRM114-Status: UNSURE (   9.60  )
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
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
