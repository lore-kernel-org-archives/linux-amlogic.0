Return-Path: <SRS0=hA9j=FW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9519C2BBD4
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 08:46:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C361233E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 08:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C361233E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0Sz4SALa3Xf+//Iq7KFVKwVTk4chJfL/yKPVh1VXJU=; b=bfaMUOjB6z2wvZfC6pI5Dr/Q1C
	tfD/VTbcS1OHXEEKuoUixcpZcOsL0oNItXA8L7ZdFwO9JXHpu8bAHBf7/stJc0NxVFDFSNKYJ4JIU
	Y7U3O6ACCFXo1gDnvRgBAi46+FHdsslHV0tUrWkmtteLkEdIBNFWzBlKTUuMfJ0UC8RGRPNTDAjb3
	ouYGbZDItdLpot0eJEtPWlXAPObTUT5kCL/XYxX2PTL4kZeODtA+s3tmaHCecwGWBralUCMtqrltn
	hgF7veMgOFaR4JEM+JtiWUSmUdYXHuIUmeMDl29D04O7r0gIbpkbbrURmdgOhc13cUDQTcQ3bxOtr
	xTrDAAiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqBOh-0007Rx-6O; Fri, 18 Dec 2020 08:45:59 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqBOf-0007Ql-Ad
 for linux-amlogic@lists.infradead.org; Fri, 18 Dec 2020 08:45:58 +0000
Received: by mail-wr1-x434.google.com with SMTP id d26so1211235wrb.12
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Dec 2020 00:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=k4a9d42Ugfhu8lYfBL9bKXO26rwaj2hx/JHFij18RrU=;
 b=cUYVGDBv9X/tu64a2ATpz2xE7pXNVV+pLEA3sKGVIywmnq1MxK/5z8uquliFz2X0ix
 ku8Z7EwbtcYxN7+v3faeI6MxsUWpJXPj4ppwHobRpjgLeVnkXFnWsPqPs3BuL9pxr8EK
 2ADs0swsN0KmrOmsLR54qzXXHBO0osbvMiHkVYj1PV7jDZIWdHc8cUHKcAph+qQRGmYN
 jdCPA+FP79jurWVVEUSF1wLCaYlRt64eBTzOcm91WMjPqR8de6QzytC9/x2tV/LUf0Iv
 w8gqSKtck+88f3Stq0tbzfG92rZACkkM9usfelAwBvqwrgK3ZTmvemf0DMLOwi53xige
 7TQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=k4a9d42Ugfhu8lYfBL9bKXO26rwaj2hx/JHFij18RrU=;
 b=GBA2bl3E4jUqbgYXgUDJA985WPJz03hO6JaKXb/XHQ+CJylRuTZJyacg0Ikv450daN
 EUTtypUzf4uME+JP6/WI9UCKtakW7gyOjts/7kw0qKjwkaWwgFaez5huRelS+aJTVEGh
 QFL4oiksT/gpajxfIxTqtVsGIgCa8TqmVsQ5I/e/zL7ID91pijpZLYfunAvjIztC8pc3
 xn6b7o2gnHvDcnAo4WB8UZCTTNetdG1G3f3jOMoAiKiJ6SW1sWeo80OZkBohS1O8gfFi
 NYkAnBHmgXeWveBl2iEqzEPz16oYIrr5pHyD+nznw9hTOtUP94f4JmngYIasZ5E0fKp6
 WrXQ==
X-Gm-Message-State: AOAM530A3I74w0TQcXLaDN3JRGX+5/8srlDuHRwntzFpUsSFXetPv6XD
 SIs1V0seuwkVfoVLu1FNhdCpA5Asa97mzA==
X-Google-Smtp-Source: ABdhPJzOyoexMH1nE23QAOj4ZLBazbjZKcd/j9JiDA6TBPXVVpoAp5/SS3dQZwXwC5Vxq4cfWFjiGg==
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr3127396wrr.61.1608281156135; 
 Fri, 18 Dec 2020 00:45:56 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id o8sm12426767wrm.17.2020.12.18.00.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 00:45:55 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de, u-boot-amlogic@groups.io,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 4/5] boards: amlogic: add Beelink GT-King Pro defconfig
