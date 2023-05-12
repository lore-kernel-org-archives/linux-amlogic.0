Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9E8C7EE26
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 May 2023 14:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/xEiUuUBbAFo5zv5AWncjrN1yJfITvf4davRIBc+SME=; b=h+KxCiuNeD17Nl
	+g7kdgFPugXwlrHei80uJaq/ZS/3HSEh5gHjq/oZArOHzbuFAPGUdhEYNu30UrHsmxS/ZRCQvGQyk
	FF5AKWBwLd/UvOHAcyCt1JhzT6x7VX3NqWluyGBR965knGb4SB8GO5B0DEjs3GEbuN58JDea7tpYt
	szwKCxlhf4ZJRh2AOEUNH7CYEoBtn/zmnjz/xng1iYkzleQCx7VdNbQIo0U62is7TSNfnUQHkuAGO
	MtITHM0NTlu6bWU2S8fkfiEGZkhYe+GqpeghxNpzguH5b0H+cQT7ZyJdNSGC+gtgs8qYu/BvqeEwH
	wpNBR0Db7DCAE/P7ErSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxTZE-00C8fr-2Y;
	Fri, 12 May 2023 14:16:20 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxSYu-00BzWl-24
	for linux-amlogic@lists.infradead.org;
	Fri, 12 May 2023 13:11:59 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-30626f4d74aso6515613f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 12 May 2023 06:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683897113; x=1686489113;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dSzolrdrjqrvV5jM7DxDkMJJ1EaIhjBa4LLAjT5M2Zg=;
        b=qEQK5bCkzatFMyVJMwHgx2rK0us/XZR8B5vnl/7ZgYsFOJvGnXZuFI4A292tUjwKud
         C9YNBtVnUyQf1FyTS9a572hFg83cBQad0alfAViz7A5DbKP8b5w8Br11exNaopjFxZZZ
         OBIqrzkij4q0XNt10xWXHbiYJx9r083mltzFzKKSkYWdzx9jvAu0/Ea7TTV1IDPlfJXH
         HjyxN+cFrYWad5HReKdxiS51GVoP4HssnLprYU3fQh90o2Tj3n5O2vfduVKDzm8V6ciB
         wNQcd0OjFeYMmKKp37zXZ6PgqYxiXWxzN80gATPCiCy0I38aifgd604HljvekWKMofuB
         hNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683897113; x=1686489113;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSzolrdrjqrvV5jM7DxDkMJJ1EaIhjBa4LLAjT5M2Zg=;
        b=kdUjZoJHsgHydkp+1ooDgeq8patJoqyRfbQu+ysLQsNnGU3mSmmwTkMQYy3MtPMu2j
         +yE48zKUMs3upcu5wwQ95Rdqqyk7Hy8bKFzvUpmW2O2lp0MfW5Tup4rVg7CJBjR5tuBC
         qVfg4KEuQ+pBXYmXFQGJLA6k1Egd3TH63+g8mej22zjcOVo3Ej0biGmxJIIFpaYxnItE
         lL+WLSY5oI+2U9TxDS5xChWbCFEF5M5P6sQtHkq5MYCMOHd/oynespTWViLavZ7MxO4K
         1mWoIlFf4i9w4g+vcYljo9WcgT8tZTvST44UznPgDsqGNpOvFT9jtZvTc0rdM2+azSAe
         +xUQ==
X-Gm-Message-State: AC+VfDwh3c8vfHtpHjCijsd3A/PJT0DzLpDntnhj/cayjCWU03I0/1YC
	qQ6EhM6u6W5nIuQz2TAv9kW2dg==
X-Google-Smtp-Source: ACHHUZ4gw2bdndhw4gApaKDMdbVIt1/UTMtQkNvjJrbkDUcVYz6SVipTx5yffEGpenyHMwVUC2LT2w==
X-Received: by 2002:adf:cc84:0:b0:306:330a:da67 with SMTP id p4-20020adfcc84000000b00306330ada67mr17778239wrj.33.1683897112812;
        Fri, 12 May 2023 06:11:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v10-20020a5d610a000000b0030647449730sm23461965wrt.74.2023.05.12.06.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 06:11:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 00/13] drm/meson: add support for MIPI DSI Display
Date: Fri, 12 May 2023 15:11:31 +0200
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAM7XmQC/x2NQQrDIBAAvxI8dyEa05Z+pfSwmjVZUBPcRAohf
 6/0OHOYOZVQYRL16k5VqLLwmhvYW6f8gnkm4KmxMr0Z+lEbwBTXmT3UO1g4NtkLYYJJGLwPUDk
 N4J40Gv0gHSyqFnIoBK5g9ktL5SPGJrdCgb//8/tzXT92GohPiQAAAA==
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>
Cc: Nicolas Belin <nbelin@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6399;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1ioRlM6STKtbr5n8sJFy2IU2vIqjn+wPqItJP37h25k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkXjsR0YhUdBZ6BP+IJ1vjtxDIXTLtPmNaCk+jKxSe
 QOREreiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZF47EQAKCRB33NvayMhJ0YOqD/
 4jiZteuiK6HNWUFTp+TLyHkQa+SPFBtVBUJvsI64e18QsZ9Zz6pr/yNEV5CbsbhggK4cp36pP6kZ9y
 8TnMA15SXZszJd9NGGh+7+OHZ0nzmHRABNFpKHvF4Ka+csstygiEh++JEq4Dw+ZunZ8zuIhWVOuFPQ
 N9w2juugO4AiQTYa0gm/X6xm9gomSTDwv3kSKyQCahtlWBbW2Kro6F7FDXXMGbgKuLbJYQN0QWvZ5/
 a4vPTBhUoEeLUoD8adyvYimbAGj+paZHQ9JgT2DQcVuJrNhhRB2LUSZ1nPsoXNEAFjN2bgeYz4RYEL
 Wj235YkUI0tW3kePQ+G+OhQ2FK30P0VEHsVY7fxFZ6EA0BtKBd/+ip7Avam65vdASaRCSKcUVzFpiH
 pvOKwN8Ui/dYxRjcZaKJeBOqyE8+ACZA/HfR4oo1DkVWcWEyzbvLnndNiI+cCdlRMjujMBc28+JFIM
 9k1Eh8/r9IE3TMdNzhg+D9OyK0AFtfQ9K434SO788kDEDppPRaA2JnbljkQL3H3DtT1ZgxG/pyiZF8
 kMGpXeKzTg7ium68WI9h1F3Ihp34w7UqxPixKA8SX6773LBPp+UpuopDLxSuKHjBSdwUXrlV9ciZ9n
 rAHzrdS1if9cO+7MBFaLB//WDNjN6IyKKh8AJvgrmOhUlPUkTG175SVZqB8A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_061156_736285_089E6683 
