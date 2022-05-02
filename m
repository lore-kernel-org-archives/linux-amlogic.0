Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102F1C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 May 2022 13:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jq4VNW1MbVvTfQ6mjm4KgcmTRIwiGw5Jnq2OhK9aFFQ=; b=LITr+nDO07m5vayfQz97CAhXzr
	Q9qD8doydDSfOxqNknkKEy00NN8CYYhCAk25rD3RUHwe6rCCbo0g7zJ+SzAQ0ZW+1JwTLGjyfvM4Y
	rzmr+Ma3Pg/MG/AA3LPACxM0fl4hXUFOWAZKBPHOf3zVtfJUkcZ3f4qC4JkaNVcnTxIXMOpgScVPF
	jVtAHj2e5Mv/cyry59Ro7sAQHIOrN6+ziglHXSHC6kcNaZCXSOOq4vH2pmd0erwCvLGMrqRzvYcXP
	3t3oUspaN8+tXdyulVevfxIb7oN6wShZ+WAftQC1SPHr95N9Ad9f+yyR8iZbTBI+5bFsN5FXCUNY7
	0yAiqCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlVj1-001D4Q-Ia; Mon, 02 May 2022 13:04:27 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlVix-001D1r-W9
 for linux-amlogic@lists.infradead.org; Mon, 02 May 2022 13:04:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so10775308wmb.4
 for <linux-amlogic@lists.infradead.org>; Mon, 02 May 2022 06:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:to:cc:subject
 :content-language:organization:content-transfer-encoding;
 bh=woyiUxX21hwHxzXlHDKoRRV4Wmq+fW3F3m7H8e8RJJY=;
 b=gyLREp2daS42h+AFGG0n8ZDSNjk12hWY7QCLOU11BQMJ/g2ZGEuFZDBF0wbAfuu3Wm
 z7t1F7BCyTy/wmojOZgaWuH1hTfmBPsRMN9B6NqwkQ8uW4+rssLfm360eJVE/uRdcGT+
 8zgrTqK9ZHuI4cLSAH1kB6ma7djI04j42VYicbjfugKd5FlYReoofz5xMW5VAiv7QhDv
 tins7lNd/+J9ikOjC6M9Am4SwLtTyAvaEcgeHb0E15/frCt+0oMCUTdpBj4igzaz9FmE
 GTpp3b2Lz4H1ExHeOWKK1x9i2hCkUxNo9M64ceH/eTAbb6cFehJVG8tJZHd6Js0Ly1RO
 3a2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
 :cc:subject:content-language:organization:content-transfer-encoding;
 bh=woyiUxX21hwHxzXlHDKoRRV4Wmq+fW3F3m7H8e8RJJY=;
 b=gavq8WIoo15VrIj6I0DylIifETlSTe30VzhFdTmtgt2LRuEXJHUpllPebkc/WKfK1J
 y4MTqyGTtqewigEgBXLBPjXO2v6fz1gvqzEGV8iZ9vPKLxyhyr30Sw/6GCJFMb6UhPTI
 EqQOyd4xRkVzs42hndgmnLVA4HA0uSp2B+2p5OMLX2P6CMR19TyHMsCzcthkH1s9FIoA
 +U3OhylpQNRnr6GjCsyOPwsigm1DMws+8QqN33IkmOCRrBNj1gjK5eOk1GZQkScHWHDn
 FHk8PO1OCKvQ6/9zfmsdpxffYx+b1Kk7WFOUekJLkQUKO1+hI8jDpal0ftq82sjvJkuv
 ed1Q==
X-Gm-Message-State: AOAM531b9G7MenWXTPiur3aUN96wvkE6BvwJdPpWunhgvSjmCMUtX69y
 3KdawwlvreReVEqElEdrM+RnPQ==
X-Google-Smtp-Source: ABdhPJxMt48SCOuNZ/cR3NGhuJLTDDSKWYXmdSiCTQsU1a7bR6mneWuk+ZGbuoj9vrVXkkNBr7xosg==
X-Received: by 2002:a7b:c8d6:0:b0:394:25ff:2de with SMTP id
 f22-20020a7bc8d6000000b0039425ff02demr11966001wml.154.1651496637353; 
 Mon, 02 May 2022 06:03:57 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:1ae3:6f5f:320e:f969?
 ([2001:861:44c0:66c0:1ae3:6f5f:320e:f969])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a05600c29c800b003942a244f2csm7665691wmd.5.2022.05.02.06.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 06:03:56 -0700 (PDT)
Message-ID: <1e5179ab-2d92-0d64-c57b-e002ec2f0806@baylibre.com>
Date: Mon, 2 May 2022 15:03:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Neil Armstrong <narmstrong@baylibre.com>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.19
Content-Language: en-US
Organization: Baylibre
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_060424_084114_DEE11A02 
X-CRM114-Status: UNSURE (   9.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's a set of Amlogic ARM64 DT changes for v5.19, with minor fixes and additions.

Neil

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v5.19

for you to fetch changes up to 456733feb0da2dbb1288b9e8f5765df163620c2c:

   arm64: dts: meson: alpa sort the board Makefile (2022-04-11 14:52:44 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v5.19:
- DTS makefile alpsa sort
- align SPI NOR node name with dtschema
- add support for S4 power domain, gpio_intc, pinctrl
- updates and fixes for JetHub D1/H1 boards

----------------------------------------------------------------
Christian Hewitt (1):
       arm64: dts: meson: alpa sort the board Makefile

Krzysztof Kozlowski (1):
       arm64: dts: meson: align SPI NOR node name with dtschema

Qianggui Song (2):
       arm64: dts: meson-s4: add pinctrl node
       arm64: dts: meson-s4: add gpio_intc node

Shunzhou Jiang (1):
       arm64: dts: add support for S4 power domain controller

Vyacheslav Bocharov (4):
       arm64: meson: add dts bluetooth node for JetHub H1
       arm64: meson: dts: update serial alias in dts for JetHub D1
       arm64: meson: update SDIO voltage in dts for JetHub D1
       arm64: meson: update WiFi SDIO in dts for JetHub D1

  arch/arm64/boot/dts/amlogic/Makefile               | 38 +++++++++++-----------
  .../dts/amlogic/meson-axg-jethome-jethub-j100.dts  | 16 ++++++---
  .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi    |  2 +-
  .../dts/amlogic/meson-gxl-s805x-libretech-ac.dts   |  2 +-
  .../amlogic/meson-gxl-s905w-jethome-jethub-j80.dts |  6 ++++
  .../amlogic/meson-gxl-s905x-libretech-cc-v2.dts    |  2 +-
  .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |  2 +-
  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  2 +-
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 33 +++++++++++++++++++
  .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts      |  2 +-
  10 files changed, 76 insertions(+), 29 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
