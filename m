Return-Path: <SRS0=MQG/=KT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00943C04FF3
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 18:01:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B770E613FC
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 18:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B770E613FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z/Y7/tc3vmqPwaestodb0K09mmtuVi6MsDiddvR3w70=; b=Jt8gEJVcOQorBU
	KMPgiN+JWXDHMfCY4oHzdnV9+5n94ohNQjNiC6GIZi2NzBXQjYENgbMAWEQRZdpenqNYXvY0D2bx2
	G+lqdcPhDaPFG/hyqZv10ws5ZoPSYqI7S/6s+JzkCtiFAXbVPmpaX+AeC5VPJrHEAb9Qg0k2Rdy+i
	xfRdtlyDMfaSlQaq9hToHqR0YGQ3ZQMnselZYh6IfahPm4ZfI2IUabxw2bmvnBL9XJogjsMT6G5N0
	9u3Dzh7PZy6G9/c5ti7lmWUw+wTKL9FfvFsCR/0d6q1dmKdDLqy/jfo5Gv6reyMgtLyQvLgchwUJ7
	ieHWJ35gVESPjW7wcCOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llEt7-001NYG-As; Mon, 24 May 2021 18:01:13 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll85l-000qIf-Ob; Mon, 24 May 2021 10:45:51 +0000
Received: by mail-ej1-x62c.google.com with SMTP id z12so39599158ejw.0;
 Mon, 24 May 2021 03:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4uYH7l3s8AJ5oxtod3enPxI8aB3pIk6ye1nfYSwYWoM=;
 b=R2Mx72dVHtO2EcIknrLn1vIqr/SLh7csM9MpN8Bf5/0hnQL9hOZLwFcKjzZNgR6Z+M
 oRSAI3YBS7HbIQIQZmI8T7KdMhE0cQpyUyLXQ6arDdZgiqJwDb7TZbBNQNS01jKxKHGC
 1yL5//L7ed2ktTYM9SbftynzOwfIfBHFRziby3EtaOP/q466biY50vcAelfeOaLK0066
 VDeGyn7xtyepa4HCp6Y9x/VdPur4HE1stAAxAbKw8rbOHBqcKpk/Bc6KD8767zx0/Ggj
 bCa682m2pMDrYC0Wc88IQM3VDG68yG7TwKqqLjp3r9O/Rwg5Jwy7VL4TGfLKHoE/pOQU
 D5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4uYH7l3s8AJ5oxtod3enPxI8aB3pIk6ye1nfYSwYWoM=;
 b=BjiVEp1dEOjgaf+WmzImHUC87i95s23yvF1v5SYsJHrdARNp4DTwW2xm2nedeMjLfC
 o9pU3B0e3AdgVdC+P4/1d44+EMD0KBjuMV5SUo/Rdz8ZRThHsYxD9VmoiOt55VVNTJeh
 tHRECYsE2+aepbF3uNvQRtImrRZQUEPPCANkWZb8LunUVWM8s+lplEbHaLpsv4WJWHbK
 Apu7AICkhFXfHCAUdhLubaqZTGG3w05OtFjYerqmJDHRgpPuEJy+9uFMFvPWMNBQBeiy
 3uBzomK9Gonsgf9gvC7GbwFbw5bAVTeTz+muV11dfpvYq6fC81vAMsCzboNIOtDVe0tP
 eoVA==
X-Gm-Message-State: AOAM532sju9+s+wNPxTW0DhYUUWe0x0ph/Mg5NKenmzZn/O806AkZG/O
 nHnJAaIIcQ1AgZa4bHWzmjs=
X-Google-Smtp-Source: ABdhPJw6FO3UuCOkGcIaxil8laXrc8QAy8cWzmS5WrzZyDxU8cYGX44Pu+ss0J54YxVWokIBHEJ+sA==
X-Received: by 2002:a17:906:4e0d:: with SMTP id
 z13mr23048071eju.343.1621853146627; 
 Mon, 24 May 2021 03:45:46 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1370a3a00f22f74fffe210725.dip0.t-ipconnect.de.
 [2003:f1:370a:3a00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id n24sm9162451edv.51.2021.05.24.03.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 03:45:46 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Cc: narmstrong@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 khilman@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] clk: meson: meson8b: Don't use MPLL1 as parent of vclk_in_sel
Date: Mon, 24 May 2021 12:45:33 +0200
Message-Id: <20210524104533.555953-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_034549_833643_4D7917DD 
X-CRM114-Status: GOOD (  13.88  )
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

MPLL1 is needed for audio output. Drop it from the vclk_in_sel parent
list so we only use the (mutable) vid_pll_final_div tree or one of the
(fixed) FCLK_DIV{3,4,5} clocks.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index a844d35b553a..f8bd211db720 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1154,6 +1154,10 @@ static struct clk_regmap meson8b_vid_pll_final_div = {
 	},
 };
 
+/*
+ * parent 0x6 is meson8b_mpll1 but we don't use it here because it's reserved
+ * for the audio outputs.
+ */
 static const struct clk_hw *meson8b_vclk_mux_parent_hws[] = {
 	&meson8b_vid_pll_final_div.hw,
 	&meson8b_fclk_div4.hw,
@@ -1161,7 +1165,6 @@ static const struct clk_hw *meson8b_vclk_mux_parent_hws[] = {
 	&meson8b_fclk_div5.hw,
 	&meson8b_vid_pll_final_div.hw,
 	&meson8b_fclk_div7.hw,
-	&meson8b_mpll1.hw,
 };
 
 static struct clk_regmap meson8b_vclk_in_sel = {
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
