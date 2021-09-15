Return-Path: <SRS0=XSrd=OF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD34FC433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Sep 2021 01:47:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F64D61211
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Sep 2021 01:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F64D61211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dSyN61SoQVRXyHo/6kuQ0yvtCXQoZM6b7A8I/e6GeLk=; b=A5PndZNOCTA8I0
	qpgK5LPs4pqdo6rtMmY2KPbrpzdFoG6vnvkr4zzJVFmb+cYNGh2Eu1s+igY9OILL13Y4Ln/w24O32
	w6efpEzTq8+TZdEbvlztDcrdo/bClslYg0hEsV7MD5ZoqeEo4Fto6wN0tvvrUIZW1P5mXJZBGwi+s
	jSHGfvBflfXRgtuPX3V1BhFtnEGy6LkvUlItmk+5nVGUT2so3y8obcHdto3fp11wEFkU3ghRY7bD5
	jKC9UA3w7BOfHxs6PXmXVcad8si01s0yngP7sa0H4EmzEJ/R8w6fAnzxnA8zEeSudQLosK9cfqJMv
	njc6jeSoIqE5N1DRTKLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQK0y-007qwu-H2; Wed, 15 Sep 2021 01:47:08 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQK0w-007qw7-8k
 for linux-amlogic@lists.infradead.org; Wed, 15 Sep 2021 01:47:07 +0000
Received: by mail-ed1-x534.google.com with SMTP id 9so1746331edx.11
 for <linux-amlogic@lists.infradead.org>; Tue, 14 Sep 2021 18:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EqBYcje6ZG5ZL83O2bsB1ZjTxRx+Mh9gCTq4M3kFGrs=;
 b=EIi3vObTqMVf5qMPgPCjEvT5B1pAgSClvJOo3AmJlCMUBMzA9uq10/lQpLVEj9OpTe
 0fUvIicmldPK0tphrEBGLqPPaPXk2xj0yF0WVUWQ+UtABD8l7de8PTHxQceetNqdQ1Ip
 3Ra6HmCgaRGZDMKpxNT2edBzplTKhDk98fbptoYawPhGynpmflL4p1ZTL3CCQA1haj4s
 AA1BfhZsmbBpwPaDsc5bPCkhMItk+Zj1IhrakB4UdfBeW+w9ZbvWUOE1rt0UlJOHCuMo
 ZMFByZ55s5DIVoLo4x43G9OiqJQKDgtC51rDIhVavN+vrNFVmU2QLFcoNfCy7cZOj0Fd
 lIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EqBYcje6ZG5ZL83O2bsB1ZjTxRx+Mh9gCTq4M3kFGrs=;
 b=GIEPz+C6lHkWCJRizqkbqEa47z36woXtxr3FjW3utw5pCJL4DbftX68y1chjvfjCbR
 6UCcPk/PPw9h0MA8GBXZYgI2p6xjHiZLYPKFF6vQuXA8Uv4rkf4dSRd2NkFKCnT/rZuT
 BJLDUEk2gX68Ay9KH51AtaKYa3sGMEOaX4Qj9cYy0tfP11+5WQyN1RZnBTM2W/zMif1i
 vGT4+pGF3J7ZIAj1iEGuNY1vI5DGy26CLH8/y0jAUePA6PbRN7fR7I9nndXV4SYTl4Vh
 tE0PXZaQcS6xCScnEG/jMx6Hv0ptFYnVY+fPCo9yQzEEd3wbscKrb69D3x6L9MxDpW0Y
 eSAA==
X-Gm-Message-State: AOAM533hqApo5vip0DHw2l5/m++qsWIo0qBNB9HoF7yfRrbNDHjBxrxL
 dZtVuXPX6wwsaxqb6YIgNOg=
X-Google-Smtp-Source: ABdhPJxjLilsYRYYzd6MvMC1zj58uj5/byqRbQ5XZtCb8QJ2fQeIKMxLIYmde80p2GUkvoS+7WbT3A==
X-Received: by 2002:a05:6402:5c2:: with SMTP id
 n2mr22896569edx.239.1631670424817; 
 Tue, 14 Sep 2021 18:47:04 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id a15sm6601835edr.2.2021.09.14.18.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 18:47:04 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de, u-boot-amlogic@groups.io,
 linux-amlogic@lists.infradead.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 1/4] ARM: dts: sort Amlogic Makefile section
Date: Wed, 15 Sep 2021 01:46:56 +0000
Message-Id: <20210915014659.5336-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210915014659.5336-1-christianshewitt@gmail.com>
References: <20210915014659.5336-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_184706_341218_3FADE2B2 
X-CRM114-Status: GOOD (  10.11  )
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

Alpha sort the Amlogic dtb list (same as the kernel).

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm/dts/Makefile | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index f0160d2dc0..461448c579 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -158,6 +158,7 @@ dtb-$(CONFIG_ARCH_S5P4418) += \
 	s5p4418-nanopi2.dtb
 
 dtb-$(CONFIG_ARCH_MESON) += \
+	meson-axg-s400.dtb \
 	meson-gxbb-nanopi-k2.dtb \
 	meson-gxbb-odroidc2.dtb \
 	meson-gxbb-nanopi-k2.dtb \
@@ -165,22 +166,22 @@ dtb-$(CONFIG_ARCH_MESON) += \
 	meson-gxbb-p201.dtb \
 	meson-gxl-s905x-p212.dtb \
 	meson-gxl-s805x-libretech-ac.dtb \
+	meson-gxl-s905d-libretech-pc.dtb \
+	meson-gxl-s905x-khadas-vim.dtb \
 	meson-gxl-s905x-libretech-cc.dtb \
 	meson-gxl-s905x-libretech-cc-v2.dtb \
-	meson-gxl-s905x-khadas-vim.dtb \
-	meson-gxl-s905d-libretech-pc.dtb \
+	meson-gxl-s905x-p212.dtb \
 	meson-gxm-khadas-vim2.dtb \
 	meson-gxm-s912-libretech-pc.dtb \
 	meson-gxm-wetek-core2.dtb \
-	meson-axg-s400.dtb \
-	meson-g12a-u200.dtb \
 	meson-g12a-sei510.dtb \
+	meson-g12a-u200.dtb \
+	meson-g12b-a311d-khadas-vim3.dtb \
 	meson-g12b-gtking.dtb \
 	meson-g12b-gtking-pro.dtb \
 	meson-g12b-gsking-x.dtb \
 	meson-g12b-odroid-n2.dtb \
 	meson-g12b-odroid-n2-plus.dtb \
-	meson-g12b-a311d-khadas-vim3.dtb \
 	meson-sm1-bananapi-m5.dtb \
 	meson-sm1-khadas-vim3l.dtb \
 	meson-sm1-odroid-c4.dtb \
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
