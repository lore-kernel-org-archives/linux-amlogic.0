Return-Path: <SRS0=nUoP=3D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A9AC33CA9
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jan 2020 00:03:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6C8A2084D
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jan 2020 00:03:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zh48hy6M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ewwYqdD2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6C8A2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pdw2+3QXhqopTN87mYHXhc8llkCz1RjFWUzGheRVaEs=; b=Zh48hy6MdCfmFl
	KD8O+s05kq3UyUeWoPD76XPVNKI5fhg07d+h58mnW/jjdQX5iedMztmqrRHcpunVXubqRgyGrTwyn
	hpkbqedcPzjPhZADRRqFxRLHOp3Uxryi8NLwBfMggC1i1ZslOdGnAxX/Ya0SQvw228Esdm8TyM31J
	REgt2YDuXrm/1Ev6noXxOjnELTDDR0wCY29no+uJFbi+QV3hAJNKTqoY6sF3pTXQhTMwpN+PVubep
	9z4ud2iOKpbHnABHE21YD1P7W8OA0s2MJ6cnW5e6yXXx34WC6uzhTeGvP4vYDXH0xNKJwr4MC9uD3
	QZiQv87E+jHvq5hVmPNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir9fp-0003lT-GN; Tue, 14 Jan 2020 00:03:09 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir9fm-0003kb-AM
 for linux-amlogic@lists.infradead.org; Tue, 14 Jan 2020 00:03:08 +0000
Received: by mail-oi1-x242.google.com with SMTP id a67so10139181oib.6
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Jan 2020 16:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2aznOnHp2Zo/hw5Zcuf+3mVCfEFYTwoxqWb6Av9vEOM=;
 b=ewwYqdD23x0slMfjpZNHHT+FWzHiQXZF2FEVc7pB8EhRjH0M0eOb7e6t+JYXwAXoGT
 eS2VntXcTIyj52+cFTd0jkgKaaDVZelcqIDGcVPbrzJtx+l2Q3pzMK45A0BUTeF73kOh
 txLsyvBzbaq/HnHSgRN0rahS88/ygZ8jxyVR3fxyFaM3akD3rb1R91cu7hfQVN+uyi6G
 fWHBE6ill+JicO29O25BMeuuMA+aO5ITfoR/xWJwOOWZBUUj/029+563MUP0GHFQBoAi
 HsxfjQO6qL/oP2MCVFHpU4XduoLCpoY4flDPN+Rwzzk4444a3LiY8ZCtk+LEA1xDJGPj
 CrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2aznOnHp2Zo/hw5Zcuf+3mVCfEFYTwoxqWb6Av9vEOM=;
 b=hZf62aLOJw046igaMIkXSeUUazXg1AFNn70rd6QWeZo1H0adpE7jm9lsl2iG6v1m+j
 YieWTTQWORhLc7/ZqDOy0hqgeP9VgkDhxnqsPmULVSkw89tckw7S2zV/ZetQYktQ2mZi
 3v9g2/4Ck0v55SoNPA8zrd2lTjpljcLi3awLtZXMbCPDb8bMdf6/3CuHqO+H31jP7LRi
 5uK0ggxRTtk2Y1tU0rHESpnqhzvyKF90Jy/u6A1p4ZG2CnjDlKoXaKYo8qWODG/EhjCI
 CHgTeh7VQ7B7mDpaH6Ftegr3waVnvT72tnRLP5HUryr8vgMxmcQg6e47Ka/tz/ONyVDc
 M8fw==
X-Gm-Message-State: APjAAAXh90eOQ6w5xuOQT2cGehdGh647jAlOUy3sJAZp482KbW344LSl
 cwWVJwFGvczrh6K4vt4JJ+irr9ipeNay5Hjdev+BQg==
X-Google-Smtp-Source: APXvYqxWm95M5K4Wdt1quqq2DV8xgNguUf8Xkb/Tv7fhBUkgPfNkprzE/QmvxrZGOOaxvDOsbty8PilEukNP5bfXWOk=
X-Received: by 2002:aca:edc5:: with SMTP id l188mr13875397oih.55.1578960185205; 
 Mon, 13 Jan 2020 16:03:05 -0800 (PST)
MIME-Version: 1.0
References: <7hwo9udi7m.fsf@baylibre.com>
In-Reply-To: <7hwo9udi7m.fsf@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
Date: Mon, 13 Jan 2020 16:00:29 -0800
Message-ID: <CAOi56cWPvOhnWqtLJXQimRLpMrt_09oNz4HTmqr6-uZ0Bz+A9A@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: Amlogic updates for v5.5
To: SoC Team <soc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_160306_362999_5E528C67 
X-CRM114-Status: GOOD (  14.94  )
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
Cc: linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jan 13, 2020 at 3:55 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Hi Arnd, Olof,
>
> Here's a round of 32-bit DT updates for Amlogic SoCs for v5.5.

Ugh, this should be v5.6, and the subject is wrong too.  But the rest
of the pull request below, including the tag, is correct.  Let me know
if you prefer a re-spin.

> Only thing of note is a merge of a clock dependency branch for some new
> clock IDs.
>
> Kevin
>
>
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:
>
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt
>
> for you to fetch changes up to c3dd3315ab58b2cfa1916df55b0d0f9fbd94266f:
>
>   ARM: dts: meson8b: use the actual frequency for the GPU's 364MHz OPP (2020-01-08 11:00:58 -0800)
>
> ----------------------------------------------------------------
> ARM: dts: Amlogic updates for v5.6
> - add DDR clock controller
> - GPU OPP updates
>
> ----------------------------------------------------------------
> Kevin Hilman (1):
>       Merge tag 'clk-meson-dt-v5.6-1' of https://github.com/BayLibre/clk-meson into v5.6/dt
>
> Martin Blumenstingl (8):
>       dt-bindings: clock: add the Amlogic Meson8 DDR clock controller binding
>       dt-bindings: clock: meson8b: add the clock inputs
>       ARM: dts: meson: provide the XTAL clock using a fixed-clock
>       ARM: dts: meson8: add the DDR clock controller
>       ARM: dts: meson8b: add the DDR clock controller
>       ARM: dts: meson8b: fix the clock controller compatible string
>       ARM: dts: meson8: use the actual frequency for the GPU's 182.1MHz OPP
>       ARM: dts: meson8b: use the actual frequency for the GPU's 364MHz OPP
>
>  .../bindings/clock/amlogic,meson8-ddr-clkc.yaml        | 50 +++++++++++++++++++++++
>  .../devicetree/bindings/clock/amlogic,meson8b-clkc.txt |  5 +++
>  arch/arm/boot/dts/meson.dtsi                           |  7 ++++
>  arch/arm/boot/dts/meson6.dtsi                          |  7 ----
>  arch/arm/boot/dts/meson8.dtsi                          | 28 +++++++++----
>  arch/arm/boot/dts/meson8b-ec100.dts                    |  2 +-
>  arch/arm/boot/dts/meson8b-mxq.dts                      |  2 +-
>  arch/arm/boot/dts/meson8b-odroidc1.dts                 |  2 +-
>  arch/arm/boot/dts/meson8b.dtsi                         | 30 +++++++++-----
>  include/dt-bindings/clock/meson8-ddr-clkc.h            |  4 ++
>  10 files changed, 108 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/meson8-ddr-clkc.h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
