Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD94C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 23:47:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B449461222
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 23:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B449461222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CdSNjU5aiPdCfpcgK/1qB8/QxfdaZi45e0cYHQYWMJ0=; b=1/l79dOg4c4XyS
	1tdgcCo6oVzzSLozhwnh5x3puC2OXmSpt09mEfiO4+Tgr0i/wFm50nre9GEW7RZaVx55IPqNe2A7F
	EFubPtb31PNF3EOgT5al7sExenQzj/rtmd9nYxHoLiNiU4LHmKvHcVG450moXWr+5y+26XMXNSZln
	h+DQumTpBgf38imx5hbmWavs71Znhn0qGx0FVyHeDNahNJNDKQ1aOfOPckvG1S+ZFa7H+1Cj0uW8w
	5zhotp5iub57qXItjLa3IrHE7IrrXlRpAFi3qPGp+i/rBtobWFA3Y8noCKQK0NldgUdDpm/5Nm8S9
	DyyPF/6sLnKeEKagKeIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSSzt-003L6Q-8m; Mon, 20 Sep 2021 23:46:53 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSSzp-003L5x-7s
 for linux-amlogic@lists.infradead.org; Mon, 20 Sep 2021 23:46:51 +0000
Received: by mail-qt1-x836.google.com with SMTP id m9so17346085qtk.4
 for <linux-amlogic@lists.infradead.org>; Mon, 20 Sep 2021 16:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=z30gP2QwsprBrQ+MZUJ8UEPNKCTcxWT7Qo3YVC+L310=;
 b=nqTTjEW1ngkuFpFgrkga4hX10wBdqDvu6pwqeA3bJvlZkJw8cbeQmhMKUSANmU6+U6
 xJqFQOx0eL2+fk+9Zw/UgDGqsKGs12VrmBSoscGGZzYBI/secbRk2mAJIvYEEh478hlv
 s8rdcLSPidf7c8+Uah2WQfm985XZbLg2+O6GPDEphXvlibIw/l7ASFc7J2Be776s13Aw
 4vYLIoN7oNmP+Ytg4FEjZVgDCx1ANxKnT2QLIM0DKMXozOsYJHjhzsP6nBP6ghTJKW+k
 qY6FAMyTpDElQWQwHB67pU1SBImOpVmCfYPJLgIP+mtXRk5/A6Bu+V9zOG0PEw4DU0Bl
 s6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=z30gP2QwsprBrQ+MZUJ8UEPNKCTcxWT7Qo3YVC+L310=;
 b=8LjcNZP4z1xmpbnK3OugrSIpBtuzuayBoSsQ95XzluB2g0IdljR6XefQKe7XNrc9sP
 3nPQZ7uhh8VKn4Z0A0fpiUvpFBX3X5MlFSx0jABKyo21q3Wo6pbiXRR6iKQX7o2IVvqJ
 YGU46/ytz076VvX51L0BhnFMHhJn56+C/8qD+0ndRH/hXHeNeOaOoU0+sAoqdt48ZsxW
 8loV3bUjxn0YbWNsVvoMTZaBdW215uekeK9sBi8j+6e+cpysC6ZB1rsxoGSZWYCEKmHc
 ZefCDFxLcFJEJ4xQBYAjiojLuwBHZUBpnpBUh+TmzQo1Q2BSNjoDyWCrC9X2+Q40l+f2
 VruA==
X-Gm-Message-State: AOAM533Bx5Nqhql8TzSzjEQJVgVPxDET84srzMs3wRm2xWh9nuSXdNxu
 MtHj4nIazid+I0mdggVXGa6QdJoyie+EvcR7WADV+ClnynA=
X-Google-Smtp-Source: ABdhPJwMStrHb2HATDCROljuWIIYpb/1lFmnqJZrs/DBaoWi1V7GkaPyiV6HGv4a6LV+eHtSTsCNZygEOnmOaMlmpes=
X-Received: by 2002:a05:622a:551:: with SMTP id
 m17mr25525818qtx.119.1632181607426; 
 Mon, 20 Sep 2021 16:46:47 -0700 (PDT)
MIME-Version: 1.0
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Mon, 20 Sep 2021 20:43:17 -0300
Message-ID: <CAEsQvcsNLJYezYNpDNGJX49NhWgAqjAYAPDcbwrg3+0PmZdh+w@mail.gmail.com>
Subject: Regression, bisected: meson-dwmac8b never loads, no ethernet
To: arnd@arndb.de
Cc: bjorn.andersson@linaro.org, martin.blumenstingl@googlemail.com, 
 linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_164649_339175_554F7565 
X-CRM114-Status: GOOD (  18.33  )
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

Hello Arnd,

I'm sorry to inform you that commit
a0f480dc6546b9d97027bf7bc8145aad48ddad00 causes a regression in
5.15-rc1 for the meson-dwmac8b ethernet driver.

meson-dwmac8b never loads and libphy never probes stmmac

I've bisected it over the weekend. The results follow.

