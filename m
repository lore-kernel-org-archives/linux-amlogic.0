Return-Path: <SRS0=ovl2=JL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053EDC433B4
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Apr 2021 10:00:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 493D66128E
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Apr 2021 10:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 493D66128E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TrwYLOLQ8qeDB+KdX42JFqdtat3NZOi5SnRS7g8VRjY=; b=G9WMynxt//Y7uTVV1Xf9C1oYlX
	+XFyOWP/MNa+ZstGkdPuWZPoGbfADQRuR2huqt7/g034jnTiTXyKzDfVmAjna+L7JVIFwIP/Z2BI4
	6REzVqHBozyMZcD4l4NRx2WxPT6bnT2+6ptJhl+b3aUvalrpqjGY1Soz30j0LJam1uIp2UexnbtCG
	nLrdl1cvR0IZ9KwOkCocb6u8Xs8l1Zhb36dPb1VjdehHmMooIAcWAn+CKABzbdV+XpAqanCYp6K+v
	uV6cJoiVZqNaY5n8Ml2Toxr/UzeBh3x4MLJfudjJADbmh29ZXtQvVV6rflXmXOufrzk6uit5XmmIK
	AwMibRdA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWcJz-00CD9U-VC; Wed, 14 Apr 2021 10:00:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWcJw-00CD9B-2I
 for linux-amlogic@desiato.infradead.org; Wed, 14 Apr 2021 10:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=OHs1VI7bCBMLQHluRCKmPfQD9C9ixYNpufWpRqIWhkE=; b=VoIlkze33ZtFCK0sFvO/5k+6uX
 TVsLzAHeI2H9k3fAirG6pXFDX8injBoiXNr0f4G1YIv13s8bwUzuS9Og1vaVwvVHS/saiE2LOt+ah
 zCvH9U0+03FCmeKErks1QoJTmIbPQ9AXrIoVPS3Yh2ALDRLsX2pQEY0xU7vR/eHwZgA0abZp1DwDh
 l3baHiEZEQeZkCLAtNM+JDiBi6j6tZ7y9h1aCtNqmOFqAGsf0fZCJaFlXCWG4UD4hq83c356AsGVz
 b0TC1N/6RDmUVRvnllUsz24ZwhVILLJljqVRUTRjF7wYu31ua01P6vC2g/oE9sFZIQQiu2w/Qnclb
 x4pQaUKQ==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWcJs-007fWe-Lu
 for linux-amlogic@lists.infradead.org; Wed, 14 Apr 2021 10:00:26 +0000
Received: by mail-wr1-x42d.google.com with SMTP id p6so12549469wrn.9
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Apr 2021 03:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OHs1VI7bCBMLQHluRCKmPfQD9C9ixYNpufWpRqIWhkE=;
 b=l3cVwETuHQqduIAXlo8++0A6pPs7pLslAe4lyc6smU8e/DV4f7a376UloYKjfBsnXQ
 OaEByc3AU8DhYAI4G8ne46SI8sVNarcnyeu2xnhKEqnffqOORFQ/LmE09kDejh2OuqbO
 NOxTtnrJ2TMGGk7XbYKCZPmJl7rBmcvqasmQkHoX9VtmKkN03ur2SZ7cxSQJQGla3SX/
 cfI5LGXUEva3fyvjP6XKiaasv3XPKjrtCZNQJioq6FCou1rppZGV/trmZKzu6Db2D4UA
 3ZMBjQArA5nqTKAkG7SbrMXPtG8TsaFGHPuHchVHpSdxmRQWorYHA5csFidA57GPivFI
 Sr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OHs1VI7bCBMLQHluRCKmPfQD9C9ixYNpufWpRqIWhkE=;
 b=JajXBcrxQzGjPkq3iGu5AcpHqJYYctTsFFS9MuusizyJ6DDX0FmGOQOyzFbW6f3n8V
 tV+l5LlqTBrSELZ3mEjzGrbvO3CGaZzzL7dZTi089MocU/aTCqM2Wb/Qe6PhGdyiEEMM
 ev1TVJr9+w0M8CnOzaL41y/ybuMYCs87x1eVSTBA7Z6aaSeDJUuH7wENNEnwsFOpNGtf
 qclJfxRpaOP2ILu/GnnXBGS/GNtj1b4ZX34xq93fg9H/gVHiyG/IFIFOplKydxdKVg2Y
 xUcIc2waWHZX6qfCssmgYv3kKOBuavs79YN4ET0/td/TUWfzJytYcsC6zu5LGkzzSYm3
 7aFg==
