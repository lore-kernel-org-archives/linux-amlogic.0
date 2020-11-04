Return-Path: <SRS0=aM1E=EK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA9EC2D0A3
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Nov 2020 13:47:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E85D621556
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Nov 2020 13:47:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w9H+xFCQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gQgZf7No"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E85D621556
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NGk2B75w7IBfpRQS9hvP/xMY+ECWnGqmVE6pu+sLJyI=; b=w9H+xFCQ9OFdD1e9JC0LmsfLTj
	TT7OSeLwQ3sX8AiyF2lV1NpeJSFUKWFtzMryViZXzBCZOx/bPY68spNpYe7FIZHZfjQduxeKEFbO2
	z4WwQYevRuCmhRSs/kHqfxaHKguvPHky42LwthevVj3Ef52LTIQma5j0vLKmsFc2/kdBIxAUBSpWC
	LME8lmZoMKTuI3Z7GpXCFyDDy8FUHericnz98DTm+vM/eVkbVmCpOLoc7YuFWJhgxbO++jxAxywFX
	lDXHuLhT9sgLddt55xSRdkvnr0va850RZ5F2FI890xHR3D6rImm4aAt7bjoPTbDISbqJjNJMbe8nC
	W3Gk/Myg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaJ8X-0005gI-Mc; Wed, 04 Nov 2020 13:47:41 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaJ8S-0005d8-Li
 for linux-amlogic@lists.infradead.org; Wed, 04 Nov 2020 13:47:38 +0000
Received: by mail-wr1-x441.google.com with SMTP id p1so2952522wrf.12
 for <linux-amlogic@lists.infradead.org>; Wed, 04 Nov 2020 05:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XmwQkPQqqWfXNlvX22Ha9TLOtrxJBFOVDCpoC+8Emho=;
 b=gQgZf7NoHKA5npz3yO3fH/y+LWZsEmkIvnyGUG9rn+YBRvu3h/vOlMi5Q10bvsarb4
 CDhpCdKTzDbxU8N4tyzVdlACP3Eb4NE8rtTDr7UZpwWIb9miga30uuEQ2aZ/o81pwEPE
 BISJQMMP56TEgZWjE6oUfm0z14krbjWCmPQVPB9Gwq9MySVHb+eWEPb1utja3YP4VU6w
 wUddh+FsA260N3FHdxcxbdevGixTe6mW8/vtcQFKUxKssRlAqQKBJX1oCNaz50l9rf6k
 gk3xqjpMvAmN73bxFSpbnYbOVp/gp4ND3AsZ3qpsC1IgEwXG2f1/fkhpseNvv0Wk7WJS
 si6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XmwQkPQqqWfXNlvX22Ha9TLOtrxJBFOVDCpoC+8Emho=;
 b=G8sr5XtQojvwbVNgoJciuUOaCo2VfcjOosYzcct0pFPh2v6LTvqV6EO4XtLxZ9R19D
 Lsi0+mSZzZgI1Se4jyBtzdsjWptUGnQ54x6WhYcokZtm7TCdASfuU2lGPho3h1YQ2FZN
 Ik1IaTJhA/hOz5Smu7nel8FhFaAQTv6/DSJxrveDhA86JJttsrh/2TRagO4+52yvtENK
 0QpuTwYay3mVILGipuVYLz6PfQ+EbWuFWJvoRSW+cIw1dwL1PYX13AtyOEe+BhyCqwtG
 cAVMa31JGZ6+yGEVmUCZc4sK5SJhULH2Gp0I+GvFhyCTHg41t3o2jovsch0F3HY2yiht
 0/hA==
X-Gm-Message-State: AOAM5330GOw021ncVTcaE6Tu2uCQRvStoMGrg2kq169g+Gol40ityL+e
 qs9zZqXWUi79pdS502NTzOtspA==
X-Google-Smtp-Source: ABdhPJx9m53A68O1kVO4RL6dPwUA8WgeZ2Rhw0wkFix4N7HZp5KAorb35ru83vcaAkHLSjFSDRIizQ==
X-Received: by 2002:adf:a51d:: with SMTP id i29mr32865331wrb.409.1604497654114; 
 Wed, 04 Nov 2020 05:47:34 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:3d8d:fb08:21c9:faa3])
 by smtp.gmail.com with ESMTPSA id 30sm2759586wrs.84.2020.11.04.05.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 05:47:33 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com
Subject: [PATCH v3 0/2] phy: amlogic: Add support for AXG MIPI D-PHY
Date: Wed,  4 Nov 2020 14:47:28 +0100
Message-Id: <20201104134730.1545875-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_084736_852425_21D56BA3 
X-CRM114-Status: GOOD (  11.78  )
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

The Amlogic AXg SoCs embeds a MIPI D-PHY to communicate with DSI
panels, this adds the bindings.

This D-PHY depends on a separate analog PHY.

Changes since v2 at [2];
- Rebase on v5.10-rc1

Changes since v1 at [1]:
- Fix bindings and add review tag

[1] https://lkml.kernel.org/r/20200907072708.26043-1-narmstrong@baylibre.com
[2] https://lkml.kernel.org/r/20200929093203.337954-1-narmstrong@baylibre.com

Neil Armstrong (2):
  dt-bindings: phy: add Amlogic AXG MIPI D-PHY bindings
  phy: amlogic: Add AXG MIPI D-PHY driver

 .../bindings/phy/amlogic,axg-mipi-dphy.yaml   |  70 +++
 drivers/phy/amlogic/Kconfig                   |  12 +
 drivers/phy/amlogic/Makefile                  |   1 +
 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c | 413 ++++++++++++++++++
 4 files changed, 496 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml
 create mode 100644 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
