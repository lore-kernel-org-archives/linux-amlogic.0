Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEF4C00528
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Aug 2023 12:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aAYCCZZeq97k4uT7jsp7ZajGMZgGrcD0MtAOiGAhj6M=; b=2blIC/oTSgzOBX
	Q4TXklM7aBJPfgJyTnXqtQslme/a9hzLZlhzSq1qCtdpC6TdkWF0qaTYXSJBrTypHOe+Jj9Pqxso/
	rOadqq6vkpEiU3f3mQiVjRP6TkLjsxZWmFkprW+LDeRwRoZCt3hrpJ2ZvEON3+EeIilngAeoVED1/
	j114vIJuiMCJ5FJyowO7UxWjSqawizvlmiOzzYGPfh3Q+k/WWKXp04M7ORD0tHqdWlRauJyEaDYKA
	cB4a272VFIU9aW2CQalncyAJek1VldwqLFzDUoqCdTlffi1+wXMQFJn8QFH0GEySVba8EShpvOozt
	ZZ0FM2r6SYGtC1jV/fcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRX3r-008B8J-1w;
	Thu, 03 Aug 2023 12:04:11 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRX3n-008B37-2C
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Aug 2023 12:04:09 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3159d5e409dso1289942f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Aug 2023 05:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691064244; x=1691669044;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nc8Y76qLkIV4yuMIWWxyf3es/Nfqs7z27mjHldApNyQ=;
        b=im9UpU98oPbc0h8ylcPipzsy6g8NChjk0/k9VHMcr/At7aHwZZbtnf5xV3dpTIDL7e
         Yesi0lmVUuGHoprd1GIq/n/b9GFKReOq58BmMO1hPAoUEzVbucyUAvTwSyRERe/UT353
         7cyAoVbjO/79kirKCZY3NwbN0ceEEo9nqLGtNQTX2Bb5GxfPXE2wqum0Pq2uQWAQ5ly8
         cAR2QKGcogicTrfmNljB/lYNZJML2nVdCEdjpu/zXI0HtGweBpmdNV9qRddL3QZi7R4G
         XIluBqdAofVZwV13hV53ITnLDyzi7gPsHrAr++NsUFGR0JOgwFWbSOvHEsLWmXIDGA2m
         AYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691064244; x=1691669044;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nc8Y76qLkIV4yuMIWWxyf3es/Nfqs7z27mjHldApNyQ=;
        b=O7mtlPUeWUKSZqNYZzONc88bhs1ivZJTqA9zWudikz3Tr7fX5/Fqh3OtNH+C0/k5Dr
         3bM01THipLtWVR3f8koUOa1mp3tbEfYe3upzA6z+8iRyNarpeMZcRpeNPxoRv5q/Fw4U
         W3KpCXi/aIir1O1t+CIqaIkXwxRJRH9Ws/kBlaBD4WHItAKp14r4/86roITR8zXbLWq9
         PRuBLvwQfTMCe+v0h8ghFH3bXsGdlqhDzVuDE2ysCLMD7+bvpMrnNOQNe+aEcnaJjwUz
         WqhnFfooD1UvsIYVJFUGZo4anMKAMgP138NP8JirPMgpcgDP8EcV9o3kBpnlxdPJpRNp
         HS8w==
X-Gm-Message-State: ABy/qLY+WFsCmhWRjRt7YLuH+T0f0DUOxap3myMxesd4s4tl5m+Xw2BQ
	KIke9QWlsV/HiIMd2CilPFqfcA==
X-Google-Smtp-Source: APBJJlG97vALzvMZ46mbXrmPNvuOtH2n4IbF64FjSC4ysRz/6Ow26e+ZP3rMIINNsnGR7rt8lxmMQA==
X-Received: by 2002:adf:db51:0:b0:313:f75b:c552 with SMTP id f17-20020adfdb51000000b00313f75bc552mr6955862wrj.15.1691064244385;
        Thu, 03 Aug 2023 05:04:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id d10-20020a056000114a00b00317046f21f9sm21487465wrx.114.2023.08.03.05.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 05:04:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v7 0/9] drm/meson: add support for MIPI DSI Display
Date: Thu, 03 Aug 2023 14:03:54 +0200
Message-Id: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKqXy2QC/5XPQY6DMAwF0KtUWdcVmCSUruYeo1mYYMASJFXSR
 jOquPuk3VVdsfx/8b79UImjcFKXw0NFzpIk+BLa40G5mfzEIEPJCitsKlMj0LqESRxkCxru13S
 LTCsMScC5EbKsDfRnNli3XI+aVIF6Sgx9JO/mQvn7spTyGnmU39fy90/Js6RbiH+vQ7J+trs2s
 4YK0HTosGNC23wt4imGU4iTevrZ7DdNMY3lviU9mPLVh2n3m7aY44DkurM2usU3c9u2f0r1LS2
 SAQAA
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 "Lukas F. Hartmann" <lukas@mntre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5348;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=w2wcKef1ZTBp41/4cgn+vCRNpm5+SWfgE9/7Z0BwEg4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBky5eviy14Hs9bzcmsvSScMxEwDHInLOmLWyQfLH8I
 aBfvLoCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZMuXrwAKCRB33NvayMhJ0eCvEA
 CBdKCpSCjD8PeSgW1dD5BXr1lBqi9AKK9800stcx/QbUMdJMYPZbW02fNBe0d1mpa38ceDntOD0Q0s
 LUhrcIqGug4QWjKFnJb3KRC4ruUB98TegUkhV9dRWIqh/nKY4uEi+2gNTg7hM/chVAr4KI8jOmEbvE
 VPnAr7BaQlJCurHfsQmowJr1qvtFMGHk4feX26ylMbfE3d1BVnm6KN3yydeeRcDeFxDSJxi6iVeSN6
 9K/xFo+A+cyTPwfo4xHj62HoaYy2C2BoNBcCyMJ6swM+HquFF4vIjGe5Wk3GVTixjNz87gFTtNqz8T
 iO/a6k9ziI5mQoDh4npvdSqX8t8uBSHQ0uuuJfbJ0q7YTLp+tN9YgybmazF6F13qlXClI0B7A8OINs
 zhiz2ka9HUsXSxJTpXsKY2+fILwL9s6IAgE4w23h9Ch2W/qMVEDKWhxUD+kt5wH2Y3uMPnlv95Ipn2
 bBfPgsqmZxW0+4tFSvde1jYnT1D/Rutq4afdrzQ71X8ZDGinEl/ghHdtot/poncLqN9N716eIcf7QM
 xNKcuiax8FZkFjfZhfDoQsHr8+OtNuP9/uG1mlBO4HdozTN2uRdtJBP7kSVbnSWGBWi+5ebjVsGtmT
 Q3Ps6UiE9rLUe9wQTlAlztFxGPAw+i9FgQO1dsb6QKHwkPeh/8cOt1TpfCnA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_050407_800628_EB5BAD80 
