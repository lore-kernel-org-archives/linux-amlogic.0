Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A741C25B74
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2024 05:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNVQ7lgHJJXlQKfOcdZ+O887qFoEePerWfmuJWhrlCU=; b=sMLuk8bGxm8t4Y
	acU2PtA3Bm8m/szOazsGhpzJZ2lJgz+7GanNw5+wYsZzz7xcbmzK5tM7ba7Ew0A4UnZsF0PQvdVhD
	SH/RVT8nWFFVlKBv7CiPz9x5Ze2wfJSTp4zNcDD8Z10vK4LQGJOtBlGnG1UDwY8tUZJDdT505zx8R
	WKA2EXvo8PPxnZ/+IHGS+L/kTiFifDRX104kpFLPjtjnm+TMbr4EqXKhdErT7iS0w9CJdZz1HruWG
	vqwoOmDu8/IUTt1j7p7EtO0xVumUkQDGnE2McY4V2ClG2vPK6A2jqWlY4RMylLxj+/U2OKEqIWu5G
	3zUVKfX0XZc+v3kCo8FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEMWU-00000001FQ4-3o9r;
	Tue, 04 Jun 2024 05:15:50 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEMWR-00000001FLj-1Hgv;
	Tue, 04 Jun 2024 05:15:48 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-578517c7ae9so604099a12.3;
        Mon, 03 Jun 2024 22:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717478141; x=1718082941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SJccidjsLYGh4yEPOhnunVr6ljOJkGUx3ObCldCrBM=;
        b=kFhAlh7ZX4rcyS1f5m0IIW8bImdPT8kO5vKHJrOAqbm12TXh8LRhvZv+9f2MyHrUyy
         0N8iCvWv50YBncHmH/Zs9FkJIKq0ayjrwubrZTLVstWKwiahOVxgVTBFE0ojdOSQVx2/
         BidBwBRymwHi7BC9sdM55nBTHKMTO7k5YNQe+k4QeS1PCQ4iUXjSa7EyfxJKNCzoH4AX
         IesjMkFbmWz4MtRnKzjh/TLvNZqIWcLhcwwUpMWDbVy3V/LnJa63h9ViE1KjhLOXYemA
         GseaZ+sr7mUQOIUUzPs1jMLbyXPIaqZNvUuAEnC3LlPiuLT2JZDU8uyGjJU0WPuPAfBu
         Rp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717478141; x=1718082941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SJccidjsLYGh4yEPOhnunVr6ljOJkGUx3ObCldCrBM=;
        b=tTYt9/jc7WCQLORlIdyWxPwtQ/3sJr2Ng9uVi8M6wwykk0DtIre8U7KgL6Se10mkc7
         aZHfFKSfwYoY5+0zSaVLdAv/RgaAv37+d0wre+nb4u7HDVwLV3G2eoEb8/Wp3NfVhePZ
         B5pVARrPJl4VynJXyRbak+s18vB2IDGi2jeFlSAqttjv6kbWAPE1x7MGrvA6IHhxox/8
         Cb20GZkbNn/IpWagezkUZM+va31oUVmZenotbAf4dhGi9ZdcAvVt9Ia8E1dMB0teT4ct
         p8CW57lvSayMUByuX/ou6qhH4JbaAFcC5P71UWJwtU1P054vEPbww0iGB6BssevQPl0T
         MXjA==
X-Forwarded-Encrypted: i=1; AJvYcCXKqbSUmtDa0y8rG5P+QMmhQgpQIUIZPq7Lg3j368iW2OXywIsmaV3D9rtBF5lSPKwXNAQ2/zUY6qyFjkvbGoR0IR2NntTtuYiQUw4JUTe0V5oK6xIbTlvaAxwvT+LsOkl5c0Cse3QB1qMKsfF7c4NlledI2lfU+Q==
X-Gm-Message-State: AOJu0YwceO6+ZbGo+uBVb84ndq8x3l8mAwLRXtAN1mhU/A8TI26g2W2m
	9Fz54OnFlXtaXy/+vCsVJBaMEw8824R/MsFwc3b06nAIHJjt2J8U+eUUrmpfObpS0A==
X-Google-Smtp-Source: AGHT+IGZ8TPHTibom2cLxGJgP0J5h41ltwlDrg51oTsOx+WeTH4ROT9lb8ZKceTCPjvT/pMzBjeQoQ==
X-Received: by 2002:a17:906:3718:b0:a68:cf22:ebdb with SMTP id a640c23a62f3a-a68cf22ee12mr383305766b.43.1717478140978;
        Mon, 03 Jun 2024 22:15:40 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68afbaac03sm451896566b.149.2024.06.03.22.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 22:15:40 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: meson: vdec: add GXLX SoC platform
