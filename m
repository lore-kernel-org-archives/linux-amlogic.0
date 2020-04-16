Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3E5C352BE
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 10:32:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE85A21D91
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 10:32:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ky9h+wLh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ryq1RWfi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE85A21D91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FOcCwm7z1xrWixy1Mpkt5HRTqjQJPKH4oI5m0OeVtp8=; b=ky9h+wLhXawlRL1kaZ36Mn9l4X
	saFDDGcbwqgbDXkwCC4QKxkbc/qbKte3BdCVsmakB+JZOqpTosYSo4SAqJRveTSqaY+UDFvzxReR9
	skz1LjgLlhkNe7nkj0W+Ff6GsLCDqsikVqDay6qwjlqPsH2KJlZciHKuaSxLFP5nw+TrrcaTDkAkj
	fCwGfxL9iBGXgFYXZdQQf39QMqXpCfq1Tkea+Lprt5fcNHlcCbkhqxUw53lHqBiVCho7bUvxw+aSs
	OPqTRfLP8S/VOn5p23z95jVdWtbkKjxWb8f3lkhg0or14/Fa9RIQyBjZqSizG+g4EIpAhNnZZAwkh
	GUtQ3VWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP1op-0004wF-Ec; Thu, 16 Apr 2020 10:32:27 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP1om-0004uy-9d
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 10:32:25 +0000
Received: by mail-wm1-x344.google.com with SMTP id a81so4234449wmf.5
 for <linux-amlogic@lists.infradead.org>; Thu, 16 Apr 2020 03:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=9L5k3Ln1Qt7W9TpURaqzpjRy4n7lxiu2UCwSIpKQOFY=;
 b=Ryq1RWfipGTXPSDerCgXOnwVBcBk+SES+dQi/983JsKTieI0hUpxVt0XEnAt5BZtc+
 3j0OPScJqjuBIE/e8RGOCz2qxvAOsR5mXaTJGLhb/2duJk/L3WjLQ/RFj565RNvubZUj
 hrSaYRFzGzIrj5sKgXIknAqEaWAnJEKXWJhEzJV60auxxyKw0K6wI8LTl2AvhZqxAIzs
 uUb+EokUxmU9Z5axhY1kITo29sfTFoPdQv2b6GKfiFiAtbS7xobLEghD53lOPZN2TpEu
 nZmpRVx6DspQ/ffW9RGXXgnbX7+3JVYh3AZBYzIMNW5yjBNXwQzkQJY9vONcYn4HDTT4
 WFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=9L5k3Ln1Qt7W9TpURaqzpjRy4n7lxiu2UCwSIpKQOFY=;
 b=ZJHpobyr1voyY7phS+IUp01e13uztysGPV7IuyOimpJJd3tLJns3nNwTJmL3sGgDlB
 wrB1SR3tkGEDM0sX82Sf96wUScf5NI+8HTIQGqjHZtn673SklTpO6JKSFDZuGBnYVvV8
 0V/VoaXD88ZtDd/p9sQw/Z9rDE4Gf0dds1SAO/sXxdOKZDD06d0ncAKefIUsNgnLa1EC
 YuU7VVtm/XCweehaGbzswUVnNmFqg30hqeo15Grwyj+p3vsOF2kkhNOd0w6xXLqAjpzc
 eSJ5CjCcjIz69+46q7mQZEVeyMRJl5iqykXFt9GLJ23Lx/ZA5wa5S29QHb/bH3z84ydO
 aC4Q==
X-Gm-Message-State: AGi0PuZ5a5LQKkG/m+mRkkuKGKH6/pqFhH9wZuooSnG1aYb8jZjhnkH2
 VJcu+F5xixpzUKR+BZpP/O3XbQ==
X-Google-Smtp-Source: APiQypJclY5jrpfvL8yZKMalQnkMXP+jCZNrFkQ3BCEqz3+ltwYSFd7LZVCdQLzaOSzpaZBpIvP+Cw==
X-Received: by 2002:a7b:c181:: with SMTP id y1mr4442183wmi.83.1587033142678;
 Thu, 16 Apr 2020 03:32:22 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id j135sm3021115wmj.46.2020.04.16.03.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 03:32:22 -0700 (PDT)
References: <20200414200017.226136-1-martin.blumenstingl@googlemail.com>
 <20200414200017.226136-2-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: meson: meson8b: Fix the first parent of
 vid_pll_in_sel
In-reply-to: <20200414200017.226136-2-martin.blumenstingl@googlemail.com>
Date: Thu, 16 Apr 2020 12:32:21 +0200
Message-ID: <1jblnrbu16.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_033224_343067_281B48FC 
X-CRM114-Status: GOOD (  15.99  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue 14 Apr 2020 at 22:00, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Use hdmi_pll_lvds_out as parent of the vid_pll_in_sel clock. It's not
> easy to see that the vendor kernel does the same, but it actually does.
> meson_clk_pll_ops in mainline still cannot fully recalculate all rates
> from the HDMI PLL registers because some register bits (at the time of
> writing it's unknown which bits are used for this) double the HDMI PLL
> output rate (compared to simply considering M, N and FRAC).

Have you considered adding a fixed_factor pre-multiplier, like in the
gxbb driver ?

Seems to be the same thing

>
> Update the vid_pll_in_sel parent so our clock calculation works for
> simple clock settings like the CVBS output (where no rate doubling is
> going on). The PLL ops need to be fixed later on for more complex clock
> settings (all HDMI rates).
>
> Fixes: 6cb57c678bb70 ("clk: meson: meson8b: add the read-only video clock trees")
> Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/meson8b.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 7c55c695cbae..90d284ffc780 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -1077,7 +1077,7 @@ static struct clk_regmap meson8b_vid_pll_in_sel = {
>  		 * Meson8m2: vid2_pll
>  		 */
>  		.parent_hws = (const struct clk_hw *[]) {
> -			&meson8b_hdmi_pll_dco.hw
> +			&meson8b_hdmi_pll_lvds_out.hw
>  		},
>  		.num_parents = 1,
>  		.flags = CLK_SET_RATE_PARENT,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
