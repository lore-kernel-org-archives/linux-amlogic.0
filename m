Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56047C43334
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Jul 2022 07:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+EERcuPM97qhVmZ59vSDfH5vVG+S6e5quU89Fy0g/pk=; b=or+IjbJ6k1Sm8s
	yrcjTlh3VZJ7AmF0FKDLeFQ7ANCfrkpOvYrpCOGSE17o8Xc/ZJ9vIWhnlFGKDdKBGsdc5mOc2mOKe
	npPn1k5VLQUNVwbp1mDdi7W3n9YGg/nN5l6vxcb3DG8GR8/i4aNjb/jjbUV05f7IYTWCmHFfmbuEK
	0TZLMX0O4sqDRlA8wMzvZTpUFaJKlJ9JLE8uXb1cjgxFTw4aIQ0StR0NJYaGfMPPFdyQjHcAAbMWL
	1GCknZqZm4xUi16T/xfU1DgOGPHHzS9OhOlQWt6PaOzDkw3fXMtHvvBgIGak1R6lFzHUNOsf+b59+
	8zFX2ny7laMbsIslb2dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8dQm-00Frvg-M4; Tue, 05 Jul 2022 07:57:12 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8dQX-00FraO-Qx
	for linux-amlogic@lists.infradead.org; Tue, 05 Jul 2022 07:57:02 +0000
Received: by mail-wr1-x434.google.com with SMTP id b26so16335321wrc.2
        for <linux-amlogic@lists.infradead.org>; Tue, 05 Jul 2022 00:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c5dZdIc1hvkMEYVAj9UyiGCz6EmxkSEM83h7TJOheUI=;
        b=6s9g4MM/WSArj6qBhSnDTy4B3b+hiTstuCKJxNZ3trOEsw4AuPSUxSYYW0QW68WUgX
         tABhnW0yqeEF0xHVTnQ0vU29GH5vy/n9Zw+hMyWcaNKY2u91I52Pbm5n/EbWsNjB0IvC
         U8afSRPrqjmtbsptiGCvxjj1S2caLzb1x6dAs/SxUENCKKKs/7adHOpCwV+prvPDtzw6
         LMtGC+wKsqM7gmqOKjXLhGwCnSMomJ9HMKly3jWvL1GGjy+aKXKOVubHjDp7WoHjcS6/
         5v8cIk10SH4rZN8ofmPZlgBStlye/QcYrbNO+nJrVJY1opHre4KchD8qzh0k+b/SKcgZ
         H/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c5dZdIc1hvkMEYVAj9UyiGCz6EmxkSEM83h7TJOheUI=;
        b=gWIjuEFBbk+sx9VrqzogcLRpJgUjJAhiwyKIT0cHEK4wEmq4cYiUdY834qKMSqAhHg
         FYkezewzfnEIbVIrygNKc/Dvm9TXoxH33zITnUoMiCfv4HmaKX4IsAmslQ5FZh1ndJnK
         7s4ehmTndNsUXuNKGbr9kvjFcd3Mp9ZdODpfN9HoB5g2D+yZusDwHuWkuU4raPMcimil
         kZqE2uK8OHsWkEiEzdSgljtHvUDzDLS6iFQoJvCtj530TXUC2LmI2hgpJEf8AILdJ8KP
         yEi/6MvFqnD0pD4vO2nWFj+FvwmBdozTY2PjCH4ydM2z7TATbTaajUyujq6bmBnpBkIT
         BjCQ==
X-Gm-Message-State: AJIora902EBs2l3GxFDZkBGWL1TAk9Q/0WBNyFXHw//IPm3aHxOhtdfW
	b2tFlFSBMBez7atY+k1Oa2VFiy0q2yxDqkAc
