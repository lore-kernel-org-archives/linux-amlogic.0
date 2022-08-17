Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E78C25B08
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Aug 2022 14:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jEfIoqsskG+32U/mMQucTkmRbV78Nh9Udtz//EQWi1c=; b=fOduBY8M/ne1Lr
	JCNoNYXPONX/uXAsYsseVjxejA08dd7wzFYUymquMOk0evucBHCsxyHKPbphoZVN0va5Hy5X4GMYY
	BeXhmVYrmLFKXrhs/64kNvEDIDj/owJgIRliHpKP8BPwqlFXA3yZfQUX0MGF3ATjYb7cJ27HniUKV
	/OIQZJLmdeEShQx3SoD2EMhV82UqtbK0MLNCUxgUQvk9EH1iSCNv1tQwk86MPADrEtYayg6J1ZO3d
	Zq83tILjYw37WTI8MoqsZ6mWV4blBrK/NhLDJnrQbtUM86WlECq/2PJ2Fdf2fFv/4D76SfzdNXWpn
	1fsfUs/iW9MUcNWMx+/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOJgS-002fWp-UX; Wed, 17 Aug 2022 14:06:12 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOJgN-002fQa-JF
	for linux-amlogic@lists.infradead.org; Wed, 17 Aug 2022 14:06:11 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 92AA63FBB0
	for <linux-amlogic@lists.infradead.org>; Wed, 17 Aug 2022 14:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1660745158;
	bh=kSCXGcq5H05zQq19jPsNfhJBW132uDa7sGBTwXgYgjg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=KBbSNTjXgKB+hfMjyZXcHlrE4zw1iZCQ4ydhUPhr7NzVd+HkWp2zAQERmXZr2Bk9U
	 a+GxDlEDHEvvkA66dHHxRr1XeQtwNkGYdnU/elZFwEYL+NN88VkJDmYw8Po7FAWmNP
	 dgDWk1pzTvEj2xvBfknUamhZe/Hca+aZmPtFlfz534eSVP81tdjmw+793CKchrjmph
	 vOW4kE7xSHVCjF7oYM0Mp/JIqKyjg+AvutW9mHwCu/A6+BBo1QRmg7w0l9viD6WXgL
	 RvdR2Bu61L28FfWdJpOnzc0IcnyM4TxRaHIBpT5vg/V0c76lr3xd5HWTeg0Nd9alzG
	 pz3fy4K4FBMXg==
Received: by mail-ed1-f70.google.com with SMTP id l19-20020a056402255300b0043df64f9a0fso8893396edb.16
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Aug 2022 07:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=kSCXGcq5H05zQq19jPsNfhJBW132uDa7sGBTwXgYgjg=;
        b=qeLSmbiMP+tTgp6zx2UOAxW7DcG5WY4TN2yodDBbiK7S13TKLk1r/GinYpjvAuy8by
         q315R6T/yJb7T4IvaxY5kvtBV0HJnYKvdxOfsakbJ/hjjEAOahT5q0cnRL1zr/DmL7ll
         QRWL3TTwDh/EgHIwu7HYHylCQYn/VbcqwCvgVup1jXAT/nmtheKQ10f0q316u5LXZvBK
         WRTtSzxtUeLOo8xxwybLXR5VURi4PqSmC9ALfNr6u2myuSE/8vfOp/L+XHPJShj+aWav
         hPHyz15wpTp3AzXsTgFx3Ga3zLlEDtlhWWiTJ+Wv90mcjrl8HE1TbtU9/MY94xMWptsI
         +8sQ==
X-Gm-Message-State: ACgBeo1xfj6CnwyXQn44IU2NWD9vT69cN7anPNf5R/Ol7U2Wn751rkIB
	6iCYSOJfqxgEnYK2XaouU1a6H0GPwU2A0lJK9xVW5hmKbl0HC4u5LhTh1iK4hG25DOJV0gCJdh+
	xSbb2B2ZoqnHFv8LqLvMiv6RPsWvUm1CMSELJ8RnlSka5UQk2
X-Received: by 2002:a17:907:2814:b0:738:545f:54be with SMTP id eb20-20020a170907281400b00738545f54bemr9113440ejc.534.1660745158188;
        Wed, 17 Aug 2022 07:05:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7vF5bJb6zsBPhAQ1W8GKZlyq4EQV66kfHwkKI4Mx/QZf+aSWQo229JOM7T+wVina/z5et9Hw==
X-Received: by 2002:a17:907:2814:b0:738:545f:54be with SMTP id eb20-20020a170907281400b00738545f54bemr9113413ejc.534.1660745157911;
        Wed, 17 Aug 2022 07:05:57 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id 23-20020a170906309700b0072b342ad997sm6737603ejv.199.2022.08.17.07.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:05:57 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: narmstrong@baylibre.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: [PATCH] media: meson: vdec: Add MODULE_FIRMWARE macro
Date: Wed, 17 Aug 2022 16:05:39 +0200
Message-Id: <20220817140539.150013-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_070608_400042_D8E3486E 
X-CRM114-Status: UNSURE (   7.51  )
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
---
 .../staging/media/meson/vdec/vdec_platform.c  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
index 88c9d72e1c83..c7750d4be848 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.c
+++ b/drivers/staging/media/meson/vdec/vdec_platform.c
@@ -280,3 +280,23 @@ const struct vdec_platform vdec_platform_sm1 = {
 	.num_formats = ARRAY_SIZE(vdec_formats_sm1),
 	.revision = VDEC_REVISION_SM1,
 };
+
+MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");
+MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");
+MODULE_FIRMWARE("meson/vdec/g12a_vp9.bin");
+MODULE_FIRMWARE("meson/vdec/gxbb_h264.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_h264.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_vp9.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_vp9.bin");
+MODULE_FIRMWARE("meson/vdec/gxm_h264.bin");
+MODULE_FIRMWARE("meson/vdec/sm1_vp9_mmu.bin");
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
