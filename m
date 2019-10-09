Return-Path: <SRS0=pqGQ=YC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D8B5C47404
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Oct 2019 17:06:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BA7120B7C
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Oct 2019 17:06:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WoRo7VrZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="SmKMpQLM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BA7120B7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXwINBSGJe4c9GluX8KVDoFnAoeaLpnMrgsEvoRq97I=; b=WoRo7VrZDXAM2k
	OzxPtie7kxus+v0VnWIwX1uZ2oGZnVWN9S2yUVgPb6EI3JU2XEWChGzsmaqjDYVQjc0b2u10E5VYo
	tlwMVghIiRcosN9Leu2BHXtWewd3b0zpN/fTi+nHK07tcertvyR0CNv9QYw8JNfiTQe9IVCBk20jB
	pzMw4/QdDvU81XeS4gQRnfHcpzFvgXpvWjYM2l+Pf+cAMTLhhym2x+56C8BwtN8tvPFzZ+sxv1nBI
	E5//JAubbiLbKKxsEYxo9otCos8bB9kLUunWr/SczikKrtso0U/OHHnVAyaA7k9hd5/U0TB7NnhMp
	Ri8muvuBOEfceqiHHvew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iIFPc-0002QJ-NJ; Wed, 09 Oct 2019 17:06:08 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iIFPT-0002I7-Lz; Wed, 09 Oct 2019 17:06:01 +0000
Received: by mail-oi1-x244.google.com with SMTP id 83so2412327oii.1;
 Wed, 09 Oct 2019 10:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D2mWDjNiFA8ZmwOSzNfxAaNscOF3X+a/Kjb9sBM4nYM=;
 b=SmKMpQLMdu9zF+nZETtyRyzRFHvqJQM931spdY+ZgtQexKRYWMGEJ/SEMSjPLRwgyX
 sGCfwlBzFBSSOoOzZLbNiPuenj186i0Q7O7o4hyzoB/N1b6hXnlm4oQPBxy0cSQ98bGH
 +x4VPv8LVWtflqbB9+1yalCGMt+xywez2ywORN8R2ErdI0GVP9PpkcGn8eZZ8O2JUM0a
 eD/ZrXd47/tKoNo4ITdNZBi9cgx0HQu6Az30CNCGEEg6kXWwqoRIrbg0h5iH+fCF1bLF
 M1G353WsH6zE4VwfLPFeaGBAVKlGrbU1LWazFwx1S2wB5DtSH+hZg90j0MwtKUYG5/lu
 g2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D2mWDjNiFA8ZmwOSzNfxAaNscOF3X+a/Kjb9sBM4nYM=;
 b=lrec+RGLnX791nA8NZzcm68ux1tLkLElVfuQqjfFEFCVK/ghNubYDTdyXWtdVWgcUo
 StCnwcQOzYdBk4/gqq7UI6t1GytrAlFr2VLBWZkHL/wvOh22KuDk4+3Aov1WQBbBBPXm
 8AlaEXckCcVTmQOns5l2apn9h69naEtvr3RGWZD85homoFDKkp1AXk+hQMhmINFC2M5E
 ThQXW2d2QMCZQ/FLMIdzIzjIfnHcE9WIriE0a5eEPUcAkRThdRL+Q3eSHgnyFIv66DR2
 weRGr3gdLwsqUiHbCqtesu7rhYKqMxBSFA3RI3+kcQaizTGGf8HdMTlWnO0DYymAPnTe
 mTlg==
X-Gm-Message-State: APjAAAVZznw06Gq5MD7eV/Lt3KOEnqCp0W4HCKbpb7lMiiElB/EdFm/v
 qTdoLY64iPHxbk+kURVLs3tSbhCaiv1IpVI3Xns=