X-Gm-Message-State: AOAM531ah2fPcoFN+1txGBfYsIiyCAw7BDqiKxhSYdEBtPkCJRtUkyT1
 kxS+1UW6/ohjf7wkn9U1NuZD1cQv8H5KO7yb
X-Google-Smtp-Source: ABdhPJwVo4r8CagdY1xwnin1Wu5iRm7+Su/KsvFwD/E7y98dMUB5Tn/Oj5UrBGqDFcvpaaKc4Ml0jw==
X-Received: by 2002:a5d:590d:: with SMTP id v13mr9510711wrd.85.1618394422357; 
 Wed, 14 Apr 2021 03:00:22 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:49d:95f:49d5:fff7])
 by smtp.gmail.com with ESMTPSA id s13sm23204737wrv.80.2021.04.14.03.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 03:00:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 lebed.dmitry@gmail.com, Neil Armstrong <narmstrong@baylibre.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] mmc: meson-gx: remove useless warning about scatterlist size
 alignment in block mode
Date: Wed, 14 Apr 2021 12:00:10 +0200
Message-Id: <20210414100010.3877669-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=joJCiZ8Vi/Y9gbPhQtYvg8G1NMe/H2kEmTU9lh2L1gI=;
 m=zKiH954YES215BXInsULtpyDw9oMvFnx219Op9hHlEU=;
 p=AYUXpPgmnbzdD2EgfOp1CBf5Y6HRf83iQRLUWAs26WI=;
 g=7c7d0d96a81368feaf7aa048e5e1ace500463711
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmB2vP8ACgkQd9zb2sjISdGAyQ//Qd5
 v/zcwFbpMCcxb8+wYVg+G8BSFPgmEeIlY3A0mqob2eqwd/lxXmWoS3JSI9aQkypdERq/FrlMyx5JM
 HGH0r8PUmMzqq87zJ8WaFmGubdQXa6l+5rnPaMG7KKf9SDP+7rwIjR9YXO6ju4Gdsjap8hqi6+C9N
 kNU0Eh56JoSUcfCxZQdvsULlRXkJ/xUVdkyb58clpYl+xKpULsM0pglGZgMO9Iv4Y4PPZAU/UOLqg
 VT71ZG3hBK8HzUat7wAKX3G+NRdra8lLluVuh3wT+T89S1Gb9ihSDGRAegt+UY/wka9dWZ8erJcQ8
 3S5ebn4mBHoLUqepoOaCZdyT3jlpaKZUK6dn0viNbD5VmNfwNFV2rElF8grgx9AdTbUlGbCWwujAv
 ec0ZYrtqQkQBzXY6RVLNZnCZMLznf8R+B4iqw/T2cgyeKc0Y88KJgivNCBiHAeoMVk3Ca+Ut71kZD
 8wFm/o/cZZPUKjRYWcU7ic8aPWH932o3Zds0tfCWk+vuEb3aRJ2RPqVturYUan2p4S74XaQswGeuX
 I0Btgw3Esi+InBlZrCAoS6zda/aJbHoBxsESaVjkKFmLQNa+yq9fnlv3L6PofyJ0GFVWL6PSUhRvP
 llqUl0UdVIfVgof9RrmJnyM3pcm7a+xxcc46s4/NskhXibc6gEOWDuVkgBlV1BqE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_030024_807428_3AABA4E9 
X-CRM114-Status: GOOD (  11.82  )
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

Since commit e085b51c74cc ("mmc: meson-gx: check for scatterlist size alignment in block mode"),
support for SDIO SD_IO_RW_EXTENDED transferts are properly filtered but some driver
like brcmfmac still gives a block sg buffer size not aligned with SDIO block,
triggerring a warning even if the transfer works in degraded mode.

This should be ultimately fixed in brcmfmac, but since it's only a performance issue
the warning should be removed.

Fixes: e085b51c74cc ("mmc: meson-gx: check for scatterlist size alignment in block mode")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index eb6c02bc4a02..6bc151045843 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -246,11 +246,8 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
 		 * size, otherwise chain mode could not be used.
 		 */
 		for_each_sg(data->sg, sg, data->sg_len, i) {
-			if (sg->length % data->blksz) {
-				WARN_ONCE(1, "unaligned sg len %u blksize %u\n",
-					  sg->length, data->blksz);
+			if (sg->length % data->blksz)
 				return;
-			}
 		}
 	}
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
