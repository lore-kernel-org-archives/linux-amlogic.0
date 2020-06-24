Return-Path: <SRS0=3F0F=AF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DB7C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2020 16:15:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A32D820768
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2020 16:15:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lr6atprN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qB6nG+KN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A32D820768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WZHegT7WmOZzwHYiTL+Vu24huZFMxe6+M4GxGU/zzys=; b=lr6atprNfsBh2jMKzScBKrpwjC
	2Ev5CeVNImHuv1eHq1TUKmTzTH6kl5obQTEOmXJdwkOIXlYEoGDdIqryRF1L2mhYrd44FE8AKohQ4
	w+EYXXayq6AIYlTNDHXBsUDIgW/WSBJAJ1b+KXV1PY/xleRDY1Al1cyPD/fTVDUet09jhrAXgmG1O
	STXpmFAraW3MRpSidNqLBSLdmUVxAbysbTsrE+rdrDJqPCx5svzLe7Nnz3RisbXenVwmNfVINL3OH
	93GVE5OTeERsuwD6H0+Al4gxEfKBPUS27CoNuJr00FSKe7GV0nVvjGpU7DKZXHVOLNF4K7RADo3Oq
	U8Tf7pgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo83s-0002pc-1K; Wed, 24 Jun 2020 16:15:44 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo83i-0002mM-Nw
 for linux-amlogic@lists.infradead.org; Wed, 24 Jun 2020 16:15:36 +0000
Received: by mail-wm1-x342.google.com with SMTP id f139so3072394wmf.5
 for <linux-amlogic@lists.infradead.org>; Wed, 24 Jun 2020 09:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7OXl1VWgKNRCb648iCdiM0hRIiCL6AhzBqKEHJfyjiU=;
 b=qB6nG+KNrKtiZam3wMwJAbHJsDTlEi5ywCENbJGiAy/9gUHQzrWo/mlMOiLbh1UY45
 FrhwaE4dGPrFpoPYUGYx0/+QyOMPd9NhTaEp0tECkuEMTB5zenR1AEnWfsuHPecIaS40
 zPG2T3KkeE85K7IkzsqLajVYG6iStaPm93IThbUtJhjIy2Zr98UAhnToy2fIRJAClJRw
 KVQcZijjd4K8ZIU86mrCYHcIKXSAWJOpajk1oWIuxk7mMZEVxYjwD3J6ubhspYyde2yl
 tX0V6GpKBC+i2WCzq9B/yUkQnm+3BcWSMnFxexBGt582WyL6gYuSjcvkZVkqLOC8dZog
 PP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7OXl1VWgKNRCb648iCdiM0hRIiCL6AhzBqKEHJfyjiU=;
 b=Zu1hoKCiNONYTzoRa8aokZp5Gid5aaQU6cjbx/SG81K2WWu4lO1MiXZB2V/fnU6t54
 s2H18S9sUbDVbuzSNL6dYtVW4JUx69A+C/zMrmjS2nuECnt43SDbx+BIOo9bom+VAaBT
 F5KHgS2jhvq/fGEPdP7qOxMgEy2VtJWTjKuTBfYwF/9I4Ke4KW2MR7GnExpDwXDP+64x
 WJrhpMJAAJ+n7sZQ2g7EQ+XZFY49Flm4Z2OqxIn55JKf5h9/7J7N9mFplhhTxwWL7uzR
 lutH41xGlkAsf25Aol8hwOvXSwZkvDt1HdIqBoj+nOB+ADp9kjCQW5JBKwA0B5IEAzlD
 pRLQ==
X-Gm-Message-State: AOAM532ZYmcGywnKND3Xf7ZTZ6T41zotjnn54YJtSb79DSbhcDg5TibJ
 KnVWsQoEtyNzUsXSVqKwpjMouA==
X-Google-Smtp-Source: ABdhPJwfsCqowmEbq8vy1eMaii9xA0WfQR0mUXBz8KRSJZyN8d8xCxvc1FQZ4gDIDuT/R9Xz5DEVdw==
X-Received: by 2002:a1c:2b81:: with SMTP id r123mr2106109wmr.72.1593015331738; 
 Wed, 24 Jun 2020 09:15:31 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:89ac:d9e8:f44c:b137])
 by smtp.gmail.com with ESMTPSA id t15sm8716207wmj.14.2020.06.24.09.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 09:15:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	lee.jones@linaro.org
Subject: [PATCH v5 0/2] *mfd: Add support for Khadas Microcontroller
Date: Wed, 24 Jun 2020 18:15:26 +0200
Message-Id: <20200624161528.12664-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
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
Cc: amit.kucheria@verdurent.com, daniel.lezcano@linaro.org,
 linux-pm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 rui.zhang@intel.com, linux-arm-kernel@lists.infradead.org
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
- the Thermal Cooling cell driver
- add support into the Khadas VIM3/VIM3L DT

Changes since v4 at [5]:
- Removed ctx checks in thermal driver
- Removed the useless khadas_mcu_fan_disable() helper in thermal driver
- Fixed a small indentation issue in thermal driver

Changes since v3 at [4]:
- Removed Applied patches 1, 2 & 4
- Added reviewed-by tags for patch 3 & 5

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
[4] http://lore.kernel.org/r/20200608091739.2368-1-narmstrong@baylibre.com
[5] http://lore.kernel.org/r/20200618133818.15857-1-narmstrong@baylibre.com

Neil Armstrong (2):
  thermal: add support for the MCU controlled FAN on Khadas boards
  arm64: dts: meson-khadas-vim3: add Khadas MCU nodes

 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   |  23 +++
 drivers/thermal/Kconfig                       |  11 ++
 drivers/thermal/Makefile                      |   1 +
 drivers/thermal/khadas_mcu_fan.c              | 162 ++++++++++++++++++
 4 files changed, 197 insertions(+)
 create mode 100644 drivers/thermal/khadas_mcu_fan.c

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
