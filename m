Return-Path: <SRS0=GSYe=ZD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A75C43331
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 00:35:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54930206DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 00:35:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ka5haBOs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RXfSp74J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54930206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=quK3X5QTblcRa2vkUYuC//nfpM2/yNObiU4W8O6WMA4=; b=Ka5haBOso44AjL
	TeIk10KhtqTyDIkBiNgW1I/TSY6H/H34Tqjwz9/K2yuPKmnA8RBd8mtbDQrdHm1mn9b5nNEtA870P
	CnmV19MOXwXegXG3zi7Ywtxy2z/Ap/e3iiO3uSLhK+lmpFHE/eGWziNU/bErddQ/yA+5rKCdtg06v
	11+G6ryEKmEuKaF5hh9K7J1Uz98m3THm4n6YyF5uhigIqfalmaYxbxb7wYp5PZ69HNfkDiWxcsbmL
	1kXBUnN1GVPMu5yepm192LKHe+gyjyv/x1qdUkIG2JQ+Vpiorr/RAM15I4EZ0nbefl24fN0+5e/o7
	Hn/UZUoLdGfaeoCYA1Zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTxfy-0005lH-Ai; Mon, 11 Nov 2019 00:35:26 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTxfm-0005cU-T7
 for linux-amlogic@lists.infradead.org; Mon, 11 Nov 2019 00:35:17 +0000
Received: by mail-pg1-x543.google.com with SMTP id 15so8281975pgt.7
 for <linux-amlogic@lists.infradead.org>; Sun, 10 Nov 2019 16:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=MAQjdlepd8UIKchdOYWIna5btP7Z4rHfZh8LcCkk8Gc=;
 b=RXfSp74JRF+Q9oswISr1qzBeEsMI2+g7x2mF+E5M6hBHrbB/8AueTFM+XFzVgc2LEO
 KIf9rcmtyLer3qJ9LULtPE1yPEk5lH5N7xapkm3AXZGR3ciNmxBHWhskJZTIu6PYVMRL
 GYOHJ7kPmYSCuH0Oj6Nbowl7PxmIGIJ/bzs4rkM9aDEftsUms8ktdaBtF8h/sdyoaAyz
 SgTJ9vqFjNOPUj//aIS40Wdt38Xf2HIOSHPzRvDoZDUbyyU8noj4x5XxpH6/Gjpmjv5D
 6Z0b1k2dkYQtFTq/koe0t+IHylaplOVSWNs1/DT40CmKIT2f1AGmM66uuiOYci47IpsJ
 iHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=MAQjdlepd8UIKchdOYWIna5btP7Z4rHfZh8LcCkk8Gc=;
 b=E1VVlmWrsuVv7ZtdgVJpAHuJcBdp5opnwF2jDTmOYPsdh64/S1safhLb6D28xXzCTV
 SNkAM0bOA+WH3QzQ1YezE2s75Ou/MITDZRtYhGpcjVu36mVl81dpfP8YLOiq8I/2ekfp
 wSIeprq2x0Zsou1fBm+avuRjTUPqFWGnedYXwQtpHwq2EWY+2NO0yLE+O9rtdyLvXcQG
 pW978gu2T583XHCwcMFBGEKKISjUHmph2oAEmfsmlQpYcVoQ5yWMIjQjK3u4PSq31TOy
 ZRoDXYEgxLxiV328bDEFDlJlrdndlmtQSRrfgqqtjc2Hqu+x6f8OQljJjavs1CQFZgqC
 nOEg==
X-Gm-Message-State: APjAAAXXVGoEmWj34wSE6aZwDWZ27stx/ibCz6xD/PCu5P2/BfarrRnh
 oRF6Ob6mJlu8xFVOEqw/OybPpQ==
X-Google-Smtp-Source: APXvYqzphW5yoF8c9ArzqIBLhXJz8xl7kLt2GySGU5GViL8HOQ9POZ83Zzl9WPmPuFdongVoUPEOKQ==
X-Received: by 2002:a62:770d:: with SMTP id s13mr26871073pfc.239.1573432511177; 
 Sun, 10 Nov 2019 16:35:11 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:7c60:912:1380:6df8])
 by smtp.gmail.com with ESMTPSA id l24sm11946947pff.151.2019.11.10.16.35.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 10 Nov 2019 16:35:10 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Subject: [GIT PULL] soc: amlogic: updates for v5.5
Date: Mon, 11 Nov 2019 01:35:08 +0100
Message-ID: <7hftivs11f.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_163515_002507_8BDB7481 
X-CRM114-Status: UNSURE (   7.82  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-drivers

for you to fetch changes up to fdfc6997bd083acd066db99792694fa8a31a6cac:

  soc: amlogic: meson-gx-socinfo: Fix S905D3 ID for VIM3L (2019-11-06 11:12:58 -0800)

----------------------------------------------------------------
soc: amlogic: updates for v5.5

Highlights
- socinfo: more SoC IDs
- firmware: misc secure-monitor cleanups

----------------------------------------------------------------
Andy Shevchenko (1):
      firmware: meson_sm: use %*ph to print small buffer

Carlo Caione (3):
      firmware: meson_sm: Mark chip struct as static const
      nvmem: meson-efuse: bindings: Add secure-monitor phandle
      firmware: meson_sm: Rework driver as a proper platform driver

Christian Hewitt (2):
      soc: amlogic: meson-gx-socinfo: Add S905X3 ID for VIM3L
      soc: amlogic: meson-gx-socinfo: Fix S905D3 ID for VIM3L

Jianxin Pan (1):
      soc: amlogic: meson-gx-socinfo: Add A1 and A113L IDs

 Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt |   6 +++++
 drivers/firmware/meson/meson_sm.c                         | 110 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------
 drivers/nvmem/meson-efuse.c                               |  24 +++++++++++++++++---
 drivers/soc/amlogic/meson-gx-socinfo.c                    |   3 +++
 include/linux/firmware/meson/meson_sm.h                   |  15 ++++++++-----
 5 files changed, 105 insertions(+), 53 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
