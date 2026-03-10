Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58409EFCD9F
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Mar 2026 09:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KUKgq4HPs8c2yx0lNC15BLwTknq2J191/iWET0OHLzg=; b=bHOpL1w4bfs6/K
	ljkBfHi5lLphJ57FHfTZk4HHCmpjkYUVjCJ+lbfqM0upxR2ogiizc84lAqZvu+USM2Crvd+vADxnj
	S7m3h8o8hoAZBWcHWr3ti/nrNSzu6BxsywcWj4+Iql45ueqNlJBca3au4tFnyL0P8pBxkPodvF3ve
	HaOXsfemcc9ne1bx20KE0zPvlgTBDFAXgUySx/KXGXCF8rdx6QE6ZFjAxUdeCvCH6QuKUwi9VEmzd
	4WHX/goPFhe9D1BK5xNJcHMU+KjEBuJSEx3rHAxjNj0MbU1C9fqzOgTzPW3m1/ublEvImKI2omMci
	XrLj5b9UEZRN66u+H2IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt7z-000000092wV-1V9w;
	Tue, 10 Mar 2026 09:11:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt7y-000000092w7-07fS
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Mar 2026 09:11:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FABB60097
	for <linux-amlogic@lists.infradead.org>; Tue, 10 Mar 2026 09:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C11C2BC87
	for <linux-amlogic@lists.infradead.org>; Tue, 10 Mar 2026 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133904;
	bh=k2F848Zif0ENv+dioxwCTNyt1oN71pv8VacY1VvtFtA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iAC9yuid2s68RAiwdOVhUAT93xNVNA2ATIxfFQW4dQE+FXIxaOjCapUEbvNoJpl3y
	 h2pplicze6P7A4b+Z6qbUbtprHuZrE9SX0jf3Sb4kCb/xuO4g9UYyRBe8uvfafxgRT
	 MlAX+ROJ8fI/1IOzq7SkCPxxTiIpFKn+NYkqTzRN0dUhcjO7WBb3lfQwjlgSF/mA+T
	 2usZruX6YvLaJaQhmlbepRt3wWrMdiACaKI2164NU4H61OgYEdZxJ1pAz5ZSFsRuvC
	 WcmI0hJYuRpJWSR7Y2rPjq/q7wgBF2MIdaG1bDSswPwS60nWibUKDp0Oxtc2EMhkSk
	 Up1JqmHIxcM/g==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64c9a6d6b70so10813027d50.3
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Mar 2026 02:11:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/cLK6aVT/3ME4wNraEHhMzUh8TlzR+BUxs7pg3p9Va9P+OL/L+YbbOnMsFi09snh9a0ICZNOY9R8cI5jA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8jDwqGESBt3d6BROEphlidHEC3KZJ3Nz9/96QcgEzcOL1N1GC
	EYz61Y9qiB4ZWyWINJqB3E+4r6ByyugTrfCpAfspNq20SZJSRhl/cFL6LU9SWilAbDsWZmehbMj
	lj48F8F+0UsfMjPshCJL6F22PJ7ySx6c=
X-Received: by 2002:a05:690e:b8c:b0:64c:905:6f2c with SMTP id
 956f58d0204a3-64d1411d8b4mr13101525d50.20.1773133904182; Tue, 10 Mar 2026
 02:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com> <20260304-gpio-of-kconfig-v1-7-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-7-d597916e79e7@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 10:11:32 +0100
X-Gmail-Original-Message-ID: <CAD++jL=pOw2ZZqMXFK4cQ67g3yUGho6mjbW3JM8iQDQpiKL8TA@mail.gmail.com>
X-Gm-Features: AaiRm53Xu9gGfY3MrM83r361-dKQ36aGj99vP6wgofH18qCwDYgWNRZvm6MhVmA
Message-ID: <CAD++jL=pOw2ZZqMXFK4cQ67g3yUGho6mjbW3JM8iQDQpiKL8TA@mail.gmail.com>
Subject: Re: [PATCH 07/14] pinctrl: Kconfig: drop unneeded dependencies on OF_GPIO
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, 
	Wells Lu <wellslutw@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sre@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-leds@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-pm@vger.kernel.org
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

T24gV2VkLCBNYXIgNCwgMjAyNiBhdCAxMDowM+KAr0FNIEJhcnRvc3ogR29sYXN6ZXdza2kKPGJh
cnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cgo+IE9GX0dQSU8gaXMg
c2VsZWN0ZWQgYXV0b21hdGljYWxseSBvbiBhbGwgT0Ygc3lzdGVtcy4gQW55IHN5bWJvbHMgaXQK
PiBjb250cm9scyBhbHNvIHByb3ZpZGUgc3R1YnMgc28gdGhlcmUncyByZWFsbHkgbm8gcmVhc29u
IHRvIHNlbGVjdCBpdAo+IGV4cGxpY2l0bHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdv
bGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQG9zcy5xdWFsY29tbS5jb20+CgpQYXRjaCBh
cHBsaWVkIHRvIHRoZSBwaW5jdHJsIHRyZWUhCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
