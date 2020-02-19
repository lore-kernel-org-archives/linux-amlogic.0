Return-Path: <SRS0=kAN4=4H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EADC34050
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 08:49:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C5E324656
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 08:49:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EeJ3e8JN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cL0AUTWK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C5E324656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o45u+SoHq8Qx10NsEIvaeCFNxRSy8sxNN1IDEsywu/w=; b=EeJ3e8JN2ef9xL
	nnZyQjm9WbqpZNkI4MPA5wvMxISjt79NGh9TtF3FaZ38LRb35n6iozqsEdPrtHdXMzCkDJYP5fCNd
	3W9y0Ul83B4IwtIqwapft9k8hjZQtwNl0BcT/hViIOIGFqrbuEMpM5tpCJLxrmE76i+lcdX9ll8V9
	HnhkIDqJvY87MUu2zCq4E7ANAp+RXzpx5O5Rj8FlT8TpLVW98RvMomllMK+OddKELagdBX+MTF1fA
	DaiSMPaQ5wwmsJEQZmErd3GN+cKXJvxOV/wKxcrWNG/ycXVmSYNlwLveIxCviHFydcxbQk9VP9QoN
	qB7ETnviguPIpm8EhQiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4L37-0003qH-KP; Wed, 19 Feb 2020 08:49:41 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4L34-0003oP-A1
 for linux-amlogic@lists.infradead.org; Wed, 19 Feb 2020 08:49:40 +0000
Received: by mail-wm1-x343.google.com with SMTP id s10so5509546wmh.3
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Feb 2020 00:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+OjifpqqKo8DYjh9Op+2jQZP+EdT+EofXUxP9wt2jCM=;
 b=cL0AUTWKkL3rtprOF9RpLDm5fmboSeErTyBaUrZyTXIVwyjd2UZbhz7UXzd41KXKSu
 GtzArdjwHOOlaTPmYly86hCsUAO6Kiuo4+qkiRbTbhiXW6L98n3m+KB4Ov2b8ZZ/W00t
 tS1+dbs8cLorG4nJKCTUZE9NB6Zfv79l+EmzFTRSeO4gHTa8YaF2vuKVRwTtMvXZQGXw
 NnbXs9vgvD9UcuqO+woNRCzj9Axf6ce7Qm1Ezd60IqfbNXGky78jEKUE0CkOiIcodjuk
 yjSpSbGXIh8/W2H31lwVaVjGWQ+ABciWuEJJ7JWtBu1yIuE9wd+gbzEAjgIja/YR0Cl+
 t+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+OjifpqqKo8DYjh9Op+2jQZP+EdT+EofXUxP9wt2jCM=;
 b=e7xYgQ3tvgdL8PoXFebfpQ8fz/X4GOyZZQoBPVslZSuJHA7EaI/IPZtv5y0/PMLIpB
 amfoIXvNNdxbH3skT8zabWGEWWb3nND/iAfH1You80NVoajbILELWYCkOqSbs8TSs/yf
 P049tYbkH2qeZnee+hZo6hZQ+xUdnyfSLvZyQ3Xu6VgaPgFQ2RFi3xQ/3inXI6LRrzUK
 Q4etLc+JotS484fbL7tn4PDtoxRKgaVUZO7/tN+AE6nX+LOB1/DlsRQs3/R8EdGJlS9x
 xGvQ52XaxjZLJf+9rAjeI2wVzJLnys2n+ljdUZ7/9Jb+YNpR5kit1kRM3QA4ileZ52By
 NWUg==
X-Gm-Message-State: APjAAAU2NQCGINqu6DkSTgVmgmAN13XQMp3vB/i1cAMgBDav9QCoPyf3
 xYsVxTvZ1F84bvrYsBn3NpDSeA==
X-Google-Smtp-Source: APXvYqyL5YkCPYRHLJKYfuh+lPCFN7xEaXE4fRNEWpjsiEPxFXo/1CgZlKkY9CP7IToKY/NzXjDeCQ==
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr9278562wmg.16.1582102176198; 
 Wed, 19 Feb 2020 00:49:36 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t13sm2021673wrw.19.2020.02.19.00.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 00:49:35 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH 0/2] clk: meson: g12a: add support for the SPICC SCLK Source
 clocks
Date: Wed, 19 Feb 2020 09:49:26 +0100
Message-Id: <20200219084928.28707-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_004938_349673_E8F1E2A5 
X-CRM114-Status: UNSURE (   7.91  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Like on the AXG SoCs, the SPICC controllers can make use of an external clock
source instead of it's internal divider over xtal to provide a better SCLK
clock frequency.

This serie adds the new clock IDs and the associated clocks in the g12a driver.

Neil Armstrong (2):
  dt-bindings: clk: g12a-clkc: add SPICC SCLK Source clock IDs
  clk: meson: g12a: add support for the SPICC SCLK Source clocks

 drivers/clk/meson/g12a.c              | 129 ++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |   6 +-
 include/dt-bindings/clock/g12a-clkc.h |   2 +
 3 files changed, 136 insertions(+), 1 deletion(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
