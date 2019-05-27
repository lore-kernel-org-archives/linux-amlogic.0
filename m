Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4020C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 15:41:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDD2D20665
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 15:41:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FqWgFb9N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ybdiq5GD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDD2D20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQhcDp0Qn+LYYmU9JlJkfTPgXxw1M5SVtDlN7OW+UgU=; b=FqWgFb9NNscXSz
	p4tjqxjUjjC8cgsZd0hWDwlpdqUYO4+9JYZUqufm8jBPqtQA3trARLCoRkRT/y5lww8/U/OeXWiyM
	R5LetaKLLNcSVv2luEHetELDcAFDd6JWWYFErJawrjWdqKtQVE6SzmxerE8UNu7H+AvfKZ/fXsvQV
	+4Dihtblbf+OvZkzqm+PTuypuha39Ap6mTPJAUTt5wDvHdwUbTZNsC/judeTXck+7YgHNpKY8JJ/M
	E6ag917B+FR2oTPB/tlqv95wAd3vtnyc5WwLwPptmQ3iH7W5YhM38tnteisI1+ZkO3/SK1NPaojrd
	CAMTB42cZ46AUwiczZ3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVHkm-0003z2-Hg; Mon, 27 May 2019 15:41:36 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVHkd-0003qW-DE
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 15:41:29 +0000
Received: by mail-wm1-x341.google.com with SMTP id 15so16153131wmg.5
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 08:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tdsw2aGiBLowdBKompMuLQW0FpeZcju49WmFG8bHyOw=;
 b=ybdiq5GDzdAVwWuupgM0Vyj2TRBmG9n1bTEgd7DCD5KhZsLgMyduZvYjiBX98fmitU
 bjqoEaotnbM2XtAXoWExidPPwYhpO+3qfQF0pgQ1E2bMOeUheDJayDWzbf6I8bm8z2dW
 74NeFGQkTxKdwyV1QbqvLb5z4ykIgEmVs1qc/fNn+PKZUmrenAu+zBO7ZHsRBmPprdFr
 Fk9aXYknb8WelAnOFM9JRIrQOtNVHqjdZitx6wkYHLlMny5I/OULokvXyJzg25c2TTLF
 xJ5HeJcWPT37ChPr5pr2Tr3JBPb46yU0f4aojrereBVSGoH1x+ezLFvTY2aYnkZzwecr
 hoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tdsw2aGiBLowdBKompMuLQW0FpeZcju49WmFG8bHyOw=;
 b=SD8R4ru+OFnG/o3tA4KBy4EA3Y6Gm4a1VwDuZxMLG6UxqEVnb0iEBPSX54rn8OXt+w
 WjDr1FPOu1JAQc8bUe1lMxfitKnLEYM7N7HYJ0dsv2rReKoTxQhSbmLW6K8tGVz/Bx3Q
 JaMlM03ZxD43MgNG9cdBz34vXlXH/+ZQn3gWpG7D0e9yxKBDG9TsqUYHKCTUYkefPYjV
 kTcwOwglak0J0ZBo0jGhSkYWXDUc7Xn5vGl2nXzTKB6lhepIx1iFmDGfjm1OZU3KWuwZ
 aa5/54Uz25f/hr1u4AyrSHz5C0iwdKFf0kOdQBPjhQRduqYNVoC2HEwbxJ23TEskHE6s
 izvQ==
X-Gm-Message-State: APjAAAXYPHp5okAjfUKa7kjXFXQoDmuv7VeANZncZY1ca1NatkSKuiRe
 TWElZhjJy3ZMO7Cu/LUI7mtGf+FvirJ721N/Yp+OGA==
