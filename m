Return-Path: <SRS0=2I4g=RX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B532EC43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 20:54:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85F17218C3
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 20:54:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oS9hgoD2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="RRkdAKkd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85F17218C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9gvs8csYKc7ROhp1D48dheGdtzaojGQFGWc+1vjYh4=; b=oS9hgoD2KaVylo
	0ER3pqcMff3Q94V21Xua/7G3jBux9SQ024huQBdaA4Zxt3ROEyGbYU3cdrX8LU6+8LMz95wscxMfb
	JrGOi/HDCPou08AcVvxkcM47V7zUUJzoDw0QVCJWLT//D2ZWVPLRtc3pehBHLAPwnDNp0H33/wMVZ
	E2riau5awk6VkKdZhDuo8sHHZCDBv9iTehb4w9z5OJj21Krqfu5Q5AF2L4JkH7+3zQ5H8p64sIRZ4
	r/bgBATdkGFiCbmVVFc+nJ6wKV6InZhCVExXLQQxBXbilC+AZaMlV7r3V1tOrHULDqZiayKR8XH6u
	qAIIP5QkPaQ30IyprPcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6iDp-0000Xr-E8; Wed, 20 Mar 2019 20:54:01 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6iDl-0000X6-Ml; Wed, 20 Mar 2019 20:53:58 +0000
Received: by mail-ot1-x342.google.com with SMTP id d24so3454173otl.11;
 Wed, 20 Mar 2019 13:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CLZex3NxRknLodHbvMmEE9MnNv0ligyST03nIFPqc54=;
 b=RRkdAKkd+7D1aTalC1niYkw0bOGE6SEBNwPxHcAv6aDEi/hi+yXyy8tavep3xk1PiZ
 QQgB+JzbGWuq3NjXIo+nhaDaB0KMC/bCHVGZYkV6MNj32saFLXV4pmmnv0bX9gH9rUr9
 trINZSqEuLyEHjTpsupq1ug1OhCesIJToAsiDep6v+C2P88b6ZofXyqk63GaV7PDKFuS
 iTOIcuIvaNfxEWZqO4+uw0d6sZhDZEGCWC3lbQlFDa+ool2vVwxamXSMSTYCe+H4K1+M
 wfL/szmDeI6PjogwevZtz8r2lx6SK+h+NgQKWSdDtmMGWnmTc5voVmgoKDZVSmjAqkwn
 5JnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CLZex3NxRknLodHbvMmEE9MnNv0ligyST03nIFPqc54=;
 b=Wft7IRJW9B0/i214wyAwTUPotT5cIZKKlhoVnDl6dd67QMgqQ37Ouvcj9QsCKehuQD
 U+VCXCQqjNjwhB99WzzwEllLw0hqwfIAqzS8grTUxE7SdG5nAQVvTyNbB6U/5D2butbq
 fzndS//PRDULGkdw+0oxRfRahAEmHfaDXXgzGtsWBlwzehJ82ZzAwfKWGWU/Junuou46
 uaQikAwdqP7ccPVuVAIa73D/pQjiXIfN7Ht54ZYHfi3QQ8gSJRZZdqtxLirU1WnGO7VL
 1i1eFP+jInKvDYHOTfVCTMUYw07zOLOf8RFbZIQIZ41otTPDrtA281aoWBd48Ovw4pw8
 bLkQ==
X-Gm-Message-State: APjAAAU2A9rQu6zHzj1NyrOqtT8SanDb4Q33hOQ3pFjK+D7WtMzHLoJG
 MaD2wEV2DN+D+VwahVybkUU7lGIIgTFMWnNMyxo=
X-Google-Smtp-Source: APXvYqwhPFlpjvieRMFthqrLnUIhtuWuen8zyS+QKkvQdHwACg25Tn1HuAKwPx2lxxMObMFQhU2CDWc+eFXE5tl8zuk=
X-Received: by 2002:a9d:5614:: with SMTP id e20mr36608oti.348.1553115234460;
 Wed, 20 Mar 2019 13:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190319220012.31065-1-martin.blumenstingl@googlemail.com>
 <20190319220012.31065-3-martin.blumenstingl@googlemail.com>
 <CAMO6nawKpBRrp0oBtrGY8KskD6tUX9ZCNeDqSGPB-kMnm27HnA@mail.gmail.com>
