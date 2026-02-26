Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BCFFD9E14
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Feb 2026 21:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gVjogxebqsxF1EgzjweNtEwHRFNekpEBHZKHY7J0kaU=; b=PC/MzyJ7UUJ7vm
	rrQYKRxRAfUaWVLLEfI6GfqXkfUZUzmc/n5J2m36CGFeUtwXohlIQ5GkNpGqRLusj/p/Emk5FgOmG
	C9nMZ8PHELY+ZRRYKUj4eYnhlVFKFChvDYOOrx0p59T1DK9XPgaCed0jkJ+2SUGLpxWywOmyMIqh6
	9G44iEtDhFrI50FZd48xEmaAfHOeL3NPBvxSw19Ogcf3a1QU/HwTkBJY1EqCPAKsC4sLUbbRMsxFg
	yRsV1VlUdsfT3Nv25Ct0Xl5gKjVv3EkcQJ3dALAkFgZr5gop3IBej/Cxg7A7yW9gCNdaEJ0ZRgZ9E
	JLYGXcvMqUAY43jzFgxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvjFE-00000007Gk2-1lWK;
	Thu, 26 Feb 2026 21:50:04 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvjFD-00000007GjQ-0Ft7
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Feb 2026 21:50:04 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso6776405ad.1
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Feb 2026 13:50:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772142602; cv=none;
        d=google.com; s=arc-20240605;
        b=IO+YZ4BwHv1l/gT2doYSpHk300SE26KkDrL98EFRWjtjGaks+ipW0b1M/mFP+JlMP3
         AdX42SO48CnhHPIs1tx9NYK19204e13pQyDPGOFitWgbHKXJOy5LGtLvHRyKrM8k9q7S
         1K02xg8lt9a/iy3OcyOq47bf1YHohzMMb6dMwWuTxE2D1h7wSAOwMmZIyekfo5+08vfH
         vJ13UHly8R56N96bmDlRBnxiiY/pgRd1Uu572jjYLmfaJ54wPzu/464gcLdqf+b2n9YP
         uE5kRthM8B1F9TaT55D9QigC6HUkhiYmH2Nt1EXhbP0NE/UOaHgtEtWDtwz9dih6oDIX
         fsXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dsCRG0iMNmW9L8aiB7Z8unJe03vgR5EOjM6cSyXzpw8=;
        fh=9MDsYYs6ASyqFFul6BlED+yPz1U5Rg1fmX/FJSRxIIg=;
        b=PFNbPmjz0BbX83x2mQJyeaEDrig4an2ImU1oR1GYlapY9e97w1ikJ6adXvSSetcKxu
         2iUBX+6h6l2xlSvgdqMmgOOb7NClteKNgiYJCPQ50smnYsMk6OM1tM2jjdlRCBsgdGVc
         6etlQOaHEnpEhSZKNFlKSNnpBdu15gMRng7gkga8LA0p9aLEpA5w/0jcrN/g/kt8KJ49
         XAGU3+7sC4tidVljYNa5gzdfNhwbQjYWJJzNfNjaQAEudZp+m7YzbzT24GeKUhAGF+cJ
         1DCfg5u+Yh19720QrdG0ZL8uJK9Mw5CwilyXufugZ+VAZlKmp0Ps5ditlVRvRzezX422
         TW0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772142602; x=1772747402; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsCRG0iMNmW9L8aiB7Z8unJe03vgR5EOjM6cSyXzpw8=;
        b=i42YbUO9XCR9g52rXGRn9xuudOWZBCeHpn4e4rucSkMeoc6kHPLS+sn4OKo/dARgco
         7ChuzrJQHfUERD1+61QV5NuQt4BiVYhykPKEUvSZHe6E+5Jp1YjugY6SdTjJICAP/V5v
         F9bUclCIKv4afAdI1eFXZmMbtqM7iVJap0YmwyORAledqQkpSdYnDkE1y8ZUHDH1ZMwo
         spRthGYMDskpZNHnJNPXnZIlyEsWatvM2iPXf/PQRg3ohhVZu0/p8hl9J1tGVsnc+c7J
         0iYNT40RVi7RvVnQkfG7huoe4W0x7vwvSQYcXp3UIQHKIYThMd90iz5fK4GCaO7ezJFG
         VpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772142602; x=1772747402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dsCRG0iMNmW9L8aiB7Z8unJe03vgR5EOjM6cSyXzpw8=;
        b=Jy0F+V0GnvjHQoFSlcKi7sE3t7vqhTXuaG3XXtfZ/g0Tuxc5905raXKJdgDwlvN7xH
         t34LcnKpTz4OATRT08YEUZatf+bCMJ5l80Y4NtxAKLRHfzZ6SP8iCUtsuhm2l3znuyc5
         vxKF/DjO3Gbva86qB/5kvoFWOrUfqFMCq247z70nvD7ySU9MBRtbUb2ttrOj2Cbb/j27
         jtxeGuTbgmO5E0u/YmpvGqxUBXqPwRGjeVeYNicmNFuJZuOpnkfw3TVQUaUx5XJbMRSl
         UTFLIYBvYf/DpBEsQynPu68aySPSwb8NjxSYOxigQBrwUk4wIaDriAjrt2CffvzaEKZH
         P6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWyp4L+UaeH9Gb2Q+hfvq8T2qgptNEicu/36GrTMzkrujM9NnyVTmhkVxt/h696bjpy0ty8KWj+zMRcB9+T@lists.infradead.org
