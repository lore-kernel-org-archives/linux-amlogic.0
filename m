Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D778CCA47B
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jun 2022 12:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=raxv3mglslBTCocHLWwpz5yDnd3TzZLydau5ykw5HVo=; b=XYMLaSFVsAbmRW
	+oTwZ2ugQZTY27BBy5QIWEndPbCZ3YuOJhe5FsITIum/uSK7xTY2aBGlqWzqHlDDVaD8D0nT9edeo
	JDiJy243i9Sf4jzq19qOgNqvVZ9eD7hAIME6pP3rvSVqVYf76gwF2h3ZoHRI1fOoyvA7uEuR0ocGj
	70ticRMcJjT0PXh7s6V58iEx1BJlQyHEjMGTtTmfu+OmCRNPn7y5WQv5I81Qlq4VzOfXSlQ9i96a2
	muXY7GqCfEDJQWhtvOKlp9JiXbIPrS21BT7cZbUe0USIAouLP4pC8hZARk6jOyOPBvEvRTqNrpMEw
	h69vqT+lAjByyHXvYkWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzH3I-001daP-AZ; Thu, 09 Jun 2022 12:14:16 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGs5-001Ydw-Iw
	for linux-amlogic@lists.infradead.org; Thu, 09 Jun 2022 12:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654776161; x=1686312161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cTic0mTIKuxHFwLGK2iox4ar6809DO3DQ2zz48eDte4=;
  b=WRaSxrdkkzOUDdpPt/wCFEs5UU87xi86GbxuSuIdMr7MjgEOfYtbRBjZ
   8MDV8NlXxPVEOl0l9wDjWCZel7MOlxYO9MmBeZMQ2lAMgb9btXHcOy119
   sXaaAmiSQ3WI/JZgKS7xva83K4x6se3G03tgs6Fm/nExXxEGOyVMvNlSi
   BNcSKEcvpLRhO6mrgD2WzZN8UwXdVilR4CGWHazN0DD9ocLEUDuG8e1tv
   qnm9Qtr2wZi36XO8YRRfD6NK6lRqxhbKhDQBMF/IAvFQiqHhUARHYV0ZC
   VavUvInYZsGFreVm1l7sEAr8GsP5fZvK+fEW48I0Giml2zXTLdAPj3jc1
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="257081964"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="257081964"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 05:02:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="637484776"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 09 Jun 2022 05:02:36 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: mka@chromium.org,
	hkallweit1@gmail.com
Cc: <gregkh@linuxfoundation.org>,
	<stern@rowland.harvard.edu>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	<linux-usb@vger.kernel.org>,
	quic_jackp@quicinc.com,
	tunguyen@apm.com,
	linux-amlogic@lists.infradead.org
Subject: [RFT PATCH] xhci: Fix null pointer dereference in resume if xhci has only one roothub
Date: Thu,  9 Jun 2022 15:03:36 +0300
Message-Id: <20220609120336.831533-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <c4e9f0d8-c736-1153-3f32-b85e7024b3fe@linux.intel.com>
References: <c4e9f0d8-c736-1153-3f32-b85e7024b3fe@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_050241_699980_B3C9E8BF 
X-CRM114-Status: GOOD (  11.82  )
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

In the re-init path xhci_resume() passes 'hcd->primary_hcd' to hci_init(),
however this field isn't initialized by __usb_create_hcd() for a HCD
without secondary controller.

xhci_resume() is called once per xHC device, not per hcd, so the extra
checking for primary hcd can be removed.

Fixes: e0fe986972f5 ("usb: host: xhci-plat: prepare operation w/o shared hcd")
Reported-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index f0ab63138016..9ac56e9ffc64 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1107,7 +1107,6 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 {
 	u32			command, temp = 0;
 	struct usb_hcd		*hcd = xhci_to_hcd(xhci);
-	struct usb_hcd		*secondary_hcd;
 	int			retval = 0;
 	bool			comp_timer_running = false;
 	bool			pending_portevent = false;
@@ -1214,23 +1213,19 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
 		 * first with the primary HCD, and then with the secondary HCD.
 		 * If we don't do the same, the host will never be started.
 		 */
-		if (!usb_hcd_is_primary_hcd(hcd))
-			secondary_hcd = hcd;
-		else
-			secondary_hcd = xhci->shared_hcd;
-
 		xhci_dbg(xhci, "Initialize the xhci_hcd\n");
-		retval = xhci_init(hcd->primary_hcd);
+		retval = xhci_init(hcd);
 		if (retval)
 			return retval;
 		comp_timer_running = true;
 
 		xhci_dbg(xhci, "Start the primary HCD\n");
-		retval = xhci_run(hcd->primary_hcd);
-		if (!retval && secondary_hcd) {
+		retval = xhci_run(hcd);
+		if (!retval && xhci->shared_hcd) {
 			xhci_dbg(xhci, "Start the secondary HCD\n");
-			retval = xhci_run(secondary_hcd);
+			retval = xhci_run(xhci->shared_hcd);
 		}
+
 		hcd->state = HC_STATE_SUSPENDED;
 		if (xhci->shared_hcd)
 			xhci->shared_hcd->state = HC_STATE_SUSPENDED;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
