Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FE7C43444
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFB2620657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 16:18:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rauQZF/A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="II19F0FN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFB2620657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9CibLNChtqu3aAaf69wovgDVTbubWJPAc/ikW/np+0=; b=rauQZF/A/xCgmS
	BbXRxAB4qS5tcRxqYn12523Yr9naesfm2KyR75bJaoUjA5cIcqQWpn8JFd2EOnSL/Yu7tGg+kTMpI
	DSw/Ny2gMkRutXD7l2vJZkys833pxkPy94eM6qQtE2i4eRv3fETVA2t79sECrY9ihs7DQW3T01gkD
	Lir0nP3eizSpcEC7HX4mVBXfl/izcnoVWCWfCZrP9gebch4AC1UNiMr98gJYBp1x3/j4suTpAFdWH
	EJDsakwaS5iTTJDjXIePeIscTitQq1+q/Z/UeY6kRex2kuT8ZnbxtsxmD9txFbKFAZQNC6j5TEW+n
	vOnT8o6Uvd82UO6Kt2NA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjRQ3-0007K4-Q3; Tue, 15 Jan 2019 16:18:27 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjRPq-00076o-PI
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 16:18:20 +0000
Received: by mail-wr1-x441.google.com with SMTP id 96so3649195wrb.2
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 08:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GBqclzFqIFLztc9h8WGYLdLuct+zMbJMkmtRrNk53Hk=;
 b=II19F0FNZFFDe8RMZvKDjcleqpK9FhOH+MyxUeEYL+3nQxlTgyMkJ1e8Xgx6Y9t5fn
 o/1Au20ZuSoH8/lnhY1zz1oDf1QahNaPWrR3Pu79TUe0hLF2PLeydeXihfGiCNYsqCwi
 j59vNuGYKKLAJbVaa/QeXZIu3ooBgX5Y9gzZhXBUTjBc+N4v3tHFOQihyvA0kuthdSXE
 HZe+sKwfehpIoOxud5IoFJW5ppZTPfqomTpbc4/QOK23Ki26HS+Uc2Lqgs6HVEtqX4Bv
 Uj+n+CACW+ENhphvgJXERYxOoz0sdJCgqoi41LejG6vgOfbAfEm83GqoG9alDpUSlLBj
 pCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GBqclzFqIFLztc9h8WGYLdLuct+zMbJMkmtRrNk53Hk=;
 b=H1s4cyqabFDnNjm/wJtVDrjvYqJSZy+XJ0vG4dQXx3SQQ1T01uGJwvo1AmfeIhv0JM
 pGD+YeZXI6tajvrIR7RLnh4GGO4BQQTCiqXaD1Dta+U6b5csqkEC3LyviblLVUWy4O8g
 QQaECakZyMNGTUmeicUInTYg9IpHwtHPLApeoesUrS5WaOAEFpSTi7DiqnR+l09LWp87
 +xXIQXY0jHkYeMvqbubtxW7Hdtg6MyUhQ2lyGo4HwbkoeXTITJkzQvYbGveIneuoARja
 imMFWAhiMReIZnBs3c6uN1pB6WvBV6bFw3oX1/DTAXYpi7V1N9n7mT3ybiEkcA6dAZp3
 wpWQ==
X-Gm-Message-State: AJcUukemSEiQxwAznJfRcusqrQ5TloqndHYHSvDa3Ht8gJnb3zrdIgUA
 n3/3fWLmm04p8hCmdXnvd+yWD8qTFR1FzQ==
X-Google-Smtp-Source: ALg8bN7jfQ2B+Wni/fl8rG7HKKZY6IAld2g2tBqZuzMt6ACm9HswPJfvxqn0sZJnuIdzAib4XtXSag==
X-Received: by 2002:a5d:4d11:: with SMTP id z17mr3588452wrt.209.1547569093177; 
 Tue, 15 Jan 2019 08:18:13 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o81sm54014829wmd.10.2019.01.15.08.18.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 08:18:12 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: agust@denx.de,
	u-boot@lists.denx.de
Subject: [PATCH u-boot 08/11] arm: meson: board-gx: Setup VPU in fdt
Date: Tue, 15 Jan 2019 17:17:56 +0100
Message-Id: <20190115161759.1657-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115161759.1657-1-narmstrong@baylibre.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_081815_155561_3A630945 
X-CRM114-Status: GOOD (  10.16  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Maxime Jourdan <mjourdan@baylibre.com>

If VIDEO_MESON is enabled, we need to setup the fdt for the framebuffer.

Call meson_vpu_rsv_fb() which reserves the framebuffer memory region for
EFI, and sets up simple-framebuffer nodes if simplefb support is
enabled.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/mach-meson/board-gx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/mach-meson/board-gx.c b/arch/arm/mach-meson/board-gx.c
index e41552db52..5b0126a72e 100644
--- a/arch/arm/mach-meson/board-gx.c
+++ b/arch/arm/mach-meson/board-gx.c
@@ -9,6 +9,7 @@
 #include <asm/arch/eth.h>
 #include <asm/arch/gx.h>
 #include <asm/arch/mem.h>
+#include <asm/arch/meson-vpu.h>
 #include <asm/io.h>
 #include <asm/armv8/mmu.h>
 #include <linux/sizes.h>
@@ -65,6 +66,10 @@ void meson_init_reserved_memory(void *fdt)
 	/* Add BL32 reserved zone */
 	if (bl32_start && bl32_size)
 		meson_board_add_reserved_memory(fdt, bl32_start, bl32_size);
+
+#if defined(CONFIG_VIDEO_MESON)
+	meson_vpu_rsv_fb(fdt);
+#endif
 }
 
 phys_size_t get_effective_memsize(void)
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
