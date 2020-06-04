Return-Path: <SRS0=K8/M=7R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BEC8C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Jun 2020 04:48:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F21582072E
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Jun 2020 04:48:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ihBqDd0b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJpHUHZJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F21582072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=L81c2JBPAxg3gea9BuHQCKqAt8EolA+9NlgZ7i3gYH8=; b=ihB
	qDd0b/v5pcXHylcbnkA199UWm96NueYmUI9jsU5tSBdhgwOnufPIqDFMA8OV5UP+2aHHEYEgLJ3Ze
	oE2j734Svs4Q5BY2Mu5LskpwWszQeoJGTosnvfO65QzeBaPCcyoJSMqN7YSzN9+yYj1qJK/tvU61z
	2yXf+btTnfYpO8Ge9lWFCPyoaJompPEdxFXgBR+trfBQalMPslJzbIP6eqvUtdjopcdyhfz9Ml3d1
	p1g9P+Boj2YW5cXgLoTTcyJLVSjCqvXYNJ9OoNKscJzcCDX3IwJ/u1BOxX1CY15J0YyKnGc6h0xtm
	rMt9NZe1C1fp0laEzwVL1O4KwGN4fBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jghnj-0000fJ-Mg; Thu, 04 Jun 2020 04:48:23 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jghnc-0000VP-TR; Thu, 04 Jun 2020 04:48:18 +0000
Received: by mail-wm1-x344.google.com with SMTP id d128so4184601wmc.1;
 Wed, 03 Jun 2020 21:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=NiqkpM/w+JZs4P0eo38xaVvQUC+7sYCnFp9tM9zgNlA=;
 b=RJpHUHZJ5rtlH079jZ34c9Ewd/nRRN5UOZHSp+yOrq7oq1X1YRuhV/xC7y/GC99ETN
 r1z6+NUygzg7z4z1CLlUN9iJJmDnj+BY6uVNX0GnLjF39TbIPRHpOt9NUNfZ78ZATKLl
 FnXo/Iy+OfVPLILhSPfkm7QIo7ipgGMwRzhPY/DOQ3fvPTW7eYZJy3Q2fKiCxszTLNGB
 sQqjU2wy9G3k0eEkBMpb1pYgHZtU1XUhHKPFSP4hjPlXj3fX4c8A4XUAx+cqjMUzhyM2
 eoMKw8uGEDBYEAil1sOLx5tdSMuGeJIJCEQ4WRNMetTUl3HvVEOGycjqNOA70ecj3F85
 ulMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=NiqkpM/w+JZs4P0eo38xaVvQUC+7sYCnFp9tM9zgNlA=;
 b=cuoD5xHaFJrf7PlhVqCBoncW8/xmLedywsBHY5Jrxsbq8wiUiYIpBVzo73cw/GqX6e
 hUz6LEXKHjJdBuK12oiHbTPwY+EE/6CH3LUQOPqbR4smnX5pd0ct8Q7TIpZwCHvQeZGG
 e6pbAKfeVB318qA2zs6C5iyEjm6rBnLU9vQRWmmr3sUGeShCAm//L7NkrXF8FfWIEcpm
 nss1BCNzr8hnrYhbv6AKMDO9GZQo7MjZgD05drc2k9Ud2KJD1Jj4tfR5EekjEKXV0J8p
 yxtjhRMckggtvSJbSNWSSoseBJ5UtDVQScApH0TDzXPPVDadF6xgiLFUh37WDO2elu46
 0cnA==
X-Gm-Message-State: AOAM530whcxG/Ap2FcUQbZK7ksYkos/qKX8dIdXpPN9TPFWjF0GlDtU9
 rxK/1xvJKMZhyz0T/dPHBnA=
X-Google-Smtp-Source: ABdhPJzYH0zI5Nab6ZoyXhJ1nGO3ZWVm28otZxnBQpZbtdQXXLh9do4Nkd8vrhaCUrRwpae8ziyN0g==
X-Received: by 2002:a7b:c353:: with SMTP id l19mr2222544wmj.187.1591246092837; 
 Wed, 03 Jun 2020 21:48:12 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id a15sm6349708wra.86.2020.06.03.21.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 21:48:12 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] soc: amlogic: meson-gx-socinfo: Fix S905X3 ID
Date: Thu,  4 Jun 2020 04:48:08 +0000
Message-Id: <20200604044808.30995-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_214816_949843_DCCED42B 
X-CRM114-Status: GOOD (  11.21  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The current value is taken from Amlogic's 4.9 bsp kernel which appears
to use the wrong ID. For comparison, here's before/after:

[    0.152237] soc soc0: Amlogic Meson SM1 (Unknown) Revision 2b:c (10:2) Detected
[    0.152463] soc soc0: Amlogic Meson SM1 (S905X3) Revision 2b:c (10:2) Detected

Fixes c9cc9bec36d0 ("soc: amlogic: meson-gx-socinfo: Add SM1 and S905X3 IDs")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 01fc0d20a70d..c38a1e4db28b 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -68,7 +68,7 @@ static const struct meson_gx_package_id {
 	{ "S905X2", 0x28, 0x40, 0xf0 },
 	{ "S922X", 0x29, 0x40, 0xf0 },
 	{ "A311D", 0x29, 0x10, 0xf0 },
-	{ "S905X3", 0x2b, 0x5, 0xf },
+	{ "S905X3", 0x2b, 0x10, 0xf0 },
 	{ "S905D3", 0x2b, 0xb0, 0xf0 },
 	{ "A113L", 0x2c, 0x0, 0xf8 },
 };
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