Date: Tue,  4 Jun 2024 05:15:33 +0000
Message-Id: <20240604051533.3312944-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604051533.3312944-1-christianshewitt@gmail.com>
References: <20240604051533.3312944-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_221547_365274_B1066023 
X-CRM114-Status: GOOD (  13.32  )
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

Add the GXLX SoC platform which is based on GXL but omits the VP9 codec.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c       |  2 +
 .../staging/media/meson/vdec/vdec_platform.c  | 44 +++++++++++++++++++
 .../staging/media/meson/vdec/vdec_platform.h  |  2 +
 3 files changed, 48 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index de3e0345ab7c..5e5b296f93ba 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -982,6 +982,8 @@ static const struct of_device_id vdec_dt_match[] = {
 	  .data = &vdec_platform_gxm },
 	{ .compatible = "amlogic,gxl-vdec",
 	  .data = &vdec_platform_gxl },
+	{ .compatible = "amlogic,gxlx-vdec",
+	  .data = &vdec_platform_gxlx },
 	{ .compatible = "amlogic,g12a-vdec",
 	  .data = &vdec_platform_g12a },
 	{ .compatible = "amlogic,sm1-vdec",
diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
index 70c9fd7c8bc5..66bb307db85a 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.c
+++ b/drivers/staging/media/meson/vdec/vdec_platform.c
@@ -101,6 +101,44 @@ static const struct amvdec_format vdec_formats_gxl[] = {
 	},
 };
 
+static const struct amvdec_format vdec_formats_gxlx[] = {
+	{
+		.pixfmt = V4L2_PIX_FMT_H264,
+		.min_buffers = 2,
+		.max_buffers = 24,
+		.max_width = 3840,
+		.max_height = 2160,
+		.vdec_ops = &vdec_1_ops,
+		.codec_ops = &codec_h264_ops,
+		.firmware_path = "meson/vdec/gxl_h264.bin",
+		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
+		.flags = V4L2_FMT_FLAG_COMPRESSED |
+			 V4L2_FMT_FLAG_DYN_RESOLUTION,
+	}, {
+		.pixfmt = V4L2_PIX_FMT_MPEG1,
+		.min_buffers = 8,
+		.max_buffers = 8,
+		.max_width = 1920,
+		.max_height = 1080,
+		.vdec_ops = &vdec_1_ops,
+		.codec_ops = &codec_mpeg12_ops,
+		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
+		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
+		.flags = V4L2_FMT_FLAG_COMPRESSED,
+	}, {
+		.pixfmt = V4L2_PIX_FMT_MPEG2,
+		.min_buffers = 8,
+		.max_buffers = 8,
+		.max_width = 1920,
+		.max_height = 1080,
+		.vdec_ops = &vdec_1_ops,
+		.codec_ops = &codec_mpeg12_ops,
+		.firmware_path = "meson/vdec/gxl_mpeg12.bin",
+		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420M, 0 },
+		.flags = V4L2_FMT_FLAG_COMPRESSED,
+	},
+};
+
 static const struct amvdec_format vdec_formats_gxm[] = {
 	{
 		.pixfmt = V4L2_PIX_FMT_VP9,
@@ -263,6 +301,12 @@ const struct vdec_platform vdec_platform_gxl = {
 	.revision = VDEC_REVISION_GXL,
 };
 
+const struct vdec_platform vdec_platform_gxlx = {
+	.formats = vdec_formats_gxlx,
+	.num_formats = ARRAY_SIZE(vdec_formats_gxlx),
+	.revision = VDEC_REVISION_GXLX,
+};
+
 const struct vdec_platform vdec_platform_gxm = {
 	.formats = vdec_formats_gxm,
 	.num_formats = ARRAY_SIZE(vdec_formats_gxm),
diff --git a/drivers/staging/media/meson/vdec/vdec_platform.h b/drivers/staging/media/meson/vdec/vdec_platform.h
index 731877a771f4..88ca4a9db8a8 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.h
+++ b/drivers/staging/media/meson/vdec/vdec_platform.h
@@ -14,6 +14,7 @@ struct amvdec_format;
 enum vdec_revision {
 	VDEC_REVISION_GXBB,
 	VDEC_REVISION_GXL,
+	VDEC_REVISION_GXLX,
 	VDEC_REVISION_GXM,
 	VDEC_REVISION_G12A,
 	VDEC_REVISION_SM1,
@@ -28,6 +29,7 @@ struct vdec_platform {
 extern const struct vdec_platform vdec_platform_gxbb;
 extern const struct vdec_platform vdec_platform_gxm;
 extern const struct vdec_platform vdec_platform_gxl;
+extern const struct vdec_platform vdec_platform_gxlx;
 extern const struct vdec_platform vdec_platform_g12a;
 extern const struct vdec_platform vdec_platform_sm1;
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
