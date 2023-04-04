Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D94C761A6
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Apr 2023 09:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h69t7667nrhTm/NpuoRjUAVjoXbKi1UijUMxpnHRXi4=; b=K5Hta2lN4N5dnh
	YMeEN31qhpysY6aLuKbRgIVxeZwa/FjYrbdaYo2lrV5Q8GP6qAluJV0J84p0GVqJr4VyIFYFXG+sl
	JBtst7LbL/kDlBGx6h+MU0BN9EwxB1VazkKHvkctUcbzaEFUGYTKieEOMfeEultxdA2VCcU77rawf
	+6t93gV6Of2kvmTIBnfblhSOXP89gmcDbDfkKVBuW8a64rRBwxbvctFC8JtyJUoD4G4MJvHZQIzYA
	MJZgUSeDUrhl4WVhbdWj1MSX1MnJxVsp95FRoHg9fogFZjkdgkc0EGg+rckSRad7cXFw7xPMDX2QT
	hngiuLsz9XRfCTUgvDyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjcto-000grM-01;
	Tue, 04 Apr 2023 09:24:20 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjctO-000gjk-0O
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Apr 2023 09:23:58 +0000
Received: by mail-wr1-x42f.google.com with SMTP id q19so28972698wrc.5
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Apr 2023 02:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680600230;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ghAFqdmGcU4lhfwTGUAyhjw+iMHmA3vlPtFvKmPXH18=;
        b=Vgxw2bPrkM+3FrDiFE86KdS6dS4uMGHFlWawm5jeKQUX/ihTZ+oOVU+aNJTKEccao0
         o/v9vVlvskdY1Hi9+sK+CEdPqx1Dpew+UFc+ccfa4HfdyDNMzG9VmUp6iUK2RjFD70Wk
         fu2Ad1GS/xlrvn8hj6T/PB1fy++y4ouuT1NbJR+fPrGcZ7LVwRTwU7h0NakRJa8twUJE
         TNdT+NHoTET4F6HCN1UUxgFjhYPAcSpVaN73vs+JZdaIjeTmiyuouN8cz80rU+ijuHc+
         hIlHRhxVjVcX90nj/N3NdESGADErCMDqUguR5mTi+Og/Y7Xk9PivXvWzHdpv+/ZR2xWi
         hANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680600230;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghAFqdmGcU4lhfwTGUAyhjw+iMHmA3vlPtFvKmPXH18=;
        b=nL2oRfK5mfDEOFDsHrE2WinIFJoViseSDrJTIh2erezI9jLi0vabI5o726/6N4Plml
         FEaM9uUPXxarObXuvmKeyTd6A05JjhP9TvwaQdr6PEuyzoSfY+hgN3VTa2eon+iwzGAb
         IB4m6OR+vuzOoW5/wadRIEejxivPEARD8yPRD+u95GX5IM0Qv/6tbZpuMDhHadcqWWq2
         RRMTveMiMXBaZrIoKMrckGz4Gvmr3Hsg632yaC5zRx7MxYeE/AROP3vcr/ncyVk+X85P
         QgMoU86DGtzFdCzThPBM/kTCZZ8gXb9W/CsbUUVMIykmUbsbLt0dE3tbCalKOkIKyRTI
         W42w==
X-Gm-Message-State: AAQBX9fDTvgBt7+2pxHvi5YrGZ7q2mrFDLgB1vYm6s9H5qg0yTYAMsIK
	HtnmJtYGz6QZDe2+LjMv9ClAeQ==
X-Google-Smtp-Source: AKy350b/9xy6eCOiux7oKbcFnm6xPQZObLfZY6wqmUbtMl6yn1lgbbzgX+R4vb15E7zX4w2OV2wnnA==
X-Received: by 2002:a5d:4143:0:b0:2ce:9f0d:df51 with SMTP id c3-20020a5d4143000000b002ce9f0ddf51mr1084943wrq.69.1680600230246;
        Tue, 04 Apr 2023 02:23:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5136:bca8:1616:ba77? ([2a01:e0a:982:cbb0:5136:bca8:1616:ba77])
        by smtp.gmail.com with ESMTPSA id s16-20020adfea90000000b002d21379bcabsm11745668wrm.110.2023.04.04.02.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 02:23:49 -0700 (PDT)
