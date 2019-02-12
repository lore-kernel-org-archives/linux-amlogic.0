Return-Path: <SRS0=SW07=QT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E815FC282C4
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 15:08:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA2B521773
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Feb 2019 15:08:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MRS9ZIv1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO5+qE/O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA2B521773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0mTURolwWtBlQu2lL7JBa7DhQWZKDQGxT1fxwbLRTVY=; b=MRS9ZIv1atn8CV
	COgp/NVkR8YkHZK59dZE8OiWr8zalJ8sui0cVDzUoVB7PCPd88rQqLLcAGrZAIPIM0BjHENo3Vir8
	wSpFU3BCTC9whnHJk4p9u21EziHngFh6iRgqjGVSM6quY3MWWr6Aw0FFgQESzi8r/ioWNoTyPEX/d
	1nm2+tMjyyZqA+tXmvdGXhLrPP50ZVSH2qSRB83/w6kAYCZlXkHl/oYfGCQHfiZvb611uS9M5BSir
	hQ+iJisIuvaxs3YnxqlWWCgoQfQMWzCpAw/2ymVxHkghOqEUtu2C2ybLDjpZ4yI64yExYEFn6io93
	sXdJQ4r7JmMDoG4aSx/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtZfF-0004Ml-9q; Tue, 12 Feb 2019 15:08:01 +0000
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtZfB-0004Lo-7Z
 for linux-amlogic@lists.infradead.org; Tue, 12 Feb 2019 15:08:00 +0000
Received: by mail-it1-x141.google.com with SMTP id b5so8275371iti.2
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Feb 2019 07:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Z7Jx+dIPpeiQSbwY0qS2eois57M0RWePM70mF1ECzs=;
 b=iO5+qE/OQv/xBwya0eKkiOPVjEO52bMrqVXj5C0gJgjUqQcUF9n4gBTRBI2kXTscv1
 xWbgYdIArd8dEVDyGDShe9qEOwEfeG7IWOllv6mANkTsFXU2v4YlXF0zfxilNHn+ixAY
 5g8ispgtyCQFHdAPcWYTN/uJXSXz3EHPKQPdGmbdqzGtYsbCPdm3Uw+0d444UkGSHBeN
 8MqBenQd5JEHSJeiY0hTPu/EwgAdot8UC85Twy2V9X6ItxRvvho6o17110XrGhDgZHww
 Wq/hR+xGlge9wpdD8hpSwTwORSvX0YQlFH4JXfrxSgUrnba/HrLm6KabxsM5zaLoymdm
 YnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Z7Jx+dIPpeiQSbwY0qS2eois57M0RWePM70mF1ECzs=;
 b=FpeZXa1XVKhdgLDDBgIqgc/jsGk2Jx8xDAga+dCnfSSpw51p9thC8w0gaRT3BSqjUL
 ytBuKs8dIEO1kLaNvns4icqN6lqGv/kRpwQVyL0hFc9Xt3tCEzGpJD/EMXNqiLAxY271
 dQc4NQRlJtDSXEST+D9Casgq9mUaEbbFcAi01OV12RtQN7hh7Lc0w76JJCmzvzkD4Nu9
 tX90Agl+Bis8516l2RWURm0a4+x5m2rbFeNcDMvR6oax5pgjbDagwXserDcOUIER1ARD
 taHA9zVV+2cN42nGE9xYin/vJdQguD3ZVpiwKIWNyrdqig8+XDSnJdOfFLcORYABJipS
 82cQ==
X-Gm-Message-State: AHQUAub9UU/jTiL2I2cbWtJq2+xp32T5ijGh7RHv7MMv+62rcCdJGGfI
 5ccOlqkwQxvBMtG4pE4HWEAcSrAWpXTDgAwOiTZ0y1SF
X-Google-Smtp-Source: AHgI3IaF7rX+IbhIqmUxS2QXdkNNQoSa/80dCG3PV2eYIvfdQDhbMNjkXooNnEQuWLuWn/1rytumtIJ035v6T9SqZW4=
X-Received: by 2002:a6b:d904:: with SMTP id r4mr2219509ioc.98.1549984075888;
 Tue, 12 Feb 2019 07:07:55 -0800 (PST)
MIME-Version: 1.0
References: <CAPo5REEKkqctyS2+X8xjn8YgH93RrtAqBu4nELxzgSo0TCgeAQ@mail.gmail.com>
 <d017efc7-e5ba-ea5f-4218-0f05ed86bbec@baylibre.com>
 <CAPo5REGnr=c=6OGm=b5Bmu7mDravAfMJ0f=OAD=iLS=21ZM+kg@mail.gmail.com>
 <186a965b-043e-511f-aa84-980e4bac2388@baylibre.com>
