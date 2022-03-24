Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1E6C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Mar 2022 09:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WeGIJJNtoT5fuc9Tb8j2U86Z9X6iChgw7UDYQUBmSTY=; b=LxB1amY8utrXBg6hoEOMIskKpV
	TU4stpmQVyBPlJHg0dyq8i27wulhMhYIe0VB7p3ggzcsyGcp/hzO2hZ8ZUklR1G8YITyxDKEiAU/r
	wMRUc0KMEORd35RbRlMfIFNyIHfoXz9bq3gDyORYFUYrGibcGVlmVPvlSHIb7WIOGA8sDHu9riVZd
	umXxxiMJQvyoK+RUYPHrz2s962Nmi3rsEW+Bwmt5BuKPabcx+rnP2+6or7YY9tadl9pj+h4wW3Eqm
	/eZzAKZWlGggwZ84K4r9g05WBZykzPsA0Vc2aannJnIOCtb/K41Rg7DTq6LLJoSONlAMQrkHE6KPT
	YQsqM27g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXJfV-00G7zi-PU; Thu, 24 Mar 2022 09:22:09 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXJfS-00G7yW-PC
 for linux-amlogic@lists.infradead.org; Thu, 24 Mar 2022 09:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648113726; x=1679649726;
 h=to:cc:references:from:subject:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=OG6tWMaxkXMVWubRqz2gQ53VryJ6+Cepfme6f0+32QM=;
 b=hT2qjVu+zlOpFYhcQauj0fNtbtfCk1zqgPGTsXFPhCZ26oZPs6n+pGEZ
 NZW3FMz/3i9BjwddGLN9rlqcLPs7cC3DvRFjfdf6DyQXgYhZEkAts73WK
 D/OGxE1p44ultiKXcOI4soMvzs+EIwaejIIdv/xw4u4MtfJzzBFQExlzw
 hPdCaLGNWPo5Mcu4/x5dtMRwRPuPjxD2PsAakHMlzGYbw+dl2npdarvkK
 ZEYd+e5yjNf5yfD6FD89QLbmYigC6ZjZnhERNmSd/iZWXP+r/z78E+Q9D
 jjtwue9FD6Ftq+9GmXoHPmcg489ZQIDfIXrLyI52fF4puR0a+0z6Q2Wt3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="240486029"
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="240486029"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 02:22:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="649781191"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
 by orsmga004.jf.intel.com with ESMTP; 24 Mar 2022 02:22:02 -0700
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Alan Stern <stern@rowland.harvard.edu>, Jack Pham <quic_jackp@quicinc.com>,
 Tung Nguyen <tunguyen@apm.com>
References: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2 0/5] usb: host: xhci-plat: omit shared hcd if either of
 the root hubs has no ports
Message-ID: <cd18385f-cc94-45fc-4a39-60e05dd6031e@linux.intel.com>
Date: Thu, 24 Mar 2022 11:23:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_022206_904627_0725F754 
X-CRM114-Status: GOOD (  15.35  )
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

On 17.3.2022 0.08, Heiner Kallweit wrote:
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
> Follow-up to this series could be applying the xhci-plat extension
> to other xhci drivers.
> 

Thanks,
Patches look good but something must have changed since you submitted them.
I can't apply them neatly on usb-next, usb-linus, 5.17, or 5.17-rc8


On top of usb-next I get:
Applying: usb: host: xhci-plat: create shared hcd after having added main hcd
error: patch failed: drivers/usb/host/xhci-plat.c:313
error: drivers/usb/host/xhci-plat.c: patch does not apply
Patch failed at 0003 usb: host: xhci-plat: create shared hcd after having added main hcd

-Mathias

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
