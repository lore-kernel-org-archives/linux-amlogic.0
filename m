Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B739C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Mar 2022 14:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=J1407Bo5yp7GalRdjxXe0IJd/LCxUmm1LceU733ugWE=; b=L6O+pv9YI479OaXGREJLIiXU50
	feS5YDqQXASs+fgreyyLZn6Z1nET21avw/Ybdgi7J+LKhnLfbUQLai6p6/GDi4AEzKT1kF/RscjCT
	dTqQow8aeqmQKVn+S3bAWkv/S6lLg6Y3X8PgUB7iTF9NXQH9MjdgeMIAvTdVCJeQ7eQ9/rOjQxJv9
	lT+Iw+ONdEVHq07yagu2WNh/aW/kfyN0Nv6jpJKjluXQAgEZjB3QniJODJAi+LE3Ybwg6FcciqUbk
	JjZJQP2dgatI5RypHYWDoNZhPsz4B1jVsoP09tPFdlPpe9kybx5tZ/3UIpZvf+jSsR3UkEN1C9KCy
	WNyAh7dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRarI-004mDh-JX; Tue, 08 Mar 2022 14:30:40 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRarF-004mBe-Ob
 for linux-amlogic@lists.infradead.org; Tue, 08 Mar 2022 14:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646749837; x=1678285837;
 h=to:cc:references:from:subject:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=2Sps8X1HSq/Qaa9m9NyJst+99og+nqY0X6PFuAEuS8I=;
 b=cnP1Dt9xVwwuNCZPG3c9eGghXC+6e9ObLHbbmCMm+sT/8o2ToqND44mJ
 BXXrYQ5nGzYFrYrbSIdtPTeZHy1WyafUCyy0ECe5KhZfAq9MMv8DT+0lR
 vMgX9vFHhKRGh41HdIuxMdMNXRQlNfumhP/AVBYrNynA+57dOVyUX7Ep0
 fjHvgb2EYBwHLypNyxWE554p//SpLYN4jb2sP64bW0Ev9zC9ZSj93CZaj
 TQ103uzAfH0ge4i8alaRIakyDq9qXX3CMPEahLIWrb63SaYuo8voXXgUz
 Mf12v9rwmj5Fziwdmk9RPEZEyhsDY+N58qGDcJqdlc/Eo3qxp1wgrf/dl Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="279407985"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="279407985"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:29:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="578005703"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
 by orsmga001.jf.intel.com with ESMTP; 08 Mar 2022 06:29:55 -0800
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Alan Stern <stern@rowland.harvard.edu>, Jack Pham <quic_jackp@quicinc.com>,
 Tung Nguyen <tunguyen@apm.com>
References: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 0/5] usb: host: xhci-plat: omit shared hcd if either of
 the root hubs has no ports
Message-ID: <475816a5-8349-67c4-1d1f-c1b64149bab5@linux.intel.com>
Date: Tue, 8 Mar 2022 16:31:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_063037_852484_6C1DEF2F 
X-CRM114-Status: GOOD (  18.66  )
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

On 4.3.2022 20.32, Heiner Kallweit wrote:
> I have a system with a low-cost Amlogic S905W SoC that supports USB3
> but has a USB3 root hub with no ports. This results in an error
> message and a hcd that is good for nothing. The USB2 root hub has
> ports and works normally.
> I think we can do better and omit creating a shared hcd if either of
> the root hubs has no ports. This series is based on discussion [0].
> 
> The series works as intended for me. What I couldn't test is the case
> of the USB2 root hub having no ports.
> 
> [0] https://www.spinics.net/lists/linux-usb/msg223416.html
> 

Thanks for the series. Big picture looks good.

Some minor concerns, for example how the generic xhci code now assumes
we can start the controller (run) after adding the primary hcd if only
one roothub has ports, and assumes the secondary hcd won't be added.

After this series this is true for controllers using xhci-plat.c,
but not for mediatek, tegra and all PCI xhci controllers.
I'll comment that patch with more info.

I'll see if I can try to fake a pci xhci controller to try this series out.

Thanks
-Mathias


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
