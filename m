Return-Path: <SRS0=KUqV=M5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60D5C4338F
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Aug 2021 09:40:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 753D560F35
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Aug 2021 09:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 753D560F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xalntyAKzi1JxMb9xu4ZxBDspUS03LPxhcHxjpvooX8=; b=a+Mz1Vf0kJqQd+
	5txUMN+T2tf32EfsIZ9SfAKRYMsEFn0e6/X9SA/qSemqIweqqXz91MPNU2u9lnNp0bCX4fwJQ/JyO
	ZedCGXujGQdjtjSbQjY6i9qjGAbZkTcW5WrbKQeSaAUlh++v/6L34eY22TQ/78dS1UuKcIYqo8DFx
	xdKWjOgeiM69HNGNuakvRbsmO5+lxhVGvxUiqclkle3y+pbptkCqbhWKtuTdaGtCtegJ9z7jUzVNT
	DUHeVVNNiNSB4tBTqJ7/UzRzbJJLaMWi4YZsjbXtR4hzsL39ICTfpbgodc7shsAvv6sn6fcXFHWag
	J5sglWGEW9MddiK/IuEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBwLB-00C0d7-JD; Fri, 06 Aug 2021 09:40:33 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBwKq-00C0Ye-4j; Fri, 06 Aug 2021 09:40:13 +0000
Received: by mail-wr1-x42d.google.com with SMTP id c16so10246248wrp.13;
 Fri, 06 Aug 2021 02:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=il1yIk46p3XJvX3l/iCGJYKMOJQDsOFZaHzkEJnhC4s=;
 b=nuIeU29wdllClgvVY6ItDDkgkpA8H4BEh+o72svM8IPYyYmZshm50ziyU08GQlpoy6
 zCmVfaOPjzS34DbHZFM3V5AvFXfkROl5vKglIau9BvFd8xu2HMyJxOyNtA6SUitThN+v
 9bHglfZMHe4scgotcxrovRZdRYMZUwWHhe0iX8qZNGvuoqaEN8Tvp1J7UAsWDugQENxW
 FAStR3oxkRhzTmYCzUJVcUWlE3EGRJb4FtuWyd1b6M4kWCQ8JYgCY/5cIRRcrwr9n/3e
 lA0Y8Iaz8m4BnBSy4ebRlE2koMb5KtmNFuZRW74iC0/ZoA+zUgLljl0SiNtOkglNPup6
 cesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=il1yIk46p3XJvX3l/iCGJYKMOJQDsOFZaHzkEJnhC4s=;
 b=SOa+LB+QA3P+IySxeBYkWFefaMdz17IkoMhUos9AL3yS2ETCSbgIZ5D9q5CMZ2aLFJ
 mQHWS32qWfTepkj4zXYqGABBwfccmVKFkqwGi9nbGT+N8TDBPCknD6OkD3L1/NjEo7bz
 Z+3fPy1qscoe02CQceGJh5Ba2KSjxVmVCaY7VRfhwruEUpFgUuRO5nbdfMg6s8fsVzzJ
 qGFJ2lQXs5NYISaNbjaFjLahDw0npWdpGRWkHWZFhxCklwpVSvKiG4E/iyPNfiT8dU5d
 xf/xJ3sOivH9RUpWkDRFUJi96k+M48eBh4YvGOx3iE1XO2ZMgJivI7RF+4rIE1dSvGBe
 ndMw==
X-Gm-Message-State: AOAM532uNKMZXd6gxRNQiyiJoo84kmfnhXkSV1sAFZbHdIDt8CZHxIqZ
 CGhTX6h/nAICyr/jkMmUuSE=
X-Google-Smtp-Source: ABdhPJzhi0NyuKsSrjL5UsR5Pm0H4x173l7Ah+PDgzXqIso2NXSwu3FUoCGjvRK7wUSBnGn0vtdXLw==
X-Received: by 2002:a05:6000:18c2:: with SMTP id
 w2mr9680891wrq.282.1628242809760; 
 Fri, 06 Aug 2021 02:40:09 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id l2sm8846032wru.67.2021.08.06.02.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 02:40:09 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Mathias Steiger <mathias.steiger@googlemail.com>
Subject: [PATCH] drm/meson: fix colour distortion from HDR set during vendor
 u-boot
Date: Fri,  6 Aug 2021 09:40:05 +0000
Message-Id: <20210806094005.7136-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_024012_226756_675B4AC1 
X-CRM114-Status: GOOD (  14.19  )
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

Add support for the OSD1 HDR registers so meson DRM can handle the HDR
properties set by Amlogic u-boot on G12A and newer devices which result
in blue/green/pink colour distortion to display output.

This takes the original patch submissions from Mathias [0] and [1] with
corrections for formatting and the missing description and attribution
needed for merge.

[0] https://lore.kernel.org/linux-amlogic/59dfd7e6-fc91-3d61-04c4-94e078a3188c@baylibre.com/T/
[1] https://lore.kernel.org/linux-amlogic/CAOKfEHBx_fboUqkENEMd-OC-NSrf46nto+vDLgvgttzPe99kXg@mail.gmail.com/T/#u

Fixes: 728883948b0d ("drm/meson: Add G12A Support for VIU setup")
Suggested-by: Mathias Steiger <mathias.steiger@googlemail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Neil Armstrong<narmstrong@baylibre.com>
Tested-by: Philip Milev <milev.philip@gmail.com>
---
 drivers/gpu/drm/meson/meson_registers.h | 5 +++++
 drivers/gpu/drm/meson/meson_viu.c       | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
index 446e7961da48..0f3cafab8860 100644
--- a/drivers/gpu/drm/meson/meson_registers.h
+++ b/drivers/gpu/drm/meson/meson_registers.h
@@ -634,6 +634,11 @@
 #define VPP_WRAP_OSD3_MATRIX_PRE_OFFSET2 0x3dbc
 #define VPP_WRAP_OSD3_MATRIX_EN_CTRL 0x3dbd
 
+/* osd1 HDR */
+#define OSD1_HDR2_CTRL 0x38a0
+#define OSD1_HDR2_CTRL_VDIN0_HDR2_TOP_EN       BIT(13)
+#define OSD1_HDR2_CTRL_REG_ONLY_MAT            BIT(16)
+
 /* osd2 scaler */
 #define OSD2_VSC_PHASE_STEP 0x3d00
 #define OSD2_VSC_INI_PHASE 0x3d01
diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
index aede0c67a57f..259f3e6bec90 100644
--- a/drivers/gpu/drm/meson/meson_viu.c
+++ b/drivers/gpu/drm/meson/meson_viu.c
@@ -425,9 +425,14 @@ void meson_viu_init(struct meson_drm *priv)
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
 	    meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL))
 		meson_viu_load_matrix(priv);
-	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
+	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
 		meson_viu_set_g12a_osd1_matrix(priv, RGB709_to_YUV709l_coeff,
 					       true);
+		/* fix green/pink color distortion from vendor u-boot */
+		writel_bits_relaxed(OSD1_HDR2_CTRL_REG_ONLY_MAT |
+				OSD1_HDR2_CTRL_VDIN0_HDR2_TOP_EN, 0,
+				priv->io_base + _REG(OSD1_HDR2_CTRL));
+	}
 
 	/* Initialize OSD1 fifo control register */
 	reg = VIU_OSD_DDR_PRIORITY_URGENT |
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
