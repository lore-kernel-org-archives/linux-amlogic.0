Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C69C38159
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 04:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Krh8ziH325X6MV6CxlBhhZTzrbNA9qF8RruvP90SU1Y=; b=MeytAdYHRYi5fX
	Oh23lv4/zlu4Y6nMmVDJ0JJ4ddnfQUYiEgC4DrJrp3zl02EncOjVAY7B1Cj1y1RDPnDC8NEH6jM+K
	hiqGaKqPX6dQJzfBle+rTMYGCVRiSOyHZCQeXD1TdGOIjNMHGQtTt/uNIPt2vXGKVG4amcB0OWwPS
	QsgMtw8SxuijCb8OmtVpHSsxOrbkQuNKLjU96lqYRcL1drd4prS03WIUTammrwIYS4CQ42Owb7vqo
	pgbDgVDlZIiTWRHG2ErqO0SxbxwjBtg+xoBWCfm0/uZ+MhedZ2utSqhJGD913hN7hAA9yqvsnUuqZ
	jUxZrBt53HvINp8xVNAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI0Jv-00Gt3V-PT; Wed, 18 Jan 2023 04:45:07 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI0Jn-00Gsyk-Cf
	for linux-amlogic@lists.infradead.org; Wed, 18 Jan 2023 04:45:00 +0000
Received: by mail-pg1-x533.google.com with SMTP id e10so23634045pgc.9
        for <linux-amlogic@lists.infradead.org>; Tue, 17 Jan 2023 20:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D62QMVerlbHiyJGnbiMPg5OFumoXXbcE1NYnWS92Nek=;
        b=YnwAJLYYmNrSJ2611D8WOEipldiLlKr60N05t7pGUjMqmf/PaOVcD+iBQ/bEdKOGuK
         Aznvm7XYmCkQNTrBzKwF1SqJRuIWi6i3zbCKL3UOOOymZ2ruJYhTeJqwcRECp7kGHL7d
         DI4VR2JmcSEDpYKFERHE4BJumSUntUJkuA+9tFf34Pj5nS91b7eQv0Dgo/+1suXw/AQd
         NPyUZByJZq0f2mcsSqBGDwcD0cSBeBJZaGQKTJ83jCyCTU/tMA5RJGXg4lMZa426XsJk
         wYinfYfa0HKImcaD3Qyqr6aqNS6D4mvxFqWwYSfJFIL2Bv9UhxAHUKi3VRspIi7ll9aR
         DzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D62QMVerlbHiyJGnbiMPg5OFumoXXbcE1NYnWS92Nek=;
        b=dS8BwFtpuUG7aF1XHrjvdEce2In8zJ891Kzm+SvZTmbzXIl04tZbwsQyw+WfUx73/U
         X1ejMRLSO66XMcRn7gYRfNAof0ECCK24SyW9V00OCTp3SeXUUaRwwD6DEHH1J45JWR31
         4Pp2sCVJUkO+OPu1Gr/LWthOf4JEzo6K4uD69r6TuZJDfPu12lQGWxkrmj2/Qz0yZf4Z
         ZVH9q4pZp5arVAT7EbT12iV9eadWTJxbvuokQYIe5XU9qvj3+Bh9P9HgrrSiQVXfCEBK
         cyrEJz+/IZVJ98oZivBsPOGGp7CBoNsohwy8JjF/cg6CqXBdB3PQVo76D68wpBL8gJTp
         fqOA==
X-Gm-Message-State: AFqh2ko58OiDQKOMKDh9TiLRJv4lVMhqy6i9h/OBDnxLfxuVUV8C+ZXm
	3TyGy2aVM2P7421pWTwX1qg=
X-Google-Smtp-Source: AMrXdXsh+fX6wFVwZRY4xo68oRaBk9FmudTk1cSnjbhf23RkmY4pHCEDgfNQy57E+IP8NNuYjT4XgQ==
X-Received: by 2002:a62:1507:0:b0:581:6069:5c00 with SMTP id 7-20020a621507000000b0058160695c00mr6413991pfv.28.1674017098355;
        Tue, 17 Jan 2023 20:44:58 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id i1-20020a056a00004100b00581a156b920sm8682770pfk.132.2023.01.17.20.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 20:44:57 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-amlogic@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/9] usb: misc: onboard_usb_hub: add Genesys Logic GL852G hub support
Date: Wed, 18 Jan 2023 04:44:12 +0000
Message-Id: <20230118044418.875-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118044418.875-1-linux.amoon@gmail.com>
References: <20230118044418.875-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_204459_483202_C1C52ED0 
X-CRM114-Status: GOOD (  14.33  )
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

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
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