In-Reply-To: <CAMO6nawKpBRrp0oBtrGY8KskD6tUX9ZCNeDqSGPB-kMnm27HnA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 20 Mar 2019 21:53:43 +0100
Message-ID: <CAFBinCC4cVkRr0TGJXkKVSd+k7bxeBVkZZxrH+EjS=X78StS=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: meson: meson8b: add the video decoder clock trees
To: Maxime Jourdan <mjourdan@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_135357_748768_DFB8F3D5 
X-CRM114-Status: GOOD (  21.96  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Maxime,

On Wed, Mar 20, 2019 at 12:16 PM Maxime Jourdan <mjourdan@baylibre.com> wrote:
>
> Hi Martin, thanks for looking into the video decoder for meson8!
you're welcome - this is only possible because of your work on the
video decoder driver!

> On Tue, Mar 19, 2019 at 11:00 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > This adds the four video decoder clock trees.
> >
> > VDEC_1 is split into two paths on Meson8b and Meson8m2:
> > - input mux called "vdec_1_sel"
> > - two dividers ("vdec_1_1_div" and "vdec_1_2_div") and gates ("vdec_1_1"
> >   and "vdec_1_2")
> > - and an output mux (probably glitch-free) called "vdec_1"
>
> Yes, all vdec clocks have a glitch-free mux to be able to safely
> adjust the frequency on the fly, although in practice it's barely
> used.
>
> > On Meson8 the VDEC_1 tree is simpler because there's only one path:
> > - input mux called "vdec_1_sel"
> > - divider ("vdec_1_1_div") and gate ("vdec_1_1")
> > - (the gate is used as output directly, there's no mux)
> >
> > The VDEC_HCODEC and VDEC_2 clocks are simple composite clocks each
> > consisting of an input mux, divider and a gate.
> >
> > The VDEC_HEVC clock seems to have two paths similar to the VDEC_1 clock.
> > However, the register offsets of the second clock path is not known.
> > Amlogic's 3.10 kernel (which is used as reference) sets
> > HHI_VDEC2_CLK_CNTL[31] to 1 before changing the VDEC_HEVC clock and back
> > to 0 afterwards. For now, leave a TODO comment and only add the first
> > path.
> >
>
> Looking at aml-3.10/drivers/amlogic/amports/m8b/vdec_clk.c, it's weird
> indeed. They seem to copy the divider's value to the same place
> (HHI_VDEC2_CLK_CNTL[16~23]), and the only thing that stands out is
> enabling HHI_VDEC2_CLK_CNTL[31].
>
> Then again they don't make use of that codepath at all, so who knows..
indeed, that's why I skipped it for now

[...]
> > diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
> > index e775f91ccce9..ed37196187e6 100644
> > --- a/drivers/clk/meson/meson8b.h
> > +++ b/drivers/clk/meson/meson8b.h
> > @@ -37,6 +37,9 @@
> >  #define HHI_MALI_CLK_CNTL              0x1b0 /* 0x6c offset in data sheet */
> >  #define HHI_VPU_CLK_CNTL               0x1bc /* 0x6f offset in data sheet */
> >  #define HHI_HDMI_CLK_CNTL              0x1cc /* 0x73 offset in data sheet */
> > +#define HHI_VDEC_CLK_CNTL              0x1e0 /* 0x78 offset in data sheet */
> > +#define HHI_VDEC2_CLK_CNTL             0x1e4 /* 0x79 offset in data sheet */
> > +#define HHI_VDEC3_CLK_CNTL             0x1e8 /* 0x7a offset in data sheet */
> >  #define HHI_NAND_CLK_CNTL              0x25c /* 0x97 offset in data sheet */
> >  #define HHI_MPLL_CNTL                  0x280 /* 0xa0 offset in data sheet */
> >  #define HHI_SYS_PLL_CNTL               0x300 /* 0xc0 offset in data sheet */
> > @@ -156,8 +159,20 @@
> >  #define CLKID_VPU_1_SEL                186
> >  #define CLKID_VPU_1_DIV                187
> >  #define CLKID_VPU_1            189
> > +#define CLKID_VDEC_1_SEL       191
> > +#define CLKID_VDEC_1_1_DIV     192
> > +#define CLKID_VDEC_1_1         193
> > +#define CLKID_VDEC_1_2_DIV     194
> > +#define CLKID_VDEC_1_2         195
>
> In order to make use of the glitch-free mux by the driver, shouldn't
> CLKID_VDEC_1_1 and CLKID_VDEC_1_2 be exported in the bindings ?
I considered this but I didn't export them because of three reasons:
- the video decoder driver doesn't have any logic to use the glitch-free mux yet
- assigned-clock-rates or clk_set_rate will figure out the parent
setup on it's own if we ignore the glitch-free mux until the video
decoder driver supports it
- exporting CLKIDs is easier than un-exporting them

Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
