Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC0CC04EB8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 16:53:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13C2C20659
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 16:53:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ig/ZqWXW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aKSGKmWM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13C2C20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NchJljJ/3+lSO++5aCj+J8APyhonj2crw53nL+8ha8Q=; b=ig/ZqWXW/7NrEC
	YXp8Uy19HcFaTi0m/fjGYnesG672EPvP4FdkhxClAQtQsKTXwN8YUB6NJlZgPsLP5xRCGrkOpuxuV
	ukd0DgPVkVhRtLjgPDuka7YIwVtHukIjoziiq7qaSuK1SrYYqrQyrB8dMgmqJjyFerQgzPtjpyCqQ
	7eSH+AAENQcdPiVzpY8YdIDgDDKHXSNExQ4fM1+iYLJX3l5DXHayMK+5DliCkzadPPHnSz8XwPvtz
	iGnfxs2lpeN+QU0X7VlJnRuPitUABwOSMDccMnvO0Ium9D3b8XalE9EMmEkeCe7O3Aru/BEnhfqZS
	UlOFScoM6S3+AlVSvhJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUDwz-0001zo-2a; Tue, 04 Dec 2018 16:53:33 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUDwt-0001jM-TX
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 16:53:31 +0000
Received: by mail-wr1-x442.google.com with SMTP id p4so16700227wrt.7
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 08:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R3lu1O3dzevjwf1kiOi6nnvjRZAndn2B6xOh4odokpA=;
 b=aKSGKmWM8td3reog3gZJIfKDs07EBcHOCuCLVlvinTdBPUNsU6lkv3yhZave9icP91
 YBC4na8hj2iyTj3c+9rkxteLCChZ457hZIG3r22LfghWpyT/DuacUQV+RmAGJIniwa5G
 e8T/YEPTxbEc5v0xYen/HBZZribpWxuJJgOEl0YCtTsIdlSk+091C/eZL8oUJNjhBvrW
 9nts0Ix7e3NPZKTMQGM+YMjQjrn28ngecRB1abZWpoX9Ir/askXlpRqlTWpsHoQnYOhI
 x6pcz4v6ltm2g2JpaFkygU00ny7/VR8RWWJrUzrbxsOLxIjsHiLzH9jIQm+Wyp09p/Ul
 OzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R3lu1O3dzevjwf1kiOi6nnvjRZAndn2B6xOh4odokpA=;
 b=f9KWxcCS0+K2s6UqQHSg4v0/mh3sbLfOYtzZeUsEEeoI2PkjTwfRp5oBjGCyJB1p4o
 0xPCgml52+RnQcJY+aEuHu8xtapr5NPfn7apSJFtjGfeqwcQL08MTqN9epUreKO25Ukb
 h3UNLmBc/wKWKv74Wdzp2xWTEH/MiJuxom+EIZiqVUb3j4OLmpeJh9MIHL8KpzIe/LKI
 Uj35MnU8kGwZrHaIZm69aV2RsQrigYVvxnXcoYEXVBsDTYbB27Pcp3lTQMmDGGPvYuhO
 0KkfxSKDrNGsfYgh666kDtk8XbyFcC/BENt/tF4DfXk7v+77NSqtd45V96I4avq2MYs7
 Cxww==
X-Gm-Message-State: AA+aEWZ31Ix7I67Nfunj6t+AEScY5ymI/R69PVHG9uiN1Ls3jjOcGPiJ
 43wM2FffqzTfzVpbTUg3fzvL+g==
X-Google-Smtp-Source: AFSGD/WTlf/YYHhc3QbpNCj8zrSV4Lrqsmr2YgfWNABBTkDANhfVDao/uept4NdNhVCcdYo9Q5XzAQ==
X-Received: by 2002:adf:8464:: with SMTP id 91mr19884579wrf.251.1543942395942; 
 Tue, 04 Dec 2018 08:53:15 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id s66sm11581633wmf.34.2018.12.04.08.53.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Dec 2018 08:53:15 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Subject: [PATCH 0/5] clk: meson: axg: add 32k clock generation
Date: Tue,  4 Dec 2018 17:53:05 +0100
Message-Id: <20181204165310.20806-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_085328_531355_101BBCF0 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The goal of this patchset is to add the internal generation of the
32768Hz clock within the axg AO clock controller.

This was initially added has the CEC clock on gxbb. To properly
integrate it on the axg, a simpler 'dual divider' driver is added.
Then gxbb AO clock controller is reworked to use it. Finally the 32k
clock tree is added to the AXG.

This patchset requires depends on this CCF change [0]

[0]: https://lkml.kernel.org/r/20181204163257.32085-1-jbrunet@baylibre.com

Jerome Brunet (5):
  dt-bindings: clk: meson: add ao slow clock path ids
  clk: meson: clean-up clock registration
  clk: meson: add dual divider clock driver
  clk: meson: gxbb-ao: replace cec-32k with the dual divider
  clk: meson: axg-ao: add 32k generation subtree

 drivers/clk/meson/Makefile              |   3 +-
 drivers/clk/meson/axg-aoclk.c           | 175 +++++++++++++++--
 drivers/clk/meson/axg-aoclk.h           |  13 +-
 drivers/clk/meson/clk-dualdiv.c         | 130 +++++++++++++
 drivers/clk/meson/clkc.h                |  19 ++
 drivers/clk/meson/gxbb-aoclk-32k.c      | 193 -------------------
 drivers/clk/meson/gxbb-aoclk.c          | 238 +++++++++++++++++++-----
 drivers/clk/meson/gxbb-aoclk.h          |  20 +-
 drivers/clk/meson/meson-aoclk.c         |  15 +-
 include/dt-bindings/clock/axg-aoclkc.h  |   7 +-
 include/dt-bindings/clock/gxbb-aoclkc.h |   7 +
 11 files changed, 527 insertions(+), 293 deletions(-)
 create mode 100644 drivers/clk/meson/clk-dualdiv.c
 delete mode 100644 drivers/clk/meson/gxbb-aoclk-32k.c

-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
