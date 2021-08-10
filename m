Return-Path: <SRS0=4Wh7=NB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC309C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 23:21:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BB8260240
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 23:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BB8260240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvg7acF7Z+rlDAkQfBlkFdbfl9ITN3ZzTmjFjUTAvGU=; b=sLDcW+rv6h+MyL
	jT+d0gs64JPawdytll0eY4k/Z9Y7ZUxPXY2Beu08g0dq9FP81Gy9iPNfywxC5ebrOOunEuL4zCTYS
	QkFu8j6Jo9Bw/sOIdLxXj4RQZNYeS8tDMyzfb/KYEiUWw6J97F083euw/N/TMHGffWk8Fh+N7qeeJ
	RA+JzO8C391ic9h9xM4xrp1UoPq3c0KLi8TpSmQKIE2WQbETFGSadBcatx89s6AB/4FieChMjTgME
	v4VP9aQhtORcpc5ePLE5wHss+RV6lFg25/ypmZUAr+sRPNL6qIgEbB8gUOLAI6RVGZJUEA1ONRFza
	hZ3FmuEbFq/LfSfxAXLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDb3u-0051F1-EQ; Tue, 10 Aug 2021 23:21:34 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDb3h-0051Ck-AD; Tue, 10 Aug 2021 23:21:22 +0000
Received: by mail-io1-xd2d.google.com with SMTP id i7so1246949iow.1;
 Tue, 10 Aug 2021 16:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vy5m00VfsLNO9CsS/oFazoccVf7Kpa1RZDcSI5G7BWw=;
 b=aZpqE3+Y1gZPTqxNXnVXtXvHj4UZ54QHWfI7DmXWaK1HC9h0Gd+UVa0LUaMcPqMqm+
 yzMRyBeQzdTt166dGCWwQA3LDZ5xuEXMnHhMnC3469v2G6jCHG+5SUWdmGBGwSBIP5w8
 cm6Fv14RB5keWd0AbuiNkJwxONtp+WAFhmpb4+Up7C40kb+pgRmQxBokDRWEhVXnTRvv
 Ev/1Z5/KlrBszpE+KySAnB4pmVlTQLawpe0VoLYDLpK+YLWy3pIJFsRjsEhQ04UejHJx
 OLAj0RGvkVA155UYgp61gxKP5oqPasR9OwEOVnMjOTn1weij+N0C6AAnNqvX3V7IO+bi
 uzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vy5m00VfsLNO9CsS/oFazoccVf7Kpa1RZDcSI5G7BWw=;
 b=fluBUx5mr4/vTQdBaUXmVetlvT2gYJ739PxOXM9OIgdrJaWw2sJiWu34qeawRRe3Fu
 +dENugXnaaK9O027XNfGLmrPPKKUZ1rNX4v22etxh3cyOArZItgyS/2Bi1/US5QfCr7M
 wtsgm/1Qv9Vc7CzNlG+FL7oheohreTKLMDSZM0BGeVpvizxDlywtYUoXWX2/p0eOJWaT
 s3IG4qJ0N/Tyy+nAGxA9nygzknkYNc6V/MztaPpYUrNgyOuBuxF6umHfKjkosdJFM6HQ
 zbOJXIgAs+HVBfcGzwbIQ9MU4Qjamd0AnTlTDPGCqRUc/o/afWhi71jj7jOc7MmKZ1D+
 HNXA==
X-Gm-Message-State: AOAM533QNBUXzHG685JM2SIONqFC3L449zqhxIAVjwasbSytDOJYbg1F
 IqLlgMM6v82F3zwgYgwD2V4in+qJTqbYHsp59eo=
X-Google-Smtp-Source: ABdhPJxRc5FrSsl0ufJpCk92nsSxqmFmQMmQwXbl+uwBKYL3hTBM/Sdmyll8CXcHPXFQLdK4B7BlahHr3hRtFlVDKqU=
X-Received: by 2002:a5e:da04:: with SMTP id x4mr606250ioj.199.1628637680751;
 Tue, 10 Aug 2021 16:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210810041630.3673406-1-art@khadas.com>
 <7dbba936-e8ab-4d47-1af8-0d3d1adb8c30@baylibre.com>
In-Reply-To: <7dbba936-e8ab-4d47-1af8-0d3d1adb8c30@baylibre.com>
From: Art Nikpal <email2tema@gmail.com>
Date: Wed, 11 Aug 2021 07:21:08 +0800
Message-ID: <CAKaHn9LWCHpAiO8siGmcOxA-FyurwE6x0T5_D7hwpVH72wScNw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: meson: add spdif out to khadas-vim
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, Artem Lapkin <art@khadas.com>,
 Nick Xie <nick@khadas.com>, Gouwa Wang <gouwa@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_162121_403878_BF80371B 
X-CRM114-Status: GOOD (  20.74  )
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

> AFAIK the board doesn't have a physical SPDIF output, but one of the 40pin header can output SPDIF, right ?
Yes it's right

>In this case, following the other boards mainline definitions, we do not enable any function by default
For pins on the 40pin (or other programmable) headers.

ok ! now  i'm understand reason

But maybe it is possible to add this area as commented /* */
and users will have possibilities to uncomment  it.

> DT overlays
Yes but I still don't understand how-to apply dt overlays for EFI+grub
may be somebody can clarify this problem?

On Tue, Aug 10, 2021 at 3:55 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 10/08/2021 06:16, Artem Lapkin wrote:
> > Add spdif output audio support to khadas-vim
> >
> > Signed-off-by: Artem Lapkin <art@khadas.com>
> > ---
> >  .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts  | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> > index 60feac0179c0..01f13822a616 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> > @@ -64,6 +64,13 @@ hdmi_connector_in: endpoint {
> >               };
> >       };
> >
> > +     spdif_dit: audio-codec-0 {
> > +             #sound-dai-cells = <0>;
> > +             compatible = "linux,spdif-dit";
> > +             status = "okay";
> > +             sound-name-prefix = "DIT";
> > +     };
> > +
> >       sound {
> >               compatible = "amlogic,gx-sound-card";
> >               model = "KHADAS-VIM";
> > @@ -97,11 +104,21 @@ codec-0 {
> >                               sound-dai = <&hdmi_tx>;
> >                       };
> >               };
> > +
> > +             dai-link-3 {
> > +                     sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
> > +
> > +                     codec-0 {
> > +                             sound-dai = <&spdif_dit>;
> > +                     };
> > +             };
> >       };
> >  };
> >
> >  &aiu {
> >       status = "okay";
> > +     pinctrl-0 = <&spdif_out_h_pins>;
> > +     pinctrl-names = "default";
> >  };
> >
> >  &cec_AO {
> >
>
> AFAIK the board doesn't have a physical SPDIF output, but one of the 40pin header can output SPDIF, right ?
>
> In this case, following the other boards mainline definitions, we do not enable any function by default
> for pins on the 40pin (or other programmable) headers.
>
> There is still ongoing discussions on how to handle that on a more generic level, but you should write a bunch
> of DT overlays for the VIM boards to enable optional functions like SPDIF and store then in a public git
> tree for everybody to use (like armbian or LibreELEC for example) from the U-Boot stage.
>
> Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
