Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE848C44501
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 12:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=clV9UPMHHn6nuErLctGZVxmGQzA1wg7oHtmm5V2bD9I=; b=mYANM24T5azG9s
	UTUebbbtXfQMetep/E70pdg6rlb9nIqca4//Mac7GVWw0Zk2eXkUdHi0ctOpdt5MifXqRDonc0L4j
	lITHup9LeJsqv+Zf2kqFSD/3zofzvgZB0y+DeOEB6Cpzz65rKqrlmXwtSUSZ5ay+tTxdeVHcK+zno
	RaM43ChILqGLvwI+EF/yICYi2lSUo0dZqJg8k9dufN+lR05JFK6nE+isD6RAbpMw6FslpGSkCQHpy
	HFAnzaaF2QADEoqsUWa6wU/V4X86fB1ZN9jN6zAnoLggkFCgvCg5MJQB+YSGXImxyJqfpkrF7OkYN
	eZde1FWkXNkmMZr66SYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAdp-00000004wOb-00ZM;
	Fri, 10 Jul 2026 12:47:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAdm-00000004wNh-2e5b
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jul 2026 12:47:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493b7612475so7256515e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Jul 2026 05:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783687656; x=1784292456; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OlYQ+J/8rYdsqc6eGhUahr3U27QhOh0SgcXLrXVQ3Qo=;
        b=QQSsWeKW3Tm8GZTpE6ZkpvkQcVwc0GXsLndp6qdydcaydY584oFC1d55+uDXzX2M+N
         onH3D8DucGidmzOI30RvB1kNS4CHKifemgjakUYzyh78/yQblH64qDPItkdsmeUp2H1G
         JrwEYfv5zv3g4+n4HJFgZFt++YTr4Yc3XP/7brVCkmFBv9dTP64ZjkkIPUJ5SkxvaoIZ
         gMz1j1tVfIa2MYj3TrLZIT3FmeibXjlcbSRv4/ls/SFg6I5oZ3ptqikDKz1TWgzGA/18
         0UuEwwAaRFJBZshehBCwIEn9xj/wmMjIRTuv+LyVV4OseS9VjDNOIzPz43g8j4JLqJUv
         +32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687656; x=1784292456;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlYQ+J/8rYdsqc6eGhUahr3U27QhOh0SgcXLrXVQ3Qo=;
        b=eCWd3+H5Cl2wEGXfskqHTg54OtU7mVeqsqr22ajxVMVmUR40p0zfdOHz8fjTKYiT5Q
         j35+Rt8UX74Xx40TJyr3w5e99rLrURgah/zTcqJogfP8ywG9KDvH7iayTAeTeaOVoPcU
         Zq0QRsBWFrvIUquc6CWthdusHg+1Mzb9009itDqbfhrP35ow+pS417Wcv/69n8IV2m5l
         axrrYg6mmASyyCq1ckeAc4QZiQL98oJZjNHOgfz4rNhZJXM9AJqQXkKvIae6RMMoZV2d
         OhOtMslL+0XnJ/NarzRqRlE16WUsDTS9ALFhmq9vmQoXxZBFZhbaHDLAqJBE0HJg5yp2
         +jWA==
X-Forwarded-Encrypted: i=1; AHgh+RoLkLYHCSNcCJKjyJTCzY7fcT0fgg4Kfk5nQD5z8gcQ8v/r09i6Xj2YvwI0JNOCQMOZSr3rY+kLH3Fu5rdp@lists.infradead.org
X-Gm-Message-State: AOJu0YzSrS5bvYVfz9hwojm5JDz6uR+DMXGvjd2kMWqr0HMXdthSVaGu
	zTtvH2XeoIy2YcXRnUuSLg2hrwLJMy/HImP2Msn44te0cnQPDkeuHrdaYXwss89N1j0=
X-Gm-Gg: AfdE7cn70Kznog2+k2P+IuyGwbZsfn7Bb09jA9GGQuGeMiE6DX9NEQujA2y/VMhyr4D
	jycAG/PgHYJOkpgzMx12suZWU1qG+tI7XhKRA5METMmzCe7ttvyPXKqSsQ1bwSCN0D5yuM6sPwq
	Hbsl5y0c/suGkacX/Nw72Jl65k4RZpAmzzQut5eeMLi3hF1B8YrFVHHaMTW30YLo+kOdYNYanyW
	DJX46Q8DtnIrUe4wifa9oSkmRQnRyV359AgL9RU1/OKy3b17wF+axBBeysYjoOlgH3H3gs029IB
	GeiEb3U+Up4cjdzWzt4UKbJo+30FqpwAqgv77RWMMdJ5XMdJ924VyunU/MtDNX7UcwqVucqXlKb
	mz1w0MOtLuDkZ1mFwa4qKw79Mgr0PvNvBB+dUv1YAiEdQPplfdvZraIH4KbwUauWQgbM1CfelXS
	rkgqFFY9uj/owb4TE=
