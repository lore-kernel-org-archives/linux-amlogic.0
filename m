Return-Path: <SRS0=F2gE=77=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ADABC433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 13:39:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C8F0207E8
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 13:39:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="izvrSRcW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hIGjX7h4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C8F0207E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0caI//4Ltw+PRaxPZc3+yW76WXzeWKgJaJsH/9cLwzE=; b=izvrSRcWDizJKs
	L8HB8ddGurHeOzL0ok+TVLakw6eCpNkZEWvpQdrXW1kzp5ZI28QxbkNgMpnwvwbwgQtesuVeo7MCs
	UMwSyPoClNjTwixzJSKCE5GtTFspFEOC2N74ZEd1STuHy/YYzDfdvuL8L8fUx0RY4IkMzj1Cq0Kk1
	++FZAEgOICvUxhfE5nYo5Lfy7P6EtiFXuX8EU3fO9XVjQS6mFpnBxKpGe0uyTCKa8axU8jrQyW339
	E5J9hLPMaDemoS+pGfXn6tGcTcY1nV/Xs0dVRIM1bHcxFSQZwPzebty+3kzkRQrgCqhw+T5VvFuB2
	mOKgGjYUNJlHQrCmglRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlukt-000099-Jh; Thu, 18 Jun 2020 13:38:59 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlukK-000888-4S
 for linux-amlogic@lists.infradead.org; Thu, 18 Jun 2020 13:38:26 +0000
Received: by mail-wm1-x344.google.com with SMTP id d128so5693594wmc.1
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Jun 2020 06:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YwhiK4RhjFtcOdjK6HryhHeUuPTC4xHkMOd8pTbbj6k=;
 b=hIGjX7h4Ed1aDRIN8UX7il9ILTJaATXT2LwE1e9A+0Ttl1p93wik5BtfFvtdvm58Iy
 A4VRKDcRzoev7Krg3Cc+TpN1ZPcwQR1ahuc7rE7qJMYKav6VGORhEcNYUNtgiJ8htn0a
 2MjtDZSe4HhO9uH02//oio7CVGAV3FCf3Qr2fipRHVL7M5YXT/O8p774+V3c3iKfm78K
 cQhd1YkMZAzZ3bMtoxWCMFDXp5vtiXza1///NKM30bIftKHZ7s3M7WmMeKGW0cw4z7Wu
 WfsajUcRsp6vCocvj6gm8VHUrrMIhsTSB/hq3epoobz/wf15csEEEudniOiC6pG6A4OP
 fxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YwhiK4RhjFtcOdjK6HryhHeUuPTC4xHkMOd8pTbbj6k=;
 b=BOFjxVX3//0feH2zK+Ufdyj4b9VO1JCl4yiPh5LYRvBiSlgvOUP8I50iNBib1nFJNV
 IWp7UNs75TQ6wwV/YVa/fS4xDzjrP8f1h4KT2Rdo7w2ZEf+TIBJtsyOS5tUr7Q7L+/1V
 l6oDvaSsnNRLIXlR0UqK1EcZ8VpZuNlb9hMtxTa3fhI8whA7l7i2WZ/Z0KKIjbsCki0y
 rL4pyHn46/Jk4Bhfb3F7bRQZy34cyGyzZV11IrWV0pSYviDqw29inR6fQfcIA1OmAel5
 rbrfutMIxgVqhNtGjbt2fBcpRvZTtNVGVKTVoQTFPb4vrAG15AlLLgY/Ofzyh/eHO93V
 4XaA==
X-Gm-Message-State: AOAM530rN2to938UcjrSOxiZ1E7joanI97i/H1nSOjYbjR48/YNsYIns
 cQb6aOEWbxeM/FHbQA6MCooQ2Q==
X-Google-Smtp-Source: ABdhPJxM1M3oFBMHiRXgEOIQ+T9TXk+NQLLWwxlZklKGkaqQUZVzMOTHIzXFfi0wTEV5dRjIqEAhdQ==
X-Received: by 2002:a7b:c8d6:: with SMTP id f22mr4157067wml.188.1592487502207; 
 Thu, 18 Jun 2020 06:38:22 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:9902:c1f0:76c7:9dbc])
 by smtp.gmail.com with ESMTPSA id o82sm3707956wmo.40.2020.06.18.06.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 06:38:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	lee.jones@linaro.org
Subject: [PATCH v4 0/2] mfd: Add support for Khadas Microcontroller
Date: Thu, 18 Jun 2020 15:38:16 +0200
Message-Id: <20200618133818.15857-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_063824_232527_6AD6BEFA 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

Neil Armstrong (2):
  thermal: add support for the MCU controlled FAN on Khadas boards
  arm64: dts: meson-khadas-vim3: add Khadas MCU nodes

 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   |  23 +++
 drivers/thermal/Kconfig                       |  11 ++
 drivers/thermal/Makefile                      |   1 +
 drivers/thermal/khadas_mcu_fan.c              | 174 ++++++++++++++++++
 4 files changed, 209 insertions(+)
 create mode 100644 drivers/thermal/khadas_mcu_fan.c

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
