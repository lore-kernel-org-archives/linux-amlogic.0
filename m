Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8015CC4742C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 10:16:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1053320888
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 10:16:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t0rA93ni";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TZjbGcnk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1053320888
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k8jr1Qe/vudK52HC5xv+zViPA4yoC71+5Gmy5/hLv+E=; b=t0rA93nisVWufkLPGe1eb12WW5
	LqNUpMO2G46TobunzvwOtHy5Mk+Dz2YvmpdXfl/7bbUoWOa2e/RC2wwQds/UXHyMvvbh/cgsW9KJw
	33iDYCr1ne7+UYrYy+KepLXdh1JqF8S1JFEVcaMEXkEatEkjczQ0sz9/5NVpmSOAB0ONXs2XifQD6
	boTeeRVT/KgRvORfSjlBTVOfwqff0GuugfDB4ng29fU/ye/+0MwEEi3Ec6IhGAlviSWtI5HCVO0Ci
	SeEbBQCfdtBWPGJauxGc626lj+wGKDSW8CUSYH+CLNXwnWRSmq6QW5BLN8Q0BblX8P+5QrBvYEJem
	CqsWqIcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kebZ8-0000fE-4k; Mon, 16 Nov 2020 10:16:54 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kebZ6-0000dv-25
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 10:16:53 +0000
Received: by mail-wr1-x442.google.com with SMTP id d12so18006981wrr.13
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2020 02:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cPcVTlt4PtaJnqwyX4xYXu+/IKdY0k4HutlOclbS1nM=;
 b=TZjbGcnkBRQSD8Dl4SgMJvoMpmw4tLtZFcPYqIvp+RKueRfsMqBuCAC8vyU/ubvNYX
 uLO/dh8A2P3ZugUzDocHm3jFdQeZONKKsi2g5neE1s+gHXG9jd8tOnQQYWoEBCR65qIh
 vq0uyQzd+2aOQ5JCaGNVJM37Wc+b7BSqKp6F0O4il/O1uA1hki9xlLHkMEmwe548jwHE
 FrZdFIkJ9cFJKsY2NgtRJO92jwP6w7loQKZxM2R8M14J1LvBEBxycHLdz08x+NNJ7UaZ
 pCqjpBscww5rIahnB9+0ykkPahxxBTM8GOXsE164c62x9rS7+cA+Ed2J+UR1Z15jSdk7
 NWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cPcVTlt4PtaJnqwyX4xYXu+/IKdY0k4HutlOclbS1nM=;
 b=fYVSeE+7SxURbVcCSgVR+etj4XoAWr6nq7Ekqzb7bflDQOBlQkpTEPedoPhqZwiXLx
 bwUhkiQYrg5wv/QE9kIm6QdpQ+SmEt2E5ocy95gbgQ5qj/E6C6TG49KCLY5ANT2zewPE
 aTJvRm88ujbEVthrv0nLPoo6Y1ib1nufsOkJ/Phv3lS+TOKIQebR70Zr27lyFMwgF87i
 kTkydV7+fzA50X2laxFjaijI8ZUXoiU8edV5+IsCnLuiqiGSbR956w3V+8iYKyWDYOOs
 m8v9YJOSfrYzmXKJV8F1o3pVY7s7O3G52IGyan/nfKCvzIOK8joLr2hoToKY5jEh6X7o
 us2g==
X-Gm-Message-State: AOAM532NMkPDrAS7FI6VZ4u7McI3ynmZxAsatOza/KchrcttVseXGqcQ
 HwAaCE6g1RX+w2sQUMfd38XPHhBv0J1Li6uL
X-Google-Smtp-Source: ABdhPJwQA7DtozqXJFXVwh4cU0VIT5A/4FmmNR8g+7sNzKjawJaeF7OXh2yqeovX9ruqo2vLuDccOg==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr18853811wrr.1.1605521810515; 
 Mon, 16 Nov 2020 02:16:50 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:edb9:72a:9e35:6eb])
 by smtp.gmail.com with ESMTPSA id
 c17sm22265131wro.19.2020.11.16.02.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 02:16:49 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	repk@triplefau.lt,
	vkoul@kernel.org
Subject: [RESEND PATCH v3 0/3] phy: amlogic: add MIPI DSI function to analog
 MIPI+PCIe PHY
Date: Mon, 16 Nov 2020 11:16:44 +0100
Message-Id: <20201116101647.73448-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_051652_144186_A60FD3C4 
X-CRM114-Status: GOOD (  10.32  )
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

The AXG Analog MIPI-DSI PHY also provides functions to the PCIe PHY,
thus we need to have inclusive support for both interfaces at runtime.

This fixes the regmap get from parent node, removes cell param
to select a mode and implement runtime configuration & power on/off
for both functions since they are not exclusive.

Changes since v2 at [2]:
- Add DT review tags
- Rebase on 5.10-rc1

Changes since v1 at [1]:
- added description to binding as requested parent
- updated commit log of patch 1
- also update example of patch 1

[1] https://lkml.kernel.org/r/20200907073402.26674-1-narmstrong@baylibre.com
[2] https://lkml.kernel.org/r/20200915130339.11079-1-narmstrong@baylibre.com

Neil Armstrong (3):
  dt-bindings: phy: amlogic,meson-axg-mipi-pcie-analog: remove reg
    attribute
  dt-bindings: phy: amlogic,meson-axg-mipi-pcie-analog: remove phy cell
    parameter
  phy: amlogic: phy-meson-axg-mipi-pcie-analog: add support for MIPI DSI
    analog

 .../amlogic,meson-axg-mipi-pcie-analog.yaml   |  21 +-
 drivers/phy/amlogic/Kconfig                   |   1 +
 .../amlogic/phy-meson-axg-mipi-pcie-analog.c  | 204 ++++++++++++------
 3 files changed, 149 insertions(+), 77 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
