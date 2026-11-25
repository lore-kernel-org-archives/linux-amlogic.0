Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0D2606A31E
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2026 22:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=46oPB1uY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iV1OLKUh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XKAblEOaDFltVa1wCATR7qUT4dZzvf4HRgPIKBeB8V0=; b=46oPB1uY16+HhGXZk1aUdLSeAP
	wWUx/HRsueqIcYXP7um9Xzhx7phB5uKnzIgZSLINEkbKauo2RFpOi1bCeupjaqr+Csk5y2QLWfUnz
	jqDac/DPZfBAZfCTRHo0UdSyuLJ4nVJVMr/C5Yce7a6e4DQH4oOfpdEy9jxsibX0iRY6eChFOwt/4
	0nHmTi4O/t3hlPBjr3dARzv1VM7wceC42yExKZpryWcwlntBJd6/2Op4ae10rOT0c0eB4/MJ/PKlQ
	l2mshujbpa3sCxDzdSMffw+oFIKLGbVz2YqvSKAqx6f9/XX1kKb1JEIRKV3MuQO6DNrG0m2Gyzj+/
	gHorilxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLTB-0000000BTY9-17es;
	Wed, 25 Nov 2026 22:28:06 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLRU-0000000BSu5-3Qp1
	for linux-amlogic@lists.infradead.org;
	Wed, 25 Nov 2026 22:26:22 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-491846221ffso5454881f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Nov 2026 14:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795645579; x=1796250379; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wuez8r9Gu63w2n4PILNMjVIjqJqefCtyrZMp62dMrng=;
        b=iV1OLKUhpWTRjAw4bTb2Ph7i4CR0PDFolJARy3VTqBNd3CDmOYUmvEHW0yM9cbHd2W
         3RcpYKJrZ6D29+Zshekm7SmZ5IPoA+QI3xcm4isewA/C7JelXzpGHMe8/qOQYE2xyUhS
         mv0HVUgWWD7NMwGhl7MVChztQofHViWZTrZnUgO4k1Z0RZ5fswoe3HlmQkbdqVb+13vr
         tjDU0ArZr54OEar1jw6kIwPyZ9c+8XoczEJpm90O89QftoMNdAn9ce4luiYKQ6/WoFo4
         +M1Fq3KtYIOhvg7sIoG1AGYYhKXl/sitUjttegKdu2jXzG87P0nFzM8fuyRcTiVv8Zsz
         cZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645579; x=1796250379;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wuez8r9Gu63w2n4PILNMjVIjqJqefCtyrZMp62dMrng=;
        b=Sf95MNVIHNJaztwLACA+ECkJhUPQPPPmUDERtmdhJpLlkQjRny0KHUlpsrgaGaRBZn
         kHzDnepE4vn/uYoH+GCbL2UrFgeO/0KuSSC0nMXIx4qrrdujYMLCWdsSWsP6rQH7mYoO
         /3lX3rosNr3u4dRR9v37alRTl0UrTH5dKcM2ibHrGCLSdjORwehlFaZ8gICwhsnMHkEI
         ytJHf3dlB2/g/DRTR8bRjtn+04bEdvzemA22QgLwx6zP3egdLrMtTVvor6ugfQFet767
         GsUuEJQ4wriNiE05aZXlx3qk2nfDCvbbOM2bj6QMVTkM+rxezQbK5TPjUiSjioH24ISZ
         f22g==
X-Forwarded-Encrypted: i=1; AL+hErFw/P+9cV9FUx6Y/X5BwfBPXTLw86WS7hCMvELxYzbNlw6LrQwRJN5JNZ8c8vaplaZ8CGLd4C0UY5Wx9FzK@lists.infradead.org
X-Gm-Message-State: APuU4Z8XJVMV4imK/ukpdQmAQb0mgXHzC0+t6fNGV22jlcl0vBFOhlV9
	77j1xCXezErjGrmRuwK9jn6Xe763QSZ9gKjlZebjZSBHXcv7KMp+grJVlvhgUXPPfE4=
