Return-Path: <SRS0=mpVK=L2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEC2C07E95
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 22:58:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4CC561416
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 22:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4CC561416
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=madJ4Q6H/lfalK1CR8gzSsZRBswnMjZkN9j3OcawXoI=; b=06z02eLvAOvdAs
	68Ft40qyqKB3ihD83tJtPixCR2v4+Ka0ga1iQDgbrk21Py0D6yb953fVXUsC851MJxU02De4Htjf5
	pTiLmjbCpqv1YuP+a0GnClxjlPSEBM4IONNuQtQM83KZNG5vUKiZ1L3muEX6T1bKaMoQWCUJPcDhd
	PUzp9rtFxsSEELQcaAUHhx/9RgtpBG1gDJ+VI3Y0NUYyHjkqGTOgyIXzlyHVdsE7lpssVKvYpEWUl
	CiHhx2ptGqJjAd4l9X61zflm69rA8c6M9pLcsnI2apqS97XWBen+SfOXKVs0qcnpp2JsFVP4Gz+Ze
	abeBQCAQT0oRFvW9aAsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzS78-004EGE-JB; Fri, 02 Jul 2021 22:58:26 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzS6r-004E9u-OS; Fri, 02 Jul 2021 22:58:11 +0000
Received: by mail-ed1-x52f.google.com with SMTP id t3so15203846edt.12;
 Fri, 02 Jul 2021 15:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vD/TqU6XibWuKwYjrV7s56wP7tIAz61+brCWfIO8Z2U=;
 b=XjBvD2TBKWWknE0OCd9OoUjARi5xxbwhs4C6y7LA5KBJ+XVEf4PLQHxLA9h3l0hKlB
 qJ+kn3S9k27KrLK9izjUJqMpTPnzS4H9klZ9IvuLfOEhj0O4WFrh90+zqHa7p8igLkQ6
 x43wE7EcFN4vWBTR2Xfnb4heyvbkGgRGN1K7fwf+ZofT7ao2WtI5QK/Qc9wrD14MI4yt
 CQD6QApV+vLOTnAG4bP4StCgTWHf3cu/XwrpBpntVbLZD9h4Aw16gIAu8Ns3IpPyRz3z
 IE4YoTYFQ9ZGJl/sVlWs/Bxt1F+t7LdcQbPvpyVkt99X91IKAr5E7hs21Smu4ZiMHl2+
 zxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vD/TqU6XibWuKwYjrV7s56wP7tIAz61+brCWfIO8Z2U=;
 b=URjwFUe9Jc7LoHOb8DKhBE0Yc5ZkLA040aSBfjHH5MjVHnsfXEmcMBfWmIuhGlYfnD
 5j8dJ2sNk+e0xgnt8u8wSCb1rTmtlGSyIhzhNHFckhD2CvI2CFqlPY9oM1jmOCbRNar1
 LQglAYilCzbu6nHDGwQdYnH/76Lm9EnDjgKWPdPOVG1h5rzCtCUtOZySlG3pKBv8Dm8w
 En9f/MY0DbrDS2vZCHwIYqhl39DDHTDFZtg9fY/bZktEsOsZVn6yQgSNzJ1dkRxbz/nb
 fDEEGGGGXq346CpMbQ4AN/D2eCZ9WlRyWfVKgTlPHhPM+eccexs/B904S0K9KpzHui9e
 fflw==
X-Gm-Message-State: AOAM5304FnUm/aFfi3YT56drB+jYrYNrKB6OdrcBtYqpiV/GkE/HjIpN
 Ov3W9naIwLmotzm8PaE/ZWDWcMxL+pOWxOC0J54=
X-Google-Smtp-Source: ABdhPJxXJfuDOqau0i9bIe7paYpcmNa20KnLmKDh8yc2DV1RzGhDNRIB8IZvZkTatJvfWGjnqztGHlGhSGbu/YbPKos=
X-Received: by 2002:aa7:d74b:: with SMTP id a11mr2191239eds.40.1625266688199; 
 Fri, 02 Jul 2021 15:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
 <20210627223959.188139-3-martin.blumenstingl@googlemail.com>
 <20210701202540.GA1085600@roeck-us.net>
 <CAFBinCC2KB-_pOenpWPknCuHV+CCjhP5hqukSkwD3qwRe6OtQw@mail.gmail.com>
 <162518776607.3570193.14348711594242395887@swboyd.mtv.corp.google.com>
 <CAFBinCAASQUB=cg5EFsBQ4jd3TvcCJzV1=sYJci4ibR7FjRcww@mail.gmail.com>
 <162525955027.3570193.16463056788252699243@swboyd.mtv.corp.google.com>
In-Reply-To: <162525955027.3570193.16463056788252699243@swboyd.mtv.corp.google.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 3 Jul 2021 00:57:57 +0200
Message-ID: <CAFBinCBsveheUZeW892J+1iyB_5P67rdLiJHtq4+PoNF4r_4CQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: divider: Switch from .round_rate to
 .determine_rate by default
To: Stephen Boyd <sboyd@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, mturquette@baylibre.com,
 linux-clk@vger.kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
 khilman@baylibre.com, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_155809_872105_170D8E93 
X-CRM114-Status: GOOD (  15.12  )
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

Hi Stephen,

On Fri, Jul 2, 2021 at 10:59 PM Stephen Boyd <sboyd@kernel.org> wrote:
[...]
> I'd prefer we leave round_rate assigned in clk_divider_ops and
> clk_divider_ro_ops but then also assign the determine_rate function. We
> have some duplication but that's OK. Then make individual patches to
> migrate each driver over to the new clk op.
I just sent a series with those changes: [0]

> We could stack a final patch on top to remove the round_rate function
> from clk divider.  Unfortunately, if some driver wants to use round_rate
> then it will fail in interesting ways. Probably best to live with it
> until we decide to drop round_rate entirely. Patches to convert all the
> round_rate code over to determine_rate would be welcome in the meantime.
For now I have omitted the patch to remove .round_rate from clk_divider_ops.
Also I will start migrating .round_rate over to .determine_rate in
drivers/clk/meson/ (as it's the only hardware with CCF support that I
have).


Best regards,
Martin


[0] https://patchwork.kernel.org/project/linux-clk/cover/20210702225145.2643303-1-martin.blumenstingl@googlemail.com/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
