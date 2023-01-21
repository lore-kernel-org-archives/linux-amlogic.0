Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4302C25B50
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Jan 2023 17:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jpk29cKGe6woU0RqzxS14X7ACvAF5MFtDdRyxU7rzwo=; b=XxzJwfAAwOIBof
	K3g/ruBH+S2tjreV0xUc7O19+RDDzoha/D0k3g7wZT3j2p2kwc+TtEe73WLBAGWrhrGr3h9g86T7/
	ank5Mxnm0w3e1GRSmIV66eUvssxJOa/G6y2KbEb0+2uwn+hbaafyx+wb684OFGjB+DkuSD9HM+IQx
	iM33YUw2+I/5QY+wnZifuaarFKOGLZAIFbVcXM8KzBleD2IB4S9QtHEnWhWKK0AW5PGtCaj9eHfKa
	lbnJ8K/ER0yd1LFRt8tzgBFYswuVtF842AjSoOinipZHp3HBGt6t/9iMPfIdfRyu4Jx6AgYaMuUmo
	n7JqgMTUpBt97/Cxd51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI7r-00EEQr-1P; Sat, 21 Jan 2023 17:57:59 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI7g-00EEJW-5f
	for linux-amlogic@lists.infradead.org; Sat, 21 Jan 2023 17:57:49 +0000
Received: by mail-pl1-x62b.google.com with SMTP id z20so5987973plc.2
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Jan 2023 09:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGtMPXG+Aka08SYYYyo/KkQe1dgGt7Jtohr7QlueNXo=;
        b=CDHKAHMPL7wIv23meaxe+3ZzUxHgMo5m6Tm4N/VqgoAGblTS+VmcmY6flogCoaD980
         Z8pvO8Mbg1842kAFblDR2hLPxfoJaT1oUIB0GCNaJP4HD9RDviBwsUTsDW0YTui/cTV/
         rLb6waQCHhShKnIkxASdlZoQ7ixPTW/EW1hGuUjg/ZPThzoHLTTa68cpolyDrUaCrUK9
         4NxJ4IFDduAxiAYvLCoMPrHhEac+PsDLt7HVQId0Qu96dSUm5mY1iHtjW5+daiYkk++q
         xiCYnORnV1BVuymOBx/jILTcrrZFKukg/Z9Cp/pvjFBl1niuu+bvDTwINYR77qqkQ1Sn
         11zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGtMPXG+Aka08SYYYyo/KkQe1dgGt7Jtohr7QlueNXo=;
        b=0VshSHbbuCNTRVK9faeywF44IC4NtIM/6yaGZRFp5A4+khD5n1SOPHIZPwnLWN+KKC
         Ifo0zstpF1JORqXdhGs/LF1pIdgP52vkX4S7On9GUlk7jtUo1s8y7hiLSM0YYgCRGoHh
         8Af0Ht/u1l1DgN/jCRoSMnWal9JPdRtjkxSkf8TaBRidnwS6W7V+/HMa7NqsO102+1jG
         e5vu9JEvWnFYSJHZ+iEF43eRlUj6R356AcAnho6IwOv2Utu+3hQ/D8Ct/MBMcKCbBJ7Z
         31LB0h1Ss3wbFZ6U6nmvg8KZcFAxIg6nZLGHul6hl20AFF0cBY30DPT3Cp8q2NYBjEtk
         uRYg==
X-Gm-Message-State: AFqh2kprU2n43B9E+fKk5w+WM6MFZJeqC1VMRGAyr+/O7DYgb+9xTs9W
	sMG/h133iEnX9+DQ5zRcogc=
X-Google-Smtp-Source: AMrXdXvI7b8pbgzCZcQDa0EQ94L2M5q99LsBpbLZlfEUjgkB1i5500YQOa7vzYwZfWYDNT4GCK91+Q==
X-Received: by 2002:a05:6a20:1601:b0:b8:c659:9d51 with SMTP id l1-20020a056a20160100b000b8c6599d51mr23177312pzj.56.1674323866966;
        Sat, 21 Jan 2023 09:57:46 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id r3-20020a632b03000000b00478e14e6e76sm24857374pgr.32.2023.01.21.09.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 09:57:46 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-amlogic@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/9] usb: misc: onboard_usb_hub: add VIA LAB VL817 hub support
Date: Sat, 21 Jan 2023 17:56:36 +0000
Message-Id: <20230121175639.12818-9-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230121175639.12818-1-linux.amoon@gmail.com>
References: <20230121175639.12818-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_095748_243492_A4676316 
X-CRM114-Status: GOOD (  15.70  )
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

VIA LAB VL817 is a 4-port USB 3.1 hub and USB 2.0 root hub
that has a reset pin to toggle and a 5.0V core supply exported
though an integrated LDO is available for powering it.

Add the support for this hub, for controlling the reset pin and
the core power supply.

Add USB device id's for USB 2.0 and USB 3.0 root hub.

Acked-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3 - Add ack Matthias
v2 - fix the compatible string and update the commit message
   - update the USB device id for USB 3.0 and USB 2.0 root hub.
---
 drivers/usb/misc/onboard_usb_hub.c | 3 +++
 drivers/usb/misc/onboard_usb_hub.h | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 9bf59792fb94..945d4e7125ea 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -335,6 +335,7 @@ static struct platform_driver onboard_hub_driver = {
 #define VENDOR_ID_MICROCHIP	0x0424
 #define VENDOR_ID_REALTEK	0x0bda
 #define VENDOR_ID_TI		0x0451
+#define VENDOR_ID_VIA		0x2109
 
 /*
  * Returns the onboard_hub platform device that is associated with the USB
@@ -417,6 +418,8 @@ static const struct usb_device_id onboard_hub_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 */
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8140) }, /* TI USB8041 3.0 */
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 */
+	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817 3.1 */
+	{ USB_DEVICE(VENDOR_ID_VIA, 0x2817) }, /* VIA VL817 2.0 */
 	{}
 };
 MODULE_DEVICE_TABLE(usb, onboard_hub_id_table);
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index 163fc07abf25..0a943a154649 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -30,6 +30,10 @@ static const struct onboard_hub_pdata genesys_gl852g_data = {
 	.reset_us = 50,
 };
 
+static const struct onboard_hub_pdata vialab_vl817_data = {
+	.reset_us = 10,
+};
+
 static const struct of_device_id onboard_hub_match[] = {
 	{ .compatible = "usb424,2514", .data = &microchip_usb424_data, },
 	{ .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
@@ -40,6 +44,8 @@ static const struct of_device_id onboard_hub_match[] = {
 	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,5414", .data = &realtek_rts5411_data, },
+	{ .compatible = "usb2109,817", .data = &vialab_vl817_data, },
+	{ .compatible = "usb2109,2817", .data = &vialab_vl817_data, },
 	{}
 };
 
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
