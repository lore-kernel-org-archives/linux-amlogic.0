Return-Path: <SRS0=mdkS=XT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7022DC432C1
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 15:34:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39D8820665
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 15:34:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QzkZp2V8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NEnONSEs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39D8820665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QzprI3XZ3ahAalUrAwjoTOx8SeU8/XZVwQlrN1qdBNY=; b=QzkZp2V8HwTF3O
	TNhDHyGFmGYPc3Q8QfSnMlvwC9I0jFJg2WACRy6vfD3/ikl23YYlWcfj6eZtrUH1kioLzmyrF/CCu
	Veio6B7yXtfA33Wh/CuyaDTgbn4za0nwb1xdGTWHL4BGFMXTlqAbm2AUMaC4EGjuk3IO6m3nYeSH5
	pbqIL3FXhBPVpK5r4GtgBfS9ExOpB8l0NbZp52bUiCw7AQGc3Dx0RVXo0MC4tTYgiAsLYWhwE8clk
	hhMIgny8qG89WLfC6B+5V+qGRL1S9SDL3Cky0ZyCOXH9euAM2QKgRSfnCDJQY57fNTBGjI/cuqr2K
	GVjpSHavVjDdxkYF6zNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCmpK-0001fp-33; Tue, 24 Sep 2019 15:34:06 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCmpF-0001eM-T6
 for linux-amlogic@lists.infradead.org; Tue, 24 Sep 2019 15:34:04 +0000
Received: by mail-wm1-x341.google.com with SMTP id m18so565193wmc.1
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Sep 2019 08:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BVrzY1NA5Ch72acoAjxkDHVhN4/WGgUil5qUxNRRH7o=;
 b=NEnONSEsVbr/P7iWXVn1NB30VoyNPibfxL6JPNvs+Wa+FQKgX+BO3sG/7Pa8Tj/kDN
 EWbfbmLeDMMldOVcGmotYrPvIhzOHm4WDIRcdKZZFY3pajkZuTNdja+qvr2Y7608OBwG
 uXD8s/aUhfMn1bX6+ciSPn5LtHzQV3067gUDCO7V0Ycx0Mj5KJX9p3mK14eVv7G96rT7
 di/GeqkqnhNB/Nh6UFrsb5LA6XwcWZd/Rs4k+/YiQ9j/SzWlyqVSEUcGqVO2tOEDuWIa
 BAdKgEis7K5HslkRrMeXS6m4z7L8UjepywyoKpol17FoAXFe1c5zMYVeG1NG5e31Obh4
 sTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BVrzY1NA5Ch72acoAjxkDHVhN4/WGgUil5qUxNRRH7o=;
 b=IiyeFkLFHbiXzXJ34QI8KVqz4zERe0aeCRRRvpWg0L3670qBhXNKfHen/zOkpfoFGQ
 p0ctgsikLTcApH4sOTF38+SFcxKYf3JRPFZEBGGV8VDAKBB6kX5dANUbQliGIZoE9Bjj
 DbZUkHVAao4aQlbnwicWcde4GPGik4jPkOIMBsfEaJyttGAQYMxUzJQ09You0NoJgu0P
 /Gqk6MfQ7r7jyBSrR68J66eKcP3+6Z87lDGWYep7Fp/6EKa+HpYkupuzD+7dkiqX+VjV
 GyFbuG5wW5pDsazduGQBfvnfXIM7JnOxIlLVIIL4TqGqcYGa6w5K2kHX8X8afRngIDy1
 PC9A==
X-Gm-Message-State: APjAAAUPszKOVS9wk1cfCTlfkq8fgxdKZOGoJendRX7NKIQIK1vTK442
 7zXL8w0+v1eW3Ro4jAkHLAG2sA==
X-Google-Smtp-Source: APXvYqyg/jaDIFG3IyGsgXjUNtj7JsiTHUa9FnEaXGDBkdZpMfihQgExMr7nYHu57aDRvaYl8zLFLg==
X-Received: by 2002:a1c:f30b:: with SMTP id q11mr711033wmq.57.1569339240364;
 Tue, 24 Sep 2019 08:34:00 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id d10sm144240wma.42.2019.09.24.08.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2019 08:33:59 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/7] clk: meson: axg-audio: add sm1 support
Date: Tue, 24 Sep 2019 17:33:49 +0200
Message-Id: <20190924153356.24103-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190924_083402_078442_5330856B 
X-CRM114-Status: GOOD (  10.17  )
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
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The purpose of this patchset is to add the sm1 support to the amlogic audio
clock controller. The line count is lot higher than what I hoped for. Even
if extremely similar, there is a shift in the register address on the sm1
which makes a bit of a mess.

I could have patched the address on the fly if running on sm1 but the end
result did not save much lines and would have been a pain to maintain and
scale in the future

Instead I choose to re-arrange the driver to share the macros and declare
separate clocks for the clock which have changed.

Jerome Brunet (7):
  dt-bindings: clk: axg-audio: add sm1 bindings
  dt-bindings: clock: meson: add sm1 resets to the axg-audio controller
  clk: meson: axg-audio: remove useless defines
  clk: meson: axg-audio: fix regmap last register
  clk: meson: axg-audio: prepare sm1 addition
  clk: meson: axg-audio: provide clk top signal name
  clk: meson: axg_audio: add sm1 support

 .../bindings/clock/amlogic,axg-audio-clkc.txt |    3 +-
 drivers/clk/meson/axg-audio.c                 | 2021 +++++++++++------
 drivers/clk/meson/axg-audio.h                 |   21 +-
 include/dt-bindings/clock/axg-audio-clkc.h    |   10 +
 .../reset/amlogic,meson-g12a-audio-reset.h    |   15 +
 5 files changed, 1373 insertions(+), 697 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
