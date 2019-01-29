Return-Path: <SRS0=Lc8Q=QF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A13C282C7
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jan 2019 06:38:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9E872147A
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jan 2019 06:38:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MFeHcFoV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rnSvNERW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9E872147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C97S65J7p8LQPvUKx7lS06a9h0Qn5N4i9KSdLiJ3FQ0=; b=MFeHcFoVGJfu8o
	A59CZgiprwTCtUzwQV7lKw6K/pUE7dYWl49w0NisjObgu2j5QolPfatXRqDXjvVcV5rh0G/7I2Hap
	+yu7zglt1xEaIwhhB+8KBD7knsVLo4WKPuy8OI2vQJCjAU8t7RY4R6lCuj1IHQG6rrAoNkT1g/35w
	BXgFDBTnzFrxol/xh966CrZmiv4C8cqIUinr2LDgji97I7oh37YZvs1GH3kVDU2Ewc3W1nzYWFwy+
	K18fy1POI7lft7V14/YgUSV7p4d+M9VULLKbgyXgc5gUXHgc7LeMbQmqJn8lTizsmyfKlEWdaw1CD
	oEL5RkRNShzpYWZrs+Cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goN2c-00075O-Df; Tue, 29 Jan 2019 06:38:38 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goN2Z-00074p-Os; Tue, 29 Jan 2019 06:38:37 +0000
Received: by mail-oi1-x242.google.com with SMTP id j21so15265661oii.8;
 Mon, 28 Jan 2019 22:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xjQM6D9wzIaUbewivDzeto9c69tAVvhL4kzvBGw2sEM=;
 b=rnSvNERWIEAGHepu/pP2Bf3jzvuxJfK8SpNzXVK04O2CsFlEikP1ufUYkm9jKeXAID
 o1fCsOq7RUqNknG6OIB4B/1wYWkPHE9FrR+cMZ7YJrn9LXHgp+3jr/nqyKkn8AXqm9U0
 vLXDDe1ZYpQpUcSCtRNUasreZMDN8C0HYr2K5aXGj5A3I8rqrT6T3EhjayvoCmdm3vYN
 3DwHl6UV6J95uBKZhJTlGJGNs3I2zI2AX22VrHKVcZa+gMAi5WVsIIMLZBKKrxBpkB5c
 olv6Wi7IrA7UDhX/ni8wChM73DGd6vEpjumuygE6w5gM0xbxZF88acpKJ0v5dTbQfJyN
 3A/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xjQM6D9wzIaUbewivDzeto9c69tAVvhL4kzvBGw2sEM=;
 b=UXNOFK0CwRU+Bf/cpKRDa5K+tZVFKMjygbfG+7HPEh+YuBRuisHF5CGjlDE34p4DAq
 W1Yx4KWRUeiDlkTxUi4KWogqWPlZRaneScsX8p8hCszE+e51yFWHLyfPlVRVQ3dG/EyX
 E3X2u5R1CNLAPK6rAxMKuHaBCU8Bc+sZAipWuwCNbjEt7z3nBWRMWXN7NPhA2qHC38qb
 NFgo83OMn0wkKbPykANP5nwEz9iem1oByasqFZi0M3NkqrDpMpdWq3MkXxWAzMf+mulp
 AmTZh9DyyW+hoOnQ+VNBPSntlMcSNxA0guYRmzjw7BFOGDiD5UFAv0JN0RykRURjM9IF
 nfgQ==
X-Gm-Message-State: AHQUAuY4BKzS9Z2HkuNXXXm04Mgm3d+SKTa6ZkoVuZ01zW+vt7i72XSa
 lutDAPBF9wjFJyJLnGMnq2TEp/hOX4S+LZR+r8A=
X-Google-Smtp-Source: AHgI3Ia4VXHxV5c6f1KOLSnBjyn0qXk8eTrDXKcBk7fOko1fVgrgi4lhwIxNqpplhgMufinLVBxVaPrY29WRX48P5vw=
X-Received: by 2002:aca:39c6:: with SMTP id g189mr8553359oia.201.1548743914059; 
 Mon, 28 Jan 2019 22:38:34 -0800 (PST)
MIME-Version: 1.0
References: <7hh8dsqyv8.fsf@baylibre.com>
In-Reply-To: <7hh8dsqyv8.fsf@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 29 Jan 2019 12:08:22 +0530
Message-ID: <CANAwSgQzXg0MW4bH=NpbxmZ6a0bf7rr0F4_gP+bDUMurJsA9bQ@mail.gmail.com>
Subject: Re: [GIT PULL] Amlogic fixes for v5.0-rc, round 2
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_223835_861378_76AEFE21 
X-CRM114-Status: GOOD (  15.73  )
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
Cc: linux-amlogic@lists.infradead.org, arm@kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On Tue, 29 Jan 2019 at 02:33, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Olof, Arnd,
>
> Below is round 2 of Amlogic fixes for v5.0-rc, based on top of the first
> round.
>
> Kevin
>
>
> The following changes since commit 19a220dd1e8a1b1d8e5e2f8f4a25313c4b02d527:
>
>   arm64: defconfig: enable modules for amlogic s400 sound card (2019-01-08 15:27:50 -0800)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes-2
>
> for you to fetch changes up to c90c44d8aaf5895320da1621b0a502ed5528e437:
>
>   ARM64: dts: meson-gxbb-odroidc2: Fix usb phy reset warning (2019-01-17 14:40:45 -0800)
>
> ----------------------------------------------------------------
> Amlogic fixes for v5.0-rc, round 2
> - several fixups for the GPIO cd-inverted change
> - IRQ trigger fixes for MAC IRQ
> - USB PHY reset/power fixes
>
> ----------------------------------------------------------------
> Anand Moon (2):
>       ARM64: dts: meson-gxbb-odroidc2: Fix usb phy regulator power failed warning
>       ARM64: dts: meson-gxbb-odroidc2: Fix usb phy reset warning
>

Sorry I would like to resend my patch again, just waiting for feedback
on below patch.

[0] https://www.spinics.net/lists/arm-kernel/msg701859.html

I will resend send these patches.,
so please drop above patches for now.
Sorry for the trouble.

Best Regards
-Anand

> Carlo Caione (1):
>       arm: dts: meson: Fix IRQ trigger type for macirq
>
> Loys Ollivier (1):
>       arm64: dts: meson: Fix mmc cd-gpios polarity
>
> Martin Blumenstingl (3):
>       ARM: dts: meson8b: odroidc1: mark the SD card detection GPIO active-low
>       ARM: dts: meson8b: ec100: mark the SD card detection GPIO active-low
>       ARM: dts: meson8m2: mxiii-plus: mark the SD card detection GPIO active-low
>
>  arch/arm/boot/dts/meson.dtsi                                   |  2 +-
>  arch/arm/boot/dts/meson8b-ec100.dts                            |  3 +--
>  arch/arm/boot/dts/meson8b-odroidc1.dts                         |  4 +---
>  arch/arm/boot/dts/meson8m2-mxiii-plus.dts                      |  3 +--
>  arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi            |  3 +--
>  arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts           |  3 +--
>  arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts         |  3 +--
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts            | 13 +++++++++++--
>  arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi               |  3 +--
>  arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi           |  3 +--
>  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi              |  3 +--
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts |  3 +--
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts   |  3 +--
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts    |  3 +--
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi          |  3 +--
>  arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts          |  3 +--
>  arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts            |  3 +--
>  arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts             |  3 +--
>  18 files changed, 28 insertions(+), 36 deletions(-)
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
