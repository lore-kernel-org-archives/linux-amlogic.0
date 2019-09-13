Return-Path: <SRS0=L2Ze=XI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA75DC49ED7
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2019 15:33:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C284420693
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2019 15:33:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VoIwMWqo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C284420693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nvjPLfsRnZuqnmC17VHDgl74+Q8tFSk9Q9QW0xc5qBk=; b=VoIwMWqoTgCNevFgM33zipxCt
	wWFH1S6cZ13TFlYgfe4Ukj2dHUbqGooSCOyo6y3QfEeHhGs6mwcQPrtA939jZusYGzfkolbQYGMAr
	R/F2IXw3OCq5yc+19A9UWqSiR11aqZgI+l6BzB6eplBUY9sifyPBbKFXpxuqZf5AlEbO9iSoddMd8
	JTBWhKZe3Mz+/4PoBXc/BovZwSUkac8xqfYiynlHVxxW2nb3Y7YL9nsCCJloR9fvWM5MthvFzUQbu
	ubBj9od5czcDhragGN0ZuDy/2Ulxkg/CIlu9dIgDVSoHH/JbpxQ+pFR2jlyosDdWLViwvwdjWBacf
	iA0GK2mYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8nZF-0002qv-O4; Fri, 13 Sep 2019 15:33:02 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8nZA-0002q4-Qi; Fri, 13 Sep 2019 15:32:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB2A21000;
 Fri, 13 Sep 2019 08:32:55 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2CC43F67D;
 Fri, 13 Sep 2019 08:32:50 -0700 (PDT)
Subject: Re: KASAN: slab-out-of-bounds Read in handle_vmptrld
To: Paolo Bonzini <pbonzini@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <000000000000a9d4f705924cff7a@google.com>
 <87lfutei1j.fsf@vitty.brq.redhat.com>
 <5218e70e-8a80-7c5f-277b-01d9ab70692a@redhat.com>
 <20190913044614.GA120223@kroah.com>
 <db02a285-ad1d-6094-6359-ba80e6d3f2e0@redhat.com>
 <20190913130226.GB403359@kroah.com>
 <6a0ec3a2-2a52-f67a-6140-e0a60874538a@redhat.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <462660f4-1537-cece-b55f-0ceba0269eb8@arm.com>
Date: Fri, 13 Sep 2019 16:32:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6a0ec3a2-2a52-f67a-6140-e0a60874538a@redhat.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_083256_909473_C4CB4B5A 
X-CRM114-Status: GOOD (  15.60  )
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
Cc: mark.rutland@arm.com, wanpengli@tencent.com, kvm@vger.kernel.org,
 narmstrong@baylibre.com, catalin.marinas@arm.com, will.deacon@arm.com,
 rkrcmar@redhat.com, hpa@zytor.com, khilman@baylibre.com, joro@8bytes.org,
 x86@kernel.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org,
 syzbot <syzbot+46f1dd7dbbe2bfb98b10@syzkaller.appspotmail.com>,
 devicetree@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 robh+dt@kernel.org, bp@alien8.de, linux-amlogic@lists.infradead.org,
 tglx@linutronix.de, Dmitry Vyukov <dvyukov@google.com>, jmattson@google.com,
 USB list <linux-usb@vger.kernel.org>, linux-kernel@vger.kernel.org,
 sean.j.christopherson@intel.com, carlo@caione.org,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 13/09/2019 16:01, Paolo Bonzini wrote:
> On 13/09/19 15:02, Greg Kroah-Hartman wrote:
>> Look at linux-next, we "should" have fixed up hcd_buffer_alloc() now to
>> not need this type of thing.  If we got it wrong, please let us know and
>> then yes, a fix like this would be most appreciated :)
> 
> I still see
> 
> 	/* some USB hosts just use PIO */
> 	if (!hcd_uses_dma(hcd)) {
> 		*dma = ~(dma_addr_t) 0;
> 		return kmalloc(size, mem_flags);
> 	}
> 
> in linux-next's hcd_buffer_alloc and also in usb.git's usb-next branch.
>   I also see the same
> 
> 	if (remap_pfn_range(vma, vma->vm_start,
> 			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
> 			size, vma->vm_page_prot) < 0) {
> 		...
> 	}
> 
> in usbdev_mmap.  Of course it's possible that I'm looking at the wrong
> branch, or just being dense.

Oh, that bit of usbdev_mmap() is already known to be pretty much totally 
bogus for various reasons - there have been a few threads about it, of 
which I think [1] is both the most recent and the most informative. 
There was another patch[2], but that might have stalled (and might need 
reworking with additional hcd_uses_dma() checks anyway).

Robin.

[1] 
https://lore.kernel.org/linux-arm-kernel/20190808084636.GB15080@priv-mua.localdomain/
[2] 
https://lore.kernel.org/linux-usb/20190801220134.3295-1-gavinli@thegavinli.com/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
