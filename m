Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B568C76196
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 06:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sNJFbOgqy7XTHusrbcaPv4pqXL+BswJ9+XOA4ygbTMY=; b=H4vfhjZp4n4HVd
	1q44P09l2SzL91kA6no4aA13BgD9H3bEj1MZ4Hbl6zSW0iDZTyMOX9E7XvlB1YYFVyZ3oZSMnNSs1
	C0QTJwujwjtDnIrcOkzgC5WTz4ygOsNa8KNYLWrAScDmGobRhlH4oAQFPPx6iyw/P4eGcPGVnSeXx
	3FqTBBLT+Nw1MDQ20S8OaQ5F/0Oj1sd+c9bn1maBNHxhMckVwCU4XlWmf4lSYUY9IheuPKCVOu5vC
	QTxRmC90CU8luQJXvwbqB1kRN3pjOsOepvbn9UsU6WDEXlQyPNhCSSxJEMNmRXJ+o0gOX0PecOM16
	gcoYyi7vw4bJZ+oo/DVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEqt-0012cj-0b;
	Thu, 23 Mar 2023 06:55:11 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfEqo-0012ba-08
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 06:55:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id i9so19324363wrp.3
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Mar 2023 23:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679554502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7/rfveSi/7MiCJRpDSHMHlrwFV8N+wmoaO+LpWIFpDo=;
        b=VTJdtqhOYJ5ujZXkK5vmcAJe/A0eTKipaP0zuxDhfV4TPIn5NE6wPAd0JaYRu9ZpLB
         vyIJOnH+BT3OB2V8/BTKc8PSGLdy9GKLJ7rf/HubW93h6NfNLsitzNBWS0juWcg/QgKH
         SUvkab9G5UGhagxExqdEaZsjebEVfFllJk1F8OXnPRPFo7K1M23wVlQCzkK19ptur1E0
         gQdVvgII6NH5VY6W28IyipfMYZy4J/Ur4qTT1dtB3yfgUhRVdPPv4bhwzaL6agtkVkdF
         hE/0f7O9ekEGPmoahbKPr3HHHNsW9eT1I5tOKVeNhp7xAg0Nm2oYlyv7kiw3F8xMgSaE
         HHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679554502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/rfveSi/7MiCJRpDSHMHlrwFV8N+wmoaO+LpWIFpDo=;
        b=LlVpgKxxCaJa1YErmYIIzcA0cK2/0B8LrDfxW1j5GdXhkR0dMRtAX5QB7S1SrCfAXd
         sSmCqqqJxSrBONJ2vxIJOFqzo5SZi0SRxmHZaCIiiJbP2/nbC+bH9OGGYdQEz3d1gJS7
         gOceSKaS/Bw4mQ5J0Bfy/ZZaWILKmD8V/jcG+H8rOkIw/VgABV26V/QILFwoCy0E5Dff
         FjRT2gFKy38WAeIAjGxH+z/NTmawAfUftsN3JqB4S3kXXoq2CDb4WTlP7OAXwMUm4TC0
         i6O7dgasjKCawF/THK8zXG11ibNXqK79WHcad4rmSPewVwFlk6ZzhyTBbgFTKcRABpb4
         HZ/A==
X-Gm-Message-State: AAQBX9cHQJzjpuKkx9aPKlwIPOzl22wHT9LagmSNLHNSzoIeIz8SLG+8
	fIe7zL9pvOrZ3jCfzdE5AaM=
X-Google-Smtp-Source: AKy350YMktkN19/RAyD9qa7lqz35dY1IIUjkqQZnhjKgAQAl8wjmWweqH+LVRazb4HlWf0FZkWyabA==
X-Received: by 2002:adf:e70c:0:b0:2cf:ed87:37c9 with SMTP id c12-20020adfe70c000000b002cfed8737c9mr1508151wrm.11.1679554502302;
        Wed, 22 Mar 2023 23:55:02 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d44cf000000b002ce9f0e4a8fsm15520831wrr.84.2023.03.22.23.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 23:55:01 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 00/13] boards: amlogic: add BananaPi/Radxa/WeTek boards
Date: Thu, 23 Mar 2023 06:54:45 +0000
Message-Id: <20230323065458.776029-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_235506_082329_68A6C295 
X-CRM114-Status: GOOD (  10.35  )
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

Christian Hewitt (13):
  docs: boards: amlogic: add bananapi-m5 to u200 maintainer file
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
 doc/board/amlogic/bananapi-m2pro.rst          | 142 +++++
 doc/board/amlogic/bananapi-m2s.rst            | 152 +++++
 doc/board/amlogic/index.rst                   |   5 +
 doc/board/amlogic/radxa-zero2.rst             |  79 +++
 doc/board/amlogic/wetek-hub.rst               | 109 ++++
 doc/board/amlogic/wetek-play2.rst             | 114 ++++
 29 files changed, 3094 insertions(+), 428 deletions(-)
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
