Return-Path: <SRS0=SW07=QT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC9DC282C4
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 13:22:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BBAC214DA
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 13:22:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tXjjLVtO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fddpFaNP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BBAC214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSRFlRQK+zbdn/XGCcOQZqNHMlE/h+GPRnKWMfGGEj8=; b=tXjjLVtON1Wd0Z
	3OXhZ2dUifIobAH9ZwN7XVpUGNI6Ksqa2B4BZIkfgmgXDA/YXf4dSNOIzjOJ3coF4tVYv9pk34tGr
	qRNww1V3vcMaHr/2MlyzryvFt7KLnBqLlijyHs0IA6IF8oLA8gcrMbva7Oo/miv82+ZlAi5Cse2es
	3nEf7mFLSiMClc7xwyTDLeN0V1BFTf9iaFSfIsEVhHcfhwG+ABeNvXVDsy6qwugXV7dQbvOLkboLF
	QDIS7ztkk6uv3vIOoi/fa8stglhIfmDVmkjRR/YtgkgbmCtyZ99SyL02Ex8n2Ses19fnh1NCM8lvY
	mJVKfao0SZiPRAic0ujA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtY0q-0003C7-6s; Tue, 12 Feb 2019 13:22:12 +0000
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtY0m-0003Bj-FC
 for linux-amlogic@lists.infradead.org; Tue, 12 Feb 2019 13:22:10 +0000
Received: by mail-it1-x144.google.com with SMTP id i145so7060645ita.4
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Feb 2019 05:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rWdXRoK49uY3gJdbb8dd+GJJpWxuwp8fSrhRYQJHtmQ=;
 b=fddpFaNPOGbcMxG6j+jyXfIAYQmJRWXW4ytZMqTz+oYir3RrdO/PptooGIA6I5+qJj
 7GVkuXXyUhMvYZ2hJzOQQc3JvvwG0smOO17CreGGs6dSfKVWmaua5hhOqlL+OZAbzDwI
 4dvIQWiXC0vVS0paVCSqeA4MLDjGaqyoZa6oWS4DB3lpjrG+rO0ZiFktTQtICud2rzha
 5iojZAl54pgAUZsYSRxiXrxirDBRNExnmMiF9xTeVwYRKmByIcx7ZNdC5AJmlLh2aYig
 b8AeQHEbbvr49xtYULCuOSy6ePrfSqBJiXU8ZAQfrYJqx6C3dgy9Cah64yQ+vPMUrJKL
 2FTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rWdXRoK49uY3gJdbb8dd+GJJpWxuwp8fSrhRYQJHtmQ=;
 b=UFHQ1kxYXKG761akEfUqdFvc+bFMMUgnwcfb2yVrwZRZSJTdSs7edrqeZE2g6QzZfj
 28e9yUpd5dw/rP6l91uYtY5e/I4f0NZqVDxzlueyPCKNUhvb6GuD9BE/Ru3VnYZ6pv2n
 KD6l5/OykNnhwkTCuTFIFMmdmg0rxcctWala7M/1yKbkt5jSFJqSl951iXUTqfe/2PXG
 oHV7m/rzfFWC44vZbPYVtjsXzbz6wf1wMD7+qdBe1sW6MDyptY5i9tNeajX1yvysEXAe
 0jRb+iqGy2WUESeMU48hF4K7J0qbpwLPT9PJtkFhn0ymtMTccglIKk+EMtFLJx7WH9I4
 shdQ==
X-Gm-Message-State: AHQUAuZ2O/nme/CdKAirHjLpIXx42ryrGguOmCbDO5p6SKjR374481N4
 a89YaloznyStN2T0oo0jkL0Ji6ipzmJfsab2Bfs=
X-Google-Smtp-Source: AHgI3IajwLznlhV9W+EMQyfAF+YuWwqB0N+IijoyaaEE3m61vuX5p0+cdWQori+at6erjUZkURPIr7o3epxyviRhMSw=
X-Received: by 2002:a5d:8701:: with SMTP id u1mr2116507iom.69.1549977727284;
 Tue, 12 Feb 2019 05:22:07 -0800 (PST)
MIME-Version: 1.0
References: <CAPo5REEKkqctyS2+X8xjn8YgH93RrtAqBu4nELxzgSo0TCgeAQ@mail.gmail.com>
 <d017efc7-e5ba-ea5f-4218-0f05ed86bbec@baylibre.com>
In-Reply-To: <d017efc7-e5ba-ea5f-4218-0f05ed86bbec@baylibre.com>
From: Piero <ottuzzi@gmail.com>
Date: Tue, 12 Feb 2019 14:21:56 +0100
Message-ID: <CAPo5REGnr=c=6OGm=b5Bmu7mDravAfMJ0f=OAD=iLS=21ZM+kg@mail.gmail.com>
Subject: Re: odroidc1 eth0 problem with 250HZ
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_052208_537430_C585E3C4 
X-CRM114-Status: GOOD (  17.33  )
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
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

  in an old thread[1] there is this sentence: " - enable Ethernet on
the Odroid-C1 (according to your last thest a TX delay of 4ns is
required to make it work properly)".
So it looks that timing is important to make eth0 of odroidc1
functional and this correlate well with my observations on kernel HZ.
I just tested with 200hz (simply only this change...nothing more) and
odroidc1 eth0 is not working again.

*Ciao
Piero

[1]https://lists.infradead.org/pipermail/linux-amlogic/2018-January/006164.html

Il giorno lun 28 gen 2019 alle ore 11:08 Neil Armstrong
<narmstrong@baylibre.com> ha scritto:
>
> Hi,
>
> On 24/01/2019 15:22, Piero wrote:
> > Hi,
> >
> >     I tested armbian distribution on my odroid C1+ using kernel
> > 4.19.17 and later.
> > I observed that with 250HZ kernel eth0 is non-functional giving the
> > following error:
> >
> > [   14.853086] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> > [   14.853367] meson8b-dwmac c9410000.ethernet eth0: device MAC
> > address b6:e8:26:b6:da:4a
> > [   14.853378] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
> > [   14.853386] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
> > Cannot attach to PHY (error: -19)
> > [   15.064433] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> > [   15.084471] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
> > [   15.084486] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
> > Cannot attach to PHY (error: -19)
> > [   15.193033] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> > [   15.225926] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
> > [   15.225958] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
> > Cannot attach to PHY (error: -19)
> > [   15.239227] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> > [   15.293190] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
> > [   15.293213] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
> > Cannot attach to PHY (error: -19)
> > [   15.306038] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> > [   15.352091] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
> > [   15.352111] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
> > Cannot attach to PHY (error: -19)
> > [   15.370056] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> >
> > Only changing 250HZ to 100HZ is enough to fix this problem.
> > Some more details on armbian forum[1].
> > Can you check it please?
> > I can provide more logs and details if requested. If needed I can test fixes.
>
> This is weird, it could be a sleep not long enough with the changed HZ, can you test other values ?
>
> Do you have other failures ?
>
> Neil
>
> >
> > Thanks in advance
> > **Bye
> > Piero
> > [1]https://forum.armbian.com/topic/9138-odroid-c0c1c1-please-update-the-mainline-kernel-version/
> >
> > _______________________________________________
> > linux-amlogic mailing list
> > linux-amlogic@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-amlogic
> >
>
>


-- 
Stupid is as stupid does.
Forrest Gump

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
