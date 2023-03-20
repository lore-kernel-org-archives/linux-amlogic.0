Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A1BC7618A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 11:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=udPAYgBvhhFw46NfjVrN4zZmtH7lU87FDtBfshHei3M=; b=eRz9+2UFEWcOFd
	UHLYq/kjhDqs8lrTRUUBLSRSuMielO/8TaVqOl0pssPPhFHv12ogsYpOe31H1uJJGwNg2uSFckV9F
	Kmrz2/CxM3LCPmSW0aSGo4+x0Ks9K2ddi+kjZZXq7yw+5aw7gUTk8ONEG6/cxAjkfNYwv9TuBWA5c
	CSrBNZq/RZER6UvRcK+IxcU3ROcaXROxV3yT34LU7HV7y6IzT5GWrLOx5dn+vrBrbgSvr24RYqIm6
	Y91fwewH4Bo93ei1i0Uh6JIDC4GnFUou+xUfXkg6TTOHdV2Whj0HR+yniqVnBN9fmLvD/4cguOfIU
	Qy6IBfx08+YtzBJrI/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDxx-008rlI-2R;
	Mon, 20 Mar 2023 11:46:17 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDxv-008rjz-10
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 11:46:16 +0000
Received: by mail-wr1-x431.google.com with SMTP id j24so1127289wrd.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 04:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679312772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ClI8K0bVgHtAV00Y4vIPX36r5/Z7oiWGKTY+DpiCK9M=;
        b=UnI2Eg1XpCy5nThneE++AFVeVj9ZmeNYWXWe8HwgQRpXa/pZt2A8jwxcpdlL02BS6v
         HG/undqoNW2mLxmUJ084Ot2af/P9x3SjgJtn1OpG00c6+R9KaAJl4brG9VJX1BeaB+H+
         pnZAlpaOeDn0QpCuJtHJyaa7w4B1DPn1yz3OqCBSyV2XZiYWWrWlqry7qWaei/L8Fcc0
         44Ao19En8q6VWFtKnjiw32DIS/ldXYBF3NvuKt19F6IJm6/ZBbmnQIyy7UYiW5EYHrvI
         6St52Cxdf18mbdrd7sAa6JUfFd5utLAqxGvrxAzI9Cpx1kXwTZSDeb43oVuoTIXfSjmn
         VRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679312772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ClI8K0bVgHtAV00Y4vIPX36r5/Z7oiWGKTY+DpiCK9M=;
        b=63DtHNuDGGynXa1dBDufFLI2OqSmog/25cJELQLJr/o/RkZhNSyb8FHE0Yb/OCS04u
         EMv14hrrd9Mi6ELZzsF428uRrfZgA37Skbgo9aPvDARSZTdfb1QjjsugnsNJcv6VNmZ/
         oThZDVa3m6mOV4IUAiexotuqZbUP6W6Ws1q0MzUgXCPR2/2YPAFXvi7pnK/T/cHsr652
         Jplukra+fLMlGbcC6KltedqsRaXYtNNTPgajiIVkJPoGVgB3Lte+28+PHmZBBWh9Gd+C
         8hX1AtyZVHrvfTAbGz8Xc/EjcGG8F9ot4GN1aand1hKJ3JVmCilqo/fBnH8CckO22F+o
         fJOA==
X-Gm-Message-State: AO0yUKWX1oxImMc9JwSIuw9pJ8ZEF6c/+q98aIBEcjWnIKOOLS6Z02lm
	hNxVK6aHewgdCVgN+kJKgvVcqYmZTmz6+cE0
X-Google-Smtp-Source: AK7set/DGKPE77oh7V7VFC40ZkXGWSfSuqMVymZwqXdNtN7pg7iDsQbfOjgWu0XJGeu2jYndDfEL8g==
X-Received: by 2002:a5d:6989:0:b0:2d0:776:b773 with SMTP id g9-20020a5d6989000000b002d00776b773mr14436532wru.35.1679312772481;
        Mon, 20 Mar 2023 04:46:12 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b002cfe687fc7asm8669836wru.67.2023.03.20.04.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 04:46:12 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 00/33] doc: board: amlogic: spring clean-up of Amlogic docs
Date: Mon, 20 Mar 2023 11:45:36 +0000
Message-Id: <20230320114609.930145-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_044615_350614_654ECBEB 
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

Amlogic documentation spans U-Boot support from 2015-current resulting
in older content being harder to follow. And due to many international
contributors the docs also contain grammar quirks.

This series reworks all board documents to be more consistent. There is
deliberate emphasis on using the amlogic-boot-fip repo for signing tasks
as this is easier for most users to follow. The original/longer signing
process (described as Manual Signing) has been tidied up.

In the index.rst file I've dropped board names from the features table
as this adds considerable width and makes adding new boards a fiddly
process. I've appended the SoC type to the boader header so it shows in
the TOC list to retain a reference between boards and the table.

I've added missing board docs for GS-King-X, BPI-M5, BPI-CM4IO, and we
split ODROID-HC4 into its own document. It originally followed the same
process as the ODROID0-C4, but now has a separate defconfig to enable
SPI-NOR and PCIe SATA support. Users occasionally follow the current
doc and build U-Boot for the C4 which omits this and then struggle to
figure out why SATA boot doesn't work when wiki/forums say it does.

