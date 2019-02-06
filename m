Return-Path: <SRS0=Dt7e=QN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC50C169C4
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Feb 2019 10:37:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E008206C2
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Feb 2019 10:37:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R99NrCtY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E008206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=epigenesys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UU4dxQQnSGZOI6XErQxgLG9yLWNS63nBi6nJucYe5i4=; b=R99NrCtY9M/mGR
	iVE58ny+BZdXgMMgGePlUEiOUjhENPsdeTX8wlpAtvO9M6h3zb7h/P78RDpAYL4zA9fj/KVo1UjLy
	Dq4sToGRhnqFWy5g1Cvc70vLL0XYuhdVPHwtakhpgheAgxLRPRbDEXxocFqGnnZdq7d4mc4DsY9W9
	6K3VT11dYs3VWG8qN0ZGGRnjOj8nSieoM/9RVoL/WVNrk89tavB+EJGPXUWDvkzO88brcpr2ZZo+P
	8OJCBivjPZ7QEAD2Sy+LlS4uu91Sbg2/hBW6ZhNOeB5be7PnokqwwMpb/mmgmwx1WN9wCdxi5gU4I
	R8UtPBouBPv6N6MD02zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grKZa-0003F6-Qu; Wed, 06 Feb 2019 10:36:54 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grKZW-0003EK-I1
 for linux-amlogic@lists.infradead.org; Wed, 06 Feb 2019 10:36:52 +0000
Received: by mail-wm1-f51.google.com with SMTP id z5so1912379wmf.0
 for <linux-amlogic@lists.infradead.org>; Wed, 06 Feb 2019 02:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Hhvay3GLrgDSFdChKsOwWqOK5P0x2cIJ2n3q49aTxoU=;
 b=C2df3jvTof6KpygwuzgylWSh0T4X1SIG7aD6FxTlGgBABCKX18TEpVqTeWRQa31Ccr
 cgOzsntEAToUSOz3TYEtO2WIcop5AB7GEE2RQ/lLjQvp1b1w202+8s9qkkwXlaueu/ZT
 mKTfDkbJX3R0ldBuxdvl0wwCPsklkLulHKLjJWXbFCEKiBJASUqEqDmdshOdOw4qztUR
 +u9TGhNechMRklWtuhy4EO2ZMj7sFxiUoLE5ZNnUhjPa5dS9aD/IJbBBKO5gGf3kTvRD
 IgD9YYBXNOLOVW4LGHn63tyWmyS2bXhtVYRLBiKl4oFscT2/0HHcAcTbmHh89qG4V7VZ
 3LVw==
X-Gm-Message-State: AHQUAuZhhtx8OTeL/RMej6Nu7eik3eSSM0tYAVBJ0rb/EvSXOBgw8P+D
 zgugl0etkoAKRXKFY6LtMvM=
X-Google-Smtp-Source: AHgI3IZOzvmX2dhTofzTxbFaDQUIEk+5VO7JK+O8/6JjBtKA8CyheW3+740+pL1C8oTHd7Wu06TlnA==
X-Received: by 2002:a1c:2382:: with SMTP id j124mr2597775wmj.14.1549449408234; 
 Wed, 06 Feb 2019 02:36:48 -0800 (PST)
Received: from ingrassia.epigenesys.com
 (host194-85-static.3-79-b.business.telecomitalia.it. [79.3.85.194])
 by smtp.gmail.com with ESMTPSA id l6sm17410503wrv.70.2019.02.06.02.36.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Feb 2019 02:36:47 -0800 (PST)
Date: Wed, 6 Feb 2019 11:36:45 +0100
From: Emiliano Ingrassia <ingrassia@epigenesys.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Simon Huelck <simonmail@gmx.de>
Subject: Re: stmmac / meson8b-dwmac
Message-ID: <20190206103645.GA2482@ingrassia.epigenesys.com>
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCDebPOsmrhSXecx48nGWHh7g_OGPbr1Y0M+n_v9Ht91ew@mail.gmail.com>
 <e05b7448-cd95-cdeb-c88d-3a324d5f1ddc@gmx.de>
 <CAFBinCAkXN42piiYsc_Qmuqv0w4dbK86gq10AbZyrB-zKuh9hg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCAkXN42piiYsc_Qmuqv0w4dbK86gq10AbZyrB-zKuh9hg@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_023650_589419_ACC18A35 