X-Gm-Message-State: AOJu0YzLg5qKs+IpHmANadyHUDj06nleV8A//tn6DiVIRcja0DajZz+R
	HRLaVccCbCulinDa5w3WEHlHhfsSR/zfz8RfLLyqUMo93Z2bFJonVFA3/tI1HYawFMeTo5zsVMp
	Jc6p9yUzTF5IJl0cV7l6b1tUAbn1KPgs=
X-Gm-Gg: ATEYQzx21h6z6R0SQDwSaXSL8tWE2f/hwIfL+7Q2oEOqycFJ2s4Dq3YTtp3kdBxfogz
	GPGqHjAVxB0HeFcajXLvo/KHhOKyitv5W9SSDQvTLNzQjRta9km7SNAWu+VgShscPhTxgUNJXzd
	DZMIwx8rQjh86MYtjpRGm9vvz2pUzTtgPeVrNy3En3WxHP8xY5I+WOHaTJ/Z9X+g2Efucw8nmAx
	2kxL5YlSs69Snlf0LiaaR9whYCdOVHTlQcrOQqG+E/YrbG2zRv92ATUaeJ0lTzXzCFdVYcrCoso
	b1G6TzU2OAw17dOT5872eyg7I3q5nrOG2gQwxCFw
X-Received: by 2002:a17:902:e849:b0:2aa:de68:98c1 with SMTP id
 d9443c01a7336-2ae2e47df0cmr4513215ad.26.1772142602187; Thu, 26 Feb 2026
 13:50:02 -0800 (PST)
MIME-Version: 1.0
References: <20260123022258.136448-1-nick@khadas.com> <20260123022258.136448-6-nick@khadas.com>
In-Reply-To: <20260123022258.136448-6-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Feb 2026 22:49:51 +0100
X-Gm-Features: AaiRm52EfSMFA2O8jNHHtEJKIVvMNtNK2XUKbtJkKO0CR4bhD1JcrnoKD6-Fiww
Message-ID: <CAFBinCB0MhXUb635Pe8mth74H7wkpHZbEFoFqbgFLw_yRQ_A=g@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: amlogic: meson-s4: add internal SARADC controller
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, xieqinick@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_135003_103960_25932F67 
X-CRM114-Status: GOOD (  11.89  )
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

