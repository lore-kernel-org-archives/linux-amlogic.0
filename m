Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCD4606A897
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2026 10:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HYVDoHhw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B2TlxH4r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=igL47XPFhZ8BAYbAwF8lR2dgvfotWjWS6qjQZFrJqS0=; b=HYVDoHhwD8UzUUyI72vqW+/YwV
	R6MVudSrQofm0NT18nfE2HfFC6taagvF7FOn8hhV1F0wVMD1VfNhqMXUmhG+1OtonwkZCxlI6iAGl
	JmOKib/xOn5I0K3tXxBEvzuzR855cwfJV8Nd1G9/NlNE2Lt43s4eSiodD7m2JeKlKIWba3hK6+sFu
	mHDB7brPbh3VUyzVNhrqZnLmsq9oYbjV8M0cqjx8LfFUGtMMPWZesSp9JL3eUgwzkO46k47tfqC3f
	0rXHuDD1P0OAASUn9o2iMNKzsA6QfrpE7VnTtmOeA/VH8XnsFA8rF/vZzE917iQGwdifacVf6F2Td
	DeGGBCmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoSA-0000000CLsf-2bqS;
	Fri, 13 Nov 2026 10:24:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoS7-0000000CLrh-2quA
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Nov 2026 10:24:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F374845913
	for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 10:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B8C1F000CE
	for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 10:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794565454;
	bh=QkN+1eF8Y/XADWpxlJCNMdoZN2CgphaWq6d8zvGa81w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=B2TlxH4rUxqu1No4etPUv6yp9T9MCAPSpTPrnvC9TSm6lyJhImV4nK1ZwJTrgxYB4
	 rd/Heek1KzjtLhGE4uyhADwLxZw+prNnlbugMgeTShae8z33A5C5RHz2+CVO1K6Z0D
	 LvvLJ5NJMF4TzFZHlR98IreXMaBusEu/Hd4Wbu86DpUMMN3ow4/XtxAHvfq8f5C4GZ
	 MHLPzYfGYZz4XEKLAjAji9ktzGa7gCbr4OS2Uzy8Ldlb2oCIfaJzYXBKYySx466vbE
	 8gqF0rrEluaPC+BNmi7iKA6F6P3zPSzBeprseH2NSQa8XVxomjw483iqOV2oOmPWV9
	 kksYyqvPA18bw==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-48ed0b68895so974993fac.1
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 02:24:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF3cOSYPsatNLoQf63/AznvHnGaSYf95X5pk7rg16maIzhCQbYPSDxBdZ5LSWjWlRhLpTw5xA6+7G44dNQy@lists.infradead.org
X-Gm-Message-State: APuU4Z/dcU1R2WDlNyIVP7LDwz3oj/KwMef7jxew3gdhcj6EmoIYi4lf
	uibqYqXr+hXHZ+ZQeWuc5la3a/FAZqmXieCFffba53mgNjSuMmYdr0uySfDrY4tRvy3X96ADtZy
	RPM435CkJpRoj0neJh4bp14G3Z6DX6xw=
X-Received: by 2002:a05:6871:7426:b0:48f:e3f5:c419 with SMTP id
 586e51a60fabf-4afdf7ccd7fmr2000857fac.58.1794565454219; Fri, 13 Nov 2026
 02:24:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106-debug-info-v1-1-067c5c554f91@amlogic.com>
In-Reply-To: <20261106-debug-info-v1-1-067c5c554f91@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:23:54 +0100
X-Gmail-Original-Message-ID: <CAD++jLnKJGDM5woHn5UXGmToS0g6N55=T=+8Zy+F6X92N0zW2w@mail.gmail.com>
X-Gm-Features: AclHuK9SuxGHNdL_y83hLe0FJC4k4ytk2FDVH3qE4U10O6Iw68MpttghD3THgNo
Message-ID: <CAD++jLnKJGDM5woHn5UXGmToS0g6N55=T=+8Zy+F6X92N0zW2w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amlogic: a4: Allow functions without groups
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgNiwgMjAyNiBhdCA4OjA54oCvQU0gWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxh
eQo8ZGV2bnVsbCt4aWFud2VpLnpoYW8uYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cgo+
IEZyb206IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+Cj4gQWxsb3cg
ZnVuY3Rpb24gbm9kZXMgd2l0aG91dCBjaGlsZCBncm91cHMgZHVyaW5nIGRldmljZSB0cmVlCj4g
cGFyc2luZyBpbnN0ZWFkIG9mIHJldHVybmluZyBhbiBlcnJvci4KPgo+IE9ubHkgY291bnQgYW5k
IHBhcnNlIG5vZGVzIHdpdGggdGhlICJmdW5jLSIgcHJlZml4IGFzIHBpbmN0cmwKPiBmdW5jdGlv
bnMsIGlnbm9yaW5nIG90aGVyIG5vbi1HUElPIGNoaWxkIG5vZGVzLgo+Cj4gQWxzbyBoYW5kbGUg
emVyby1zaXplZCBhbGxvY2F0aW9ucyB3aGVuIG5vIGdyb3VwcyBhcmUgZGVmaW5lZAo+IGJ5IGNo
ZWNraW5nIGZvciBaRVJPX1NJWkVfUFRSIGluIGFkZGl0aW9uIHRvIE5VTEwuCj4KPiBUaGlzIGFs
bG93cyB0aGUgZHJpdmVyIHRvIHN1cHBvcnQgZnVuY3Rpb24gbm9kZXMgd2l0aG91dAo+IGdyb3Vw
cyBhbmQgYXZvaWQgdHJlYXRpbmcgdW5yZWxhdGVkIGRldmljZSB0cmVlIG5vZGVzIGFzCj4gcGlu
Y3RybCBmdW5jdGlvbnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBYaWFud2VpIFpoYW8gPHhpYW53ZWku
emhhb0BhbWxvZ2ljLmNvbT4KPiAtLS0KPiBBZGQgZGVidWdnaW5nIGluZm9ybWF0aW9uIGZvciBl
cnJvciBkdHMgYW5kIEVycm9yIHBpbmN0cmwgY29uZmlnIG5vdCBhZmZlY3Qgbm9ybWFsIHBpbiB3
b3JrLgoKVGhlIHdheSBJIHJlYWQgU2FzaGlrb3MgYnVnIHJlcG9ydCB0aGUgYmVoYXZpb3VyIGl0
IGlzIGNvbXBsYWluaW5nCmFib3V0IGlzIGV4YWN0bHkgd2hhdCB5b3Ugd2FudD8KClBhdGNoIGFw
cGxpZWQuCgpJZiB0aGVyZSBpcyBzb21ldGhpbmcgdG8gU2FzaGlrb3MgcmVwb3J0LCBmb2xsb3cg
dXAgd2l0aCBtb3JlCnBhdGNoZXMuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
