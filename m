Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A193EC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Feb 2022 15:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2owD+xYTPOZRL5BoGyEcZct/H48MlsfuD2VuoQWYOxU=; b=TZ1KJW1gJlia59
	FjWP50jzTkaiq+RLKctov+ST6y4ctSVFaGc4O5UMpW8efsqselfTePUwCZkthHLvaiDGLqMOJtKJE
	mEkgv2kKYAdI/hXDQ4XUUsNj8FGYItEthWjzUFtUw1F9fuRLZTro8uc2fmU5JYLTFjttqqCyYCfwM
	HxlaBwfv2EiN58inM4b2Z9sRONHkZBTziVGMTIISQSfRU5A11um3jtMJ4Fr1P4jqmeQjIlKz6ZbWt
	AGjoz3PWpZX0aIG7APgNRrC+JnZkne7qw6WyQj3djiuHloMroorVCs+FxZ3nfinjlvgxjRkZL/P//
	A5VxcdaIbZPWw7fkOBpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHowq-000ain-EN; Wed, 09 Feb 2022 15:32:00 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHowm-000ahB-Rw; Wed, 09 Feb 2022 15:31:58 +0000
Received: by mail-wm1-x334.google.com with SMTP id r131so1727160wma.1;
 Wed, 09 Feb 2022 07:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=ZyAttm7EWbqNG67CUDg8UPYwEYfS+Y2vi8G1ZAG6NcE=;
 b=RDqrhnCrVs2cy1RLpuK6nwaQFgj423rToOLIXbkpypkJM667N2WSwDimCP0mSqPCeQ
 EGTvGluh8N/yHOL5mrdSr6/5y+WgJvk6BJeAneMtafAHX4dN5Jo+hlPJeEroJP46HMaU
 Ckej5RHBnY3v++NS1SvQbCdf8Rx3q0c+rNYsFVa3ncq0bIqmXi7MmOsGi35r9TTFqAuo
 rgm/9AlLh6Qw0lXbvKq8CSp4WIkj/KUeu5GjqydWvyAVHMw/tJqN6ymygtrSkJqm6BuS
 XStOlwNtwE4Z7E7vYJ0gaxrnXORdOeQVDuP4vFQYC1Z69VBMpg6dmzCvbR43jUeXIWt+
 78IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZyAttm7EWbqNG67CUDg8UPYwEYfS+Y2vi8G1ZAG6NcE=;
 b=7YtelHE11tfYVPEGFgoZNG/DYJJL7ozgKDGOJ6ngHEZ2tFGqIHbnmfwrIBD3PsVaq/
 SqWqWh09buuIHtXlGv0xE7R+V1d+f28mGngcbaOYPCfohxKu1vfX44ANc2n66qV+b0oz
 blwaObFlgy90cAczzcOXZkeHHvZq9wqayiOeCbvrxgQmPf7Qo30JSiHexT2XDMmLn3EY
 mkxO7u6X0w88lMEc45SF0WbLOD2Yv7K/NXdxszG6WMvC72r8cICKlGlX2zWK7zUPAGgv
 lKUqjsYDCWPLTRUHkbaVT/QNpmNUfSSqBgkE8DMnwjw9XH9Ed42s3GXn2zOoBW8+Q/kc
 REEw==
X-Gm-Message-State: AOAM531usi/e9qZ8WRnjd9FhkA97JaLazlq4h2R3CaHSQd0UhF8DFwku
 fknVpRVdQFmc7o0ZvkjiAkY=
X-Google-Smtp-Source: ABdhPJxG8wN3QTxvyDPuUUetA/tjTXSz97RI/agJ/gioycGkSAkQhODQCe4UpRBeH/mRvSk0Ax2veg==
X-Received: by 2002:a05:600c:4f53:: with SMTP id
 m19mr2529899wmq.45.1644420714828; 
 Wed, 09 Feb 2022 07:31:54 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id o125sm2875729wme.37.2022.02.09.07.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 07:31:54 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] drivers: meson: vdec: add VP9 support to GXM
Date: Wed,  9 Feb 2022 15:31:50 +0000
Message-Id: <20220209153150.30688-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_073156_923600_DE018CB1 
X-CRM114-Status: GOOD (  11.44  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VP9 support for GXM appears to have been missed from the original
codec submission [0] but it works well, so let's add support.

[0] https://github.com/torvalds/linux/commit/00c43088aa680989407b6afbda295f67b3f123f1

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
Tested with LibreELEC 11 nightly 'AMLGX' dev images for Khadas VIM2
and WeTek Core2 GXM devices which can be found here [1]. The images
combine Linux 5.16.y [2] with Kodi v20 [3] and FFmpeg 4.4 [4] which
notably includes many V4L2 refinements for stability and usability.

[1] https://test.libreelec.tv/
[2] https://github.com/chewitt/linux/commits/amlogic-5.16.y
[3] https://github.com/xbmc/xbmc/
[4] https://github.com/jc-kynesim/rpi-ffmpeg/commits/dev/4.4/rpi_import_1

 drivers/staging/media/meson/vdec/vdec_platform.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
index eabbebab2da2..88c9d72e1c83 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.c
+++ b/drivers/staging/media/meson/vdec/vdec_platform.c
@@ -103,6 +103,18 @@ static const struct amvdec_format vdec_formats_gxl[] = {
 
 static const struct amvdec_format vdec_formats_gxm[] = {
 	{
+		.pixfmt = V4L2_PIX_FMT_VP9,
+		.min_buffers = 16,
+		.max_buffers = 24,
+		.max_width = 3840,
+		.max_height = 2160,
+		.vdec_ops = &vdec_hevc_ops,
+		.codec_ops = &codec_vp9_ops,
+		.firmware_path = "meson/vdec/gxl_vp9.bin",
+		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
+		.flags = V4L2_FMT_FLAG_COMPRESSED |
+			 V4L2_FMT_FLAG_DYN_RESOLUTION,
+	}, {
 		.pixfmt = V4L2_PIX_FMT_H264,
 		.min_buffers = 2,
 		.max_buffers = 24,
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
