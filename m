Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2E5C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 15:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vmnx4eOIUS+MRGQRyqUDpn73D6r0pKCRJf9+Gfl6lQw=; b=ovShtpbhyjg1X9
	lvZIM8erYdglXqz9PeeQLhNkkWRqNEtEq7JASjFB3LPBr1EQap+vE5YO/u2XyceYdRunRc/9EtqHc
	ucuuJzCD/4X2MJU41VeSUQySTSwhjIluA5qIT6nmNKzH3GwU4dVAj0nkkbVT3V738+HPZ5/ObVHwb
	6ApDJiuNZQE43WXdPKMAiqp/1QI4nb5ZwegFQzJmmHtd3gNNub0jgD5YTPG1kkVP/i2ZUR0rKPbkw
	DykQPd39/VxOcyiF76nsd1UuXTROmLCp4ZawffhG/m2GvUXmPPwRcig7oXqeVX7MywEaiWP8GaOtf
	kFUEyu9anCcu9sAiFC9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5qo0-004O37-IE; Fri, 07 Jan 2022 15:05:24 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5qnw-004NyG-Kf
 for linux-amlogic@lists.infradead.org; Fri, 07 Jan 2022 15:05:22 +0000
Received: by mail-wr1-x430.google.com with SMTP id a5so7629799wrh.5
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Jan 2022 07:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6hNM7Jx0ka9c89ARXL18Y6Yomz5BgQ3R+02Ck2gVejo=;
 b=znEnsrWNoFHGs0yDXT0ajFzwU3OmTsmRvzG8YPbXJWhTE3RvFvkGF0qip3OKuZ9hkV
 pH1kfep0nAMkZa70Ig88zskk6DuT2hUovV8k3yDl8LUBRr6qLgWZGObYSafE1RoYr7aD
 3ne8alY1BcDoA2PCxjhiFXWJ96tba09NTTPYRH3AtwJUcV9BSu+8S68ZP67CUrYEHhQi
 pdKFBZje2nL9bik1Rf7F8fnK+Ju1ptnXg6R61JT304s+PUvM3NxkOAaBTGLNOxYUD733
 genYxlDbbQnIMLpqnIYFS0ZGH4tjjOcRDrjgfIGMz+04huQVwJDrFynQbUif+tMZ83DJ
 sOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6hNM7Jx0ka9c89ARXL18Y6Yomz5BgQ3R+02Ck2gVejo=;
 b=JRwN7Xzs/DtQ/dj3K+/RUTVPNPjLlvoDkmlB3p9MUcDStebyNHeuCQadHE1vg06qNZ
 q/c+pxHh7Wlg+LH0y1GLrZ+TZCyjzWElkw+YF0sXM/RpPp2+m1YOigsD3IxwyU0pZ9pC
 urXrNfrxAAD1a0WRUVnxq4ihYcQLloZgco/nBMD6c9Zye2AcRjyjPz7/UdpxLgbM1Tl1
 2nUN5IXm7k+llzFuBaRpX65Ob2RebjU70MyAP9s8JKBs24EqUanrmD+DR79OnwrKtUqS
 k2AKHdHAKbxbFpRebvDsF5QuoEyRM47KNnQKRAP342EbXty9u5l26l6yUEpCs6yeokQo
 A70g==
X-Gm-Message-State: AOAM530URDZnap6Gg6d4qJqdF54Rd1Q9N9f2M/9u0Wy0UEOZ2FZA2yAa
 E6JeSUVbMKjnxZNmgBPqJznMRA==
X-Google-Smtp-Source: ABdhPJwsYouaf+AyQmEepe6AEBBvuC5jNOW9Pb+QrOUDvWasENRXpdZ7054JoO1WwFi5HzBbNnHvhQ==
X-Received: by 2002:adf:f103:: with SMTP id r3mr5618982wro.555.1641567916256; 
 Fri, 07 Jan 2022 07:05:16 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:fc89:e826:8938:cbde])
 by smtp.gmail.com with ESMTPSA id s194sm1848246wme.45.2022.01.07.07.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 07:05:15 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	vkoul@kernel.org
Cc: linux-phy@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 0/2] phy: amlogic: Add support for the G12A Analog MIPI
 D-PHY
Date: Fri,  7 Jan 2022 16:05:10 +0100
Message-Id: <20220107150512.614423-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_070520_766163_0ACBC716 
X-CRM114-Status: UNSURE (   9.16  )
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

Changes from v2 at [2]:
- Bindings example fix

Changes from v1 at [1]:
- Bindings fixes

[1] https://lore.kernel.org/r/20201123145157.300456-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20210210080736.771803-1-narmstrong@baylibre.com

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
