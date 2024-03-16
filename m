Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A70C54E60
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2024 13:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0oIPVsKMMO5R4EB2Lbo0P6Nmr1dUsbvRy55Unxz2dI=; b=hohXpTL22Mzf6h
	TUdhEezc5hJA30ypdK9hvdLpmkKC/dJGEp0DewjJbo3ve9m/UFwNgxzbwj1SRUzNXBEaYuDHV69Et
	6tr22397VcEVVRNjLzLFlA1NrwZwQVEZ26CYNDrSfM08dAfdn3gfl6Gj3Um05C6rHb8XoghkR9mmh
	WLb96uUcGFMAYFLuOijakg5sWBCTgab89C9lgmTHRKssaMe5k4GaYUSmsckn9f1/Zoiha4HK6TYD7
	cez5LN98d2FwU9GTxGuAl0BNnqa8mI4pMiOUbKLIwybiisDr+L9ywKYNq2O2WC0dURr+wSd9pf3TV
	1tNR+IgZU17/JK1h2INw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlUUm-00000003DmQ-3O9q;
	Sat, 16 Mar 2024 13:54:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlUUi-00000003DlM-3cOL
	for linux-amlogic@lists.infradead.org;
	Sat, 16 Mar 2024 13:54:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-414025406d7so9214815e9.2
        for <linux-amlogic@lists.infradead.org>; Sat, 16 Mar 2024 06:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710597279; x=1711202079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWhWcKIn0pGCEzwEvQhFIBa9a12cgD1Rhhcfr7musaI=;
        b=meZBy/q/iz8c3xEQrY4gtbwqBZ9MCh5hQdVwQbMQSxTGLXnFm/pDD21pjH5MHMLmNJ
         rYkd9Du+EMZCoJWO1oupNyVoH0VONW9/dqzSZ/V/NaNvknXZa28zYOhNGdMuDpHBcggQ
         ITqT8RAgXpVaiwHCVZrwPHGppqJQhWd7gywcc1VGIFSgOsq6FojO8n8LLaKBVPBChHgQ
         WQCDGqq8WMONkTMQU/2q8q8KQg+Iph8jE/FEuuCBIecZyA3kRY+2skWKQj2LyY1DieJ4
         ijkRNc+nTJDYayg/esOeCcWM9yF1/PYTPmLHxncgvmcZU3Vn99+4vcHyQahEQ41jbsFX
         srnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710597279; x=1711202079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWhWcKIn0pGCEzwEvQhFIBa9a12cgD1Rhhcfr7musaI=;
        b=kLzQhLqSVae6GQ9Vbkhpl0OkwDd6Ty/SvygFHAzbW4fvFLPpp1Yig8o3CG5VBmRrx3
         +w20uxDD6mOIcXJ54ICLDxxkPVWGCtik4KRwvF1xSe1q6BptnMEYXyTE7C/sdtfCTmka
         mWCEkNUSp1z22vuPW//sJjHJYgClAAGk6vjj3WKpgc1AhUcDF5QTimfq05nuMeYAbc7j
         /MPfk4QFRGGhzuYeaKT6sXdt/ORPIrK0CTMtgqZLU4flX9JjND2Iv2xMIdjvov0jTb8Q
         boxLYCGWtGH3Fq6zOqhLCtJ9zY2dHqkVyOwF0wu5mLHuciCHIj8rir7hnqYkecS3EkPX
         D30w==
X-Forwarded-Encrypted: i=1; AJvYcCXQO1rS2sMhUY5g6RS/Jhj1DWpK2IlFX+cHuinj+M3f3+W26rawiMSmXz6eMXryU+0B2ffVtKkhum1WuAkMVxSO7m3am240HdBgmJRqd+7xLr0=
X-Gm-Message-State: AOJu0Yw/8Uqiqkp9ppq4+aYvdEClVL4ebw1p51wtuG/vzpYslRA0PQjL
	kEyMnbNHUdYzNPtNG/NnNAubIZD852UuemCx7h/ycmsAecpRlTYz74liM/qJn7k=
X-Google-Smtp-Source: AGHT+IGzRMqMtu4v9w5YQ8+ov6mybC3kz1cjjQ/1+F4ZvcVqewhFcpXSu7Iz69nZ890Fbbr22AshFw==
X-Received: by 2002:a05:600c:1d18:b0:413:f0d1:5ee2 with SMTP id l24-20020a05600c1d1800b00413f0d15ee2mr5842748wms.12.1710597279625;
        Sat, 16 Mar 2024 06:54:39 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c35c700b0041409fa57c4sm523963wmq.34.2024.03.16.06.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 06:54:39 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 3/3] configs: amlogic: set board family to avoid random MAC on WeTek Hub/Play2
Date: Sat, 16 Mar 2024 13:54:30 +0000
Message-Id: <20240316135430.826898-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240316135430.826898-1-christianshewitt@gmail.com>
References: <20240316135430.826898-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_065440_919176_C1414967 
X-CRM114-Status: UNSURE (   7.45  )
X-CRM114-Notice: Please train this message.
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

Add CONFIG_SYS_BOARD="p200" to the Hub/Play2 board configs to ensure the
factory programmed MAC is correctly read from efuse.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 configs/wetek-hub_defconfig   | 1 +
 configs/wetek-play2_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/wetek-hub_defconfig b/configs/wetek-hub_defconfig
index fd92b041e73..413bbfe9ab7 100644
--- a/configs/wetek-hub_defconfig
+++ b/configs/wetek-hub_defconfig
@@ -1,5 +1,6 @@
 CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
+CONFIG_SYS_BOARD="p200"
 CONFIG_TEXT_BASE=0x01000000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
diff --git a/configs/wetek-play2_defconfig b/configs/wetek-play2_defconfig
index b887419a6ba..dd98929444c 100644
--- a/configs/wetek-play2_defconfig
+++ b/configs/wetek-play2_defconfig
@@ -1,5 +1,6 @@
 CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
+CONFIG_SYS_BOARD="p200"
 CONFIG_TEXT_BASE=0x01000000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
