Return-Path: <SRS0=5vFS=PY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518DDC43387
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 12:28:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F34B20578
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 12:28:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iTZXwe1g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FQaEcRba"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F34B20578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tGe4+aaf4UDDrzgYSxcUDSOwNyLQVK7CY4VKZJLMZA=; b=iTZXwe1g0gTRXm
	HUfi3krYCRhJabjHNzE4/C/lkMndlJcZMiA6oTNWyAVdpwrs03jpk+huu0GtibmmNZiZtsnsidot4
	e6CZrISx5X4CXp/3PjTPM6OAUaWRjcBCPnMk/KSm0B0m2MNrDXvAdXYD/gQ+MZSeM8rZBeyPX0NFY
	V9elX/WNPS9S9mz+eTlKBucuV6zoAl+/TIfXCFzIOFJIJvMCMlcbYzKN0zAiAKMmxTi6X1iZU5Byf
	h7mKfLTtbpGfA8twv/kAU4Yt5l9GG2OlrauuanvUzYwE0BBzzel9xL0xL8j8CJCK0xnNBlw5s43XY
	f18DKu/QzvcbsER3zfTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjkIo-0002Gl-MB; Wed, 16 Jan 2019 12:28:14 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjkIb-000256-1I
 for linux-amlogic@lists.infradead.org; Wed, 16 Jan 2019 12:28:03 +0000
Received: by mail-wr1-x443.google.com with SMTP id j2so6754414wrw.1
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Jan 2019 04:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r4NfPscd33YfCts+OAvk6v5W92clce1d3rs145yFmNw=;
 b=FQaEcRbahfG+TnXDcCkYUtCScD9QwtNF9xwSw1P8coMNwd6FH+PuCXhCcIc0aXJx24
 uTjtFuv9FqG4HgeoFuz2xOvcuJTxQL3UdHM2iMQIXLk9wbV9EY6TBwSqhUvlbkjXFFrv
 D3UsdVP3AnAsYgggt9xVS9k5ZJgqayR9gFsuewkg3DTfsdmzhzdi9GYrxjZeb5+SiN6B
 khC2FHjYiqpwJJWf7BYXtBLF/gYYFnHpXKK69hfqBXPusU6+4NWeyH59PT2hdfpActnA
 iMb0caql2wyoCb+MwNLAV9JJ0nOuj+U/RLxCVwppeMDKT4XvHUwk6A48gQT0hyjARZug
 wNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r4NfPscd33YfCts+OAvk6v5W92clce1d3rs145yFmNw=;
 b=SbQglPWYrQbiWkWrCK6heAssGEf777bTzZHIcfl/u8qigFalZsUvm/CiDsmsYJBRqG
 yfZzByQk1vm1umB7fhHmYvZ7gFTZx8agDFODW3A+PiKSckdSTHGoJth49SyVzqApGucw
 20mphqkvdWOKVOKVvqJhWKGjst7C2HOIr2ERgExE+VVDpH6sZKo5hznbz+NmjGYvTyES
 yYYq5GvAZ9UIMSt9h7zSCxqrOIU+KbFIrJxhMwYZj6SApOY5OWY89zz8cnq7bjjkVTeL
 PowtLruK4L1S+BJC4jcEdCuvLtyv6k2AlS3+QrB42LIJSnOl4gnCYSoheGIT9G4/vzgY
 iAbg==
X-Gm-Message-State: AJcUukea/uNrvIYoWAbWdePTvq8Yg5grmY9fZBSY1Ajc6Gj2GDuU8yKR
 YWruHao1Kuj0xPxmQMgoS2VviERRcldRUfF5i2Syig==
X-Google-Smtp-Source: ALg8bN55aGnn/rCggprsVOZmW4BpW+w4PPoodQ3bjNNI9imPwrCf+gPaTwU3JYDgBw7x0VRpLcXriGgPneKFN65/qwE=
X-Received: by 2002:adf:a58a:: with SMTP id g10mr7297402wrc.3.1547641678842;
 Wed, 16 Jan 2019 04:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20190107095307.15233-1-mjourdan@baylibre.com>
 <20190107095307.15233-2-mjourdan@baylibre.com>
 <20190111222509.GA14462@bogus>
In-Reply-To: <20190111222509.GA14462@bogus>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Wed, 16 Jan 2019 13:27:48 +0100
Message-ID: <CAMO6nazpZmr7sNNc4HL_f7Sovv3xAfDmOAc=_NTyFFH7F2y__Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: meson: add specific simplefb bindings
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_042801_188530_FF67F273 
X-CRM114-Status: UNSURE (   9.19  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Jan 11, 2019 at 11:25 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jan 07, 2019 at 10:53:06AM +0100, Maxime Jourdan wrote:
> > Similar to simple-framebuffer-sunxi, we support different display pipelines
> > that the firmware is free to choose from.
> >
> > This documents the "amlogic,simple-framebuffer" compatible and the
> > "amlogic,pipeline" extension.
> >
> > Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> > ---
> >  .../display/simple-framebuffer-meson.txt      | 33 +++++++++++++++++++
>
> Use the compatible string for the file name:
> amlogic,simple-framebuffer.txt
>
> With that,
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks for the review, will send a v3.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
