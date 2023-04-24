Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7A6C7618E
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Apr 2023 11:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R/X8liBTVqLlxPqlwUB3u/+ttzGvv5fA8eLs/EclSVg=; b=ZmFyl4eW7N0IZ4
	u1sC9A/eWu7pi0tjIHVBLFjUIg9chWq04uBcsXtkdHekQPNF4Km2C1D6IORMhsVZ3MqHYgDvHKBuh
	zBboz6E0LP8otvT8O/v/5bJ2HMUcuwjGaURrD9qooVnwiAtTRBruCYFQVpIC5FzBsWCLvgnGjqhW2
	eYGu6VIf3dJWB/9Xsvnynwh78Px9OnDhgWUOsnUpERiZWKFJ2PrasIEcPmkgG7g9FsdxT7bWQs1/H
	Exc/qapOEUgTFvElPdEmc4J6tZ8nmC5uNW3r7HNKOw+quv6Z4Z0CR5RHSPjKkA9q0gf5IOgDe2h9A
	D1cEKo0vl504sP6S6hzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pquX1-00GDgo-12;
	Mon, 24 Apr 2023 11:38:55 +0000
Received: from mail-wm1-f48.google.com ([209.85.128.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pquWy-00GDfm-25;
	Mon, 24 Apr 2023 11:38:54 +0000
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f1957e80a2so74187525e9.1;
        Mon, 24 Apr 2023 04:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682336329; x=1684928329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eglyz+j/occX8WNkEpcLNlY9OWqv/i1uyY+qtuXKrx0=;
        b=kVWQ2yX2pj2h1yktkPTGpHl/Nhzc9dVUdeaUR4xZWwt5sN2CBF++jPVRNC6c/0wWlH
         aKCy47pP8daeYqVhYNDVJLJOvp70gKFMDAiT2NYrbpTB9nACX8TjMWh+XUFcIm1XuyCu
         eRpOaMtlVfXxOMtd1vwYPnb4teB+1+JuQTKoTdhfWJ2PeUsIvRwARTkHuC5k8C899rXC
         RUwcKpGRSRqM8FdEM3W3WiUYeOUi65Yv6vfOMm1z6MeK9sx2pRj/JJzxvKSRE9WTwzQ3
         vDPV6eVwuKA7dUgp6DBvccsYasP+TXnjNecKa0OipCXzOs9iE02TQ3qriO1v9iH2Az8G
         g0bw==
X-Gm-Message-State: AAQBX9dkfAcW3gGaRo47gIM/pqCXW3fjrjUrhyXqKYGAmaXSgrZXa41J
	AuxTe3FQZk8gQJAM8kPFeP4Iw+8CEeMRH7qn
X-Google-Smtp-Source: AKy350bIiGtYQ95Um7VGjxvEpP0Bu+W7VgYMq+aOVIHhgROIjVQNbR2DGGAa6ASUxZR2oIKOoxEPVA==
X-Received: by 2002:a5d:414c:0:b0:2fa:d00d:cab8 with SMTP id c12-20020a5d414c000000b002fad00dcab8mr9478626wrq.18.1682336328944;
        Mon, 24 Apr 2023 04:38:48 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id e18-20020adffc52000000b002efacde3fc7sm10570820wrs.35.2023.04.24.04.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 04:38:48 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	martin.blumenstingl@googlemail.com,
	narmstrong@baylibre.com,
	stefan@agner.ch,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH v4] of: fdt: Scan /memreserve/ last
Date: Mon, 24 Apr 2023 12:38:46 +0100
Message-Id: <20230424113846.46382-1-tanure@linux.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_043852_703559_3D2CD7A2 
X-CRM114-Status: GOOD (  15.48  )
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

Change the scanning /memreserve/ and /reserved-memory node order to fix
Kernel panic on Khadas Vim3 Board.

If /memreserve/ goes first, the memory is reserved, but nomap can't be
applied to the region. So the memory won't be used by Linux, but it is
still present in the linear map as normal memory, which allows
speculation. Legitimate access to adjacent pages will cause the CPU
to end up prefetching into them leading to Kernel panic.

So /reserved-memory node should go first, as it has a more updated
description of the memory regions and can apply flags, like nomap.

Signed-off-by: Lucas Tanure <tanure@linux.com>i
---
Previous Threads:
#regzbot link: https://lore.kernel.org/linux-arm-kernel/40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch/#regzbot
#regzbot link: https://lore.kernel.org/all/CAJX_Q+1Tjc+-TjZ6JW9X0NxEdFe=82a9626yL63j7uVD4LpxEA@mail.gmail.com/

V1: https://lore.kernel.org/all/20230406151429.524591-1-tanure@linux.com/
v2: https://lore.kernel.org/all/20230410120017.41664-1-tanure@linux.com/
v3: https://lore.kernel.org/linux-mm/20230412224620.8909-1-tanure@linux.com/T/

Change from V3:
 - Drop cover letter
 - Add more information into the patch

Change from V2:
 - Remove region overlap and reserved checks

Change from V1:
 - Instead of allowing to mark nomap a region already reserved, give
precedence to /reserved-memory node scan.
---
 drivers/of/fdt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index d14735a81301..bf502ba8da95 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -635,6 +635,9 @@ void __init early_init_fdt_scan_reserved_mem(void)
 	if (!initial_boot_params)
 		return;
 
+	fdt_scan_reserved_mem();
+	fdt_reserve_elfcorehdr();
+
 	/* Process header /memreserve/ fields */
 	for (n = 0; ; n++) {
 		fdt_get_mem_rsv(initial_boot_params, n, &base, &size);
@@ -643,8 +646,6 @@ void __init early_init_fdt_scan_reserved_mem(void)
 		memblock_reserve(base, size);
 	}
 
-	fdt_scan_reserved_mem();
-	fdt_reserve_elfcorehdr();
 	fdt_init_reserved_mem();
 }
 
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
