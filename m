Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810F4C53210
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 10:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JhywbW6voLBB5CnndlTt9Q6eRKdrrhLWeW8K75BX90=; b=aNaaQNhypjtJzI
	9vUUEewXtIzwOT3xEkPgCxN44KrfdG/Mf2MwQEiz/aDyl8nMHKJepuKUC3uUJlafX2QYJ7cDtcf7K
	Qpu4XFWKsdU4ldiWtqb3pAn5PwfGSnacOGr0VQMR0GB0fJnfUa1REDfriEwHoJG7kgVoq5esgIgi4
	/JB+TFYgBLHv1WCaNdR3zcSywy/HrK4zOBKuYuQRki1MpEM2DYBZzA5kPdOQ33NuzjxqSNrUVAWtV
	HyJasU7pyUVzENknrEqVJVoI0qSfK1q4dufhOGHQfFamBiRODklnkKUU+3sGngx6Y6IzaJQpuvJDZ
	krjdY/SKhsjnFK562a/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATKD-003vuG-0u; Wed, 28 Dec 2022 10:06:17 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATJd-003vWK-25
	for linux-amlogic@lists.infradead.org; Wed, 28 Dec 2022 10:05:42 +0000
Received: by mail-pj1-x1034.google.com with SMTP id c8-20020a17090a4d0800b00225c3614161so12500919pjg.5
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Dec 2022 02:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxRBm2XU4XIQi7X1v3Ft+eONrO9UoVmTZcrD/eMtUhA=;
        b=Hv0yLKSAHoWZ2/9bzhG3A+tIIUGjScb43m92UrfPWc6xCgpHp9lR4WGbUASMXI05BH
         S7CE7WBmVOapa2gkkdkYpjA314eulSNrRRTF+ctmtR0JjqChdWJLPYZ9Y2Ln6+WbW7Zy
         RoWu+Va2xQ3MEdAQ5QfyMXIqUtOIvz0umLKxfWGz7xtBln24SJLjoc/6xs0x/TLofVSX
         Q28A31YRPB4CVkoWaN/XaqrsOFI/Td1tkcqmOllJkd+PED6716ZbO31Lpbtge4/SgzNU
         gA4KNDoiTnnlCvPwHpRpdR6A/37deTAe+Rr+dJnyqfgMU1dBUkNk3/Ux0vHLp1iUyIs3
         /LoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxRBm2XU4XIQi7X1v3Ft+eONrO9UoVmTZcrD/eMtUhA=;
        b=y44jKfe8VpkD3oWTCnv9Ntljbzwj9CypJHcfeRYsF3wTMtIzoqf/JIDY+LHYaa4nLL
         cLDfs/ub0z2zGWl96Q4H2YfdPOGuv0yemgNLx9DADaeula+AActQHWRNJXiydKUymj32
         Ua+3vQkaup3zoxv3ntNC/Kr59CqhVvGIHL5brePIUMMGAe8G2w0X78YQDIPlV4BHF4n/
         6DMosX+yiQ7jFTbq4J7GRwJEcP3MaH/MpFfIt6T9bNQBtykBEjhKirS+vFzniqG48mIy
         jUiJ3TOgovOCkmZa2DtywWzpUWdQLsQ2jWjbbm+QxOJiPbtMS5Y4TJ+IoVuFdLe/p3w+
         XoOw==
X-Gm-Message-State: AFqh2kofDqTORxs7EiUWtBgVlpTlX9/7OFxyWwh0o/d1Om0ocqjd5Mqg
	xbbo46sto1DUNeohNDzFHZE=
X-Google-Smtp-Source: AMrXdXtRNwZT3qCdQbi16HHYR45qm7jdb3TcssmNhTmKUcumlM4A5zcxGE+hkQEO2/YbQo/zhgCyrQ==
X-Received: by 2002:a05:6a20:94c6:b0:ad:aaac:d40b with SMTP id ht6-20020a056a2094c600b000adaaacd40bmr30232618pzb.45.1672221938899;
        Wed, 28 Dec 2022 02:05:38 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.26])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019277df45a6sm5794915plb.53.2022.12.28.02.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 02:05:38 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-amlogic@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 06/11] usb: misc: onboard_usb_hub: add Genesys Logic GL3523-QFN76 hub support
Date: Wed, 28 Dec 2022 10:03:15 +0000
Message-Id: <20221228100321.15949-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228100321.15949-1-linux.amoon@gmail.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_020541_168343_9A8AD1F5 
X-CRM114-Status: GOOD (  12.38  )
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

Genesys Logic GL3523-QFN76 is a 4-port USB 3.1 hub that has a reset pin to
toggle and a 5.0V core supply exported though an integrated LDO is
available for powering it.

Add the support for this hub, for controlling the reset pin and the core
power supply.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/usb/misc/onboard_usb_hub.c | 1 +
 drivers/usb/misc/onboard_usb_hub.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index c0e8e6f4ec0a..699050eb3f17 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -410,6 +410,7 @@ static void onboard_hub_usbdev_disconnect(struct usb_device *udev)
 static const struct usb_device_id onboard_hub_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G-OHG USB 2.0 */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0620) }, /* Genesys Logic GL3523-QFN76 USB 3.1 */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index 2ee1b0032d23..b32fad3a70f9 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -32,6 +32,7 @@ static const struct of_device_id onboard_hub_match[] = {
 	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
 	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
 	{ .compatible = "genesys,usb5e3,610", .data = &genesys_gl850g_data, },
+	{ .compatible = "genesys,usb5e3,620", .data = &genesys_gl850g_data, },
 	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
