Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634D8C76195
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 14:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JnHeFc1l+ksp2LvMrEP0s+FJruVNtuTXaLxk35R/gNg=; b=sCa5bDi7xG1zru
	jRxLCi1XqzayjsLZJIMAlmFGzbdgIfWpQKJtEjjR8sJ+417X9zznRkQRNuri8bz5yIfekSz0ITBu+
	yD6jzw7H1IYM6VFV0PjM/S0VyERg+YMFNoV6FcziCGTOE6yF1vTAX5dBTQTRyCGkIe9Zp+k/HCd6S
	SQnA7vFl1ashzD4kSNKRP1vbiCk+rpkNsyle+r7iMS+0484pCM8JzUHDbknuiCeBuoVvIjpKg10bE
	okbIhPJtE8jEAksbFE/x5flbzfGqoxpbW3L/BlYlCBCx4kZnWR6MX9kUqyKUYQwuplGqGWhrTt3lC
	7/8AqiMW7rJ5UmCKKtPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLyv-002BcR-0M;
	Thu, 23 Mar 2023 14:31:57 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLyq-002Ba5-0G
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 14:31:55 +0000
Received: by mail-wr1-x430.google.com with SMTP id l27so12414903wrb.2
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 07:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679581906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GtxHLyfxfeURVa6Qi3viuNcHaP6ddTRNB/n+wSrkxmM=;
        b=k8i1idWb+1qe0e4dzQXM6oqJkbuS45jmp4V5Z8O0vvtJ+8aWCZnSqH8odyh1n566SG
         X1diQNc1+PI5D4PxEpF+bCDAbRGDhnn8RYIhkAOPlM3IU3Y6lsUHNunqtPR6itxKEGK3
         ApdfLU2bqLMj65O14I/yiVQLRnqJGtSw/qjXAsmihkvIH4A83tvLxT80FeHMdkueVG7Y
         mVSkxmVb8ucvA6hStNGVOmdBj+i1UBTzHN5F1yP2V0VIQot7YtqWVMXLhAtHnO3FzWwg
         ZOiyDzK0ZP09ktqHcoxS2ACMOmLozwYo57zvv6W/kHI4LFDPeEHSondriO+zo2Mth/p7
         tUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679581906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GtxHLyfxfeURVa6Qi3viuNcHaP6ddTRNB/n+wSrkxmM=;
        b=b2MihvupCA+34uLTqdhy/4hxFnz5SEKVCBN3D5qPdzTto/OxI4/jHCaws/CdogsIZV
         2FN90Si0VIl7heuw3yNg4ETS1ZexUFH1MsPaiLRnKjlCC3hRabWOCAzK/fmZOzU5KvVF
         5AwuKAtIV2MWA2nORUROb2RTeLMzEdOSLo4C/5A+XL10jMEzyU5N1LbL21v8fkkYL01c
         z8E3ddRhdLY1C+zlb2mCCKkGDE/AbW60hgC3Ivi1WknHVOpVUaM7xhuOPaj+1CCvSF1z
         JAXZCujudVdUT8CjSPy/zgiXguO7JLW+LbcDP+kR8JTVgIf5xxDkBQCgz+KWiMLCsr8P
         cMZA==
X-Gm-Message-State: AAQBX9fa2dVSv08iIESmnbtgE5M+8AZ2U5gK69MKc4eOyNTohuSGXE4I
	dKJJ4YhjVTLe3Pr22zrffMc=
X-Google-Smtp-Source: AKy350aIM/OxWD9qYL2ZhtUC0qwS0TmcxADinIrDWPOxIv/4RxjVjW8L0UflZjKz+EoH1x143r1+qw==
X-Received: by 2002:adf:fc4a:0:b0:2cf:ea9e:2585 with SMTP id e10-20020adffc4a000000b002cfea9e2585mr2724050wrs.59.1679581906443;
        Thu, 23 Mar 2023 07:31:46 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a6-20020a056000100600b002c8ed82c56csm16311242wrx.116.2023.03.23.07.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 07:31:45 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 00/14] boards: amlogic: add BananaPi/Radxa/WeTek boards
