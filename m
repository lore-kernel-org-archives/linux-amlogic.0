Return-Path: <SRS0=9KOL=XH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12573C4CEC6
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Sep 2019 13:55:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA0A02084D
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Sep 2019 13:55:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aHnQi6Ot"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA0A02084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/oSDlA1olG6k7xv6iTayjpcozAHhVHedrqyusOR0Mgw=; b=aHnQi6OtPr+OQF
	eJlMWcxwBPvu4u/zfR95Rs+5YWxmxl3yEHRGXIX9ZAHrxxY9dsXD1E9ZvyJWPaxnRvu87rBEFui1/
	NOjkuE0gm8MOV57rfxpEUS4WJVyZAVKZJhF03gmgyvjlRSgMBv5KGdoAcgA+OxAtVUbAJGMUqnWtL
	eiDFPl/xEW81SfE5mLqiurmIQQ45wwBCHSZ/S5MXdoBzaRD4CzqT2x3LAZQlNZifOObmUsq5vpBFZ
	GNuRQE10SzpTPFczN8zaGQFkO6Ozvn3+w+C2rNCjoLkrogBjHUxyWA2w+Mr77/llJobdsMVIR6Gip
	u1F4fMMIYslsMW2quDnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8PZ4-0006az-V6; Thu, 12 Sep 2019 13:55:15 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8PYm-0005AJ-Hi
 for linux-amlogic@lists.infradead.org; Thu, 12 Sep 2019 13:54:58 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C26683A206
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Sep 2019 13:54:51 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id j2so3810073wre.1
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Sep 2019 06:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=jtKVnysH6a6/Zp0gjCWWRZszcxjtja0HC7zaeIzDlNA=;
 b=bG9a2CFoW5DbxhnnyAJFvfLADtbsdnqyQwCtTc2XR2rW/l7nZPxQ0d60xhV5l1js8l
 lLJH/ELAvHFMux+A5TC5BGM/kYdepg5dxa0bMrmPgZsa/R6kfY8UQh2N2AMDSnSx6ZTv
 MWdJcbkKeK4qIAoK0eOpHxxnrMBVoUgmN3K2FCunorxajGD0wQACYUIWOObaxbj4Kusk
 8clxp4S981kXoA00WNMTSFq0I9aEQqnQRMSjFppWe/xFnPQzjW2CWL83rBIdar4H7xhN
 FrAsxlFUtLEwfWT1/mrYQ+j7RwqkYtRHpLXoja9BmaF7sB9QBbnJhFnKjgYme7eAUkwL
 mv8w==
X-Gm-Message-State: APjAAAVs74pymwPqtQOobntTxMyWfMRpjJBDVuWnbT32U8cCf0RxAjBg
 94Xwu4+TdEsxVmH1ofrVBQ3AF8gkXsX+p5JD2zEGn9ip1zPebBLhEmd11Z4WabU770EUsxPcGIq
 4VKf+1XN29/0GsLNPWApn/uLAkgXcgCk=
X-Received: by 2002:adf:f606:: with SMTP id t6mr2185659wrp.197.1568296490389; 
 Thu, 12 Sep 2019 06:54:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwC3kNPUcOsh7Bb73QPWu//fbO1BgsdzUDsLIP9vFsm5R0Jt3bi1WcmYSjZOjhd6eyKj5g78A==
X-Received: by 2002:adf:f606:: with SMTP id t6mr2185611wrp.197.1568296490120; 
 Thu, 12 Sep 2019 06:54:50 -0700 (PDT)
Received: from vitty.brq.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id g16sm5160325wrx.21.2019.09.12.06.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2019 06:54:49 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: kvm@vger.kernel.org
Subject: Re: KASAN: slab-out-of-bounds Read in handle_vmptrld
In-Reply-To: <000000000000a9d4f705924cff7a@google.com>
References: <000000000000a9d4f705924cff7a@google.com>
Date: Thu, 12 Sep 2019 15:54:48 +0200
Message-ID: <87lfutei1j.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190912_065456_629283_7F04D60D 
X-CRM114-Status: GOOD (  14.01  )
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
 narmstrong@baylibre.com, catalin.marinas@arm.com, will.deacon@arm.com,
 hpa@zytor.com, khilman@baylibre.com, joro@8bytes.org, rkrcmar@redhat.com,
 mingo@redhat.com,
 syzbot <syzbot+46f1dd7dbbe2bfb98b10@syzkaller.appspotmail.com>,
 devicetree@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 robh+dt@kernel.org, bp@alien8.de, linux-amlogic@lists.infradead.org,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, jmattson@google.com,
 linux-kernel@vger.kernel.org, sean.j.christopherson@intel.com,
 carlo@caione.org, pbonzini@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

