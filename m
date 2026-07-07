Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF65C43458
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 19:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZHwKRv08hpMM/HVjAIjOTAEycKK9S8ZWvSNV4gO87p0=; b=2dR3CqjjRHcoMI
	Yp+c3ueMqTVo0sJmwZ5Xo75UJPyhLS6azQWAYrWAn5HFAaQbaPN9LN4OLdcb38Vc2kDck/oc0bWg2
	vBVF1J6WLIyZc9BcCAuGOG6y6j1CwRpWMXmHFW4pDwAb5/sjEta1oiwyGesd6vv5m8ZF7xNtlTMXI
	lHjLz1xKCmOzf1lVVAkbnxqVcM0AhczrMlhklXVh7W15YVZCn24eFSfHC4v3t6s27TWl0Sx2Rft5a
	1RC1XJRORqlLF9HQoyYAyMNRCZJQHsqJESztTi5VVSkMyS0MbtlrFtq2io6wvZuvb5xuEPBTclXkQ
	GxmxMTHPHMv7eLaG9H7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBbT-0000000Fm8O-0lyb;
	Tue, 07 Jul 2026 19:37:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBbQ-0000000Fm7I-27xX
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 19:37:09 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cad8076b01so57128175ad.2
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Jul 2026 12:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783453027; cv=none;
        d=google.com; s=arc-20260327;
        b=U5VjNhAegEzS1q1wgDDYSkWUA2CKYgcWrKarS2KTG3nV2+0ou4vUFmFPU7UPIOifoF
         zoD6SsE/VtkuoHq8jeBvSDt4Wx0w3+rGbRf3KaLdC0uKf8suzXHwGEV6EK8h+8zdtVnd
         dhRwmQ2NchPskm8OSGdjlqNGSkfSqHqZlIewhiWWaySg8MYbovQFg6zZ0JI3KpbX8L1F
         pfN7Ud9xbLIcQWxOvRfgWpdJg56ofn2dMhlk0ax2C9nn6meybpuqBfiRb/L3u8JvGczt
         0so0u15avmCDfyR2Yu+mQpJtxwvx2Ir3M36PA+y/8rpCCAYj4DHORvZixGxv14zHeMo/
         vdhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QzuQavQKc4mdVC+7oXwG28ZoqFmPWm0/w5LBLFtSdog=;
        fh=SAbjC6pUwVhF4yXk4pMlxxnkJuEeUUlMgKgCuz9vcu4=;
        b=At1dw1KxSlesmt3nOiX8w/FeSjGwuJCOKbiocss0E6JhKkccsCGgaLEj74gg6AZweH
         Jfygc4QDKKYsnZK+li+oFg03t3ElLfdxK/SNYoNic3AgsbTWmFjlHIMbQmtRwkuDolh0
         Kc8cYId/itT1RRKOpfxLDNNjBo0Ta87mahO1LflDxRpORAUA9oz9pr6S5BKlh8E1yxxp
         0G7v/ljFzU0UJlqOSfOBMfSyrPIxqrrMbDFHUNe/xgYAH4/i5OcjvXXA8u4ZrdX/3vnU
         O+pF8svUQjlWORt99E9epZkgLWk8KKk3cULfE8ciplc6OzSRkheXOAzJsn4kT3C0tRFn
         fVpQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783453027; x=1784057827; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QzuQavQKc4mdVC+7oXwG28ZoqFmPWm0/w5LBLFtSdog=;
        b=IuIJEz78JdbEF4BdB9Yf0EdtNny4lTzOojE2g+EP6X5CcxudMuqeCuuC0mUSC814fM
         P3jgwkFlAFn3nilJyp6l4BvtPd0SRhq+5nCFduV24iJCx6heUK3cft31p4nyNMr0bdml
         MfX476lSW//ZbnJEa8wnQvlu3ZaQDNcwr4MWPC2knpAzqloTy60Opbf3eE/jOVOzWE/3
         BV06DmJY5PYUw9/Bybd7GZMhyIPJvx8JF5i3vYpqLQqt9C0zP/pvdBX0VqgC+BjtG8Ea
         qImlU2zfFflpwU9lZFaMuvg5xyj/mOjGLQQfKFNJF1TTqGNemqAQwMXlH6n/66OUKwR2
         Zh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453027; x=1784057827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzuQavQKc4mdVC+7oXwG28ZoqFmPWm0/w5LBLFtSdog=;
        b=nwIBnZlNQ8imG2VsLtw2tEWSBESzDOb6tkOikqkk3HI16e5LLJovdWbw6fPXcwRaHl
         puh5q6qORO+TjPg/Q2JvZv05lFxfCzQL9dNVuT5yNY9Lh0W6WyvErm6DlqBrXYuP+6mC
         DJ/YztotZYcUx5ErEGEcpgnoXjx8atHWkvBQBDZU/88TcygZXgoPoQRnaksLFhKvWX8p
         KxnCTWj+7FgYJ8f10yQ5ei+6v80EYA4IpJ3XN6bqWGAozvRGlmLSmZiD/M2JFVSYJojv
         ZP21H77XqbiINM7+Cce04SyasEAZnAWJaFNljvaWbu99bVypdG/skKiaEP4bE2PCEAI8
         zJoA==
