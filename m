Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752FDC3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 14:04:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 475BE206BA
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 14:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eJA9RWNK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="MidKkLyv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 475BE206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wx/w25NnovXOv9vAi1H5k6nZK3S/Tvq3J4S/k8q5EgU=; b=eJA9RWNKYikWKtHbcrM+MCsQ0
	rYug7hgnkeAHzkoALrrFsr/9IWcT5tnRwyybFrDQiFQAzAHAcE0jDKVAwhWWI8/EYUwUQ9JCAD+BW
	n0G0ftW4GE1mse+rr6EXH3qiRC9HJTEVfvcLSiLFnH5t9jbQgojlzzyppCJYQqVLgP2QtnwzIDhW0
	xpG0wo6mRJDFtBG8QK3TdjMiUK1IUoXzqvqrg4YeMmYcY9lqwSgbdV2YKfkDUTttRk0sX4p6ll71N
	FNS4TnznOwtyTHJxV/1glGTq/gUuXjXBrMnevQN8IwO3EElgo+7JtPNWcDM5V5xbIQL2MECiClBuv
	yQlJPfqnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0RDU-0006w4-PT; Wed, 21 Aug 2019 14:04:01 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0RDK-0006jR-8s
 for linux-amlogic@lists.infradead.org; Wed, 21 Aug 2019 14:03:52 +0000
Received: by mail-wm1-x343.google.com with SMTP id g67so2283031wme.1
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Aug 2019 07:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rNyl/GAwTmLTUNQynVbw/8SOsQqQ1R7n+k4XVH7pAfA=;
 b=MidKkLyv9HQjM9YsTFAD+JjCp0plA1IFovR06fjrPRys0G/br9M706YWoy8q4p5/+u
 KHMnu8KUpMSUR+rUPfBWFC1tcN4nmqkp824MEEu4bKTGz4TqaBozd1S1lfhlZGvURoXQ
 2iSG6SwE2o3O0d4g5BsHAAjQIRjUJD9p6MyAJMgX4QH9ynSqrn8UBIZ3TCXVJ2LbK9db
 EpUvt2+anuLDXYizRUoFQcdngZ/yDsVOEtN0fM8qnMdbPA9bQjtPBqJzQo2aiU9/HbN6
 SDkBqgZc0sCcrnr7GIF4NjYAPRRmkBwwUFWHE2aa0RrPCig66hntOKeL8+fD4F27he+P
 q2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rNyl/GAwTmLTUNQynVbw/8SOsQqQ1R7n+k4XVH7pAfA=;
 b=V2XVNntU9AXHI4bgWIFQD4motH0Spbw8+dQQ33pGG942m5vf8gGdYphdZhRsuA8wwl
 X1DyATQnF8Wiv84pmX+PHszKCK+Ms4Gu6h+UBxBy7Q8IlbbhAg5tJxQ9vXy6xn6mUEgK
 bcP304NS7g2BC1BeusyMQaQrjDyk4FTRKWaQixqZe25T1MTBzW7+/gcbbzvEAmu2qZmO
 TlTQfkkVLI1fItsY5T5V/WLN5cjMvN3nFJiFGt2aAgXsJuWWmHh81VkallgYwZfozbHG
 /+ozu+T/3OpEaaaICINhtVnM6mSS61hy5WlmPibPqtZ23/mUp+VsFVYxTgLcS2K830bA
 6Ctw==
X-Gm-Message-State: APjAAAXJoknW4XMTZDyO7koHIpQn5PXcGNinXxzfk1gBGXekImeAthuL
 1M/RGA31huCfKnv/M9uh/8IXJg==
X-Google-Smtp-Source: APXvYqystIzk+HhGz6Qa4p93wRRKjwZmEcSqSZ+P4isDGvGod84XS7SVOqOw9UvX3/TfshAObReWaw==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr173265wmk.79.1566396225923;
 Wed, 21 Aug 2019 07:03:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
 by smtp.gmail.com with ESMTPSA id g7sm170768wme.17.2019.08.21.07.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 07:03:45 -0700 (PDT)
Date: Wed, 21 Aug 2019 15:03:41 +0100
From: Matthias Maennich <maennich@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 00/11] Symbol Namespaces
Message-ID: <20190821140341.GA126314@google.com>
References: <20190813121733.52480-1-maennich@google.com>
 <20190821114955.12788-1-maennich@google.com>
 <20190821131140.GC2349@hirez.programming.kicks-ass.net>
 <20190821133846.GC4890@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821133846.GC4890@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_070350_368319_62D36CDC 
