Return-Path: <SRS0=L2Ze=XI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683B4C49ED7
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2019 13:07:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C5D2208C0
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2019 13:07:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BYuhZ4fq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DmLuAT95"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C5D2208C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKw+WQ4GwVpIYPWp7jux808WWd7YTnPdxOL0GKDTuYA=; b=BYuhZ4fq54FnFD
	/vEG5bD09eQbrJNOOLKz1J61xw8+gniTKkIRsUWVs/tDFL65J8tv5KtlHV3JlpyGvuH7hr7WdbcEM
	tZQaWwgIJKkIYRvLMOsfrUjOasz2HAsJqoxNsBaDX/qgFa/0GtubL9RAwsD8pIiUtiTs7VT/vj0HJ
	OC1j/HyT1tS4OP5noGZrd/O7aGKuq+2m9LbQJOPh+Iz+ZumVpmgpqy0UCLEVipY7Ym6CsA6Kccg6C
	ZjkGCsgBqdJ2XDwcbFcwWcYp4869gMs/zkZbA6lyW+eewkRXfPkC1dg2jjK6AX0RHnunSfY934rcD
	SyAhLB2F/IG0nVTeWXWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8lHx-000296-DL; Fri, 13 Sep 2019 13:07:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8lHq-00026T-EQ; Fri, 13 Sep 2019 13:06:58 +0000
Received: from localhost (unknown [104.132.45.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C6A18206A5;
 Fri, 13 Sep 2019 13:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568380012;
 bh=qO9j38kTvRaom9Dympgw2PZ3SD1mqzGyLVqm6MafZvk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DmLuAT95jpNYwx9mcqkIJBKYgBFryoL4/2NE56owCBA/8l9guoozSKta/pl1FKLao
 Ee00LCjo3EWu2DiGr/XxqrCHMqZySU/dJzXcIbr1Vmdkc9PrtyyQroCAtUSzUrWWPY
 jCLDKEymWrMobIA5yZQB5s21gjO45xSONyJBjH28=
Date: Fri, 13 Sep 2019 14:02:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: KASAN: slab-out-of-bounds Read in handle_vmptrld
Message-ID: <20190913130226.GB403359@kroah.com>
References: <000000000000a9d4f705924cff7a@google.com>
 <87lfutei1j.fsf@vitty.brq.redhat.com>
 <5218e70e-8a80-7c5f-277b-01d9ab70692a@redhat.com>
 <20190913044614.GA120223@kroah.com>
 <db02a285-ad1d-6094-6359-ba80e6d3f2e0@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db02a285-ad1d-6094-6359-ba80e6d3f2e0@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_060656_425857_9A239BB5 
X-CRM114-Status: GOOD (  22.76  )
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
Cc: mark.rutland@arm.com, x86@kernel.org, wanpengli@tencent.com,
 kvm@vger.kernel.org, narmstrong@baylibre.com, catalin.marinas@arm.com,
 will.deacon@arm.com, hpa@zytor.com, khilman@baylibre.com, joro@8bytes.org,
 rkrcmar@redhat.com, mingo@redhat.com, Dmitry Vyukov <dvyukov@google.com>,
 syzbot <syzbot+46f1dd7dbbe2bfb98b10@syzkaller.appspotmail.com>,
 devicetree@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 robh+dt@kernel.org, bp@alien8.de, linux-amlogic@lists.infradead.org,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, jmattson@google.com,
 USB list <linux-usb@vger.kernel.org>, linux-kernel@vger.kernel.org,
 sean.j.christopherson@intel.com, carlo@caione.org,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Sep 13, 2019 at 09:34:32AM +0200, Paolo Bonzini wrote:
> On 13/09/19 06:46, Greg Kroah-Hartman wrote:
> > USB drivers expect kmalloc to return DMA-able memory.  I don't know
> > about specific alignment issues, that should only an issue for the host
> > controller being used here, which you do not say in the above list.
> 
> I have no idea, this is just the analysis of a syzkaller report.  From 
> the backtrace, it's one that ends up calling kmalloc; all of them should
> have the same issue with KASAN.
> 
> The specific alignment requirement for this bug comes from this call in
> usbdev_mmap:
> 
> 	if (remap_pfn_range(vma, vma->vm_start,
> 			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
> 			size, vma->vm_page_prot) < 0) {
> 
> > We have had some reports that usbdev_mmap() does not do the "correct
> > thing" for all host controllers, but a lot of the DMA work that is in
> > linux-next for 5.4-rc1 should have helped resolve those issues.  What
> > tree are you seeing these bug reports happening from?
> 
> It's in master, but the relevant code is the same in linux-next; in fact
> in this case there is no DMA involved at all.  hcd_buffer_alloc hits
> the case "some USB hosts just use PIO".
> 
> On those host controllers, it should be reproducible with just this:
> 
> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> index 7fcb9f782931..cc0460730bce 100644
> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -905,9 +905,12 @@ EXPORT_SYMBOL_GPL(__usb_get_extra_descriptor);
>  void *usb_alloc_coherent(struct usb_device *dev, size_t size, gfp_t mem_flags,
>  			 dma_addr_t *dma)
>  {
> +	void *buf;
>  	if (!dev || !dev->bus)
>  		return NULL;
> -	return hcd_buffer_alloc(dev->bus, size, mem_flags, dma);
> +	buf = hcd_buffer_alloc(dev->bus, size, mem_flags, dma);
> +	WARN_ON_ONCE(virt_to_phys(buf) & ~PAGE_MASK);
> +	return buf;
>  }
>  EXPORT_SYMBOL_GPL(usb_alloc_coherent);

Look at linux-next, we "should" have fixed up hcd_buffer_alloc() now to
not need this type of thing.  If we got it wrong, please let us know and
then yes, a fix like this would be most appreciated :)

thanks,

greg k-h

>  
> 
> and CONFIG_KASAN=y or possibly just CONFIG_DEBUG_SLAB=y.  mmap-ing /dev/usb
> should warn if my analysis is correct.
> 
> If you think the above patch makes sense, I can test it and submit it formally.
> 
> Paolo

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