The bad commit mostly consists of qcom DT changes that shouldn't
trigger anything nasty like missing ethernet for meson (amlogic) but
there's the possibility the regression is caused by stmmac
modifications inside "Merge tag 'v5.14-rc3' into arm64-for-5.15
(2021-08-16 18:02:26 -0500)"

This is just a guess as I haven't been able to pinpoint so far what
precisely causes the regression.

Best,
Geraldo Nascimento

----

Bisecting: a merge base must be tested
[7d2a07b769330c34b4deabeed939325c77a7ec2f] Linux 5.14
Bisecting: 5788 revisions left to test after this (roughly 13 steps)
[1b4f3dfb4792f03b139edf10124fcbeb44e608e6] Merge tag
'usb-serial-5.15-rc1' of
https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into
usb-next
Bisecting: 2896 revisions left to test after this (roughly 12 steps)
[c793011242d182e5f12800c12dbaf37af80be735] Merge tag 'pinctrl-v5.15-1'
of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
Bisecting: 1446 revisions left to test after this (roughly 11 steps)
[4cdc4cc2ad35f92338497d53d3e8b7876cf2a51d] Merge tag
'asm-generic-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic
Bisecting: 703 revisions left to test after this (roughly 10 steps)
[9e5f3ffcf1cb34e7c7beb3f79a96f58536730924] Merge tag
'devicetree-for-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
Bisecting: 344 revisions left to test after this (roughly 9 steps)
[a0f480dc6546b9d97027bf7bc8145aad48ddad00] Merge tag
'qcom-arm64-for-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
Bisecting: 197 revisions left to test after this (roughly 8 steps)
[aadf2b3857ad1d09fb28f08058a746f04698f81b] Merge tag
'tegra-for-5.15-arm-dt' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/dt
Bisecting: 98 revisions left to test after this (roughly 7 steps)
[f70c6dc013c1842b0ca640926cf74e7b99cec33d] arm64: dts: qcom: pm8150b:
Add DTS node for PMIC VBUS booster
Bisecting: 51 revisions left to test after this (roughly 6 steps)
[6d640913126db109f2e3389173f0fe42413a8183] Merge tag 'imx-dt64-5.15'
of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
Bisecting: 27 revisions left to test after this (roughly 5 steps)
[9b35ab1e314c3f563f8d6982c0a8f2c8964e4a36] Merge tag 'imx-dt-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/dt
Bisecting: 13 revisions left to test after this (roughly 4 steps)
[77246d45d28f32fee3f92421aaca0e24c97ce6d1] arm64: dts: qcom:
sdm845-mtp: assign DSI clock source parents
Bisecting: 6 revisions left to test after this (roughly 3 steps)
[b05f82b152c905425586f07fb2575011f67a5053] ARM: dts: qcom: msm8974:
Add blsp2_uart7 for bluetooth on sirius
Bisecting: 3 revisions left to test after this (roughly 2 steps)
[f95c4c56d65225a537a2d88735fde7ec4d37641d] ARM: dts: qcom: add ahb
reset to ipq806x-gmac
Bisecting: 1 revision left to test after this (roughly 1 step)
[198b8c8ede36d2135df73fee19506276059a0f8e] Merge tag 'v5.14-rc3' into
arm64-for-5.15
Bisecting: 0 revisions left to test after this (roughly 0 steps)
[4d314179d62b19d0b5ac8de51b491494359c7a19] Merge tag
'qcom-dts-for-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt
a0f480dc6546b9d97027bf7bc8145aad48ddad00 is the first bad commit
commit a0f480dc6546b9d97027bf7bc8145aad48ddad00
Merge: 4d314179d62b 198b8c8ede36
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Wed Aug 18 14:37:16 2021 +0200

    Merge tag 'qcom-arm64-for-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/dt

    Qualcomm ARM64 updates for v5.15

    SDM660 and SDM630 was concluded to be similar enough that they should be
    merged, and the derivative SDM636 was added to the bunch. The combined
    platform gained support for GPU, DMA, I2C, IMEM, display, power-domains,
    SDHCI, thermal, USB, interconnects, VADC, WLED and audio remoteproc. The
    Sony Xperia "Ganges" platform was similarly merged with "Nile", got
    cleaned up and gained touchscreen, USB, volume keys and uSD support.

    IPQ6018 gains USB2 and PCIe support and a few minor fixes. IPQ8074
    gains SCM, PRNG and Crypto support and a DT style update of the PCIe
    nodes.

    MSM8916 gains Coresight STM support. The Xiaomi Redmi 2 is introduced,
    with touchscreen, notification LED and IMU support. MSM8996 gains
    support for GPU cooling and v3.0 of the SoC, which is used to introduce
    support for the Sony Xperia X Performance, XZ and XZs phones.

    SC7180 finally gains DisplayPort support and LPASS is updated
    accordingly. A number of fixes are introduced and with the newly
    introduced DRM aux bus in place Trogdor's panel is moved under the eDP
    bridge. SC7280 gained USB, eMMC, SD-card, QFPROM and IPA support, the
    new IDP2 board was added.

    SM6126 (aka Snapdragon 665) was introduced, together with the Sony
    Xperia 10II phone with support for framebuffer, USB, eMMC and volume
    keys.

    SM8150 gained inline crypto support for UFS enabled, CPU opp-tables was
    introduced to scale DDR and L3 frequencies and SPI nodes where added, in
    addition to a number of smaller fixes.

    SM8250 gained a number of minor fixes and had its serial engines wired
    up to use the GENI wrappers' DMA engines.

    SM8350 had wakeup-parent defined for the TLMM gpio node and I2C13 was
    introduced.

    SDM845 display clocks was corrected and Lenovo Yoga C630 got IPA enabled
    and now has working LTE connectivity.

    Additionally a number of minor fixes throughout to correct DT validation
    warnings.

    Lastly v5.14-rc3 is merge in to resolve the merge conflicts caused by
    the USB maintainer deciding to fix a regression in his tree.

    * tag 'qcom-arm64-for-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux: (114
