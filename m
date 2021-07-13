Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D2AC07E95
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 05:53:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E04161008
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 05:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E04161008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xi6kcauRzxiKC+NuIRZOLujUDxilSDWSU+2G1WrWLB0=; b=qYTEjv/TsZyeKw
	WuX1hmSErblXp4mld6gkarv4o6NVK1MWLHhaehnp/Y2bJejUrdQAKBRiomKb0p9pAN4Zalu11hcTK
	NWr4ngGHPk1iXPGBwbb2rBXkOEbK5V7YxBHFfnGhjVYcDtNCbUn3Mz2vacwSulNljttmYupEscsws
	8EsDhQPFPOEqqF/kx4VtRF2SHf+6KaXhsdZexn011CFQPEBnVhzoXGsm5GTsALfudS9QgPoKY4O7g
	BHFLdRUnziQZJ4FTAT0+0SZ4rjEbMwQ3DpVKyjZPsQW1QX5wODuVMrCMe7FY92ISuMt0XFin59orC
	MuP1Sw29IcgW+LPBtqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3BMN-009Bfb-6x; Tue, 13 Jul 2021 05:53:35 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3BM8-009Ba2-RB; Tue, 13 Jul 2021 05:53:22 +0000
Received: by mail-pf1-x432.google.com with SMTP id y4so18532910pfi.9;
 Mon, 12 Jul 2021 22:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Apgi9n+xzAXbVBKSBVdWWRXmCTfXVngS5mFHrsICTMs=;
 b=B3ioeD3woNIR4eb4hYTJ1NhFODGfBWkLQ9pbW53Ntmb0NMuamJ68xfCoZup2ihwriq
 wDTdzx1v3MTl+aAOIs/ekQHiM/aKejL/nxL3x8BJdgipqgLE3wFo2YPg7ldQwfZea4Bh
 3dsNR7dD8JwY6QQ2KB7P8/RzBAAwf8aHWGHO0/clNBOfbGfL4AmVcKQUN807hxODN6gB
 EUucJO5xCUoV6wfDQ4zA+io413074TdWGFJDSU724W7lXds6Wxjq1TlPvEoMA/3pYU+w
 XDDAiUfnXdayzbwwUm8THqEOFh/pkzRqJDOxCfHAdJwf3vkbSZKByKaTbKEVRNfUWDO6
 ny8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Apgi9n+xzAXbVBKSBVdWWRXmCTfXVngS5mFHrsICTMs=;
 b=g+HqWscRzYJBvnziF7/1ZRonxCTR0olILwIywFdYfCkhTB/Bronp/qfhyinkeKHApc
 m6Vy8i4nzxB463yEDc4LBMIeR5WLUZvdOso26Se94B5/FZCz2WsscOvvkQLXPlJuZInw
 UJsNqf9KEsj+v2z/r9OMnxmP99waQnI61UnEbiSAL0riLOY6bdkaoEQN0+F7Qli91q3/
 Qffj5fmkeG4FAorVFrf87QBmaGXRm1A8o0N7r2J5h1J6sQMOKKmuEar9X8B2/Y2dTdcj
 F2dVmMLmociPkCUsJgFfvoC6JXYDvZsAm+AfvZfb95Qvp6JwyWl95UZmfJ+0eULXs0if
 wWYQ==
X-Gm-Message-State: AOAM533602FtJ2UBu2rt/+Ob3Ar9cmCmZSzzvuIsxLJmtvvCJ9zL0Q1U
 vAaSg3zmaHVwxLnssfD/1cr34LzGYvU=
X-Google-Smtp-Source: ABdhPJzxR8bJEgTzU8kGrjBoNAgSB6f2OziGqch2oqIf2DEC659r67p0cjibkB2R9Nn/dIX5P6vx4A==
X-Received: by 2002:a63:e205:: with SMTP id q5mr2716251pgh.404.1626155599825; 
 Mon, 12 Jul 2021 22:53:19 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id x19sm17755198pfa.104.2021.07.12.22.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 22:53:19 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>, devicetree@vger.kernel.org
Subject: [PATCHv1 2/3] phy: amlogic: meson8b-usb2: Power off the PHY by
 putting it into reset mode
Date: Tue, 13 Jul 2021 05:52:14 +0000
Message-Id: <20210713055227.1142-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713055227.1142-1-linux.amoon@gmail.com>
References: <20210713055227.1142-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_225320_935309_9A0A490D 
X-CRM114-Status: GOOD (  11.69  )
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

Power off the PHY by putting it into reset mode.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Fix the commit message.
rfc - Keep vendor driver sequence for the power on reset of usb phy
[0] https://patchwork.kernel.org/project/linux-amlogic/patch/20210617194154.2397-8-linux.amoon@gmail.com/
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 03c061dd5f0d..2aad45c55494 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -219,6 +219,10 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
 	clk_disable_unprepare(priv->clk_usb);
 	clk_disable_unprepare(priv->clk_usb_general);
 
+	/* power off the PHY by putting it into reset mode */
+	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
+			   REG_CTRL_POWER_ON_RESET);
+
 	return 0;
 }
 
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
