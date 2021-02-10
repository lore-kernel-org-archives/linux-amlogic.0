Return-Path: <SRS0=lUps=HM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB91EC433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Feb 2021 08:08:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AD6B64DF5
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Feb 2021 08:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AD6B64DF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WZEy+33FwnxrIFsWdkxelv9nSvajpVfj9diw1cK0Ko8=; b=P3n56B6YK/qwtvaH/mDU6ECq6F
	CBqBD+0ET8jT8XuzjY88wNm4OF1GXOwYpE0nPOyE+3m1Td9T/XvHTNoJzsLS8fNzTO6jU0DqQUSez
	eVaCJqCRg99Gob9GgJsFqFy7NhNVYZEMR1SS7FiEL9RzSgPa5jv7xi0hrWVSAKa4QDA82jERF+Q5H
	k4YGpgYQTpViL/JOquTe3KymoLFJS4SfU1xOHo0LpXfZegdGhp7ojRHHN/hdZTB+LZVRzJr+ooj+L
	Njj7bQgYuk96j3o1maOm8t1KqqNt9JifelbrNNHgr298JrsjB1QRvJFNEHoGYimLyYXdJEd7ADY52
	9PMYeRcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9kXR-0001F5-2E; Wed, 10 Feb 2021 08:07:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9kXJ-0001C3-MR
 for linux-amlogic@lists.infradead.org; Wed, 10 Feb 2021 08:07:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id i5so1014120wmq.2
 for <linux-amlogic@lists.infradead.org>; Wed, 10 Feb 2021 00:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ivWcuWrIoBecqEGJhNfZ/cW2pH+vz74Zsw92krm7Qs8=;
 b=QtkVPl7c495rDGndC5yLmVckyz2TpgvvCtyFg4I9WJxdSNwn7i+cJym6chQS6q/zq2
 g0KCV00AtQtkuyqy2yXc/QZcOF0QECc+Kr1efheujIV8OwnIOxwyWTYCdpcP2dpw0CUI
 HNW++ANMqIDaIInbZ9kCqPF9rSH0mJly/38O7ICbjgeDeWOKCTtCY7iN1EohUbNsjLhc
 Kr+kzobvKoSB/MPWLjqYwzQOxuRiGNZaMIq8ow0CEloyv833/tON6fEqDH2Vqq4Xge3R
 AOptdMyQq9Odlzk/+x0CZhTbIrWZHFOyDfsmq9u4AUuNl263Zb97wTEyu6imuGsi8tt5
 hm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ivWcuWrIoBecqEGJhNfZ/cW2pH+vz74Zsw92krm7Qs8=;
 b=uSvE8mzntBWmRXzhs3uaVI8uj08kVTfTNoQMOs9r3dJKb7IW6Z1ZfRUElzTPx4v1XV
 OsQG2bKIF/TuH/8nStOpxDNXHw5ACznkDfiXAjzil+rnlZElpxmjOUcoErWRTi1ayNVL
 PI0YTHIhjXscFE2sRsZoYtsRACFldUC5gZ8ORRGQmpGajeQn3miXOFDbchSQI/JKcSkw
 RrXRJIIsXvxvoPlf/eBqh4h933MVEcqLbcro1tMrw4wsl5vcEROoKifpMFBk7xEsyJCf
 0zCTfDdKtCTkJGE/KpGLrlFxdLa3p/hxW3QPG9fthVpkoQTD/tI4crUzlE3roije6526
 GvWQ==
X-Gm-Message-State: AOAM533BysTrnLm37sCbZ9ikhNsLvxfCYyS6Jlk7T3aUDPKLPWjYi2QO
 j02KhBrgRp13i0brhLn12dM9Ow==
X-Google-Smtp-Source: ABdhPJyupGp8Gp1Qh2vatwn96/hZaOKXsZ2emVoDl0b6Pjh8EaVBZlZO3bOLkxa/602emJ4HncLyLA==
X-Received: by 2002:a1c:2403:: with SMTP id k3mr1772932wmk.130.1612944462091; 
 Wed, 10 Feb 2021 00:07:42 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:d403:f5fa:8912:cba5])
 by smtp.gmail.com with ESMTPSA id
 c18sm12856597wmk.0.2021.02.10.00.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 00:07:41 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: vkoul@kernel.org,
	kishon@ti.com
Subject: [PATCH v2 0/2] phy: amlogic: Add support for the G12A Analog MIPI
 D-PHY
Date: Wed, 10 Feb 2021 09:07:34 +0100
Message-Id: <20210210080736.771803-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_030745_874280_86D61AAE 
X-CRM114-Status: GOOD (  10.74  )
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

The Amlogic G12A SoCs embeds an Analog MIPI D-PHY to communicate with DSI
panels, this adds the bindings.
    
This Analog D-PHY works with a separate Digital MIPI D-PHY.

This serie adds the Bindings and the PHY driver.

Changes from v1 at [1]:
- Bindings fixes

[1] https://lore.kernel.org/r/20201123145157.300456-1-narmstrong@baylibre.com

Neil Armstrong (2):
  dt-bindings: phy: add Amlogic G12A Analog MIPI D-PHY bindings
  phy: amlogic: Add G12A Analog MIPI D-PHY driver

 .../phy/amlogic,g12a-mipi-dphy-analog.yaml    |  35 ++++
 drivers/phy/amlogic/Kconfig                   |  12 ++
 drivers/phy/amlogic/Makefile                  |   1 +
 .../amlogic/phy-meson-g12a-mipi-dphy-analog.c | 177 ++++++++++++++++++
 4 files changed, 225 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
 create mode 100644 drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
