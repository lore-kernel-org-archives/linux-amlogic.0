Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317ABC4346E
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 09:32:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A01C22068D
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 09:32:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oJxftbKE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qdEWVmRh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A01C22068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oKQeDmtO2oHcFgbkCFYCHRKZ2NtznEPvWDDcti/Zy7E=; b=oJxftbKEXVCzFRU3imiMYREuQL
	dWjRUmkGH82h8h0gs3lQ5aZpFzfDji0aKpDLLIBmpBeUtDYVeRVlYGu8dDPSo2cHZpN/MZhnBiwWx
	dXeLNYxaSF0yWbpFNeopWq1MT6l5hIElf4bsltNsDpmA25oKwwM0oUa93AiNPITSG4fyixly08Inm
	G17MeaSJL5W0aXn84TRnFu9gQXtHErYziT80FAvInNRBryKKeirmo0Wi495r62CUBGvephsRcLXJC
	t5dz4eDKVKvX0IyS0OkiatxCVWOIgq7HyzATGGmEm1ZcmujPGK1UqimTv3EFMltAfQFYIVOoa2wRz
	MqNY3OZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNBzn-0007Sv-BF; Tue, 29 Sep 2020 09:32:27 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNBzW-0007Mx-9f
 for linux-amlogic@lists.infradead.org; Tue, 29 Sep 2020 09:32:11 +0000
Received: by mail-wr1-x444.google.com with SMTP id k15so4534644wrn.10
 for <linux-amlogic@lists.infradead.org>; Tue, 29 Sep 2020 02:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7UsmEqNE1VLY277zZdW+TO4ZYR2Vb/rb860kfWSma0Y=;
 b=qdEWVmRhaVAyb7vwdl+3da/tgoTRODR/6lOh1nQVQPjlCYTC8GyzRdjKuu8MYpd8Kx
 E79oNInkWSFOUhLygTLKrvsDjb7K8Sfwqnnf1RHOKN/40sRG8lpdwWj1z1KSuBi4Qo4R
 KrM6bI37mn3LgwjFzxuzYEcNnCgtIEmzFnZQoHViPJ6ZV351q2tp3eWPBVa5GsWJEZp4
 xHAi1y2yoD+z3hDdD5dkV4fagJdCLsF4AWOODKVH0EW93U+cv7m2FB6wuQ5xLTUb03XR
 qZ3zLJA38G3xgn8Fok6TNX2+VllDvV9Sw7ttK/rYCpj88+LpPNt/a+FWgBIdQ6hF3Jt1
 uptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7UsmEqNE1VLY277zZdW+TO4ZYR2Vb/rb860kfWSma0Y=;
 b=M79Wqpe8t6oJfcrhrPbVLmXZMp8KvsrfhaW8/xF3ZRdc/ioI5YZo+sM1+nQSw39Y42
 XZmdTQdtfkvTrBkYOn6oGAFa0HG0d66o7t22Tl4LiBpjbxaZPxN54ye0y3OT5AtBZlhd
 B/II8yuA8gx+wqVkqRrZ/JFRW1ygRQvDkOinb4/TwNr1p3f1i+M6OkeJnBskT3VZPr0S
 AJJx5MoB/9HYKDsHPMjGx9PxcMQTOHgRov/M138/n5i8SPjXGuV38GXeL8tAH3ayDOSN
 hiJHSdH4AtwIDj5Knk8svTHPn7H+ilWczBQCDikM8BawDeipLW7dXM758r+qDGcw3M3V
 n5Ug==
X-Gm-Message-State: AOAM530/SPpS/9+FFNicUOSVEfUOcdverhlDkqLPsxe/Xljlvrr9+LIE
 KyZmvs0O6+HDKpLHCFY4aZirnw==
X-Google-Smtp-Source: ABdhPJxHfjuOh6YrAZAFjomsAPXwlEm8lAWRogXJCncMNd1JG5rXr53P1OH4o/P/cuUUY1TBYwnv0Q==
X-Received: by 2002:a5d:6ac9:: with SMTP id u9mr3082466wrw.46.1601371929215;
 Tue, 29 Sep 2020 02:32:09 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:d50c:1ee4:fec5:ad12])
 by smtp.gmail.com with ESMTPSA id a10sm4596107wmj.38.2020.09.29.02.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 02:32:08 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com
Subject: [PATCH v2 0/2] phy: amlogic: Add support for AXG MIPI D-PHY
Date: Tue, 29 Sep 2020 11:32:01 +0200
Message-Id: <20200929093203.337954-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_053210_364315_932C5535 
X-CRM114-Status: GOOD (  11.41  )
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

Changes since v1 at [1]:
- Fix bindings and add review tag

[1] https://lkml.kernel.org/r/20200907072708.26043-1-narmstrong@baylibre.com

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