X-Google-Smtp-Source: APXvYqzRkSN7OkK/hbG3KqKLVZ1gB3egs7zTwNvk2ZAefW8rYVwzudrNvLiAtRk9tvfW75gia/FxyzlIvLMQYI7QLR0=
X-Received: by 2002:aca:d90a:: with SMTP id q10mr3536020oig.129.1570640757567; 
 Wed, 09 Oct 2019 10:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20191007131649.1768-1-linux.amoon@gmail.com>
 <20191007131649.1768-6-linux.amoon@gmail.com>
 <CAFBinCAoJLZj9Kh+SfF4Q+0OCzac2+huon_BU=Q3yE7Fu38U3w@mail.gmail.com>
 <7hsgo4cgeg.fsf@baylibre.com>
 <CANAwSgRfcFa6uBNtpqz6y=9Uwsa4gcp_4tDD+Chhg4SynJCq0Q@mail.gmail.com>
 <CAFBinCA6ZoeR4m4bhj08HF1DqxY1qB5mygpaQCGbo3d8M+Wr9Q@mail.gmail.com>
 <CANAwSgSeYTnUkLnjw-RORw76Fyj3_WT0cdM9D0vFsY8g=9L94Q@mail.gmail.com>
In-Reply-To: <CANAwSgSeYTnUkLnjw-RORw76Fyj3_WT0cdM9D0vFsY8g=9L94Q@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 9 Oct 2019 19:05:46 +0200
Message-ID: <CAFBinCCHrvjNTruVk7qr+7Y_m7mP2BJ-0HxftJpiPXpvoD=-QQ@mail.gmail.com>
Subject: Re: [RFCv1 5/5] arm64/ARM: configs: Change CONFIG_PWM_MESON from m to
 y
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191009_100559_728793_A1FA75A2 
X-CRM114-Status: GOOD (  20.06  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-amlogic@lists.infradead.org,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Anand,

On Wed, Oct 9, 2019 at 10:49 AM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > can you please share a boot log with the command line parameter
> > "initcall_debug" [0]?
> > from Documentation/admin-guide/kernel-parameters.txt:
> >  initcall_debug [KNL] Trace initcalls as they are executed.  Useful
> >  for working out where the kernel is dying during
> >  startup.
> >
>
> Well I have tied to add this command  *initcall_debug* to kernel command prompt.
> Here is the console log,  but I did not see any init kernel timer logs
I don't remember from the top of my head if any additional Kconfig
setting is needed

> Kernel command line: console=ttyAML0,115200n8
> root=PARTUUID=45d7d61e-01 rw rootwait
> earlyprintk=serial,ttyAML0,115200 initcall_debug printk.time=y
>
> [0] https://pastebin.com/eBgJrSKe
>
> > you can also try the command line parameter "clk_ignore_unused" (it's
> > just a gut feeling: maybe a "critical" clock is being disabled because
> > it's not wired up correctly).
> >
>
> It look like some clk issue after I added the *clk_ignore_unused* to
> kernel command line
> it booted further to login prompt and cpufreq DVFS seem to be loaded.
> So I could conclude this is clk issue.below is the boot log
interesting - as Jerome suggested: the next step is to find out which
clock is causing problems
last time I checked there was no debug print in the code which
disables unused clocks so I had to add that myself

> Kernel command line: console=ttyAML0,115200n8
> root=PARTUUID=45d7d61e-01 rw rootwait
> earlyprintk=serial,ttyAML0,115200 initcall_debug printk.time=y
> clk_ignore_unused
>
> [1] https://pastebin.com/Nsk0wZQJ
>
> > back when I was working out the CPU clock tree for the 32-bit SoCs I
> > had a bad parent clock in one of the muxes which resulted in sporadic
> > lockups if CPU DVFS was enabled.
> > you can try to disable CPU DVFS by dropping the OPP table and it's
> > references from the .dtsi
> >
>
> Yep yesterday my focus was to disable PWM feature and get boot up-to
> login prompt
> But not I have to look into clk feature.
>
> *Many thanks for your valuable inputs, I learned a lot of things.*
you're welcome :-)


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