X-CRM114-Status: GOOD (  25.53  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, netdev@vger.kernel.org,
 alexandre.torgue@st.com, Gpeppe.cavallaro@st.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin, Hi Simon,

On Mon, Feb 04, 2019 at 03:34:41PM +0100, Martin Blumenstingl wrote:
> On Thu, Jan 17, 2019 at 10:23 PM Simon Huelck <simonmail@gmx.de> wrote:
> [...]
> > >> I got problems with my ODROID c2 running on 4.19.16 ( and some releases
> > >> earlier ). the stmmac / dwmac driver doesnt provide the 800M/900M
> > >> performance that i was used to earlier.
> > >>

Simon, did you ever reach 1 Gbps full duplex speed?
If yes, what was the kernel version did you use?

> > >>
> > >> Now im stuck near 550M/600M in the same environment. but what really
> > >> confuses me that duplex does hurt even more.
> > > interesting that you see this on the Odroid-C2 as well.
> > > previously I have only observed it on an Odroid-C1
> > >
> > >> PC --- VLAN3 --> switch --VLAN3--> ODROID
> > >>
> > >> NAS <-- VLAN1 -- switch <-- VLAN1-- ODROID
> > >>
> > >>
> > >> this means when im doing a iperf from PC to NAS, that my ODROID has load
> > >> on RX/TX same time (duplex). this shouldnt be an issue , all is 1GBits
> > >> FD. And in the past that wasnt an issue.
> +Cc Emiliano who has seen a similar duplex issue on his Odroid-C1: [0]
> (please note that all kernels prior to v5.1 with the pending patches
> from [1] applied are only receiving data on RXD0 and RXD1 but not on
> RXD2 and RXD3)
>
> Emiliano, can you confirm the duplex issue observed by Simon is
> similar to the one you see on your Odroid-C1?
>

It could be but, if I understand correctly, Simon is limited in
speed also in half duplex transmission (~550/600 Mbps), while we can
reach at least 900 Mbps.

> > >>
> > >>
> > >> Now what happens:
> > >>
> > >> - benchmark between PC - ODROID is roughly 550M
> > >>
> > >> - benchmark between NAS - ODROID is roughly 550M
> > >>
> > >> - benchmark between PC - NAS is only around 300M
> > >>
> > >>
> > >> and like i said i was easliy able to hit 800 or even 900M to my NAS
> > >> earlier. I applied some .dtb fixes for interrupt levels for the
> > >> meson-gx.dtsi and meson-gxbb-odroid-c2.dtb, which will be mainlined ,
> > >> but the effect stayed identical.
> > > good that you have the interrupt patches already applied
> > > I believe it don't fix any performance issues - it's a fix for the
> > > Ethernet controller seemingly getting "stuck" (not processing data
> > > anymore). however, that already rules out one potential issue
> > >
> > >> are you aware of this problem ? Earlier kernel versions were all
> > >> perfectly fine and i stepped ( self compiled) kernel through all major
> > >> releases since odroid c2 was mainlined.
> Guiseppe, Alexandre: what kind of data do you need from us if we see
> the speeds drop (in both directions) when we send and receive at the
> same time?
>
> [...]
> > the problem is that i dont have these kernel sources anymore :-(. but i
> > can provide some testing and numbers. maybe i dig if i got these kernel
> > configs somewhere around but i did not change much during migrating
> do you remember the kernel version where it worked fine?
>
> > im using a zyxel gs1900-8 switch and a qnap ts231p , and as i said i
> > didnt change my setup. i was able to hit 100MByte/s from my NAS , so
> > close to the benchmarks of 900MBit/s
> I typically only do small transfers or I have traffic only in one direction.
> thus it's likely that I missed this in my own tests
>
>
> Regards
> Martin
>
>
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2018-December/009679.html
> [1] https://patchwork.kernel.org/cover/10744905/

Regards,

Emiliano

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
