Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E618C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Mar 2022 09:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47nd5vfhHV7dBa8es0UFKFecS0r6UKKckGOyLA135jc=; b=QCFkTAZoXcSyoY
	Uy/m0PawwQKfkKCcAxSRta5pBy+Uy/boUF/P3Mw04x5QRMSwMYYTeHfevzHr0W4oU6K5tstH/8hEs
	Qrz2g4p2XcHCCVGHhSt5oMs5o3kXScRQVg6J+8vz6tOjndu76OKcdmA6tcvrrJNsmbha5U8CJv2KF
	yG3W/1wE7NgNC299UUoJxTdT95onOwpVSsYxxjX0V+ESm/9lF38LLa5G28oqDP+ypLYg65SbjSepy
	Yp1dBrWTz53qw3naNWVUlHnZnwed5as7Z3+B86sElH/8K2F+thLqNtBREuWxlhEo7QQ0P/Hei8TKp
	bbAM3LWfO7hXD1ntDTKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYlT0-0080FA-Lz; Mon, 28 Mar 2022 09:15:14 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYlSk-00809D-14; Mon, 28 Mar 2022 09:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648458898; x=1679994898;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iDPo4+auOxDlbVUvyIzvO6r769KSVx4M39s1sqLHWTg=;
 b=M13VVumGg/veClCNFhJYEDMJ+3SOEBEltR3VaXdONN4fe1BsdLUcAN8R
 plcLrC9Xps4KfOYpk9Co3ehJEplBG38g+3cswM0X2nMYJtEjyPSzExT54
 d5mwc2kcgFNuGSP3x8sGduTGh83rBk/5CPFmK1EvD5u4s4C9swIzec4X4
 5zOEfNVD5GWLLfBk/gYfQ6JQkmMVv3rBdHbQuCZWIGBJJ7bOeMf2hLKT4
 NjBwycdSkXoUMXW4CiTFSngcEPg0KQkJ7N9NjxSGySVrzNgiULyK1nfkU
 g6B1xJvz4y4a3CTJoUflmwQkAf+3sNZ8XBYp+oBgiKMX752749fbtlvmO g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="257783267"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="257783267"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:14:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="563473256"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:14:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nYlS4-0081P4-9G; Mon, 28 Mar 2022 12:14:16 +0300
Date: Mon, 28 Mar 2022 12:14:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 1/5] gpiolib: Introduce gpiochip_count() helper
Message-ID: <YkF8Z165E9GqcKBY@smile.fi.intel.com>
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
 <CAMuHMdXJo=XWNLKpFFe65fx-c7oPXmydvXxiPzGicNaxYthGbg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXJo=XWNLKpFFe65fx-c7oPXmydvXxiPzGicNaxYthGbg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_021458_137134_B6DD5CB4 
X-CRM114-Status: UNSURE (   9.97  )
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

T24gTW9uLCBNYXIgMjgsIDIwMjIgYXQgMDk6MzU6MjVBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IE9uIEZyaSwgTWFyIDI1LCAyMDIyIGF0IDk6MDQgUE0gQW5keSBTaGV2Y2hl
bmtvCj4gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6CgouLi4KCj4g
PiArICAgICAgICAgICAgICAgaWYgKGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woY2hpbGQsICJn
cGlvLWNvbnRyb2xsZXIiKSkKPiAKPiBlcnJvcjogcGFzc2luZyBhcmd1bWVudCAxIG9mIOKAmGRl
dmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2zigJkgZnJvbQo+IGluY29tcGF0aWJsZSBwb2ludGVyIHR5
cGUgWy1XZXJyb3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCgpPaCwgdGhhbmtzISBJIHdp
bGwgZml4IHRoaXMgaW4gdjIuCgo+IFNvIEknbSBhZnJhaWQgSSBjYW5ub3QgdGVzdCBwYXRjaCAz
LzUgeWV0IDstKQoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
