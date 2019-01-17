Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8014C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 22:42:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B673820859
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 22:42:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GShQdALM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gomQyUPN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B673820859
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PAiKK56YBvzkqXx3PfwW722u6BCALWPdOg9XpSAnK5I=; b=GShQdALMuIGu1u
	ggosuN8CfreNSRJTGuZW4c+Wslzf2txn/aZsqocoToFK0fqNGX1Kkx3LP/IK/+6Mylh5c4w99sgZS
	4MdMUEccRYDAvPDAJINlRkvA4nnMaolohqJ2eOlNpgUW/V0QfNT56kutTIB6Gzlc55SbC/h1nzkHY
	IbcsCkft08AVt4WW9yfrudRAO5yCT8zDxIl7belywCFHpXY/8ROAye/sVgkqRYqUeMOoFN+rwSaZG
	SXNFuwm3uVcR3VWlwJy/LLsl7uzjYS7YgdS0w3AWIUXMyht6qEIyeDY5ZBCiAVS3e2VvWdUj0JlZk
	wc6jCaTKvgQ1YN8wDm7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkGMv-00027z-P8; Thu, 17 Jan 2019 22:42:37 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkGMs-00027Z-5d
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 22:42:36 +0000
Received: by mail-oi1-x242.google.com with SMTP id t204so7512518oie.7
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 14:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oA/l91TG8ETDak797MOk1KTEdnhvwZuqadQ+xYGHSb8=;
 b=gomQyUPNQqGZ9dH4ylz4ZA4h+lyFageSXjzbbxNey062bSTs4jGBPwPRIL7RqnQrox
 Bg/M+w3hgeWWP7O0WJNESi8fEy+kLHOnCibttWx6yP8515MaqH73FD3xQzqDvMuRuNQE
 YLQA7wlbEKkoyPwbOtikIzoRXo3TqZD4lyXhmJjc1nBA0N2l9WAjOg3c9O/XLK0omeM9
 BnF7LPSSob+W2FwYulNi2gGA8mUzPQNrEwz/Y1LEuGWknfzqcga6cE7hvXwjFUpnflS9
 YvdudD/vog+5ogCjAMiTvG/6Ilwn0cmNx9nWOnJjWWDgjnik4bmunG2UectNdRLcSWaR
 oZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oA/l91TG8ETDak797MOk1KTEdnhvwZuqadQ+xYGHSb8=;
 b=dws1LQYwBAI/IeRivohMAdUwAtrNrxfN8bnXuB3gSGZJGVJQmSuZMawTGoTmpJQ8SK
 9MuWYe5DQlShxf89FJlisTDmMHDIpfAfUc/AAke2YIEewkJij7j6nm2L1EYNkbwRAqDj
 aaj5t6wlBo7skeTK5sbWE7YfYcJDMEolrjbSLeu8rF/4i1TXsUIocYhcxagEVKxJBs1g
 Rmaq4J0Git0y/WTDXyit1baqgryLI3ZzSWMeWjDG95xsFhztFPIh+NdTkZ8ZwbIM6nYP
 i5Cys8u4h2i2AEriRrldGXz1bhufxTTKOwiKJpibjux6hpoJf1QQgbnVWFFuw6ugL9sN
 ocaQ==
X-Gm-Message-State: AJcUukd4+3XZ8id3zFGp98qh3Kx28mIABavnEs8lSDejVxPtNdMeKt/W
 X2v+oyonDlEDuSElukPSdPP2hZQu7eoY3RsQhWM=
X-Google-Smtp-Source: ALg8bN4ce1GOYhgH8RZqMF0zH5Yw7nq+HwvXdPGiR1D/KxE0wvI5mn37r8aUXJw+ipKHdYnaKgxPMIhkSXX8hH3VjzY=
X-Received: by 2002:aca:5b43:: with SMTP id p64mr4583642oib.41.1547764952828; 
 Thu, 17 Jan 2019 14:42:32 -0800 (PST)
