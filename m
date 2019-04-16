Return-Path: <SRS0=v2ss=SS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D28C10F13
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 19:23:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 362C7206B6
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 19:23:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tPJq5Av9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nCULT+Ne"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 362C7206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjLyFcnDYvCFhf0E/y6WJoPtVHorgiiB3K82ANBK0XQ=; b=tPJq5Av9EJwVOw
	r4ozTikGcq+ooS44AJYsc32KFVkCrEX8q3hmJfNGuMlfDyTgg3ImMFj/jVzOBRa0UN/c7AjZA3Jab
	R52xFmbxBW8gsjLqs0sO6Ezrhjb90I3/RqgjqbUxRjLseDmO/gFZshparSNyo9x2PUGAv/fIMfwn+
	BDhjFXQyATKYA4VFtZH7c4gO/T3mxQGaCffNgRhk4zWpT8qK4WJ3X8GM/sPlPzyZxY07QLP/mPQJ4
	ZbrJ/Y8TnB7MPyDHVzm2Z/juhe2dgxPsVRht2M2Mlp6bsAGq0R4+b5EbtgrVvC6rRYtj7yjlSvCVo
	bROsJhRKZ1Xy0dZ0bduw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGTfe-0001Bn-Rk; Tue, 16 Apr 2019 19:23:06 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGTfY-00014r-2r
 for linux-amlogic@lists.infradead.org; Tue, 16 Apr 2019 19:23:01 +0000
Received: by mail-oi1-x244.google.com with SMTP id a6so17965968oie.5
 for <linux-amlogic@lists.infradead.org>; Tue, 16 Apr 2019 12:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eTxW3fLtGMVxaNNxm+7tK8AkRxo6QtTaArjlwjFimwE=;
 b=nCULT+NeynqpzlbLCUgKJJOPmC2FU5yqzbqRpTa1OHbtEWUkDEpR1RUITY1aEF0I6m
 HYyMEU6W+HFTJTjkycdgckBDKY84O+Co6Bm4y6mkw9Et0sN52OjJeObEFgdcpgOuD3ez
 nWK7sAXPmIfx0avg2lwfd505JSYsVI8RXcQ8oe45DKskeGH7CE+nbg8ueNYF08LZokF5
 cU6gJ8Nw5X4mvk4HD6CMsZfdsKppTRL2C3tO/81ezBP60EOIlT0NHNdAxhiZV3UHa30C
 r3C+wG20HOT1utx19Cco7yaW37XqdNYpuS27sjuyAbSfYf/jOT20/u60nDej6mEgWy74
 fLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eTxW3fLtGMVxaNNxm+7tK8AkRxo6QtTaArjlwjFimwE=;
 b=OIEOHPW7Mg3A6glHp5OSFri0JIPj88ZxYHVvtls++lpmiEjkq63/vq2nzfIApG7Ggt
 LMVZVhfAheqM/0AF3EdWZOBkNliJwL99H1K+ngV/zrwYwLy3/T1ywMJrXN6lp2fzd8oK
 Ef9cl+FEELreu6uQ8UG00+BdUC/ZGcmv00nJkcyJa0sITTuzg3xDIZr95wmrCwimFTGd
 y0SE3n5N9/5j5l1IGWnxjcAoSDdIurkTIZHo1kLzw34ZdAqQPlzCX//W2oS5M/wwoN9a
 mPM/73l9SBBfUkQKp4HAqRwFR67VMgQ3BvdKEfrsWMf0j+Us+dXtqlpOXkSDo3BeNxTO
 fRHg==
X-Gm-Message-State: APjAAAW7wLmOr1D7Xyrw7sazmy/QZ6cV3wHySSCAdaK/e+v/na4SX5DE
 te4jaQWR0S2K852CRvBYT8+as62rrQKsKzxvwi7Jrg==
X-Google-Smtp-Source: APXvYqywdBBuVdUNsRFqcyFXlfvqNzzyDHZZ7brdh0IueD467Vy9uLAJPUOLQzkRA+UangCk+v2KGJ+BIVS6jlUE/zw=
X-Received: by 2002:aca:5108:: with SMTP id f8mr23438714oib.55.1555442577743; 
 Tue, 16 Apr 2019 12:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190412125136.28232-1-jbrunet@baylibre.com>
 <7h5zrdpytg.fsf@baylibre.com>
In-Reply-To: <7h5zrdpytg.fsf@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
Date: Tue, 16 Apr 2019 12:22:46 -0700
Message-ID: <CAOi56cU0dHoyRzTXeKGoiFwTms4WuJ7LV2EXTJLoEmOsC8OyrA@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64: meson: g12a: add audio devices
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_122300_122568_C211AE84 
X-CRM114-Status: GOOD (  10.44  )
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
Cc: devicetree <devicetree@vger.kernel.org>, patchwork-bot+notify@kernel.org,
 lkml <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Apr 16, 2019 at 11:52 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Jerome Brunet <jbrunet@baylibre.com> writes:
>
> > This patchset adds most the audio devices of the g12a SoCs.
> >
> > Kevin, couple of things worth noting:
> >  * This patch depends of the new audio clocks binding recently applied
> >    by Neil [0].
>
> Was this supposed to be part of the clk-headers dependency PR I
> received?  /me looks... It looks like it's applied right after the tag I
> pulled, so I doesn't look like it.
>
> If I should queue $SUBJECT series up for 5.2, I'll need another stable
> tag.

Also, this doesn't apply cleanly anymore to my v5.2/dt64 branch.  When
the stable tag is ready, do you mind doing a rebase? (or telling me
what it currently applies to, and I will do the rebase.)

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
