Return-Path: <SRS0=Cb+X=UN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFBFC31E50
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2019 23:26:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 241B0217D6
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2019 23:26:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VhkCHQI7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="I6dxrrNm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 241B0217D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WP9LbnKAdE0cIeAlrjEe0yrKrMYlW17DzuhauLhM6jo=; b=VhkCHQI71ZxP7F
	ql83QWdsrsIgAjosCbSVg1QUQPpxosQCdl2WKbEu+642YZm0yUzLENsOQtRPCoNvN0s9OF6kgztqG
	MHXmpgB3xceiB5NruZ9jSCAWZgKJCGFzYELYqhPDFPDjlrXEWIsPYmksDJPojW/4uO+fMeDSGyx9A
	GuEFJGbz6Z1MfJbbzvV+K3xDnLxnAFf05BnvDgTh5zvt77xJf/Qo861bOlPRXHrVi/nkk1raIWZ3S
	hOqBh0lM9r86GntwrNQ8orOopyNUduRVjXQC/dxynyQV5EUa0GTadYH56KiEUG8xmC0UNiiM+Heeg
	P92GNG7w496hUVcdKA2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbvaT-0001Ru-Kq; Fri, 14 Jun 2019 23:26:25 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbvaK-0001HG-Ne
 for linux-amlogic@lists.infradead.org; Fri, 14 Jun 2019 23:26:18 +0000
Received: by mail-pg1-x541.google.com with SMTP id f21so2359356pgi.3
 for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2019 16:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=X0PaE8UgoSXCd5aH+z1B3Qe35NkfrQQNqk1NT+8oFYY=;
 b=I6dxrrNm0Se40AINnZKnyGQJ06/YQci/tt03JWr+PGNRuMl/6+Hov9DrEm575HWHSk
 V9VysQXgsdArAItkM+P5p30FxsyGS/OvIHA3GVfrNLcMkTCzNth27BnGvGSecv/UYYKe
 m9mar59Z3WQJDD07KEadz1JVDhXTqioVAc5hMvLtwLL+o8a+bpXrIp9mX6HH7q23UK5x
 vmI6E85am3K1i3hm3pxlQDrXPuhAieTErM2TOkN9pgigqOT+yT9orTFLscdibRzdfVZg
 B5ebeZydNzHStUkxJ6nfO9mwZstU/6PqUqqlSIYlJ+KqWtdXZn9hRwFlSVyKEOUOh2tJ
 grLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=X0PaE8UgoSXCd5aH+z1B3Qe35NkfrQQNqk1NT+8oFYY=;
 b=R8gOX9tv3eBgftdq5Fg98Ga9TadYYY56dSrhVu9pKF2TAl3vkh9I8DEYHZiIFZ7ybt
 UWXjIkGSxs0e4ZzOwH/LbMOGQj9QqUn2VvRvIfY3FBM+a+Y2iLPMqi9D2vdd64t1/nH3
 zNfYmQLBdAFIDtppE2QqL8hnKgX05YI+ZmuAdTrG6cD4nyZZCNikBMJM+zCTj+xyeAZl
 YYZubGYqmBELqxT9KwVFwhnCP2bFRdZe6xrqrIVl8Fn1dGCZFLllPw2fnFA2rXurZ/U8
 gtcLfII/lR2mU9+Ac6z9nwLn7UUXVbxpWrH+J3BY68Gfr4AOO6awQBP8T06OFB+ObB+Y
 flGA==
X-Gm-Message-State: APjAAAXqvx0rqLHY/n5+p9fEr0MKNfSuBOoOnXo6iAXSDJR/g/76Lbt3
 5tvTdFjgybtmuYNrSErMTsfaVg==
X-Google-Smtp-Source: APXvYqzPsMayZPDa651TozhfBKS4Z0Ea6ktolXjYCwX53TQIkUwRp3PKK3Daaxs62z9Bgmauuz/pVA==
X-Received: by 2002:a17:90a:9503:: with SMTP id
 t3mr13459977pjo.47.1560554773640; 
 Fri, 14 Jun 2019 16:26:13 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 e184sm7032630pfa.169.2019.06.14.16.26.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 14 Jun 2019 16:26:12 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Subject: Re: [PATCH] arm64: dts: meson-g12b-odroid-n2: add sound card
In-Reply-To: <20190611143120.25074-1-narmstrong@baylibre.com>
References: <20190611143120.25074-1-narmstrong@baylibre.com>
Date: Fri, 14 Jun 2019 16:26:12 -0700
Message-ID: <7h8su3eokr.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190614_162616_796131_D62325F8 
X-CRM114-Status: UNSURE (   7.90  )
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

> Enable the sound card on the Hardkernel Odroid-N2, enabling HDMI output
> using the TDM interface B, being aligned on other boards sound cards.
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
