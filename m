Return-Path: <SRS0=L2Ze=XI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DF0C4CEC5
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2019 21:39:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5855D20693
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2019 21:39:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nhkbbzod"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5855D20693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fNWP//4EVpr6oLjNZ9LrE41zGktW/AP1wVNMh3TXyE0=; b=nhkbbzodyG526Q
	jZAuUGnHQTowQlVzKRWNAllqcqaPpoVAg6w9Xg8iGXpUq3iTONNmNldzm5XkaK4N/rkjdfZjhCHYF
	j4y2RVL32RUjEnp2MaKn1vV5U2xsYcGeAHj820NliBzHoUeNf+Tx0GxbcbeJaYH+yZ1F17BgEVwjb
	r8GKHW86lFrAWD/53n+7BLq2Ag5XSfjKlJTIYGBvfuvV9xtQUQ8a15JuyLj1tY2PPlzedAqyfRalZ
	/ODCbxdZhzIUW7Tm2Y4OEHYPn9xMJs+z+pnh6ctCfTpicZOQtfEwq+D0F3lQxB3XtlJIktf2v9Hf2
	qDAUxnUyLH0OUbXbku1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8tHe-0000YZ-Ry; Fri, 13 Sep 2019 21:39:14 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8tHb-0000XK-Fx
 for linux-amlogic@lists.infradead.org; Fri, 13 Sep 2019 21:39:13 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B645886679
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Sep 2019 21:39:08 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id u10so4579944wrn.21
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Sep 2019 14:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H/HgiF+ormPJec9ucKfvq3B1GbgLkHD6NvKq1m15REE=;
 b=M9+kY3mXiRFgHpMP0ZmgicbTgkDFs9sNxrYU+4cNnv41xt6awilSbY/eH0ItkQjYS4
 9/0b2tWfzjDnEBgLrZJ6GtWbuRDpXGqrwVAja24JI7q0CWKIFTHIAr6trN5fQQB5hslX
 CYg5PiL3XDPx7e1/4+Tou419Gi7eb/9Zasw4wuNRZoDotak6v24+o4v3qCkeUktzqguE
 mjbdPSD3UcXIwNj6YAMAnWvcJEfsI49WyuZ90sncTAtl3F+asokBZDiz6ydSlM68Wq7i
 +5WSljdkFZphs5NBl+kladZK1j0s4pIqlljamzOO3rms6tojHiUmQBhtU3Rw/4oc2XFs
 pdng==
X-Gm-Message-State: APjAAAW7Ca+hLGxYv4sB70czXc0813SfEQ8Z6f2AuteoOQB10XXZni+s
 C/5Cbco5r6PK0SMmAB2qjjv7iJSR/V1k+pCESuQXjsjJGy0gZgrgrVEmgMGlQA5LMszh9KUrPVt
 CAu8O3qjxGyU6pbYIfctO+EB94ynyA9o=
X-Received: by 2002:a1c:a54a:: with SMTP id o71mr5188561wme.51.1568410747392; 
 Fri, 13 Sep 2019 14:39:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx8xng5YAyNbwPHIzedIu8ZCTqFN32yL3gtxtyPP/chrRkzUD4Hr9V7c5rHI5vdwgEV7dIuVQ==
X-Received: by 2002:a1c:a54a:: with SMTP id o71mr5188535wme.51.1568410747142; 
 Fri, 13 Sep 2019 14:39:07 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:3166:d768:e1a7:aab8?
 ([2001:b07:6468:f312:3166:d768:e1a7:aab8])
 by smtp.gmail.com with ESMTPSA id n2sm2788701wmc.1.2019.09.13.14.39.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2019 14:39:06 -0700 (PDT)
Subject: Re: KASAN: slab-out-of-bounds Read in handle_vmptrld
To: Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <000000000000a9d4f705924cff7a@google.com>
 <87lfutei1j.fsf@vitty.brq.redhat.com>
 <5218e70e-8a80-7c5f-277b-01d9ab70692a@redhat.com>
 <20190913044614.GA120223@kroah.com>
 <db02a285-ad1d-6094-6359-ba80e6d3f2e0@redhat.com>
 <20190913130226.GB403359@kroah.com>
 <6a0ec3a2-2a52-f67a-6140-e0a60874538a@redhat.com>
 <462660f4-1537-cece-b55f-0ceba0269eb8@arm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <a85cee75-99f9-7de3-6e5c-86f9bb41bca5@redhat.com>
Date: Fri, 13 Sep 2019 23:39:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <462660f4-1537-cece-b55f-0ceba0269eb8@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_143911_563598_FF8A86EF 
X-CRM114-Status: GOOD (  14.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 13/09/19 17:32, Robin Murphy wrote:
> Oh, that bit of usbdev_mmap() is already known to be pretty much totally
> bogus for various reasons - there have been a few threads about it, of
> which I think [1] is both the most recent and the most informative.
> There was another patch[2], but that might have stalled (and might need
> reworking with additional hcd_uses_dma() checks anyway).

Neither is enough, see my reply to Alan.  Memory from kmalloc just
*cannot* be passed down to remap_pfn_range, dma_mmap_coherent or
anything like that.  It's a simple alignment issue.

Paolo

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
