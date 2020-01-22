Return-Path: <SRS0=mclM=3L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DD2C33CB8
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Jan 2020 10:05:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A227224697
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Jan 2020 10:05:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fSE92vF+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2Spclnwq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A227224697
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=65O8UTPdfLUaSMlkECZwXESVb5o8ctQnLNRjB75WTR8=; b=fSE92vF+X1Ra31
	ucRuOVixYUpw5v3Ye/iLMMC8hz7Q7xmmeKRt2X72FhvCZfUheK+PV7nhBasWZHNPUFa8EBIyyph0Y
	0oDtHNoTSjrD8QuzeQxZX5PhbCiScb7OCERtAzpBzH36ZuaCDUCjMQ2FClRXbwISBiKFRCYO0JY8W
	yxuEGfOnLFQvzEl4PLpMf5ZBKfIgu0ZlcIZSnB3nNbrQWIRys2odg4UGYGgfwt1T5JHJiua+1irnf
	WtxEZmGRZg3twtI7H2lF4v8y0+6/c4egvCzgwYTSVqBGBb2X9v185h83s/MkUXCQaaY43XWBYkIXV
	EmAWCjAe53YOIVh1quwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuCsd-0004xP-LW; Wed, 22 Jan 2020 10:04:59 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuCsa-0004w4-Dd
 for linux-amlogic@lists.infradead.org; Wed, 22 Jan 2020 10:04:58 +0000
Received: by mail-wm1-x335.google.com with SMTP id p17so6498509wmb.0
 for <linux-amlogic@lists.infradead.org>; Wed, 22 Jan 2020 02:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xr55sisUQJBKj6Q4LrYEYaq2XUN1tVNpifr1uUk54Rc=;
 b=2SpclnwqwF+ZtOGLn5/Pzqi457wTIzOMugjwrvqe2e6PJR797j6ImTx5WFNp7pJf+D
 0oCYEuyjwuXAOyrBfb48iDlGtYXJ9iOcGW5YYffBgwRYC3gqYgczwyagZCk8Du3/RZRe
 sVU4/NdlRN4MU59vussJBc4x1Wxp+5eXR12w1xgIxs+sZbBjapfCxeJOd659ECntnogA
 u8/25V+tAYwHIh2eXheHPeMrHlgoEqotUdWOHcpexUj1fjvxMfVZXxE0C6H+AXpm4AWf
 83HNZuCMrZVH9ziWGen75wPXIo5Zg+UUTeq6R7TbJBbiJ4BcYL5FzY3amnjSAs80R+iQ
 ONPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xr55sisUQJBKj6Q4LrYEYaq2XUN1tVNpifr1uUk54Rc=;
 b=f7NKihq1ynaj3vqR35PaPdb/8FWYh7/CNnQji6cVgV3/fR/MiTTTjsrR6pq3Ng+1m8
 wrqHxUMVsrxDB4JL4fzMaM/ANnKCuZSoAT+NrKFP6eNiSrX0uUO1OVEK+ADuQ7aJi0qJ
 bkt98sapF3WRWBDx+qpLLRGv461TjXBBvm3POOOfoVu6x/zDlvm8N/+TzZaIODvQArKT
 00AkMwgzYoVvQTTYHFQPRLsUIgvrqUBvTfB2a5GTiefgR1iW7d4bTvlMyU91irQpTq/Y
 FbO3G02xMdXzdfd39CnOWNgEiluP73qAhDupOlKeuefyZ2m6r/M5eq7nz5l4bnTC8fPJ
 u29g==
X-Gm-Message-State: APjAAAVFQ7+blkQeTFNEfKPy2eaWps/DJ93Q2+zUzMF6VeuoMA4F6tdS
 OegJNLodfFMmYKJ5EFR3MScA6Q==
X-Google-Smtp-Source: APXvYqxz2tZXmYV+E9Ld+AOXUw6DT+T8VYNXacbGMy0FhKPCjM0ksmIp44lJOlHnO0vFIuRXZGibVg==
X-Received: by 2002:a1c:3b0a:: with SMTP id i10mr2197195wma.177.1579687494505; 
 Wed, 22 Jan 2020 02:04:54 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id l3sm52237648wrt.29.2020.01.22.02.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 02:04:53 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/3] clk: meson: gxbb: audio clock updates
Date: Wed, 22 Jan 2020 11:04:48 +0100
Message-Id: <20200122100451.2443153-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_020456_465999_8AC6D8DD 
X-CRM114-Status: UNSURE (   6.55  )
X-CRM114-Notice: Please train this message.
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patcheset provides updates related to the audio peripheral clocks
It adds the peripheral clock required by the internal audio dac
and reorganize the AIU clocks into a hierarchy to better reflect the
behavior of the SoC.

Jerome Brunet (3):
  dt-bindings: clk: meson: add the gxl internal dac gate
  clk: meson: gxbb: add the gxl internal dac gate
  clk: meson: gxbb: set audio output clock hierarchy

 drivers/clk/meson/gxbb.c              | 21 +++++++++++++--------
 drivers/clk/meson/gxbb.h              |  2 +-
 include/dt-bindings/clock/gxbb-clkc.h |  1 +
 3 files changed, 15 insertions(+), 9 deletions(-)

-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
