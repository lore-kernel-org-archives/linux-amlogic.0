Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8C0C43461
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:33:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAF7D2145D
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:33:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zn+yDW0s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nLZL0E5h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAF7D2145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rtwyp25tuTxD4UlDAc6ZJoJa3KUWyEEBRngR/rYDNV4=; b=Zn+yDW0sUvJc7P0X9PNWkIyhca
	KJOvgzfh0U5MuCSPJcgmHG3UnuzkHvKwTEtF/WCvt0ughhUnZPnFX0HJYnyG+DG4T5OlsJ8/YA0mf
	zYuvpBzE2eF0bzpjvH48YmMlZqZXfpy+V0QjuOBSFUagpamfT5GiGm1InJxAsST5JuhvrepWsGW9I
	QqEcRTTmee8ve4jnGdg7C3xNfbnCSa2hxbZCeD9WPjFd76dHqmMGxjJ0vQH1WAeqSgWHSkS/bAGXx
	+64EomFlB8aK9xc9dY2eqSzUJTg6348GNofttzJdE+jVCK4bKyoB1wyQGNhOzQ9HpZCT+2/WSC5/W
	mWbnR8pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFCaQ-0003bE-Mr; Mon, 07 Sep 2020 08:33:14 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFCaI-0003X3-Vu
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 08:33:07 +0000
Received: by mail-wm1-x341.google.com with SMTP id e11so11825871wme.0
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 01:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J3RS9JG1OFuUivBOq0Q65DrLfYNaGRyuTeLPnUpa9OE=;
 b=nLZL0E5hTXbyG5Wr8LBDWOmTdFRZZtA8/BLOG6JyhATD05wafj69x9oiWzVXqyuk+u
 vvLGSwqGEbua3i8Fd7A3AX7qdbMYw2b/04anJjoE98LdKdCIxzlc3bjbqpCOH48qjlPN
 yueP2aJafvw+VvIKjvgQWKX6n2IGLSElvtn56ngJ1+59h8gWR7h3AiK4Ile5stZbBn9f
 1msB9efl7hBfcVVjM1+jpC+0rahMh+ErjtGnBsMuVYKmWyn4r36kIeBP/nu30Y1Ux/RS
 fnOtci2SbsFIywnscGhNV49UzzyuxMY+6Kt87MGpFFcjt8ytwLiDBRASmkOPMtSDJeKd
 326g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J3RS9JG1OFuUivBOq0Q65DrLfYNaGRyuTeLPnUpa9OE=;
 b=UyDUOIwozeCq0C1l1r6xFylQ/qxvkiQDLW3NT8vAZCoG28WziYv/N6/K2sKrgYDvz3
 Ux6UD7ayAN6FprEgdmncfekGJnfgxrtfGEEQezvlgET3gpKHemP76YbpQBvoASJtFZqC
 TJOfWWm4nycUBrOATBBCWxyCSQW4hWT3lWWk0fiogQRLk8Nm+NBcYTGSvDny/mOPeNlF
 aa+VY8/JxOyyFHVV3HGmnJcDR+J7Ftmaq3DEiKXxFCJWSVGL6ousz01WCjc1QPwwAWNn
 R+LHKAL8qLvVVytaOZEjs+cQDhjcArAEzb6VJbm2SVgEBtpQVYv24wlSoSOVEnD+WcE5
 y56A==
X-Gm-Message-State: AOAM530lo0Xdoh/i90olYArlK/l7T91f0AHdbGErYcEIHCny0sBYbqa+
 trHDWuSdt5ODECNaOfPPtF7+jQ==
X-Google-Smtp-Source: ABdhPJyqB1K44mhhek2pT1S0CFys7w5knzWvgfFdI9JtDO5OyEnsnRKYOx3MO5H4yDczNykPtM/tpw==
X-Received: by 2002:a05:600c:21c4:: with SMTP id
 x4mr20084365wmj.107.1599467585384; 
 Mon, 07 Sep 2020 01:33:05 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id o5sm25205111wmc.33.2020.09.07.01.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:33:04 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 0/3] arm64: dts: meson-axg-s400: add support for MIPI-DSI Panel
Date: Mon,  7 Sep 2020 10:32:57 +0200
Message-Id: <20200907083300.14412-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_043307_026465_A209B4E4 
X-CRM114-Status: UNSURE (   9.62  )
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the nodes to AXG and S400 board to enabled MIPI-DSI display support with
the 1024*600 tl070wsh30 DSI panel.

Dependencies:
- Patch 1: [1] & [2]
- Patch 2: [1], [3] & [4]
- Patch 3: [5]

[1] https://lore.kernel.org/r/20200907081825.1654-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20200904161654.24141-1-narmstrong@baylibre.com
[3] https://lore.kernel.org/r/20200907072708.26043-1-narmstrong@baylibre.com
[4] https://lore.kernel.org/r/20200907073402.26674-1-narmstrong@baylibre.com
[5] https://lore.kernel.org/r/20200904161504.23915-1-narmstrong@baylibre.com

Neil Armstrong (3):
  arm64: dts: meson-axg: add VPU and PWRC nodes
  arm64: dts: meson-axg: add MIPI DSI Nodes
  arm64: dts: meson-axg-s400: add MIPI DSI panel nodes

 .../arm64/boot/dts/amlogic/meson-axg-s400.dts |  49 +++++++-
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    | 118 ++++++++++++++++++
 2 files changed, 166 insertions(+), 1 deletion(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
