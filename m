Return-Path: <SRS0=nSpp=E5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25629C56202
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 14:52:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61A2420782
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 14:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P0R1eQtD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PTtXCtIn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61A2420782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=//mKKa/z9W4Jli0hQgWieR0mFZcg/HRcAStYxjLNeHg=; b=P0R1eQtDZvlsSsU71HxmJ11n1r
	wlld/4ItePhzixjr7xCPOMs02G9Hi6CWx9KTX79RSXkhADJENzsS5S+7gSE9p8bF0geODzqhVZ6RP
	UD55pgwvYTYNEVNZ97EThc4Cp+9RI/FTQ1AKHrnmSrVFdu2mvpjckQzm3FTUhGfAsjO9bOno8ST88
	TipIpTqPuRwH1MfTWSTAuGcXJGWDeLkjZPYL613rfqOzSLsouY73ViHiMWiPNL6foHV2jFmQykhSh
	1AKQl0eUtsUvyPVjtkr+OOHWGoMTWjGfYu3PdHbKvv29w1b056/PDYG5HTXUc/SNN9XtGtb9jPlAU
	+Oq0Sc/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khDCM-0002Ic-Ao; Mon, 23 Nov 2020 14:52:10 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khDCE-0002FG-TL
 for linux-amlogic@lists.infradead.org; Mon, 23 Nov 2020 14:52:05 +0000
Received: by mail-wr1-x442.google.com with SMTP id 64so5458944wra.11
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Nov 2020 06:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wmeZr0XUHe7lfG5n9TDdoFp85I1L2X2BF+Rr5NpXUP0=;
 b=PTtXCtInvsZCorNwU1hUoH+yzXlYZWe3dndOPDBMxQeAGubOLYI9/jJrTECqDaBBYD
 2EEVPiL9WsTH4/0zd5uAZqNwsH8CPkGIp6JiS9uPYSWICQEJDzuyKdvGD4tM1cJgPj1Q
 BepszEQbdCP4tytl+FHyIY1zzhxRR6KLBnhwZCd6iT/hAUIPhUhMXRkBOUHjFDzlp2S2
 zRvnnqyF3n5wRfrha8MIX0mMnP8ZussA2cba9dQYoxT9+FcmdbW5REOsIwDGscDvmvji
 VJLEoZftpcFHTXCaY9u43QqHhDFDXzJMsC2mQbmW8Pt+t3ZEkVnEftLk7KinyIEOX/uj
 XPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wmeZr0XUHe7lfG5n9TDdoFp85I1L2X2BF+Rr5NpXUP0=;
 b=dZMFCdlrwt2TdWwwTMo8DXk75hcNjbzPVi+qjH9DEJBMM0Rcrrwx/nhm7j7pUPOGyh
 jrtsUIATfOLOvm/RefwpTz7bR8QvdfZXN9E5kF7GWNqYdFV4di5Aq+6MjmHt1Qwhx9Vr
 PXWVqlrE2ABqJdf3LnJggjXwbIhwzQXTEAcay4IvHVhHMuE2s3hfJzLCNEZpNblzZsZD
 FgHxYcCyEVZuS2Fq+GNDLVeZEvOtlTSwT2uAKpg+lrIrPkAW1tPQTMhsG1Jg03MUTx7M
 qkqn3XaXx9DWj8mON/BGp1EbntV2703GtrpW+HN7Ve6GifiIOe4yB4hUxy4aTtXgnhws
 QAlw==
X-Gm-Message-State: AOAM533e1hfYZY+p5e2T4F6Ay5WVoS1ze84FgRr8acOkU1WO09F5lL8q
 n+mMVkBbaXV6Ch2z0r3E9XBV0w==
X-Google-Smtp-Source: ABdhPJx0Nsh3eOEdDLcNLqFyxmZXyWn1bfPylX82bWOzB76sFCdqMGPW+t9dmteFWCUkRzne/kyjmg==
X-Received: by 2002:adf:e912:: with SMTP id f18mr31112308wrm.79.1606143121122; 
 Mon, 23 Nov 2020 06:52:01 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:9541:d2fd:3a68:67ae])
 by smtp.gmail.com with ESMTPSA id 9sm14225175wmo.34.2020.11.23.06.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 06:52:00 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: vkoul@kernel.org,
	kishon@ti.com
Subject: [PATCH 0/2] phy: amlogic: Add support for the G12A Analog MIPI D-PHY
Date: Mon, 23 Nov 2020 15:51:55 +0100
Message-Id: <20201123145157.300456-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_095202_986022_1CD0FC48 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A SoCs embeds an Analog MIPI D-PHY to communicate with DSI
panels, this adds the bindings.
    
This Analog D-PHY works with a separate Digital MIPI D-PHY.

This serie adds the Bindings and the PHY driver.

Neil Armstrong (2):
  dt-bindings: phy: add Amlogic G12A Analog MIPI D-PHY bindings
  phy: amlogic: Add G12A Analog MIPI D-PHY driver

 .../phy/amlogic,g12a-mipi-dphy-analog.yaml    |  40 ++++
 drivers/phy/amlogic/Kconfig                   |  12 ++
 drivers/phy/amlogic/Makefile                  |   1 +
 .../amlogic/phy-meson-g12a-mipi-dphy-analog.c | 177 ++++++++++++++++++
 4 files changed, 230 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
 create mode 100644 drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