X-Received: by 2002:a05:600c:4455:b0:493:bb0e:2832 with SMTP id 5b1f17b1804b1-493e687fb61mr114586355e9.37.1783687656144;
        Fri, 10 Jul 2026 05:47:36 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f273195d9sm3834312f8f.3.2026.07.10.05.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:47:35 -0700 (PDT)
Message-ID: <191ee2b4-d552-49ab-aebb-58da970087a1@baylibre.com>
Date: Fri, 10 Jul 2026 14:47:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: meson: aiu: Fix resource leak
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>,
 Ethan Tidmore <ethantidmore06@gmail.com>, linux-sound@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Takashi Iwai <tiwai@suse.com>
References: <b955120b-2c32-4b03-9e7f-f236692cfc7b@baylibre.com>
 <76386ed2-b7dc-441a-b9ea-80ab26c54d52@web.de>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <76386ed2-b7dc-441a-b9ea-80ab26c54d52@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_054738_684890_E997E009 
X-CRM114-Status: GOOD (  10.96  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpPbiA3LzEwLzI2IDE6MjcgUE0sIE1hcmt1cyBFbGZyaW5nIHdyb3RlOgo+IOKApgo+Pj4gKysr
IGIvc291bmQvc29jL21lc29uL2FpdS5jCj4+PiBAQCAtMzEwLDcgKzMxMCw3IEBAIHN0YXRpYyBp
bnQgYWl1X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+PiAgICAJCQkJCSBB
UlJBWV9TSVpFKGFpdV9jcHVfZGFpX2RydikpOwo+Pj4gICAgCWlmIChyZXQpIHsKPj4+ICAgIAkJ
ZGV2X2VycihkZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIgY3B1IGNvbXBvbmVudFxuIik7Cj4+PiAt
CQlyZXR1cm4gcmV0Owo+Pj4gKwkJZ290byBlcnI7Cj4+PiAgICAJfQo+Pj4gICAgCj4+PiAgICAJ
LyogUmVnaXN0ZXIgdGhlIGhkbWkgY29kZWMgY29udHJvbCBjb21wb25lbnQgKi8KPj4KPj4gVGVj
aG5pY2FsbHkgdGhlIGZpeCBpcyBPSywg4oCmCj4gCj4gSSBkb3VidCBpdC4KPiAKPiBIb3cgY2Fu
IGEgc25kX3NvY191bnJlZ2lzdGVyX2NvbXBvbmVudChkZXYpIGNhbGwgZXZlciBmaXQgdG8gYSBm
YWlsZWQKPiBzbmRfc29jX3JlZ2lzdGVyX2NvbXBvbmVudCgpIGNhbGwgKGFjY29yZGluZyB0byB0
aGUgcHJlc2VudGVkIHN1Z2dlc3Rpb24pPwo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L3Y3LjItcmMxL3NvdXJjZS9zb3VuZC9zb2MvbWVzb24vYWl1LmMjTDI0MC1MMzE1CgpUaGUg
cmVwbHkgd2FzIGJhc2VkIG9uIHRoZSBmYWN0IHRoYXQgbG9va2luZyBhdCAKJ3NuZF9zb2NfdW5y
ZWdpc3Rlcl9jb21wb25lbnQnIHRoYXQncyBhIG1hY3JvIGZvciAKJ3NuZF9zb2NfdW5yZWdpc3Rl
cl9jb21wb25lbnRfYnlfZHJpdmVyJy4gVGhlIGxhdHRlciBjeWNsZXMgdGhyb3VnaCBhbGwgCnJl
Z2lzdGVyZWQgY29tcG9uZW50cyBhbmQgaWYgbm90aGluZyBpcyBmb3VuZCByZWxhdGVkIHRvIHRo
ZSBnaXZlbiBkZXYsIAp0aGVuIGl0IHJlc3VsdHMgaW4gYSBuby1vcC4KU28gY2FsbGluZyAnc25k
X3NvY191bnJlZ2lzdGVyX2NvbXBvbmVudCcgb24gYSBmYWlsZWQgCidzbmRfc29jX3JlZ2lzdGVy
X2NvbXBvbmVudCcgbG9va2VkIGhhcm1sZXNzIHRvIG1lLgoKV2hhdCBkaWQgSSBtaXNzPwoKLS0g
ClZhbGVyaW8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
