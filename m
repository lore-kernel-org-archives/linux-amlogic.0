Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B65EC38142
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Jan 2023 17:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aH92H9LIH+Ti8+OfbVBt10y3CUtnE+5iCfq0A+WhAMI=; b=ZpKp1SaY80RAXa
	j2SXh43v8UXnYU5+81+/zigoOVVjUcNgSqJutvn02sAh/G+bv+w8A3M0pvlNCuv3L7h3/ZX3pGhGr
	exOo75IUmbnkKzIcks01UyGBBAdm/n4ex98Y8U6HOn0vLezCutWM4OZ3hjB6giJqo+261Fj1jnqKb
	dXyheG1jN98E0rzGY51VgATDBgUsu0CP+NAzRf8cnWu8JPk5DUthAMDdM0s8axWg5dKzlEt5BhLlv
	/3h57pHCBqeG9u9/sfKupJC/yeqVFZvjjcD9ffeLnT5ETrAmA/C0qoghao4RyNfT1XgQ3gaiasOwm
	aVmjGr5DuaqQ/1pYx/ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI7P-00EE8e-3r; Sat, 21 Jan 2023 17:57:31 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI7F-00EE2m-PU
	for linux-amlogic@lists.infradead.org; Sat, 21 Jan 2023 17:57:23 +0000
Received: by mail-pl1-x62f.google.com with SMTP id k18so7971125pll.5
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Jan 2023 09:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7SuZc4P45+/SBaDlaz2WkZ7htQPLlLb7VbRabYVtdI=;
        b=kP7U3BbF4sadebIHCzs1+Lz+rNORdylAzj5dWUqkea0xhy66aWxeL8r7yhN34neUsH
         eAUDm43C5lXA6WV2OAH+beRIkFhUYCnQs3skvsK58c7wUTN6PimZfExaowTrj6cUUYFD
         dlMpa/e/bI9cff+OQFKUNvKBjsl1KNGD5En5S6Uj+yJKPZPh2nAuUwopv568YrV8SQy9
         W9MMKQsdgYluRXoo2xXX5WkJ/nPvkebnVwyEYMAwePhsWJaokVNCRUc6xEpeTBJkl9iY
         wT6PbkmvaQXmZ/rWky+ojiqdVlPEarl7BCO6QCjiqc4K7E+JGk0nkRI6sDAJL4VajY8A
         Y7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7SuZc4P45+/SBaDlaz2WkZ7htQPLlLb7VbRabYVtdI=;
        b=yb7i9a/k2FNwuzFaK9bmIed4yoQbhyOCkl3JxvP5YDnRx1D0mAbREjMwJbRiTs5PNa
         GjTdyrxUBvh/3UeQXuCOc7iZIAWKIOSiw720jYkB3kwfTBATPzyBgfdYSEDVeI7JzvoW
         R8//Vjru4Sjx6FWAoosWM2QNSH/Qsesf1iBzzYR1TKi3g1IJP98Hz8HM1m4MnRaD12ze
         wPiewpRuXraU9Qd+pVdOSU4XtoXHOI/6cLXuto2l7ctvCc6D4G0Vno65rQjHorKZXQcw
         tYx3f8ga37pvsVwJCjh4D324lv2x60MW94Jf0cQbIzh1wVrsQvt7FCyEzJWjLHe+C61K
         P9kQ==
X-Gm-Message-State: AFqh2kocBlmLyo2CYgNhlwkka/mF65uQ501Y3FaLf/BX7S9ZDqn1y70N
	bCsKxzv+hMjAuHAOZvmnNxI=
X-Google-Smtp-Source: AMrXdXvpJKSkHiYRPl5XWzj2YzqDC9QAgz57GlKP9VkGjPfRKXn9vxsxzAJoEW2hF7bO5MlzwnB9jA==
X-Received: by 2002:a05:6a20:d80e:b0:ac:b2a3:e39c with SMTP id iv14-20020a056a20d80e00b000acb2a3e39cmr18740290pzb.62.1674323840228;
        Sat, 21 Jan 2023 09:57:20 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id r3-20020a632b03000000b00478e14e6e76sm24857374pgr.32.2023.01.21.09.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 09:57:19 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-amlogic@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/9] usb: misc: onboard_usb_hub: add Genesys Logic GL852G hub support
Date: Sat, 21 Jan 2023 17:56:32 +0000
Message-Id: <20230121175639.12818-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230121175639.12818-1-linux.amoon@gmail.com>
References: <20230121175639.12818-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_095721_878266_4D25023D 
X-CRM114-Status: GOOD (  13.70  )
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

Genesys Logic GL852G is a 4-port USB 2.0 STT hub that has a reset pin to
toggle and a 5.0V core supply exported though an integrated LDO is
available for powering it.

Add the support for this hub, for controlling the reset pin and the core
power supply.

Acked-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3: - Add Ack Matthias
v2: - fix the compatible string
    - drop the -OHG suffix from commit message.
    - Add reset delay.
---
 drivers/usb/misc/onboard_usb_hub.c | 1 +
 drivers/usb/misc/onboard_usb_hub.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 94e7966e199d..9bf59792fb94 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -409,6 +409,7 @@ static void onboard_hub_usbdev_disconnect(struct usb_device *udev)
 
 static const struct usb_device_id onboard_hub_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G USB 2.0 */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index 62129a6a1ba5..163fc07abf25 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -26,11 +26,16 @@ static const struct onboard_hub_pdata genesys_gl850g_data = {
 	.reset_us = 3,
 };
 
+static const struct onboard_hub_pdata genesys_gl852g_data = {
+	.reset_us = 50,
+};
+
 static const struct of_device_id onboard_hub_match[] = {
 	{ .compatible = "usb424,2514", .data = &microchip_usb424_data, },
 	{ .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
 	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
 	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
+	{ .compatible = "usb5e3,610", .data = &genesys_gl852g_data, },
 	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
