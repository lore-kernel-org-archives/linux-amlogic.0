Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8239CC433FF
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 22:21:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E84F2054F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 22:21:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eexXAKRy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="z/afeF4D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E84F2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ho6S+50wUy8/RfBRwln4Kk+5jk7gjCkcxRW6HryY2Is=; b=eexXAKRycnW9Lx
	dlW+ghP61FUByvMGlcvNSv0O9NmvF6hSUNwGrRsASDg5WtZhEY2Kj/bGpyJ1X1D/MBTsBfgjb5NjW
	wuaibuB7RlAp1R8J5E3SvKfU8IgOr6MsRyaAvGPbYx2mVtSk+K2ITTN8t4/loulJjxhRbfya4nJJn
	xlf4b47JRdGuWNpl0bca2nz/E0/vxQ5x2osFxYEl0f1393cj2JcXZl4wgtokT/VnOY1MXvW3dNpYx
	irfCknhTh21yNCXzzqGUbJDmq2dUOclV4s3jFtfp4qlbJSaq20Ln5NgumwBskfcNUBkpTDH97arcq
	feNMo0ZvDZadnRlLOu8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hulM0-00085j-Ia; Mon, 05 Aug 2019 22:21:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hulLy-00085K-4r; Mon, 05 Aug 2019 22:21:19 +0000
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CDA0216F4;
 Mon,  5 Aug 2019 22:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565043677;
 bh=Y+a5+dRoi0YVw6gPz9RVozw6iDMpBq9OZh+AXfZi5Is=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=z/afeF4DRV9zUHEkPb+3qW3XLRei+MecL3vBZUcAqIZnRVD3TzEdFABt9R7Gyx8+2
 mC4ULdgCWDa0KHGMotuto6AT7glPsJk8Gi4J1S9XTjokZW1S8RGbjpGIhEFQH2mQAx
 3owQagg6CtWhorEXMf6owMkDj/bpNJ8iOYzIe//g=
Received: by mail-qt1-f169.google.com with SMTP id 44so51560327qtg.11;
 Mon, 05 Aug 2019 15:21:17 -0700 (PDT)
X-Gm-Message-State: APjAAAUZFG2/FaUHjvPO7uOsjLNKzu9CF+I5wOtA0bc1r2ScFIgqQdAK
 DrdJHxD+pF7Vbb8hROTF/MHrFkedKx6zaDK6Gg==
X-Google-Smtp-Source: APXvYqyG5ow10xlO87/4O5/N0US5x/vWmMvRNW7227/h0HIqSzUYZ0L7Wk/nO+vhCYUgRIXKhM/9We9oSL2w6AZTwf8=
X-Received: by 2002:a0c:8a43:: with SMTP id 3mr283692qvu.138.1565043676810;
 Mon, 05 Aug 2019 15:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190731124000.22072-1-narmstrong@baylibre.com>
 <20190731124000.22072-3-narmstrong@baylibre.com> <7hblx3gua3.fsf@baylibre.com>
In-Reply-To: <7hblx3gua3.fsf@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 Aug 2019 16:21:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL_L2qHe334sB57hR_coRhawKiqXYjKAQDJt_DHfBamBQ@mail.gmail.com>
Message-ID: <CAL_JsqL_L2qHe334sB57hR_coRhawKiqXYjKAQDJt_DHfBamBQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: arm: amlogic: add bindings for G12B
 based S922X SoC
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_152118_211624_1C259D76 
X-CRM114-Status: GOOD (  15.64  )
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

On Mon, Aug 5, 2019 at 3:46 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Neil Armstrong <narmstrong@baylibre.com> writes:
>
> > Add a specific compatible for the Amlogic G12B family based S922X SoC
> > to differentiate with the A311D SoC from the same family.
> >
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > ---
> >  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> > index 325c6fd3566d..3c3bc806cd23 100644
> > --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> > +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> > @@ -139,6 +139,7 @@ properties:
> >          items:
> >            - enum:
> >                - hardkernel,odroid-n2
> > +          - const: amlogic,s922x
> >            - const: amlogic,g12b
>
> nit: in previous binding docs, we were trying to keep these sorted
> alphabetically.  I'll reorder the new "s922x" after "g12b" when
> applying.

No, this is not documentation ordering. It's the order compatible
strings must be in.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
