Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2B5C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Mar 2022 18:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXgrF2atYpvbINdnnGNGMcRQ16Uoar6xwSiuNli8wYk=; b=ogtjwveJp9l8sR
	Uodg4L0N0kvnWhY5W4/vuUAqPi9/yolkahyL/mFqTPbl/w3AE3bg35EsEtLO6eAnwISKNvxN7aMB3
	qv067TxdSk0jydI91h165bnO+8MhLNbF6tgZMPRGnKKwp8RvTBvycrWN9vZZaPLDZ0lDlo7+9PBLq
	a4x32YdiRpsfNROQATpMSOV/KFNbWzuG555z9e6o0DScYChNSFdqqZ5nyvyEc2TK5lfErSstWwofj
	JG/k9RqSYzJECx+f4ck5Zi9O5h2f93rDN+oaP8nTtIdddsB1XDpAXdwuU65utJJQ7uoj/qs8fB3nO
	kG7MHZizlc9rJVaRx3eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQCnw-00Bew5-Ua; Fri, 04 Mar 2022 18:37:28 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQCnn-00BetV-J5
 for linux-amlogic@lists.infradead.org; Fri, 04 Mar 2022 18:37:21 +0000
Received: by mail-ed1-x52d.google.com with SMTP id x5so11845119edd.11
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Mar 2022 10:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=mGk3B+K5X2U3dvLx49arF2t8VsVYc/Id6UewkzTupAo=;
 b=e2qFauSTQG/Loa6Oix2tFUduzULhvcwiVp79xPGKWN6L/ilCJ9l+/eBUPaqQTcfysf
 O1SnQkIGxeTRPC8GCDd5LasU4WLq190RqZeESWliMvfkjtofDAHR3k6IagXREs/r18UW
 DqrUtZH3cl8mL5oCa5zHjN9FA6rF+nOlNbz1T9J4Z5wQWIpfI49zjxp/HIOdwNehx8bb
 EGuCoobOoAz1BFhMHKzMxE3qKdIo550uRMMjKQRsxFjWnO7sRP2RQAHtfLIhJWXEGR7y
 UJhYsEcZD24kEFIPMybPNRVKlxfRFmXq4Vn6W4AfOp1tiusHQN8EQeNyHCWS5iyFxvyv
 hwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=mGk3B+K5X2U3dvLx49arF2t8VsVYc/Id6UewkzTupAo=;
 b=1O+ScjMHsGRELfjutXFIDjUHcdanl/h23erbJKClpHTk6fo0m6OLqwxiXbKEvW+mSf
 7421VI3oiQnIGXWcPr6Uq/shvGKdFmBmDU+FluV2YYE8EsHNo+wi1VRweJbDxUqY84Jr
 +JgVcEL3NooVqSPan2aGNUluMSVLQ00Lw8Y4rG/cG83VpkW0KbZzy9HO66tAbosAck5U
 xz233tZbvGiVO8axO0G0yZQzr/Y4mj/X+gJhcOr0tA5xmnZM2c4AlqJeLPyuEI5dWais
 RleJdfGQV6ijzd0vVUTAWAYw09iSm69oyrrRr+lFoeYP6Mz7FFpX/0vr7LVvD8My2xyE
 Vs0Q==
X-Gm-Message-State: AOAM531RyQKAPNi1S9TKATMj3S0NHNmnqQZQofu2xaqrTZIYonTrZRqz
 1PVS7bAyT4PIwE5YwOsANgI=
X-Google-Smtp-Source: ABdhPJzYMYDDT5Ov/FZHvyxLPinCXEOOwQE5zvU6h91XO1oiBb6BS0hplIqImKaO9CUthAy2Ho5Fcw==
X-Received: by 2002:a05:6402:270a:b0:410:63d:a66d with SMTP id
 y10-20020a056402270a00b00410063da66dmr40653526edd.48.1646419038088; 
 Fri, 04 Mar 2022 10:37:18 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9fb:2800:c56d:9b34:f61c:e318?
 (dynamic-2a01-0c23-b9fb-2800-c56d-9b34-f61c-e318.c23.pool.telefonica.de.
 [2a01:c23:b9fb:2800:c56d:9b34:f61c:e318])
 by smtp.googlemail.com with ESMTPSA id
 r11-20020aa7cfcb000000b00412c58c43ccsm2434601edy.37.2022.03.04.10.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 10:37:17 -0800 (PST)
Message-ID: <816c881a-dca4-7730-54b5-85cc640ea88e@gmail.com>
Date: Fri, 4 Mar 2022 19:35:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 2/5] xhci: factor out parts of xhci_gen_setup()
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Alan Stern <stern@rowland.harvard.edu>, Jack Pham <quic_jackp@quicinc.com>,
 Tung Nguyen <tunguyen@apm.com>
References: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
In-Reply-To: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_103719_676239_25BFB10A 
X-CRM114-Status: GOOD (  15.41  )
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

Factoring out parts of xhci_gen_setup() has two motivations:
- When adding functionaliy to omit shared hcd if not needed in a
  subsequent patch, we'll have to call xhci_hcd_init_usb3_data()
  from two places.
- It reduces size of xhci_gen_setup() and makes it better readable.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/host/xhci.c | 104 +++++++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 50 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a1c781f70..824b833ae 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5195,6 +5195,57 @@ static int xhci_get_frame(struct usb_hcd *hcd)
 	return readl(&xhci->run_regs->microframe_index) >> 3;
 }
 