SGkgTmljaywKCk9uIEZyaSwgSmFuIDIzLCAyMDI2IGF0IDM6MjPigK9BTSBOaWNrIFhpZSA8bmlj
a0BraGFkYXMuY29tPiB3cm90ZToKWy4uLl0KPiArICAgICAgIHNhcmFkYzogYWRjQGZlMDI2MDAw
IHsKPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLWcxMmEtc2Fy
YWRjIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICJhbWxvZ2ljLG1lc29uLXNhcmFk
YyI7Ckl0IHNlZW1zIHRoYXQgdGhlIGVuZ2luZWVycyBhdCBBbWxvZ2ljIGFyZSBjb25zdGFudGx5
IHVwZGF0aW5nIHRoZSBTQVJBREMgY29yZS4KVG8gYXZvaWQgYW55IHByb2JsZW1zIGluIHRoZSBm
dXR1cmUsIGNhbiB5b3UgcGxlYXNlIGFkZCBhIG5ldwpjb21wYXRpYmxlIHN0cmluZyBmb3IgdGhl
IHM0LXNhcmFkYz8KRm9yIHJlZmVyZW5jZSB5b3UgY2FuIHRha2UgYSBsb29rIGF0OgotIGNvbW1p
dCBlNDE1YTE2NTllYzkgKCJpaW86IGFkYzogbWVzb24tc2FyYWRjOiBhZGQgc3VwcG9ydCBmb3Ig
TWVzb24KRzEyQSIpIHdoaWNoIGFkZGVkIHRoZSBnMTJhIGNvbXBhdGlibGUgc3RyaW5nIHRvIHRo
ZSBkcml2ZXIgKG5vdGUgdGhhdAptZXNvbl9zYXJfYWRjX2d4bF9wYXJhbSBzaW5jZSB0aGVuIGhh
cyBiZWVuIHJlcGxhY2VkIGJ5Cm1lc29uX3Nhcl9hZGNfZzEyYV9wYXJhbSAtIHlvdSBjYW4gcmUt
dXNlIHRoZSBsYXR0ZXIpCi0gY29tbWl0IGIyNzI5Y2RmMmJjMCAoImR0LWJpbmRpbmdzOiBpaW86
IGFkYzogYW1sb2dpYyxtZXNvbi1zYXJhZGM6CkFkZCBHWExYIFNvQyBjb21wYXRpYmxlIikgd2hp
Y2ggZG9jdW1lbnRlZCBhIG5ldyBjb21wYXRpYmxlIHN0cmluZyBpbgp0aGUgZHQtYmluZGluZ3MK
CkkgdGhpbmsgaXQgaXMgYmVzdCB0byBkbyB0aGlzIGluIGEgc2VwYXJhdGUgc2VyaWVzLgoKSW4g
Y2FzZSB3ZSBkaXNjb3ZlciBhbnl0aGluZyB0aGF0IG5lZWRzIGNoYW5naW5nIGluIHRoZSBTQVJB
REMgZHJpdmVyIGluIGZ1dHVyZToKSGF2aW5nIGEgZGVkaWNhdGVkIGNvbXBhdGlibGUgc3RyaW5n
IG1lYW5zIHdlIGNhbiBqdXN0IHVwZGF0ZSB0aGUKZHJpdmVyIGFuZCBiZSBkb25lIHdpdGggaXQu
Ck9uZSBleGFtcGxlIHdoZXJlIHRoaXMgaGFzIGhhcHBlbmVkIGZvciBHMTJBIGlzIGNvbW1pdCA0
OGRjMWFiZGUwMTUKKCJpaW86IGFkYzogbWVzb24tc2FyYWRjOiBEaXNhYmxlIEJMMzAgaW50ZWdy
YXRpb24gb24gRzEyQSBhbmQgbmV3ZXIKU29DcyIpLgoKClRoYW5rIHlvdSEKTWFydGluCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
