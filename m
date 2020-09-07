Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FC4C433E2
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 07:28:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B6F2207C3
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 07:28:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FBDzNLjq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aINm/ndw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B6F2207C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FRx+mYUGj2AZxtQpi+jS/njDft7yOD495exP3PpvFIk=; b=FBDzNLjqWcdand7mNO3/VCIS9D
	/m+J0s0+UmjyVIMWACq8CDyKKmDCe8HoyxXhs58eT4ps+hZ3bXcQ4ds2gxsQy/jJDDoRUYquEIQpy
	5cCNnRjocoJ2XzRjmjjROWqyBByOV+ZOmfTxAkC/XwtEEzqmUfLna31/unVUQdkuzRMTGjGUE7WdJ
	AAXUXcvLOuAh9kTscXLVVj9/ouTypsSrh0EZwXmNJB+owvRsqQg1Q1eMCKISFtJUnCrBfSaCv2lj6
	dl8ObGdKbJJDQr/aSMxoNEWT5/k2XyeiDkGkpqeEC82HF4vyn9vbBCCS03z+CMgYEriaarerXcvFI
	DEp+O4ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBZX-0005yJ-V7; Mon, 07 Sep 2020 07:28:16 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBYa-0005OX-Ku
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 07:27:18 +0000
Received: by mail-wr1-x441.google.com with SMTP id w5so14625681wrp.8
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 00:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RO7kAaRIuc46KRi9qBhr94GTCP962q4RtdWLGTT2ldc=;
 b=aINm/ndw6Q2v7K4daYMViqWrKNS4SVsN1hg9nnxrFtKN7eZsn+kgp7je6OnA3lzVhq
 FDJ6FVTd0AZ8Y8z6a6ZBKHywenH151zGeteRjz7preM32Q0f3HxbkX2eaI5gvd8egECv
 VI9tysGsymzvf/CV0TRbX0nU4iAPpMhIIiFB+MyzLtsLS0c1kpg596lqJY3cngWM/9mD
 9LBSLgzw9VSCqV7mU9ZHSIRQ5NAnXQYV+Ugeu8ispkUCh3s1W67rb+Lo15ywfZ9Cplae
 MGAtuVYZuX+bFkNRe6FPq6sE/WUDmjbrDCWHF+1yC+XbqSGJQHoVJq3+UOgzsJdx9//I
 KP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RO7kAaRIuc46KRi9qBhr94GTCP962q4RtdWLGTT2ldc=;
 b=LLI2Yk4pefDZ7JvXvf/lUvRJRkbqUxdmMj4KjoML3HQJUj9DahYRnNZQuYxWp5kY7k
 OD9tTVNcC6QVBnEfXJkHufR8ohbzwE/hmdFF0JUohIwxdXCFtmsabBfypCV2U6X5nIMe
 wGI9uGfCBWdPuGVVE0Tvq0qcClGXWDzE1RCSE2FuWBGpSEkrXVQMhRZbBVp3BmZsV2kz
 LGu9Kqy/1bgTyVYQtyEVkFyOxKgX0zoxMnOTpH/p4qWPsgvA3550kwBhrW5bS9bsg/7l
 rngvQZK+/29wZ2Q78R6IoFnIdY+v1zi2aAvTEp/XT2rISQuXRiZZ79THCRsw8Nt+VBAy
 /nHg==
X-Gm-Message-State: AOAM533R8oUNFXIspOSVjV3qUcNHIA3fZJDIk/DY8YL3g3aoToX5L9U9
 +ch8yO02LLWikErSo+AcijHq9A==
X-Google-Smtp-Source: ABdhPJydTgThvxg9PYNz0DaNMNjsl7DBRwxNwVmrkNpMs92cEhZdX/WVCy5LcrpstvtxwJ2OqQnIBA==
X-Received: by 2002:adf:c182:: with SMTP id x2mr20086098wre.400.1599463632925; 
 Mon, 07 Sep 2020 00:27:12 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id x16sm25560500wrq.62.2020.09.07.00.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 00:27:11 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com
Subject: [PATCH 0/2] phy: amlogic: Add support for AXG MIPI D-PHY
Date: Mon,  7 Sep 2020 09:27:06 +0200
Message-Id: <20200907072708.26043-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_032716_803312_6EC577E2 
X-CRM114-Status: GOOD (  10.52  )
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

Neil Armstrong (2):
  dt-bindings: phy: add Amlogic AXG MIPI D-PHY bindings
  phy: amlogic: Add AXG MIPI D-PHY driver

 .../bindings/phy/amlogic,axg-mipi-dphy.yaml   |  68 +++
 drivers/phy/amlogic/Kconfig                   |  12 +
 drivers/phy/amlogic/Makefile                  |   1 +
 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c | 413 ++++++++++++++++++
 4 files changed, 494 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml
 create mode 100644 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
