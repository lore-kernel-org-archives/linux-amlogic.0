Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F75C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Nov 2022 15:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZK5CYQj3TRTir8WgNClmMcZvtjQz/GhGrHe6OPfLeKU=; b=4dmfIdyT0Sg9P+
	41Ij35m/o7kyRhf36VTIAfazDmh7tTjC4Fc/eP7EuaFbQMcQd2U/5xu4DTZ17OU/vKe5i536n428w
	FrgLIbxnc5ZbhGARqs9cMSPYxv2G7111CgE2hob9cdxjDI//Iy7079h2kUrg7d9TLkvRCJVcyAauh
	4HYSbhR18NBoSqgNwlkdSDM9tXl0tm54nX4NTkpvTP9YYYczAWFZSQriUAurhzh40S/Gc9QCfypmg
	95Gic22VYD9v7MMoenJTGtJtQDUvfSdcK49s7dqhK/VGxg7qbo32Z8VrbcKr1gOrnfD19Xt5XFe//
	SLTgercrcdNEehxN74FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxVCj-00ALZQ-Dr; Tue, 22 Nov 2022 15:28:57 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxVCa-00ALTg-Q2
	for linux-amlogic@lists.infradead.org; Tue, 22 Nov 2022 15:28:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so11514951wma.1
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Nov 2022 07:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzPOjMvl1wDV/XsfinABeMniFcH6xew9GepIKMGt1Q8=;
        b=rcrExMNDawfXqiWUKKNEM9GpbkL/hVNidwXYd6GkEGBw23P8F1ho9G03+vz2AEU1YG
         ZGyi71tPR6tf/a3qbjuPJsMdW2HdPoQEO/+Snv6M1mmB7r+5M/tYPMgYRPB6f7A15zCQ
         hssruoM9kg0DEf+GpfVguyKgfHmPXZFrGxNhBPH3B0WBX9LKKq/d40EbDwbqO4T53Qs4
         zpDN0B44x4lvVEIRpAbmMhHW9IcHMZIafpALE4MDrnfMjQGe2MCOqUMNo3NQQfo4ARAm
         iuRoc5HdBOYee1IsVmMaZE2leZC3kgmRYpAt9Ew4nNQeSg/x76KciKv8Mv9Nv69cuxUp
         Gzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzPOjMvl1wDV/XsfinABeMniFcH6xew9GepIKMGt1Q8=;
        b=YPB+HWidzFKP1bTYObv4jFXSATc++LuwehKELAkbnXq3wfcPUpDAE+T4pq6G8ii0C9
         AvWHQ6t45IPsOqcpZJxbCgTWQcm3lPMFGZnj4gN3/lcKubOnkF6mBxv4fpmNGfyyzvZJ
         Bp5sNZa14Ve3O6Qg/aY27Ib35R3y+6L/zuO/hfK/gw3L6GQJLemwe6RDVwuz4TvdB78v
         UdQZBchqw9duNvhh5QQg5rG5MTJTwjQdwg0IO3Iz8o7kGUjYfp86ALlhxGL0chH6Ym9Y
         m9kP8KmTw5YslGKGmHPg8toHhEXxF+qCdxPKtZ5sQhVTTenEKru+TMAHUP5FTFYDVz+O
         jW5A==
X-Gm-Message-State: ANoB5pnSdJd4rRpj326GbjXj8QpbcLd8KI6NzdYHmfnZg8cNwPYcds2N
	GN9CFq59OoasJ0p3vhH8lfJ33g==
X-Google-Smtp-Source: AA0mqf43OJPbvw69nuSE0Kzz1kX3i6bcYOxBk2CE/mqkRqFBjldEyD/25WaXuWrOn9cBWphF6yK0kg==
X-Received: by 2002:a05:600c:4e4b:b0:3cf:7624:5fcd with SMTP id e11-20020a05600c4e4b00b003cf76245fcdmr16388380wmq.195.1669130927356;
        Tue, 22 Nov 2022 07:28:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6969:11a1:a2af:e8c0? ([2a01:e0a:982:cbb0:6969:11a1:a2af:e8c0])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b003c6c182bef9sm27857871wmo.36.2022.11.22.07.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 07:28:46 -0800 (PST)
Message-ID: <8faa1d3c-5a17-2c3f-92d1-f8fe3df74131@linaro.org>
Date: Tue, 22 Nov 2022 16:28:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.2
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_072849_535032_A595F7C6 
X-CRM114-Status: GOOD (  10.49  )
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

Here's a set of Amlogic ARM64 DT changes for v6.2, with 1 new board:
- Support for SPI clk pullups on pre-G12A
- Active cooling on Odroid N2/N2+
- DDR PMU on G12A, G12B & SM1
- Update cache properties in Amlogic DTs
- remove clock-frequency from rtc in Amlogic DTs
- Initial support of the new Portable Game Console from Hardkernel: Odroid Go Ultra

Neil

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.2

for you to fetch changes up to 62e73f000696cc41cfd237a1ad90b001ad0f76c6:

   arm64: dts: amlogic: add initial Odroid Go Ultra DTS (2022-11-21 11:51:56 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.2:
- meson-gxl: add SPI pinctrl nodes for CLK
- meson-gxbb: add SPI pinctrl nodes for CLK
- Enable active coling using gpio-fan on Odroid N2/N2+
- remove clock-frequency from rtc
- Update cache properties for amlogic
- Add DDR PMU node for G12 series SoC
- document Odroid Go Ultra compatible
- add initial Odroid Go Ultra DTS

----------------------------------------------------------------
Amjad Ouled-Ameur (2):
       arm64: dts: meson-gxl: add SPI pinctrl nodes for CLK
       arm64: dts: meson-gxbb: add SPI pinctrl nodes for CLK

Anand Moon (1):
       arm64: dts: meson: Enable active coling using gpio-fan on Odroid N2/N2+

Jiucheng Xu (1):
       arm64: dts: meson: Add DDR PMU node

Neil Armstrong (2):
       dt-bindings: amlogic: document Odroid Go Ultra compatible
       arm64: dts: amlogic: add initial Odroid Go Ultra DTS

Pierre Gondois (1):
       arm64: dts: Update cache properties for amlogic

Sebastian Reichel (1):
       arm64: dts: meson: remove clock-frequency from rtc

  Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
  arch/arm64/boot/dts/amlogic/Makefile               |   1 +
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   1 +
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   1 +
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   6 +
  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        |   5 +
  .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     | 722 +++++++++++++++++++++
  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |  42 ++
  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi        |   5 +
  arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |   1 +
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  14 +
  .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |   1 -
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |  14 +
  .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |   1 -
  .../boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts   |   1 -
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |   5 +
  16 files changed, 818 insertions(+), 3 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
