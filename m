Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8133C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jun 2022 07:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NbUpOfWw2C4hPpqzWK7hHhqDEIeESWHn+fsJthHF3AI=; b=dC0kXXUJoiAdMP
	503pG+rc7hJ/9Sq7dvW0m/g6zs6oyWZ8QKhzzxxYYxihw8q7S5cW7IWU2g4/OX7XlLLqkfncd+SgK
	uowZuEZ2cHoZCjbXPMuil2dm6ZWqNfbRKCqiNte73MUVzGn84UgxZUsGsRmI/HFO09Uw1QRYM4uV0
	Ok/X9R4TtxiUZpxhICREvNSydjkYtPQFRF37urY18XTBLpJAOyw3r8hvaGwtABoqv4mziDKnfAYeI
	Rz4Bg/jxflZf1wmP17DvJ8/YSN+6TQFSOGNhMmmRr3XzrQOytLF96L5K2qpwdhPoCTxgR1SlEhDRy
	6Cb4weqHHt0GuXpedCGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26bl-0062Yj-W7; Fri, 17 Jun 2022 07:41:34 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26OH-005x4A-6M
	for linux-amlogic@lists.infradead.org; Fri, 17 Jun 2022 07:27:40 +0000
Received: by mail-ej1-x636.google.com with SMTP id g25so7091022ejh.9
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Jun 2022 00:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oQq40oMN7gmdQC+AT9QDPaFxl7FPBvbWJRNfnUwXKDM=;
        b=WVyrrkfevDNjf+huonwA9B5s9xSQZYZi2r+aZUELTsXXjF4O6vQnCqY+BUEzJzZNRd
         d0LLVZgipLJfHZccSmmrVjXndNOa1A1T+d6hzxJOJMd/SCGtqukb0dzuV+Jdns53yf/7
         Ol4vmMnc60F3iMCAHFSuDmvoCQ3urv9+N5CM04/o0XSJWSQ1PRXCIUrFblifTIVUsAmp
         dGv/7awkXmswiMdpVa6RwYH0fHwxeitYDETgmlTKVnoAQiG14yu2C2+QJfrSz0PYRTpp
         vjsPAciMrBMiuyaIhvkjJbElQzVbnKgUyiXIfEe2s9c38vYjLN3+J649BKh9yggDUtOx
         WeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oQq40oMN7gmdQC+AT9QDPaFxl7FPBvbWJRNfnUwXKDM=;
        b=k9+CsD/4/AnMDWpq/FeG6YcQfCvR1U6UNN/Rw72CdAKcOUaBzPzr3hDYuPGEI1ao2B
         6ec/adNjsDglu1Kj7QqlkwNkePLimjZ66u8hAtRdPdOpYsXLXNtpoJLOcMmPHPXI0zsI
         ydWOOeH+8RR6EKwRcY6Z32+13zBHcQliFK4/WYXu9G9CAvkoV5jT0ys4SP27sa+AlZCu
         klW6ZyJiJeX0D17JRatqLHUDFxwIk4oJYMBJBwdPvLfW8ogoZEN41et6BEyyHQrfpxXD
         oXwpGvOZZn1EcxXF9qx79HgyNpd81oUMP+xI3JPaD7WzY//eDRT1rK9trJu9PGNdnrh5
         nl9Q==
X-Gm-Message-State: AJIora+LKVtsoMOyINr+DA8VTw/4qVsxhdKvCbq9R9ZN0Ed/soH6AJZ8
	ho17zi4+scBVCs1FMudheO59MA==
X-Google-Smtp-Source: AGRyM1sxFqf+ZA9TwaYMiAGjuKdZcewUkcjEfmKspEGGfwpwBFc9cv9j/GszRPgEU+WXq8tqHYmaJA==
X-Received: by 2002:a17:906:2001:b0:6f3:bd7f:d878 with SMTP id 1-20020a170906200100b006f3bd7fd878mr8116353ejo.133.1655450851577;
        Fri, 17 Jun 2022 00:27:31 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d227:8f3c:286a:d9d8])
        by smtp.gmail.com with ESMTPSA id n9-20020a170906840900b006fec56a80a8sm1762556ejx.115.2022.06.17.00.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 00:27:31 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 0/6] drm/meson: add support for MIPI DSI Display