X-CRM114-Status: GOOD (  17.96  )
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

The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
glue on the same Amlogic SoCs.

This is a follow-up of v5  now the DRM patches are applied, the clk & DT changes
remains for a full DSI support on G12A & SM1 platforms.

The DW-MIPI-DSI transceiver + D-PHY are clocked by the GP0 PLL, and the ENCL encoder + VIU
pixel reader by the VCLK2 clock using the HDMI PLL.

The DW-MIPI-DSI transceiver gets this pixel stream as input clocked with the VCLK2 clock.

An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
DW-MIPI-DSI transceiver.

The clock setup has been redesigned to use CCF, a common PLL (GP0) and the VCLK2 clock
path for DSI in preparation of full CCF support and possibly dual display with HDMI.

The change from v5 is that now we use a "VCLK" driver instea dof notifier and rely
on CLK_SET_RATE_GATE to ensure the VCLK gate operation are called.

Depends on clkid public migration at [4].

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v7:
- Added review tags
- Fixed patch 5 thanks to George
- Link to v6: https://lore.kernel.org/r/20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org

Changes in v6:
- dropped applied DRM patches
- dropped clk private prefix patches
- rebased on top of 20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org
- re-ordered/cleaned ENCL patches to match clkid public migration
- Added new "vclk" driver
- uses vclk driver instead of notifier
- cleaned VCLK2 clk flags
- add px_clk gating from DSI driver
- Link to v5: https://lore.kernel.org/r/20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org

Changes in v5:
- Aded PRIV all the G12 internal clk IDS to simplify public exposing
- Fixed the DSI bindings
- Fixed the DSI HSYNC/VSYNC polarity handling
- Fixed the DSI clock setup
- Fixed the DSI phy timings
- Dropped components for DSI, only keeping it for HDMI
- Added MNT Reform 2 CM4 DT
- Dropped already applied PHY fix
- Link to v4: https://lore.kernel.org/r/20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org

Changes from v3 at [3]:
- switched all clk setup via CCF
- using single PLL for DSI controller & ENCL encoder
- added ENCL clocks to CCF
- make the VCLK2 clocks configuration by CCF
- fixed probe/bind of DSI controller to work with panels & bridges
- added bit_clk to controller to it can setup the BIT clock aswell
- added fix for components unbind
- added fix for analog phy setup value
- added TS050 timings fix
- dropped previous clk control patch

Changes from v2 at [2]:
- Fixed patch 3
- Added reviews from Jagan
- Rebased on v5.19-rc1

Changes from v1 at [1]:
- fixed DSI host bindings
- add reviewed-by tags for bindings
- moved magic values to defines thanks to Martin's searches
- added proper prefixes to defines
- moved phy_configure to phy_init() dw-mipi-dsi callback
- moved phy_on to a new phy_power_on() dw-mipi-dsi callback
- correctly return phy_init/configure errors to callback returns

[1] https://lore.kernel.org/r/20200907081825.1654-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20220120083357.1541262-1-narmstrong@baylibre.com
[3] https://lore.kernel.org/r/20220617072723.1742668-1-narmstrong@baylibre.com
[4] https://lore.kernel.org/all/20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org/

---
Neil Armstrong (9):
      dt-bindings: clk: g12a-clkc: add CTS_ENCL clock ids
      clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL clocks
      clk: meson: add vclk driver
      clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF
      drm/meson: gate px_clk when setting rate
      arm64: meson: g12-common: add the MIPI DSI nodes
      DONOTMERGE: arm64: meson: khadas-vim3l: add DSI panel
      dt-bindings: arm: amlogic: Document the MNT Reform 2 CM4 adapter with a BPI-CM4 Module
      arm64: dts: amlogic: meson-g12b-bananapi-cm4: add support for MNT Reform2 with CM4 adaper

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  70 ++++
 .../meson-g12b-bananapi-cm4-mnt-reform2.dts        | 388 +++++++++++++++++++++
 .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |   2 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  76 ++++
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |   2 +-
 drivers/clk/meson/Kconfig                          |   5 +
 drivers/clk/meson/Makefile                         |   1 +
 drivers/clk/meson/g12a.c                           |  81 ++++-
 drivers/clk/meson/vclk.c                           | 146 ++++++++
 drivers/clk/meson/vclk.h                           |  68 ++++
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |   7 +
 include/dt-bindings/clock/g12a-clkc.h              |   2 +
 14 files changed, 832 insertions(+), 18 deletions(-)
---
base-commit: 631ac6d680c1d3bff1a7f29825f11db6889fe958
change-id: 20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-b8e5217e1f4a

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
