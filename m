Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600F4C04AB5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 19:47:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 318D92089E
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 19:47:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jz6sNcr3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hlCoftlD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JXj2zIOF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 318D92089E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ypbwW0ZDFiE8uHm8IagTVV+p5s/vUoSLHxM+018ZBx0=; b=Jz6sNcr3aXlwbl
	6krLnR6+YXkcCEURvntAT3XcjYwcFjzNTdHNLx6Xm0eOV/33qFOrq0Pgf0irl+bNxiF24h1oPuK0c
	6X/asLVNLS7xQz5cUT1f1TCvxSG7C2BPp900wrwGR+2rXdNOINij2jDS5VLjf20db8FCx52nx7bZb
	oGZmP2wJm7GsoPt0gSGvhzI10B2YqBk7ct6gAFD3XhHF9FyWENcQn/QIluVt+gSRR6BmDSohOetLi
	dI0juHhpBAUap8M7ND3ziVBgc6ByHKYl7/7/hSAb+d+IulhBWS3nnmU/35wt9HmYpWeWlzJWPoO1C
	kJfgDvl0U7htdISXLbbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYyMD-0004uv-Mc; Thu, 06 Jun 2019 19:47:29 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYyM9-0004nj-G3; Thu, 06 Jun 2019 19:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8wGfAmKyoK9bVApTeJ1ikTLIPBAYdTrgDhJ6H/YeNVg=; b=hlCoftlD4vXaRZDY67sAXvm8V
 OQ8QaSeCUx0r/Fw5MLgK70sscCrAeobQfYhM+Rw/ITkQBPPaxBBw3fXTuWxDns8n4qyq2182EV1rV
 LbSwI/3IHApyncflZ8uBKcfD2+qtFBy1LKNQ+u44mC6A570tRya6zW9SZ4PBlgd1OnjrYFcuzqdt9
 u/Lph9cpAkLXXkNMdIpsxg9rctAbO4uCeCu5v/x72UV0Gx+ok35OutSGcJhD7h/WBYqZgPcf+ncxc
 /EADL9R7fNK2ZY8HrHjYH225UwdExkVYAwAuf7gmI+SdiTspK8AAqlc6nu6EXcEOHabVYsnKTSZ1X
 RT+fmWvUQ==;
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYyM6-0005P2-Pa; Thu, 06 Jun 2019 19:47:23 +0000
Received: by mail-ot1-x344.google.com with SMTP id z23so3089018ote.13;
 Thu, 06 Jun 2019 12:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8wGfAmKyoK9bVApTeJ1ikTLIPBAYdTrgDhJ6H/YeNVg=;
 b=JXj2zIOFKEDcuxGqOXtaHzoMslRkH8F57wmo6Zg/C6Z48YMAJJzLyoK0y6q78VFXce
 sdIPp8OqGlBPq3V7mf87QV2UbHH7BIm1Fc3aHqwzCA+oljMlGYlHfkc3TI0I484O1K1S
 OXOMxDp8X8FWBYd/ysRIABwzI1ccbF3aeS12gtq8RJ0gFh57xBlSAoFVpPOzPKUEw+nG
 KtQmVAhtVZFxD6tK91fpiuOjaUaptaq/Q5Ev9mslUgwgexLbnMK5+ugOd7rQ7C1RqPlX
 xDPvBzguKkH0bAG2BPJA6lYOrrj/kAtz+rZsKRLu43r3SFAQxC7HLLwcCN35PWjP9wmm
 z7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8wGfAmKyoK9bVApTeJ1ikTLIPBAYdTrgDhJ6H/YeNVg=;
 b=IpbYLBonqlHM1aVmGgpyJqkFhyllioYZy5w/iW17HlhhCUUTVprZGjSmz4SDKoQZVF
 gh4zmhAU3gx3ql+BTVF38NyTvJKHvFvV1WlyW8a5XauQJUlS0Dw5Yv9GCV1Ks+cBLXhd
 6Kkm/flkEEi8wUZrJqMc8OeSQ9DkXCwf5sHV61w3qOIiapNAH6Dup/qHsDyoSInQ4MaX
 qu+vVHF3J3wAQ2ha8j1P4aMWWSo2iUv/PJ9xz6I5AQ431uy/LMbKYfd9YFXfoi1fRfAN
 qa8VLIV++EUAszn5A/GXnqRHy27Am/C9/W3gWedfdKYYl5CF4U90R4WMtKXB4BCwl9hm
 IfeA==
X-Gm-Message-State: APjAAAXI1t0k+Rz5/gThbA8rwm33ikCBmIF8sYxfHpis3/n8j1+FBxmJ
 rezLTQvo2d3Iv0N4a8kksgORQ2W7F+IryfCFZQQ=
X-Google-Smtp-Source: APXvYqzuT2RwZC2LIrDFehW31R9jvGbrmRuApk42Pg+UA3g4byiNms1PcIULKfXunwPAiHdFS6Np+7uvtr1uGqZj/+s=
X-Received: by 2002:a9d:14a:: with SMTP id 68mr15424609otu.96.1559850438867;
 Thu, 06 Jun 2019 12:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190603094740.12255-1-narmstrong@baylibre.com>
 <20190603094740.12255-3-narmstrong@baylibre.com>
In-Reply-To: <20190603094740.12255-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 6 Jun 2019 21:47:07 +0200
Message-ID: <CAFBinCAR47VuoDoWerX4YZ4=v2G4+L0MW9kP0bEhrLWaWOPdfA@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: meson-g12a-x96-max: add 32k clock to
 bluetooth node
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_154722_859236_42B5D34B 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jun 3, 2019 at 11:48 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The 32k low power clock is necessary for the bluetooth part of the
> combo module to initialize correctly, simply add the same clock we
> use for the sdio pwrseq.
>
> Fixes: c5c9c7cff269 ("arm64: dts: meson-g12a-x96-max: Enable BT Module")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
with the correct fixes tag:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
