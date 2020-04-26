Return-Path: <SRS0=Ozhx=6K=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6739C54FCB
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Apr 2020 16:19:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFD8A206DD
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Apr 2020 16:19:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qgbRsC1i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIwT+DkV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFD8A206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cKKGrJFdqYwTJCBwi/3riT3P6opduqaZPjoC0q0zZ+s=; b=qgbRsC1ihXDPzK
	CErHfT9Or7TBqS7BgR6H9W1HRt02MCIn2+ENlFtplc0y/Y1tp3A9Hv+Pf9GAygydJ4LERpWDD22Zx
	1089tebBuK8LNrHVLhutyDBRdhYUHpj1/U1eqvU9ZBGaPumdR5vVJEbBIGRKlXmFRaj92gtNhaSWM
	2UUTqGZXpQssxGV5Sjfx3sQBWMdeDaGHbS0SBnzzprZ036O6mfvkHg7a3kmAXjktkscdKp9sByBvi
	IKSevr2gn+7f2gEZpInWYXkwIe33LPFF7NIQfPDQPo5YwoztoiQiljTqIGUWhafi6efw3TYBLd5Pv
	/jYjAb26bvUSynmNuPWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSjzp-0004do-N1; Sun, 26 Apr 2020 16:19:09 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSjzm-0004cG-QV; Sun, 26 Apr 2020 16:19:08 +0000
Received: by mail-ot1-x343.google.com with SMTP id g14so21814351otg.10;
 Sun, 26 Apr 2020 09:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pj77SUe5CaP0v/pGWWFayVD62/A8i5UvOJukuyc5CVo=;
 b=SIwT+DkVtRJGCGDj8udPoICtBFP7hrscvBQWiU0tS87Hi5Ub3I1cYpvxxILSYGE4mX
 MlfGSgGmoKDKR+oBhDomOElD2/kvt1RWQwS8rofoR3mG9BLTlgM1Zyb+Ud4o+KY6zy3Y
 LrWRcaznHY/gjdDzpHdFmNK2YPN/SnoAzv7eUtCZJbgVgYlIcjonkoh4AXWFMoKRaW+f
 edblil7K6KgdjdQXccDkJuWlnZr6A0Nbl2HRRU43++iafGWFdzM3iv2CUX3Nx/HF7p8W
 Tyi1v4Lw5TcsD8B2kMJeeuBpQePpEdWfHYh0muGgmhrqB7dtKAk8LOn0bnH9+eHzOPWD
 /qVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pj77SUe5CaP0v/pGWWFayVD62/A8i5UvOJukuyc5CVo=;
 b=hxBZ88/7roVs0UgZKmB8DF/wGbn/uPJNbqGr+riqpBxzNDA+3/CDnVCudwJuXeasa+
 P5JWvFJog8rJqQoVRoRXu4oPXShGqiSEGnM90frt59pxqybTZFFFs/o7M+d0OV/nkoaI
 T+5uDwjBlt7DO65vCBCycwV71TNI9njTQe6wbojG6bmIcHOtcMTtCUveH2LdxqZh5MEr
 S63a6Hh+oEIwblHXBJsgnoPhiOImrXlD3/Ft/Nc3ie9nTJcckVpMHkwYEg47mRNYVdB2
 pCBFm2zsKr5Nsu9Z/G08vwW4pmw0voJUal1QxzmrOeOShl3uEg7PURuQ74oXPfEuTRnd
 9liQ==
X-Gm-Message-State: AGi0Pub+xe4+fyV7hpMFpFCUivRIwjq6c3sZ9TSqv9dxoSgKW4nnOYEW
 Bclo7edNrKjFX3z60ieBvYYk9uuckQIIrNqO2JY=
X-Google-Smtp-Source: APiQypJ5+V3+lSZEofKJqMAVpQSdTAk1rec+Esu8ZijtDxFh7g90i2TLV7E4NrCm5MZu1Oonan3gRu8weMxFg1oIXTo=
X-Received: by 2002:a9d:21ca:: with SMTP id s68mr15145763otb.15.1587917945530; 
 Sun, 26 Apr 2020 09:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200422233928.GA2816@imac>
 <8255d8b1-f652-9ece-67d2-68c30a5cfbac@baylibre.com>
In-Reply-To: <8255d8b1-f652-9ece-67d2-68c30a5cfbac@baylibre.com>
From: Tim Lewis <elatllat@gmail.com>
Date: Sun, 26 Apr 2020 12:18:54 -0400
Message-ID: <CA+3zgmsVK9Uuv947-pniByP7QJVGcVK_EgiRkFipV5CUx70sHQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: meson: S922X: extend cpu opp-points
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200426_091906_863991_C3F021D6 
X-CRM114-Status: GOOD (  14.53  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, joy.cho@hardkernel.com,
 khilman@baylibre.com, Christian Hewitt <christianshewitt@gmail.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 tobetter <tobetter@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Oops, will fix in v4.


On Thu, Apr 23, 2020 at 3:40 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 23/04/2020 01:39, Tim Lewis wrote:
> > HardKernel supports overclock through the addition to extra opp points
> > in their official kernel sources for odroid-n2 [1]. Christian tested
> > on other S922X devices with "no obvious issues". Neil thinks dvfs and
> > thermal managementis can keep other S922X devices safe.
> --------------/\
>           management
>
> >
> > [1] https://github.com/hardkernel/linux/commit/f86cd9487c7483b2a05f448b9ebacf6bd5a2ad2f
> > Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> > Signed-off-by: Tim Lewis <elatllat@gmail.com>
> >
> > ---
> >  arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi | 15 +++++++++++++++
> >  1 files changed, 15 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> > index 046cc332d..1e5d0ee5d 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> > @@ -65,6 +65,11 @@
> >                       opp-hz = /bits/ 64 <1896000000>;
> >                       opp-microvolt = <981000>;
> >               };
> > +
> > +             opp-1992000000 {
> > +                     opp-hz = /bits/ 64 <1992000000>;
> > +                     opp-microvolt = <1001000>;
> > +             };
> >       };
> >
> >       cpub_opp_table_1: opp-table-1 {
> > @@ -120,5 +125,15 @@
> >                       opp-hz = /bits/ 64 <1704000000>;
> >                       opp-microvolt = <891000>;
> >               };
> > +
> > +             opp-1800000000 {
> > +                     opp-hz = /bits/ 64 <1800000000>;
> > +                     opp-microvolt = <981000>;
> > +             };
> > +
> > +             opp-1908000000 {
> > +                     opp-hz = /bits/ 64 <1908000000>;
> > +                     opp-microvolt = <1022000>;
> > +             };
> >       };
> >  };
> >
>
> The patch is well formed but I can only test on Odroid-N2.
>
> Anyway, Christian did a test other S922X boxes and it doesn't crash.
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>
> Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