X-CRM114-Status: GOOD (  19.21  )
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
Cc: kstewart@linuxfoundation.org, oneukum@suse.com,
 linux-aspeed@lists.ozlabs.org, Peter Zijlstra <peterz@infradead.org>,
 Toru Komatsu <k0ma@utam0k.jp>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 David Howells <dhowells@redhat.com>, yamada.masahiro@socionext.com,
 Will Deacon <will@kernel.org>, patches@opensource.cirrus.com,
 Michael Ellerman <mpe@ellerman.id.au>, hpa@zytor.com, joel@joelfernandes.org,
 bcm-kernel-feedback-list@broadcom.com, sam@ravnborg.org, cocci@systeme.lip6.fr,
 linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>, linux-scsi@vger.kernel.org,
 Nancy Yuen <yuenn@google.com>, Fabio Estevam <festevam@gmail.com>,
 openbmc@lists.ozlabs.org, x86@kernel.org, lucas.de.marchi@gmail.com,
 usb-storage@lists.one-eyed-alien.net, mingo@redhat.com, geert@linux-m68k.org,
 NXP Linux Team <linux-imx@nxp.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Patrick Venture <venture@google.com>, stern@rowland.harvard.edu,
 kernel-team@android.com, Ingo Molnar <mingo@kernel.org>,
 linux-rtc@vger.kernel.org, Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>,
 sspatil@google.com, linux-watchdog@vger.kernel.org, arnd@arndb.de,
 linux-kbuild@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, pombredanne@nexb.com,
 Dan Williams <dan.j.williams@intel.com>, Julia Lawall <julia.lawall@lip6.fr>,
 linux-m68k@lists.linux-m68k.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, tglx@linutronix.de, maco@android.com,
 linux-arm-kernel@lists.infradead.org, Adrian Reber <adrian@lisas.de>,
 linux-hwmon@vger.kernel.org, michal.lkml@markovi.net,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alexey Gladkov <gladkov.alexey@gmail.com>, linux-usb@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>, Patrick Bellasi <patrick.bellasi@arm.com>,
 Richard Guy Briggs <rgb@redhat.com>, maco@google.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, jeyu@kernel.org,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 21 Aug, 06:38, Greg Kroah-Hartman wrote:
>On Wed, Aug 21, 2019 at 03:11:40PM +0200, Peter Zijlstra wrote:
>> On Wed, Aug 21, 2019 at 12:49:15PM +0100, Matthias Maennich wrote:
>> > As of Linux 5.3-rc5, there are 31205 [1] exported symbols in the kernel.
>> > That is a growth of roughly 1000 symbols since 4.17 (30206 [2]).  There
>> > seems to be some consensus amongst kernel devs that the export surface
>> > is too large, and hard to reason about.
>> >
>> > Generally, these symbols fall in one of these categories:
>> > 1) Symbols actually meant for drivers
>> > 2) Symbols that are only exported because functionality is split over
>> >    multiple modules, yet they really shouldn't be used by modules outside
>> >    of their own subsystem
>> > 3) Symbols really only meant for in-tree use
>> >
>> > When module developers try to upstream their code, it regularly turns
>> > out that they are using exported symbols that they really shouldn't be
>> > using. This problem is even bigger for drivers that are currently
>> > out-of-tree, which may be using many symbols that they shouldn't be
>> > using, and that break when those symbols are removed or modified.
>> >
>> > This patch allows subsystem maintainers to partition their exported
>> > symbols into separate namespaces, and module authors to import such
>> > namespaces only when needed.
>> >
>> > This allows subsystem maintainers to more easily limit availability of
>> > these namespaced symbols to other parts of the kernel. It can also be
>> > used to partition the set of exported symbols for documentation
>> > purposes; for example, a set of symbols that is really only used for
>> > debugging could be in a "SUBSYSTEM_DEBUG" namespace.
>>
>> I'm missing how one can prohibit these random out of tree modules from
>> doing MODULE_IMPORT_NS().
>
>Nothing, but then they are explicitly being "bad" :)
>

As a side effect of this implementation (namespace imports via modinfo
tags), imports are very visible for (out-of-tree) modules, e.g.

$ modinfo drivers/usb/storage/ums-usbat.ko
  filename:       drivers/usb/storage/ums-usbat.ko
  import_ns:      USB_STORAGE
  license:        GPL
  author:         ...
  ...

>> That is; suppose I stick all the preempt_notifier symbols in a KVM
>> namespace, how do I enforce no out-of-tree modules ever do
>> MODULE_IMPORT_NS(KVM) and gain access?
>>

That is actually a feature worth following up: Restricting the
namespaces that can be imported by modules. I am afraid it is not part
of this series, but should not be too hard once agreed how such a list
will be defined.

>> (the above would basically break virtualbox, which I knows uses preempt
>> notifiers too, but I don't give a rats arse about that)
>
>It's a huge red flag for anyone reviewing the code that this module is
>doing something it probably really should not be doing at all.  It will
>make reviewing code easier, this isn't there to try to "prevent bad
>actors" at all, sorry.
>

Cheers,
Matthias

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
