Return-Path: <SRS0=9KOL=XH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6FBC4CEC6
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Sep 2019 16:49:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1FFE2084D
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Sep 2019 16:49:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pi7JloQE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1FFE2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjw4QBWOIgbBpxjDJMn9lL8rKTcyrFdFzhvVv+HF8rA=; b=pi7JloQEVmYuT9
	ZfOYNgQu9feHgYdbAOmVH4uU3xtMozfZqX8jb51P7dDmWM8mkDzQr8jkYuC7AVYZSGJzCRr6NGXmb
	0jw+LVpaqez2V2c3AFuc32dhD3nMBxWUq84a5i95M86q/fsFCRRhkZLhGkuct6ozVnBvep5IbiO8l
	266nvmgMuWNjwZLamB5Ti/vuFpu46Kuzz70vaEEiH/LVE343qzyqFAFnOWyDQ/YOyEK2Y2ty3+TpP
	Sm9lDYKLLQYE1nNHLGMcw40TiNSPw4cASa1lrfxQaqJho2X+3RTYVmghY1haiibA1UbtNN2ON3SV+
	l9+uBwjTWEd1RHNe1obw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8SHm-0007sQ-Ug; Thu, 12 Sep 2019 16:49:34 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8SHj-0007rB-38
 for linux-amlogic@lists.infradead.org; Thu, 12 Sep 2019 16:49:32 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5DD603E2D3
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Sep 2019 16:49:29 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id t16so12322153wro.3
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Sep 2019 09:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p6UoFWsgsPkuQtSEESX9kkhleKRjVbh91vbkMxi8FIw=;
 b=pfiPICPw5/0inXZ4muaqeA5sxKQBic89c7qeVselRNGOQ7aFNOlgwwsCwoS6YA9rBH
 yIhpKBY/aPSrVJQwaG5M6GmijeBAI4CD2zejU+svcAzo3j279fMAUb/jsUQP1+TND4nY
 i+01o6PZk1ghbBSDThWA2QovC+5ME0Efs/fMMNvvbk4NqMKr2f3/fZeIxvqzyTZVrF7B
 C16grhpdGxSa0vf0SMBN+RM/GAXjsqPyTer1ggY/xaw7jxGPOlIEOO3aV0U+1xCpe+2G
 8/8lUK2YjN5aHQ9u7p6YIJzVtVrUy5IVexLnGulfUtzM5AAPEFTTXhFrhrrnjxBNFI0Y
 thWA==
X-Gm-Message-State: APjAAAWwixv55jScsETQf6ET/KzAgLbsb72gxctfsn1Q7G0CaBZ87Vbn
 NS0wsE8V0Au0GR4GKa6KyZCTkQv3HNAzpv6iTG58HPd9HG8JxlPQw6cm8Vymn3MfP5sRJsgFjx/
 SWa4BgNOcmzCIzZ9HSrdpmUww6Akk1fE=
X-Received: by 2002:a5d:6811:: with SMTP id w17mr31804409wru.181.1568306967705; 
 Thu, 12 Sep 2019 09:49:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxrL3VP6sAEDt0Bo0M7LVEBolaalUXmcE8h3jDG603x7fhGBgsss6KO8uKCmP0qnEKPpoX5oQ==
X-Received: by 2002:a5d:6811:: with SMTP id w17mr31804366wru.181.1568306967374; 
 Thu, 12 Sep 2019 09:49:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:3166:d768:e1a7:aab8?
 ([2001:b07:6468:f312:3166:d768:e1a7:aab8])
 by smtp.gmail.com with ESMTPSA id h17sm807220wme.6.2019.09.12.09.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2019 09:49:26 -0700 (PDT)
Subject: Re: KASAN: slab-out-of-bounds Read in handle_vmptrld
To: Vitaly Kuznetsov <vkuznets@redhat.com>, kvm@vger.kernel.org
References: <000000000000a9d4f705924cff7a@google.com>
 <87lfutei1j.fsf@vitty.brq.redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <5218e70e-8a80-7c5f-277b-01d9ab70692a@redhat.com>
