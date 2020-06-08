Return-Path: <SRS0=J82+=7V=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC25C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jun 2020 09:18:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BE3C206C3
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jun 2020 09:18:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bgog1dwa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WFLvXLlj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BE3C206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mL253rxsZfL7WKMkW56yaD8rQkwTSXc6zoKNa9tSsh0=; b=Bgog1dwa9F1v+p
	xHK8IrWzFERnRLKaX2oXx2HM9vE27jMorLjCydNkc08gRP/8c0jppDWVWyYnwYpZylHGg82c9KZlt
	LEpeLv8TyLFcuiGAIhB6Uhk9ub/PuoS7KAcXxnl5XfmnuFnJP7cKTpMo9F4ZTxUWBAJu1nFdkTcKD
	aRdXBlHJZtX7Tnb+qF6wLrrxy0z4mUcjQWmOmyEXHAih5zbDGOOwUlEyvUMfn/KWhSoYtF+N+sh2w
	MDDfY3O8OwxUS/POqpMco5DEIEmPyCj7rZwLQyjc57Ascb9ZqTR3YKaeiRzyYUvcenlWgd6gihamq
	oXkIU3fFEU+zeDhWdvlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiDus-0002Wz-0X; Mon, 08 Jun 2020 09:18:02 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiDub-0002IG-LR
 for linux-amlogic@lists.infradead.org; Mon, 08 Jun 2020 09:17:48 +0000
Received: by mail-wm1-x343.google.com with SMTP id j198so13839024wmj.0
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Jun 2020 02:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Fm1rwtOISvK8gr+7LuMXZ/qPS5BDlq5HB6zyGZJxGw=;
 b=WFLvXLljBM6V1NmppMID2bA5jT2HXO415vnRZxi3guuwvHkqqI1fio60qbVJenv9y1
 SeVA1WczH4p6ZAdZQXh1Kqfl6k2eD44MmBJsiy/QQHs0A6Oet4X/ux6mzTZvhMhESIHd
 mnXyfKz/WS3zE53m3JdhAiDzmwQrkJ9EMMSFSABw3h5/YlY6Bj/Q+cy0PCmrg1FOr0iu
 5FXCkwzBx2wl86k2NvvfFCDG11F5jgjsI8YcmrOibVTw9lP+EOu0WZxM3ufQU83nZ2HR
 eVRdH02+tYD4NTVAp1jMy2RniJaBZOI4NYzfYIsReSQWsrxnK68oAw9MB/H7C1aWGQnI
 5wyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Fm1rwtOISvK8gr+7LuMXZ/qPS5BDlq5HB6zyGZJxGw=;
 b=Z45+8LYKsIVyd4HFP8vADQvjGFgngGTKKfQ0ArOUFdTW800bN7BmGwFAw8FP82MYJX
 zs1+tYaWHOeVfSBDxEcJyWffJD8eLOObbCFicaRg751CpcBxvejDAgxt0MnZqtTVngHQ
 7Lzvr6prrXwnyEfmwxowiPnHPDD1FZA4tOX/EDj6e+/iEGtK2fLE/v80RYdn091KCWpm
 ubys+k3UVmx70g3DRFzqHXQibdsU2kDBlRtVI++X/NH59fBJtgmNBXlWJn6tDgwwS8iV
 JJRHIovQDUHEBQMOWZ0o4bjQz4054GGrOLzScKPpHISAKrNzTd7XjXOHuMzZENVzFbdB
 jwWA==
X-Gm-Message-State: AOAM532ZscCl5VWTNzphCojvleoCdkanc1UOW1DJI3ajPb+pUsnl0KC5
 R4mE/uRPG5rH4w8gi5GrRK3fgQ==
X-Google-Smtp-Source: ABdhPJyCtnfLmNUkx7DrKCb4pwHApmhfPCWmAwzBNq7fE7AzanzmZTIYoP+MO6W7EOpfC/5BKbDo9A==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr16300196wmi.126.1591607862942; 
 Mon, 08 Jun 2020 02:17:42 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:22:5867:d2c6:75f4])
 by smtp.gmail.com with ESMTPSA id
 t7sm22732326wrq.41.2020.06.08.02.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 02:17:42 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, lee.jones@linaro.org, rui.zhang@intel.com,
 daniel.lezcano@linaro.org, amit.kucheria@verdurent.com
Subject: [PATCH v3 0/5] mfd: Add support for Khadas Microcontroller
Date: Mon,  8 Jun 2020 11:17:34 +0200
Message-Id: <20200608091739.2368-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_021745_807650_ACC69766 
X-CRM114-Status: GOOD (  11.77  )
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
Cc: linux-amlogic@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The new Khadas VIM2, VIM3 and Edge boards embeds an on-board microcontroller
connected via I2C.

This Microcontroller is present on the Khadas VIM1, VIM2, VIM3 and Edge
boards.

It has multiple boot control features like password check, power-on
options, power-off control and system FAN control on recent boards.

Thie serie adds :
- the bindings
- the MFD driver
- the Thermal Cooling cell driver
- updates MAINTAINERS
- add support into the Khadas VIM3/VIM3L DT

Changes since v2 at [3]:
- Removed NVMEM driver for separate submission
- fixed MFD driver, header and Kconfig
- fixed Thermal Kconfig
- fixed MAINTAINERS files and path

Changes since RFC v1 at [2]:
- moved hwmon driver to thermal-only
- moved the SM1 thermal nodes in a separate serie
- added the bindings review tag from rob

[1] http://lore.kernel.org/r/20200512093916.19676-1-narmstrong@baylibre.com
[2] http://lore.kernel.org/r/20200421080102.22796-1-narmstrong@baylibre.com
[3] http://lore.kernel.org/r/20200512132613.31507-1-narmstrong@baylibre.com

Neil Armstrong (5):
  dt-bindings: mfd: add Khadas Microcontroller bindings
  mfd: add support for the Khadas System control Microcontroller
  thermal: add support for the MCU controlled FAN on Khadas boards
  MAINTAINERS: add myself as maintainer for Khadas MCU drivers
  arm64: dts: meson-khadas-vim3: add Khadas MCU nodes

 .../devicetree/bindings/mfd/khadas,mcu.yaml   |  44 +++++
 MAINTAINERS                                   |   9 +
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   |  23 +++
 drivers/mfd/Kconfig                           |  21 +++
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/khadas-mcu.c                      | 142 ++++++++++++++
 drivers/thermal/Kconfig                       |  11 ++
 drivers/thermal/Makefile                      |   1 +
 drivers/thermal/khadas_mcu_fan.c              | 174 ++++++++++++++++++
 include/linux/mfd/khadas-mcu.h                |  91 +++++++++
 10 files changed, 517 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
 create mode 100644 drivers/mfd/khadas-mcu.c
 create mode 100644 drivers/thermal/khadas_mcu_fan.c
 create mode 100644 include/linux/mfd/khadas-mcu.h

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
