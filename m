Return-Path: <SRS0=YblX=6Y=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 966D6C54E8D
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 May 2020 22:35:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A8D9208DB
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 May 2020 22:35:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hw85z8+3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="SdcvbjcF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A8D9208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jPIn2EZy3eDBH3st9W9sUuLcBF3VwnYvrsUv50z/wkQ=; b=hw85z8+3nR9t8u
	WmmJwEo1/XJY5bxhUkScjt/6FPda9KmXWfRldmYIRledONAgHGV3paul7EaUNWnXmTAWEkz5QlIiP
	7buvxx1PZQGbWTkrpSHfVdKTbYq84h3cRc5zBCKZuhceRR+WZGkYB8iqx3wIbQlAlaKZuXNxDKPEJ
	cqqEIBF7GezWKYnW+TKKFCM86akFqgqSp7N0RI0jpH5GhpjymDFisoPF62CRRl7QBwsRC+9K4bn71
	bm6mpF6Cgir+vD0QiPV8x6WuRTmnnFVvx1U5Ct1JbF4Z3QvWfl/CUyZlYfr1LVL00B5hFl2iCW7Rk
	7w8yG9kWy6/uOWStwgGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXuXE-00032x-2G; Sun, 10 May 2020 22:35:00 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXuXB-00031R-5X; Sun, 10 May 2020 22:34:58 +0000
Received: by mail-ed1-x543.google.com with SMTP id s10so6308300edy.9;
 Sun, 10 May 2020 15:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B3Liuw5jPj3QJFxFHfKfy7ZMc74PTLZnt3p5YASlDKM=;
 b=SdcvbjcF3JdGMCmXQKjJC4VrtNbyZL7JnFCg8ME3uRhjoiXwEB15CrSZnQME4J2DD2
 DxO4QSlh81F3TWn9aryJtCbHpShD922IGnJbIUvodcpjRjZLGr+jYf2kaVsme2IXDLbY
 4rDOHXaVnxiGBT4BqaQ8kI/nbf5iEGKYqTLSMz9cVTfRW+HNuhVcado+L3P1sCjh8SB5
 rMEASJykb5AlP1LYw0dBugwJWhrgwISrTmI+VLnQC02LFbbzw4WoeRl2c3TUDuWrEqJJ
 1dRey1jKhuUMz+aWUWNgJbUMfAtTbiJvPvHBorrsnrosXO1eItyzVsBZo99mbhd15P+C
 pjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B3Liuw5jPj3QJFxFHfKfy7ZMc74PTLZnt3p5YASlDKM=;
 b=nstOBqQ8vnVqwUGCOXPTjFzdmnYQyzNmK4rPGk841G3J8KaUiolqYJ6SNMhUbJf+YF
 x5wdlcKSMXl2slz/51xuIlfsiqa8zFRLMM83PN1e1O6ioc+ujGSigOZsHkACDNWJ18/w
 qJWyu7J1V10C9K1XCfmgp5oX6JeUfB7a9YB3IApj6KreUMCUegnfXLmTqdzf587c4n08
 87OCEpsaQVkrs41eC2cwHd5rSnw/mStZvxJJzmxmkxSgJiueVUQUFQ+XnDWddt2ZE9bI
 BHWr5GS9LAZObwn7jTKwMRyLFLVgSwic3o9D98e5g2B57bbrYPSwzQFSdeHUZNVBwHiZ
 jXCA==
X-Gm-Message-State: AGi0PuaAok8jJN8t7dQmS5tzwhLIctsdS8HVHrOiX5ZdgaSP2Ke5rKu1
 TZbX5wnkDwJftuWP3xu8+qNRv6j0BJU8La4/BSM=
X-Google-Smtp-Source: APiQypJ0tOvAq/50pHoDwoV21V2Mrg8Ij7Mm0ejwS/L8ZfwzanfGxs+5RSeqRK/m+QrXGsgES5F7n8SL3G6ccbzOAtg=
X-Received: by 2002:a50:fc06:: with SMTP id i6mr10603747edr.110.1589150094277; 
 Sun, 10 May 2020 15:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
 <20200429201644.1144546-3-martin.blumenstingl@googlemail.com>
 <20200501210942.GA27082@bogus>
 <CAFBinCDmps-Nd-HokSa5P7=bR+o3nuwxsS_eiH9A6CCYywpabQ@mail.gmail.com>
In-Reply-To: <CAFBinCDmps-Nd-HokSa5P7=bR+o3nuwxsS_eiH9A6CCYywpabQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 11 May 2020 00:34:43 +0200
Message-ID: <CAFBinCDiQ3_ti60tQd3PMVM89oaMQcSKODMQ1Wr66P1SHWEZ5A@mail.gmail.com>
Subject: Re: [PATCH RFC v2 02/11] dt-bindings: net: dwmac-meson: Document the
 "timing-adjustment" clock
To: Rob Herring <robh@kernel.org>, robh+dt@kernel.org,
 devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_153457_231564_5EFC244B 
X-CRM114-Status: GOOD (  16.58  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Rob,

On Fri, May 1, 2020 at 11:53 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Rob,
>
> On Fri, May 1, 2020 at 11:09 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, 29 Apr 2020 22:16:35 +0200, Martin Blumenstingl wrote:
> > > The PRG_ETHERNET registers can add an RX delay in RGMII mode. This
> > > requires an internal re-timing circuit whose input clock is called
> > > "timing adjustment clock". Document this clock input so the clock can be
> > > enabled as needed.
> > >
> > > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > > ---
> > >  .../devicetree/bindings/net/amlogic,meson-dwmac.yaml   | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.example.dt.yaml: ethernet@c9410000: clocks: Additional items are not allowed ([4294967295] was unexpected)
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.example.dt.yaml: ethernet@c9410000: clocks: [[4294967295], [4294967295], [4294967295], [4294967295]] is too long
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.example.dt.yaml: ethernet@c9410000: clocks: Additional items are not allowed ([4294967295] was unexpected)
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.example.dt.yaml: ethernet@c9410000: clocks: [[4294967295], [4294967295], [4294967295], [4294967295]] is too long
> I am seeing this on my own build machine as well, but only for the .yaml example
> The .dts example does not emit this warning
I found out what's going on here:
- I built these patches against the net-next tree (including dt_binding_check)
- and against linux-next (also including dt_binding_check)

Your tree contains commit f22531438ff42c ("dt-bindings: net: dwmac:
increase 'maxItems' for 'clocks', 'clock-names' properties") [0].
The net-next tree doesn't have that commit but linux-next does.
So when I run dt_binding_check with this series applied on top of
linux-next all warnings/errors are gone.
However when I run dt_binding_check with this series applied on top of
net-next I get the same errors as you.
The reason is that the additional patch in your tree increases the
maximum number of clocks from three to five. With this patch the
Amlogic DWMAC glue needs (up to) four clock inputs.

I have to re-send this series anyways due to a bug in another patch.
Please let me know how to make your bot happy when when I re-send the patches.


Thank you!
Martin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=dt/next&id=f22531438ff42ce568f81e346428461c71dea9e2

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
