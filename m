Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE95C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Mar 2022 18:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oko21fGJczuXBtg7UHTzmWAMbJMfEId05VSr5D40Ais=; b=t4d7dUY7RBeXXO
	vVzYNrab5O+3tyuzamua6U6w75Qjf6i5lWmSLuLBoosmBrdLkJ9o0dHI5Q1I1Q27k41JxwRlQUio9
	zqMFgvqrIbaVsotx2uKwf3mWAJwu7YqFprySOLyTut6umFXzOhUsHVrrIujZZ4bf2Q08gPNRgaUld
	JwGUtqCbZ8/XYh7aeHysXntgOwLyPD7itQ/XFB+zCvASCCci3tQ/7STnU55cYzWzaHU/J1XDI281W
	PDCrcyEBo+z6HoOpbuF0jQIK46mPwh+4WINl+yqbieDfx4xm4wwrl0xnfUQFNFzKEm+LFbtLq1iHW
	dvCfhYZKnEMs0hkh7V6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQCnx-00BewL-La; Fri, 04 Mar 2022 18:37:29 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQCnq-00BeuC-Ds
 for linux-amlogic@lists.infradead.org; Fri, 04 Mar 2022 18:37:24 +0000
Received: by mail-ej1-x631.google.com with SMTP id qa43so19171528ejc.12
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Mar 2022 10:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=SYFoL4D1TXW6vhl6Uq63PkI2yEgwRuD0c8R2wUDDQ0A=;
 b=clS+8kUmRSaQXoUk87EHXNmflU7Ep87W139tLGWGxm00HMS3obhmUorFqddEIt82S3
 2kxYxJ74Rd8wzKYLcF9vlq0PuvV+RVV0S05/iS9YrO4Qlout+6RsPnvrlrlUM+zVjHbR
 FQMkjsG7sXV4XMcb6WFf1isPWt9jt8R86yUgZUqYXzg8FMo4qtzBkslExmrnPHWrh9vd
 mpEufS6njeO9/EQkQ1GSEkc8gqQLpUSK533F1NNaGhstLCmx5Nl1hojBm1RdAgcRF7cD
 lomManIYtn0boPCH1QEvMZSGHNOrNFjpwIihOffyvj/zVwakITTIFRw7Oo36WW53j1bk
 hUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=SYFoL4D1TXW6vhl6Uq63PkI2yEgwRuD0c8R2wUDDQ0A=;
 b=sqlwfLRSEi3AjcQKkF4k7vJjoV2Lq0DPn5BVkEoRZtzVi1DwlGt3aWNSWl7NoiuCEE
 sHpHYDwuOQvrgz2nYJKsEwTSTwKH2DVM87cme67c9z+LtC/QPv/437BZ03b7wWpVrcKM
 08b+jmOghyc0PvoMq0lwgfU/byh6+KNi6ZVx3bz4AtkI5Zl0Yl3YeIApGNbeZCO77ACH
 WVy6BQj5aApsvYV7BKR9wIEgEZViEcJDx0sGwjjHeu3maminJIz99QTFy8z3wZbMx/0K
 fyztdv9P4v9sSv7zJFHMxoxChH+zUnldSHILPqsvKRSQb+5HAnNXe7k730yWCAZ9Uv9f
 YEdA==
X-Gm-Message-State: AOAM530w7bNYtL74B81I+umxIkZ+qdh6JVJ7Fz9SZPgOeRxKVNadqXFt
 GKXMAxWGzmIltxvzfW9NMYo=
X-Google-Smtp-Source: ABdhPJyMXawA4GkZPl4adIYw+UP7H/jKaZXiuP8FFuy7XKpuR8hmX0Rk/dFGyvp9GCaRO1iaVSEJKQ==
X-Received: by 2002:a17:906:bc9b:b0:6da:9f90:a56a with SMTP id
 lv27-20020a170906bc9b00b006da9f90a56amr24469ejb.575.1646419040041; 
 Fri, 04 Mar 2022 10:37:20 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9fb:2800:c56d:9b34:f61c:e318?
 (dynamic-2a01-0c23-b9fb-2800-c56d-9b34-f61c-e318.c23.pool.telefonica.de.
 [2a01:c23:b9fb:2800:c56d:9b34:f61c:e318])
 by smtp.googlemail.com with ESMTPSA id
 lj2-20020a170906f9c200b006da6f29bc01sm2012594ejb.158.2022.03.04.10.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 10:37:19 -0800 (PST)
