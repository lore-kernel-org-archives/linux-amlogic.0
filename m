Return-Path: <SRS0=P8k8=QL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E184C282CB
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Feb 2019 14:35:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CA532083B
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Feb 2019 14:35:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sKGGiNkA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EfcXiOTz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CA532083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkpJ6voPKG1mmL8lbS5RVE4gETeSzYG9WD/RlmdnuaQ=; b=sKGGiNkAe3oevq
	oDM67HGbT344ulie+KxOvf31TwoN6SMUmqsKb8AXNQZgLpzEgApdZnTS6VmRUDn22dwch6KFZh4Qr
	jCS4gT2WsmEKpbZIFdt2iqp4KeFA5QRRthf1vobblrNVR1ABOeHfim+pdovxmz2DFp8A8rPmZNxoB
	k/8THAilsO0oyfDfnyeBnUknY4EGjc4cF3JSB7CUYbjdhcwxcXWYJe9wQAUSpjKMrofb3RJWoZbz6
	63QDnd8z984eLzhkjAOCs78Qc7wr1pjwd4wjvZiWOeZuXbwsg05h3ShJhDHlbz144IfMjKDiQ4mov
	kZNrdn2UT93jm4Mg8imA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqfKq-0004WG-TG; Mon, 04 Feb 2019 14:34:56 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqfKn-0004Vx-N0
 for linux-amlogic@lists.infradead.org; Mon, 04 Feb 2019 14:34:55 +0000
Received: by mail-ot1-x343.google.com with SMTP id e12so79653otl.5
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Feb 2019 06:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YW+9YZGrkmvhm7l1w0ntB2oUB66QBa6+CdYqZj8Ih3Y=;
 b=EfcXiOTzUvTiWfkHniWD3qCtUi+1wkO9Su+IvW3RJ56knV6R8x8YOwBEB+K+ARTiLz
 ZQHVXDz0iHk9zybxSAnu3x5E7oLq3BiJRSGmAAQV0yhJoTN/d49FuiWqtwkxF6PCDiYC
 dS38tlGqmz9Yic/KwTPy+K98wylTynkj1eANuIoEMYuQ6VBnn7EZcdjkeDJJfVA25Hn1
 96cHgo4Y/vNDJ8KoanZndMvolCp0iGlXBg3ZquQGiNLSHqB2J5T+1Oattzh0puxXlNB2
 TgQqDviWGENgdEheglWjbVL+dn1BjGZkelab1un1xjmaPKB/4WBXxGhircRIXoJtVm5m
 u69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YW+9YZGrkmvhm7l1w0ntB2oUB66QBa6+CdYqZj8Ih3Y=;
 b=fnVduNvfcstbultXaByqakDaWELSry4tjl8GVm8uDa0kPXtrFJv6IahubmarUpc47N
 vzekkx+ga064rqh3tYs3zWu3H4nqGABB91EVRmoxSAK/7f6/x89QMqP8qOsZmnEObOkO
 5tyEKsRnPDjLKHRHqtCjyzGfHLmHkz+27IWwwww30Gf72Jnoy0uUGbtn7sSFRQ4Vt7Jh
 N8FAG/Whkh96A3S+oBXm4cqqrzuDXZ9G+qF0rCB4pVheL/wvFli3uT+Wq8XA4w6sEGlw
 I/+W+O749cdGVisnFjwBL7sIBV95BJAHJ8TXL0XFXuYz8hIcfIDkns22lgAezWjFr7rH
 Rp0Q==
X-Gm-Message-State: AJcUukeJACQmp5yGRUnzjpmSQGMEzdZuiLsD4v8qd9kToqUu/keznOss
 ZX+W26G5Toe6HtZtN6/cDs0n+fhv8vhdk2JDvc0=
X-Google-Smtp-Source: ALg8bN6yg3eV9bDQqPvxC5WtRtkfJ0iZDqalodzAvBHZooMjI4TSyBAnAHtHD6jtrwfDS5dGZeVtmUv0wwdaYP7AEp8=
X-Received: by 2002:a9d:6a8e:: with SMTP id l14mr36332484otq.348.1549290892681; 
 Mon, 04 Feb 2019 06:34:52 -0800 (PST)