Date: Thu, 23 Mar 2023 14:31:28 +0000
Message-Id: <20230323143142.780306-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_073152_137650_F61FD04D 
X-CRM114-Status: GOOD (  12.33  )
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

This series adds support for the following boards which are
tested and booting fine with 2023.04-rc4:

- BananaPi M2-Pro (S905X3)
- BananaPi M2S (A311D or S922X)
- Radxa Zero2 (A311D)
- WeTek Hub (S905)
- WeTek Play2 (S905)

I also spotted that bananapi-m5 wasn't referrences in the u200
maintainer file so there's a patch to correct that too.

Changes since v1:
- Add reviews on M2-Pro/M2S/Zero2 dts/config patches
- Add a patch to correct a missing blank line in recently updated docs
- Fix commit message for Hub/Play2 config patch

Christian Hewitt (14):
  docs: boards: amlogic: add bananapi-m5 to u200 maintainer file
  docs: boards: amlogic: fix blank-line typo in recently updated docs
  ARM: dts: add support for BananaPi M2-Pro
  boards: add BananaPi M2-Pro defconfig
  docs: boards: amlogic: add documentation for BananaPi M2-Pro
  ARM: dts: add support for BananaPi M2S
  boards: add BananaPi M2S defconfig
  docs: boards: amlogic: add documentation for BananaPi M2S
  ARM: dts: add support for Radxa Zero2
  boards: amlogic: add Radxa Zero2 defconfig
  doc: boards: amlogic: add documentation for Radxa Zero2
  ARM: dts: add support for WeTek Hub and WeTek Play2
  boards: amlogic: add WeTek Hub and WeTek Play2 defconfig
  doc: boards: amlogic: add documentation for WeTek Hub and WeTek Play2

 arch/arm/dts/Makefile                         |   9 +-
 .../arm/dts/meson-g12b-a311d-bananapi-m2s.dts |  33 ++
 arch/arm/dts/meson-g12b-bananapi-u-boot.dtsi  |   7 +
 arch/arm/dts/meson-g12b-bananapi.dtsi         | 521 ++++++++++++++++++
 .../dts/meson-g12b-radxa-zero2-u-boot.dtsi    |   7 +
 arch/arm/dts/meson-g12b-radxa-zero2.dts       | 489 ++++++++++++++++
 .../arm/dts/meson-g12b-s922x-bananapi-m2s.dts |  14 +
 arch/arm/dts/meson-gxbb-wetek-hub.dts         |  58 ++
 arch/arm/dts/meson-gxbb-wetek-play2.dts       | 119 ++++
 arch/arm/dts/meson-gxbb-wetek-u-boot.dtsi     |  13 +
 arch/arm/dts/meson-gxbb-wetek.dtsi            | 292 ++++++++++
 .../dts/meson-sm1-bananapi-m2-pro-u-boot.dtsi |  14 +
 arch/arm/dts/meson-sm1-bananapi-m2-pro.dts    |  97 ++++
 arch/arm/dts/meson-sm1-bananapi-m5.dts        | 427 +-------------
 arch/arm/dts/meson-sm1-bananapi.dtsi          | 435 +++++++++++++++
 board/amlogic/p200/MAINTAINERS                |   4 +
 board/amlogic/u200/MAINTAINERS                |   3 +
 board/amlogic/w400/MAINTAINERS                |   4 +
 configs/bananapi-m2-pro_defconfig             |  76 +++
 configs/bananapi-m2s_defconfig                |  82 +++
 configs/radxa-zero2_defconfig                 |  77 +++
 configs/wetek-hub_defconfig                   |  70 +++
 configs/wetek-play2_defconfig                 |  70 +++
 doc/board/amlogic/bananapi-cm4io.rst          |   1 +
 doc/board/amlogic/bananapi-m2pro.rst          | 143 +++++
 doc/board/amlogic/bananapi-m2s.rst            | 153 +++++
 doc/board/amlogic/bananapi-m5.rst             |   1 +
 doc/board/amlogic/beelink-gskingx.rst         |   1 +
 doc/board/amlogic/beelink-gtking.rst          |   1 +
 doc/board/amlogic/beelink-gtkingpro.rst       |   1 +
 doc/board/amlogic/index.rst                   |   5 +
 doc/board/amlogic/jethub-j100.rst             |   1 +
 doc/board/amlogic/jethub-j80.rst              |   1 +
 doc/board/amlogic/khadas-vim.rst              |   1 +
 doc/board/amlogic/khadas-vim2.rst             |   1 +
 doc/board/amlogic/khadas-vim3.rst             |   1 +
 doc/board/amlogic/khadas-vim3l.rst            |   1 +
 doc/board/amlogic/libretech-ac.rst            |   1 +
 doc/board/amlogic/libretech-cc.rst            |   1 +
 doc/board/amlogic/nanopi-k2.rst               |   1 +
 doc/board/amlogic/odroid-c2.rst               |   1 +
 doc/board/amlogic/odroid-c4.rst               |   1 +
 doc/board/amlogic/odroid-go-ultra.rst         |   1 +
 doc/board/amlogic/odroid-hc4.rst              |   1 +
 doc/board/amlogic/odroid-n2.rst               |   1 +
 doc/board/amlogic/odroid-n2l.rst              |   1 +
 doc/board/amlogic/p200.rst                    |   1 +
 doc/board/amlogic/p201.rst                    |   1 +
 doc/board/amlogic/q200.rst                    |   1 +
 doc/board/amlogic/radxa-zero.rst              |   1 +
 doc/board/amlogic/radxa-zero2.rst             |  80 +++
 doc/board/amlogic/s400.rst                    |   1 +
 doc/board/amlogic/sei510.rst                  |   1 +
 doc/board/amlogic/sei610.rst                  |   1 +
 doc/board/amlogic/u200.rst                    |   1 +
 doc/board/amlogic/w400.rst                    |   1 +
 doc/board/amlogic/wetek-core2.rst             |   1 +
 doc/board/amlogic/wetek-hub.rst               | 110 ++++
 doc/board/amlogic/wetek-play2.rst             | 115 ++++
 59 files changed, 3129 insertions(+), 428 deletions(-)
 create mode 100644 arch/arm/dts/meson-g12b-a311d-bananapi-m2s.dts
 create mode 100644 arch/arm/dts/meson-g12b-bananapi-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-g12b-bananapi.dtsi
 create mode 100644 arch/arm/dts/meson-g12b-radxa-zero2-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-g12b-radxa-zero2.dts
 create mode 100644 arch/arm/dts/meson-g12b-s922x-bananapi-m2s.dts
 create mode 100644 arch/arm/dts/meson-gxbb-wetek-hub.dts
 create mode 100644 arch/arm/dts/meson-gxbb-wetek-play2.dts
 create mode 100644 arch/arm/dts/meson-gxbb-wetek-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-gxbb-wetek.dtsi
 create mode 100644 arch/arm/dts/meson-sm1-bananapi-m2-pro-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-sm1-bananapi-m2-pro.dts
 create mode 100644 arch/arm/dts/meson-sm1-bananapi.dtsi
 create mode 100644 configs/bananapi-m2-pro_defconfig
 create mode 100644 configs/bananapi-m2s_defconfig
 create mode 100644 configs/radxa-zero2_defconfig
 create mode 100644 configs/wetek-hub_defconfig
 create mode 100644 configs/wetek-play2_defconfig
 create mode 100644 doc/board/amlogic/bananapi-m2pro.rst
 create mode 100644 doc/board/amlogic/bananapi-m2s.rst
 create mode 100644 doc/board/amlogic/radxa-zero2.rst
 create mode 100644 doc/board/amlogic/wetek-hub.rst
 create mode 100644 doc/board/amlogic/wetek-play2.rst

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