Date: Thu, 12 Sep 2019 18:49:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87lfutei1j.fsf@vitty.brq.redhat.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190912_094931_180999_7615E613 
X-CRM114-Status: GOOD (  18.69  )
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
Cc: mark.rutland@arm.com, wanpengli@tencent.com, narmstrong@baylibre.com,
 catalin.marinas@arm.com, will.deacon@arm.com, rkrcmar@redhat.com,
 hpa@zytor.com, khilman@baylibre.com, joro@8bytes.org, x86@kernel.org,
 mingo@redhat.com, Dmitry Vyukov <dvyukov@google.com>,
 syzbot <syzbot+46f1dd7dbbe2bfb98b10@syzkaller.appspotmail.com>,
 devicetree@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 robh+dt@kernel.org, bp@alien8.de, linux-amlogic@lists.infradead.org,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, jmattson@google.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>, linux-kernel@vger.kernel.org,
 sean.j.christopherson@intel.com, carlo@caione.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

[tl;dr: there could be a /dev/usb bug only affecting KASAN
configurations, jump to the end to skip the analysis and get to the bug
details]

On 12/09/19 15:54, Vitaly Kuznetsov wrote:
> Hm, the bisection seems bogus but the stack points us to the following
> piece of code:
> 
>  4776)              if (kvm_vcpu_map(vcpu, gpa_to_gfn(vmptr), &map)) {
> <skip>
>  4783)                      return nested_vmx_failValid(vcpu,
>  4784)                              VMXERR_VMPTRLD_INCORRECT_VMCS_REVISION_ID);
>  4785)              }
>  4786) 
>  4787)              new_vmcs12 = map.hva;
>  4788) 
> *4789)              if (new_vmcs12->hdr.revision_id != VMCS12_REVISION ||
>  4790)                  (new_vmcs12->hdr.shadow_vmcs &&
>  4791)                   !nested_cpu_has_vmx_shadow_vmcs(vcpu))) {
> 
> the reported problem seems to be on VMCS12 region access but it's part
> of guest memory and we successfuly managed to map it. We're definitely
> within 1-page range. Maybe KASAN is just wrong here?

Here is the relevant part of the syzkaller repro:

syz_kvm_setup_cpu$x86(r1, 0xffffffffffffffff,
&(0x7f0000000000/0x18000)=nil, 0x0, 0x133, 0x0, 0x0, 0xff7d)
r3 = syz_open_dev$usb(&(0x7f0000000080)='/dev/bus/usb/00#/00#\x00',
0x40000fffffd, 0x200800000000042)
mmap$IORING_OFF_SQES(&(0x7f0000007000/0x2000)=nil, 0x2000, 0x4, 0x13,
r3, 0x10000000)
syz_kvm_setup_cpu$x86(0xffffffffffffffff, r2,
&(0x7f0000000000/0x18000)=nil, 0x0, 0xfefd, 0x40, 0x0, 0xfffffffffffffdd4)
ioctl$KVM_RUN(r2, 0xae80, 0x0)

The mmap$IORING_OFF_SQES is just a normal mmap from a device, which
replaces the previous mapping for guest memory and in particular
0x7f0000007000 which is the VMCS (from the C reproducer: "#define
ADDR_VAR_VMCS 0x7000").

The previous mapping is freed with do_munmap and then repopulated in
usbdev_mmap with remap_pfn_range.  In KVM this means that kvm_vcpu_map
goes through hva_to_pfn_remapped, which correctly calls get_page via
kvm_get_pfn.  (Note that although drivers/usb/core/devio.c's usbdev_mmap
sets VM_IO *after* calling remap_pfn_range, remap_pfn_range itself
helpfully sets it before calling remap_p4d_range.  And anyway KVM is
looking at vma->vm_flags under mmap_sem, which is held during mmap).

So, KVM should be doing the right thing.  Now, the error is:

> Read of size 4 at addr ffff888091e10000 by task syz-executor758/10006
> The buggy address belongs to the object at ffff888091e109c0 
> The buggy address is located 2496 bytes to the left of
>  8192-byte region [ffff888091e109c0, ffff888091e129c0) 

And given the use of remap_pfn_range in devusb_mmap, the simplest
explanation could be that USB expects kmalloc-8k to return 8k-aligned
values, but this is not true anymore with KASAN.  CCing Dmitry, Greg and
linux-usb.

Paolo

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