X-CRM114-Status: GOOD (  21.41  )
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

This adds support for the glue managing the transceiver, mimicing the init flow provided
by Amlogic to setup the ENCL encoder, the glue, the transceiver, the digital D-PHY and the
Analog PHY in the proper way.

The DW-MIPI-DSI transceiver + D-PHY are clocked by the GP0 PLL, and the ENCL encoder + VIU
pixel reader by the VCLK2 clock using the HDMI PLL.

The DW-MIPI-DSI transceiver gets this pixel stream as input clocked with the VCLK2 clock.

An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
DW-MIPI-DSI transceiver.

This patchset is based on an earlier attempt at [1] for the AXG SoCs, but:
- previous glue code was a single monolitic code mixing encoders & bridges, this version
  is aligned on the previous cleanup done on HDMI & CVBS bridges architecture at [2]
- since the only output of AXG is DSI, AXG VPU support is post-poned until we implement
  single-clock DSI support specific case on top of this.

This is a re-spin of v3 at [5], the main change is about clock control, the clock
setup has been redesigned to use CCF, a common PLL (GP0) and the VCLK2 clock
path for DSI in preparation of full CCF support and possibly dual display with HDMI.

I kept review tags when the content was only slighly changed.

To: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Nicolas Belin <nbelin@baylibre.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-phy@lists.infradead.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Changes from v3 at [5]:
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

Changes from v2 at [4]:
- Fixed patch 3
- Added reviews from Jagan
- Rebased on v5.19-rc1

Changes from v1 at [3]:
- fixed DSI host bindings
- add reviewed-by tags for bindings
- moved magic values to defines thanks to Martin's searches
- added proper prefixes to defines
- moved phy_configure to phy_init() dw-mipi-dsi callback
- moved phy_on to a new phy_power_on() dw-mipi-dsi callback
- correctly return phy_init/configure errors to callback returns

[1] https://lore.kernel.org/r/20200907081825.1654-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20211020123947.2585572-1-narmstrong@baylibre.com
[3] https://lore.kernel.org/r/20200907081825.1654-1-narmstrong@baylibre.com
[4] https://lore.kernel.org/r/20220120083357.1541262-1-narmstrong@baylibre.com
[5] https://lore.kernel.org/r/20220617072723.1742668-1-narmstrong@baylibre.com

---
Neil Armstrong (13):
      dt-bindings: clk: g12a-clkc: export VCLK2_SEL and add CTS_ENCL clock ids
      clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL clocks
      clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF
      dt-bindings: display: add Amlogic MIPI DSI Host Controller bindings
      dt-bindings: display: meson-vpu: add third DPI output port
      drm/meson: fix unbind path if HDMI fails to bind
      drm/meson: venc: add ENCL encoder setup for MIPI-DSI output
      drm/meson: add DSI encoder
      drm/meson: add support for MIPI-DSI transceiver
      phy: amlogic: phy-meson-g12a-mipi-dphy-analog: fix CNTL2_DIF_TX_CTL0 value
      drm/panel: khadas-ts050: update timings to achieve 60Hz refresh rate
      arm64: meson: g12-common: add the MIPI DSI nodes
      DONOTMERGE: arm64: meson: khadas-vim3l: add DSI panel

 .../display/amlogic,meson-g12a-dw-mipi-dsi.yaml    | 117 +++++++
 .../bindings/display/amlogic,meson-vpu.yaml        |   5 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  70 ++++
 .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |   2 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  76 +++++
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |   2 +-
 drivers/clk/meson/g12a.c                           | 169 +++++++++-
 drivers/clk/meson/g12a.h                           |   3 +-
 drivers/gpu/drm/meson/Kconfig                      |   7 +
 drivers/gpu/drm/meson/Makefile                     |   3 +-
 drivers/gpu/drm/meson/meson_drv.c                  |  32 +-
 drivers/gpu/drm/meson/meson_drv.h                  |   1 +
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          | 364 +++++++++++++++++++++
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h          | 160 +++++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.c          | 174 ++++++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.h          |  13 +
 drivers/gpu/drm/meson/meson_registers.h            |  25 ++
 drivers/gpu/drm/meson/meson_venc.c                 | 211 +++++++++++-
 drivers/gpu/drm/meson/meson_venc.h                 |   6 +
 drivers/gpu/drm/meson/meson_vpp.h                  |   2 +
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |  16 +-
 .../phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c  |   2 +-
 include/dt-bindings/clock/g12a-clkc.h              |   3 +
 23 files changed, 1428 insertions(+), 35 deletions(-)
---
base-commit: ac9a78681b921877518763ba0e89202254349d1b
change-id: 20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-b8e5217e1f4a

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