In-Reply-To: <186a965b-043e-511f-aa84-980e4bac2388@baylibre.com>
From: Piero <ottuzzi@gmail.com>
Date: Tue, 12 Feb 2019 16:07:45 +0100
Message-ID: <CAPo5REHiTd91rO_4_i0984RnWjX8pKhX4uDuk7Df8MJXTDCiXg@mail.gmail.com>
Subject: Re: odroidc1 eth0 problem with 250HZ
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_070757_268528_E83256C5 
X-CRM114-Status: GOOD (  22.32  )
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

   odroidc1 eth0 is working *only* with 100Hz.
The issue started on armbian since all kernel config were switched to
250hz for performance reasons[1] and odroidc1 had issues on eth0.
Then I observed 100HZ was working.
Today I tested 200HZ and still eth0 is not working.
So... even if I did not tested all possible combinations it looks like
there is something wrong somewhere :)
Please ask if you need more logs or insight.

*Ciao
Piero

[1]https://github.com/armbian/build/commit/73341048187f4e9698c8f42b7c3ee022e19ef0b0

Il giorno mar 12 feb 2019 alle ore 14:57 Neil Armstrong
<narmstrong@baylibre.com> ha scritto:
>
> Hi Piero,
>
> On 12/02/2019 14:21, Piero wrote:
> > Hi,
> >
> >   in an old thread[1] there is this sentence: " - enable Ethernet on
> > the Odroid-C1 (according to your last thest a TX delay of 4ns is
> > required to make it work properly)".
>
> This delay is a setting in HW, and it not correlated at all with the HZ setting.
>
> > So it looks that timing is important to make eth0 of odroidc1
> > functional and this correlate well with my observations on kernel HZ.
> > I just tested with 200hz (simply only this change...nothing more) and
> > odroidc1 eth0 is not working again.
>
> You mean *is working* again ?
>
> You should test a whole range of values, up to 1000Hz.
>
> Neil
>
> >
> > *Ciao
> > Piero
> >
> > [1]https://lists.infradead.org/pipermail/linux-amlogic/2018-January/006164.html
> >
> > Il giorno lun 28 gen 2019 alle ore 11:08 Neil Armstrong
> > <narmstrong@baylibre.com> ha scritto:
> >>
> >> Hi,
> >>
> >> On 24/01/2019 15:22, Piero wrote:
> >>> Hi,
> >>>
> >>>     I tested armbian distribution on my odroid C1+ using kernel
> >>> 4.19.17 and later.
> >>> I observed that with 250HZ kernel eth0 is non-functional giving the
> >>> following error:
> >>>
> >>> [   14.853086] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> >>> [   14.853367] meson8b-dwmac c9410000.ethernet eth0: device MAC
> >>> address b6:e8:26:b6:da:4a
> >>> [   14.853378] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
> >>> [   14.853386] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
> >>> Cannot attach to PHY (error: -19)
> >>> [   15.064433] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> >>> [   15.084471] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
> >>> [   15.084486] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
> >>> Cannot attach to PHY (error: -19)
> >>> [   15.193033] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> >>> [   15.225926] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
> >>> [   15.225958] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
> >>> Cannot attach to PHY (error: -19)
> >>> [   15.239227] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> >>> [   15.293190] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
> >>> [   15.293213] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
> >>> Cannot attach to PHY (error: -19)
> >>> [   15.306038] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> >>> [   15.352091] meson8b-dwmac c9410000.ethernet eth0: Could not attach to PHY
> >>> [   15.352111] meson8b-dwmac c9410000.ethernet eth0: stmmac_open:
> >>> Cannot attach to PHY (error: -19)
> >>> [   15.370056] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> >>>
> >>> Only changing 250HZ to 100HZ is enough to fix this problem.
> >>> Some more details on armbian forum[1].
> >>> Can you check it please?
> >>> I can provide more logs and details if requested. If needed I can test fixes.
> >>
> >> This is weird, it could be a sleep not long enough with the changed HZ, can you test other values ?
> >>
> >> Do you have other failures ?
> >>
> >> Neil
> >>
> >>>
> >>> Thanks in advance
> >>> **Bye
> >>> Piero
> >>> [1]https://forum.armbian.com/topic/9138-odroid-c0c1c1-please-update-the-mainline-kernel-version/
> >>>
> >>> _______________________________________________
> >>> linux-amlogic mailing list
> >>> linux-amlogic@lists.infradead.org
> >>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> >>>
> >>
> >>
> >
> >
>


-- 
Stupid is as stupid does.
Forrest Gump

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
