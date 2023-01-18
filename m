Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6924AC54EBE
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 04:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HV5WitaczLzUUL4/S9aQhxLWwmvEtLwYWPVWPe/jiaU=; b=AaW2fe74ASYmxV
	2/BIrcoz645SgacnDiMw638w9Pn+ne5e4OzBNP9/HbqvK1FULSBNTJJY5FvfO74sweIJCGxqJlM9b
	I9ikcTsZtKkM3ZnHWrt/UIkJDxJrmo1SQaA6oK6uUnRlbGem7WzNt39SwosKQ9FyUtW96TrS25QQ/
	s0wXsAtEFTNZkfOG/OiiLxBD92xEymkUoF1LK97LXVyH+ieH53G4D7WeAsaDGeJMkw79cudWcZjFk
	+Ug1SGFAZHnT4rHC49z7pTt9CmF6cvMZfJy0c7lpSjChQnYywM9sdOxixF3tcmN9VlHumF++1p3Xw
	YuxxsfzZVpOCOwrB08rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI0JQ-00Gsrb-Nn; Wed, 18 Jan 2023 04:44:36 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI0JN-00GsrC-4J
	for linux-amlogic@lists.infradead.org; Wed, 18 Jan 2023 04:44:34 +0000
Received: by mail-pg1-x534.google.com with SMTP id d10so23607650pgm.13
        for <linux-amlogic@lists.infradead.org>; Tue, 17 Jan 2023 20:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFhzVIEa73EYEzScGfyUWjcJp3qWD7mJiPqX830aljY=;
        b=o+PrH8E+eTAhlxxrt0ILIjIqe+Grh3PALjeGh05i/Mm174+4E5Eu0M0wplCi7Fwo9J
         7bDKl8McN6v6KEUpUBKcZD5nhOWDlDkjaYQSHvXTCFbTh3KfgCdeW09MnLw5FsyKezhY
         j3YovvnWrWuQF1tOkdjVSkkgQS/+LYDpHiUR1qJWbbSO7W7BXpnsnm9ZzCrgLNH66NA4
         yUyiMf5YDETk0znnmrRDr6gex64tisxRmYiMl6RQ4bYlM0K0xXP6+sQljaHyAyCpwo4W
         f1eQ+ZX5sWc2IQohcK2lBkLZ5NUGgYhbqUi3N1JT1BcZojW4OkglIH/iulYOgRTRXCzP
         XnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFhzVIEa73EYEzScGfyUWjcJp3qWD7mJiPqX830aljY=;
        b=PZTOwcvs9gX6imU3xsNPdMGCfxY9+97kjxZYN8fVVVN4bX3JrfqkFrV7zyuM4r3Rza
         vwvwJhTqkblz0qyjq2vI+a1LG2n5sK4zSKv2gRJjTkkC27tiDFfRdW0OmKQgB6qcJaec
         oZMVOYyab1QwQZZU7NxLbfkSSN8XNXqQtOvvr8hWLNosncZ+DwWWgNtiS637ZD/JhHf0
         p64FlRGsG99fFsLaNPim0BoEgmBEfKRlcCna6b2Mxj73wKerfapCS4mYPotGneHeqIfv
         1qTMkprGNFaNobNA61Y1BsV59c6Tba5qhcLzRHvB92c2aDW0KJ3Qb1EvTAwAsRvuUeG0
         C9Lw==
X-Gm-Message-State: AFqh2koX6GriYJmuJPw9GH905osXk93/8BkhkcQxH8GwSGSSvLtGErC7
	sHFXa2SFbI2bwgJmM9zwswjuJ5tPrKU=
X-Google-Smtp-Source: AMrXdXu5jMJWxnE6jhbDy4QXWyO14BUD7UXdCztv1M1sYZyWCfXWqJT5whAjdGo8pj2YyGCSsaunVA==
X-Received: by 2002:aa7:9557:0:b0:58a:66a8:edf5 with SMTP id w23-20020aa79557000000b0058a66a8edf5mr6373434pfq.3.1674017071142;
        Tue, 17 Jan 2023 20:44:31 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id i1-20020a056a00004100b00581a156b920sm8682770pfk.132.2023.01.17.20.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 20:44:30 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: 
Cc: linux-amlogic@lists.infradead.org,
	Matthias Kaehlcke <mka@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 0/9]	Used onboard HUB to reset and add power to hub
Date: Wed, 18 Jan 2023 04:44:08 +0000
Message-Id: <20230118044418.875-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_204433_208515_8B58ADD6 
X-CRM114-Status: GOOD (  11.37  )
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

v2: Odroid C1 / C2 : usb hub reset working as expected.
    Odroid N2 : dropped usb hub changes, since my board USB hub
		is hitting regression.
    Odroid C4 : Fix the device tree binding and used peer-hub for
		usb2.0 and usb3.0 hub.

v1: Odroid C1 / C2 : were not working as expected.
    Odroid N2 : used single USB 3.0 hub reset.
    Odroid C4 : used single USB 3.0 hub reset.

[0] https://patchwork.kernel.org/project/linux-amlogic/list/?series=707292

Any inputs for these changes ?

Thanks
-Anand

Anand Moon (9):
  dt-bindings: usb: Add device id for Genesys Logic hub controller
  ARM: dts: amlogic: Used onboard usb hub reset to enable usb hub
  arm64: dts: amlogic: Used onboard usb hub reset on odroid c2
  usb: misc: onboard_usb_hub: add Genesys Logic GL852G hub support
  vendor-prefixes: Add VIA Labs, Inc.
  dt-bindings: usb: Add binding for Via lab VL817 hub controller
  arm64: dts: amlogic: Used onboard usb hub reset on odroid c4
  usb: misc: onboard_usb_hub: add VIA LAB VL817 hub support
  arm64: defconfig: Enable USB onboard HUB driver

 .../bindings/usb/genesys,gl850g.yaml          |  1 +
 .../devicetree/bindings/usb/vialab,vl817.yaml | 69 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/arm/boot/dts/meson8b-odroidc1.dts        | 24 +++----
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 26 +++----
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 36 ++++++----
 arch/arm64/configs/defconfig                  |  1 +
 drivers/usb/misc/onboard_usb_hub.c            |  4 ++
 drivers/usb/misc/onboard_usb_hub.h            | 11 +++
 9 files changed, 133 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/vialab,vl817.yaml

-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
