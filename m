Return-Path: <SRS0=wiQb=Q5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770B9C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Feb 2019 17:21:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48486206B6
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Feb 2019 17:21:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="epE9XSRh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSb0PmgG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48486206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n04En69sH1S274Y7xCAZSmTIWNnKfCKHaVSRmc6qPcM=; b=epE9XSRhCDJRQX
	VMmurtD8uNfVrLFL8CqSvuh4jf26uWBMZWtTtLc1vzls4/deWz7n0s7pIOmfer88FsPUyUsZLW3uR
	JBlFaYZasR8E6qkhk01WcbOvbMV97jSR3e7lMlhRobX6G8oVTrE2IeV3JPBvy+90cVzB0sApwCyw3
	NgbdDN5m/vTZYYROESo4mINlakoxtIUyfRKOjFKOGXMbyG2fmlIqHNRh09+N92+eeJdIuBGr9HPa5
	+3AYql+YzOxlbeQlwQqrVTxNM/eowWPmelC2mFh4MCPEwhu4sUkG8EvZBhUO6iYWIxRXhjOUfDlGq
	w5qBnSIt2p7FPqebp/nQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxEVr-0007wJ-4l; Fri, 22 Feb 2019 17:21:27 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxEVn-0007vg-H2
 for linux-amlogic@lists.infradead.org; Fri, 22 Feb 2019 17:21:25 +0000
Received: by mail-ot1-x341.google.com with SMTP id c18so2454021otl.13
 for <linux-amlogic@lists.infradead.org>; Fri, 22 Feb 2019 09:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E+mjVV+vVPHFUnajTMPbIfoDMT9dA7VnBIBNAO7mpqU=;
 b=SSb0PmgGZP8ebtdUz0F2CcgJTw1jrgOMyk/MeAPNBAvompvd9QqCnX/A+o5qsnQVvg
 xarfiMJbULt/2107znF3IR4vurgr7z9dHgXY+4GXfvtB4ipBVRzkIVt3BmaPsTulzxDA
 vXs9KlfNh12ZyuXkbxiCcWAobVv+kPm0xUaH1Ze1QxvRpr9mZmtRnpP+vEiB4gQvlfwt
 WueztnpVwNi/oFfoPtZmkU7IldIZMEnfcBK8dz8VBwYlg73irDhfv9+8KqOyq0SeSr/c
 dY8HDUMgvGwRQGCYibPH7/b5LHBfK7vhF58hhZ3aMUeoi+xrmEIV58ketU7UYD+9y+wF
 v1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E+mjVV+vVPHFUnajTMPbIfoDMT9dA7VnBIBNAO7mpqU=;
 b=DUAb7lQQFd1MkKUDfSoatJ/ffuX5JCprmgBpVVM/h2kLZB2GWzu0MZFwH1zAZa8Zqq
 EfjtFt7a7LlfJYVSdwWThaPv0P+5W2nw1VEAk5bcv6YOWbVeQxz9kbNKG6CrLmFNMRMw
 0l1gTivhjbfymB4sr2bHkMH8O5PB2NAc9oVuFpxeAhplNGViwms8/ksyl5fIbII/BQ+m
 /ftlhgw9XNpTVK1l5pwn/tfKml5nqrT4t36/OU/Ax2SJokp6r99dbqDvFn0VQgAoU8ew
 w6Nm8VTBNcNoqwRWiOZWcDgewYmgtDXWKPO8w0vdcx+wbxfLIKaXv8fD5dMG9RtYXN3p
 ujiw==
X-Gm-Message-State: AHQUAuZu3YbPhDWXDNkGNO0aSxJhVA92tgm5rhmPURDCGNKCXLIComSD
 LBE5TeCWWf79stV+QVOu8fZUjyrAcnJrJf1Xihs=
X-Google-Smtp-Source: AHgI3IaZ6Gowfl/8tpzzHW7bMTXVqFW+gFJj/nWPPrOubb1hWf9y0vCaplvgFPG6DzCli3y5X6DEJ9IO+9oQeErZ+Nk=
X-Received: by 2002:a05:6830:1108:: with SMTP id
 w8mr3245717otq.167.1550856081940; 
 Fri, 22 Feb 2019 09:21:21 -0800 (PST)
