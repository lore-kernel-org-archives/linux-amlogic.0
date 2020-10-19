Return-Path: <SRS0=NVL0=D2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AFAC433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Oct 2020 17:07:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A06F6206E9
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Oct 2020 17:07:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T/CREUps";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wILwX6Ig"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A06F6206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QRtBFDgIDWeNMqhH8zxJ7L8B7aR4ZT8YjaTQ4dWRH5g=; b=T/CREUpsfva8IWDzwuVTel+vDG
	OBLrg1+hInoln0rQg6AtRl8NXNdPsbFRbA99mhyp7DOaCpmUH9xbl0wTjEK2VlWH44Sttf5D7ABll
	vqUtioyPMD/wpnMhFN5tflwpKs/eAiuTqPqqDTRPZ83LNbXPDjARCYwqxT7EAp/I7ASYpxjylA+6J
	774uOkIDTEel+HXsvtZDmlJohdSu/COv5Bh8rieE9KkcqfqDiKRFP1Crc2XAFIbnBxVylZ04zDWJc
	/1KOOqeon9X4ohoGJ54Pp4/G6N73NsVYpZFcmBvDL+l6kzgUnguroKHKkfT1Ctsy+vkmKZFEBbnhg
	2WPg/mCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUYd1-00083u-N1; Mon, 19 Oct 2020 17:07:23 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUYcz-00082h-3p
 for linux-amlogic@lists.infradead.org; Mon, 19 Oct 2020 17:07:22 +0000
Received: by mail-wm1-x343.google.com with SMTP id e2so267619wme.1
 for <linux-amlogic@lists.infradead.org>; Mon, 19 Oct 2020 10:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=alpewE00yXzmI7Wi7PY5Ma42ivdK56tHgSnMNmqIKdI=;
 b=wILwX6IgS/QRLVq6y+au7F8UPimahLdD0MUritsRMgZPZe7QxTBektepkNW4nJC1Ud
 hqdWAh7+pp3jnH8nbWH9wtEqgMzhdGcEDTyPyrmXxZT2GNB5hDtP1FEpZcpF3lrIpSxo
 vnGcVYsA+uGXxVgcctK3oX84iRf+NZDgXXo84TDctnuYuPGNXeFkru+I3ZL5d0U2W7DA
 hp52U6mMyfXKzE2f9OkTZ8n/poUrORTLObezlhihdhg83hKXhzIXMO36PmjeCpoZoHcn
 Jq8XCSMcsi/xdo62pOeCQHGhRMMJepDIcnAjT02chIaUL11OYe7TVJgf70r1d6vsFg7b
 pfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=alpewE00yXzmI7Wi7PY5Ma42ivdK56tHgSnMNmqIKdI=;
 b=fDg6TKTLRaX1LppvKbMUkol5K88Zlbl81nUelQtHkCNM0NbKZMgwVi2OWQx7e+7X/y
 cm3vIyas8pScxyEnoJBiEH4HQMGkDEHeOuoE2R/X1272Xtt+YyF8um8gfILptRpFaRhJ
 anN+SrJ6Nds1QlytbrA7pfMc1/26Ef2bcLgDORRpuuLkglCLuguHiNwhRXddM8Cw6xgD
 keuWDTqE3h2XV+nKrS9+awPXBme8mm4jwc2CReJBs/WlOxcgTHMtf/9wXYAgG7U/bBQe
 3cVmRTvLqXYBmWoYgNXLfrQyUqFmCY6Y33dgn7M0YSIKKE5344IDS4SAoNiFGGHOE2w1
 UqVw==
X-Gm-Message-State: AOAM531DonIKdnvfygJ09PEp8CX6NlU0nYEg/jARZ4ZZygdxfh5IpFgw
 nEXKhNYhwen3MC3rMUabId4/uQ==
X-Google-Smtp-Source: ABdhPJxXUESfjuL3zj5bPTCDGG2II3qWxLcfUVSBfsea8i53fj8i820FBG0svJsw5lYqPrpSxtjdIQ==
X-Received: by 2002:a1c:55c1:: with SMTP id j184mr208272wmb.180.1603127238604; 
 Mon, 19 Oct 2020 10:07:18 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id p9sm242544wma.12.2020.10.19.10.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 10:07:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Oliver Neukum <oneukum@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: cdc-acm: fix cooldown mechanism
