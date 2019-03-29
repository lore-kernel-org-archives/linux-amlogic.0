Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D4EC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 21:30:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4273218A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 21:30:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g4zZDznl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VFIQPJTE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4273218A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FCeL1yAviIlX7z/5v4LLHcY25Sj41bIPRkBGrNJ52tE=; b=g4zZDznlvQ5XVX
	IWSzNS4UEYbC0P8+QHYtWlD0q04zlgxzKJVYLmu9vxPeff181AWKVZ3z2IhmXqiOlx3fg/NSlPlgB
	9NLwFfEypu0vaFmauMeq4at44mHnpE9IDMjlZ19+C/i09NQP5YX+ghWu6NRgGms3yRurCOxOx2tiG
	EAIPZD1nK6NC1yK554w04Ks6qdq9BucPNElQmOxLixLyMEnMgfP/Ua3lTxKvJY4Hb6Gkv4RvH9jhW
	mKkidQ6NdhrrCkfek0zM4XH/UAMh1KrFlP7BeiYig4Nv3FU1rrHzcyGWXxwdHbbLIHjy50qNZI0Ya
	Gxz7/a0SizZONqr52nxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9z4Y-0000a2-J7; Fri, 29 Mar 2019 21:29:58 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9z4V-0000Z3-UA
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 21:29:57 +0000
Received: by mail-pl1-x642.google.com with SMTP id g37so1599041plb.5
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 14:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=BMsXAGcc/9FCfTsRa+qCLpnmf2rTXlcLmIA0LXDd5Nk=;
 b=VFIQPJTEl/nBrspo1elKLXLPDPZUssaCPSM7Y7VDdwacFD2Zi/91Bk7QHP/qrLvSay
 2uQ/O7XlvBJkH8r8O6H1BBkXM/lyclXQlX/62dJ37pEBhJGJLRdLZI2IO0M1NCoSYtu6
 ChfoNcxsBJd141ny7NPt1LjT9wdBMf6ZGp5Q10XZqkLaUO5c5w28SPVLqzdhA9bx9J2f
 mvz2Vcr/VRg1UGpkade6jv5t872vy3SwDBTQNyT0R5kHogkGT/68VngQYIM3pBbGkbHU
 iw94kyovfJoEcB8iKlYSjqLNF8AK91TVxmvlVUqxNL8vJreWx1tvQOQvXfX5QoJL/Svt
 nlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=BMsXAGcc/9FCfTsRa+qCLpnmf2rTXlcLmIA0LXDd5Nk=;
 b=WuKkJRMuAPoGL74BHsD2s79dnlx6gIM5/zVnqrmXPY0QiStFfZGa6Qm8hw4UZonncY
 87xqCycXlFU26i0ezKps1dz5LcCaujmdbiTfc53PHV/hK9ukENWXp4+yIRR73jpgMUIf
 mgDP49aL4cKSvxRYm2pJGZkZlAourDNPXhvCh0Q3cW4+AmPcuUeqxSRQePnJ5uGcbM/6
 ToBQarg2sBbqT7UEjYAemAuCfrrs9uC2ZvcqcB9F1ZVCK9Y4bn+BOQyJAXKy8SJ3Lqc9
 BMVcaZqJ+Da7ITZc2g6HIA6AL9XIs0tPTSZnBiEBMJxycHd2aptnxp6ybKcrLO/SVsH7
 mDgg==
X-Gm-Message-State: APjAAAVz+2YQcyIcoHYltJoOqjaypWFFPMVeoqjjjj0ct/OkJOsB6Kak
 34myg6mQPpEGDoMyElW9BNqcLA==
X-Google-Smtp-Source: APXvYqwSFYLrarJrp+sShDdvR0qD0b7fSkwwaxyiv2pSNBuMUsrqaIcVo/7JA8iOg0z5II+gFvRzEA==
X-Received: by 2002:a17:902:6907:: with SMTP id
 j7mr48697266plk.32.1553894995359; 
 Fri, 29 Mar 2019 14:29:55 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 k83sm10207570pfj.178.2019.03.29.14.29.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2019 14:29:54 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] arm64: dts: Amlogic updates for v5.2
Date: Fri, 29 Mar 2019 14:29:54 -0700
Message-ID: <7hr2apv06l.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_142955_971070_FF889FC3 
X-CRM114-Status: GOOD (  10.17  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64

for you to fetch changes up to e2cffeb398f4830b004774444809ee256b9bc653:

  arm64: dts: meson-g12a: Add CMA reserved memory (2019-03-29 14:19:42 -0700)

----------------------------------------------------------------
arm64: dts: Amlogic updates for v5.2

Highlights
- new board: SEI Robotics 510, based on S905X2 SoC (G12A)
- enable more periphearls for S905X2 based boards

----------------------------------------------------------------
Chuanhong Guo (1):
      arm64: dts: meson-gxl-s905d-phicomm-n1: add status LED

Guillaume La Roque (1):
      arm64: dts: meson-g12a-x96-max: add regulators

Jerome Brunet (6):
      arm64: dts: meson: g12a: add secure monitor
      arm64: dts: meson: g12a: add efuse
      arm64: dts: meson: g12a: add pinctrl support controllers
      arm64: dts: meson: g12a: add uart_ao_a pinctrl
      arm64: dts: meson: g12a: add reset controller
      arm64: dts: meson-g12a-sei510: add regulators

Neil Armstrong (11):
      vendor-prefixes: Add prefix for Shenzhen SEI Robotics Co., Ltd
      arm64: dts: Add SEI Robotics SEI510 Board
      arm64: dts: meson-g12a: Add AO Secure node
      arm64: dts: meson-gxm-nexbox-a1: Enable USB
      arm64: dts: meson: g12a: Add AO Clock + Reset Controller support
      arm64: dts: meson: g12a: Add UART A, B & C nodes and pins
      arm64: dts: meson-g12a-u200: add uart_AO pinctrl
      arm64: dts: meson-g12a-sei510: add uart_AO pinctrl
      arm64: dts: meson-g12a-x96-max: add uart_AO pinctrl
      arm64: dts: meson-g12a-x96-max: Enable BT Module
      arm64: dts: meson-g12a: Add CMA reserved memory

 Documentation/devicetree/bindings/arm/amlogic.txt          |   1 +
 Documentation/devicetree/bindings/vendor-prefixes.txt      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile                       |   1 +
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts          |  97 ++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts            |   2 +
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts         |  81 ++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi                | 183 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts |  10 +++++
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts        |   4 ++
 9 files changed, 380 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
