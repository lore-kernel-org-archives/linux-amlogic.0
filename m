Return-Path: <SRS0=TJbE=BI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B31C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:44:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2E50208A9
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yyuE/lpN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FS6h71u5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2E50208A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RFlgBQXr8jtUhMRmNT3qRMMIVE145PyjvV+YYQGv9uQ=; b=yyuE/lpNrXThY15teTytOTWHau
	KXFMM3jcVFPyRKdCEeC/IbYln5XlrMsv9vMLzSOCH0BevlHabRVbWVAKNkwwzNFRMAfdqai6TboQg
	WAA1yhTxUTrcC3N3Hoj5Q5zR2roM0UzESDIHByB3A9GSrA73hckKGnBm+2ZQbzoZEDck6LOXbUHrz
	ADd15LaN8cFLsaDeh5TL9JkoQqV/sFItpkfdA0IcnJtbmPBDK5T/IBUYWFSdclZH4OKARix6xv/HW
	qoCKR0/Xwk0smGCn6mTLqmqp9UaNbF/nbjp2KNgynjMti5ejiyAYQk9fkPYSxxm+xSMQcgZq72zhX
	CJ13tUkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0oFY-0002uu-58; Wed, 29 Jul 2020 15:44:12 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0oFV-0002tL-LM
 for linux-amlogic@lists.infradead.org; Wed, 29 Jul 2020 15:44:10 +0000
Received: by mail-wr1-x442.google.com with SMTP id r4so19129903wrx.9
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Jul 2020 08:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tuiwq6PL49LgBLJB2iEw3NbuM/jiIuCvykCzTBqHaAA=;
 b=FS6h71u5nG4XhXmL0xBxzPU4diQE9Q2Zpew4j4jjY4WuGIDjtKoxp0YtFc9dj8HhrN
 QoIgPpKfjk6Soe8qvPm3YZMHmP0SRtiDVUBnoEPPmjbqkI9eaiPuNt/hjt6di05vUfOj
 sCR1Q+Lrnz+hYJ+ACuqXBgwWdmTWTgDb8jShGJDuuAF6oWFDJBEwaPu3N+lSLavKpMJI
 29f8AjvI6+LmYSO7I4uhSysBwYF1Nk/2NZxQBDu1FlJks0amxkSRjc7F3JevXv/D5pXZ
 s4l4bvNHDcNxZI+w6gMwVDs97ktovsnGTXTJNs3L8UEMeLVlKNSVmZrpDZdxnQqHDG74
 pmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tuiwq6PL49LgBLJB2iEw3NbuM/jiIuCvykCzTBqHaAA=;
 b=jfo5X6JRNyIlBP0BQbuFNfPZBfoZBLLFRnQfi4294jdLKNnH5Fm+4oNPyg2LoOoqja
 P74u5oQXMwMKkpgMZowFRuByeyUl2Znb/h0pnqx18V5O3Ximgn61da2+gMqUIm19KUVS
 LINJ99s5ep8zQZdV2++NW9BfDHO2bnByOvuU05Agc0eg8Ob8AHJ99PvywdY3zO1+vHcB
 rC8SDMQRsV0g/R/JiZ5sK1Nr/38f2x9UvdRe5Ve4MHi4QbmzoU1SqQmNKT7gJcPwGV/y
 nX1VsgGsC61dkCgXbbtUYUSLtySL0L4zyiMJTUi1y3nCWpGmPmUgCXluuJBSHihOsvii
 ++eA==
X-Gm-Message-State: AOAM5328ZHhAM9ydns6mGkK+7UhKCJYGhydSTHWwd4I+9DT08i7H9rHm
 Ok18hWImN/Prjp1DkluyKcEwMw==
X-Google-Smtp-Source: ABdhPJyTMeEr287ehDzeTN6mcV+wNZneeb9TvFO04zB+QZ6QobJZHTZKK3fS+lbNnvjc9AqXgsXxZw==
X-Received: by 2002:adf:ea4f:: with SMTP id j15mr30067384wrn.253.1596037446658; 
 Wed, 29 Jul 2020 08:44:06 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a134sm6526030wmd.17.2020.07.29.08.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 08:44:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/3] clk: meson: axg-audio: fix tdmout sclk inverter
Date: Wed, 29 Jul 2020 17:43:56 +0200
Message-Id: <20200729154359.1983085-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_114409_724663_61ED8735 
X-CRM114-Status: UNSURE (   9.49  )
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

The patchset fixes a problem with TDMOUT sclk inverter found on the
g12a and following SoCs.

On the the axg, a single bit was enough to drive the inverter. On
the g12a a bit was added to, somehow, change how the clock is sampled.
For the inverter to behave as intended, the new bit should be the
inverse of the inverter bit at all time.

Quite a lot of lines for a single bit ...

Jerome Brunet (3):
  clk: meson: add sclk-ws driver
  clk: meson: axg-audio: separate axg and g12a regmap tables
  clk: meson: axg-audio: fix g12a tdmout sclk inverter

 drivers/clk/meson/axg-audio.c | 214 +++++++++++++++++++++++++++++-----
 drivers/clk/meson/clk-phase.c |  56 +++++++++
 drivers/clk/meson/clk-phase.h |   6 +
 3 files changed, 246 insertions(+), 30 deletions(-)

-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
