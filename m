Return-Path: <SRS0=nfxB=E4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D4DC5519F
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Nov 2020 22:02:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A784C20757
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Nov 2020 22:02:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0AOUJZB4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="R1D5l7Q/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A784C20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bhtdr4YRcFT+QVZ8eTLlH2hHp8SvLoqjPnJh/hwCSoc=; b=0AOUJZB4WH9AvRxaBYr9Fi/Mz
	UH8OLQYi3OceJCVR7SFC/HXQ0LKLwmwLPaHMJtoaOUeGmJDgER+SOfciWr+1F5UWwUPtbOA5rSTwJ
	mfJuA4GePuptFwDacqUUcye/MWJ6St6qHAJojWId1kQX8bvAleNu1G+bCvqzwUXY6uS1ZRk/PBaf/
	+CiyNTQSFeBYTo7azgBYHcrPDXkwiFEId2b4r4zxlrRN0haq50TirqJNYj7th4uzU6cJfRYMqpPKn
	MlbBMmbg7/7lTLtedHAdOYPe099LFojHwTxqbsE8xVMyF/nw+VAnKj3XSeKViCc+/9SR1F4kEuF25
	VR9HlutoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgxRE-0008CC-DQ; Sun, 22 Nov 2020 22:02:28 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgxRC-0008Bo-As; Sun, 22 Nov 2020 22:02:27 +0000
Received: by mail-ej1-x643.google.com with SMTP id o9so20675495ejg.1;
 Sun, 22 Nov 2020 14:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P1G9n/p+A9jTECzi1tQiMVIoBBKxdrMCZ8k6vKAnDLc=;
 b=R1D5l7Q/2PikUyIgixV42SL6CoifIonkLJ0MpSO+TNgLUWhgGssInEm/SZlLtWg4Gp
 PwnGMfK+a3FNIXxzCU5Y5c+3GRUdfFN13t1oqEsSkndczby8beXcHyso/2RtK+6dKFpF
 F4q2e0zWVW+/X6vd+T9mJLcdF8+6WwVP4GgFsaY27Nel5zV0iWkROTf+zVYTajMFFP4j
 7INiyG4+KT/WnsT7Zzm4sonGu9NpeVUv+suwNYAogrzyDvNFM4c8HofbiSlXrL7akWM4
 1YjvT5u/rTiNqxcqf+I3Y7nEm1QenXgcPYkoSLwbUZ+TJ64xim27M3MbmbUuKDDQ+ZMe
 BV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P1G9n/p+A9jTECzi1tQiMVIoBBKxdrMCZ8k6vKAnDLc=;
 b=B8JZoXHMNwvFiw9+4wnTZu5fmNdSmewowyG3mIbC6wX5H4z4xXKOFNY8+r9Q2LnsnT
 253OpSexlB3B2Cp/sb7XWsrOMwCwYrmCOHfsDruDjx9DnB0up3AzEyMSMD9jKB4RAuwN
 sYVV79dPD+TRayglXAJuJCkeTIs/kzWre8htnqnp7fe/ndtM94HafSiW26XglFOamsFd
 U3cooKbho9likBOw18lcmXLcsH7DBRPA90pa0KHb9gQqy+V8EaV8KC9csUhCMcGBRuzR
 UBjrMonGl4iFjzSw+N21lDElR2aXn/MIu4hIqAAhgbxUugOEDC7Kkst/gVozaEbXbgtj
 MC5g==
X-Gm-Message-State: AOAM532Aug5/MUETsORrniq7ciNiPMCPmw+hp4rA+pjHvQEV371gHxw8
 8mu71TdfwsqLn5KKVpamglMhNfiJcPCY9K9IZHOqvSVu+kw=
X-Google-Smtp-Source: ABdhPJzJ6xNhMXuBa4xagGSXQD+1DW3j8R+R5BNLivTDQCFs8zZawLqQuLrW7tYu6a9nH7LqqffarOmGi1BCknM17ks=
X-Received: by 2002:a17:906:38db:: with SMTP id
 r27mr42615819ejd.328.1606082545161; 
 Sun, 22 Nov 2020 14:02:25 -0800 (PST)
MIME-Version: 1.0
References: <20201120153229.3920123-1-narmstrong@baylibre.com>
 <20201120153229.3920123-3-narmstrong@baylibre.com>
In-Reply-To: <20201120153229.3920123-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 22 Nov 2020 23:02:14 +0100
Message-ID: <CAFBinCDf7xJivLXWmqN=-utdKeDnGnQK2dC-zGU4dwZC=zc+Cw@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: meson-axg-s400: enable USB OTG
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_170226_397555_CE148A6E 
X-CRM114-Status: UNSURE (   7.80  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Fri, Nov 20, 2020 at 4:33 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This enables USB OTG on the S400 board.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
this is already upstream [0]: 19f6a6b79880c97bf910c3c72725eb70


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f450d2c219f6a6b79880c97bf910c3c72725eb70

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