X-Google-Smtp-Source: AGRyM1vAi92HlCcP340VdsuW1eshwTJpEKAu0VF0zzIoSkayd5WUd0mGsFmCavTXKFLDUuf6AIFuWQ==
X-Received: by 2002:adf:e78d:0:b0:21d:67d8:6e30 with SMTP id n13-20020adfe78d000000b0021d67d86e30mr9948862wrm.109.1657007816194;
        Tue, 05 Jul 2022 00:56:56 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:3c4f:78be:dc90:14f9])
        by smtp.gmail.com with ESMTPSA id v17-20020a5d5911000000b0021bbdc3375fsm8323473wrd.68.2022.07.05.00.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 00:56:55 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	vkoul@kernel.org
Cc: linux-phy@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v5 0/2] phy: amlogic: Add support for the G12A Analog MIPI D-PHY
Date: Tue,  5 Jul 2022 09:56:48 +0200
Message-Id: <20220705075650.3165348-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1592; h=from:subject; bh=nDetBA3HotL8bYLSaVKluyx7j3QuDEtAntCaS1aC/Hc=; b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBiw+6eCamVpBN7p2hTYDYzwk+y1u4fjJBS4nv/fE/2 7XFZMMWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYsPungAKCRB33NvayMhJ0e9uD/ 0YC6+R9Lh2/AGg5uSX2jqwJ7tx9VOQ7b3rP4l7V6PZDgfpJ4qGWw37cfEMJitIcDf7Da1I7s6qahl1 3qGAlj0RBriaWa8rIYPYncv12u/dCo0ZH61YdWwgXv6vYL0GZvBu/GyT2JGewazWCJCNOp5Bnj+qra +5dWQ5FSvknEvWJxZX2alCZLvvt/NkBC5ReoSUPteqnCgILtYgV9OUGjU2wflhl291w0Ea8MOC4B49 wucrMGtl2GiWuDsJcX7kScHtBjBkzeogvi/2Ls3dWvFqKR8i8uVvlCbbXNKR8X32V8RJsrxhArDMLk LUZlIeugqGDVy6E3vrErD/fQ+d+krvDTQVfLuJX0buF5+7PasbA8rD3gyDzNBcFiW0fKYF+eaQ1Wdl lhBgt9TocIOaGVbWqthVTWqV+ELnpnspjycWBOPNfp86E5uunnemIT2BvoMUeLZzCZabz8a+KL29dv q6qcVE6GAAPnm7HJb+XGGPYvH4iw/YcyvReaY8WugJSuv1h9dLOOV5sSuQXJkl6XbpWAV0xKICklJ8 hChNqfjXFJfV+pHfVYZujvbEmHoaJZnkJ4hUEZYeRbE+Wpxep9jpgDVQVTZsigOj9jAbpHISSy54fp BG/jYCk08IX0TT99+ADKu3iElLs7M92cmcrG+lA/4ZgbD4WZtJirQ55XG3HQ==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_005657_933503_3BC8DBE5 
X-CRM114-Status: GOOD (  10.45  )
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

Changes from v4 at [4]:
- Add bindings review from Rib
- Order in Kconfig alphabetically
- Switch to dev_err_probe for error log
- Remove last comma after sentinel compatible entry
- Depends on MFD_SYSCON instead
- Do not keep reference of parent node pointer

Changes from v3 at [3]:
- Add sentinel comment as requested by Martin

Changes from v2 at [2]:
- Bindings example fix

Changes from v1 at [1]:
- Bindings fixes

[1] https://lore.kernel.org/r/20201123145157.300456-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20210210080736.771803-1-narmstrong@baylibre.com
[3] https://lore.kernel.org/r/20220107150512.614423-1-narmstrong@baylibre.com
[4] https://lore.kernel.org/r/20220616133811.1674777-1-narmstrong@baylibre.com

Neil Armstrong (2):
  dt-bindings: phy: add Amlogic G12A Analog MIPI D-PHY bindings
  phy: amlogic: Add G12A Analog MIPI D-PHY driver

 .../phy/amlogic,g12a-mipi-dphy-analog.yaml    |  35 ++++
 drivers/phy/amlogic/Kconfig                   |  12 ++
 drivers/phy/amlogic/Makefile                  |   1 +
 .../amlogic/phy-meson-g12a-mipi-dphy-analog.c | 171 ++++++++++++++++++
 4 files changed, 219 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
 create mode 100644 drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
