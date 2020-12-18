Return-Path: <SRS0=hA9j=FW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62DCC4361B
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 08:46:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93648233E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 08:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93648233E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HzsYZSY/KIEi3gmrN609pnWkR/ddXYKaivL+obt9VeY=; b=GhMinXO4c/BVKp4Tg5uHm1E5xH
	xFJ24gKTi9ae1aUK8MGx+KC4swiRDGpka6oRbmHe9LNpG6ZsP3HmPpi01e9Uy/bww01iGEM8aFdR9
	ORYUzF/toJ+3fduQSBHQOsdBbnUoofO05WKkWA6RgYpn5OAzaKKNcVi4oIj9nktU/4a7TlX3PRlKh
	BgM1s/pQI07vgyZP/iWN0Ou5R70FTgD2v1zu9Iv/c6GnxPYW6/FzVEuVjKtp7Zn0SKU0mL7Jw7fcX
	AnWncUV9U/WJtnNh4a3xltSz1248S2dN2Yx5dssmfjEhYdXSSM2iaHqwjBq8RkWXQAFVDC5OA8C+O
	wNxTecUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqBOd-0007Q9-C3; Fri, 18 Dec 2020 08:45:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqBOa-0007P2-Jh
 for linux-amlogic@lists.infradead.org; Fri, 18 Dec 2020 08:45:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id c5so1235019wrp.6
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Dec 2020 00:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/V6kRK58LlnO59vMsDPO/g4AAGgUL+SixCrZ+fN+04I=;
 b=rxY0ggxUCJi6cwQC6fcNfcTMFfxjp2Z83KsoS+2xggH4+uDx3h2MkgIpp9v63RTFgE
 v0cQlesCHZXnmH7vQuueyq8DljfrQcmLB31KTlHfX9FIX6baltbLXynXRcagtGU306Pv
 sVdktK9saCieuo89B0sYxY3oG4C8haoNcOzDbxKskytFO/XyM5LJ7JpagamcFGKVXzAc
 3jeYWZckKZTH0pAHRyLRwWb2V/Yc3E+nytA+ZYfb5puOlDBNBtMxGaRs+4ok/uIyziNS
 X8/j0fjFMc0d17oTOjGVhUsC8Z2rJOGpRyHGK4fXtWURvwLS7XMVt23tVy0soCJHrDOQ
 QyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/V6kRK58LlnO59vMsDPO/g4AAGgUL+SixCrZ+fN+04I=;
 b=T0tk6INICXD9jb1gWc9TFQh+Vga+EJeoB4GbKAJ/QpxiqO6oPO3nwUBkGOgkvjtuhD
 ujDubGkFnxvXGDUsvIZUxcC8xOSIfjue950U6lqLvNVnsp/f9oHbhVQxaXKGAXoGe/V7
 Czp/A2X+IvUtPQPygFCmj7PAkXY+0a28NKgBbaHEzlmjn2a3KDRucv9oYN36BVH8kKrz
 btRsCMGP8yZGOjgyLCmRwa2On2K4uSKl+XifAdckYk/ygZ6etgq1gpa6Iq1XJRfcbfuF
 6YiXPRg2eMQoVKwM2Sc/pHPrxBM1a3e/eku7Oz4N9GR0/S259fqmrNbKMhhDgh1hpKEJ
 9l6g==
X-Gm-Message-State: AOAM530I5Ch9PYYQ3hsq0n4NuQ1OU+4fObkPSH5B8J0kFXP3mUCbgWYb
 bVRJ01akd++MYKz0WtrVU10ko+lEzhyr0w==
X-Google-Smtp-Source: ABdhPJwQcBy6+lByxgvURI9pG6QTOpujlVrqLqbzaGHV68NeJAuYJQjufyqIYZFC9iXrRVJhj/Vayg==
X-Received: by 2002:adf:e94c:: with SMTP id m12mr3126157wrn.141.1608281149270; 
 Fri, 18 Dec 2020 00:45:49 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id o8sm12426767wrm.17.2020.12.18.00.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 00:45:48 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de, u-boot-amlogic@groups.io,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 0/5] board: amlogic: add Beelink GT-King/Pro support
Date: Fri, 18 Dec 2020 08:45:40 +0000
Message-Id: <20201218084545.29135-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_034552_680150_C2B37E47 
X-CRM114-Status: GOOD (  11.01  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support for the Beelink GT-King and GT-King Pro boxes
based on the Amlogic S922X (G12B/W400) SoC. Patches are based on the
u-boot-amlogic-next branch in the custodians tree.

Christian Hewitt (5):
  ARM: dts: import Beelink GT-King/Pro DTs from Linux 5.10
  boards: amlogic: add Beelink S922X board family support
  boards: amlogic: add Beelink GT-King defconfig
  boards: amlogic: add Beelink GT-King Pro defconfig
  boards: amlogic: update documentation for Beelink GT-King/Pro

 arch/arm/dts/Makefile                       |   2 +
 arch/arm/dts/meson-g12b-gtking-pro.dts      | 125 ++++++
 arch/arm/dts/meson-g12b-gtking.dts          | 145 +++++++
 arch/arm/dts/meson-g12b-w400.dtsi           | 425 ++++++++++++++++++++
 board/amlogic/beelink-s922x/MAINTAINERS     |   9 +
 board/amlogic/beelink-s922x/Makefile        |   6 +
 board/amlogic/beelink-s922x/beelink-s922x.c |  54 +++
 configs/beelink-gtking_defconfig            |  71 ++++
 configs/beelink-gtkingpro_defconfig         |  71 ++++
 doc/board/amlogic/beelink-gtking.rst        | 115 ++++++
 doc/board/amlogic/beelink-gtkingpro.rst     | 116 ++++++
 doc/board/amlogic/index.rst                 |   4 +-
 12 files changed, 1142 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/meson-g12b-gtking-pro.dts
 create mode 100644 arch/arm/dts/meson-g12b-gtking.dts
 create mode 100644 arch/arm/dts/meson-g12b-w400.dtsi
 create mode 100644 board/amlogic/beelink-s922x/MAINTAINERS
 create mode 100644 board/amlogic/beelink-s922x/Makefile
 create mode 100644 board/amlogic/beelink-s922x/beelink-s922x.c
 create mode 100644 configs/beelink-gtking_defconfig
 create mode 100644 configs/beelink-gtkingpro_defconfig
 create mode 100644 doc/board/amlogic/beelink-gtking.rst
 create mode 100644 doc/board/amlogic/beelink-gtkingpro.rst

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