There are other minor cleanups and tweaks for clarity of simply more
up-to-date information for a board or process.

Please review and flag any omissions or issues!

Christian Hewitt (33):
  doc: boards: amlogic: update documentation for index page
  doc: boards: amlogic: update documentation for boot-flow
  doc: boards: amlogic: update documentation for pre-generated-fip's
  doc: boards: amlogic: update documentation for Beelink GT-King
  doc: boards: amlogic: update documentation for Beelink GT-King Pro
  doc: boards: amlogic: update documentation for JetHub J100
  doc: boards: amlogic: update documentation for JetHub J80
  doc: boards: amlogic: update documentation for Khadas VIM
  doc: boards: amlogic: update documentation for Khadas VIM2
  doc: boards: amlogic: update documentation for Khadas VIM3
  doc: boards: amlogic: update documentation for Khadas VIM3L
  doc: boards: amlogic: update documentation for LaFrite
  doc: boards: amlogic: update documentation for LePotato
  doc: boards: amlogic: update documentation for NanoPi-K2
  doc: boards: amlogic: update documentation for ODROID-C2
  doc: boards: amlogic: update documentation for ODROID-C4
  doc: boards: amlogic: update documentation for ODROID GO ULTRA
  doc: boards: amlogic: update documentation for ODROID-N2/N2+
  doc: boards: amlogic: update documentation for ODROID-N2L
  doc: boards: amlogic: update documentation for P200
  doc: boards: amlogic: update documentation for P201
  doc: boards: amlogic: update documentation for Q200
  doc: boards: amlogic: update documentation for Radxa Zero
  doc: boards: amlogic: update documentation for S400
  doc: boards: amlogic: update documentation for SEI510
  doc: boards: amlogic: update documentation for SEI610
  doc: boards: amlogic: update documentation for U200
  doc: boards: amlogic: update documentation for W400
  doc: boards: amlogic: update documentation for WeTek Core2
  doc: boards: amlogic: add documentation for BananaPi CM4IO
  doc: boards: amlogic: add documentation for BananaPi M5
  doc: boards: amlogic: add documentation for GS-King-X
  doc: boards: amlogic: add documentation for ODROID-HC4

 board/amlogic/beelink-s922x/MAINTAINERS |   3 +-
 board/amlogic/u200/MAINTAINERS          |   1 -
 board/amlogic/w400/MAINTAINERS          |   2 +
 doc/board/amlogic/bananapi-cm4io.rst    | 152 ++++++++++++++++++++
 doc/board/amlogic/bananapi-m5.rst       | 141 +++++++++++++++++++
 doc/board/amlogic/beelink-gskingx.rst   | 121 ++++++++++++++++
 doc/board/amlogic/beelink-gtking.rst    | 120 ++++++++--------
 doc/board/amlogic/beelink-gtkingpro.rst | 120 ++++++++--------
 doc/board/amlogic/boot-flow.rst         | 178 ++++++++++++------------
 doc/board/amlogic/index.rst             | 141 +++++++++----------
 doc/board/amlogic/jethub-j100.rst       |  66 ++++-----
 doc/board/amlogic/jethub-j80.rst        |  46 +++---
 doc/board/amlogic/khadas-vim.rst        |  76 +++++-----
 doc/board/amlogic/khadas-vim2.rst       |  76 +++++-----
 doc/board/amlogic/khadas-vim3.rst       | 137 +++++++++---------
 doc/board/amlogic/khadas-vim3l.rst      | 137 +++++++++---------
 doc/board/amlogic/libretech-ac.rst      |  77 +++++-----
 doc/board/amlogic/libretech-cc.rst      | 109 ++++++---------
 doc/board/amlogic/nanopi-k2.rst         |  93 +++++++------
 doc/board/amlogic/odroid-c2.rst         |  54 +++----
 doc/board/amlogic/odroid-c4.rst         | 117 ++++++++--------
 doc/board/amlogic/odroid-go-ultra.rst   |  25 +++-
 doc/board/amlogic/odroid-hc4.rst        | 141 +++++++++++++++++++
 doc/board/amlogic/odroid-n2.rst         | 122 ++++++++--------
 doc/board/amlogic/odroid-n2l.rst        |  33 +++--
 doc/board/amlogic/p200.rst              |  87 +++++++-----
 doc/board/amlogic/p201.rst              |  87 +++++++-----
 doc/board/amlogic/pre-generated-fip.rst | 138 +++++++++++-------
 doc/board/amlogic/q200.rst              |  76 +++++-----
 doc/board/amlogic/radxa-zero.rst        |  45 +++---
 doc/board/amlogic/s400.rst              |  89 ++++++------
 doc/board/amlogic/sei510.rst            | 113 ++++++++-------
 doc/board/amlogic/sei610.rst            | 118 ++++++++--------
 doc/board/amlogic/u200.rst              | 113 ++++++++-------
 doc/board/amlogic/w400.rst              | 115 ++++++++-------
 doc/board/amlogic/wetek-core2.rst       |  83 ++++++-----
 36 files changed, 2042 insertions(+), 1310 deletions(-)
 create mode 100644 doc/board/amlogic/bananapi-cm4io.rst
 create mode 100644 doc/board/amlogic/bananapi-m5.rst
 create mode 100644 doc/board/amlogic/beelink-gskingx.rst
 create mode 100644 doc/board/amlogic/odroid-hc4.rst

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
