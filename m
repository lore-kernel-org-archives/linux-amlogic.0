Return-Path: <SRS0=Y0fp=UI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE03C28EBD
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 21:29:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4268206BB
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 21:29:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FrCRUM0v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SOfnaOis"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4268206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Is4H7QU6Ag9A7lci0DV6mJblnGDaz69XTXh/uGr/Cng=; b=FrCRUM0vOaMHIG
	Sz03XAcaXHXj7uTa5hj6zUfipBiqzROEvMhLrYRI5j5l5Bj5Iw1PFOjO21MXTlwSdf3DXc+qXTmhA
	Yj9NwSwcnGC1HHDNOCahBEVw8Wv0vSYG2jbS9MFfhMiN7d9cqDxkApkRrFu7QVj28G5VEkBLTVMiD
	YoF01cQ3LXjCIaLoNxwPkXGgfoHGj3yCF9QmFhtQyiEEEp2rv5OBE2vSLbn6dP955cS29j+W71A4q
	3+Xo9AbA/It4QGzaqfUnCG105/6vKWApKzfbNDoRiz2qkQDaBRXAbJtXaJAOHhqtxti7ROGjAb2Y5
	u7Q9BAj3I1j5cuGNEITg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ha5NQ-0007XX-GC; Sun, 09 Jun 2019 21:29:20 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ha5NN-0007Wn-Uo
 for linux-amlogic@lists.infradead.org; Sun, 09 Jun 2019 21:29:19 +0000
Received: by mail-lj1-x243.google.com with SMTP id a21so6124067ljh.7
 for <linux-amlogic@lists.infradead.org>; Sun, 09 Jun 2019 14:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KlrRIE/V5p97wscV0kE0tjEI2tlj1dGG4/jhRhsQRG0=;
 b=SOfnaOissSEz9PzQM9mMat56H+3dTOhDdmHyybdevIOxcr2JCQbgWnlzcNKHngS1ar
 6lN1VKkdZ7yRsOEp3hxL2mmnVB3bx7Bt3fbe68ItUxhUV/h8lH5jvN09txUIAd9HBDLE
 yOOfbglZUGy7zp+pLIy/Ti6rWwE+usRIvmnTmud3sfwtqzQKUHMYKqjtVmg24PXE3Mzm
 Pn8DnWXEw80qJN5Q6DxN+u/Wp9UeLNygpfrvD8EfJ4LhF+F6T8+6uT45UEmVss0EEoUa
 W/2popw6Ssix8aXzr8GK94RxD4Jtw8n9CeKclonaMsYy5s2V9HHbVhzr9bM+3qkt66Qj
 Iwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KlrRIE/V5p97wscV0kE0tjEI2tlj1dGG4/jhRhsQRG0=;
 b=ul/fnaIS+AXrR3mHCWgykwgLGzoMTGqUgWGjGwZtwFi9FEjjqqs8x4emmPKCGCbcav
 EPD3GwHGRtMAFWHxv0hLPtcmGGdVVxgQbgfYkUiV22bo8kUDbUowtQUwuR4c95/VYmC7
 HU0TTkGX/N4clIszPvt3nhARu6Mas57Hm41hZLlmvTGdTqRD7Nz+xv5F66IAVkeE5J5w
 D4L/JycPQH35A8XHLbjHIYeTNc7gb5PkhABoSUKH0bRgiqhkG9wUhjgxvnmDCLdHE4XC
 ui2jBPuY5/6CETWjfAkxpVP0V3mQ4jmbU+AlzVTKh8oRiMj9R2AkL2Ib5/reVlKjjTgC
 2k1Q==
X-Gm-Message-State: APjAAAWWfrypCsqkN7AxIHmt6qV1f+G9EE9V2SFjGHZr3x32LXcLnh7v
 EbgyUe5PyH1fNpL1G1WG9xWllZlHuEbq/y4xA6gCMA==
X-Google-Smtp-Source: APXvYqwD8jFnBTiQeRvhyH1OObx2r8DdreQqyuGuLnn7YPW7qYYuahnntAMr1MNIp51bnR6Kfl+SJrOrjoX25IWmQoQ=
X-Received: by 2002:a2e:8902:: with SMTP id d2mr34580225lji.94.1560115755209; 
 Sun, 09 Jun 2019 14:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609180621.7607-3-martin.blumenstingl@googlemail.com>
 <20190609203828.GA8247@lunn.ch>
 <CAFBinCA1xp5+77DhYMFjX31D3DsaU7d9EqFkWbn+UFFx5LSqEw@mail.gmail.com>
In-Reply-To: <CAFBinCA1xp5+77DhYMFjX31D3DsaU7d9EqFkWbn+UFFx5LSqEw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 9 Jun 2019 23:29:08 +0200
Message-ID: <CACRpkdZ4n+nCip-uoqbDvQeT0ZpJUfHVnp-D8qCSKfgJEapM7w@mail.gmail.com>
Subject: Re: [RFC next v1 2/5] gpio: of: parse stmmac PHY reset line specific
 active-low property
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190609_142918_004643_779B7139 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre TORGUE <alexandre.torgue@st.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev <netdev@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Jun 9, 2019 at 11:21 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> my understanding that of_gpio_flags_quirks (which I'm touching with
> this patch) is supposed to manage similar quirks to what we have in
> stmmac (it also contains some regulator and MMC quirks too).
> however, that's exactly the reason why I decided to mark this as RFC -
> so I'm eager to hear Linus comments on this

The idea with the quirks in gpiolib-of.c is to make device drivers simpler,
and phase them over to ignoring quirks for mistakes done in the early
days of DT standardization. This feature of the gpiolib API is supposed
to make it "narrow and deep": make the generic case simple
and handle any hardware description languages (DT or ACPI or
board files) and quirks (mostly historical) under the hood. Especially
drivers should not need to worry about polarity inversion instead just
grab a GPIO descriptor and play away with it, asserting it as
1 and deasserting it as 0 whether that is the right polarity or not,
the gpiolib should keep track of polarity no matter how that is described,
even with historical weird bools like "snps,active-low" etc.

So I think you are probably doing the right thing here.
This patch is:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
