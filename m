Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF174C43334
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jun 2022 15:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JywhfNVScxbk/vMhKEfvqurQUg7dMdJMqPjILNFx0wY=; b=qUJrXE7AqUy5UA
	Xtr8VQIDOUe2Qyq3m8feGrlStwrz7lD12PLGYgHIFMlgZKyULHvPnpuiEPvmXbXr5MtL93LgWmKYP
	yn2FpAB3BnFm2zA8iIgVnRRgxkwyoYBzIIgOiqExUIOq3Y/My9ZISXZl742IckVRv7bCtdTToM8es
	ejlnYengP6EcoGztQDL/90gSqk+M7MxViVTFAb3TJhoKtObTjPYWoY9zNO3TT1PXFz3aEZt/bXHIH
	B/sZv7AssZVxhA7sSMoCTbOBjzKEepM4IlQoIENtYHAcfv9ft2JE14ej8fJVSaBg0W1tuRnm2ajKx
	t9xvnu7FagMRwu8anwqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzJo6-002f9x-0P; Thu, 09 Jun 2022 15:10:46 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzJo2-002f7K-PM
	for linux-amlogic@lists.infradead.org; Thu, 09 Jun 2022 15:10:44 +0000
Received: by mail-pl1-x62b.google.com with SMTP id s14so20465901plk.8
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Jun 2022 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5VT2futDVhu4E/sa0g3JDic7/VGpUjrjykyzU3l/TBc=;
        b=ZqWoVIg8dshjfam3rtC7MpAhtZbjJ2n5RcEdwivWcCDxMOTCo4hKSfWJrnOXlUGONE
         hILH5oTys0B/4XEqdUj/7X1Stwkyv8Crpbl/Ly6ZhnzErVWB988G2KTkK7nUdMB92mo8
         g5fDXPqACmXbGwQIdCAWUZq5uy4G6+JD0nOAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5VT2futDVhu4E/sa0g3JDic7/VGpUjrjykyzU3l/TBc=;
        b=EcuuG7zrS8TVcemBgiVlp7J2UtRj/Ue3uYSt0rpG8eTTyuUTqIUKJNdeTO4qXxPk+g
         aDy1tF8gCo3HIOVFNpKSrbWHyB9+DdZUyDYiTin+5z9thL2AyQYShKJLjp2DDmczON4H
         PI+GhpGnMNP+bRovNgAv6LI2++KVC4cjZkQG34l4UrLjRejJf09v37Ud8+QhVvy+1kq0
         goJT70HFmjwE88pwN6mEqIJJB8A2GcCyzLZ99Qm3EZOyH2xmwODWAB2BcdBh5bC8HHeC
         L1YA1e7H3Iopi7Stm9SK7nLNktqyFA3BpBlIkjHHFTSImLvKeGHWb/GMPNr0rgTWtdCq
         jPZg==
X-Gm-Message-State: AOAM53094Jb9lOowptXS/U6+OsL71QLQ1DehVhXt43ubC1uS41Gnh0kq
	yfo65yewQ3TygWFmzN/jXEgQjQ==
X-Google-Smtp-Source: ABdhPJz+toNg3XCJpMrffUYMOVPhHHDrKXeB2K+KzyaYjyMELW4/SVsdHzcMh6L8QgJPTkU/3Syu7A==
X-Received: by 2002:a17:902:e5ca:b0:167:4e08:a63a with SMTP id u10-20020a170902e5ca00b001674e08a63amr32207277plf.69.1654787439919;
        Thu, 09 Jun 2022 08:10:39 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:c543:2c9:1206:951b])
        by smtp.gmail.com with UTF8SMTPSA id iy9-20020a170903130900b0015e8d4eb243sm13589578plb.141.2022.06.09.08.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 08:10:39 -0700 (PDT)
Date: Thu, 9 Jun 2022 08:10:38 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux USB Mailing List <linux-usb@vger.kernel.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Jack Pham <quic_jackp@quicinc.com>, Tung Nguyen <tunguyen@apm.com>
Subject: Re: [PATCH v2 4/5] usb: host: xhci-plat: prepare operation w/o
 shared hcd
Message-ID: <YqINbqlrwICtVGfD@google.com>
References: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
 <506113fe-5bd9-bdd0-7858-2b702ca32d53@gmail.com>
 <YqEMzQgqG16gwFUq@google.com>
 <c4e9f0d8-c736-1153-3f32-b85e7024b3fe@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c4e9f0d8-c736-1153-3f32-b85e7024b3fe@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_081042_888452_62147702 
X-CRM114-Status: GOOD (  12.16  )
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

On Thu, Jun 09, 2022 at 02:38:45PM +0300, Mathias Nyman wrote:
> On 8.6.2022 23.55, Matthias Kaehlcke wrote:
> > Hi,
> > 
> > with v5.19-rc1 (which includes this patch) I encounter a NULL pointer
> > exception during system resume on a SC7280 board, which has an
> > USB2-only HCD:
> > 
> ...
> > 
> > In the re-init path xhci_resume() passes 'hcd->primary_hcd' to hci_init(),
> > however this field isn't initialized by __usb_create_hcd() for a HCD
> > without secondary controller.
> 
> Thanks for debugging this, I'll write a patch for it.
> Can you try it out?

Sure!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
