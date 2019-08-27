Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3E7C3A5A6
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 21:20:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B21D620828
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 21:20:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t08S7eHd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="fPm/hV4Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B21D620828
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqoXpJ62oMwZsoz52Rk/VOv4VIpiiiOzv23wxtm7IQw=; b=t08S7eHdgb6EFZ
	B/zflOt/p9RrxgJx1dmTbbNBEKHCRLOU8u++bRoWSjWL/c/C/tj+3O3eevVO+Ttnv9OjDh5E8qeC1
	bpKFi+ULZdS7EDUVay0e+SbkEFW48quW8yw7/DWA1WvPfDYPdtUX4f5oihd7tB0Z/kUvvm3cPleZw
	HL1fle5itM0+nzOrr3Kis44U23Q63vQ2ZXI3aA7MrmYILxUnSgiEn9HXusGRHqQ11DiuC89yb7Cqr
	3Hob7W3RD8dweCkarbr3xj98VtDT0ZReqrQwBHHkNdDsQkeQ/kt6BIZU3mOH+haY8SQsKVOkw+PnN
	XVSzLleqhC5OO4HjBMPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2isx-0001jl-7D; Tue, 27 Aug 2019 21:20:15 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2isZ-0000I2-FE; Tue, 27 Aug 2019 21:19:52 +0000
Received: by mail-ot1-x342.google.com with SMTP id w4so582205ote.11;
 Tue, 27 Aug 2019 14:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cgYmTClrC/asl3eR4xct5fw+wHifMzNWe21TIUQLX/s=;
 b=fPm/hV4QKJeCA+j5g3rsjtP+azHB2zk6ntrj6l42vnXDPvSw5O92sHbgitSFwflbUL
 m9UTet+JaUBIERtI7Kk8KIITgjMa5OR4KVwUZ2DCOadIm0gYaREA+QlQZQLI/U1Dfec+
 YVlh5AS0iutk7nU/yNOmzUUcSl7YRmgSLhbecVQPF2In2aJL1NGonYhsbhKw3tfqkS1L
 fKvwQn+zISyavxmXb2+7LBWu2vDAZ8FEFcC5VeUThlM4Nroz0dDjFb3l4mIYfH+ErOG2
 5A5B/DNvueCA+b7LJ3QVAtlfgg3EDfAxtTHTr9w+Wlb2JDc5Dlz4wXt4InnyEmfVXNty
 8v4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cgYmTClrC/asl3eR4xct5fw+wHifMzNWe21TIUQLX/s=;
 b=ld8zBXM+wE7MBdThi3RCXYJLcePHHUdYABie4x85MB4KMDEEcQrYOwpiE2bMxCG34N
 HfOSJyfa8AdjRxXD4TAu6unhVA6FmcSNVXkWQC2ZhldXq98//9WqIfHXT6Lcyavd5fVc
 LoTxOD6hraB71a8/jHewxA6YRbnGOdIZwMga5VhrRkbYc4T5x0X3AEtLAgYcd/dRApR7
 RFs1AID+UpCpZDJOV3/JMwM+hgAicl64iEF6rx7zM55+sgpgA55ExpVk32otkjr/lRaD
 +/J9Lz1HSyiKpdHYPG8RIyeXF6iVezMrt3EJZ8DBFM6dWUhkvU+7hxARXJlpaTgSh5cY
 qu5A==
X-Gm-Message-State: APjAAAUDMcD4CMoGd/YfJn1eJ1yo+6gCxLfPLB7iPGnqAN0a7gYskw+x
 74B8P7r+JpfvmRzOI3kh8CTbxFh96n/y92ixGG4=
X-Google-Smtp-Source: APXvYqwwRRQN8HPUGgQVIpMqj1N2WMUBTzJ9Fh3YyiZAGgwoTYmJ49wk8Lo3LwUim1tFvC30tR6g38IAynQdpxOBCYk=
X-Received: by 2002:a9d:5c0f:: with SMTP id o15mr594707otk.81.1566940787892;
 Tue, 27 Aug 2019 14:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190824184912.795-1-linux.amoon@gmail.com>
 <CAFBinCCkEE8==-Sqqj_=Ofnx7_H-970dETwEmEPohs74806ZMw@mail.gmail.com>
 <CANAwSgTsua_x6fi7NzC2XjcV19OJcN3NhOT_niKXN4RR4X+qVQ@mail.gmail.com>
In-Reply-To: <CANAwSgTsua_x6fi7NzC2XjcV19OJcN3NhOT_niKXN4RR4X+qVQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 27 Aug 2019 23:19:36 +0200
Message-ID: <CAFBinCB45YkbgbRNx8aE+yrT7scT6BYZy1h9JozBxsoC6MZGSQ@mail.gmail.com>
Subject: Re: [PATCHv4 0/3] Odroid c2 usb fixs
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_141951_515175_1A30C051 
X-CRM114-Status: GOOD (  11.98  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Aug 26, 2019 at 6:38 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Martin,
>
> On Sun, 25 Aug 2019 at 02:48, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hi Anand,
> >
> > thank you for the patches
> >
> > On Sat, Aug 24, 2019 at 8:49 PM Anand Moon <linux.amoon@gmail.com> wrote:
> > [...]
> > > Anand Moon (3):
> > >   arm64: dts: meson: odroid-c2: p5v0 is the main 5V power input
> > >   arm64: dts: meson: odroid-c2: Add missing linking regulator to usb bus
> > >   arm64: dts: meson: odroid-c2: Disable usb_otg bus to avoid power
> > >     failed warning
> > this whole series is:
> > Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Thanks, I have some more patch in line for this board.
great, any improvement counts (especially since most boards are
derived from Amlogic reference designs, so it's likely that more than
just the Odroid-C2 will benefit from your patches) :)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
