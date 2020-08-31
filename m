Return-Path: <SRS0=yTcF=CJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667E6C433E6
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2020 10:23:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 194252072D
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2020 10:23:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cTFiujkv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VlGF8Dyf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 194252072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qmbQ4DryHUhPiDMf3cmDfHi1B+n7I5SJGjGwEqjm9zI=; b=cTFiujkvwXHsES23D9LLVY52av
	Sz4BuS/IPnVSzh6AYBPF2pY4UAPisvce8isOfbGDCgDsvRiRHAhHCRfw2EAXbYV0VY8UArzB7GZz3
	532zspraKnYZzo8xPQCRGeNBJYpekwGdUbmY2/+eRrhi3s3xTyPx35H1upQ9ffWwgCjzLqemtn2mT
	QfnDa5/Ut51/9AyEPM0M9E1VEYe6PRG5VLL0DhW93EV38c89kk9OJbVe6BPRLXkadCahhUQ9gXsww
	GHYBwKH9hvC4xQYQZ46m7dxATTks5hYtp/Kov0Zqr2Ogffyc344un0mgaA9bWOR1WgNB1+NqSGpgO
	5JyvbTxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCgyW-0006V3-OJ; Mon, 31 Aug 2020 10:23:44 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCgyS-0006TG-7v
 for linux-amlogic@lists.infradead.org; Mon, 31 Aug 2020 10:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=k1; bh=x7BLqfeBv4SVfp/Z3lCdLtNBlM9
 KlpCVEwpWsY/Z1bM=; b=VlGF8Dyfb6w3101nYq228QatW4dE6O/gJFNRxgcqz/W
 sIuiIeAF7DR9UnvlQefDubd+G3ekylDnwds1Mj8esZ1dwHDMJ6BnMJ9cOf/jhwYg
 5Gr9BbFD4WG3x99Pbv63Re9BDBPkpErqYIja5HAYb7l+6QpqLquBpqZOeIIwG7LU
 =
Received: (qmail 2082363 invoked from network); 31 Aug 2020 12:23:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 31 Aug 2020 12:23:31 +0200
X-UD-Smtp-Session: l3s3148p1@6ABXyymuhM8gAwDPXwczAOmbI0TU8LCu
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Subject: [PATCH] mmc: meson-gx: use wrapper to avoid accessing internal vars
Date: Mon, 31 Aug 2020 12:23:24 +0200
Message-Id: <20200831102324.12566-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_062340_508100_0ED8EF56 
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Only buildtested. Found while analyzing retune-handling in the core.

 drivers/mmc/host/meson-gx-mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 08a3b1c05acb..a1db8685e30e 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -521,7 +521,7 @@ static int meson_mmc_resampling_tuning(struct mmc_host *mmc, u32 opcode)
 	val |= ADJUST_ADJ_EN;
 	writel(val, host->regs + host->data->adjust);
 
-	if (mmc->doing_retune)
+	if (mmc_doing_retune(mmc))
 		dly = FIELD_GET(ADJUST_ADJ_DELAY_MASK, val) + 1;
 	else
 		dly = 0;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
