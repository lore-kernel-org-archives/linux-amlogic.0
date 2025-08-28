Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E37CA0EED
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Aug 2025 23:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nd0qZTABUjJIJCZtB3oxUbq1SKo2W2AlH2ksn6Owj6A=; b=EyHWPLlFBw+fz0
	joy3jPWd8G0sk+M51i6PuMDflrKJhUFJUfiHrDt+yDaKXAyqhrKEsDcvQkS07GmNiHZIeNH9FBBrZ
	5FWGJ5OrRJ4gEaKQkH4KdjnIBFfvSIMX488xlNILCUastXOLkbPIWFjjxKhes8zZMufb/x6U/jWO3
	jB6OWsl6vDgwsxym4TLY3K5UAYSp265dl9qTzqMyt9iViW+JnNhjp3raN/6i8MBG6nX1fwWl7OW7O
	zjievVC4WDLMXrN2NFJARk2ksWNnxHzSCGikKhY+EkQdxjAMWHTHDMZlGNqMGOB/oUQzjckqK5Jg6
	lffRBHh5+kg3/HI5iVvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urm1E-00000003fmO-1iYg;
	Thu, 28 Aug 2025 23:27:00 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjpP-00000003ISW-05gI
	for linux-amlogic@lists.infradead.org;
	Thu, 28 Aug 2025 21:06:40 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55f48cb7db9so1361374e87.3
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Aug 2025 14:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756415197; x=1757019997; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7m+Z48htqbSeqaszf53BBB8XMcsMLgtn18U/+YXKB3U=;
        b=B7FVS1gsnP2lvG1PplJC/Su5CeEN++J4CieOA0zbAm/H02djt3h8jUv5NZ0ANbmqAY
         bdg8SNp1Z02p4tu4YAGvCd/mHxArtW0437GHPEphFqFE9VDUO5thFtyjhDydWrwP9CIv
         FoUX3+5mPIAU2ALhSL3ufKmz1imT+XAJf6B0hp6zHIIDZGopqs4UhGs36ogEUlIjImRe
         ilb0EhH52FPprVms9XVT++rl3EnsH5TCgTO9mwmmU5/2/0H6hux1xQwv+3NaUgiEge1c
         f24E8bzMvrbA51LtRhcx/SZoc/IiigSmf1c+d80ProBawtMPjy+wL9sQ/cbNmQbPYiHn
         XNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756415197; x=1757019997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7m+Z48htqbSeqaszf53BBB8XMcsMLgtn18U/+YXKB3U=;
        b=P7cRSj9xK0vNb/Si+qF73dyhXGX6M2W/r9iRb3Y3n2AgCxDiU/nDNk1hiWFSRw71SV
         b/bMGcXAGhiYsNxMg40nJQZi5wyD1z/Fen4xJBd+o2dt02GgBgBhPhGzGutUBtJpAAar
         BBHwC5RrSSQFQi8zxQzg+XQ+U8BcPqlyL7Ku9wZLtzEfiTrrhURTzbuItWPD6opZvefY
         FZQz1CURm9AmcC5vt201yTxUGU/ol8w/weh+t9vuTGYzMvMiVDNJqs5XBs1b0/Cu5yw7
         +mVaHa/s/GxDWWEG++RD1bZKqZ7xbQYM9OziOgdq/lxo97JyRpBvkl38Q0tg26bJE965
         djag==
X-Forwarded-Encrypted: i=1; AJvYcCXNxpUMK5VUOAQ6gqPaAZEO7YirGYKwfsbDVEj/BXLkpmxsjtMiMbMek/eYdfQ4jZhARG3dKjJpLgAh95SP@lists.infradead.org
X-Gm-Message-State: AOJu0YzVH03/W/Q2x/QtajEG1+M5nJqDsVm2Hvb7bzS+JtVPHVFXgAll
	nCFl4BWdk/gi7gaILJZdpZcrXVec9WSdB6sHgy2URB9lzS/+JDz6OQASHshOOuU7zcbtSIlVsT1
	Tyo4UTWy8mSynVktQXI1QoV0QmssT3wvMBZaOVVfRl1bAEK+aJmPW
X-Gm-Gg: ASbGnctPdaoWlCkz06pgIkuQMF3hHucilomKikOcb6UMTHDqTe4yIoNOkMXCqHs08B9
	/cZQziRQN/erUKsafLRe7NpSWe4akZenP7Qxlf3cIDFzoF5IgWUzhPlGmoxWWzD6LZ7f10Nr+Qm
	BpJE5Im5DMNcMNHGn0e0tsy7qIr//Ke8WHO9C/b+z+Fu5f9VW14mPFaf0iznK6A3CxBDc/E4ElE
	m5HB1vSWmHDFiz0iA==
X-Google-Smtp-Source: AGHT+IE8AFltVgez4j91MqcXLZUWY1SjsHiyvDbOchLsj0qPF+cSQKWQwUdlDcjOa51JtKhpYUq7h1LMip4AqNUm6Pk=
X-Received: by 2002:a05:6512:1356:b0:55f:3b94:2119 with SMTP id
 2adb3069b0e04-55f5f08b2aemr1135534e87.45.1756415197186; Thu, 28 Aug 2025
 14:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250821233335.1707559-1-da@libre.computer>
In-Reply-To: <20250821233335.1707559-1-da@libre.computer>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 23:06:25 +0200
X-Gm-Features: Ac12FXxq8e0j1LLbbJOtWrnp5TZSIUBHLi0lcAdK8TiCnwMxmLVQkeLVBf3QIC8
Message-ID: <CACRpkdYMdF43s_hcAvzHJ+wmRGyLoHtiTaG03ULoL24WwdQCMg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson-gxl: add missing i2c_d pinmux
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_140639_066496_13093C5F 
X-CRM114-Status: UNSURE (   7.25  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBBdWcgMjIsIDIwMjUgYXQgMTozM+KAr0FNIERhIFh1ZSA8ZGFAbGlicmUuY29tcHV0
ZXI+IHdyb3RlOgoKPiBBbWxvZ2ljIEdYTCBoYXMgNCBJMkMgYXR0YWNoZWQgdG8gZ3Bpby1wZXJp
cGhzLiBJMkNfRCBpcyBvbiBHUElPWF8xMC8xMS4KPgo+IEFkZCB0aGUgcmVsZXZhbnQgZnVuYyAz
IHBpbm11eCBwZXIgdGhlIGRhdGFzaGVldCBmb3IgUzgwNVgvUzkwNVgvUzkwNUQuCj4KPiBGaXhl
czogMGYxNWY1MDBmZjJjICgicGluY3RybDogbWVzb246IEFkZCBHWEwgcGluY3RybCBkZWZpbml0
aW9ucyIpCj4gU2lnbmVkLW9mZi1ieTogRGEgWHVlIDxkYUBsaWJyZS5jb21wdXRlcj4KClBhdGNo
IGFwcGxpZWQuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
