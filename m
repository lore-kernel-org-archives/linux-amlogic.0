Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B54C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Mar 2022 20:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=oXtqE98kEXA1zWAND1W7LbFJUWQmYSl7jwfXEtABe+o=; b=D38gcCLfaR4L5zxIhQGu7m8QVY
	6Q53nF/YU3S6Pca7xaCjdYr2UcCzeN2vdifOZAJUhM8K5/nYvQi7jHyOlPsWRPxQ943WWrDCUH0mY
	uP6cxe+68hJJutlVyD5glHy3s4Zykj3xYUQztCtGdtMifOxa3gY//JBD0p2K2fuuf1tCWc6bNKf7b
	45Uk0yaQy85AV77QzX+EM/CKddOBOr4npamSEUwrl1PZ+IjQPoOD2VQCf9EAIDEP7lCHeZysii25l
	HsIs5QfMWEaA3TLRVZxkqWTdiU3YER+d5oeX4IxPdVNKvyakDckOySGQUkCPi8xuAE+SbIQDCgIGe
	jBcf1FzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXUKX-000AZo-U1; Thu, 24 Mar 2022 20:45:13 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXUKV-000AYg-E0
 for linux-amlogic@lists.infradead.org; Thu, 24 Mar 2022 20:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648154711; x=1679690711;
 h=to:cc:references:from:subject:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zu+gYtD2+KcE/K52Or4TrL/smYI3UwGe+DLSnR2LqZw=;
 b=M5FL1WkB4t8yFXAOml9Mtg3XtxuXOo7JLs5dfwCtQ5DZTbJKo+qhsdp1
 DLeR7wZbuTEZ5qoZyqtx8ov05QiDKESfCoAiRYM9Bh3kCmA8UMXIJMcI+
 PqbLKzA8wEcrz2nowAH33MQpeGkxUg3kZPs6aUo4MQt3CsHpcnjKjbS70
 loCyfT/FCGfr8WlOql76NhyovqDjmvTVuS+SIU/Ddqn9TPogZ6r09oFhC
 ikGjt/UmOsU2WADlVETDesvi5fbFcNciQYsfWognSWFdXGYqb+Q3j17yQ
 AFIiS7tigtMaUtRW10BGgXo3kDIpz5giSxLv5YjJVKFDnkWLHLh4L1ZGx g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="240643538"
X-IronPort-AV: E=Sophos;i="5.90,208,1643702400"; d="scan'208";a="240643538"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 13:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,208,1643702400"; d="scan'208";a="649996811"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199])
 ([10.237.72.199])
 by orsmga004.jf.intel.com with ESMTP; 24 Mar 2022 13:45:05 -0700
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Alan Stern <stern@rowland.harvard.edu>, Jack Pham <quic_jackp@quicinc.com>,
 Tung Nguyen <tunguyen@apm.com>
References: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
 <cd18385f-cc94-45fc-4a39-60e05dd6031e@linux.intel.com>
 <73b6b3aa-b38e-bf28-59e0-7c58afaadf9d@gmail.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2 0/5] usb: host: xhci-plat: omit shared hcd if either of
 the root hubs has no ports
Message-ID: <7ab8d931-2b48-5297-4b2e-2d5ac0149428@linux.intel.com>
Date: Thu, 24 Mar 2022 22:46:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <73b6b3aa-b38e-bf28-59e0-7c58afaadf9d@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_134511_551078_5E2E9744 
X-CRM114-Status: GOOD (  15.66  )
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

On 24.3.2022 21.38, Heiner Kallweit wrote:
> On 24.03.2022 10:23, Mathias Nyman wrote:
>> On 17.3.2022 0.08, Heiner Kallweit wrote:
>>> I have a system with a low-cost Amlogic S905W SoC that supports USB3
>>> but has a USB3 root hub with no ports. This results in an error
>>> message and a hcd that is good for nothing. The USB2 root hub has
>>> ports and works normally.
>>> I think we can do better and omit creating a shared hcd if either of
>>> the root hubs has no ports. This series is based on discussion [0].
>>>
>>> The series works as intended for me. What I couldn't test is the case
>>> of the USB2 root hub having no ports.
>>>
>>> Follow-up to this series could be applying the xhci-plat extension
>>> to other xhci drivers.
>>>
>>
>> Thanks,
>> Patches look good but something must have changed since you submitted them.
>> I can't apply them neatly on usb-next, usb-linus, 5.17, or 5.17-rc8
>>
>>
>> On top of usb-next I get:
>> Applying: usb: host: xhci-plat: create shared hcd after having added main hcd
>> error: patch failed: drivers/usb/host/xhci-plat.c:313
>> error: drivers/usb/host/xhci-plat.c: patch does not apply
>> Patch failed at 0003 usb: host: xhci-plat: create shared hcd after having added main hcd
>>
> The series was based on linux-next. Seems you're missing 8e10548f7f48
> ("Revert "usb: host: xhci: mvebu: make USB 3.0 PHY optional for Armada 3720"").
> 
>> -Mathias
> 
> Heiner
> 

Thanks, applies fine on linux-next.

I'll add these after 5.18-rc1 to my own tree, and try them out by faking a one roothub
PCI xhci device. Patches should end up in 5.19 if all goes well.

-Mathias 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