Message-ID: <2a1c1f6c-bd3f-b0cb-f90d-fc3b8c37c580@gmail.com>
Date: Fri, 4 Mar 2022 19:35:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 3/5] xhci: prepare for operation w/o shared hcd
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
X-CRM114-CacheID: sfid-20220304_103722_512805_DFC24874 
X-CRM114-Status: GOOD (  18.29  )
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

This patch prepares xhci for the following scenario:
- If either of the root hubs has no ports, then omit shared hcd
- Main hcd can be USB3 if there are no USB2 ports

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/host/xhci-hub.c |  3 ++-
 drivers/usb/host/xhci-mem.c |  4 +++-
 drivers/usb/host/xhci.c     | 44 +++++++++++++++++++++++--------------
 drivers/usb/host/xhci.h     | 20 +++++++++++++++++
 4 files changed, 53 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index df3522dab..7931c7612 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -707,6 +707,7 @@ static int xhci_enter_test_mode(struct xhci_hcd *xhci,
 				u16 test_mode, u16 wIndex, unsigned long *flags)
 	__must_hold(&xhci->lock)
 {
+	struct usb_hcd *usb3_hcd = xhci_get_usb3_hcd(xhci);
 	int i, retval;
 
 	/* Disable all Device Slots */
@@ -727,7 +728,7 @@ static int xhci_enter_test_mode(struct xhci_hcd *xhci,
 	xhci_dbg(xhci, "Disable all port (PP = 0)\n");
 	/* Power off USB3 ports*/
 	for (i = 0; i < xhci->usb3_rhub.num_ports; i++)
-		xhci_set_port_power(xhci, xhci->shared_hcd, i, false, flags);
+		xhci_set_port_power(xhci, usb3_hcd, i, false, flags);
 	/* Power off USB2 ports*/
 	for (i = 0; i < xhci->usb2_rhub.num_ports; i++)
 		xhci_set_port_power(xhci, xhci->main_hcd, i, false, flags);
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index f8c2b6c79..a1a17713a 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1072,7 +1072,7 @@ static u32 xhci_find_real_port_number(struct xhci_hcd *xhci,
 	struct usb_hcd *hcd;
 
 	if (udev->speed >= USB_SPEED_SUPER)
-		hcd = xhci->shared_hcd;
+		hcd = xhci_get_usb3_hcd(xhci);
 	else
 		hcd = xhci->main_hcd;
 
@@ -2362,6 +2362,8 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 		xhci->usb2_rhub.num_ports = USB_MAXCHILDREN;
 	}
 
+	xhci->needs_shared_hcd = 1;
+
 	/*
 	 * Note we could have all USB 3.0 ports, or all USB 2.0 ports.
 	 * Not sure how the USB core will handle a hub with no ports...
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 824b833ae..83a54a566 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -485,6 +485,10 @@ static void compliance_mode_recovery(struct timer_list *t)
 
 	xhci = from_timer(xhci, t, comp_mode_recovery_timer);
 	rhub = &xhci->usb3_rhub;
+	hcd = rhub->hcd;
+
+	if (!hcd)
+		return;
 
 	for (i = 0; i < rhub->num_ports; i++) {
 		temp = readl(rhub->ports[i]->addr);
@@ -498,7 +502,6 @@ static void compliance_mode_recovery(struct timer_list *t)
 					i + 1);
 			xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 					"Attempting compliance mode recovery");
-			hcd = xhci->shared_hcd;
 
 			if (hcd->state == HC_STATE_SUSPENDED)
 				usb_hcd_resume_root_hub(hcd);
@@ -611,14 +614,11 @@ static int xhci_run_finished(struct xhci_hcd *xhci)
 		xhci_halt(xhci);
 		return -ENODEV;
 	}
-	xhci->shared_hcd->state = HC_STATE_RUNNING;
 	xhci->cmd_ring_state = CMD_RING_STATE_RUNNING;
 
 	if (xhci->quirks & XHCI_NEC_HOST)
 		xhci_ring_cmd_db(xhci);
 
-	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Finished xhci_run for USB3 roothub");
 	return 0;
 }
 
@@ -693,12 +693,15 @@ int xhci_run(struct usb_hcd *hcd)
 			xhci_free_command(xhci, command);
 	}
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
-			"Finished xhci_run for USB2 roothub");
+			"Finished %s for main hcd", __func__);
 
 	xhci_create_dbc_dev(xhci);
 
 	xhci_debugfs_init(xhci);
 
+	if (!xhci->needs_shared_hcd)
+		return xhci_run_finished(xhci);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xhci_run);
@@ -980,7 +983,7 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 		return 0;
 
 	if (hcd->state != HC_STATE_SUSPENDED ||
-			xhci->shared_hcd->state != HC_STATE_SUSPENDED)
+	    (xhci->shared_hcd && xhci->shared_hcd->state != HC_STATE_SUSPENDED))
 		return -EINVAL;
 
 	/* Clear root port wake on bits if wakeup not allowed. */
@@ -997,15 +1000,18 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 		 __func__, hcd->self.busnum);
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	del_timer_sync(&hcd->rh_timer);
-	clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
-	del_timer_sync(&xhci->shared_hcd->rh_timer);
+	if (xhci->shared_hcd) {
+		clear_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
+		del_timer_sync(&xhci->shared_hcd->rh_timer);
+	}
 
 	if (xhci->quirks & XHCI_SUSPEND_DELAY)
 		usleep_range(1000, 1500);
 
 	spin_lock_irq(&xhci->lock);
 	clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
-	clear_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
+	if (xhci->shared_hcd)
+		clear_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
 	/* step 1: stop endpoint */
 	/* skipped assuming that port suspend has done */
 
@@ -1105,7 +1111,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		msleep(100);
 
 	set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
-	set_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
+	if (xhci->shared_hcd)
+		set_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
 
 	spin_lock_irq(&xhci->lock);
 
@@ -1165,7 +1172,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 
 		/* Let the USB core know _both_ roothubs lost power. */
 		usb_root_hub_lost_power(xhci->main_hcd->self.root_hub);
-		usb_root_hub_lost_power(xhci->shared_hcd->self.root_hub);
+		if (xhci->shared_hcd)
+			usb_root_hub_lost_power(xhci->shared_hcd->self.root_hub);
 
 		xhci_dbg(xhci, "Stop HCD\n");
 		xhci_halt(xhci);
@@ -1205,12 +1213,13 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 
 		xhci_dbg(xhci, "Start the primary HCD\n");
 		retval = xhci_run(hcd->primary_hcd);
-		if (!retval) {
+		if (!retval && secondary_hcd) {
 			xhci_dbg(xhci, "Start the secondary HCD\n");
 			retval = xhci_run(secondary_hcd);
 		}
 		hcd->state = HC_STATE_SUSPENDED;
-		xhci->shared_hcd->state = HC_STATE_SUSPENDED;
+		if (xhci->shared_hcd)
+			xhci->shared_hcd->state = HC_STATE_SUSPENDED;
 		goto done;
 	}
 
@@ -1248,7 +1257,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		}
 
 		if (pending_portevent) {
-			usb_hcd_resume_root_hub(xhci->shared_hcd);
+			if (xhci->shared_hcd)
+				usb_hcd_resume_root_hub(xhci->shared_hcd);
 			usb_hcd_resume_root_hub(hcd);
 		}
 	}
