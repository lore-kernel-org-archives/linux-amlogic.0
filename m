Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B087DC433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 08:40:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84983206A3
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 08:40:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LW5aPjlX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jFO4SD/N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84983206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iNyMVgVdjRyF06RF3YaXBStqM0iQgKVlSbPajDLDrpE=; b=LW5aPjlXoAriNO
	vDVd2lhdLvrEMp4ESNtaaCi6Zbh1LBfwGThWVxjnGjDVH4XYOFZ+WYKs8jORs0X+Gbo4d7GzFhcix
	q8RF2F6iuUm8+FipEJO+aKy1/7Kd8uViX2zxV3hks4BcypMwwI1lc4KNh2pUJvVvIkEjdfEG9HLfA
	xLF2Og0DSrZ0Q9/8gbSTEpys/zOLhCWuxo70EcdrMSVlM2KX+PQSGfs7imzvVC9fHw2ts6js/Wmgj
	lQCK/uKP7PxC14g1e3M0G9kK+2xNynlmCf5LkZDGfB93ETn4tetF3Nl/snEXyNfhvJRq4h29OATYS
	KjWu7328+5Zc7YvyHFYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsk9s-000636-Ao; Wed, 31 Jul 2019 08:40:28 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsk9o-00060N-Lb
 for linux-amlogic@lists.infradead.org; Wed, 31 Jul 2019 08:40:26 +0000
Received: by mail-wr1-x442.google.com with SMTP id g17so68690603wrr.5
 for <linux-amlogic@lists.infradead.org>; Wed, 31 Jul 2019 01:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ddHyvYdReNbGhKO21uVEIvjorbfyA05g6IvzqrFwjMw=;
 b=jFO4SD/NApA8ipcldRSPtR96lDawCCqLtYXq++TEknbVxxDnZL3JrR85VsU33TrR0Q
 sr6bkOPmj8k3cMMWIHyHo1kEl5r7ZFWAqMXMNfV/lDvgwulIf7nvctpQX9u+9Rb13PY0
 RZPyJ+ytGSRsViVrMFJ0X3Vexgi+QVC/pfzBwlYbXCKrIyOyjqPZko61A3XLprZUWpZB
 TM9sf75PWS3HJhkfPNNDCZP267DP7mKOF9E2vu09UiUP+zhYmUvhIGGDI7AM1bVuj7gk
 PcoSHXA4zEhPTmpxcj/RDgR9Ax7fmDC+fYU93RMl+O+5kIFSyeSDweCKMigFWdo4k82w
 yoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ddHyvYdReNbGhKO21uVEIvjorbfyA05g6IvzqrFwjMw=;
 b=PiG5kwDiwQAIUUWwZi5bRWhOP+Tm9JeAidD5PPEzJJ9SF2i5bRGWvXX6LlUdul0rgo
 9lPkx8ymzCflU1mMiLhnggEaZlpuH4I5/4XsEVhflp+P9DBSDO2xUipf930liQfNoNwa
 8elBKA2lKMd3U3LTiJqv+/fXNcyTl8DrkesbsC1IIRtVTKcy8707xMcx8hxfnut7KhsT
 ceTe/ol6WMeVb14f4q26z6saeGyKVhkkqTczOwEDZ2d4cZDln/rJZT41pX3iGA1Ru9pS
 490+OlCSA+Zi6GGSzLLwGUKFmuI8nlQUjwCm5Xx3KayA7VZiVDkJ8RLVzajiN/vNlaVi
 BwtA==
X-Gm-Message-State: APjAAAVZMP0GAIrHs6L+b2L7YplvGcthT5J1iRKmTqX15Wv6+21gfVAF
 JdTefHhDVMSMZot/R1/3ulYU4A==
X-Google-Smtp-Source: APXvYqwHQz/DoxpqjB2gG7yElbPFxVQmLqhP/9pw+D/cpuZHA0yH1P4HyL+uxk4zqqNoXxyZE1dsUA==
X-Received: by 2002:a5d:4d81:: with SMTP id b1mr52426973wru.27.1564562422857; 
 Wed, 31 Jul 2019 01:40:22 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 18sm56049308wmg.43.2019.07.31.01.40.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 01:40:22 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: sboyd@kernel.org,
	jbrunet@baylibre.com
Subject: [PATCH v2 0/4] clk: meson: g12a: add support for DVFS
Date: Wed, 31 Jul 2019 10:40:15 +0200
Message-Id: <20190731084019.8451-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_014024_729758_58888F32 
X-CRM114-Status: GOOD (  10.35  )
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

Changes from v1 at [4]:
- Removed export of regmap_div ops functions
- Added standalone cpu dynamic divider driver
- Uses cpu dynamic divider driver in g12a clkc driver
- Added missing signed-off tags
- Fixed missing removal of CLKID_CPUB_CLK from internal g12a.h

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
[4] https://patchwork.kernel.org/cover/11063803/

Neil Armstrong (4):
  clk: core: introduce clk_hw_set_parent()
  clk: meson: add g12a cpu dynamic divider driver
  clk: meson: g12a: add notifiers to handle cpu clock change
  clk: meson: g12a: expose CPUB clock ID for G12B

 drivers/clk/clk.c                     |   6 +
 drivers/clk/meson/Kconfig             |   5 +
 drivers/clk/meson/Makefile            |   1 +
 drivers/clk/meson/clk-cpu-dyndiv.c    |  73 ++++
 drivers/clk/meson/clk-cpu-dyndiv.h    |  20 +
 drivers/clk/meson/g12a.c              | 535 +++++++++++++++++++++++---
 drivers/clk/meson/g12a.h              |   1 -
 include/dt-bindings/clock/g12a-clkc.h |   1 +
 include/linux/clk-provider.h          |   1 +
 9 files changed, 588 insertions(+), 55 deletions(-)
 create mode 100644 drivers/clk/meson/clk-cpu-dyndiv.c
 create mode 100644 drivers/clk/meson/clk-cpu-dyndiv.h

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
