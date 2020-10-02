Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE06CC47425
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 10:53:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80CEC206CD
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 10:53:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GwNwauUb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yvX1A3cL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80CEC206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+uBDu//ITZ1Xi7UgOzT02p3fVnLTrEaYbzdXJwkWgOM=; b=GwNwauUbn5b2WPYzNy/KNMb8B
	GKPcJ8aFUWyMLXq6lIV6tJ8qR33XtVwNIe46IsKM/9GE+Wo+XXTUd8AG56iStjQs9nocd47bGcgBq
	jnHlCnuu9qJ3RLtJ2TbrFhFYXu+9n9U33MeQvWNuDgWni48uIm+X94WpgmS3iy0lAmABELk8KO+Fh
	L0KOzpaj6VG63Dvs5E7ULklU10/y51KKyTTbBcXHev7fmOg7aGb1PRcG4UrEpqv+kSLxakKLLIMUp
	WiQlo/DA9cZdkjQWT+vI17wO7ZjZIxpIXxgcVYWl3Jk+Xik9lAvoumGykJ7G9odoZ114kGusPzvvr
	/uTP8u0hg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOIgZ-0005xQ-6Z; Fri, 02 Oct 2020 10:53:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOIgW-0005wO-Qz; Fri, 02 Oct 2020 10:53:09 +0000
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E09AD206CD;
 Fri,  2 Oct 2020 10:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601635986;
 bh=WUSRRX+XBvVTYHzBDRPQz4PtaU7zhX11OBofs03lu7w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yvX1A3cLWsjS1cWSyIRSg+WJmwZtSfrDcvyV/NeaKNl7GPsIy0voCxFZ/rOk4Gpmn
 2KaO/nUo6AwHYxAo8duM5tiz9TubUPDXXY5lD8rnJHuHCrD3KuX85XjN3soizDcz8B
 jOf84bE2XRGR0Trvh3UMgzg0dT6cjmceAFfHiP3o=
Received: by mail-ej1-f50.google.com with SMTP id ce10so1327472ejc.5;
 Fri, 02 Oct 2020 03:53:05 -0700 (PDT)
X-Gm-Message-State: AOAM532t+JcrKZoRItJWRcD/xzFiwEfEjTTTFUC+oSd0kFPuqyY9HUHw
 nWLEWw1d3ODKsPZLI5fLNlwd+k7d2NdAACnJpqQ=
X-Google-Smtp-Source: ABdhPJz2njtnLuaxs13sg4hhwWj46P8QK/G+8vH63FlRpE0n16xuRCvITpEi9m8uB+qnlenWJGhPhUHCNrXOYo6xhlo=
X-Received: by 2002:a17:906:1984:: with SMTP id
 g4mr1573436ejd.119.1601635984516; 
 Fri, 02 Oct 2020 03:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-3-post@lespocky.de>
 <CAJKOXPe7Tg+5ESsdPGks_Aqj+zQH4-asC839FseWp0OCJbT4Mw@mail.gmail.com>
 <9895379.VNsV0mSTfq@ada>
In-Reply-To: <9895379.VNsV0mSTfq@ada>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 2 Oct 2020 12:52:52 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcTstvUuy-CnJbOGxiONLx2V2hfpnR0H4gS=4v+C1udtQ@mail.gmail.com>
Message-ID: <CAJKOXPcTstvUuy-CnJbOGxiONLx2V2hfpnR0H4gS=4v+C1udtQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] dt-bindings: leds: Convert pwm to yaml
To: Alexander Dahl <ada@thorsis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_065309_047549_49DB458F 
X-CRM114-Status: GOOD (  19.71  )
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
Cc: devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2 Oct 2020 at 12:46, Alexander Dahl <ada@thorsis.com> wrote:
>
> Hei hei,
>
> Am Freitag, 2. Oktober 2020, 11:31:09 CEST schrieb Krzysztof Kozlowski:
> > On Thu, 1 Oct 2020 at 01:52, Alexander Dahl <post@lespocky.de> wrote:
> > > The example was adapted in the following ways:
> > >
> > > - make use of the now supported 'function' and 'color' properties
> > > - remove pwm nodes, those are documented elsewhere
> > > - tweake node names to be matched by new dtschema rules
> >
> > tweak? or align?
>
> Depends on if schema actually checks it (child nodes) or if it's just DT
> policy (parent node).  I'll reword in v7.
>
> > > License was discussed with the original author.
> >
> > Since you relicense their work, you need an ack or signed off from
> > every author. You cannot just say "I discussed" and post it. That way
> > I could pretend (lie) I talked to Linus and try to relicense Linux to
> > BSD...
>
> I know.  Peter promised to give his Ack publicly on the list back when I
> worked on v2 or v3, so he is in Cc since then, but apparently he did not yet
> post it. ;-)
>
> > You need acks/SoB from Peter and Russel.
>
> Well, I should add Russel in v7, too, then.

Yes, please.

For the patch itself:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
