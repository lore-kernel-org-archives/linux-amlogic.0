Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA01C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 19:40:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E7C52064A
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 19:40:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rsUdx8D3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="XWSSCotf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E7C52064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=st9faid3LCAfV+l14nfOqzUTd9LWOIdf8tcHGKVLn8E=; b=rsUdx8D3F2CJbD
	kWAz7CIFqx0sHXv1b7B8nXjvhmsCd56ee5mgSCgjOCh7SKhlU2cIAysEjaa/OqI3MRb1hbIBDkWs1
	uGgPTvZ6wVQV3EjEi3obhBIwIes+gpKchWR8ANNWO4Wo5u9e9siZjWOYZNcwEN+JXS0Gk2hMVuJiR
	yta6x6nMyhct9iT60oCzUhj9XfQTtbVlagdf67Wre72djS/T3hnkmlGcifHFcI+DJTHFDlL/ncsQA
	jM7QYahzh4uVSUARVdFUdwPLh0Ti6jM6l0okyxz5D6+lmf7GMZWuM0sngR8haPdD+CcCaMn+HAsQP
	+x33wr4RvBL2aklKim7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9xMO-0005Ev-3N; Fri, 29 Mar 2019 19:40:16 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9xMK-0005EE-AS
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 19:40:14 +0000
Received: by mail-oi1-x244.google.com with SMTP id v84so2603291oif.4
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 12:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aM9EKbz+7/aPftkItrnYnE5lqNxYBNnVwmeQcd9Kol4=;
 b=XWSSCotf/SUOGGDvpsm0X47JUHungm3R8BL9EMv5wa07skyS3+dCtJVq4UCloshw3r
 tCOzlMx2D8Ud45cz7xpFGXFlkgy5vKZypantTNwbdsKQYa9PAMEwwIgx8nk9OX/748ao
 wW7YWWqSYkW1mQbCNCoPUZyr3WkSRX59QbiUUosDYBCNKjPd0Z2Nhtfm37O2ZNThL0Ex
 OhpVIAStg5NyOLBWVyQ2+Y7HgnLtsY246fsp+D9zZvgLDFZvutnvUNXtrgy8raXM4SU9
 oLd2gIrVnngCumwnG/ZupTCdcy+wx3GlZGu9f60IgfXpAOyVptXaoqv2B78QLGnouL4C
 2JoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aM9EKbz+7/aPftkItrnYnE5lqNxYBNnVwmeQcd9Kol4=;
 b=nMAqDkcXgVlLwTfzKCr0HypNY6W0HTQQ5ZMgt8M5hmzs/bmx/mZhszuoC58Crllc7n
 0DK6QJWYZVOV2cooTDuziF4P48HWFFyIFbRFQkhiVX3q+HYFXTkOSNXaqvDfaIuttTpM
 RGt50DOZ9TDbWryknZUJ8thZdInklMcy+GcZwdW8K88+du2mRr+ZW89p/N/VbhzRTlLs
 06LcD7Ehuuppb+ifhSydLSLnTt07B+4TUeE0GzNNMnVvfdfi/TgSYwXckSkhLbPa5GRn
 zHv0mv6YiWQE1e8yFsEH0a2UPmlZ4KfJcndY5PaEVP9SzFI3kNUL2NbXlgnwO7kg0MJj
 bLXQ==
X-Gm-Message-State: APjAAAWQ9U0HLdZ0BfDnKSxO10aHSoqf4uuLieW+iysXsP7060ujkygc
 joZxF27tLbFcxifD77yAbDeX8d1SO3R7/Eq7oS8=
X-Google-Smtp-Source: APXvYqx+0UvqGXfA1c84cS+UB+xOob5koPFek2j1iN3hUhQkOpzkkZ1VnzC/KCsVWVhLAkiY9aLtijKDly7m8gjhGPY=
X-Received: by 2002:aca:bdc4:: with SMTP id n187mr4966052oif.140.1553888410427; 
 Fri, 29 Mar 2019 12:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190329153325.23869-1-jbrunet@baylibre.com>
 <20190329153325.23869-2-jbrunet@baylibre.com>
In-Reply-To: <20190329153325.23869-2-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 29 Mar 2019 20:39:59 +0100
Message-ID: <CAFBinCDnoY41ZcoHqsngR4WTeczkmOu93R=2G_JOXbdUmHSjMw@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: meson: mpll: properly handle spread spectrum
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_124012_645807_3E71E8C0 
X-CRM114-Status: GOOD (  18.26  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Fri, Mar 29, 2019 at 4:34 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> The bit 'SSEN' available on some MPLL DSS outputs is not related to the
> fractional part of the divider but to the function called
> 'Spread Spectrum'.
>
> This function might be used to solve EM issues by adding a jitter on
> clock signal. This widens the signal spectrum and weakens the peaks in it.
>
> While spread spectrum might be useful for some application, it is
> problematic for others, such as audio.
>
> This patch introduce a new flag to the MPLL driver to enable (or not) the
> spread spectrum function.
>
> Fixes: 1f737ffa13ef ("clk: meson: mpll: fix mpll0 fractional part ignored")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/clk-mpll.c | 9 ++++++---
>  drivers/clk/meson/clk-mpll.h | 1 +
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
> index 64d31c8ba3d0..2d39a8bc367c 100644
> --- a/drivers/clk/meson/clk-mpll.c
> +++ b/drivers/clk/meson/clk-mpll.c
> @@ -141,9 +141,12 @@ static void mpll_init(struct clk_hw *hw)
>         /* Enable the fractional part */
>         meson_parm_write(clk->map, &mpll->sdm_en, 1);
>
> -       /* Set additional fractional part enable if required */
> -       if (MESON_PARM_APPLICABLE(&mpll->ssen))
> -               meson_parm_write(clk->map, &mpll->ssen, 1);
> +       /* Set spread spectrum if possible */
> +       if (MESON_PARM_APPLICABLE(&mpll->ssen)) {
> +               unsigned int ss =
> +                       mpll->flags & CLK_MESON_MPLL_SPREAD_SPECTRUM ? 1 : 0;
> +               meson_parm_write(clk->map, &mpll->ssen, ss);
> +       }
this changes the "ssen" flag on all supported clocks from 1 (before
this patch) to 0 (after this patch).
is this on purpose and how does it affect existing clocks?

based on the original commit 1f737ffa13ef ("clk: meson: mpll: fix
mpll0 fractional part ignored") it seems that
CLK_MESON_MPLL_SPREAD_SPECTRUM should be set for mpll0 (at least on
GXBB and Meson8b)


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