+static void xhci_hcd_init_usb2_data(struct xhci_hcd *xhci, struct usb_hcd *hcd)
+{
+	xhci->usb2_rhub.hcd = hcd;
+	hcd->speed = HCD_USB2;
+	hcd->self.root_hub->speed = USB_SPEED_HIGH;
+	/*
+	 * USB 2.0 roothub under xHCI has an integrated TT,
+	 * (rate matching hub) as opposed to having an OHCI/UHCI
+	 * companion controller.
+	 */
+	hcd->has_tt = 1;
+}
+
+static void xhci_hcd_init_usb3_data(struct xhci_hcd *xhci, struct usb_hcd *hcd)
+{
+	unsigned int minor_rev;
+
+	/*
+	 * Early xHCI 1.1 spec did not mention USB 3.1 capable hosts
+	 * should return 0x31 for sbrn, or that the minor revision
+	 * is a two digit BCD containig minor and sub-minor numbers.
+	 * This was later clarified in xHCI 1.2.
+	 *
+	 * Some USB 3.1 capable hosts therefore have sbrn 0x30, and
+	 * minor revision set to 0x1 instead of 0x10.
+	 */
+	if (xhci->usb3_rhub.min_rev == 0x1)
+		minor_rev = 1;
+	else
+		minor_rev = xhci->usb3_rhub.min_rev / 0x10;
+
+	switch (minor_rev) {
+	case 2:
+		hcd->speed = HCD_USB32;
+		hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
+		hcd->self.root_hub->rx_lanes = 2;
+		hcd->self.root_hub->tx_lanes = 2;
+		hcd->self.root_hub->ssp_rate = USB_SSP_GEN_2x2;
+		break;
+	case 1:
+		hcd->speed = HCD_USB31;
+		hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
+		hcd->self.root_hub->ssp_rate = USB_SSP_GEN_2x1;
+		break;
+	}
+	xhci_info(xhci, "Host supports USB 3.%x %sSuperSpeed\n",
+		  minor_rev, minor_rev ? "Enhanced " : "");
+
+	xhci->usb3_rhub.hcd = hcd;
+}
+
 int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 {
 	struct xhci_hcd		*xhci;
@@ -5203,7 +5254,6 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	 * quirks
 	 */
 	struct device		*dev = hcd->self.sysdev;
-	unsigned int		minor_rev;
 	int			retval;
 
 	/* Accept arbitrarily long scatter-gather lists */
@@ -5218,60 +5268,14 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	xhci = hcd_to_xhci(hcd);
 
 	if (usb_hcd_is_primary_hcd(hcd)) {
-		xhci->main_hcd = hcd;
-		xhci->usb2_rhub.hcd = hcd;
-		/* Mark the first roothub as being USB 2.0.
-		 * The xHCI driver will register the USB 3.0 roothub.
-		 */
-		hcd->speed = HCD_USB2;
-		hcd->self.root_hub->speed = USB_SPEED_HIGH;
-		/*
-		 * USB 2.0 roothub under xHCI has an integrated TT,
-		 * (rate matching hub) as opposed to having an OHCI/UHCI
-		 * companion controller.
-		 */
-		hcd->has_tt = 1;
+		xhci_hcd_init_usb2_data(xhci, hcd);
 	} else {
-		/*
-		 * Early xHCI 1.1 spec did not mention USB 3.1 capable hosts
-		 * should return 0x31 for sbrn, or that the minor revision
-		 * is a two digit BCD containig minor and sub-minor numbers.
-		 * This was later clarified in xHCI 1.2.
-		 *
-		 * Some USB 3.1 capable hosts therefore have sbrn 0x30, and
-		 * minor revision set to 0x1 instead of 0x10.
-		 */
-		if (xhci->usb3_rhub.min_rev == 0x1)
-			minor_rev = 1;
-		else
-			minor_rev = xhci->usb3_rhub.min_rev / 0x10;
-
-		switch (minor_rev) {
-		case 2:
-			hcd->speed = HCD_USB32;
-			hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
-			hcd->self.root_hub->rx_lanes = 2;
-			hcd->self.root_hub->tx_lanes = 2;
-			hcd->self.root_hub->ssp_rate = USB_SSP_GEN_2x2;
-			break;
-		case 1:
-			hcd->speed = HCD_USB31;
-			hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
-			hcd->self.root_hub->ssp_rate = USB_SSP_GEN_2x1;
-			break;
-		}
-		xhci_info(xhci, "Host supports USB 3.%x %sSuperSpeed\n",
-			  minor_rev,
-			  minor_rev ? "Enhanced " : "");
-
-		xhci->usb3_rhub.hcd = hcd;
-		/* xHCI private pointer was set in xhci_pci_probe for the second
-		 * registered roothub.
-		 */
+		xhci_hcd_init_usb3_data(xhci, hcd);
 		return 0;
 	}
 
 	mutex_init(&xhci->mutex);
+	xhci->main_hcd = hcd;
 	xhci->cap_regs = hcd->regs;
 	xhci->op_regs = hcd->regs +
 		HC_LENGTH(readl(&xhci->cap_regs->hc_capbase));
-- 
2.35.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