MIME-Version: 1.0
References: <20190116165236.8330-1-jbrunet@baylibre.com>
 <CAFBinCBFge2tir-MXw+ojTxzW+7n9Uf4FzCahrw0MDzAYV2SSg@mail.gmail.com>
 <f7289814e316ad5879848fb8c379db396f615828.camel@baylibre.com>
 <CAFBinCDhryOWHmRKp7GhWp2O+NpJziEgHoUE4HKVitTPDMrrBQ@mail.gmail.com>
 <ba1f56258e7873041a0f75996e376170563c9e6e.camel@baylibre.com>
 <CAFBinCAdJu2C-LWspiHR4vVr=PUD2HGNi4zz+CSJP96ZE4GoJw@mail.gmail.com>
 <0dcd4c655bd9477d7adf2c6e32a1f0ebab18cee0.camel@baylibre.com>
In-Reply-To: <0dcd4c655bd9477d7adf2c6e32a1f0ebab18cee0.camel@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 17 Jan 2019 23:42:22 +0100
Message-ID: <CAFBinCBSxCMqhF+Tvw3DfBeXQzthT9U+QtWxmPA+1X+SwivFmA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: fix g12a buses
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_144234_223457_FC1C78F0 
X-CRM114-Status: GOOD (  23.53  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jianxin.pan@amlogic.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jan 17, 2019 at 10:45 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Thu, 2019-01-17 at 22:20 +0100, Martin Blumenstingl wrote:
> > On Thu, Jan 17, 2019 at 9:39 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > On Thu, 2019-01-17 at 21:27 +0100, Martin Blumenstingl wrote:
> > > > OK, but we had incorrect documentation in the past. did you check this
> > > > with someone from Amlogic?
> > > >
> > > > I'm curious because there seem to be two different approaches here:
> > > > 1) hiubus name and offsets are being fixed within this patch
> > > > 2) aobus is being dropped here and re-introduced with a different name
> > > > later
> > > > on
> > > >
> > >
> > > because hiu exist and aobus does not, for which both the name and size was
> > > wrong
> > >
> > > > approach 1) can also be used for the "rti" region (at least in my
> > > > opinion, the patch doesn't explain why it can't be done):
> > >
> > > THe patch remove aobus (instead of fixing name and size) because, of the
> > > multiple region documented covered by this 'made region', I did not
> > > anticipate
> > > which one will be required and I did not want to add them all.
> > >
> > > Better to add them as needed, which is want I done for pinctrl as you
> > > pointed
> > > out
> > >
> > > > rename "aobus" to "rti" and change the size to either 0x1000 or 0xb000
> > > > (both values can be found in mesong12a.dtsi from
> > > > buildroot_openlinux_kernel_4.9_fbdev_20180706)
> > >
> > > RTI is added here:
> > > https://lkml.kernel.org/r/20190117103151.3349-1-jbrunet@baylibre.com
> > >
> > > I don't really understand the problem ? result is the same
> > the actual problem is "me" as I have conflicting information:
> > - Amlogic's buildroot kernel (for G12A) uses similar bus definitions
> > as the GX SoCs (for which there are public datasheets) - this is how
> > Jianxin added it to meson-g12a.dtsi originally
>
> And it was the same for the GX family. AOBUS in the DT while there nothing
> about this in the memory map. Keep wrong patterns does not make them right.
>
> I'm merely reading the memory map here
can you explain which "memory map" you are reading exactly?

my source is the "memory map" section in the public S905X and S912 datasheets:
- "S912_Datasheet_V0.220170314publicversion-Wesion.pdf" page 48
- "S905X_Datasheet V0.3 20170314publicversion-Wesion.pdf" page 43

> > - this patch does it different - but cannot check if this is correct
> > (no public datasheet is available for G12A or AXG) nor do I have a
> > "big picture" of upcoming changes
>
> Yes it does it differently. We should have picked up on this a while ago,
> since gxbb at least, and we did not. There reason to create bus that don't
> exist in the memory map of any recent SoC.
in the GXL and GXM datasheets from above there is:
range: 0xC8100000 - 0xC81FFFFF
name: RTI

thus in my opinion, based on the two datasheets from above:
- the bus definition (start, size) in meson-gx.dtsi is fine
- probably have the wrong name for this bus in meson-gx.dtsi
- (assuming that GXBB, GXL and GXM are all the same - I only compared
the last two)

> Creating bus should at least require a start and end offset explained
> somewhere. Copying vendor DT is not enough
I fully agree on this one!


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