X-Gm-Gg: AZFdTZekGx+/yVDo6ZqsEYggKjt1J6qUoFLJFw9ZIfjUeXv0eGRFfHrDaXcHy885AaP
	xXveesiNyv0VPULbVGba9s3nuXSL5fQDqR6qgrVBSBSUwRwD9lSeILuXY1cQ6yFeApX+LSA/b8q
	5kX4KcfPeKdVtSikz37o8pl7MPlp+rrK3iZQbDx9qvv2AyC8cRS00tA47W1fRFntKL2oMo3Uimd
	Fle6j6YxfI/lSgKYHE1QBGHXE99qTxLeyNCUvbMkX1o6JSHnEFJZDaz2AYCilriozVhq6wvl4/o
	ctld1LHtnWYfofpXx3eUjFFU37hEvSzkAxqn5WSqIDWWFdnQ4lgBs46vdM9EveklmJhUDLdB26k
	MvZKivWu2CjNEpGbdyCDEBPP94fAHNKL83at5v2lxHDsEzbE3vCfJNyiRwNtLzmWujebyhNNr8O
	DYL7FEIScO53lZiKHBwFqU9IjY4v0yW897Z1gEQtlYuf/IIhbKaECzDdECEbB+K3i8gbtfo0IrG
	xe8S3sUVF0wes4bRH91JZwd8p0kDjdWQDjCaBIhb3W5rjgdofVFjlr34AQ1J4TFckDHtJlXNokj
	77lfrF2J6/QJw28bzyGsI8nwJmB8Mdg=
X-Received: by 2002:a05:6000:4616:b0:4a8:714:7ae2 with SMTP id ffacd0b85a97d-4abb32a3f61mr37314572f8f.29.1795645578997;
        Wed, 25 Nov 2026 14:26:18 -0800 (PST)