MIME-Version: 1.0
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <CAFBinCDebPOsmrhSXecx48nGWHh7g_OGPbr1Y0M+n_v9Ht91ew@mail.gmail.com>
 <e05b7448-cd95-cdeb-c88d-3a324d5f1ddc@gmx.de>
In-Reply-To: <e05b7448-cd95-cdeb-c88d-3a324d5f1ddc@gmx.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 4 Feb 2019 15:34:41 +0100
Message-ID: <CAFBinCAkXN42piiYsc_Qmuqv0w4dbK86gq10AbZyrB-zKuh9hg@mail.gmail.com>
Subject: Re: stmmac / meson8b-dwmac
To: ingrassia@epigenesys.com, Gpeppe.cavallaro@st.com, alexandre.torgue@st.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_063453_776050_D1DD0DF5 
X-CRM114-Status: GOOD (  18.17  )
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
Cc: linux-amlogic@lists.infradead.org, Simon Huelck <simonmail@gmx.de>,
 netdev@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jan 17, 2019 at 10:23 PM Simon Huelck <simonmail@gmx.de> wrote:
[...]
> >> I got problems with my ODROID c2 running on 4.19.16 ( and some releases
> >> earlier ). the stmmac / dwmac driver doesnt provide the 800M/900M
> >> performance that i was used to earlier.
> >>
> >>
> >> Now im stuck near 550M/600M in the same environment. but what really
> >> confuses me that duplex does hurt even more.
> > interesting that you see this on the Odroid-C2 as well.
> > previously I have only observed it on an Odroid-C1
> >
> >> PC --- VLAN3 --> switch --VLAN3--> ODROID
> >>
> >> NAS <-- VLAN1 -- switch <-- VLAN1-- ODROID
> >>
> >>
> >> this means when im doing a iperf from PC to NAS, that my ODROID has load
> >> on RX/TX same time (duplex). this shouldnt be an issue , all is 1GBits
> >> FD. And in the past that wasnt an issue.
+Cc Emiliano who has seen a similar duplex issue on his Odroid-C1: [0]
(please note that all kernels prior to v5.1 with the pending patches
from [1] applied are only receiving data on RXD0 and RXD1 but not on
RXD2 and RXD3)

Emiliano, can you confirm the duplex issue observed by Simon is
similar to the one you see on your Odroid-C1?

> >>
> >>
> >> Now what happens:
> >>
> >> - benchmark between PC - ODROID is roughly 550M
> >>
> >> - benchmark between NAS - ODROID is roughly 550M
> >>
> >> - benchmark between PC - NAS is only around 300M
> >>
> >>
> >> and like i said i was easliy able to hit 800 or even 900M to my NAS
> >> earlier. I applied some .dtb fixes for interrupt levels for the
> >> meson-gx.dtsi and meson-gxbb-odroid-c2.dtb, which will be mainlined ,
> >> but the effect stayed identical.
> > good that you have the interrupt patches already applied
> > I believe it don't fix any performance issues - it's a fix for the
> > Ethernet controller seemingly getting "stuck" (not processing data
> > anymore). however, that already rules out one potential issue
> >
> >> are you aware of this problem ? Earlier kernel versions were all
> >> perfectly fine and i stepped ( self compiled) kernel through all major
> >> releases since odroid c2 was mainlined.
Guiseppe, Alexandre: what kind of data do you need from us if we see
the speeds drop (in both directions) when we send and receive at the
same time?

[...]
> the problem is that i dont have these kernel sources anymore :-(. but i
> can provide some testing and numbers. maybe i dig if i got these kernel
> configs somewhere around but i did not change much during migrating
do you remember the kernel version where it worked fine?

> im using a zyxel gs1900-8 switch and a qnap ts231p , and as i said i
> didnt change my setup. i was able to hit 100MByte/s from my NAS , so
> close to the benchmarks of 900MBit/s
I typically only do small transfers or I have traffic only in one direction.
thus it's likely that I missed this in my own tests


Regards
Martin


[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-December/009679.html
[1] https://patchwork.kernel.org/cover/10744905/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
