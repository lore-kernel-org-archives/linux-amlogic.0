Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4F8C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Dec 2021 16:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JUcZpPXl9lbs3OYGqYsYGkbmvVxt1ji8fPIfcUFQPr0=; b=H5u0cq5ed/ybZ+
	EmgFRZoinhn3f+LcuafM6aqKWWSjuc7X8Me2PYRlFz/Th12/KM23qcUNoqVoctE9Cr/9V8Kc4XXib
	rCTqv61nUfOnsf6LULy0sQcyz1NlM+oV79UBtVmRjNs0ULB6p4OSKpBCXHsi3eIe3rPSclWBjbHG2
	tQgnWtvWy99RFDbCALC3pajcx3lAJtRGNyF54A79kn4lxRBTRgxKEEJyCpxzJKGpTogMkfMCGurgq
	qfGpYOdCLxATnL7Mj/lEEGF3DYigOmm8Fq72mmsIUYECbuAJSdsu7RpGKr4cfFDtrmjHjpXk6Z/QU
	7NpGXFK1Z7WZrsLPnjbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwRPS-006njH-JE; Sun, 12 Dec 2021 16:09:10 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwRPP-006niq-BC
 for linux-amlogic@lists.infradead.org; Sun, 12 Dec 2021 16:09:08 +0000
Received: by mail-ed1-x52e.google.com with SMTP id x10so27418134edd.5
 for <linux-amlogic@lists.infradead.org>; Sun, 12 Dec 2021 08:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DkAulMTMtKw2w5bqZ/0CFo/a59odCZge/GAfRMdK6KI=;
 b=EYgow41kI9pVQWkOWpCMbVh/3BTTHFAI/nGfAP8NJd8EJv8ms06cABW64n446w/c8n
 apn7jT3DTPNB48aKcIbBqFHXoEA49pqgA2Rgk0w/DIpf59HSS6Eny+BPDhLojF1EfgRz
 CRQ744mkaWqxrE59yOtg3uLiB71rvKiJ0bSgkXyb3oAKaQqUlNo9Sp/tpXL5+bWPRzOD
 oY7Fdb2xaJ6VoDRmljpQMTD45fKhxGtQbkOQlrhYBS5R5+jDpI5ntAVzlHFkEQlAM+P9
 OqW402KAMLVETKk7tqiZEvPzA4loy1RU6Nchm6RqDKDP++qekuwgFkTGHlvROKt9uqky
 b2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DkAulMTMtKw2w5bqZ/0CFo/a59odCZge/GAfRMdK6KI=;
 b=4voqQDrV5EPwoAAm9NjtPIkkWtUmQTL6mASOvNECzRt44qNoxubbNgRZPlPwzFSoZi
 8N1XrWaOJBOBaoyFEkC49iafqtJ1wMta8ntJZ88DDztwlKAH79H4xqSFSoCXye5ZUHk/
 GlYQCXMDgCnmROs6W8VIOGRv9wT3RgvhI7GvuTQtmdvw6389Vscy1kmMmnYzaMj4o3dL
 YXZme3YOtkezZ6Zig8zpmUrSrTxEXXhUQxFmOlHjR9fKh3C+cmoWnXOnoCfAxU7gg0nM
 G6ejEGRLTPLwFlVGyfFUl0KsGvv9cnTUNpUAiHIERZ8Kmctk5haBcmwEgVli/R9zs0UB
 B/mw==
X-Gm-Message-State: AOAM5334WYuUU54P4TRb0TZD1SBXkasPwEgWG3dLlyoUQ6lz8Q3uidw4
 s40ndRxu3CVclEpSAWkK+lnb90tOVTk+S8a6SS8=
X-Google-Smtp-Source: ABdhPJyjprtNnmboFo6/kAeDa9wBPJFQsnjcSFIOvB3Yhj6K3BRo9u3lDYCsgLMdsTPkkf6y1tJEbTWAYrPEaDbS+4I=
X-Received: by 2002:a17:907:6e8e:: with SMTP id
 sh14mr37318893ejc.536.1639325345774; 
 Sun, 12 Dec 2021 08:09:05 -0800 (PST)
MIME-Version: 1.0
References: <822c3852-1d15-2976-8672-e49ae34c328f@synopsys.com>
 <CAFBinCC_0RpCMsj3AUt9fZrjHi6_qFirQtRR1g5VJcn45GpWAw@mail.gmail.com>
 <ad475275-eb2c-6309-fc59-494f94bf0605@synopsys.com>
 <CAFBinCCXioWL+ZGwvC8Ltrmx4y2XpGK03JAm8X=wDB4_dQ+pFA@mail.gmail.com>
 <20210715014451.GA397753@rowland.harvard.edu>
 <CAFBinCD0GKcc8veWAkWG=NCban4k8n5E-QdhNfccuH8OXvtA6g@mail.gmail.com>
 <20210719145322.GA565905@rowland.harvard.edu>
 <CAFBinCDAXzDugaCcf52ubE+a==7CtDkmHpX2hAeO+DkJWQCNSg@mail.gmail.com>
 <20210721155817.GC633399@rowland.harvard.edu>
 <CAFBinCBkUsTsPiMQ2iN5U63NczxXFHv818O-G01WzJXZ36ybeA@mail.gmail.com>
 <20210803213216.GA376608@rowland.harvard.edu>
In-Reply-To: <20210803213216.GA376608@rowland.harvard.edu>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Dec 2021 17:08:55 +0100
Message-ID: <CAFBinCAvFbLXoobcTWiOoUrRSFnNzhOdn-=dkxvJOMkeOC+EAg@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices dwc2
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>, 
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>, 
 "linux.amoon@gmail.com" <linux.amoon@gmail.com>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_080907_426681_C4352531 
X-CRM114-Status: GOOD (  15.69  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Minas,

first of all, I want to apologize for the big delay in this discussion.

On Tue, Aug 3, 2021 at 11:32 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> Minas, you should look at analysis of the usbmon information below.
Minas, it would be great if you could take the time to go through
Alan's findings.
Since it's been a while I am trying to summarize the current state of
the findings here.

In [0] Alan mentioned:
> Minas, some of the things noted below may require your attention. In
> particular, the usbmon traces don't show the root hub doing what it should,
> which leads me to wonder whether the Genesys Logic hub attached to port 1
> really is getting suspended and resumed properly.

Then in [1] Alan goes through the usbmon traces from my Meson8b
Odroid-C1+ and comes to the following conclusion:
> [...] the trace shows that the GL hub was never fully suspended!
>
> So the question is: Why doesn't the port status on the DWC2 root hub
> show the suspend feature set, and why doesn't the root hub port get
> suspended?  This looks like a bug in the dwc2 driver. [...]

Linux 5.16-rc4 is still affected by this issue, meaning that it hasn't
been fixed in the meantime.

I am happy about any feedback which can help resolve this issue. That
means: even if you have an idea (like: flipping bit X in register Y
could help) which you are unable to test yourself then please let me
know - I can take care of the testing part (and share debug
logs/usbmon traces if needed).


Thank you and best regards,
Martin


[0] https://lore.kernel.org/linux-usb/20210721155817.GC633399@rowland.harvard.edu/
[1] https://lore.kernel.org/linux-usb/20210803213216.GA376608@rowland.harvard.edu/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