X-Forwarded-Encrypted: i=1; AHgh+RrUu3F56+naYHLyzOQThIaRHWemG9J1GTwAwHp/JWT2uruJcs7+ewX8gQjvTNeSsUFiARhSE1l8Shs3KQtx@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm3ZTwgVQSV/AxSos98wvfw+A/hIR9kkp9JQU7KxnUzUzbVwGD
	+fPXqp7CXswXSMl5VW1jEErfwlzz+Z1bKRuggfIAwKpfpnrvjzeo4AMegQ9I7zsmH1keB+t4QqY
	C47y2xGymFX5KuIB5FbwU75tX8Z4NKWk=
X-Gm-Gg: AfdE7cmg3sNW+wlGRVVDX4JoUFbXwYEaam7to0UVEAiUwh6nMpmPP12Sd9+X+8yf8io
	Fojp/gobH6Rk4GjmlDzMf0hZQpnK1GvpjW12g1H1AOcNtowwK2QKjlfZd6PTmgm9nTQuONawuCK
	jRH+aNwKavr+VP62gDNGaiP/pyU8ntwRmTZerNNs+LwSKerikJZOpWI6H21/vcw4pDexI8m2+r6
	54CJWmb67w4ZkKFmzapn8/EVrqXGGRvmWQYla7oeewmj/LdeU9uhTopCVWUnnJ0fuc11BLi6rzh
	E0i/MY59CmHFYMRr5AO1euMjsw==
X-Received: by 2002:a17:902:d2c8:b0:2cc:90aa:878b with SMTP id
 d9443c01a7336-2ccbe728946mr63686975ad.10.1783453027559; Tue, 07 Jul 2026
 12:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260624135650.727077-1-jerrysteve1101@gmail.com> <20260624135650.727077-2-jerrysteve1101@gmail.com>
In-Reply-To: <20260624135650.727077-2-jerrysteve1101@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:36:56 +0200
X-Gm-Features: AVVi8Cf-yuy-zDtbpT62GueylgVb7F5kepgWe3Xe-FkNm7a-D4HMWegM9GI0Nag
Message-ID: <CAFBinCAz7nDsXc80LQH+f2yC=o79E3nBhzL6OAUwYk2r3n_n1A@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] arm64: dts: amlogic: meson-axg: Disable nfc node
 by default
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Arseniy Krasnov <avkrasnov@salutedevices.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_123708_548856_D557D427 
X-CRM114-Status: UNSURE (   8.50  )
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

T24gV2VkLCBKdW4gMjQsIDIwMjYgYXQgMzo1N+KAr1BNIEp1biBZYW4gPGplcnJ5c3RldmUxMTAx
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBuYW5kX3JiMCBhbmQgZW1tY19kcyBzaGFyZSBvbmUgcGFk
LiBCZWZvcmUgZW5hYmxpbmcgbmFuZF9yYjAgZm9yIG5mYywKPiBkaXNhYmxlIG5mYyBub2RlcyBi
eSBkZWZhdWx0IHRvIHJlc29sdmUgcGluY3RybCByZXNvdXJjZSBjb250ZW50aW9uLgo+Cj4gTm8g
bWFpbmxpbmUgQVhHIGJvYXJkcyBlbmFibGUgbmZjIGN1cnJlbnRseSB0aHVzIG5vIGV4dHJhIERU
UyBhZGp1c3RtZW50cwo+IGFyZSBuZWVkZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdW4gWWFuIDxq
ZXJyeXN0ZXZlMTEwMUBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3Rpbmds
IDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
