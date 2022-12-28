Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85775C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 10:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nD26w8VEugkGsDqCgxGtUfxAnNpjRszQeC9CynYzl3M=; b=u9Mj07zhdsINl6
	V80HipfsP8/ossiOPm23Odd3q66jMyRL4hg0U3zsNZvuWhnDStJhISkmGkDTGdug4a53db4jP6JJ3
	Pa2LHurQWdgBLqowGv1R5ns2eUW1WYSGa0o1MlTCOrL8YIhUam0kYxBX4zxNYoMAOygfBfrbONpFt
	rSd+AVOklc4q+dQvOfswz4nawUZ0FnL3xHc3s1y10gK7+NNiIAcvo/WI9xnCr9Wbhz4eIsv2PBwyx
	texRTjDOhmaU4AMmoaeg3UXXRnPTQ1pRv2rugjp4ST50rrQ7iYuHZeeSeSBLy6G2tMdHceQj0jYg4
	G1MHvLuPdSXEyuTlTyKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATHh-003ufW-0z; Wed, 28 Dec 2022 10:03:41 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATHd-003uc2-Mf
	for linux-amlogic@lists.infradead.org; Wed, 28 Dec 2022 10:03:39 +0000
Received: by mail-pl1-x635.google.com with SMTP id d15so15637465pls.6
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Dec 2022 02:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TCJ4oCFM6etUitvnuMhE/MZrekSO6auBgOfdl6Fa2Ds=;
        b=F2bXwcE8UZXHZ3B9CZ3n9Hl9sDSVJMv9vp5bt1TtfWEu1bAHyyyG+Arv7KNoxrhqSd
         5LDaBhTkduHKGMreeTBqRXHRmiBcrNVKL0aC2ABsXi9bRo7Jy9g7fsCQL0H9LBr1zgJm
         kj8IB9cfSAOj9cY74I1Ce2UxXhSOw7TgdMnBkLsRAnsiQrk7JPVrhDPceuXf73E+xB5d
         X76EYHfnEn6fU9efcgpJ0clxXFEMUyXvkSdeAa76oS3X6IgSDPXq1rp6yR84JDGPIGt8
         bwEGjHeBR4A8AG/2EpTFWO3lR0ykifbCvAD16MgYtG4i9LzNWF1BJI2D73YVPrPmE0j0
         BXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCJ4oCFM6etUitvnuMhE/MZrekSO6auBgOfdl6Fa2Ds=;
        b=F6M7S4Agvk8N0Smc6Lt6KmTEVqR3H+DdZrHH+e2nZqRXVNusjuntkYuoaq6uEqTnpw
         gDUCOYmWH5wj+EST1aiT0qM0GRcfX06v+dXNqDJDpL+jQhOdLSnb4on2tHa7257tSVh2
         6QrIJA7YkfeBwXSQEff1htGPxwwhYnKX8HHcNtX8FMiYzM4E4/yHS9mOPtoDAebVz3GS
         EuRTmwE+RlqRABySZhukFF89LYc4228I3JurIAaxVVq8kDTh2VatbZ+QBFRrNruOENMI
         2VMG8HYTzjkb4my01kxSo9Z7l/3iiwaMnGauWzIc+XX08Bz64CcnVT/gV5NNYPYt4YBG
         9FNQ==
X-Gm-Message-State: AFqh2kqQ+2lVD7Qlq4elxiUoC9dUwyBXRvDmWjOk8BgtxS08fXcorfJx
	zQknOheGgdXqULP8RrMaKC/bbex0pKTUXg==
X-Google-Smtp-Source: AMrXdXv4vhS89A1pYJhjhPC53GHeGbBpZykDeIKQ1OdtdE1nymI3CGO3grzLZKmuXhHan1nsXpabRQ==
X-Received: by 2002:a17:902:d546:b0:192:607b:f69b with SMTP id z6-20020a170902d54600b00192607bf69bmr18296919plf.28.1672221813609;
        Wed, 28 Dec 2022 02:03:33 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.26])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019277df45a6sm5794915plb.53.2022.12.28.02.03.32
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 02:03:33 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: 
Cc: linux-amlogic@lists.infradead.org
Subject: [PATCH v1 00/11] Used onboard HUB to reset and add power to hub
Date: Wed, 28 Dec 2022 10:03:09 +0000
Message-Id: <20221228100321.15949-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_020337_809238_88D4B398 
X-CRM114-Status: GOOD (  10.67  )
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

On Odroid C1, it seem this feature is not working as expected
so just included the patch for testing. Maybe we can drop this.

$ lsusb -t
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M

On Odroid C2, C4, N2 is seem to work as expected.

$ lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M

Any inputs?

Thanks
-Anand

Anand Moon (11):
  dt-bindings: usb: Add device id for Genesys Logic hub controller
  ARM: dts: amlogic: Used onboard usb hub reset to enable usb hub
  arm64: dts: amlogic: Used onboard usb hub reset on odroid c2
  arm64: dts: amlogic: Used onboard usb hub reset on odroid n2
  usb: misc: onboard_usb_hub: add Genesys Logic GL852G-OHG hub support
  usb: misc: onboard_usb_hub: add Genesys Logic GL3523-QFN76 hub support
  vendor-prefixes: Add VIA Labs, Inc.
  dt-bindings: usb: Add binding for Via lab VL817Q7 hub controller
  arm64: dts: meson-sm1-odroid-c4: Used onboard usb hub reset on odroid
    c4
  usb: misc: onboard_usb_hub: add VIA LAB VL817Q7 hub support
  arm64: defconfig: Enable USB onboard HUB driver

 .../bindings/usb/genesys,gl850g.yaml          |  2 +
 .../bindings/usb/vialab,vl817q7.yaml          | 47 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/arm/boot/dts/meson8b-odroidc1.dts        | 40 +++++++++++-----
 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 26 +++++-----
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 29 ++++++------
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 25 +++++-----
 arch/arm64/configs/defconfig                  |  1 +
 drivers/usb/misc/onboard_usb_hub.c            |  4 ++
 drivers/usb/misc/onboard_usb_hub.h            |  7 +++
 10 files changed, 130 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml

-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
