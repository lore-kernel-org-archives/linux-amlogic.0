Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF7AC11F67
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:25:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 658E161363
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 658E161363
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PBU+UsX+jvm8DwMl3+yzHIee3XDY5Lk2qt6r/2cAXKA=; b=XxroU6AoqRwr/v
	za8enC+5K41XPYTu0TegeCbhl3nXgjheaykpJC5b79xsW2Kb+7HFwg1TQRnPq6suwEG501EquOcLh
	NVJdYDuytT0xQJvab1wyMdQz+3GYWnnTsBVGHilGBC55U7Doy9NH+mnvRxn5wFTUe6ZmSw8p7FapL
	trWRKXnANCfCdZ7il5geO3GAuF/cls7dlnj/ykLrGvLALP1Cvmt2bepr9RiG96ADJU5FiivrMsvMP
	8s0Usi5/z8qNto0Xjj5xuRC5IdHFzDreCXCfmzLfbt4YYOI2BrOEjIZJ10BaM5VMcFExur4G6/JRB
	jr61zZDl5aYSaZ3aobhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3RmD-00BbZ3-Tn; Tue, 13 Jul 2021 23:25:21 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3RmB-00BbX5-8J; Tue, 13 Jul 2021 23:25:20 +0000
Received: by mail-wr1-x42c.google.com with SMTP id g16so791144wrw.5;
 Tue, 13 Jul 2021 16:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ckTGbZYjMBN6bQFIKxKbHf0AEy0oeeo0/u3w8Y3OyWc=;
 b=M2FB1G/+Bzb0HbxnguydMGZ5+c+DNtTkZdOVh5J+32yPwzMGwJSdU2Wg57LKNMV0Nc
 16LYy1mcfvowk5ZBECRfC1mJozfC42fLyxU5/hTv6+DRppzGv0YyxiM0xYyBERZbvi3O
 2UIMOr1ju/QPmwuTxniUT+3PrxKFHolhiRllxh6LeMiwcNqs1rN+wpFNihwRu+Zbmhns
 eoHRYOLHKFsjmMe1crKh1YtSbEoSsC5LVzfxm8Ve4d5j767nVZk+PhrvnFyGJpwTAlgL
 i9iDSmstrrlXXCOOU76QeKMQEasCFiCCRcTEcoyiZteqLK83a5xONkIKG6y/L3fnUn3F
 N3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ckTGbZYjMBN6bQFIKxKbHf0AEy0oeeo0/u3w8Y3OyWc=;
 b=N4cdzg/IRdF5Y2ZfMGQX6yIuiwtrVfFvTIDm4RGJ7hZtaVzXjYQn2uZtk3OwGzyRTW
 i3wdTcXiamO1RGydYNzTkh9cR0hjW27wiscgyflKSY4O7HOBcbbEMDz+L2co7OjKvnku
 KO5k+dxYQPtNyIGQ+TYcBCImmNpOxIHtNNozFV/vOKblyqWdjPXtGv0YsoG381gSVwH0
 t3WGZ/wcJD8XG6GHAhTglBBhHij835F85sT9pLXwg0OKqdkovmPqctkIm+FV56yegB2G
 weV3NoQl6lbRVSLLy58NDLEbsMIo98Ur5N92lsZeWD4PEASoDwg9ThDVP7MfP789UuFX
 aPVg==
X-Gm-Message-State: AOAM532D7aie+nAiQLfNE2FjIv+mP+LbWHissD6dXYVgow/e0a/drlpP
 NTTASztLwA2wFIHCxhJr6E8byX8ll98=
X-Google-Smtp-Source: ABdhPJw3h3gd6eTLJMr6Skks+aXz9E25IeOGjNqYyBOuIUrXawnRbKh7RPGk85sG6Y6UZWP6kskkTg==
X-Received: by 2002:adf:a148:: with SMTP id r8mr8528226wrr.415.1626218717651; 
 Tue, 13 Jul 2021 16:25:17 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c041-6f00-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c041:6f00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id o11sm3857390wmc.2.2021.07.13.16.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 16:25:17 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, jbrunet@baylibre.com, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/6] clk: meson8b: video clock tree fixes and making it mutable
Date: Wed, 14 Jul 2021 01:25:04 +0200
Message-Id: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_162519_359308_5AC5353E 
X-CRM114-Status: GOOD (  14.26  )
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

The first two patches in this series are small fixes before we can
actually make the video clock tree mutable. One patch adds
CLK_SET_RATE_NO_REPARENT for better rate control and the other adds
a missing clock gate.

