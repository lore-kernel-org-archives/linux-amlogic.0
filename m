Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A61CBC433FF
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 22:27:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 725862070D
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 22:27:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cAtidRiO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ApUwl0Ls"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 725862070D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hu/K7qcrCHyHgsntNua+ctIKwZbtsHNTNpJg5WraPPo=; b=cAtidRiO1UcPZM
	wJZK+PkNzs7gNWW4gU9aEzOKiK0ENW/y3BiKPPInIJJCp2QfilNMsy79LwGWMAGbTLyhNpPfMMv+7
	Sv2XsUM9kfon0mMKa5jSy3fW0M6mHIf/GQDsKmvNqXEBQ7BgoUszJjnQR0q4gvdvAnNUWQVJlVWGX
	twsM/u7UEr+IPFS3Th3+/nYFvD4mRRvl0JVLXLxbLUjkCNj4KZB6/ZDN7qiUO2j6Q1ZKxazYEr5YA
	y64yMQQUFZXOkQbPMEcBII67UteQz8EjOYBs6oruJuRLdFGgAO8mSxupgR0KSKABUICLhymZq0Vv+
	0wPye11MTCbYT7WlSALw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hulRW-0001DR-9n; Mon, 05 Aug 2019 22:27:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hulRT-0001D0-7n; Mon, 05 Aug 2019 22:27:00 +0000
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BCE8F216F4;
 Mon,  5 Aug 2019 22:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565044018;
 bh=5QqKfUQlNAGGXBrLFCDl97vIo9RPGyUF2niHSSyTvcI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ApUwl0LsccWFP4qaiKNWLJDa0HqjDYY9+EFUhWoJqsiSiii0heKrwD51oEW5xvTNe
 ZJy5/TiR+RCfRoXdQm6SO4KsCkPMzPWFtGroHraP+pSJP5q8Badns+zZVC21LMnsCn
 5SdpQBYIsAYfvNZlhUP6iPadyR87NqGY6w7J6zrg=
Received: by mail-qt1-f174.google.com with SMTP id n11so82593983qtl.5;
 Mon, 05 Aug 2019 15:26:58 -0700 (PDT)
X-Gm-Message-State: APjAAAV2SviYOhINUGohC2fSBDIGtYoAVn0il4EnWwHRT20OgFB8B0Fv
 7+bt/CMF/xHLi0026+nIO2c2Tc1hIc/yc/bHqg==
X-Google-Smtp-Source: APXvYqzc4gt0XQb5ELtE8x9Bx00YbzwNJNxdKrfP9+wySRU4Hw1/j4rPECT9RH7hGOz2CxU9uMS3pmt4UjmSQvspWaw=
X-Received: by 2002:aed:3fb0:: with SMTP id s45mr389741qth.136.1565044017965; 
 Mon, 05 Aug 2019 15:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190731124000.22072-1-narmstrong@baylibre.com>
 <20190731124000.22072-3-narmstrong@baylibre.com> <7hblx3gua3.fsf@baylibre.com>
 <CAL_JsqL_L2qHe334sB57hR_coRhawKiqXYjKAQDJt_DHfBamBQ@mail.gmail.com>
In-Reply-To: <CAL_JsqL_L2qHe334sB57hR_coRhawKiqXYjKAQDJt_DHfBamBQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 Aug 2019 16:26:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLavYVXi8MGEEs32-peYRTO2+V8ALKRxEKpLJwhyJByrQ@mail.gmail.com>
Message-ID: <CAL_JsqLavYVXi8MGEEs32-peYRTO2+V8ALKRxEKpLJwhyJByrQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: arm: amlogic: add bindings for G12B
 based S922X SoC
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_152659_302579_02BCC7EF 
X-CRM114-Status: GOOD (  16.67  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-amlogic@lists.infradead.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Aug 5, 2019 at 4:21 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Aug 5, 2019 at 3:46 PM Kevin Hilman <khilman@baylibre.com> wrote:
> >
> > Neil Armstrong <narmstrong@baylibre.com> writes:
> >
> > > Add a specific compatible for the Amlogic G12B family based S922X SoC
> > > to differentiate with the A311D SoC from the same family.
> > >
> > > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > > ---
> > >  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> > > index 325c6fd3566d..3c3bc806cd23 100644
> > > --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> > > @@ -139,6 +139,7 @@ properties:
> > >          items:
> > >            - enum:
> > >                - hardkernel,odroid-n2
> > > +          - const: amlogic,s922x
> > >            - const: amlogic,g12b
> >
> > nit: in previous binding docs, we were trying to keep these sorted
> > alphabetically.  I'll reorder the new "s922x" after "g12b" when
> > applying.
>
> No, this is not documentation ordering. It's the order compatible
> strings must be in.

BTW, you probably should run:

make DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/amlogic.yaml
dtbs_check

on your tree regularly. This will catch any errors like this and
undocumented boards (but not undocumented SoCs, still too many for me
to get that in place).

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
