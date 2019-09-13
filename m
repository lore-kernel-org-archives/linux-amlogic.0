Return-Path: <SRS0=L2Ze=XI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1838C49ED7
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2019 15:04:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99A8720830
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2019 15:04:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RY+uHLoE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99A8720830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kxBSZ0RQmZq1SXr/2SnEAjzHV3HNtM/3osiRgbd/LQI=; b=RY+uHLoELGoHTU
	aAZq6tNG1O3mR+R645XWLvwgleVXA7zgBF4nKTGTx2tK/EufiLV4V3qH8hXiv7qeeFhdL9jnq8+L5
	FeOV5vEewYgWM8Q8OOEpZp/Kvq9mfSFq9WcI8Lr8zIcF9IPCLCNGVsvtFsXsyyyGyFBA04VCM7hgl
	6wnHxKzkfT8e4LUdHYkC2lvTvZcdoEnw2cxH/00KvPFPNkFaZyQtfG3NJv6RrOyovs22qjpkBsWJJ
	1+Mk78fVhOvpQ5pkC5JsVm2iXjztaxlgZx71pRNJxI3SWvxwABubM8RcbfwkyuSHW3/t2DWBFQmP0
	82i0DYrnpvYmefh2h2zQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8n7V-0006oO-OO; Fri, 13 Sep 2019 15:04:21 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8n4i-0006Kj-Gh
 for linux-amlogic@lists.infradead.org; Fri, 13 Sep 2019 15:01:30 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 17BE76907A
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Sep 2019 15:01:28 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id f11so13756309wrt.18
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Sep 2019 08:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zuzwEhDdM8nFD/eqeUMdkZbahAvWuck1YuH/cdNiv9o=;
 b=reX/DKi4srCwEluV6FTMao6ytW1UopJbNB911JK+LhhjM/Ll38czpsMP8EFd16ncNN
 e3ovydH28M+VmAjWWxN2l7/TsvkqfUmdcydFMAHGfrRaLkrH4ZoiM3hDhDm7FR4b26MP
 iCulPiKc+JRDCSB4mJuduEu83LJhcdpr4RHGHZxAOdrPX/7mlTXNWAZv8tz86SpEeLzl
 LYXPOPt6kMs1rnP/LNfDCWm9koE+NHjRDxLIpZYncc/EHiY+PzXoLrtgoyb7DB6Xd2Ux
 l3t3cs/n7Cf3hOOIHQqBmyQJQqHEu2gF6y6zSoQs3Kh+Vabby8A2Pkn9kqf8QL/qPaRe
 LmHw==
X-Gm-Message-State: APjAAAUyQVEikLRC+XFVq8bR9ORzm8D0QKBKl8+qOo76uaOnyBX6VFfB
 AW+S4IBK2iM195W1pZuamG4w/u1Zytp2GrhbirgdbMZY3LgZKNWGBqtcXZ35uROz04H1WzhZSM2
 TPyrmvxdiMbnWTPzTP7vpILqd9Ll08YI=
X-Received: by 2002:a1c:c013:: with SMTP id q19mr3447786wmf.87.1568386884925; 
 Fri, 13 Sep 2019 08:01:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxVmkhicWbX9sM2V6LPnr+xLUUrZU9HvAJMzAOfyJJVoRtNarvooFR4sjG8yibYs2ccdb68wg==
X-Received: by 2002:a1c:c013:: with SMTP id q19mr3447762wmf.87.1568386884662; 
 Fri, 13 Sep 2019 08:01:24 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c5d2:4bb2:a923:3a9a?
 ([2001:b07:6468:f312:c5d2:4bb2:a923:3a9a])
 by smtp.gmail.com with ESMTPSA id y15sm1949532wmj.32.2019.09.13.08.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2019 08:01:24 -0700 (PDT)
Subject: Re: KASAN: slab-out-of-bounds Read in handle_vmptrld
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <000000000000a9d4f705924cff7a@google.com>
 <87lfutei1j.fsf@vitty.brq.redhat.com>
 <5218e70e-8a80-7c5f-277b-01d9ab70692a@redhat.com>
 <20190913044614.GA120223@kroah.com>
 <db02a285-ad1d-6094-6359-ba80e6d3f2e0@redhat.com>
 <20190913130226.GB403359@kroah.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <6a0ec3a2-2a52-f67a-6140-e0a60874538a@redhat.com>
Date: Fri, 13 Sep 2019 17:01:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913130226.GB403359@kroah.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_080129_010091_9331ACE8 
X-CRM114-Status: GOOD (  14.19  )
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

On 13/09/19 15:02, Greg Kroah-Hartman wrote:
> Look at linux-next, we "should" have fixed up hcd_buffer_alloc() now to
> not need this type of thing.  If we got it wrong, please let us know and
> then yes, a fix like this would be most appreciated :)

I still see

	/* some USB hosts just use PIO */
	if (!hcd_uses_dma(hcd)) {
		*dma = ~(dma_addr_t) 0;
		return kmalloc(size, mem_flags);
	}

in linux-next's hcd_buffer_alloc and also in usb.git's usb-next branch.
 I also see the same

	if (remap_pfn_range(vma, vma->vm_start,
			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
			size, vma->vm_page_prot) < 0) {
		...
	}

in usbdev_mmap.  Of course it's possible that I'm looking at the wrong
branch, or just being dense.

Paolo

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
