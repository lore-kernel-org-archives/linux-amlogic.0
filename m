Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B14C04E87
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 13:14:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01DB12171F
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 13:14:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sriodja4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DabpozCT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01DB12171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=82g9C+zPTQFMkS1sSxEGs9FTP2ucNw+IdayPhOXRMGg=; b=Sriodja4R8usab
	3dMySeYhplQK3SwLiosECgPI1swRNUNN0J4PbVMQ8iwOwD6gwf3s4pVKpIAMfjSz4JPr5TGLH/hWI
	bF1jlwxKlGGtl5e/vkPSE3Ub7Acpxgp78kmp3k6BpEqIse9awzvpx1Iw5cf+K9+wdUMuvT19UwoFA
	SAOP6I7r7XtbqKuAaJjndvR+p9fY4saRGYz0uwgBIsCfIOL0allQOyoCV+lG+5GUF/QvrDCxlkeB2
	kZNTs6hRAQBWhrnEJTUPCqHz3quxEAeiFLN04ck4RJ/48aYkQctoxD4Yf1rJYvodazqZnoPDccMUO
	h6QwIKtWRQi/pZTcB+RQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSi7J-0004h9-7e; Mon, 20 May 2019 13:14:13 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSi7G-0004g5-B1
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 13:14:12 +0000
Received: by mail-wm1-x331.google.com with SMTP id q15so13002542wmj.0
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 06:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vM5pv+BQoP8scy/zAPoM9eQQv0k4Qnfy+iC/Zx6yuYA=;
 b=DabpozCTljhiuQK9QrebXpccXYRwzclUP4vK0OAUbMnMu8Qi58I1NDibj54SEIzo9R
 SfnCaxEkMc1Uhdq6rWh/mtI+LMm7hE2XA2b/qc24IaNYdJxgiJ4inIINn/lNJFeQmbhT
 U6u861AXckob5AeViOuw7bdQpgi1gr/i0VUVEY9rWOr7l3JvW1TcI73XuF41euXOMweY
 oJiPBWWWrGDfUv2u/7sjvLfeb5dZv/gsC8joINdnsphCFGB1U95/yJ07bFAnyAhcsju+
 ydyhcwyD3O69Rhjdo4/s82FLSxIAeAmGk8mi3zLZfDKdtei4lYhuWo/B9QH1jRCblrzy
 R/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vM5pv+BQoP8scy/zAPoM9eQQv0k4Qnfy+iC/Zx6yuYA=;
 b=mQM6SgjMLWCc9bPvqJTwl7NR6YlGT8+EXkfJQiRl5sJgrJb6jxV60JwIn2z5R98POM
 h9/ISuWLCI317DFuZvYEbAglCR1Cg2mmAjOwFBHVmaJAXqvHs/U+BC532cynx2gYTWyt
 63qTmXKOkGhE8nj2MWkMVcezonzpWyLj7dvovKxiz7qbc33dvtBMW5NuWuPam+uDsYPz
 gLlXXWVtb2hf9CL4GxLGpNdRpFG0cdBla0TgFOa95Gh+U+b7EZldS4skqDJvHqQDpjyL
 P5diu9/oOkn21kPvYuj3GRWvIiATBiwzLU2hOy99vfeB1nO68ZFDggdy0PMoLiUWN/je
 e8yA==
X-Gm-Message-State: APjAAAU9wcpjdo3nSmFSZ0YFq6a8iTdEus+E7QJ529GtipcpjnrWmdhe
 xowVQGerIbgG2uYRbbFjdWw2GA==
X-Google-Smtp-Source: APXvYqw41vjWwxdNzZM0t2ysXvFl+JiMozP82cEPi/tn/xJK/zONQePg6F113T5Q7tayNsVVWoxfzw==
X-Received: by 2002:a1c:7d8e:: with SMTP id
 y136mr17488503wmc.129.1558358048365; 
 Mon, 20 May 2019 06:14:08 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z8sm18054284wrh.48.2019.05.20.06.14.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 06:14:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 0/5] arm64: dts: meson: g12a: add ethernet support
Date: Mon, 20 May 2019 15:13:56 +0200
Message-Id: <20190520131401.11804-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_061410_427053_6B3577FF 
X-CRM114-Status: UNSURE (   7.60  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add network support to the g12a SoC family

This is series is based on 5.2-rc1 and the patches I already sent last
week. If this is not convient for you, please let me know, I'll rebase.

Also, you will need to get the clk tag "clk-meson-5.3-1-fixes" (to get
the update MPLL50M id) from clk-meson [0].

Changes since v1: [1]
 * rebased on v5.2-rc1
 * s/eth_rmii_pins/eth_pins
 * fix MPLL50M typo

[0]: git://github.com/BayLibre/clk-meson.git
[1]: https://lkml.kernel.org/r/20190510164940.13496-1-jbrunet@baylibre.com

Jerome Brunet (5):
  arm64: dts: meson: g12a: add ethernet mac controller
  arm64: dts: meson: g12a: add ethernet pinctrl definitions
  arm64: dts: meson: g12a: add mdio multiplexer
  arm64: dts: meson: u200: add internal network
  arm64: dts: meson: sei510: add network support

 .../boot/dts/amlogic/meson-g12a-sei510.dts    |  7 ++
 .../boot/dts/amlogic/meson-g12a-u200.dts      |  7 ++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 90 +++++++++++++++++++
 3 files changed, 104 insertions(+)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