Date: Fri, 18 Dec 2020 08:45:44 +0000
Message-Id: <20201218084545.29135-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201218084545.29135-1-christianshewitt@gmail.com>
References: <20201218084545.29135-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_034557_407219_3967E3BE 
X-CRM114-Status: GOOD (  12.45  )
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

Add a defconfig for the Beelink GT-King Pro Android STB, which is based
on the Amlogic W400 reference design.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 configs/beelink-gtkingpro_defconfig | 71 +++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 configs/beelink-gtkingpro_defconfig

diff --git a/configs/beelink-gtkingpro_defconfig b/configs/beelink-gtkingpro_defconfig
new file mode 100644
index 0000000000..569031600a
--- /dev/null
+++ b/configs/beelink-gtkingpro_defconfig
@@ -0,0 +1,71 @@
+CONFIG_ARM=y
+CONFIG_SYS_BOARD="beelink-s922x"
+CONFIG_ARCH_MESON=y
+CONFIG_SYS_TEXT_BASE=0x01000000
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SIZE=0x2000
+CONFIG_DM_GPIO=y
+CONFIG_MESON_G12A=y
+CONFIG_DEBUG_UART_BASE=0xff803000
+CONFIG_DEBUG_UART_CLOCK=24000000
+CONFIG_IDENT_STRING=" beelink"
+CONFIG_DEFAULT_DEVICE_TREE="meson-g12b-gtking-pro"
+CONFIG_DEBUG_UART=y
+CONFIG_OF_BOARD_SETUP=y
+CONFIG_MISC_INIT_R=y
+# CONFIG_DISPLAY_CPUINFO is not set
+# CONFIG_CMD_BDI is not set
+# CONFIG_CMD_IMI is not set
+CONFIG_CMD_GPIO=y
+# CONFIG_CMD_LOADS is not set
+CONFIG_CMD_MMC=y
+CONFIG_CMD_SF_TEST=y
+CONFIG_CMD_SPI=y
+CONFIG_CMD_USB=y
+CONFIG_CMD_USB_MASS_STORAGE=y
+# CONFIG_CMD_SETEXPR is not set
+CONFIG_CMD_REGULATOR=y
+CONFIG_OF_CONTROL=y
+CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+CONFIG_NET_RANDOM_ETHADDR=y
+CONFIG_DM_MMC=y
+CONFIG_MMC_MESON_GX=y
+CONFIG_MTD=y
+CONFIG_DM_MTD=y
+CONFIG_PHY_REALTEK=y
+CONFIG_DM_ETH=y
+CONFIG_ETH_DESIGNWARE=y
+CONFIG_MESON_G12A_USB_PHY=y
+CONFIG_PINCTRL=y
+CONFIG_PINCTRL_MESON_G12A=y
+CONFIG_POWER_DOMAIN=y
+CONFIG_MESON_EE_POWER_DOMAIN=y
+CONFIG_DM_REGULATOR=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_DM_RESET=y
+CONFIG_DEBUG_UART_ANNOUNCE=y
+CONFIG_DEBUG_UART_SKIP_INIT=y
+CONFIG_MESON_SERIAL=y
+CONFIG_USB=y
+CONFIG_DM_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_DWC3=y
+CONFIG_USB_DWC3=y
+# CONFIG_USB_DWC3_GADGET is not set
+CONFIG_USB_DWC3_MESON_G12A=y
+CONFIG_USB_KEYBOARD=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_GADGET_VENDOR_NUM=0x1b8e
+CONFIG_USB_GADGET_PRODUCT_NUM=0xfada
+CONFIG_USB_GADGET_DWC2_OTG=y
+CONFIG_USB_GADGET_DWC2_OTG_PHY_BUS_WIDTH_8=y
+CONFIG_USB_GADGET_DOWNLOAD=y
+CONFIG_DM_VIDEO=y
+# CONFIG_VIDEO_BPP8 is not set
+# CONFIG_VIDEO_BPP16 is not set
+CONFIG_SYS_WHITE_ON_BLACK=y
+CONFIG_VIDEO_MESON=y
+CONFIG_VIDEO_DT_SIMPLEFB=y
+CONFIG_SPLASH_SCREEN=y
+CONFIG_SPLASH_SCREEN_ALIGN=y
+CONFIG_OF_LIBFDT_OVERLAY=y
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
