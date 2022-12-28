Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE74AC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 10:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oAbGOGdV+gl66KUAdm3U9TsLBCzM2uBFn/WxxVRUkEA=; b=cHwKDWZoKHrYeB
	LCCBgVGUiC+HeR62CLngKEqgTk+1yP1i9iwf3inZkUhDg7gheEqDYsNVGGP4eZfD79k9LLT6yc7uX
	runuwp17gSiAeh3ydaS+AVNtHQkhsAOdRBl91Zn1WGCPIDbhJ2R0EQDEE/M0GZcJU91HxFNsy51MD
	RqsSupqb5qZfVyJL58XHOugFtKNr2DXtsfUsTdANtx4UKHU1PozmoaEohEuoClHftGBOn8upb01ZZ
	OfR9K+ARIinomQcSsSrqZnIMF+Z8QIkYZdnS0cU4qFKE2lZ1ZuEH+skQ8TbEt+LjZrH2Lb5cA43q2
	7z7q4+6zUIwHjcVfWWWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATL9-003wZ0-P0; Wed, 28 Dec 2022 10:07:16 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATK3-003vmy-7b
	for linux-amlogic@lists.infradead.org; Wed, 28 Dec 2022 10:06:08 +0000
Received: by mail-pl1-x636.google.com with SMTP id jl4so9368354plb.8
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Dec 2022 02:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKyVlX/Mpa7o0t27gnVLycSg68+P2J70WhEPAp5+xtQ=;
        b=jW6UGc8/hz58oCJqSTWk/8gf9CLM3mNxTZAFS3SXwTFhJ/Z78w8psS4N18vpeYFb6o
         7VOWq3YknGEueXdTDv93bve3q7NB9V9CPgrDiH9jP1gSjA8m0SvBIQe3W7qp8xqpSLDs
         NCmpb6xtwd41Gg4PL2MDXo8JHtfEYrGo8EYjw9tq8YukXxQjbLsYI+SrCBc7IK68Zs4o
         kytjatg3jUQqANdrm7BJPnxuOMDbTCgONcx1ZAFs6/bH9CtzyfEH5JhF1019Mfo6oZKm
         udYiaC57Qi8k8lZZ+8KyzfcIfd74so98zxwVcm4iZ2/1nSYFeHEn1qOxZ+n4TdxSrGTy
         aUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKyVlX/Mpa7o0t27gnVLycSg68+P2J70WhEPAp5+xtQ=;
        b=X6BS7X3plBomlkGUZ/WCG8ysQcdLBCD8wh1dEG/vmS/4cKKtZVbNBOQILIRdy/xYj5
         hofjhO5clfeuLGjZd8Jb1xhZm8jtAvq9IX/hjNYQmgaL0ZqudgwgtrnZxW3QPq1fkcwL
         0I/ev3MhCsCkN0X2HPfy4ZnlM+KgHhx3RwbRqgbkI+ZbqT6ZeuBlRLT8xuJc29ZmkP06
         CmlYkpdp2+Te4pHikRF65MpnKGb/QOhdywaCc7ylxR4hsLrmI8tHJKqIzzE5uYyMu2C0
         i1HzbApx3h8qw6TYIsUqHX2dKamI+GS0KrSO1yF7hQ/WlZJozAqLSqOwzDJ9oJ0s4yBy
         WroQ==
X-Gm-Message-State: AFqh2korPRQSFWfkAaFZv4NlAooVczRbH22G3UcXOZ7ce1GB07wp7ZE5
	tT6mglch6f6q0vwkIM3sVOsi028pIZTnNA==
X-Google-Smtp-Source: AMrXdXs8wZYfIJ+CtLGOH0BY4QUfPWlXmu4EZUOEgBiXxFuHJG5Tq3gPePXoBIHSu9XinQ2fw2/aqw==
X-Received: by 2002:a17:902:7042:b0:189:6a5a:7289 with SMTP id h2-20020a170902704200b001896a5a7289mr33309457plt.52.1672221963337;
        Wed, 28 Dec 2022 02:06:03 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.26])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019277df45a6sm5794915plb.53.2022.12.28.02.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 02:06:02 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-amlogic@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/11] usb: misc: onboard_usb_hub: add VIA LAB VL817Q7 hub support
Date: Wed, 28 Dec 2022 10:03:19 +0000
Message-Id: <20221228100321.15949-11-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228100321.15949-1-linux.amoon@gmail.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_020607_320758_77196FAF 
X-CRM114-Status: GOOD (  13.79  )
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

VIA LAB VL817Q7 is a 4-port USB 3.1 hub that has a reset pin to
toggle and a 5.0V core supply exported though an integrated LDO is
available for powering it.

Add the support for this hub, for controlling the reset pin and the core
power supply.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/usb/misc/onboard_usb_hub.c | 2 ++
 drivers/usb/misc/onboard_usb_hub.h | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 699050eb3f17..025572019d16 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -335,6 +335,7 @@ static struct platform_driver onboard_hub_driver = {
 #define VENDOR_ID_MICROCHIP	0x0424
 #define VENDOR_ID_REALTEK	0x0bda
 #define VENDOR_ID_TI		0x0451
+#define VENDOR_ID_VIA		0x2109
 
 /*
  * Returns the onboard_hub platform device that is associated with the USB
@@ -418,6 +419,7 @@ static const struct usb_device_id onboard_hub_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 */
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8140) }, /* TI USB8041 3.0 */
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 */
+	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817Q7 3.1 */
 	{}
 };
 MODULE_DEVICE_TABLE(usb, onboard_hub_id_table);
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index b32fad3a70f9..1fb3371ebdae 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -26,6 +26,10 @@ static const struct onboard_hub_pdata genesys_gl850g_data = {
 	.reset_us = 3,
 };
 
+static const struct onboard_hub_pdata vialab_vl817q7_data = {
+	.reset_us = 3,
+};
+
 static const struct of_device_id onboard_hub_match[] = {
 	{ .compatible = "usb424,2514", .data = &microchip_usb424_data, },
 	{ .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
@@ -37,6 +41,7 @@ static const struct of_device_id onboard_hub_match[] = {
 	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,5414", .data = &realtek_rts5411_data, },
+	{ .compatible = "vialab,usb2109", .data = &vialab_vl817q7_data, },
 	{}
 };
 
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
