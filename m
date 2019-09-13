Return-Path: <SRS0=L2Ze=XI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13816C49ED7
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2019 16:14:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD9232081B
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2019 16:14:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bwy0BSzN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD9232081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPDAVCdFPMUdmNjpOlRm/5Se2HgARt/Hr8/BagsLcF4=; b=Bwy0BSzNMsAsyE
	6iUK8IlhcU0o/wZ4qNhLNu/Yhmxge7VlixIbzysZNLHXWiXJ7YGgg5jnIrM2nABzn1QHRMyG1ZaRF
	jRMAg+Vnc4B1xYEIlETB53N9ZWWSuMQKr/qp/wLURau0zZyYCcnfHT9WBPc2Y1Y8mw+22cCjTeruT
	BiK/uzznNgdTaPRKLU13Uc4Ja5H90KPSFaMITwcR2yMFXQYP9jD4r5uGn91HOyWbKSAWaFWmE5+ac
	yCCwhBdgi+VZfzSvdMn3nk7seHqpkGvqYw8rjBv0Ka7jdtT3Yab3JuZaitamHBRr3yZiJ6t0LqXJl
	Z9aNYl23OJi1WfLcxlYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8oDT-00075R-4O; Fri, 13 Sep 2019 16:14:35 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8oDQ-000736-4X
 for linux-amlogic@lists.infradead.org; Fri, 13 Sep 2019 16:14:33 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4983950F7C
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Sep 2019 16:14:30 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id k184so1458112wmk.1
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Sep 2019 09:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7nSN9wvhoKYdWon6QDIGqpWH+96lV7NFl/5Fkxot28g=;
 b=ZQm/JeKFrYbnRs0+/uFsAwOEd/t2pSgEEAI1ECyAlcLmhYrH4B3FRSO4yOwLH2unQv
 1ycfVlD+gw3e2Ga3bvnPQ+42T57+1Zuvt+N9nsD/a+4I245aDkcO5o3K8yw7jlul1d3p
 A4ra0aYvIj/JkCccut3MftkZ+Mf8TuPd3rAPAmIvlNxAta/FJCfxaTBndjUjJyCyfoDh
 aYQk1VUKymeudsSfz5U2nC1TRGl5lCGLN/QzUx1gnN5byR/LTBJflbTMCaLGga+urFJu
 UXtEwoeAEJv1ll6kfRIkaGBKomSM7JAO/Knqqyng56yGXEnd51WHgEt46Y1kjawCrB3n
 ntyA==
X-Gm-Message-State: APjAAAV6aZQTMBXrAdVH14P/79KfnlxaA92IX30M2fNsT3v9hhKF3hN/
 QlPa7AjmzxKAnBcZpf6ood0J/hpzVRGnBZhtuDMDkO1Dp79nzfmXThlqVQt/UW0EYwc1LmQdZn3
 M4RviVskyTmNH/cB2lSofgpc1fKNdzkA=
X-Received: by 2002:adf:f607:: with SMTP id t7mr38318039wrp.60.1568391268768; 
 Fri, 13 Sep 2019 09:14:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQUnRDc3RyOrEaNGz0pukUMwipBT5o437e/Usb18JWbopoR0i0Q27Or8p94AssM2/2oIzM8A==
X-Received: by 2002:adf:f607:: with SMTP id t7mr38317997wrp.60.1568391268522; 
 Fri, 13 Sep 2019 09:14:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c5d2:4bb2:a923:3a9a?
 ([2001:b07:6468:f312:c5d2:4bb2:a923:3a9a])
 by smtp.gmail.com with ESMTPSA id v6sm4816939wma.24.2019.09.13.09.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2019 09:14:28 -0700 (PDT)
Subject: Re: KASAN: slab-out-of-bounds Read in handle_vmptrld
To: Alan Stern <stern@rowland.harvard.edu>
References: <Pine.LNX.4.44L0.1909131129390.1466-100000@iolanthe.rowland.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <1a8a6449-2740-b0a3-805a-47466e0d71c6@redhat.com>
Date: Fri, 13 Sep 2019 18:14:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.1909131129390.1466-100000@iolanthe.rowland.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_091432_218979_FB20F008 
X-CRM114-Status: GOOD (  19.01  )
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
 kvm@vger.kernel.org, rkrcmar@redhat.com, catalin.marinas@arm.com,
 will.deacon@arm.com, hpa@zytor.com, khilman@baylibre.com, joro@8bytes.org,
 narmstrong@baylibre.com, mingo@redhat.com, Dmitry Vyukov <dvyukov@google.com>,
 syzbot <syzbot+46f1dd7dbbe2bfb98b10@syzkaller.appspotmail.com>,
 devicetree@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 robh+dt@kernel.org, bp@alien8.de, linux-amlogic@lists.infradead.org,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, jmattson@google.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>, linux-kernel@vger.kernel.org,
 sean.j.christopherson@intel.com, carlo@caione.org,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 13/09/19 17:36, Alan Stern wrote:
> On Fri, 13 Sep 2019, Paolo Bonzini wrote:
> 
>> On 13/09/19 15:02, Greg Kroah-Hartman wrote:
>>> Look at linux-next, we "should" have fixed up hcd_buffer_alloc() now to
>>> not need this type of thing.  If we got it wrong, please let us know and
>>> then yes, a fix like this would be most appreciated :)
>>
>> I still see
>>
>> 	/* some USB hosts just use PIO */
>> 	if (!hcd_uses_dma(hcd)) {
>> 		*dma = ~(dma_addr_t) 0;
>> 		return kmalloc(size, mem_flags);
>> 	}
>>
>> in linux-next's hcd_buffer_alloc and also in usb.git's usb-next branch.
>>  I also see the same
>>
>> 	if (remap_pfn_range(vma, vma->vm_start,
>> 			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
>> 			size, vma->vm_page_prot) < 0) {
>> 		...
>> 	}
>>
>> in usbdev_mmap.  Of course it's possible that I'm looking at the wrong
>> branch, or just being dense.
> 
> Have you seen
> 
> 	https://marc.info/?l=linux-usb&m=156758511218419&w=2
> 
> ?  It certainly is relevant, although Greg hasn't replied to it.

It helps but it's not a full fix, since the address would fail
is_vmalloc_addr.  On top of that, hcd_buffer_alloc and hcd_buffer_free
need to switch from kmalloc to vmalloc.

> Also, just warning about a non-page-aligned allocation doesn't really 
> help.  It would be better to fix the misbehaving allocator.

Of course.  The above patch does not fix the issue, it should just allow
for an easier reproduction not involving KVM.  More long term, it points
out where the contracts mismatch (i.e. between hcd_buffer_alloc and
usb_alloc_coherent), and more selfishly whose bug it is when syzkaller
complains. :)

Paolo

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