commits)
      arm64: dts: qcom: sm8250: assign DSI clock source parents
      arm64: dts: qcom: sdm845-mtp: assign DSI clock source parents
      arm64: dts: qcom: sdm845: assign DSI clock source parents
      arm64: dts: qcom: sc7180: assign DSI clock source parents
      arm64: dts: qcom: sc7280-idp: Add device tree files for IDP2
      dt-bindings: arm: qcom: Document qcom,sc7280-idp2 board
      arm64: dts: qcom: sm8350: fix IPA interconnects
      arm64: dts: qcom: sc7180: define ipa_fw_mem node
      arm64: dts: qcom: sc7280: enable IPA for sc7280-idp
      arm64: dts: qcom: sc7280: add IPA information
      arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
      arm64: dts: qcom: ipq8074: add PRNG node
      arm64: dts: qcom: ipq8074: add crypto nodes
      arm64: dts: qcom: sm8350: add qupv3_id_1/i2c13 nodes
      arm64: dts: qcom: ipq6018: Add pcie support
      arm64: dts: qcom: pm8150b: Add DTS node for PMIC VBUS booster
      arm64: dts: qcom: sm8150: add SPI nodes
      arm64: dts: qcom: msm8916: Enable CoreSight STM component
      arm64: dts: qcom: sc7280: Add qfprom node
      arm64: dts: qcom: sc7280: Fixup the cpufreq node
      ...

    Link: https://lore.kernel.org/r/20210816231223.586597-1-bjorn.andersson@linaro.org
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

 Documentation/devicetree/bindings/arm/qcom.yaml    |    4 +
 .../devicetree/bindings/thermal/qcom-tsens.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    9 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          |    1 +
 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts       |    8 +
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |    8 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  157 ++-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          |    2 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   54 +-
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts           |    3 +-
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |  313 +++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   27 +
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |    8 +-
 arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi          |    8 +
 .../qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts |   11 +
 .../msm8996-pmi8996-sony-xperia-tone-kagura.dts    |   11 +
 .../msm8996-pmi8996-sony-xperia-tone-keyaki.dts    |   11 +
 .../dts/qcom/msm8996-sony-xperia-tone-dora.dts     |   27 +
 .../dts/qcom/msm8996-sony-xperia-tone-kagura.dts   |   15 +
 .../dts/qcom/msm8996-sony-xperia-tone-keyaki.dts   |   26 +
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |  956 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi         |   63 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   44 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |    4 +-
 arch/arm64/boot/dts/qcom/pm660.dtsi                |  133 ++
 arch/arm64/boot/dts/qcom/pm660l.dtsi               |   54 +
 arch/arm64/boot/dts/qcom/pm8004.dtsi               |    2 -
 arch/arm64/boot/dts/qcom/pm8150b.dtsi              |    6 +
 arch/arm64/boot/dts/qcom/pmi8996.dtsi              |   15 +
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |   60 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |    2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |   62 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  102 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |  241 +---
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |  341 +++++
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts           |   23 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  419 +++++-
 .../dts/qcom/sdm630-sony-xperia-ganges-kirin.dts   |   14 +-
 .../boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi   |   40 -
 .../dts/qcom/sdm630-sony-xperia-nile-discovery.dts |    1 +
 .../dts/qcom/sdm630-sony-xperia-nile-pioneer.dts   |    1 +
 .../dts/qcom/sdm630-sony-xperia-nile-voyager.dts   |    1 +
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |  527 ++++++-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               | 1441 ++++++++++++++++++--
 .../dts/qcom/sdm636-sony-xperia-ganges-mermaid.dts |   14 +-
 arch/arm64/boot/dts/qcom/sdm636.dtsi               |   23 +
 .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts |    2 -
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |  519 +++----
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |    3 +
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   11 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   35 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |    5 +
 .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |  139 ++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |  566 ++++++++
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  797 ++++++++++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  217 ++-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   53 +-
 60 files changed, 6754 insertions(+), 892 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
 create mode 100644
arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts
 create mode 100644
arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dts
 create mode 100644
arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmi8996.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-idp2.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm636.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125.dtsi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
