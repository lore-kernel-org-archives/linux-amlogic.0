Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A95BC004D4
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Jan 2023 17:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xm1WYFZ2q3FhqI/sFmys2rXrJP0ddu2CbQkoBDxu68w=; b=u2w9moD2Ebj5fE
	j+0uL3OuuIgIHDx40pQQsw7VTPXLTXmr9+AoELjZ4XsCsiTfDXNNCIEIpu5Q7YHDMTxXje5cPIfjJ
	1C5hg7DT9OdC0Tb706hol/CNB6/V7cwO4QkGjYbzslniwY/Km8+wMgbZup0R/9ZXuI0W0wEeWk7B8
	PU1Kwjf2CkEB5+9KbSAxF+hj6cGj1cDAV1cy6tQxCDMCmQ2ILkW4ZOgfSIvZDrq3RbiMQNFv3+DjA
	esoHTVfxbyluEW31zN7tRpjpkX7De6TvyrDNpgBbkmsdx3hZquevD6cc4fP5BopRtwHrELaThEIZM
	tA81xH3hBKOjUUSx1+oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI6r-00EDut-TH; Sat, 21 Jan 2023 17:56:57 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI6p-00EDuB-OE
	for linux-amlogic@lists.infradead.org; Sat, 21 Jan 2023 17:56:57 +0000
Received: by mail-pj1-x1033.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so11042566pjq.0
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Jan 2023 09:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0OgLMQLw/vl2fpwIx0I5HsERV3pzPq6vdBFIem/au2Q=;
        b=m7ZPSkJWOb/SF/ncOXuPuvKP/FO4JUMQmLQr2GbpD6vqWAOWkj97E0HiIMjEzuGQAM
         gEdd9NjsvBzRyGhnEp8umBjug9bzaLXYFDq3W1vTOjv2YauLrYv2gt7m9nMYPq2NmVqB
         82oB5m3McMHedpRVf+MyUp6zkFu73jRSn3/aYTVEDHrWdVh/GRASs5R3VqlZ7UcXgwDU
         7+r5i5LYz/s7eAepOPJ7BEsOdJeHWC4n2IA5qTPuA/iPwWEEzzTW1ZAcfgQt/P+//8kM
         Xm+shB/DMxLNuhDbbOX3LZtFCEcoGTkiH2np0+MGjOB150tG2nLDWp5Tn45CQrOA0Om+
         H4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0OgLMQLw/vl2fpwIx0I5HsERV3pzPq6vdBFIem/au2Q=;
        b=blbQ7PtJ1Mdn2kbUGKn7FcOej2uujXrH2Kx9XCQhGq3oo7le8zk60iino7UZwo9jEH
         0lJmAHFT+7AiJqK/6IFOZ0lLyJSQFln8W+/nXQj9LuLaxjvoeHulq9Y5pHekGpZwndVF
         qhnKpeW53dflGFJKWG9xa8t33VROoqC6jIVuc+sbCPUoHZO0IXE795T0pkV7BDtDyMUY
         I8U8XlI0Gi5A3ANHaZVnH/TqGxBHZbzZMm0aMIERhHk+/uE8alPSk7SHj/E6fleD44YW
         LpphCvtTtmt/bkIpzEIS1+mg8bzYGiHXNrwKLXdozthNw0Rqdcwec2roRws6zqgSPFBD
         YA4Q==
X-Gm-Message-State: AFqh2krAq0EKcMz/uSVQ+CLG4hWmsn2LqRF+m5kI0tbWa93DNJCCP7Pq
	ONA7dkdO+zxp2grAp0zzSoTKuJoMPEs=
X-Google-Smtp-Source: AMrXdXsbHYuVCyKS/MZPYp1MFg2v1tj+0TS5HkClI1Tvl89/Dt3goh939aVLw1t1bRJhofNVTG6ShA==
X-Received: by 2002:a05:6a20:a802:b0:b8:b02d:9415 with SMTP id cb2-20020a056a20a80200b000b8b02d9415mr15780840pzb.12.1674323812159;
        Sat, 21 Jan 2023 09:56:52 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id r3-20020a632b03000000b00478e14e6e76sm24857374pgr.32.2023.01.21.09.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 09:56:51 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: 
Cc: linux-amlogic@lists.infradead.org,
	Matthias Kaehlcke <mka@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v3 0/9] Used onboard HUB to reset and add power to hub
Date: Sat, 21 Jan 2023 17:56:28 +0000
Message-Id: <20230121175639.12818-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_095655_847897_70B7C3E0 
X-CRM114-Status: GOOD (  12.11  )
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

Amlogic board use gpio-hog to reset the USB hub.
so using onboard hub we could reset the USB hub and
also enable power to the USB hub.
v3: Fix some small changes in $subject
    address the input from Neil
    fix the vialab device tree binding as per Krzysztof inputs.

v2: Odroid C1 / C2 : usb hub reset working as expected.
    Odroid N2 : dropped usb hub changes, since my board USB hub
                is hitting regression.
    Odroid C4 : Fix the device tree binding and used peer-hub for
                usb2.0 and usb3.0 hub.
[1] https://lore.kernel.org/all/20230118044418.875-10-linux.amoon@gmail.com

v1: Odroid C1 / C2 : were not working as expected.
    Odroid N2 : used single USB 3.0 hub reset.
    Odroid C4 : used single USB 3.0 hub reset.

[0] https://patchwork.kernel.org/project/linux-amlogic/list/?series=707292

Any inputs for these changes ?

Thanks
-Anand

Anand Moon (9):
  dt-bindings: usb: Add device id for Genesys Logic hub controller
  ARM: dts: amlogic: Used onboard usb hub reset on odroid c1
  arm64: dts: amlogic: Used onboard usb hub reset on odroid c2
  usb: misc: onboard_usb_hub: add Genesys Logic GL852G hub support
  vendor-prefixes: Add VIA Labs, Inc.
  dt-bindings: usb: Add Via lab VL817 hub
  arm64: dts: amlogic: Used onboard usb hub reset on odroid c4
  usb: misc: onboard_usb_hub: add VIA LAB VL817 hub support
  arm64: defconfig: Enable USB onboard HUB driver

 .../bindings/usb/genesys,gl850g.yaml          |  1 +
 .../devicetree/bindings/usb/vialab,vl817.yaml | 71 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/arm/boot/dts/meson8b-odroidc1.dts        | 23 +++---
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 25 +++----
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 33 +++++----
 arch/arm64/configs/defconfig                  |  1 +
 drivers/usb/misc/onboard_usb_hub.c            |  4 ++
 drivers/usb/misc/onboard_usb_hub.h            | 11 +++
 9 files changed, 131 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/vialab,vl817.yaml

-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
