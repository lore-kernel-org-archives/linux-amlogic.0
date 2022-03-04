Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E805C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Mar 2022 18:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDnQSpEqRkoZwnw6UDOCfnR5NB01z/lDwg7/b5aAbUI=; b=tp1d3uAYeV4ms5
	gDQLgdk1lW/jd+EN9tjeC0OMj4AgLxY11Dk4i5RB2RrmfwRLk2/0WrutLP1f3g9YIfU4NA28pHUiR
	EI1t9IXIuvjJtusXBNfRj5BwH0HgdjYdYV2fvjaSgm3pIjtT6sVQ/TuNtl9hoOJ2xpijaRpYnVRH8
	kb2SlzETWoc5U+zwZKJIVIcPQt1plj13RaGhVLb47KvIPn5PP9TC9Nd0Tc/qRGGVWYmvvywWhUumW
	k5tUGRA4+d3UQWZ64SSDE5T86M1tGd4yoYXRB5kS9FT+OBHHusWDMRw3hLhaA10UyiTNbHM6Hq1x4
	LRjr0YZ5CiJ6p9RaxNXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQCnz-00Bex6-Eo; Fri, 04 Mar 2022 18:37:31 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQCns-00Beup-GK
 for linux-amlogic@lists.infradead.org; Fri, 04 Mar 2022 18:37:25 +0000
Received: by mail-ej1-x633.google.com with SMTP id bg10so19267970ejb.4
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Mar 2022 10:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=5cKpBLN6W/XTLPaS2O2YVfEK3xn2DNe6RJKVM5hTxZg=;
 b=crn697PXvGDcdsA8ZF/+tfvWfLcgTa2PQ3T6bOmCREqzBTXNwlyqbKXsvWmK835X0E
 FAnw96zAEqlgSvZSGVf950J9tMqAyNbmovm8JHu0aJu3lHgcMjFzMC7ruW3+M8InO9jG
 8xu6aSVB5QvMk5m61TuDiNz1gtWVK8z9h4igPggWmLQl6iEEyhDRi0cEF0Us8FsYcUCb
 DrWLRWq2uB258ubJdNOIzoc0TSUTtTH8/Xk7I6JSdPH5CAHU9W4ZY3iTZTANLsbWhsTR
 UfGSXKmTiRdedoNn9Yij0mSMzl6XMN9V16NQqzAC7M/zQgHyWS7xvjy3Q3n0TMmFEZBi
 Wf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=5cKpBLN6W/XTLPaS2O2YVfEK3xn2DNe6RJKVM5hTxZg=;
 b=a7NyDuKcWGZeuREmBruTjW9OjbaBpUSEKHBYHG431XK+dPRaOveWckLn7Fnz77WUVR
 jaf/+WJS0Bxw32WqwFvXbIb8kz3IcbqOntVThFdJrK7Qv0tp/73q7nF95bKOEk1543fb
 uqgTP9r1Qv6VCdoJeqY0+cS0GWocM1xNZOVTaRZ01xh8VrQVZ2BzYHTsfSm4Apqt74+F
 L5wETQeF1eRwre/Wf8LRXi5S9fsljux2Ym62ghMzAzx0F/H3WXYZ34ZzVvYJYNDWJlSC
 WsTQEe0vD/1Fgot1vaPg7GaWAvlvGaiTQ1nYHp/v2a25x4nLt0Z5Kask8oeTxsrP4qjm
 UyFg==
X-Gm-Message-State: AOAM5321LGZTjE2N5IVjYPGRu2LAWqZeNQ4KybbcxJEEf317Irdc7pty
 FkTke20kgkgcYl7z8scmC8c=
X-Google-Smtp-Source: ABdhPJyhy15uyUHHV4DHsA6OB66mWbELtC59alSCH1i8obW5MTpGlW2YCGdKgn25veJJgNTSPwaawA==
X-Received: by 2002:a17:906:4c4b:b0:6da:a5d9:7af9 with SMTP id
 d11-20020a1709064c4b00b006daa5d97af9mr70026ejw.336.1646419043044; 
 Fri, 04 Mar 2022 10:37:23 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9fb:2800:c56d:9b34:f61c:e318?
 (dynamic-2a01-0c23-b9fb-2800-c56d-9b34-f61c-e318.c23.pool.telefonica.de.
 [2a01:c23:b9fb:2800:c56d:9b34:f61c:e318])
 by smtp.googlemail.com with ESMTPSA id
 vl11-20020a17090730cb00b006d8121d0fc4sm1989783ejb.138.2022.03.04.10.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 10:37:22 -0800 (PST)
Message-ID: <e73bc0c1-e530-7419-0197-1b7de02c87c5@gmail.com>
Date: Fri, 4 Mar 2022 19:37:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 5/5] xhci: support omitting shared hcd if either of the root
 hubs has no ports
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
X-CRM114-CacheID: sfid-20220304_103724_581314_2F73F1C0 
X-CRM114-Status: GOOD (  12.29  )
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

If either of the root hubs has no ports, then we can get rid of
overhead like the shared hcd. A major internal change is that now
the main hcd can be USB2 or USB3.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/host/xhci-mem.c | 11 +++++------
 drivers/usb/host/xhci.c     |  9 ++++++---
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index a1a17713a..ced139583 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2362,12 +2362,11 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 		xhci->usb2_rhub.num_ports = USB_MAXCHILDREN;
 	}
 
-	xhci->needs_shared_hcd = 1;
-
-	/*
-	 * Note we could have all USB 3.0 ports, or all USB 2.0 ports.
-	 * Not sure how the USB core will handle a hub with no ports...
-	 */
+	if (xhci->usb2_rhub.num_ports && xhci->usb3_rhub.num_ports)
+		xhci->needs_shared_hcd = 1;
+	else
+		xhci_info(xhci, "USB%u root hub has no ports\n",
+			  xhci->usb2_rhub.num_ports ? 3 : 2);
 
 	xhci_create_rhub_port_array(xhci, &xhci->usb2_rhub, flags);
 	xhci_create_rhub_port_array(xhci, &xhci->usb3_rhub, flags);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 83a54a566..623901890 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5279,9 +5279,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 
 	xhci = hcd_to_xhci(hcd);
 
-	if (usb_hcd_is_primary_hcd(hcd)) {
-		xhci_hcd_init_usb2_data(xhci, hcd);
-	} else {
+	if (!usb_hcd_is_primary_hcd(hcd)) {
 		xhci_hcd_init_usb3_data(xhci, hcd);
 		return 0;
 	}
@@ -5363,6 +5361,11 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 		return retval;
 	xhci_dbg(xhci, "Called HCD init\n");
 
+	if (xhci_hcd_is_usb3(hcd))
+		xhci_hcd_init_usb3_data(xhci, hcd);
+	else
+		xhci_hcd_init_usb2_data(xhci, hcd);
+
 	xhci_info(xhci, "hcc params 0x%08x hci version 0x%x quirks 0x%016llx\n",
 		  xhci->hcc_params, xhci->hci_version, xhci->quirks);
 
-- 
2.35.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
