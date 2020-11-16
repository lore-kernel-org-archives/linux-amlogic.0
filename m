Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2385EC4742C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 10:13:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90A5F20709
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 10:13:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DuROdm2M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VvheAsTb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90A5F20709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NGk2B75w7IBfpRQS9hvP/xMY+ECWnGqmVE6pu+sLJyI=; b=DuROdm2MaRoMnDNdpZEupWYRYv
	4UNl07XJ3zqiSjWLcw7Vbkl+XOHBm23sWugBUvMjQ9FZ7GXPfvxKO/udmclveuib5Nh42uLY5HIGv
	piF7sMPmJgHPCxL3C9VIWOm8N2r49sabXXrmY4+00sd+weFUxg0fv/mRszLJbW3Hotny0FX8UqZl8
	vcIeYvE9SaWIg9U0XMY5kNITjP0LU/rC+Uby1KFQuqfps79hBBY+LXCBgwJM5+2jXZ1bj0prSLu+W
	tua7jfap+EIKoqYUrbuLeiRIwvk8OE/+3KfID7YvW0AlGmwqrLbM5UMdHHD4VrKvaoAqGd6pclFvm
	H1LGWEMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kebVi-0008FK-Oa; Mon, 16 Nov 2020 10:13:22 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kebVg-0008EA-8F
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 10:13:21 +0000
Received: by mail-wr1-x443.google.com with SMTP id l1so18008876wrb.9
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2020 02:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XmwQkPQqqWfXNlvX22Ha9TLOtrxJBFOVDCpoC+8Emho=;
 b=VvheAsTbE8WwpQ2oYwLrAgkSd7Iiqal9qpsjYaiEUXlrvw4ul0QXafZM5YzuXHglSq
 g/MWOWQnEjTSABEKewgUk3oMSFqBsw1lKeOPIKXX5mZUYH7fGQlrpid6Tqk2bwvFxgHj
 g8iA+zzNudSegB+t6KrHGLYAVeYMMl2xDFWm4/DZCTtTOd7u6QA5hEz87tP4W15NjRhb
 PitbTnLHGuFd8kNnOCValDGKx8Uu99kfaTU1pYkurBWDWFG+BQ6rj0KnK4bCbSd6SSCq
 /rvKzF654gGMCjXP4nbyIygBc0XFsVMJSl6vjV2Iz6fCSkJr8u4+S0EkNpPTv/uMT5pg
 BypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XmwQkPQqqWfXNlvX22Ha9TLOtrxJBFOVDCpoC+8Emho=;
 b=k8wa61RIdPgsQq5NWOHzgNuWE8ZLqDpIVnMXgR7ogMZNHQq2IJfqsn1rgTWTE7wUBH
 fgEbjE/Yr577bqbresJIpm9bmlwBlxL5HtGSqVz7qWN1yd7gBvqSJpP3RAQVLgulacPD
 bOPmvEJhM5YLO7M31whwwhD0zcb/R8Me2t60V0syEXv23JVc1fsISv9vQRgc1PFh3ip3
 8G16wqDOVEZuer4CFXDrHKE/7H0jNN7luDBl0UN3BW2CHOQuV/tU/vYJtUHDAX0ssQBz
 ZBEqG7d/e7kis7ZDgmc8A2c5Bvmd/i9ob6ER6Hd077XRPC8neaWsVZlUJ/omBlI5C3i1
 0PZw==
X-Gm-Message-State: AOAM533YYbjjA9ied+hynFbtuIuAWhyrRV8GpyHuKX9ZFvEavIlcVniU
 Rbw2hIgR4n56d8wMS99yzUdzmg==
X-Google-Smtp-Source: ABdhPJwojuwRwPWJmJTh4YRPyQtsJWF1DKV/v95zcHZ2hPsI9lVNq8Xs4AKIMwnPt6nVMY0I7URwTA==
X-Received: by 2002:adf:f041:: with SMTP id t1mr18646025wro.139.1605521599046; 
 Mon, 16 Nov 2020 02:13:19 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:edb9:72a:9e35:6eb])
 by smtp.gmail.com with ESMTPSA id
 g66sm19082228wmg.37.2020.11.16.02.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 02:13:18 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	vkoul@kernel.org
Subject: [RESEND PATCH v3 0/2] phy: amlogic: Add support for AXG MIPI D-PHY
Date: Mon, 16 Nov 2020 11:13:13 +0100
Message-Id: <20201116101315.71720-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_051320_340883_D096F814 
X-CRM114-Status: GOOD (  11.19  )
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
