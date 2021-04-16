Return-Path: <SRS0=6m2Z=JN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75BEC433B4
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Apr 2021 09:54:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07EB26115B
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Apr 2021 09:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07EB26115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CXmUxEWPti+G/YtoxJyIGoj+jYMHzt7gBBwTynxV6co=; b=OvCuGhXU/ZG31T04HZL59JTYXg
	/64Qt0itHb7IS3Fi9Uz+/94KME4Pdpb4wNhpeeP32KV3zueNpC2AUJMTJlsw6sQjkjGLGBFtTq24Y
	uO7HMMDTj8zwCPUQdQtvJVy0nfVuTksIr/WnrH3CuC3sTNf2NTjB3KtGhO8sEWbiUYj+CqFOrmDYz
	daeT/SBv33VHCuxPJIicRfftF2Y0vf0YuHtkJlvvgq8sKWZem13sfxSvtxt4wGFq11ZaJH9/sw11w
	PegLZjOetMCCCuhSE8wtKyXD+6gmzN+M0v68obFToyKuACGROhfGRQ8fYy8id45+j6PuZj6L8Muu6
	NAPuOZSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXLAg-001d8A-L6; Fri, 16 Apr 2021 09:53:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXL11-001ag8-3X
 for linux-amlogic@desiato.infradead.org; Fri, 16 Apr 2021 09:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=DNXIm2x7iZSWnu0rM9rcYpiEEBJSY5oANhLVzMZb7Z0=; b=npLg45ISfWguKMfMAmrEhuAVGu
 wXVouhncRv7JSbA0wcxHCe1DcpgZK03+zDAxwTP+TeNquQl5Ztm1kMMp+sHmXFJrlScPM29hnVKYw
 /JS9ipTKuFlgr/+xPk+DHi2GJF7GzDwGzeBnNV3xHltPy8ABM6+wOrrPKYR3rpcotTabpF4ozSFty
 OpEps/reVQmskj4ENtwNI+9/061YsDDjF+dW6MhUiLQ2vZboviVii3veZmb9hVoiX2SS923+180xc
 QW/4RpfmQQZWsAVEBaDjruVPdXRCCSkJ8XgY3JAsLPXGHkbMSYDiCd5FDO3EcYOPBdN0nDWAdXBuO
 gQGdrJTQ==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXL0y-009FdC-3z
 for linux-amlogic@lists.infradead.org; Fri, 16 Apr 2021 09:43:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 o21-20020a1c4d150000b029012e52898006so4223768wmh.0
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Apr 2021 02:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DNXIm2x7iZSWnu0rM9rcYpiEEBJSY5oANhLVzMZb7Z0=;
 b=q77MX6rw0CxCVzhn54CaK3fTSKcDS/VmNVRWaiJrxjlc73ODQGuA0kPcuxTeehAp+b
 eyF/YaOS9NO+KUSeUvdAv13pS8+uUCzDm/2e6EzsbOAHlGjs4d5zCLJTNEIF6FkzT0bT
 nHvq1U+y9VsfVoaAqx2ohwND3YHlZYOrkgK2CwG4Y2QJoEBCfFP+ZmPBvFmyMf4yNILz
 J6jEjQC6HrPoiZIUfna7bOwushYp43o8QWLzYIEWxFKBOlOM9JORGa+iwiktmmpAMcln
 VevKA1SAjVSwaUFikbBNgYuKhtQGjgjo/m2nscUXfsiJ5MTSBgRvt1aLqEitmzyuvD0C
 Rvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DNXIm2x7iZSWnu0rM9rcYpiEEBJSY5oANhLVzMZb7Z0=;
 b=D9fUHsevsvUXhtExwHCd349MYUqZT8Xs+BRaqlWZXzWCb4BC45ECBWJoZAEF4QnCCG
 dAROl81K64sNj5GXVeYhWS1uVC/jWB87HSocP1xagsY5dZMpX9Kby3STNpt2G2edrgJY
 BQIBi76ZIwnMmW7JHhtOc+eLn8oCk3asb0Wma3eBhsfkpkl75I+Plx2N2GsdtzEtcWrR
 agQTuc55zlHlj6WsvcEio/Vum87eJnWIkI0hX9e51HrFLowXPFx6fc8SC97qQ6JMXBC2
 pEy7efBhkDl5g2do+vyd3RwHRvfbvyOIZ400z+/bq5LqbH1RHSh9aoIKef1RHUluDxvR
 X0BQ==
X-Gm-Message-State: AOAM532pF2tazju5WXkC/fWaBaZr4Hv3W66lc7cFTyhRfdzJm4n6iowu
 sfNTIai5O5Q+DQ4aQmccR7cs6w==
X-Google-Smtp-Source: ABdhPJy38WGnMQGvcGAZDuyAQHhopBQibip3naXYdj9nO3tbNM9T2pB/fanWPEG67HAB1uIMne2+dA==
X-Received: by 2002:a05:600c:3541:: with SMTP id
 i1mr7316584wmq.97.1618566230000; 
 Fri, 16 Apr 2021 02:43:50 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:6e70:fd4e:dfdb:68d7])
 by smtp.gmail.com with ESMTPSA id
 e9sm9585744wrs.84.2021.04.16.02.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 02:43:49 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 lebed.dmitry@gmail.com, Neil Armstrong <narmstrong@baylibre.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] mmc: meson-gx: replace WARN_ONCE with dev_warn_once about
 scatterlist size alignment in block mode
Date: Fri, 16 Apr 2021 11:43:47 +0200
Message-Id: <20210416094347.2015896-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_024352_165841_C8AEF9A4 
X-CRM114-Status: GOOD (  12.56  )
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
triggerring a WARN_ONCE() with scary stacktrace even if the transfer works fine
but with possible degraded performances.

Simply replace with dev_warn_once() to inform user this should be fixed to avoid
degraded performance.

This should be ultimately fixed in brcmfmac, but since it's only a performance issue
the warning should be removed.

Fixes: e085b51c74cc ("mmc: meson-gx: check for scatterlist size alignment in block mode")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
Changes since v1:
- replace WARN_ONCE with dev_warn_once and explicit the warning message

 drivers/mmc/host/meson-gx-mmc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index eb6c02bc4a02..b8b771b643cc 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -247,8 +247,9 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
 		 */
 		for_each_sg(data->sg, sg, data->sg_len, i) {
 			if (sg->length % data->blksz) {
-				WARN_ONCE(1, "unaligned sg len %u blksize %u\n",
-					  sg->length, data->blksz);
+				dev_warn_once(mmc_dev(mmc),
+					      "unaligned sg len %u blksize %u, disabling descriptor DMA for transfer\n",
+					      sg->length, data->blksz);
 				return;
 			}
 		}
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
