Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23289C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 May 2022 11:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hcyNKAQAKZELcjLWLxS41ql5YqDMZk6H+x84xiFPglY=; b=ouy9+CxY1RT8+q
	05J07oxM2A1Kcf/OvD8IFJggTzQJRIzIBp3nOPXYDnpN+GKApXVGmm9IrfRtUDyjbc0xh+d9Q/PTr
	xrk7wl3QRpdjv+78jS3Bn3+X2NnQ+vc7D0Kb5nDDl33MNvAKd95njLIIZQ7nuWkwx7AQkr1l3qofT
	f2X3AlZyMxVAs+BmkfqfFzrL8b7KhIP9WE3zN96TBYhFVuhRHG3gLAfSKWF8NG2APSubm0pAZUgDn
	KOqbdPtmD8rq5JPsa8RdfKcA64TstpDc1vPal0USEgFREeiCI0HjW0PRiG0iTzfYYB34e5yUs4zPo
	/B2a7+7aSCbhsaCzCOaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsN6n-00GIrg-BJ; Sat, 21 May 2022 11:17:21 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsN1o-00GFFY-2G; Sat, 21 May 2022 11:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9wrNYIqEvyrnG9iiMAt+K7orQjSJi1d7S7pYQrFwucI=;
 b=EfF0aOKSs4g3wIIaklisoXUwQF+siyCP+iLoqh8+Ts2ANXeSXtlxpOEA
 8bv0ot52CkAASAgnLiwGstKTOL4eDALptGDX26OB47+hXzgWv8zq39RdM
 PWFAHHjMxXGD9P9el3K+BOta4etD1Bg8i2WNj1vcy5Rg/50IzYrWSLOmy 4=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,242,1647298800"; d="scan'208";a="14727955"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 13:12:01 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: kernel-janitors@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: meson: fix typo in comment
Date: Sat, 21 May 2022 13:11:03 +0200
Message-Id: <20220521111145.81697-53-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_041212_474525_C2D0C491 
X-CRM114-Status: GOOD (  11.29  )
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

Spelling mistake (triple letters) in comment.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/i2c/busses/i2c-meson.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 195a9716da31..61cc5b2462c6 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -82,7 +82,7 @@ enum {
  * @done:	Completion used to wait for transfer termination
  * @tokens:	Sequence of tokens to be written to the device
  * @num_tokens:	Number of tokens
- * @data:	Pointer to the controlller's platform data
+ * @data:	Pointer to the controller's platform data
  */
 struct meson_i2c {
 	struct i2c_adapter	adap;


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