The third and fourth patch are targeting the HDMI PLL. Add the known
working M/N combinations. Also this PLL has some special "doubling"
setting, which is calculated like this:
  OUTPUT = (IN * M / N + FRAC) * 2
Since not all register bits are known we use a copy of the 2970/2975MHz
magic register values from the vendor driver.

The fifth patch makes the clocks in the video clock tree mutable. The
final patch in this series exports the clocks needed for rate control.

For reference, this is the .dts definition for the Meson8b VPU. The
code for the VPU driver is unfortunately not ready for upstreaming yet.
However, I have tested with all resolutions my monitor supports and the
clock settings are all applied correctly.
    vpu: vpu@100000 {
      compatible = "amlogic,meson8b-vpu";

      reg = <0x100000 0x10000>;
      reg-names = "vpu";

      interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;

      amlogic,canvas = <&canvas>;
      amlogic,hhi-sysctrl = <&hhi>;

      /*
       * The VCLK{,2}_IN path always needs to derived from
       * the CLKID_VID_PLL_FINAL_DIV so other clocks like
       * MPLL1 are not used (MPLL1 is reserved for audio
       * purposes).
       */
      assigned-clocks = <&clkc CLKID_VCLK_IN_SEL>,
                        <&clkc CLKID_VCLK2_IN_SEL>;
      assigned-clock-parents = <&clkc CLKID_VID_PLL_FINAL_DIV>,
                               <&clkc CLKID_VID_PLL_FINAL_DIV>;

      clocks = <&clkc CLKID_VPU_INTR>,
               <&clkc CLKID_HDMI_INTR_SYNC>,
               <&clkc CLKID_GCLK_VENCI_INT>,
               <&clkc CLKID_HDMI_PLL_HDMI_OUT>,
               <&clkc CLKID_HDMI_TX_PIXEL>,
               <&clkc CLKID_CTS_ENCP>,
               <&clkc CLKID_CTS_ENCI>,
               <&clkc CLKID_CTS_ENCT>,
               <&clkc CLKID_CTS_ENCL>,
               <&clkc CLKID_CTS_VDAC0>;
      clock-names = "vpu_intr",
                    "hdmi_intr_sync",
                    "venci_int",
                    "tmds",
                    "hdmi_tx_pixel",
                    "cts_encp",
                    "cts_enci",
                    "cts_enct",
                    "cts_encl",
                    "cts_vdac0";

      resets = <&clkc CLKC_RESET_VID_DIVIDER_CNTL_RESET_N_PRE>,
               <&clkc CLKC_RESET_VID_DIVIDER_CNTL_RESET_N_POST>,
               <&clkc CLKC_RESET_VID_DIVIDER_CNTL_SOFT_RESET_PRE>,
               <&clkc CLKC_RESET_VID_DIVIDER_CNTL_SOFT_RESET_POST>;
      reset-names = "vid_pll_pre",
                    "vid_pll_post",
                    "vid_pll_soft_pre",
                    "vid_pll_soft_post";

      power-domains = <&pwrc PWRC_MESON8_VPU_ID>;

      nvmem-cells = <&cvbs_trimming>;
      nvmem-cell-names = "cvbs_trimming";

      #address-cells = <1>;
      #size-cells = <0>;

      #sound-dai-cells = <0>;
      sound-name-prefix = "HDMITX";

      /* CVBS VDAC output port */
      cvbs_vdac_port: port@0 {
        reg = <0>;
      };

      /* HDMI-TX output port */
      hdmi_tx_port: port@1 {
        reg = <1>;

        hdmi_tx_out: endpoint {
          remote-endpoint = <&hdmi_tx_in>;
        };
      };
    };


Martin Blumenstingl (6):
  clk: meson: meson8b: Use CLK_SET_RATE_NO_REPARENT for vclk{,2}_in_sel
  clk: meson: meson8b: Add the vid_pll_lvds_en gate clock
  clk: meson: meson8b: Add the HDMI PLL M/N parameters
  clk: meson: meson8b: Initialize the HDMI PLL registers
  clk: meson: meson8b: Make the video clock trees mutable
  clk: meson: meson8b: Export the video clocks

 drivers/clk/meson/meson8b.c              | 163 +++++++++++++++++------
 drivers/clk/meson/meson8b.h              |  26 ++--
 include/dt-bindings/clock/meson8b-clkc.h |  10 ++
 3 files changed, 143 insertions(+), 56 deletions(-)

-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
