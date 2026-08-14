Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6CCC5CFC1
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Aug 2026 08:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwiAou5K9Vtjq4at7V69DUO06PIYXDZWh3U4a9zF7OU=; b=z/jXqIeQhGduuv
	zV9UfSZOwOVR8V1CRX/YpdLTgjjl72gmhYxg6imxTCjOTliNsxbXFmdSTzglETEMqoJTrodiFH19v
	jNUZJUUNqKwc37Lj4Z6FA7io+XtuIYXe6ZkksQJy2F6DVFslj0T/RjfeY3NntBJ1FX2EdTelkE7xW
	LgAGGvAjyUvUGtujOD3xf5X9T6KR8CW3dHCAramMkfduiHqaC9s82P8Ed1wwN/BHTmV7HtgFC8qbi
	wArh4Tf4GBsGFz01+uTOyPNrgppu0c5wI1ccfuC/QtSpKHjOjL1zX99zFj2Ng59UmvRKUlHdTWbiM
	H8rM7S0j6Pb1274Cdx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumtz-00000002FJ4-0kvC;
	Fri, 14 Aug 2026 08:04:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumty-00000002FIk-1xQw
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Aug 2026 08:04:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D391943D3B
	for <linux-amlogic@lists.infradead.org>; Fri, 14 Aug 2026 08:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E111F00ACA
	for <linux-amlogic@lists.infradead.org>; Fri, 14 Aug 2026 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786694669;
	bh=4GtjVz8aSkcV8b91bhUSgFtXdsgsr8VDTaF8d3s/S3I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EgDCmVTd+nFlCcoWLX1CowPzRJTPj7xD/6ijFoL0MQqHLVeKRF4A2fli3yami7BR2
	 Sr6IdOjib8bFJxzomPosLHtV0EYwbHi9MQnMr9PR1MttWcAkcf3Q+gF3U/0BRAzUNN
	 +9SJifjUswN2fD0lS3lc7O3vjhfnKL9j7sChv2jU+sn8gOhx40en2EaWXobpBrEIku
	 L0Vpz3hYnkLxu3Lv8Zvt2w/RhHNtG8VXcZG4YE1gkdj8krbwCUNd4OibMXhYWA7IIN
	 n1hsCeIQNpLFlLGor9T6MNwh5cnm0waDTQ+Dg+3EmyyTseHUVHQMx/LbWJqdNuVv/+
	 regfGSWNlzsYg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso740484e87.2
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Aug 2026 01:04:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr2veCgp+1PhtDKlG67TlB+zH0IXxodtvBfAZr7tTmZxeERNlTPRdf6puTy3HMkDNLWgCQefUjP8brD7Wb4@lists.infradead.org
X-Gm-Message-State: AOJu0YyKzowoarL986wkD6m4BvwxmdIwjwxlFjHm8X3DmA7ZRGV/5QNe
	DwTkPpmjMBuhyIxX9mjrt8059Rrp6uJ2fpJoNzBFIo2YbGTzn9j//+y0FE0B5uLUjzM9KYr1RJG
	k8SdpszEqkBM47f6h1cQL5UCPQlBem3s=
X-Received: by 2002:a05:6512:ac4:b0:5ae:bc40:46de with SMTP id
 2adb3069b0e04-5b4591a3437mr500240e87.54.1786694668515; Fri, 14 Aug 2026
 01:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260812-sync_a4-v1-1-b7279c26e2bc@amlogic.com>
In-Reply-To: <20260812-sync_a4-v1-1-b7279c26e2bc@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 10:04:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLm=bW+fFgwjYjUyKAenY-QkxZQxrRcYQKfank-ZNcVr2Q@mail.gmail.com>
X-Gm-Features: AcwNN1UyDExcAOXw8J37R-EEDNTfffTGz3BzYB-AtaE8hWwAMb7QYzUfCwaWE8Y
Message-ID: <CAD++jLm=bW+fFgwjYjUyKAenY-QkxZQxrRcYQKfank-ZNcVr2Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: sync some modify from A4
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gV2VkLCBBdWcgMTIsIDIwMjYgYXQgMTI6MjLigK9QTSBYaWFud2VpIFpoYW8gdmlhIEI0IFJl
bGF5CjxkZXZudWxsK3hpYW53ZWkuemhhby5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToK
Cj4gRnJvbTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4KPiBTZXQg
dGhlIGRyaXZlIHN0cmVuZ3RoIGJlZm9yZSBlbmFibGluZyB0aGUgb3V0cHV0IHRvIGF2b2lkIGVu
YWJsaW5nCj4gdGhlIG91dHB1dCB3aXRoIGFuIHVuaW50ZW5kZWQgZHJpdmUgc3RyZW5ndGguCj4K
PiBBbHNvIHJldHVybiB0aGUgYWN0dWFsIG91dHB1dCBlbmFibGUgc3RhdGUgZnJvbQo+IFBJTl9D
T05GSUdfT1VUUFVUX0VOQUJMRSBpbnN0ZWFkIG9mIGFsd2F5cyByZXBvcnRpbmcgaXQgYXMgZW5h
YmxlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9n
aWMuY29tPgoKQXBwbGllZCB0aGlzIHBhdGNoIGFzIHdlbGwuCgpZb3VycywKTGludXMgV2FsbGVp
agoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
