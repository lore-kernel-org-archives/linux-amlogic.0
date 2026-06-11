Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B83ECD98D2
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jun 2026 09:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=inCP7m59gJQhIVKmsB+CqjKa6E7zMotNL9GacUuB8Lw=; b=SGSFPps1GVJOyJ
	ZSmzM9SJW2/nSFqY6E1EIsCX/oKHwLJN5GEpLZ2dAqo5xnDp0XKNUWhN26JUfkM2LAzyyt/UBl+3B
	sQqrBqQ0euagBESFLgWPkMv0Z1LT+Gv9XhxBhkifNw18yYAbj/QJpf5amSf4f+R7B+dBfXafdn4FU
	HqdepzPGTh2tLvH2N7jANqAbV22T1KbUheV++ZK1yRh4ajMeME8W3Cfz8JIUwTYEhy8Q59QkgYmJy
	23q61/Adr2gJvwarJt4XN1hF0bQcjgsALDrF14BuBRlijBRaQjUtUGyVRUGIVSzy8EOm+XXju1hxJ
	rcj4qvY7sPahOYWZOAcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXc74-00000009Az8-04ij;
	Thu, 11 Jun 2026 09:54:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXc73-00000009Ayj-13P8
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jun 2026 09:54:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F30C600AA
	for <linux-amlogic@lists.infradead.org>; Thu, 11 Jun 2026 09:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75CC1F008A0
	for <linux-amlogic@lists.infradead.org>; Thu, 11 Jun 2026 09:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781171651;
	bh=mOT5MTEYP2VQ8u5u+7KQbLwcVHJ/p6qpOrVUi3vksxk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZRm3bw48nyZdy6jSQHF9fr7IpkIExOLwjSSAUD0RqvU72X7hPdp4ARaYgUGeJ9z/O
	 pfGQNFyasstinZCJiQUqNOPKKVxHuITz/1Oq4s6uEntiV5NINFLpplyvD9GBZq2c/Z
	 Dd+cuTwggmcFoEosPQe9Auv6vsL0YlMislROqRt0G2YowOCBDOMgheUFWgcBGxzlkM
	 ZYaFjc84wgnpNJ2rWTcbBr5G8+vWoHiVLONT/1c5w+wN7uHWERD3tYLBtxWcXPLRaI
	 O0Z3NE9oNM+rPDqMSLB+8KBc2pEMfT9NmBJripLGcG+U+yh15Ctc7NB9tFv9TQ9CKj
	 41CU6XgfL5adg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3966388b388so7287981fa.1
        for <linux-amlogic@lists.infradead.org>; Thu, 11 Jun 2026 02:54:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9qKfu6qwBzWlcJ/JAfNt+hdRSeN3FgobcbAWY9pP2G/2KFwfUmspua4MHWl+NwQoQrYOO+3RWCK8hmCS+r@lists.infradead.org
X-Gm-Message-State: AOJu0YzNeDRnnKJXw8LPX0asE9IqUDdjSrBFKKAeJQhUgbcvmz3VLaWE
	YztofW9uRPI0hOIsYG2cnTnVOoS4AN0EqhpM95JPuF6x4IdlNw8WigsgSDuuOnskH6BJF7lkyC1
	zU0AKZ3V4msd69vGu1RmimwkpCV7zpE22KIYD1N+TMA==
X-Received: by 2002:a05:651c:210f:b0:393:cbfb:6f1c with SMTP id
 38308e7fff4ca-3991a4754d2mr4407831fa.14.1781171650553; Thu, 11 Jun 2026
 02:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260610153329.937833-1-v@baodeep.com>
In-Reply-To: <20260610153329.937833-1-v@baodeep.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 11 Jun 2026 11:53:58 +0200
X-Gmail-Original-Message-ID: <CAMRc=MercPNLWJd7JkGKQh85wwK+58KGqUgAKAYZhXvkC1Nu8g@mail.gmail.com>
X-Gm-Features: AVVi8CcwekiXclIHT_cfijbWQy4UuN-Z1t4Dxk2kC1U7yH7ZQNm0xbbc-JVeInw
Message-ID: <CAMRc=MercPNLWJd7JkGKQh85wwK+58KGqUgAKAYZhXvkC1Nu8g@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore
 meson non-sleeping
To: Viacheslav Bocharov <v@baodeep.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org, 
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

T24gV2VkLCBKdW4gMTAsIDIwMjYgYXQgNTo0MeKAr1BNIFZpYWNoZXNsYXYgQm9jaGFyb3YgPHZA
YmFvZGVlcC5jb20+IHdyb3RlOgo+Cj4gZ3Bpby1zaGFyZWQtcHJveHkgY2hvb3NlcyBpdHMgZGVz
Y3JpcHRvciBsb2NrIChtdXRleCB2cyBzcGlubG9jaykgZnJvbQo+IHRoZSB1bmRlcmx5aW5nIGNo
aXAncyBjYW5fc2xlZXAsIGJ1dCB1bmRlciB0aGF0IGxvY2sgaXQgY2FsbHMgY29uZmlnIGFuZAo+
IGRpcmVjdGlvbiBvcHMgdGhhdCByZWFjaCBzbGVlcGluZyBwaW5jdHJsIHBhdGhzLiBPbiBhIGNv
bnRyb2xsZXIgd2l0aAo+IG5vbi1zbGVlcGluZyBNTUlPIHZhbHVlIG9wcyB0aGUgbG9jayBpcyBh
IHNwaW5sb2NrLCBzbyBhIHNsZWVwaW5nIGNhbGwKPiBydW5zIGZyb20gYXRvbWljIGNvbnRleHQ6
Cj4KCldoeSBhbSBJIHNlZWluZyB0aHJlZSB2ZXJzaW9ucyBvZiB0aGlzIGluIG15IGluYm94PyBX
aGljaCBvbmUgc2hvdWxkIEkgcmV2aWV3PwoKQmFydG9zegoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
