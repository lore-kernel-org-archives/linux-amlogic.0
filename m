Return-Path: <SRS0=fUxg=V2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D5CC7618E
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 13:17:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5E2621655
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 13:17:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DaFBZp6L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="va/m4r4d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5E2621655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DjQSuPs7zxOQkOsVJVzqJgIVYLUI0LpjFpxf1Y9d9OE=; b=DaFBZp6LWp3jE6
	ybw6dpORPr+qy4H90OX0erG3lcGCCsQrQjJ4VGUBe94JOHBVhK3S4ujnNJbQCtdS/Z3xFX6LKWby8
	4nqqKPrkkPrvWpcMhtGjaNkcSfH6j0FP5p/oKUhQIGwE9zUEZagl+K/WU7kFQaSBU0lH4HbUbqxBk
	w/fyVS5u8ANtUfOh855+WJkGoehfur7PvTFE1kXjjmZU85vLYJQZ71PUDQGO05nl6Says1QhvMffE
	C6/aWS53IvgL8DIp5A6ZArDSLcRptu1MXqxNKJoJlVu98QIN5+cco/LbBiPg6QyyOCaZLJhb5/1UC
	iHNICiVbS1odEB8zhbag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs5WZ-0006So-Ti; Mon, 29 Jul 2019 13:17:11 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs5WO-0006HO-R7
 for linux-amlogic@lists.infradead.org; Mon, 29 Jul 2019 13:17:02 +0000
Received: by mail-wm1-x341.google.com with SMTP id f17so53425777wme.2
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2019 06:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oynpEq+Rva8XBfHeYWHdmuSsXuLqJ4yySPhy6VhqL9A=;
 b=va/m4r4dkyOP1H7msYfzDxN4+0vxPlSoe+oUQ4l/rirf0OhntUYksvZZwImE3yEz0T
 oBaLe8s00sw6YpMAmKbDDfMJ3mCl28yLI59Ef6CiNZUUKGfhFf+NDo5mic6oiM20KxKR
 8e2iXUVWGg/5SBAy23v8YvJvjir1BgTnUhFoiSVojDGfS2Uv0NQw5UX04REnvkVV5RsO
 0/xJ5HncMOscX99UEea1qAz6NyeqODccTnEm/p0TXkddx0FI8A9rkhv5U4Sx3hcD6Mpn
 SkQhDKIsiBKPMOhr/4Bm1s4lGW8Pr24oT4yPFoPKpTRnPfszLYYMnc4VIcdgJtC2qpZJ
 K8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oynpEq+Rva8XBfHeYWHdmuSsXuLqJ4yySPhy6VhqL9A=;
 b=DvVXCeiBRoViRen5Y81cbxC7hMXnQIbO+zxXM/Y7R1yPqb4BL7P/SKY7UhqiGyd6Hv
 rULqhm2ESrfjhRAO4j1iwBUyqQJB3Yrt8QDK4jve882+QTdG9mxCVpHfm/oQZqClQw6Q
 C7RAvmX9X7YjzJAPwYamJxTFliEUBEWmIzpon+TNb9zUwDhsgQGlzSRy2Z3JFa6Pwk3q
 F9G805b+omC8x5ZhMIpL3GwO6UryKPWRB3Q8ui1HvaapaPjvJIRWFR6aANH1UbFLuONT
 mlNfUaQTmBm+uJWOAp2fCDYi6D9bRP6Kp0Y2memZOhokQnxZl3pxOboJLZ/gt1lAA6Mo
 UTqg==
X-Gm-Message-State: APjAAAUuxpWu/PT1Qcn/s3H2NVhTjPPPa1VCLsTXMunacKKxuMYmP88d
 J9aZsFdFfUgOGvWq1vzC0A3dkQ==
X-Google-Smtp-Source: APXvYqytSS4CaOtshhSxLAUA/SqcXHfZnGVeXdez8xfDM0v0eOvC2DS2WChVjk847i77QN6BlJ/9OA==
X-Received: by 2002:a7b:c954:: with SMTP id i20mr18655712wml.169.1564406219328; 
 Mon, 29 Jul 2019 06:16:59 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b5sm52520490wru.69.2019.07.29.06.16.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 06:16:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: sboyd@kernel.org,
	jbrunet@baylibre.com
Subject: [PATCH 0/4] clk: meson: g12a: add support for DVFS
Date: Mon, 29 Jul 2019 15:16:52 +0200
Message-Id: <20190729131656.7308-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_061700_883455_FF95A280 
X-CRM114-Status: UNSURE (   8.44  )
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
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The G12A/G12B Socs embeds a specific clock tree for each CPU cluster :
cpu_clk / cpub_clk
|   \- cpu_clk_dyn
|      |  \- cpu_clk_premux0
|      |        |- cpu_clk_postmux0
|      |        |    |- cpu_clk_dyn0_div
|      |        |    \- xtal/fclk_div2/fclk_div3
|      |        \- xtal/fclk_div2/fclk_div3
|      \- cpu_clk_premux1
|            |- cpu_clk_postmux1
|            |    |- cpu_clk_dyn1_div
|            |    \- xtal/fclk_div2/fclk_div3
|            \- xtal/fclk_div2/fclk_div3
\ sys_pll / sys1_pll

This patchset adds notifiers on cpu_clk / cpub_clk, cpu_clk_dyn,
cpu_clk_premux0 and sys_pll / sys1_pll to permit change frequency of
the CPU clock in a safe way as recommended by the vendor Documentation
and reference code.

This patchset :
- introduces needed core and meson clk changes
- adds the clock notifiers

Dependencies:
- None

This patchset is split from the v3 RFC/RFC patchset at [3]

Changes from RFT/RFC v3 at [3]:
- Rebased on clk-meson v5.4/drivers tree with Alexandre's patches
- Removed the eeclk setup() callback, moved to a toplevel g12a-data struct

Changes since RFT/RFC v2 at [2]:
- Rebased on clk-meson v5.3/drivers trees
- added Kevin's review tags

Changes since RFT/RFC v1 at [1]:
- Added EXPORT_SYMBOL_GPL() to clk_hw_set_parent
- Added missing static to g12b_cpub_clk_mux0_div_ops and g12a_cpu_clk_mux_nb
- Simplified g12a_cpu_clk_mux_notifier_cb() without switch/case
- Fixed typo in "this the current path" in g12a.c
- Fixed various checkpatch errors

[1] https://patchwork.kernel.org/cover/11006929/
[2] https://patchwork.kernel.org/cover/11017273/
[3] https://patchwork.kernel.org/cover/11025309/

Neil Armstrong (4):
  clk: core: introduce clk_hw_set_parent()
  clk: meson: regmap: export regmap_div ops functions
  clk: meson: g12a: add notifiers to handle cpu clock change
  clk: meson: g12a: expose CPUB clock ID for G12B

 drivers/clk/clk.c                     |   6 +
 drivers/clk/meson/clk-regmap.c        |  10 +-
 drivers/clk/meson/clk-regmap.h        |   5 +
 drivers/clk/meson/g12a.c              | 567 +++++++++++++++++++++++---
 include/dt-bindings/clock/g12a-clkc.h |   1 +
 include/linux/clk-provider.h          |   1 +
 6 files changed, 540 insertions(+), 50 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
