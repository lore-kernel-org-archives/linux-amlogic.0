Return-Path: <SRS0=L2Ze=XI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C87DC49ED7
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2019 07:34:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 419BF20678
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2019 07:34:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RvzSBLSG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 419BF20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mvpvtlPeNLaGAvlC5NfcyMf9n+azQE6dauYOAak8r/I=; b=RvzSBLSG6s9J4+
	R94mOQd+H/P4/ETb1+Y5fMs3OTW0z9yE6F3UFIjD5B2uSgH3zGWn/wnNymAnNRZ6EpgLLZT23pHIu
	iSGxokhY2OeQeCnfXNqCnVNMcw/ZQIFSAfmZF3zTtMrOp+i0oNu1iRCt9izy4tnaRTQDfOByiIl9a
	vXjSrfqLaQ29s2lPKAeY9D/Ide8nM81gOPJaetGoVEpk1m2yAmOY1Kk5Nxc4wL2T8xukzeLRuqv8K
	iWxNQVBuQQVsL/y7SyU0T5SL/FVKeo9q5uNQRBxOnrM1sdsHBK3+FP4LziaP0v22Ye4xuY4TiqZWg
	33+hWPgMVv/SbD+hID4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8g6J-0001cQ-8C; Fri, 13 Sep 2019 07:34:39 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8g6F-0001bA-83
 for linux-amlogic@lists.infradead.org; Fri, 13 Sep 2019 07:34:37 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4CF37883D7
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Sep 2019 07:34:34 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id k67so991594wmf.3
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Sep 2019 00:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0wZRdSHIeheVxa4DE7SyQMfDWHvTTN3LMA+T1b8qSjs=;
 b=mh8G6OzYr25DRJmgsBkRYAbs6KgGFxkXeY+1kCuTn6vS+RbPac5jekexSB6KhCwOpx
 vhLTt46EunPtMgg9CQg23zKzSBq/MN75zeElPQwKjCygpSBJqluPGuhdXhDZrXjl6VWl
 WHm9JJxoKyre2VD0WuUEvJbWyKHcTxhAcU64b0cbfI6OFwZstjdtebAkTGQxm+HjDZ4d
 GNFZdiaxviFoLjw+lEGZPpPCCusLHbyJ4U8uQd7vZYv69sJ16P+cQqMsleE5fSM9t0X1
 IwRkRlMg43Xv2CKNZ48s2P9SGlq2DBuqAevl8Jy9CmdMXiusEdEphK39eRv2Yrf4xivt
 mnyg==
X-Gm-Message-State: APjAAAU37tZpfsAQzcSfmommaaQ62SKl7ziZRx58aeoyDHmfpkxzD20h
 YNc37XGZz7D5+B8XOscA1p0v5QEvN0XEptFpRIfgLfl6eQA4Q9IBlVCJS4zkyeKkoPlqLpWyp1i
 r1JGtQ7jMM9/mxkJSCH+T2Or1I6I3kyM=
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr6515874wrs.229.1568360072884; 
 Fri, 13 Sep 2019 00:34:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxXYHxfnOF9dKY5KYFw0qMwImUhJMX0+wKShi7tbwxtPLXAruWfIDZ1aSZJYxfR9HQPil13Fg==
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr6515852wrs.229.1568360072601; 
 Fri, 13 Sep 2019 00:34:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:3166:d768:e1a7:aab8?
 ([2001:b07:6468:f312:3166:d768:e1a7:aab8])
 by smtp.gmail.com with ESMTPSA id l1sm33488980wrb.1.2019.09.13.00.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2019 00:34:32 -0700 (PDT)
Subject: Re: KASAN: slab-out-of-bounds Read in handle_vmptrld
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <000000000000a9d4f705924cff7a@google.com>
 <87lfutei1j.fsf@vitty.brq.redhat.com>
 <5218e70e-8a80-7c5f-277b-01d9ab70692a@redhat.com>
 <20190913044614.GA120223@kroah.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <db02a285-ad1d-6094-6359-ba80e6d3f2e0@redhat.com>
Date: Fri, 13 Sep 2019 09:34:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913044614.GA120223@kroah.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_003435_325768_89DD98B4 
X-CRM114-Status: GOOD (  19.73  )
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

On 13/09/19 06:46, Greg Kroah-Hartman wrote:
> USB drivers expect kmalloc to return DMA-able memory.  I don't know
> about specific alignment issues, that should only an issue for the host
> controller being used here, which you do not say in the above list.

I have no idea, this is just the analysis of a syzkaller report.  From 
the backtrace, it's one that ends up calling kmalloc; all of them should
have the same issue with KASAN.

The specific alignment requirement for this bug comes from this call in
usbdev_mmap:

	if (remap_pfn_range(vma, vma->vm_start,
			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
			size, vma->vm_page_prot) < 0) {

> We have had some reports that usbdev_mmap() does not do the "correct
> thing" for all host controllers, but a lot of the DMA work that is in
> linux-next for 5.4-rc1 should have helped resolve those issues.  What
> tree are you seeing these bug reports happening from?

It's in master, but the relevant code is the same in linux-next; in fact
in this case there is no DMA involved at all.  hcd_buffer_alloc hits
the case "some USB hosts just use PIO".

On those host controllers, it should be reproducible with just this:

diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 7fcb9f782931..cc0460730bce 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -905,9 +905,12 @@ EXPORT_SYMBOL_GPL(__usb_get_extra_descriptor);
 void *usb_alloc_coherent(struct usb_device *dev, size_t size, gfp_t mem_flags,
 			 dma_addr_t *dma)
 {
+	void *buf;
 	if (!dev || !dev->bus)
 		return NULL;
-	return hcd_buffer_alloc(dev->bus, size, mem_flags, dma);
+	buf = hcd_buffer_alloc(dev->bus, size, mem_flags, dma);
+	WARN_ON_ONCE(virt_to_phys(buf) & ~PAGE_MASK);
+	return buf;
 }
 EXPORT_SYMBOL_GPL(usb_alloc_coherent);
 

and CONFIG_KASAN=y or possibly just CONFIG_DEBUG_SLAB=y.  mmap-ing /dev/usb
should warn if my analysis is correct.

If you think the above patch makes sense, I can test it and submit it formally.

Paolo

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
