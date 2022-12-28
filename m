Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C8CC54EBC
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 10:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=thAoS//u2QdLqw+hOS3f4ge9WwRW7+VaBIeNbV8RBI4=; b=Ln6vVcbLO9BDv/
	iLs9ZIyWKoJvQLWHnUbH3HwYjkrxH3oX7KCNeX4fF7fuZSxv7QJsp8Zl59BrZwEE655rjB6aUJent
	fwPiezVTnsYD1iJKwdmI4nRVEex7+0YO/DAKGLYnyJNtXMZCHkF6mDXxajVEdmAK+SebQpg7v9WHo
	nDeZ6VUTlgFyK3VS8vGufFUQtW1Fy2UN8qEmhSV1UuA4cCpablKDpGXkLPWEdkqcTtrqrtDWqRvIt
	a3MoiCX6Bc+a3DjrVlN5vbSYPEEh6zHkif/co0JD8zLY8kjIFQff3Kj+UnGaEBmDCKbTF5qDw0jsX
	6pUR4vh9AW1msOELxJ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATK3-003vp1-Iw; Wed, 28 Dec 2022 10:06:07 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATJX-003vSn-ME
	for linux-amlogic@lists.infradead.org; Wed, 28 Dec 2022 10:05:37 +0000
Received: by mail-pj1-x102d.google.com with SMTP id k88-20020a17090a4ce100b00219d0b857bcso15631783pjh.1
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Dec 2022 02:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTZpZDLmOBMESWnhE00PibYliTCVq7n9n0KaHIBRUgo=;
        b=ASD375cpLc8wE91QgoQZ79vhHoTccoa+M+X5uZ7MY27gKKGlPUZycPZp5ItavoE8Y2
         mmmSRWhRwvpBCtlaexQrHpIx9cS4zCvabcVfw41PxMsOXRs2kYhz1QYaNYt71MVWasdo
         tE+7YN1OMa9d83NfJRqK/CjrQLVtJH4zbAXH0JwSu17WcjvQLE6r8f/XQx/hz5vlh3Up
         GCusR8SIRGkI8ZYOcs8kj8zS3pbNplb6OiDTMMJB42gVpOD8qFHRP5t8YxVpFf+OiC8+
         2X2qvKUD2Lsw/n3ieW7Cv9V/UoOzKY4xDJMGeTOluGsIDDL1Km3KVPUfmThSSzf6WKPL
         K3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTZpZDLmOBMESWnhE00PibYliTCVq7n9n0KaHIBRUgo=;
        b=XKvwrGmOtEdVSnRH/CaL/pRN9eujVGn8NUTdb4S5A0v/PZdCQJUKCv1Z3vl/jXDYKy
         bLhYjHAcBYt1as9rJQbFOf7hW3C+mc9YnqYZj0UJygbrbc12HtJf14s8hNggd47xVuhj
         CjmGuetrdRfUKoTC8w9ZGNAgWV3elJLgrCSl1W1Kw5u1f4u1A0K7UElyHqMRb29BesHD
         8IWMrxO1NhA7F0UrVZLnAYLEBl7sqastdmz1Zoxrgm1T2sjsiYOJV4SBWjkpmtCpnNzG
         GYizcw89AkJLULNNFtl67SV5ZJld1KnCglHWyYgIPKhJ/jZ23ZnpfJOJkjEsTij/xFhl
         4NqA==
X-Gm-Message-State: AFqh2krd8RXtHFKKwyew9Yn6EqMmD5Lrmc9g8v5TZblCM/hZCjCOqpXX
	rXyZvY2DBSGTawaDv+TYPv8=
X-Google-Smtp-Source: AMrXdXv8C2IoFp8OPcwFQG8p+cLItjMQYOvAVdLCN1EyZpTCc09FpVxsJ9XHFfbJeQIa+ovcIyAOwQ==
X-Received: by 2002:a05:6a21:3988:b0:ad:a09c:5734 with SMTP id ad8-20020a056a21398800b000ada09c5734mr37897250pzc.44.1672221932657;
        Wed, 28 Dec 2022 02:05:32 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.26])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019277df45a6sm5794915plb.53.2022.12.28.02.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 02:05:32 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-amlogic@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 05/11] usb: misc: onboard_usb_hub: add Genesys Logic GL852G-OHG hub support
Date: Wed, 28 Dec 2022 10:03:14 +0000
Message-Id: <20221228100321.15949-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228100321.15949-1-linux.amoon@gmail.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_020535_769758_6704B852 
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

Genesys Logic GL852G-OHG is a 4-port USB 2.0 STT hub that has a reset pin to
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
index 94e7966e199d..c0e8e6f4ec0a 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -409,6 +409,7 @@ static void onboard_hub_usbdev_disconnect(struct usb_device *udev)
 
 static const struct usb_device_id onboard_hub_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G-OHG USB 2.0 */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index 62129a6a1ba5..2ee1b0032d23 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -31,6 +31,7 @@ static const struct of_device_id onboard_hub_match[] = {
 	{ .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
 	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
 	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
+	{ .compatible = "genesys,usb5e3,610", .data = &genesys_gl850g_data, },
 	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