syzbot <syzbot+46f1dd7dbbe2bfb98b10@syzkaller.appspotmail.com> writes:

> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    1e3778cb Merge tag 'scsi-fixes' of git://git.kernel.org/pu..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=15bdfc5e600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b89bb446a3faaba4
> dashboard link: https://syzkaller.appspot.com/bug?extid=46f1dd7dbbe2bfb98b10
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1709421a600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=168fc4b2600000
>
> The bug was bisected to:
>
> commit a87f854ddcf7ff7e044d72db0aa6da82f26d69a6
> Author: Neil Armstrong <narmstrong@baylibre.com>
> Date:   Wed Oct 11 15:39:40 2017 +0000
>
>      ARM64: dts: meson-gx: remove unnecessary uart compatible
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17e78a6e600000
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=14178a6e600000
> console output: https://syzkaller.appspot.com/x/log.txt?x=10178a6e600000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+46f1dd7dbbe2bfb98b10@syzkaller.appspotmail.com
> Fixes: a87f854ddcf7 ("ARM64: dts: meson-gx: remove unnecessary uart  
> compatible")
>
> L1TF CPU bug present and SMT on, data leak possible. See CVE-2018-3646 and  
> https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/l1tf.html for  
> details.
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in handle_vmptrld  
> arch/x86/kvm/vmx/nested.c:4789 [inline]
> BUG: KASAN: slab-out-of-bounds in handle_vmptrld+0x777/0x800  
> arch/x86/kvm/vmx/nested.c:4749
> Read of size 4 at addr ffff888091e10000 by task syz-executor758/10006
>
> CPU: 1 PID: 10006 Comm: syz-executor758 Not tainted 5.3.0-rc7+ #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
> Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0x172/0x1f0 lib/dump_stack.c:113
>   print_address_description.cold+0xd4/0x306 mm/kasan/report.c:351
>   __kasan_report.cold+0x1b/0x36 mm/kasan/report.c:482
>   kasan_report+0x12/0x17 mm/kasan/common.c:618
>   __asan_report_load_n_noabort+0xf/0x20 mm/kasan/generic_report.c:142
>   handle_vmptrld arch/x86/kvm/vmx/nested.c:4789 [inline]
>   handle_vmptrld+0x777/0x800 arch/x86/kvm/vmx/nested.c:4749
>   vmx_handle_exit+0x299/0x15e0 arch/x86/kvm/vmx/vmx.c:5886
>   vcpu_enter_guest+0x1087/0x5e90 arch/x86/kvm/x86.c:8088
>   vcpu_run arch/x86/kvm/x86.c:8152 [inline]
>   kvm_arch_vcpu_ioctl_run+0x464/0x1750 arch/x86/kvm/x86.c:8360
>   kvm_vcpu_ioctl+0x4dc/0xfd0 arch/x86/kvm/../../../virt/kvm/kvm_main.c:2765
>   vfs_ioctl fs/ioctl.c:46 [inline]
>   file_ioctl fs/ioctl.c:509 [inline]
>   do_vfs_ioctl+0xdb6/0x13e0 fs/ioctl.c:696
>   ksys_ioctl+0xab/0xd0 fs/ioctl.c:713
>   __do_sys_ioctl fs/ioctl.c:720 [inline]
>   __se_sys_ioctl fs/ioctl.c:718 [inline]
>   __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:718
>   do_syscall_64+0xfd/0x6a0 arch/x86/entry/common.c:296
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe

Hm, the bisection seems bogus but the stack points us to the following
piece of code:

 4776)              if (kvm_vcpu_map(vcpu, gpa_to_gfn(vmptr), &map)) {
<skip>
 4783)                      return nested_vmx_failValid(vcpu,
 4784)                              VMXERR_VMPTRLD_INCORRECT_VMCS_REVISION_ID);
 4785)              }
 4786) 
 4787)              new_vmcs12 = map.hva;
 4788) 
*4789)              if (new_vmcs12->hdr.revision_id != VMCS12_REVISION ||
 4790)                  (new_vmcs12->hdr.shadow_vmcs &&
 4791)                   !nested_cpu_has_vmx_shadow_vmcs(vcpu))) {

the reported problem seems to be on VMCS12 region access but it's part
of guest memory and we successfuly managed to map it. We're definitely
within 1-page range. Maybe KASAN is just wrong here?

-- 
Vitaly

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