Date: Fri, 17 Jun 2022 09:27:17 +0200
Message-Id: <20220617072723.1742668-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3794; h=from:subject; bh=BYC7E8gt4vas7fssyMJgGADHrk4Bwh9RxYGpTB1C8D8=; b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBirCyovMIHKIMtHpx/OwvFBdD5fVOk6xZj4JYrwLfJ ZEfcuKCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYqwsqAAKCRB33NvayMhJ0bnKEA CmyCVZ3hb6HAVePCseiDUslVAYevwqViz8UY2glZksO26r2p8ClzOMmK+cRExDx3CqFgl07CT2+I6E Yl7/h0pgvDSwv3pFlN7cXaWitSgG4wH03VelPzbaqBZpSwktLocHfkwN/sSwQyzO49AQtnUdPaYeLQ 7rOh2oJwxFYJJWHqgab+wznPy5HdPVsAAVEQWZ0pN8jnZ+qUNqIbr3x+m3SMMAYKVl2Ew1eABDSRdG ravmDkaLPC/KM5BYPIEtjiPTqYGXRlNT5Q06pLhtkiROP8+tSSSKEkyANjnqpwWaqYQb/8VQRoSEr6 dqRtcT0eKTeuEZZyYXP2fmQu8N7qg0iZk+Mkz31Hfn4xvB46QIPw6e3lrU/Fn0LrmaA4g+0gasJ0kd ukeaRlae2RvDOGKkgzdk+sxh/zGZmy6gfk1SMmY1LQo54YbB6y9XanJuqaeSgdZRYZSKEvZRtWxkB5 8relb6eqemFt/c/LEPKX61hMczMd9emGFQcnXIums4pXep0vLtFNHWDjZp3IMOW0iPCgzl0/ujCzYB +MJw+jngKVAQs3RAmvtNLu8dw2w9lrjViHBHXsph4GAVZDe6WUUguSiV68xCG3v+NrNItohcx2iO07 CDDpkQfoyCP7E7DaeweqxD5oTxlp/zTml/KNPUQcf2V4XhDnJwUzRoJLWclQ==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_002737_349343_8CBDC0EB 
X-CRM114-Status: GOOD (  17.78  )
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
- the AXG has a single clock source for both transceiver + pixel, which makes it an
  exception instead of a rule, it's simpler to add support for G12A then add AXG on it
- previous glue code was a single monolitic code mixing encoders & bridges, this version
  is aligned on the previous cleanup done on HDMI & CVBS bridges architecture at [2]
- since the only output of AXG is DSI, AXG VPU support is post-poned until we implement
  single-clock DSI support specific case on top of this.

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

Neil Armstrong (6):
  dt-bindings: display: add Amlogic MIPI DSI Host Controller bindings
  dt-bindings: display: meson-vpu: add third DPI output port
  drm/meson: venc: add ENCL encoder setup for MIPI-DSI output
  drm/meson: vclk: add DSI clock config
  drm/meson: add DSI encoder
  drm/meson: add support for MIPI-DSI transceiver

 .../display/amlogic,meson-dw-mipi-dsi.yaml    | 116 ++++++
 .../bindings/display/amlogic,meson-vpu.yaml   |   5 +
 drivers/gpu/drm/meson/Kconfig                 |   7 +
 drivers/gpu/drm/meson/Makefile                |   3 +-
 drivers/gpu/drm/meson/meson_drv.c             |   7 +
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c     | 358 ++++++++++++++++++
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h     | 160 ++++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.c     | 160 ++++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.h     |  12 +
 drivers/gpu/drm/meson/meson_registers.h       |  25 ++
 drivers/gpu/drm/meson/meson_vclk.c            |  47 +++
 drivers/gpu/drm/meson/meson_vclk.h            |   1 +
 drivers/gpu/drm/meson/meson_venc.c            | 211 ++++++++++-
 drivers/gpu/drm/meson/meson_venc.h            |   6 +
 drivers/gpu/drm/meson/meson_vpp.h             |   2 +
 15 files changed, 1117 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
 create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.c
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.h

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
