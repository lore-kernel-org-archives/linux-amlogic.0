Return-Path: <SRS0=Cb+X=UN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9311C31E50
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2019 23:26:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FBF5217D6
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2019 23:26:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I1SuzMIn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZeLyUTv0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FBF5217D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cRIYHUYW7OGO+bSIbyeFHUN+zOVk8r6QwrYJRaBf4RQ=; b=I1SuzMInG197iJ
	wp/ydGb72u1A4Ci7KzRKhlVbOpczSAMfaBZFX4yXlEbG5Az5fYmJxYIDPvvp1TSWc2f2rkn96mFpZ
	nxGHFBAdbhvAinS74WbHulCr5N6ARqkjhJoWfVj47hSoqf1PFNYW/BXfs7djm76YwRTEh9HnmQSHC
	xKBd5QOAvhJdGz9NMdjBc7jMy4r/pNR5NHaU6fiZOdfXNRHN/xuZ5Qmszv1/leOfWUHUnYLHeBCJL
	1CeooAsJlpsVu+HpimdLFdDZBzU8Oe8doU8YcGUhbZ5VdcqPrdhHYae9jme/9sBd5F0PyyVFN/iPm
	Z3QwweRQz5a3FOJ/J4yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbvaq-0001ko-RP; Fri, 14 Jun 2019 23:26:49 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbvaW-0001TJ-Nb
 for linux-amlogic@lists.infradead.org; Fri, 14 Jun 2019 23:26:30 +0000
Received: by mail-pl1-x642.google.com with SMTP id s24so1590539plr.8
 for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2019 16:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=txevGFdZuzBEDJGiWgJSEl3KtJMa2A1EwegQ2ClWo7Q=;
 b=ZeLyUTv0uYJ5hEPB7IEAFeiDjo7xDzKAvcGAl5pLbVYX7Le3G2x6V+kc+HKai82pKb
 KG2ze4kSons5LiQdoZW568SCESgX2Fa81ZPT4f90AkBercg6UABHZhjMl/NLPAU8C71a
 FLlPUcFVktoDfDyUEPwzlVS00DTHdHPQpD07mE7Sv8SumaVbnGe0JYvyJy0YA+9D/b9M
 uCOIILN48ezUlW5gQTzCMZh0oWZ0vMryGFBNotSmHJUDRT4CTmAb8ccpXuERhvH/NEY+
 RvxS9N2hWMHaxZkh7secmk9YrRNLKTij1eT4Mx5y3kDiuyQwPMOCvaXfbEtJ+lhYSse2
 UWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=txevGFdZuzBEDJGiWgJSEl3KtJMa2A1EwegQ2ClWo7Q=;
 b=JWZaGeGQ9Y97+RyyO3oBB+C8YUPzQSKwsAF0ZGoDODSNAixT6EjrPb3owfgZ+hBdfG
 ieXRrW7b7F8k3ZDmD39bzEZsRzsjB41lchzDOyUkPD/yd9jROc5gbOsNXU9lu0Pihwqe
 QtEq1yT5UsbFxXtlOVgNoG7eldpaEWo0Cd7GTNC5WbCCNreMKb0ErQyKRPXl3h3Bj/O2
 kSsZQTzBraCs2dwHn71OMTaOavPjKvxxOe44EieBIy0WJUdy/cTRd6JoQsczogE0OU6x
 IhhT5D52yQpqCPW/PcLAeRmJCAV7pYyufRM3lfG8qWr2FTFagrakWl72Y8sOw97rtX1x
 whFA==
X-Gm-Message-State: APjAAAV0bTnvIgbpzNlImaBrNLGrZzj39SIB3j384gSsCdtXH7idYi95
 FBJvGHZeGAc49PMNBtUFTUWW+FxUgqg=
X-Google-Smtp-Source: APXvYqzm5PDiqQqzsIvfn/LmZzXIR8BpV5+IdKHziBqsEa3r1EdH/tZs9utNM8iLfpFvrT8HIxiL1w==
X-Received: by 2002:a17:902:760a:: with SMTP id
 k10mr75503097pll.83.1560554786407; 
 Fri, 14 Jun 2019 16:26:26 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id a3sm4508235pje.3.2019.06.14.16.26.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 14 Jun 2019 16:26:25 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Subject: Re: [PATCH] arm64: dts: meson-g12a-x96-max: add sound card
In-Reply-To: <20190611150101.30413-1-narmstrong@baylibre.com>
References: <20190611150101.30413-1-narmstrong@baylibre.com>
Date: Fri, 14 Jun 2019 16:26:24 -0700
Message-ID: <7h5zp7eokf.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190614_162628_796461_2F317881 
X-CRM114-Status: UNSURE (   8.92  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Enable the sound card on the X96 Max, enabling HDMI output using the
> TDM interface B, being aligned on other boards sound cards.
> SPDI/F support is also enabled to the physical toslink port and to HDMI.
>
> The internal DAC connected to the audio jack will be added later on, when
> driver support is added.
>
> Tested by running:
> tinymix set "FRDDR_A SRC 1 EN Switch" 1
> tinymix set "FRDDR_A SINK 1 SEL" "OUT 1"
> tinymix set "FRDDR_B SRC 1 EN Switch" 1
> tinymix set "FRDDR_B SINK 1 SEL" "OUT 1"
> tinymix set "FRDDR_C SRC 1 EN Switch" 1
> tinymix set "FRDDR_C SINK 1 SEL" "OUT 1"
> tinymix set "TOHDMITX I2S SRC" "I2S B"
> tinymix set "TOHDMITX Switch" 1
>
> then:
> tinymix set "TDMOUT_B SRC SEL" "IN 0"
> speaker-test -Dhw:0,0 -c2
>
> then:
> tinymix set "TDMOUT_B SRC SEL" "IN 1"
> speaker-test -Dhw:0,1 -c2
>
> then:
> tinymix set "TDMOUT_B SRC SEL" "IN 2"
> speaker-test -Dhw:0,2 -c2
>
> testing HDMI audio output from the all 3 ASoC playback interfaces.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for v5.3,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
