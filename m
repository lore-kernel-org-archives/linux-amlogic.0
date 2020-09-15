Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E24C433E2
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 12:46:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 425E620756
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 12:46:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="chtNHvWq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vnq12OZ8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 425E620756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QfGUd+ZIoJHnpCl2PF0igFtkqrpZ1KBdfx4w7541IjM=; b=chtNHvWqff7DEfcCc6ksIQdM/D
	NsdkRa3j0x1pYrs2bdmFoPgbtXZ01ilZlKb+dxcWHGJgiNgkj4IILHhSPnQrQlaC5bHYT0oZsH/N9
	3zYHKDr+UpmJnd4eITBFy1UenJvf1ct/DhuyOuTd9pZMRj7lvsEKym3GdXRi0dt6W+dsHkt8+E2uu
	smEZBKzWaofIVE0m1//zjT3AScWwcsyceDh5LV2pXgbpTkEeB3cq1Yh0Vz5zWDesTRoS9HSnMqhxU
	v5OB/+8umU/ubmIAYiH9kAcVgoZMZgtUU8u+SGDURdaHqk+Q77rdJLGMK8hFQKm9iwMw9fQ6K0zF5
	RtYvUTwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIALS-0002tK-Lx; Tue, 15 Sep 2020 12:46:02 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIALN-0002qC-Iu
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 12:45:58 +0000
Received: by mail-wr1-x441.google.com with SMTP id t10so3209022wrv.1
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 05:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PUcUK8YA7xOYjNtjzxXPOPtmn9lpMNim28eyU9a7Hf4=;
 b=vnq12OZ8h+snAbmU97iIZz1Xs6BZApGeIO+pwz8ITYX8upAHSJfhj4ZI+YsVyDfd3t
 78y7H0Qi1P0lHHPn/CMTUbHSCT1uascuXBTiCv+E1xPSeRrOLgGltLj1G9V2aCXe8soZ
 /rNy2cpnLf6NjM5HZfoEp54Ra+pSLk/xaQvI6aGFFTpiwoBX3WiFVcw7b/AAwE78Xsjh
 JseJEkm65hME+gZKqdhLAeKhGN8A+PinC+RGE6WtYds9wZvUIt8Z9LHJf5VBdPGC6Wrm
 hxRF54lld9/K/YjwTC6ECTGJvis46Zk8sfS9pyyTNUJPFZFwIrgex+ljhrkhshLnEjKB
 6OuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PUcUK8YA7xOYjNtjzxXPOPtmn9lpMNim28eyU9a7Hf4=;
 b=IgNODaw81I9VtGwzAICCxUvOhBuFX7BOjpsxYmItuNj/5dEdHPNYu5rXN9JEdB9A1u
 WAvzpRNhOxolaRvLri3gPAqGVMMR+ZpbSk74wg3eKLjGA8f/25TP0s31E7xH6NAxCh7q
 ktVJrwqzVnMdm2vl/ZKYGPuMQfCuuF70y0/UYoadWc01nMHZa8+wgKmSDfy155cqN0Hp
 ceAYdzt/m5iqLNO4ZR/sB0qE2I0M+mHMLxweNnl/Wogy/nmLbWNi0RCFFtG9EqST3+VP
 8Tum9ncKN3cQ27mqxX9Azpjlwces/zSO/Qv/sgUIqC9dt66gjuamLoEuTej4yMXCNb2u
 YwCA==
X-Gm-Message-State: AOAM532mZ3cbcN9jaCsmv5g2GVBuuGyQdItGkKJ9nauCGbkoUa7sAxeE
 CQ7NURmmflcGbu7kPjG62uLDvg==
X-Google-Smtp-Source: ABdhPJxwMlDEHZh9fctKaT98W85S9FRLO1xXWLr+E4hFyfBsptLyDwy8SoxnjHKzdeZGkqN83g5/CA==
X-Received: by 2002:a5d:40c7:: with SMTP id b7mr21519638wrq.300.1600173956444; 
 Tue, 15 Sep 2020 05:45:56 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 q8sm26548589wrx.79.2020.09.15.05.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 05:45:55 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH v2 0/4] clk: meson: axg: add clocks for MIPI-DSI support
Date: Tue, 15 Sep 2020 14:45:49 +0200
Message-Id: <20200915124553.8056-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_084557_663654_0D8F086A 
X-CRM114-Status: GOOD (  10.55  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the VPU & VAPB clocks along the MIPI DSI Host clock.

The clock scheme is based on the GXBB & G12A VPU clocks, with a different CTS
clock output used for MIPI-DSI.

Changes since v1 at [1]:
- update patch 3 commit message to reflect drm driver state
- added comments in patch 3 for clock specificities
- removed useless parents comments in patch 2
- fixed bad flags in patch 4
- removed holes in axg_vdin_meas_parent_data in patch 4

[1] https://lkml.kernel.org/r/20200907093810.6585-1-narmstrong@baylibre.com

Neil Armstrong (4):
  dt-bindings: clk: axg-clkc: add Video Clocks
  dt-bindings: clk: axg-clkc: add MIPI DSI Host clock binding
  clk: meson: axg: add Video Clocks
  clk: meson: axg: add MIPI DSI Host clock

 drivers/clk/meson/axg.c              | 819 +++++++++++++++++++++++++++
 drivers/clk/meson/axg.h              |  23 +-
 include/dt-bindings/clock/axg-clkc.h |  25 +
 3 files changed, 866 insertions(+), 1 deletion(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
