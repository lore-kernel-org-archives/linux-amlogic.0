Return-Path: <SRS0=/5FS=RH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01216C43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 13:11:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C52F82075B
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 13:11:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fVnNHx8f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XfO/TAm7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C52F82075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/+h1D7nI3dfpe4n58t3aY4NILFe7NPFHmubu94eOc+o=; b=fVnNHx8fWLyt+q
	1cYKHcq8PbLGiedEov0JpGrBTPgngxophH/myAknm9OHhDeYgHnJbwerR13Otglo/xYoPpAa+nT1t
	3iKJmmLX+V4MOd/f1GZknbHLqQaQXmsu4AwogW+rT6xKC7mx7rVHn+G0sCR6eCybqoO3OaDmArzv2
	JRR4CunCrJIY00kijL0i9sfYfXjzHphWvk6tQ4v/OreU9w6tmoJLEI4iV4iuLYLO4BUVhp+UvNcBf
	3JAWWVKCOXJaZooqEQX6Yc4HI+UcCbSTFfBqctzkWttBr45tX8xMrpRT7hgdTEahrEZaz7zUs5qK1
	6yB+ElRMx9qYsPu+P1ig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0nNi-00087S-Th; Mon, 04 Mar 2019 13:11:46 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0nNW-0007t7-P3
 for linux-amlogic@lists.infradead.org; Mon, 04 Mar 2019 13:11:36 +0000
Received: by mail-wm1-x342.google.com with SMTP id q187so4570066wme.5
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Mar 2019 05:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ByMeJQ3l9j8hP/2REzdKcxDU8ddE1rkkcDZy1jUeYQ=;
 b=XfO/TAm7cR+p96HOzcB/8OAud/WqzOqUOkRmr+XcZcnpdwwN1gt93roK1BneKFiTQJ
 VHeDqpWSzdjIofblxw20+cqYUYaSreiTElpHGEXinGJGZmdAaBfbmTejdnii8Fr0MJKI
 WP8SEBXWzffSYbmWFRi30jznZ1wntrXDV4jZF0yuSpEHYB00T/zV6rzNcgAcg6d9Q5uM
 jXjoNRcOH2TcvMd/A93z4RQN9MgoDWETcgIYU0klZK1l4yHXQdFqUi6fhyrfHQWWqTFM
 DQBkLAAoioiX2I6wPgRt8vXA2m/XtEjSLQO2NMbaebxQPqsBbyN0Z3R/Jw2cBP+Fr9GV
 GMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/ByMeJQ3l9j8hP/2REzdKcxDU8ddE1rkkcDZy1jUeYQ=;
 b=Vajg2c45vroatsI+4vio3T73PPZ+AV1MZmf4x7c2c/GNcyQH1gbGldcWnd5Wm0AzsD
 RIaV6sh5YlXxPFuOfCml4WloWYvZH8DxykHgCkuehaqbunbiMM8DvvyozcDQGzC25gei
 c91fZVk/AA5K/0xnUDntuxW42siTpQaFjwf6BUHPoZ//0lIv+lSQHWSx7eOOIg2iqKle
 J3Gm2nzVoA3a60rmTdn6k0lzYjSy9+FH1KKjJVjpjFfI/RtHkZQB3RYhX8GePCMNpQry
 YjnEkw5RU73oWY3piRN9TK6Hln4r4brtRw1jJNgyL9yXIrazY/LJWqHweVkrHjfLny6T
 nLcA==
X-Gm-Message-State: AHQUAubMSu1GbKPGY2Dmc4tmUZS4eYorQOPRvqZ1ZnMbAp/zfjUmIssi
 gWylibVXgkgYekxl9f2q93jSkQ==
X-Google-Smtp-Source: APXvYqzzFavd/62ZTJ/V7mMSg8QxpPP0ckAYCGyy3yx9qza4Eb05t7uGWI+n3CF0mZ8dnt2hLrGzhQ==
X-Received: by 2002:a1c:700a:: with SMTP id l10mr12225623wmc.13.1551705092066; 
 Mon, 04 Mar 2019 05:11:32 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a8sm11695624wmh.26.2019.03.04.05.11.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 04 Mar 2019 05:11:31 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH v2 0/2] clk: meson: g12a: Add CPU Clock support
Date: Mon,  4 Mar 2019 14:11:27 +0100
Message-Id: <20190304131129.7762-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_051134_828637_D87848A0 
X-CRM114-Status: GOOD (  10.35  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support for the clock tree feeding the 4xCortex A53
cpu cluster.

This patchet does not handle clock changing, this will be added in a
secondary patchset.

The CPU clock can either use the SYS_PLL for > 1GHz frequencies or
use a couple of div+mux from 1GHz/667MHz/24MHz source with 2 non-glitch
muxes.

The CPU clock must be switched to a safe clock while changing the clocks
before the non-glitch muxes. Proper support will be added later.

In this patchset, clocks are set read-only.

Changes since v1:
- moved to clk_regmap_gate_ro_ops for R/O gates
- added comments with datasheet field names
- moved pribate bindings changes to driver patch
- removed invalid PCIE IDs

Neil Armstrong (2):
  clk: meson-g12a: add cpu clock bindings
  clk: meson: g12a: add cpu clocks

 drivers/clk/meson/g12a.c              | 350 ++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |  22 +-
 include/dt-bindings/clock/g12a-clkc.h |   1 +
 3 files changed, 372 insertions(+), 1 deletion(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
