Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2547DC04AB4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 18:16:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F01E220850
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 18:16:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rWE/tykF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HHumoDlF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F01E220850
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HgqTQNdWZ4di0Mzbtywv8J+JiqBZqWghlcDfH0ju3DA=; b=rWE/tykFyq0JgU
	0RU0mk6orQVSHaHEir7FZcxh6BtNSjX6CccTv9BTZ+ZIGaxd8mPQB48BgTUfKbYtp7uqTEZpacb9U
	wr2qPoEvuT3etRHD1bN07tAXLetR9PdiEjPMoJcdgW266WcNphNuTIAcat1RndW5qry6GRH3Gk96a
	zCjhiSz11kLwRE1gGEBksrDlFfqmt6TeW+42iQzlwOtN8Am+saCzzOJWaS9KI2Gr4hN+DrcXVWkC7
	p0EQCzN0/1YA8XgUgphpni5iiLTihsokQtISiVpZBu1WtjmYEIK8Hijj6WLvh+0myqbyiMSIPuO5b
	BkFMJzJ/WdMkzQtQOSvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQbyk-0007gE-Jp; Tue, 14 May 2019 18:16:42 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQbyi-0007ft-0f
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 18:16:41 +0000
Received: by mail-oi1-x242.google.com with SMTP id t187so9548064oie.10
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 11:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4YMSOdywhMDkZIusrQTvSoGh0Q6ONeiUFTYpafArN1A=;
 b=HHumoDlFG8R5gAm3Ad1ciIosYI3vaJ7hvHU+HejRRC3yCLveG8A8/bU2GI1BTbzPaH
 IUwfrvrdpaTW6+rlhxdctqH0ds3IQeGLswlJygQJo8Wy8owPgytP15gmPLZgAk4FkBDg
 NgZhOKRTzusOhfrD0OLcPwc6cOCFj7fIZbmQX3qUu2d5lDU5d2QhslTTaVbc9IjZZG/C
 rARWXf1jUvtJLOMJCZ+Ly5WWspAoAMkEbPRS2xtQz0P3kLU+xBfNqPrhlzInuNT65nGC
 KMyOwwLqwZW5V3mdgjKe/Vi2o3InWL6SK1ZVnKOqmz9Smip2Y7WHvEvf+2+YD2o1F/Cm
 8TRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4YMSOdywhMDkZIusrQTvSoGh0Q6ONeiUFTYpafArN1A=;
 b=KFeSLEkkgFml7U+2um3CJuD2/O5+3FNLQ9q2BXReDmJ8tbyLvjHGXbxMGVhNmMTYH8
 lnehdGuBQaoOU6Rcx7WdLeECaFR1uCjDzOrTlDhwGHr0ZStjOYlpohd+wkNWsDupKGeA
 ZQf3ccO5vimqrywJ/yyMnvj05v+1+5lhaimRA+O5sqwvDrjC4cQGRuwy5+cM591yik2J
 NsT9Ixfl2IdL7dmQiRV29AOj1Hr9gvAa0DZoKOz51IxQDhkIWmzFI50XHi+X+s1HJ6WE
 Fdd/8NGkKRkyCR3du/8Bv6tbBQzJL+TyctSkZ1tO7HzcRqgb9Sit1YYxPz2W5CbQjQXa
 O5MA==
X-Gm-Message-State: APjAAAXLAGAKHaewGNqbz5zSSEfajNzgALrEWShW0Jag72FypltBuK5G
 Izz0HjwVpk/UPOjiXo4LkWeObt027K11CzYJc8Q=
X-Google-Smtp-Source: APXvYqyY2t4CYQPKEHqtsUwWM2Rw8XRLaW0voMCaWNP5OK2WwOoKu/4mjsM6cQLFKNXGKuBZGFlXDA3GnbdV2cYN/5E=
X-Received: by 2002:aca:b68a:: with SMTP id g132mr3805890oif.47.1557857799214; 
 Tue, 14 May 2019 11:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190513123115.18145-1-jbrunet@baylibre.com>
 <20190513123115.18145-2-jbrunet@baylibre.com>
In-Reply-To: <20190513123115.18145-2-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 14 May 2019 20:16:28 +0200
Message-ID: <CAFBinCBOtsSCg40L+PovAwN2dvLpDO7KMhJpcftpSiv+moBDSA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] clk: meson: mpll: properly handle spread spectrum
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_111640_083368_FBD04F73 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 13, 2019 at 2:31 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> The bit 'SSEN' available on some MPLL DSS outputs is not related to the
> fractional part of the divider but to the function called
> 'Spread Spectrum'.
>
> This function might be used to solve EM issues by adding a jitter on
> clock signal. This widens the signal spectrum and weakens the peaks in it.
>
> While spread spectrum might be useful for some application, it is
> problematic for others, such as audio.
>
> This patch introduce a new flag to the MPLL driver to enable (or not) the
> spread spectrum function.
>
> Fixes: 1f737ffa13ef ("clk: meson: mpll: fix mpll0 fractional part ignored")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
in v1 [0] I checked that Ethernet is still working on my Odroid-C1.
I didn't repeat this test with v2 but since the logic has not changed
you can still add my:
Tested-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>


[0] https://patchwork.kernel.org/patch/10877431/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