Message-ID: <1b955bb7-1a35-8d67-beb6-dd289533ff6f@linaro.org>
Date: Tue, 4 Apr 2023 11:23:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.4
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_022354_373456_2748E732 
X-CRM114-Status: GOOD (  14.17  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's a set of Amlogic ARM64 DT changeset for v6.4.

New boards are added:
  - BananaPi M2S, which can be mounted with pin2pin compatibles A311D or S922X SoCs
  - BPI-CM4 module with BPI-CM4IO baseboard, a RPI CM4 compatible module & baseboard

The other changes are DT fixes for dt-schema checks, gpio_intc for A1, new GXL MDIO
multiplexer for GXL and audio & bluetooth support on gxbb-kii-pro.


Neil

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.4

for you to fetch changes up to 0262f2736978b1763363224698f47112a148dab0:

   arm64: dts: amlogic: Add initial support for BPI-CM4 module with BPI-CM4IO baseboard (2023-03-07 09:02:03 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.4:
- set of DT bindings check fixes
- adjust order of some compatibles to match dt-schema migration
- add support for BananaPi M2S variants
- gxbb-kii-pro: add audio & bluetooth support
- meson-a1: add gpio_intc node
- gxl: use gxl mdio multiplexer
- Add initial support for BPI-CM4 module with BPI-CM4IO baseboard

----------------------------------------------------------------
Alexey Romanov (1):
       arm64: dts: meson-a1: add gpio_intc node

Christian Hewitt (5):
       dt-bindings: arm: amlogic: add support for BananaPi M2S variants
       arm64: dts: meson: add support for BananaPi M2S variants
       arm64: dts: meson: gxbb-kii-pro: sort and tidy the dts
       arm64: dts: meson: gxbb-kii-pro: complete the bluetooth node
       arm64: dts: meson: gxbb-kii-pro: add initial audio support

Heiner Kallweit (1):
       arm64: dts: meson: adjust order of some compatibles

Jerome Brunet (1):
       arm64: dts: amlogic: gxl: use gxl mdio multiplexer

Neil Armstrong (10):
       arm64: dts: amlogic: meson-sm1-bananapi: correct usb-hub hog node name
       arm64: dts: amlogic: meson-gxm-s912-libretech-pc: add simple connector node in fusb302 node
       arm64: dts: amlogic: meson-axg-jethome-jethub-j1xx: remove invalid #gpio-cells in onewire node
       arm64: dts: amlogic: meson-g12b-radxa-zero2: fix pwm clock names
       arm64: dts: amlogic: meson-g12b-odroid-go-ultra: rename keypad-gpio pinctrl node
       arm64: dts: amlogic: meson-s4: fix apb4 bus node name
       arm64: dts: amlogic: meson-sm1: use correct enable-gpios
       arm64: dts: amlogic: meson-gxm-s912-libretech-pc: remove unused pinctrl-names from phy node
       dt-bindings: arm: amlogic: Document the boards with the BPI-CM4 connected
       arm64: dts: amlogic: Add initial support for BPI-CM4 module with BPI-CM4IO baseboard

  Documentation/devicetree/bindings/arm/amlogic.yaml |  10 +
  arch/arm64/boot/dts/amlogic/Makefile               |   3 +
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  10 +
  .../dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi |   1 -
  .../dts/amlogic/meson-g12b-a311d-bananapi-m2s.dts  |  37 ++
  .../dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts  | 165 +++++++
  .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  | 388 +++++++++++++++
  .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      | 521 +++++++++++++++++++++
  .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |   2 +-
  .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |   6 +-
  .../dts/amlogic/meson-g12b-s922x-bananapi-m2s.dts  |  14 +
  arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts |  82 +++-
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   4 +-
  .../amlogic/meson-gxl-s905x-libretech-cc-v2.dts    |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |  29 +-
  .../dts/amlogic/meson-gxm-s912-libretech-pc.dts    |   4 +
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   2 +-
  .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |   4 +-
  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |   2 +-
  19 files changed, 1248 insertions(+), 37 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dts

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
