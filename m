Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312D3C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 May 2022 02:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v/R8j5Zh3n1GjfjjCe+r+hEVzJeZ/M74Hsapmt3XGT0=; b=VbHlKLhcDKSdGo
	cgHITqZjyXuDIHS+61fcUDVBUl+Wa99CA8WDhfSdatUFeYbpwrKoXbd+6Vez7B+1oez1CUMtxzB/Q
	dz3SV721S3eyJy4pZ0py8kcVND6oLHqvqrVlERiRHqyyNLZH+++k18L0hFpAMdRvOIEEiffKIHq7S
	+0lgs+CAy/FnOWxkeWfTK4/wTkW34mutC6YbO2/x/NwqO3zw8WDG1xCewsq7vI8ZptwI4Tcg6B7VO
	nGu5Bya+qM6gJslQZR6JIAOlscy7BfLAZClaKJcy6t8Wpjj+IwKkrDxelEV556l/9cHIE2t5aruHo
	QqyjlekOuIljIfo7dESA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noyNa-009NR2-3G; Thu, 12 May 2022 02:16:38 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noyNK-009NKZ-DU; Thu, 12 May 2022 02:16:27 +0000
Received: by mail-pg1-x529.google.com with SMTP id 31so3324131pgp.8;
 Wed, 11 May 2022 19:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X2j6TD2mIuTPKvyhgEM84vF0mnSOjtOspQG8G1GXffs=;
 b=p1OXZw6z2v4rx3gFzTZYeRYEHweMQThNO3HvXWX/Ly+fMO+GCCRNuXu+dfQF8WHB9v
 KFFCJH1uMORluOnXfEBBLx8TCFGJZk8ugaavQKyD5DBxsGpOvkbDfmTEoG+B2LEHvhIH
 /YoETu4eRXd8aafzrI/O904zSfaxqmXUXvytytIC6FxS59joxaE9RAlt+rjF2SxYvGC/
 vo+IIPoWSZFI/L0kFI987Rfajz7GVvSdBOqBoBC+dOdv9WrJD1OCdkdUDoYDd6wbAdzS
 9BaRbwXaw8rmGwVzXCkdq3T8PnhSt0S/DITRkqtZk0CXCp4DXQar5ovEVnxzov/Aue7b
 ucdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X2j6TD2mIuTPKvyhgEM84vF0mnSOjtOspQG8G1GXffs=;
 b=kAHOggWi2HDXhwuz8MaWkvfKFoLRb2DZGbXbaQnDbDlvtrjxnpU+YTCFc5wmyqX9Ks
 sLf9clNrUQYEJ8De4i+8EvRq7NNRl2Pu1gRnxN0DOB+YC7f616MGbcsFOh3XAs7jnlia
 ze68/C93zo3SvgT4d/u5HowO+FzsMkokt7NwUkzDci7+/TdFPHjgW75t+u+okGkMgJJm
 N6YfiIaRj9ED8EEQfD2j52sY+w4TxZUBaoMLXDghLQxMzoDamFsbHzHq8KyClXee3lI7
 kickvqLeypnK4Kf9XfPd8CT9pKv9B862P4zfQLoyGozLZuU909JLSqSdhIjGrkVnI/mh
 uA9A==
X-Gm-Message-State: AOAM5334PcfLhSA8iGaynFSi01wy/XlqeErSRYFQ6BgLdw2FASDVrIt1
 GAOzfNVcuAxOWbvtSbHFwR8=
X-Google-Smtp-Source: ABdhPJzwUrvw0u4Ts5wcIk8VISitjh89yUfdKrp/c3awkVtG7tvC+Yr23Yqcf/H1PK4Sm6VH/0eWMA==
X-Received: by 2002:a63:5902:0:b0:3c2:43c8:dff0 with SMTP id
 n2-20020a635902000000b003c243c8dff0mr23291690pgb.385.1652321780960; 
 Wed, 11 May 2022 19:16:20 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 k12-20020a170902c40c00b0015e8d4eb292sm2590167plk.220.2022.05.11.19.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 19:16:20 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Carlo Caione <carlo@endlessm.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] ARM: meson: Fix refcount leak in meson_smp_prepare_cpus
Date: Thu, 12 May 2022 06:16:10 +0400
Message-Id: <20220512021611.47921-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_191622_515341_588BA571 
X-CRM114-Status: GOOD (  10.41  )
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

of_find_compatible_node() returns a node pointer with refcount
incremented, we should use of_node_put() on it when done.
Add missing of_node_put() to avoid refcount leak.

Fixes: d850f3e5d296 ("ARM: meson: Add SMP bringup code for Meson8 and Meson8b")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/arm/mach-meson/platsmp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-meson/platsmp.c b/arch/arm/mach-meson/platsmp.c
index 4b8ad728bb42..32ac60b89fdc 100644
--- a/arch/arm/mach-meson/platsmp.c
+++ b/arch/arm/mach-meson/platsmp.c
@@ -71,6 +71,7 @@ static void __init meson_smp_prepare_cpus(const char *scu_compatible,
 	}
 
 	sram_base = of_iomap(node, 0);
+	of_node_put(node);
 	if (!sram_base) {
 		pr_err("Couldn't map SRAM registers\n");
 		return;
@@ -91,6 +92,7 @@ static void __init meson_smp_prepare_cpus(const char *scu_compatible,
 	}
 
 	scu_base = of_iomap(node, 0);
+	of_node_put(node);
 	if (!scu_base) {
 		pr_err("Couldn't map SCU registers\n");
 		return;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
