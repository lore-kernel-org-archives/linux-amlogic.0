Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117FAC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:42:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE64C204EC
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:42:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vB5BqIBK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wRxTnBMZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE64C204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZZE7nYryINCX8H/GqaZRR2sX/us0LDW/hiB36NCg22U=; b=vB5BqIBKSTy9KG
	zHrp1Irp/BqMyKECY72e9huvF/Pf2GcrzdILFkSCl3y4vW98Z9NtJAH1jQRskb6qik7YJjIBkIKaw
	yXsgJcb3X0GOHxVfuP8SFyfvu5IFtc99ryCyyMScO4H67vsH/Oo9Gjf4UqNYeuUeKnwlhY8FwzN8o
	0nCAoaVRLU4W7yBtlC2TlEI07/xkMnQ0RaoKgdYzXs78+LG2WmZI6OUqoQ9Pud0ztQ0yhlD4EF2DL
	J8vs4xJTDzW1DehXqZ73pQFH+EbjY8MzLHpGadKghQ0QnMH9Y6BCuO0xuKQq+vbGHuSugCYcuGNOj
	xIzyYCZvB9u0HtT0vauQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVFtL-000783-7j; Mon, 27 May 2019 13:42:19 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFsZ-00061p-6K
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 13:41:34 +0000
Received: by mail-wr1-x443.google.com with SMTP id w13so8623453wru.11
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 06:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PtDy3UqUv5LCOqIXsFJGqcQMLOz550V0nprsW2J4Uqs=;
 b=wRxTnBMZt4cyd6WSY+pJUHPjaTqxPDKslWD4fOAz8Cl2ktdI78Ttpi98/VNQZgMMhd
 aQZroMDNgYrSKNN5UN95MemKkMASMsxQPlnFHtESyOSQnBMvR+HaF9LfzxQO1c/R6x+5
 DGyUbTd4JEs885rGAnMICBiTHoU6mN9oX61c/ZpdNQZEn6+z7S+yrQ7mYPyF4AFE0pJG
 CB2QHL0pbFzN2w4+t7iQj+VufoK2s2CXmf7xai5IiJu57Os/SDq05AU1LFq0ruYrW/aD
 v/VEf+IplThk/8c87IVibob6n5cg4dHuQIgDwqlNxehqAI/Ci4ALdnMQ72C6SfthBx7w
 i9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PtDy3UqUv5LCOqIXsFJGqcQMLOz550V0nprsW2J4Uqs=;
 b=cuUUNlR35kmI9sqgCbgMP+IlTfuycXQRTv9sQ+veMSH3zkpqhSMh3VUmxja5yeQipA
 U/ZgUXKXnBZNNkscDmYhnNBbCqE8hhK5l/xlYhB3RNFv8ktQbehGC3yvc8SY5lnDZ4eN
 cz0sk8/Ee4museG58Gq5ChXn1nq4PEmNs4fTxrkW+sssn+AZscmBfIkOi6vEswP1h2tH
 aKNMuXTHPS6V68xu3kqhWZPLRFpMK92uMKTVTTP1YPDqWcWTNHOnGvuFvRHfab8wLOwI
 FI8N0clNoPdoqayjCDVbPso1Ih8Xj/SrPXLLY9HZYXwikO3PrL2mMysP5dvOqNLV2J3r
 MC0Q==
X-Gm-Message-State: APjAAAWp3oQmadsYM2hZtOtfvHwiN6NEnxLglfaG4MVCIYcWBSBm3jwI
 qfsHF47rE6Xx39bSs+kUiu3F+Q==
X-Google-Smtp-Source: APXvYqwDoS1XKkP03Qo+GoG8JiTCdQ46ynTcTBid/U8fuWfQmDWA+axN+IkEGbAUdXNQUif5PkUSqQ==
X-Received: by 2002:adf:fc8f:: with SMTP id g15mr21780561wrr.122.1558964489668; 
 Mon, 27 May 2019 06:41:29 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z20sm19631838wmf.14.2019.05.27.06.41.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 06:41:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: broonie@kernel.org
Subject: [PATCH v2] spi: spi-meson-spifc: update with SPDX Licence identifier
Date: Mon, 27 May 2019 15:41:24 +0200
Message-Id: <20190527134124.3034-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_064131_694910_F5690900 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
Changes since v1:
- Moved to a single C++ comment block

 drivers/spi/spi-meson-spifc.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-meson-spifc.c b/drivers/spi/spi-meson-spifc.c
index 616566e793c6..f7fe9b13d122 100644
--- a/drivers/spi/spi-meson-spifc.c
+++ b/drivers/spi/spi-meson-spifc.c
@@ -1,15 +1,9 @@
-/*
- * Driver for Amlogic Meson SPI flash controller (SPIFC)
- *
- * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * version 2 as published by the Free Software Foundation.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
- */
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Driver for Amlogic Meson SPI flash controller (SPIFC)
+//
+// Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
+//
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
