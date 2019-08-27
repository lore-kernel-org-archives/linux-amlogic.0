Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832A5C3A5A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 05:40:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5752B21872
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 05:40:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ngzfPq3y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="BmL0Q/rX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5752B21872
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQtuefGfbXC3Fu6Ag3kBIt3rNTYBDmrLxXSg2RFjKiw=; b=ngzfPq3ywtBOC/
	RsOj2RIphh3Q0GEEr9wlNhl5Obt3dcNQjeJdEje3j/W3utzb14lxuhp6o+tC4/+MnoN+QjgLJjDGR
	kOPiZISv9MUZh2t1S2RJnuMFT2PNxW3jgMJGP36U1yGSg/pl6jONkYSwmPtqzaByKwvhSAIK2435s
	G2vCtoxKJCD59pWWIk7VJ5YclJ9E0CTvg6z61iUcq116cDy/55gd1k/JbfK6oSW2P2EHizcCRoOTf
	CfzHocnp+vnRDyKcMYlYboWlrRbe7CzbsiSV7UTkAo6WTVnIJapVO3IQWytU8Twy7cx7QEquNyI7F
	rijNzLv14jl09ayPkQkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2UDj-0001hk-MT; Tue, 27 Aug 2019 05:40:43 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2UDh-0001h2-1g; Tue, 27 Aug 2019 05:40:42 +0000
Received: by mail-oi1-x241.google.com with SMTP id h21so14021764oie.7;
 Mon, 26 Aug 2019 22:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rPIVNL57PP+Nf8p6Kp3uQdhTH38JJW4Kftqg1AMoBV0=;
 b=BmL0Q/rXa+SE59AS2UvXWjSGV+FMJrqcCnqJPuBWJ3ZSW/echijI0VOVWecqgbt7Qz
 2nxWzeojo2p2JD/l/SpAm3aUdyeCKIsCoHY7wHPnWugeUWKZpKcEHfYwC6+XsoehJOFY
 LVrBGjofWFxGqj+Zgw8ey9V+OaVtPnOA1ChR8eIwnxXCPVojr4UWtAMWer4NJL/3Ni5U
 ySTcrvjd6roSYqltfeRB8v5P5UEcYg2K3edHIHHpM+dl2I+ugSy1zc7Xo2wr03Z8gLa0
 Rnwmk66QOHpSORcjCIGeoBhsHOfGW/tTYflZlRaippNifQqAueryoLXa6YojF2h3XW6p
 YETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rPIVNL57PP+Nf8p6Kp3uQdhTH38JJW4Kftqg1AMoBV0=;
 b=KY/0TPNWTyPMQw0NNR1JGHcyD+aWDV2ppmvr0zGqprjeIHYmY7pxrUCPQutoPs85zE
 ljxpNdGx5tvpd/gCv5VTI/x0joGLdGTTDg62cxWlbcksyxyQnrJKAM/MGY4c1RqrIz2H
 nVyyZuzvgfxyD10RNuUwa8LqhCihZeXKniIEFbiT+XfOHVBHbAPmsaJgQX0H1GIPG0Qy
 UFGz00w/bJ27r5yTqwMQtetkyYp6e1LazfRm/n6UxoZ78LpFOBnVzZE1uT/VtatXJIpT
 Bnl28gchUZv2OJSQOUb3PyewFe3nEaneZ9lJVznXEGGEmD6QBMO76Ulveqb1VPA7qykJ
 zUdA==
X-Gm-Message-State: APjAAAUgxmaeZVjBBybr2pi6cdHSU2P9gR7f5lDdu+rzzfZKRFZ9b5t9
 3vl0ajrxtllWBqqS81b7bolunmesh+LlPa4Jxbg=
X-Google-Smtp-Source: APXvYqzzdF+CZBcadDQQ7FgxQnP/o6XEYbYqavRhDmjtnbu3qIY6iSxJZ19yy0h3us/UdTfoQ3DfXKzq9CSpnzx5c8Y=
X-Received: by 2002:a05:6808:b14:: with SMTP id
 s20mr1881239oij.15.1566884439743; 
 Mon, 26 Aug 2019 22:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190826144647.17302-1-narmstrong@baylibre.com>
In-Reply-To: <20190826144647.17302-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 27 Aug 2019 07:40:28 +0200
Message-ID: <CAFBinCBdxLnHsqvLT863cUkZ3Cf_2FhzOMQVTvLbxNCsQBi1WQ@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: vclk: use the correct G12A frac max value
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_224041_093940_ACDF0E73 
X-CRM114-Status: UNSURE (   7.43  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Aug 26, 2019 at 4:47 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> When calculating the HDMI PLL settings for a DMT mode PHY frequency,
> use the correct max fractional PLL value for G12A VPU.
>
> With this fix, we can finally setup the 1024x76-60 mode.
nit-pick: is this really 1024x76 or 1024x768?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