Date: Mon, 19 Oct 2020 19:07:02 +0200
Message-Id: <20201019170702.150534-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_130721_258013_BB801CD4 
X-CRM114-Status: GOOD (  19.12  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pascal Vizeli <pascal.vizeli@nabucasa.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Commit a4e7279cd1d1 ("cdc-acm: introduce a cool down") is causing
regression if there is some USB error, such as -EPROTO.

This has been reported on some samples of the Odroid-N2 using the Combee II
Zibgee USB dongle.

> struct acm *acm = container_of(work, struct acm, work)

is incorrect in case of a delayed work and causes warnings, usually from
the workqueue:

> WARNING: CPU: 0 PID: 0 at kernel/workqueue.c:1474 __queue_work+0x480/0x528.

When this happens, USB eventually stops working completely after a while.
Also the ACM_ERROR_DELAY bit is never set, so the cooldown mechanism
previously introduced cannot be triggered and acm_submit_read_urb() is
never called.

This changes makes the cdc-acm driver use a single delayed work, fixing the
pointer arithmetic in acm_softint() and set the ACM_ERROR_DELAY when the
cooldown mechanism appear to be needed.

Fixes: a4e7279cd1d1 ("cdc-acm: introduce a cool down")
Reported-by: Pascal Vizeli <pascal.vizeli@nabucasa.com>
Cc: Oliver Neukum <oneukum@suse.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 Hi,

 I tried to fix problem introduced by
 commit a4e7279cd1d1 ("cdc-acm: introduce a cool down") while keeping the
 original intent, or at least what I understand of it.

 A plain revert of the original commit also works for me.

 drivers/usb/class/cdc-acm.c | 12 +++++-------
 drivers/usb/class/cdc-acm.h |  3 +--
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index f1a9043bdfe5..172cd2d21914 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -507,6 +507,7 @@ static void acm_read_bulk_callback(struct urb *urb)
 			"%s - cooling babbling device\n", __func__);
 		usb_mark_last_busy(acm->dev);
 		set_bit(rb->index, &acm->urbs_in_error_delay);
+		set_bit(ACM_ERROR_DELAY, &acm->flags);
 		cooldown = true;
 		break;
 	default:
@@ -532,7 +533,7 @@ static void acm_read_bulk_callback(struct urb *urb)
 
 	if (stopped || stalled || cooldown) {
 		if (stalled)
-			schedule_work(&acm->work);
+			schedule_delayed_work(&acm->dwork, 0);
 		else if (cooldown)
 			schedule_delayed_work(&acm->dwork, HZ / 2);
 		return;
@@ -562,13 +563,13 @@ static void acm_write_bulk(struct urb *urb)
 	acm_write_done(acm, wb);
 	spin_unlock_irqrestore(&acm->write_lock, flags);
 	set_bit(EVENT_TTY_WAKEUP, &acm->flags);
-	schedule_work(&acm->work);
+	schedule_delayed_work(&acm->dwork, 0);
 }
 
 static void acm_softint(struct work_struct *work)
 {
 	int i;
-	struct acm *acm = container_of(work, struct acm, work);
+	struct acm *acm = container_of(work, struct acm, dwork.work);
 
 	if (test_bit(EVENT_RX_STALL, &acm->flags)) {
 		smp_mb(); /* against acm_suspend() */
@@ -584,7 +585,7 @@ static void acm_softint(struct work_struct *work)
 	if (test_and_clear_bit(ACM_ERROR_DELAY, &acm->flags)) {
 		for (i = 0; i < acm->rx_buflimit; i++)
 			if (test_and_clear_bit(i, &acm->urbs_in_error_delay))
-					acm_submit_read_urb(acm, i, GFP_NOIO);
+				acm_submit_read_urb(acm, i, GFP_KERNEL);
 	}
 
 	if (test_and_clear_bit(EVENT_TTY_WAKEUP, &acm->flags))
@@ -1352,7 +1353,6 @@ static int acm_probe(struct usb_interface *intf,
 	acm->ctrlsize = ctrlsize;
 	acm->readsize = readsize;
 	acm->rx_buflimit = num_rx_buf;
-	INIT_WORK(&acm->work, acm_softint);
 	INIT_DELAYED_WORK(&acm->dwork, acm_softint);
 	init_waitqueue_head(&acm->wioctl);
 	spin_lock_init(&acm->write_lock);
@@ -1562,7 +1562,6 @@ static void acm_disconnect(struct usb_interface *intf)
 	}
 
 	acm_kill_urbs(acm);
-	cancel_work_sync(&acm->work);
 	cancel_delayed_work_sync(&acm->dwork);
 
 	tty_unregister_device(acm_tty_driver, acm->minor);
@@ -1605,7 +1604,6 @@ static int acm_suspend(struct usb_interface *intf, pm_message_t message)
 		return 0;
 
 	acm_kill_urbs(acm);
-	cancel_work_sync(&acm->work);
 	cancel_delayed_work_sync(&acm->dwork);
 	acm->urbs_in_error_delay = 0;
 
diff --git a/drivers/usb/class/cdc-acm.h b/drivers/usb/class/cdc-acm.h
index cd5e9d8ab237..b95ff769072e 100644
--- a/drivers/usb/class/cdc-acm.h
+++ b/drivers/usb/class/cdc-acm.h
@@ -112,8 +112,7 @@ struct acm {
 #		define ACM_ERROR_DELAY	3
 	unsigned long urbs_in_error_delay;		/* these need to be restarted after a delay */
 	struct usb_cdc_line_coding line;		/* bits, stop, parity */
-	struct work_struct work;			/* work queue entry for various purposes*/
-	struct delayed_work dwork;			/* for cool downs needed in error recovery */
+	struct delayed_work dwork;		        /* work queue entry for various purposes */
 	unsigned int ctrlin;				/* input control lines (DCD, DSR, RI, break, overruns) */
 	unsigned int ctrlout;				/* output control lines (DTR, RTS) */
 	struct async_icount iocount;			/* counters for control line changes */
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
