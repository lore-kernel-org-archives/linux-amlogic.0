Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2834C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 22:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZUzBr6zaL1ZxJl8bvHkVEr63cKqN203ru3GV7lhQFw=; b=03rKM+Kr6lHWzo
	kllc0gJhesRUb+MCGzCEFd5f6r8OOAIgAoIVAaGWfNDIQmcaeTCXB/ha/g49oPWIyim0D33OsHnCO
	03/b4qnoHiyd+SY3yABNezZjI/LuMPDJgaIvpbNrqoui69v1OPwsG7ehpHtEH+tBwY/bJEJXavieL
	s3aKVZ6nM7UqtEf3VvwVtiMPAunLrl3wnW2MJorbtmEEu3NnOuWTE7HwiNSc4/coPeCCFgVDRoYBD
	zV9utU6VYG58I624GFjUk5kx/JJ+wtyDz+2A/NlhkI3cjJFsMnhRyJbcKN0WLIKPIEG8QkqD62Bny
	uaSLQJAC61DBvoFhYsjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n72n2-00DZ50-UI; Mon, 10 Jan 2022 22:05:20 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n72n0-00DZ3z-OT
 for linux-amlogic@lists.infradead.org; Mon, 10 Jan 2022 22:05:20 +0000
Received: by mail-ed1-x52b.google.com with SMTP id w16so59336959edc.11
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Jan 2022 14:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xG5YQM2soHgltVkLWBjbHR5Qz+VeD3CXossiL42kw8o=;
 b=gHq4E60gLW4E9HRci3mAQDryUMUxbSPUrzfRwKsmHu0LQO5++Un+hSyzsuOQK0S9Qi
 K0CJUYHQjk2XAYdLvxaa/gke3RJJLJ9XOFnBBUmIdmfBjzS7zzeXmFu3wT7JiHI8uqGf
 sDlCglR3xW8q2UPDquEdZ2iM/iMYSCm69mh7Xt0FNNhllIb5HOaPPJ3v7Vd/Zz6gVrKX
 fJ+r6OhoGw7JzTSEoLsM/oQ5UILTjPZZgHwF1F+/9b65AUi3VyjmbjYw3TLjaAC42HNn
 pRfG94PEdLR8JKmSEhYcZxgwcFV0LJyglFDe2fLrP7wTzanCePvJKZvXpYTc6iOMGnAW
 9Jow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xG5YQM2soHgltVkLWBjbHR5Qz+VeD3CXossiL42kw8o=;
 b=ii6HbP5jrywhs5Vc4jP+RSUDePrMCWr5TxYJPQyi6uNmTB8nSh511KLPfQ6kWUitqd
 wK0f3+OBoPhbqyVruELLtjlMIPAXnrfIc8nkGb3Xp1aiG0yEtzh6A6OWcB3jgO0Y3H9V
 b0BSsWrPbYGGfRwcA7Xa3uMh7nuUhNZaziHqyoCc0B0ukBg27pEz3Q0e7aGQC3reWg+H
 helCJkuyM7xr/f6+vnmoNQS4sT5OKA0symsVEKCoi/GPtzthcVQ1BtB6eHeUCMSdKqQV
 wtPd+zF9kZcIiHLA0+/ooSKYGU3u4EyFiJe0cbZSXPb4jCn02MFIoEAq/1MG2e303IAP
 L9LA==
X-Gm-Message-State: AOAM5325Zq+pndZtOFfpXr4NDJWYhQSLwbe/u2M69rHpp0u5OEzLVWAi
 Rdcp0f4HZWgaeBjN1WEdAzkvKMI3/7R3sfg74Ws=
X-Google-Smtp-Source: ABdhPJyVdCMOnBfuxdOXo7mr++S1KYb0UcW3ChSaGdt7b9E0n1fgEkI2UkTiLpd8VLW7qAN5L0A6mVbWRI2kld1V30o=
X-Received: by 2002:a17:906:5a4e:: with SMTP id
 my14mr1342308ejc.302.1641852316140; 
 Mon, 10 Jan 2022 14:05:16 -0800 (PST)
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
 <CAFBinCAvFbLXoobcTWiOoUrRSFnNzhOdn-=dkxvJOMkeOC+EAg@mail.gmail.com>
In-Reply-To: <CAFBinCAvFbLXoobcTWiOoUrRSFnNzhOdn-=dkxvJOMkeOC+EAg@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 10 Jan 2022 23:05:05 +0100
Message-ID: <CAFBinCAMJXtK4VOknGmfPB0GwHnJNtQ8gSMwQR-8a-gJP6jL6g@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices dwc2
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>, 
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>, 
 "linux.amoon@gmail.com" <linux.amoon@gmail.com>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_140518_839934_76378699 
X-CRM114-Status: GOOD (  23.57  )
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

On Sun, Dec 12, 2021 at 5:08 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
[...]
> On Tue, Aug 3, 2021 at 11:32 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > Minas, you should look at analysis of the usbmon information below.
> Minas, it would be great if you could take the time to go through
> Alan's findings.
> Since it's been a while I am trying to summarize the current state of
> the findings here.
Since I sent my last email you were probably on vacation. I hope you
had a good time!

> In [0] Alan mentioned:
> > Minas, some of the things noted below may require your attention. In
> > particular, the usbmon traces don't show the root hub doing what it should,
> > which leads me to wonder whether the Genesys Logic hub attached to port 1
> > really is getting suspended and resumed properly.
>
> Then in [1] Alan goes through the usbmon traces from my Meson8b
> Odroid-C1+ and comes to the following conclusion:
> > [...] the trace shows that the GL hub was never fully suspended!
> >
> > So the question is: Why doesn't the port status on the DWC2 root hub
> > show the suspend feature set, and why doesn't the root hub port get
> > suspended?  This looks like a bug in the dwc2 driver. [...]
>
> Linux 5.16-rc4 is still affected by this issue, meaning that it hasn't
> been fixed in the meantime.
>
> I am happy about any feedback which can help resolve this issue. That
> means: even if you have an idea (like: flipping bit X in register Y
> could help) which you are unable to test yourself then please let me
> know - I can take care of the testing part (and share debug
> logs/usbmon traces if needed).
Could you please take out some time to go through Alan's findings and
let me know if/what you need from my end so we can resolve this issue?


Thank you!
Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