MIME-Version: 1.0
References: <a38e643c-ed9f-c306-cc95-84f70ebc1f10@gmx.de>
 <c80c1e5b-fed9-25ce-eb1b-258ac0135ce7@synopsys.com>
 <7afdaa0d-d0ef-b223-1f6e-2b52bfa44784@gmx.de>
 <6f25da2b-7f28-b888-3240-7178ac75c90c@synopsys.com>
 <84fb981c-75ab-ef9e-edd6-cd0c52d9dc36@synopsys.com>
 <cd344fa3-758f-3824-ddd3-568ce837c4f7@gmx.de>
 <8bae9cd6-5c44-30e3-bfe5-8d6f853f170e@synopsys.com>
 <065407cd-c13b-e74c-7798-508650c12caf@gmx.de>
 <227be4e9-b0cc-a011-2558-71a17567246f@synopsys.com>
 <45e73e8c-a0fb-6f8f-8dc6-3aa2103fdda3@gmx.de>
 <e1d75e7f-1747-d0ce-0ee7-4fa688b90d13@synopsys.com>
 <4493b245-de93-46cd-327b-8091a3babc3a@gmx.de>
 <adafe6d7-e619-45e9-7ecb-76f003b0c7d9@synopsys.com>
 <cd0b3dec-af3f-af69-50b7-6ca6f7256900@gmx.de>
 <fa35fb4a-b9d5-9bbb-437d-47e8819d0f27@synopsys.com>
 <244d7c74-e0ca-a9c7-f4b0-3de7bec4024b@gmx.de>
 <1426d8ed40be0927c135aff25dcf989a11326932.camel@baylibre.com>
 <9074d29b-4cc9-87b6-009f-48280a4692c0@gmx.de>
 <d7de65c614ee788152300f6d3799fd537b438496.camel@baylibre.com>
 <e009cbbb-e31d-2438-e454-2fa10ebec542@gmx.de>
In-Reply-To: <e009cbbb-e31d-2438-e454-2fa10ebec542@gmx.de>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 22 Feb 2019 22:51:09 +0530
Message-ID: <CANAwSgRvbzN7r1PTFp9viSYb5Er4QGM4+9sDBbDu67tGyxdR+A@mail.gmail.com>
Subject: Re: stmmac / meson8b-dwmac
To: Simon Huelck <simonmail@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_092123_587076_7CC4D0EC 
X-CRM114-Status: GOOD (  18.94  )
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
Cc: Jose Abreu <jose.abreu@synopsys.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>, Gpeppe.cavallaro@st.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi All,

On Fri, 22 Feb 2019 at 01:05, Simon Huelck <simonmail@gmx.de> wrote:
>
> Am 21.02.2019 um 18:46 schrieb Jerome Brunet:
> > On Thu, 2019-02-21 at 18:27 +0100, Simon Huelck wrote:
> >> Hi,
> >>
> >>
> >>
> >> this was changed recently, with a patch for the EEE stuff , see here:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.0-rc7&id=e35e26b26e955c53e61c154ba26b9bb15da6b858
> > Hu, I was not aware this finally went through. Good !
> > As explained in the patch and by Jose, the GMAC should be using IRQ_LEVEL.
> >
> > The realtek PHY has EEE enabled by default. Having this enabled generates a
> > lot of (Low Power) Interrupts.
> >
> > Previously, when the GMAC used IRQ_EDGE. Because it is wrong, we would
> > eventually miss an IRQ and the interface would just die. Unfortunately, it was
> > not that easy find out.
> >
> > 2 years ago, we just noticed that disabling EEE would make the failure go
> > away. Forcing this EEE feature off through DT was merely a work around.
> >
> > Now that the real cause of the problem is known, there is no reason to keep
> > this hack around.
> >
> > Whether EEE adds a performance penality and why, is another topic.
> > As Jose pointed out, you can disable EEE at runtime, using ethtool.
> >
> > Jerome
> >
> Hi,
>
>
>
> i disabled EEE via ethtool and via the .dtb , but the performance
> penalty stays. Kernel 4.14 still gives me the former "good" performance.
>
>
>
> regards,
>
> Simon
>
>
Sorry this is off the topic.

I am using Archlinux on Odroid C1+ and the latest kernel loads with no issue.
only issue is I have is the each time their is random MAC address so I
get new IP from dhcp server.
How can I avoid this. I have tried to enable eFuse driver but with no success.

On Odroid C2 I dont have any issue, it always retained the unique MAC address.

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