@@ -1267,8 +1277,10 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 	/* Re-enable port polling. */
 	xhci_dbg(xhci, "%s: starting usb%d port polling.\n",
 		 __func__, hcd->self.busnum);
-	set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
-	usb_hcd_poll_rh_status(xhci->shared_hcd);
+	if (xhci->shared_hcd) {
+		set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
+		usb_hcd_poll_rh_status(xhci->shared_hcd);
+	}
 	set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	usb_hcd_poll_rh_status(hcd);
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 8a0026ee9..2edc910d9 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1908,6 +1908,8 @@ struct xhci_hcd {
 	unsigned		hw_lpm_support:1;
 	/* Broken Suspend flag for SNPS Suspend resume issue */
 	unsigned		broken_suspend:1;
+	/* Indicates that a shared hcd is needed */
+	unsigned		needs_shared_hcd:1;
 	/* cached usb2 extened protocol capabilites */
 	u32                     *ext_caps;
 	unsigned int            num_ext_caps;
@@ -1963,6 +1965,24 @@ static inline struct usb_hcd *xhci_to_hcd(struct xhci_hcd *xhci)
 	return xhci->main_hcd;
 }
 
+static inline struct usb_hcd *xhci_get_usb3_hcd(struct xhci_hcd *xhci)
+{
+	if (xhci->shared_hcd)
+		return xhci->shared_hcd;
+
+	if (!xhci->usb2_rhub.num_ports)
+		return xhci->main_hcd;
+
+	return NULL;
+}
+
+static inline bool xhci_hcd_is_usb3(struct usb_hcd *hcd)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+
+	return hcd == xhci_get_usb3_hcd(xhci);
+}
+
 #define xhci_dbg(xhci, fmt, args...) \
 	dev_dbg(xhci_to_hcd(xhci)->self.controller , fmt , ## args)
 #define xhci_err(xhci, fmt, args...) \
-- 
2.35.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
