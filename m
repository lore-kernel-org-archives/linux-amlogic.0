Return-Path: <SRS0=0xNA=W6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3CBC3A5A7
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 13:18:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 652B2215EA
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 13:18:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mhSRfCUf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 652B2215EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1joAfxxVZcIIUY49EX8Z1GVJN5knQfMGAAF4si+rP4=; b=mhSRfCUfD9Sx0F
	x7hgsE3kGTRIVGMkVm9oTqZZ81L339mlOgEDcSk/qi8rMPOwdx/ODwErxFwCdVDCpndPhcB69TEa6
	G4oTZvfMVZOlOrs1j1eq8rLSslO0STZlls6FxuEXiE1kUwm0XFbPzk9KIC76urML4k2hqXNx1NnDe
	TSEwD/VsBOCHmyT/pQKyCGEyZv+b+qVf9ONAR5YChdxxqlb4P3SXi1mZvj9cKcF4dOiKe9VJT4Y3K
	JhMuMoTSyYjB+DyO2PsgI8SG3Ck/FxFFMOvK1Nv1A56KX6lgnmBwNfyNb0iTP+dPO7SGW05Slbqun
	2GsKv4cQM3EpZfSpY/4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i58ho-0000mp-5h; Tue, 03 Sep 2019 13:18:44 +0000
Received: from mail-qt1-f172.google.com ([209.85.160.172])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i58hl-0000mR-NJ; Tue, 03 Sep 2019 13:18:42 +0000
Received: by mail-qt1-f172.google.com with SMTP id k10so9588543qth.2;
 Tue, 03 Sep 2019 06:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q7XhjTZ4U0XBtJrqkQT+4ZLcImKzdeX0KOpyla2R6KQ=;
 b=dTA9nZ7fRULzA6Y3YpWj6qpre3MIhERgYDBFjXz2WYEIBd7MiiY4BY3vrH8q3zite9
 OqJkdxNkCyJsxZ+CjLW1kteFjMR9rgKSa4w65GOLP5kJQz/tuUiOZuMMD3ofe7V4wyks
 33ZjD9Tt+JoVtCsR5ovogntzIBPC5bTZ0cBOfwCG6vh+8yGxzs1x+kK+H/g+NQgNwn1E
 W2Ebe3dOc1sHLEYGxZQ6G/2yujJLTxAr8P0/xcOp7MdCbBjSk2Ymmtf+NMicGSZEiG3U
 CrHoYz0hnHln6HoKTjBJ+6bG4pU5dq/rMuRSDRERLE1JrF/Bb/knxkWhOTZ6HiO0vPrj
 aZcQ==
X-Gm-Message-State: APjAAAXjVAn11NK/aXfq0s9kcebtfz8C0dqwCiaYL7kxbcPbhtktc3mC
 PQc9B25X6A6DGFrpY5XQsB7m6tfDQoFUlpxsgec=
X-Google-Smtp-Source: APXvYqyuI1oJ3O8gqJRhCXF6QwGzOLi0zmr7KqS8uEM1YSyR5vBgxlPkU2BMzbYpcKSdIg5Id6wMyw53RsJZERF3Wv4=
X-Received: by 2002:a0c:e74b:: with SMTP id g11mr21496469qvn.62.1567516719320; 
 Tue, 03 Sep 2019 06:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <7hr25fbi4v.fsf@baylibre.com>
In-Reply-To: <7hr25fbi4v.fsf@baylibre.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 3 Sep 2019 15:18:22 +0200
Message-ID: <CAK8P3a2yWX=PiwdOKqTB5A8KiAwzj5mqaGe0J=VFbjb+1a9+XA@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: Amlogic updates for v5.4
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_061841_762693_7ABBF42F 
X-CRM114-Status: UNSURE (   7.78  )
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
Cc: "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 21, 2019 at 12:13 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Arnd, Olof,
>
> Below is a regular round of DT updates for the 64-bit Amlogic SoCs.
>
> Of note is a set of clock patches I've merged in from a stable tag
> (already merged into clk-next.)  This was needed for some new IDs added
> for the handful of new SoCs we've added this cycle.

Ok, pulled into arm/dt, thanks!

       Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