Received: from [192.168.3.100] ([151.42.79.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm35684687f8f.40.2026.11.25.14.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 14:26:18 -0800 (PST)
Message-ID: <baef27e7-93fb-4e6c-8df0-8cd74b9aa533@baylibre.com>
Date: Wed, 25 Nov 2026 23:26:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
 <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
 <0949591a-63cb-4bb3-a7de-cf59ddbaafb7@baylibre.com>
 <CAFBinCAjFb7yS4VQp+BqLw2dG61To+iU4aiBvaVE9B9bWe=oUQ@mail.gmail.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCAjFb7yS4VQp+BqLw2dG61To+iU4aiBvaVE9B9bWe=oUQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_142620_893884_A5897C93 
X-CRM114-Status: GOOD (  16.18  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvMjQvMjYgMTA6MjEgUE0sIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4gT24gVHVl
LCBOb3YgMTcsIDIwMjYgYXQgMTI6MDbigK9BTSBWYWxlcmlvIFNldHRpIDx2c2V0dGlAYmF5bGli
cmUuY29tPiB3cm90ZToKPj4KPj4gT24gMTEvMTUvMjYgMTA6MjggUE0sIE1hcnRpbiBCbHVtZW5z
dGluZ2wgd3JvdGU6Cj4+PiBPbiBTdW4sIE9jdCAxOCwgMjAyNiBhdCAxMjoxOOKAr1BNIFZhbGVy
aW8gU2V0dGkgPHZzZXR0aUBiYXlsaWJyZS5jb20+IHdyb3RlOgo+Pj4gWy4uLl0KPj4+PiArICAg
ICAgIGlmIChneF9jYXJkX2NwdV9pZGVudGlmeShkYWlfbGluay0+Y3B1cywgRFRfUFJFRklYICJn
eGJiLWF1ZGluIiwgIkZJRk8iKSkKPj4+PiArICAgICAgICAgICAgICAgcmV0dXJuIG1lc29uX2Nh
cmRfc2V0X2ZlX2xpbmsoY2FyZCwgZGFpX2xpbmssIG5wLCBmYWxzZSk7Cj4+PiBJIHN1Z2dlc3Qg
dXNpbmcgdGhlICJhdWRpbiIgcHJlZml4LiBBSVUgLyBhdWRpbiBzZWVtIGNsb3NlIGVub3VnaCBv
bgo+Pj4gYWxsIHN1cHBvcnRlZCBTb0NzIHRoYXQgd2UgZG9uJ3QgbmVlZCBhIFNvQyBnZW5lcmF0
aW9uIHByZWZpeCAgaW4KPj4+IHRoZXJlIHRvIGhhbmRsZSB0aGlzIGRpZmZlcmVudGx5Lgo+Pgo+
PiBEbyB5b3UgbWVhbiB1c2luZyAibWVzb24sYXVkaW4iIGluc3RlYWQgb2YgIm1lc29uLGd4YmIt
YXVkaW4iIGZvciB0aGUKPj4gY29tcGF0aWJsZT8KPj4gSWYgc28gSSdtIG5vdCBzdXJlIHRoaXMg
aXMgYWxsb3dlZCBub3dhZGF5cy4gQXMgZmFyIGFzIEkgdW5kZXJzdG9vZAo+PiAibWVzb24sYWl1
IiBpcyBhIHNvcnQgb2YgbGVnYWN5IG5hbWluZy4gJ3dyaXRpbmctYmluaWRpbmdzLnJzdCcgc2F5
cwo+Pgo+PiAgICAgIkRPIHVzZSBhIFNvQy1zcGVjaWZpYyBjb21wYXRpYmxlIGZvciBhbGwgU29D
IGRldmljZXMgWy4uLl0iCj4gTGV0IG1lIHVzZSBhbiBleGFtcGxlIGFzIEkgcmVhbGl6ZSB0aGF0
IEkgd2Fzbid0IHZlcnkgY2xlYXI6Cj4gICAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLGd4YmItYXVk
aW4iLCAiYW1sb2dpYyxhdWRpbiI7Cj4gRG9lcyBmdWxmaWxsIHRoZSBjcml0ZXJpYSAoYXMgZmFy
IGFzIEkgdW5kZXJzdGFuZCBpdCkuCj4gV2hhdCBkb2Vzbid0IHdvcmsgaXMgImFtbG9naWMsYXVk
aW4iIGFsb25lLgoKVGhpcyBpcyB0aGUgdGhpbmcgSSdtIG5vdCBzdXJlIGFib3V0OiAiYW1sb2dp
YyxhdWRpbiIgZG9lcyBub3Qgc2VlbSB0byAKaW5jbHVkZSBTb0Mtc3BlY2lmaWMgZGV0YWlscyAo
aW4gbXkgb3BpbmlvbikuCgo+IAo+IFRoZSBHWEwgZXhhbXBsZSB0aGVuIHdvdWxkIGJlOgo+ICAg
IGNvbXBhdGlibGUgPSAiYW1sb2dpYyxneGwtYXVkaW4iLCAiYW1sb2dpYyxneGJiLWF1ZGluIiwg
ImFtbG9naWMsYXVkaW4iOwo+IAo+IEFuZCBmb3IgTWVzb244LzhiIChzb3JyeSwgSSBkaWRuJ3Qg
Z2V0IGFyb3VuZCB0byB0ZXN0aW5nKSBJIHdvdWxkIHRoZW4gdXNlOgo+ICAgIGNvbXBhdGlibGUg
PSAiYW1sb2dpYyxtZXNvbjgtYXVkaW4iLCAiYW1sb2dpYyxhdWRpbiI7Cj4gICAgY29tcGF0aWJs
ZSA9ICJhbWxvZ2ljLG1lc29uOGItYXVkaW4iLCAiYW1sb2dpYyxtZXNvbjgtYXVkaW4iLCAiYW1s
b2dpYyxhdWRpbiI7Cj4gCgpPaywgc28gaWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSB5b3Ugd291
bGQgbGlrZSAiYW1sb2dpYyxhdWRpbiIgdG8gCmJlY29tZSBhIHNvcnQgb2YgYWx0ZXJuYXRpdmUg
ZmFsbGJhY2sgc28gdGhhdDoKLSBtZXNvbjggYW5kIG1lc29uOGIgZG8gbm90IG5lZWQgdG8gaGF2
ZSBhbiAiYW1sb2dpYyxneGJiLi4uIiBjb21wYXRpYmxlIAphcyBmYWxsYmFjawotIHRoZSBjaGFu
Z2UgaW4gJ2d4LWNhcmQuYycgaXMgbW9yZSBhbGlnbmVkIHdpdGggd2hhdCdzIGN1cnJlbnRseSBi
ZWluZyAKZG9uZSBmb3IgQUlVLgoKSXMgbXkgdW5kZXJzdGFuZGluZyBjb3JyZWN0PwoKS3J6eXN6
dG9mLCBzaW5jZSB5b3UgYWxyZWFkeSBhcHByb3ZlZCB0aGUgZHQtYmluZGluZ3MgY2hhbmdlIGlu
IHRoaXMgCnNlcmllcyAoMXN0IGNvbW1pdCksIHdoYXQgZG8geW91IHRoaW5rIGFib3V0IE1hcnRp
biBwcm9wb3NhbD8KSWYgeW91IGRvbid0IGhhdmUgYW55dGhpbmcgYWdhaW5zdCBpdCwgSSB3aWxs
IGFkZCBpdC4KCkJlc3QgcmVnYXJkcywKCi0tIApWYWxlcmlvCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
