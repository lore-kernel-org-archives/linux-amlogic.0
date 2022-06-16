Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3A4C43334
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jun 2022 13:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OIPwjFZuiLZVWQErA3vZzK/ViWsTx7fXJj6YeIigZDk=; b=XOVQeX0wP0poFi
	mJksF7MKB0lodJY01wT8A0QleYJVCxkVHEOeLnTvm1F4brf2Z+TT3XaW2HKk5h8bd0JrURNfCfY3N
	Lm7toLoTumZMzoNyWx5/lKUQY0fMJp0YFWYt5DJg0WjNgYC4yAAJA2h4hzjLJnYN7/vZeUj/HBJrb
	ZczN16N5W9xqfK2RNSjrrW1ftVUYYsC7SW0eLW2AHplid3uzEnd09UnJQzHYz3zYQWikOFWu25Xlv
	JPTDi+7hFAyjwsMkyDYtb0r+3WWRJY+i5592TFJqq0XlJvYQX7/v4Uc5I51c6wSmUjxl/N1ky/2Zd
	IdPTNK7XatvfHNzfwYpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1phk-002Ufq-19; Thu, 16 Jun 2022 13:38:36 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1phV-002UbA-BL
	for linux-amlogic@lists.infradead.org; Thu, 16 Jun 2022 13:38:25 +0000
Received: by mail-wm1-x32a.google.com with SMTP id p6-20020a05600c1d8600b0039c630b8d96so3322693wms.1
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Jun 2022 06:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wvAKrFjJUAy1rbIq7AduR0p2M09bI4Jv7oukOvIyz28=;
        b=DWHy3SG/wsE2T9Q1rnbshZgTGjXu1R+4GV6HC5a4ibBbEUebaZ6zZRW1MPmiXZgVY+
         1cIGlig+dhb7pIcH+9BDqU9AFsyq8uynKwh7GG/p7AQPt72nAE2PlEc117brO8Uc/Isy
         EGxFuG/sKknm5lmCGC0DVCh37H1SJbJMByLVxN4AVvJq20N6MEDAaAwmyQVRzoUkc8mw
         wAw4gOtUi/wxnCqRyGyQ3ILAkV6JtStMcbJenlJHA5JNeLEvyFQwZaNU2Bc/vEjUFqBv
         QMjaltNklBOWrFXOKQ4wsEyFqvVs03+iSmX8lcQ0DiQhhFms3E8ODhmfzm4Vh2ejoWwG
         6VJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wvAKrFjJUAy1rbIq7AduR0p2M09bI4Jv7oukOvIyz28=;
        b=n5xwpIYJ8c1MojbPDQKsjJarXbr2J/jsdh6SGA5PtMn0GHsHilbUrM/oLfQxT8eXiS
         zI0+txx0VZrDXdO11HUdr6FkY4CrHWXD2qLFnfdSE1EVfVH/+fMEj2gY5vUjhjxfQ+im
         VMSr5k3ooX+AkQ9gh/N7P+51LOjA1uK6VJpfeJ3na6qN4WNbZyT/hCwVepxV8cx3DxeZ
         vJDLtdPupEDWi64bI0Y/kYjWyUHmIGxRC9arfM2Pn3sNVZY5rqQvM3MJKtzvYPaoeVfs
         oZlVU6QiNr81ahkQsGU+B3G995Jv4FZTnaOm50j/NrTIFmVFuSg+9fneEryUtDuhZOAc
         FfRA==
X-Gm-Message-State: AJIora8k/e9rKvxMw0++OQKkbEvtBidgHWcHadqsF3iYJlBW8iAA5JmN
	jrC6VlJF6NIhM/c8Qof2JvJV3A==
X-Google-Smtp-Source: AGRyM1vq8S96jIW+uk5lkEUyMx3tmLM5T2LiS2+Uri5idB2675B3Vf49kXUdWT/UgN2E4ubVvLQo9g==
X-Received: by 2002:a05:600c:35ce:b0:39c:7dc2:aec0 with SMTP id r14-20020a05600c35ce00b0039c7dc2aec0mr5170072wmq.33.1655386698378;
        Thu, 16 Jun 2022 06:38:18 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:34f:da80:9c48:d9f8:5c33:3dd5])
        by smtp.gmail.com with ESMTPSA id v12-20020a5d678c000000b0020c5253d90asm1935423wru.86.2022.06.16.06.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 06:38:17 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	vkoul@kernel.org
Cc: linux-phy@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v4 0/2] phy: amlogic: Add support for the G12A Analog MIPI D-PHY
Date: Thu, 16 Jun 2022 15:38:09 +0200
Message-Id: <20220616133811.1674777-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_063821_415627_FA301E5A 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A SoCs embeds an Analog MIPI D-PHY to communicate with DSI
panels, this adds the bindings.
    
This Analog D-PHY works with a separate Digital MIPI D-PHY.

This serie adds the Bindings and the PHY driver.

Changes from v3 at [3]:
- Add sentinel comment as requested by Martin

Changes from v2 at [2]:
- Bindings example fix

Changes from v1 at [1]:
- Bindings fixes

[1] https://lore.kernel.org/r/20201123145157.300456-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20210210080736.771803-1-narmstrong@baylibre.com
[3] https://lore.kernel.org/r/20220107150512.614423-1-narmstrong@baylibre.com

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
