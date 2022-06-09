Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18564CCA473
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jun 2022 15:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RpNcXqScaUu2AkubuysNxZ2OnkiRQ0x9BBN3IP3o+sA=; b=WvMthM/m7hGd0p
	hiUy6TkWF7P4NQP8BL6iZo7zgBENgeYzh/Umou00cEJ3y9tlr6ka2Y+/xRyXtLyfiFNr81sD7BuMp
	9EHINttcFUR6e6tYWXfmgPU+EDVys8OpqsMfo5F60JWzIF+ZAaPNxvcQHzFaBw1LsVpJC8g9BPS4X
	Y3/ihv5zZPhe7TeNTNcL9ivrOd+BZBKR0isjolWyWzz7Evhg+cEabV+CVO89UDBP6LzxEbWfqg2CK
	0C6MYHx8/GB//NtNws3ockpfiBWADS0JUgzf9sCiejkEAhM4XvonHdyiJn21gyvw2KYFbxCefryuS
	DavNxbe5Rl/8qB6RR3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzKI3-002lFG-No; Thu, 09 Jun 2022 15:41:43 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzKI0-002lEQ-Vx
	for linux-amlogic@lists.infradead.org; Thu, 09 Jun 2022 15:41:42 +0000
Received: by mail-pj1-x102e.google.com with SMTP id o6-20020a17090a0a0600b001e2c6566046so27023599pjo.0
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Jun 2022 08:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bFs2IUbelOqYg14a8I3dhoLqs2Bgqc5B+E7uIXvQdIw=;
        b=CsDpq3niF7HVVJkr2AGXZrRBA27sHBwYtoUgYA3YAttQ8E4C1MRoKp477ea9D6Iudm
         dv8JPRzH+Yrxiss4TGU/7Pqq8JSqw++QgQFiPE/Ny5BUA8pvXEXgS7uIYK8eqtMTAboI
         Dc0qVEVDOFiyQfydstRFp1r2ZjK265vqAielA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bFs2IUbelOqYg14a8I3dhoLqs2Bgqc5B+E7uIXvQdIw=;
        b=LM5a/uCjpzUgbrzYLVzx7Wy5jWKK5G4FOqI4HGuXTgiVthZN9gYzil815I9NYewM8A
         CC9ZkLLiFo02MvtEfumSXqmQMLZrvn78OPVX55RifxX0jxBgScTLYYhjGoK+GFQLjxTZ
         GXRP/naS112y6AyQPUgsMgv+U1O1xLhsTuCFbL0c8nvGdYHoNuFxcTFUe0IksX9E1Dp9
         /IrOROyI32vx407kUWy47bnufsEh6YTuLlSCigZkNkN2VZdJ7wRNo6PhKTUTirFFNjKE
         2/kzDK/g4YUT4qyJT/jXvX0pKjqjJTtcXo3wH39hxd/s/iToyyjrL1l/TP2UMj1SzHNZ
         nPpA==
X-Gm-Message-State: AOAM532fleWm8ol5zSaD+Nb5JWV7XTavq1C9mOeEaHwtYH6amDa9xWqD
	Lj7+pPT16z5MiSuDnls04VlehA==
X-Google-Smtp-Source: ABdhPJz7l2shBD5wm9aHvwcmcGQmYOa3+pR/Q8WoVPHOsEwwyl8ikvu0HNhUNYVg6RRh05dpi20QQg==
X-Received: by 2002:a17:90b:4d81:b0:1e3:33e9:6677 with SMTP id oj1-20020a17090b4d8100b001e333e96677mr3948846pjb.116.1654789297913;
        Thu, 09 Jun 2022 08:41:37 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:c543:2c9:1206:951b])
        by smtp.gmail.com with UTF8SMTPSA id b1-20020a63d301000000b003fbfd5e4ddcsm9314592pgg.75.2022.06.09.08.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 08:41:37 -0700 (PDT)
Date: Thu, 9 Jun 2022 08:41:36 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: hkallweit1@gmail.com, gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	quic_jackp@quicinc.com, tunguyen@apm.com,
	linux-amlogic@lists.infradead.org
Subject: Re: [RFT PATCH] xhci: Fix null pointer dereference in resume if xhci
 has only one roothub
Message-ID: <YqIUsP437G8g75YS@google.com>
References: <c4e9f0d8-c736-1153-3f32-b85e7024b3fe@linux.intel.com>
 <20220609120336.831533-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220609120336.831533-1-mathias.nyman@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_084141_108741_BD971C76 
X-CRM114-Status: GOOD (  19.67  )
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

On Thu, Jun 09, 2022 at 03:03:36PM +0300, Mathias Nyman wrote:
> In the re-init path xhci_resume() passes 'hcd->primary_hcd' to hci_init(),
> however this field isn't initialized by __usb_create_hcd() for a HCD
> without secondary controller.
> 
> xhci_resume() is called once per xHC device, not per hcd, so the extra
> checking for primary hcd can be removed.
> 
> Fixes: e0fe986972f5 ("usb: host: xhci-plat: prepare operation w/o shared hcd")
> Reported-by: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/host/xhci.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index f0ab63138016..9ac56e9ffc64 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1107,7 +1107,6 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
>  {
>  	u32			command, temp = 0;
>  	struct usb_hcd		*hcd = xhci_to_hcd(xhci);
> -	struct usb_hcd		*secondary_hcd;
>  	int			retval = 0;
>  	bool			comp_timer_running = false;
>  	bool			pending_portevent = false;
> @@ -1214,23 +1213,19 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
>  		 * first with the primary HCD, and then with the secondary HCD.
>  		 * If we don't do the same, the host will never be started.
>  		 */
> -		if (!usb_hcd_is_primary_hcd(hcd))
> -			secondary_hcd = hcd;
> -		else
> -			secondary_hcd = xhci->shared_hcd;
> -
>  		xhci_dbg(xhci, "Initialize the xhci_hcd\n");
> -		retval = xhci_init(hcd->primary_hcd);
> +		retval = xhci_init(hcd);
>  		if (retval)
>  			return retval;
>  		comp_timer_running = true;
>  
>  		xhci_dbg(xhci, "Start the primary HCD\n");

Is the log still correct? IIUC this now isn't necessarily the primary HCD.

> -		retval = xhci_run(hcd->primary_hcd);
> -		if (!retval && secondary_hcd) {
> +		retval = xhci_run(hcd);
> +		if (!retval && xhci->shared_hcd) {
>  			xhci_dbg(xhci, "Start the secondary HCD\n");

ditto

> -			retval = xhci_run(secondary_hcd);
> +			retval = xhci_run(xhci->shared_hcd);
>  		}
> +
>  		hcd->state = HC_STATE_SUSPENDED;
>  		if (xhci->shared_hcd)
>  			xhci->shared_hcd->state = HC_STATE_SUSPENDED;

Tested-by: Matthias Kaehlcke <mka@chromium.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