X-Google-Smtp-Source: APXvYqy609IJf/GhOKyCiAwxR8WSs6/tX1M/ieVpzUVpTTjy82ChyMKy4v5VAw0i+AX1iLX+Rwq4+F1lz7sR5gM8dzg=
X-Received: by 2002:a05:600c:2306:: with SMTP id
 6mr10042110wmo.162.1558971685659; 
 Mon, 27 May 2019 08:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190514135612.30822-1-mjourdan@baylibre.com>
 <20190514135612.30822-4-mjourdan@baylibre.com>
 <07af1a22-d57c-aff6-b476-98fbf72135c1@xs4all.nl>
 <CAMO6naz-cG3F_h70Chjt+GprGWe2EShsMjrietu_JBAdLrPbpQ@mail.gmail.com>
 <0821bfd9-58e4-5df3-4528-189476d35d89@xs4all.nl>
In-Reply-To: <0821bfd9-58e4-5df3-4528-189476d35d89@xs4all.nl>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Mon, 27 May 2019 17:41:14 +0200
Message-ID: <CAMO6nayi+wWU5jqtWkY0riJc6emHiPh7eqpvdzP=U7NgewfwqA@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] media: meson: add v4l2 m2m video decoder driver
To: Hans Verkuil <hverkuil@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_084127_829480_704A08A9 
X-CRM114-Status: GOOD (  23.44  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
 linux-amlogic@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 4:54 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 5/27/19 4:44 PM, Maxime Jourdan wrote:
> > Hi Hans,
> > On Mon, May 27, 2019 at 12:04 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> Hi Maxime,
> >>
> >> First a high-level comment: I think this driver should go to staging.
> >> Once we finalize the stateful decoder spec, and we've updated the
> >> v4l2-compliance test, then this needs to be tested against that and
> >> only if it passes can it be moved out of staging.
> >>
> >
> > I chose to send the driver supporting only MPEG2 for now as it keeps
> > it "to the point", but as it turns out it's one of the few formats on
> > Amlogic that can't fully respect the spec at the moment because of the
> > lack of support for V4L2_EVENT_SOURCE_CHANGE, thus the patch in the
> > series that adds a new flag V4L2_FMT_FLAG_FIXED_RESOLUTION. It
> > basically requires userspace to set the format (i.e coded resolution)
> > since the driver/fw can't probe it.
> > At the moment, this is described in the v3 spec like this:
> >
> >>
> >> 1. Set the coded format on ``OUTPUT`` via :c:func:`VIDIOC_S_FMT`
> >>
> >>   * **Required fields:**
> >>
> >>     ``type``
> >>         a ``V4L2_BUF_TYPE_*`` enum appropriate for ``OUTPUT``
> >>
> >>     ``pixelformat``
> >>         a coded pixel format
> >>
> >>     ``width``, ``height``
> >>         required only if cannot be parsed from the stream for the given
> >>         coded format; optional otherwise - set to zero to ignore
> >>
> >
> > But MPEG2 being a format where the coded resolution is inside the
> > bitstream, this is purely an Amlogic issue where the firmware doesn't
> > extend the capability to do this.
> >
> > Here's a proposal: if I were to resend the driver supporting only H264
> > and conforming to the spec, would you be considering it for inclusion
> > in the main tree ? Does your current iteration of v4l2-compliance
> > support testing stateful decoders with H264 bitstreams ?
>
> The core problem is that the spec isn't finalized yet. The v3 spec you
> refer to above is old already since there are various changes planned.
>
> If you want to test your driver with a v4l2-compliance that is likely
> to be close to the final version of the spec, then you can use this
> branch:
>
> https://git.linuxtv.org/hverkuil/v4l-utils.git/log/?h=vicodec
>
> You can test with:
>
> v4l2-compliance -s --stream-from <file>
>
> I wouldn't be too worried about keeping it in staging. Having it there
> will already be very nice indeed. Just add a TODO file that states that
> you are waiting for the final version of the stateful decoder spec and
> the corresponding compliance tests.
>
> The V4L2_FMT_FLAG_FIXED_RESOLUTION isn't a blocker. That flag makes sense,
> and so it has nothing to do with keeping this driver in staging.
>

Okay, I understand. I will send a v7 with the driver in
staging+TODO+MAINTAINERS update.

Regards,
Maxime

> Regards,
>
>         Hans
>
<snip>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
