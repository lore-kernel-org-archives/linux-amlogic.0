Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D93C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Feb 2022 09:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MRJbNAaUOXPxOMw8oGzPAA5NJkPZtGOAv2Qn6ELyeQs=; b=IEEoebhv3jy2/I
	ICHSAhdPcre2CP/cW4/QlIQynMaQY8lh6qGPQvXebClRIw8Tpi/zfi6aG0MSgBppxLXVwsUuVuIDq
	FgvDlAsiGmo5u3eGcC0RaDyIrF1CnOz+dU0wEQjXq+3dzqNt4L2RoeimnpsNegqgcg+lGTvYxlfD7
	6IKXxzgFlz8pmalAWc4fZfdYeSwErmBWy1QG8Wz+PNkl6fMaPdk/iy/3MRREeuWwY7inlUkIGBLiH
	7KcXgZojOa46Eu8VIqODV78Rlk6AZjW+rpmK6uJOVOBq0uevEY/QSQAu5bH5W6rrWZID8pOkPTaKg
	c1Nz5UqQF8AJWQ+tJVVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMRjE-008oAf-KN; Tue, 22 Feb 2022 09:45:04 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMRj2-008o8d-KZ; Tue, 22 Feb 2022 09:44:54 +0000
Received: by mail-ed1-x535.google.com with SMTP id u18so35496370edt.6;
 Tue, 22 Feb 2022 01:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=y/k/AioN9+eoLWmfmqCmaYerC3/rpiBltJOkbhRfuKo=;
 b=ggukSYH3F1aj0DqRb/pyNJ3aD9IDXokfr/6mfS3z+2TTpHy3OQu+yuBjkmHC1TJnst
 LCioxYDGsibKubf7qUMiKZ8DnJGtUGbLLHcbg+phUpEaAiUMk4Y7b0dP43e+bRYN0nfY
 OWNhAWD5Dwd9W9hG3bt11wgv7zmnaN9sv/djnqw7x4ISDsnp7R04OTpPMhwoF/icARk6
 KRNAqNa3CjERa6Wzej+W9PfoVFfSjPvOqHMfJxMpbXZxODOfDbGT5rm9BeqlEs3UtRhz
 /mRK+uhcbpC4zbHQifYsI/Vps6BJb36bBvxG9/qS5Jj40JO6LrvGchFCD1p/KVyleFRl
 Pvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=y/k/AioN9+eoLWmfmqCmaYerC3/rpiBltJOkbhRfuKo=;
 b=M5t/MvFiPO9gcJZ7bBVgq11WBLiCCLZMY/sCFQ5TQvmKptGVuex8kPCejSkMiF3D+J
 yHPetsAphyPEWW1gNwxIoCH3erCcabVpoHlXDVdprmYN4zYT3OMWUsesrhMoyQ/FI+fP
 3jvFM+eF+rJGCWazvuYfjmpa/rQHPfS87DnAVVKB3b5DWnBFoHq4SivY7pTlOeA9omUb
 BotHUowG4Z4jHngmD+7DJOreLIt1YzLCN9QBG0ajFPW2IoiQL5DQz/TLrI+1+ei9/BHa
 7CV8crTG//r+9HhlRyhEZov7BHjMPvLMQNZXGUjmgCq3Wiu1gjxDWC/dKp5vTe94q0Jh
 3Hqg==
X-Gm-Message-State: AOAM530dCwfuMXgq6OxsksAH9FZfdJLHs6e2b3rVtHCM6x05g+RRwxHZ
 Zdib4X2YqjoBPboNclx/jS4=
X-Google-Smtp-Source: ABdhPJxtKCo6VkE4slXbqR04gcY71XE2ln0AckmC+kbLRg/IAv4KvvOvkQyRYuK4fC37+ROEf9lMNg==
X-Received: by 2002:a05:6402:268c:b0:411:e086:b7d1 with SMTP id
 w12-20020a056402268c00b00411e086b7d1mr25128967edd.111.1645523091170; 
 Tue, 22 Feb 2022 01:44:51 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:5cc0:13e2:26a9:58d0?
 (p200300ea8f4d2b005cc013e226a958d0.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:5cc0:13e2:26a9:58d0])
 by smtp.googlemail.com with ESMTPSA id h8sm9759966edk.14.2022.02.22.01.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 01:44:50 -0800 (PST)
Message-ID: <288225b9-85e0-0c46-5d8b-c91f76c796e5@gmail.com>
Date: Tue, 22 Feb 2022 10:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <1f39432b-84e2-e6dc-a6b8-c48ad5cf2210@gmail.com>
 <3facc242-0ce6-9170-1fee-a5ec0a66660a@gmail.com>
 <CAMuHMdUnDQKtGuN+n-t3P8e4nf9VLB+9q8fGyCh643T4Y1Knag@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 5/6] auxdisplay: add support for Titanmec TM1628 7
 segment display controller
In-Reply-To: <CAMuHMdUnDQKtGuN+n-t3P8e4nf9VLB+9q8fGyCh643T4Y1Knag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_014452_697412_100F7448 
X-CRM114-Status: GOOD (  30.94  )
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

T24gMjIuMDIuMjAyMiAwOToxOSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEhpIEhlaW5l
ciwKPiAKPiBPbiBNb24sIEZlYiAyMSwgMjAyMiBhdCA5OjI2IFBNIEhlaW5lciBLYWxsd2VpdCA8
aGthbGx3ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+PiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBm
b3IgdGhlIFRpdGFubWVjIFRNMTYyOCA3IHNlZ21lbnQgZGlzcGxheQo+PiBjb250cm9sbGVyLiBJ
dCdzIGJhc2VkIG9uIHByZXZpb3VzIFJGQyB3b3JrIGZyb20gQW5kcmVhcyBGw6RyYmVyLgo+PiBU
aGUgUkZDIHZlcnNpb24gcGxhY2VkIHRoZSBkcml2ZXIgaW4gdGhlIExFRCBzdWJzeXN0ZW0sIGJ1
dCB0aGlzIHdhcwo+PiBOQUsnZWQgYnkgdGhlIExFRCBtYWludGFpbmVyLiBUaGVyZWZvcmUgSSBt
b3ZlZCB0aGUgZHJpdmVyIHRvCj4+IC9kcml2ZXJzL2F1eGRpc3BsYXkgd2hhdCBzZWVtcyBtb3N0
IHJlYXNvbmFibGUgdG8gbWUuCj4+Cj4+IEZ1cnRoZXIgY2hhbmdlcyB0byB0aGUgUkZDIHZlcnNp
b246Cj4+IC0gRHJpdmVyIGNhbiBiZSBidWlsdCBhbHNvIHcvbyBMRUQgY2xhc3Mgc3VwcG9ydCwg
Zm9yIGRpc3BsYXlzIHRoYXQKPj4gICBkb24ndCBoYXZlIGFueSBzeW1ib2xzIHRvIGJlIGV4cG9z
ZWQgYXMgTEVEJ3MuCj4+IC0gU2ltcGxpZmllZCB0aGUgY29kZSBhbmQgcmV3cm90ZSBhIGxvdCBv
ZiBpdC4KPj4gLSBEcml2ZXIgaXMgbm93IGtpbmQgb2YgYSBNVlAsIGJ1dCBmdW5jdGlvbmFsaXR5
IHNob3VsZCBiZSBzdWZmaWNpZW50Cj4+ICAgZm9yIG1vc3QgdXNlIGNhc2VzLgo+PiAtIFVzZSB0
aGUgZXhpc3RpbmcgNyBzZWdtZW50IHN1cHBvcnQgaW4gdWFwaS9saW51eC9tYXBfdG9fN3NlZ21l
bnQuaAo+PiAgIGFzIHN1Z2dlc3RlZCBieSBHZWVydCBVeXR0ZXJob2V2ZW4uCj4+Cj4+IE5vdGU6
IFRoZXJlJ3MgYSBudW1iZXIgb2YgY2hpcHMgZnJvbSBvdGhlciBtYW51ZmFjdHVyZXJzIHRoYXQg
YXJlCj4+ICAgICAgIGFsbW9zdCBpZGVudGljYWwsIGUuZy4gRkQ2MjgsIFNNMTYyOC4gT25seSBk
aWZmZXJlbmNlIEkgc2F3IHNvCj4+ICAgICAgIGZhciBpcyB0aGF0IHRoZXkgcGFydGlhbGx5IHN1
cHBvcnQgb3RoZXIgZGlzcGxheSBtb2Rlcy4KPj4gICAgICAgVE0xNjI4OiA2eDEyLCA3eDExCj4+
ICAgICAgIFNNMTYyOEM6IDR4MTMsIDV4MTIsIDZ4MTEsIDd4MTAKPj4gICAgICAgRm9yIHR5cGlj
YWwgZGlzcGxheXMgb24gZGV2aWNlcyB1c2luZyB0aGVzZSBjaGlwcyB0aGlzCj4+ICAgICAgIGRp
ZmZlcmVuY2Ugc2hvdWxkbid0IG1hdHRlci4KPj4KPj4gU3VjY2Vzc2Z1bGx5IHRlc3RlZCBvbiBh
IFRYMyBNaW5pIFRWIGJveCB0aGF0IGhhcyBhbiBTTTE2MjhDIGFuZCBhCj4+IGRpc3BsYXkgd2l0
aCA0IGRpZ2l0cyBhbmQgNyBzeW1ib2xzLgo+Pgo+PiBUZXN0ZWQtYnk6IENocmlzdGlhbiBIZXdp
dHQgPGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFz
IEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Cj4+IFNpZ25lZC1vZmYtYnk6IEhlaW5lciBLYWxs
d2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+Cj4gCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+
IAo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2RyaXZlcnMvYXV4ZGlzcGxheS90bTE2MjguYwo+
IAo+PiArc3RhdGljIGludCB0bTE2Mjhfc2hvd190ZXh0KHN0cnVjdCB0bTE2MjggKnMpCj4+ICt7
Cj4+ICsgICAgICAgc3RhdGljIFNFRzdfQ09OVkVSU0lPTl9NQVAobWFwX3NlZzcsIE1BUF9BU0NJ
STdTRUdfQUxQSEFOVU0pOwo+IAo+IFRoaXMgbWFwcGluZyBjYW4gbm90IGJlIG92ZXJyaWRkZW4g
YnkgdGhlIHVzZXIuICBJcyB0aGVyZSBhbnkKPiBzcGVjaWZpYyByZWFzb24geW91IGRpZG4ndCBt
YWtlIHRoZSBtYXBwaW5nIGNvbmZpZ3VyYWJsZSBmcm9tIHN5c2ZzLAo+IGNmci4gbWFwX3NlZzdf
e3Nob3csc3RvcmV9KCkgaW4gaW5jbHVkZS91YXBpL2xpbnV4L21hcF90b183c2VnbWVudC5oPwo+
IAoKVGhlIG1vcmUgZmVhdHVyZXMgYW4gaW5pdGlhbCBkcml2ZXIgdmVyc2lvbiBpbmNsdWRlcywg
dGhlIG1vcmUgZGlzY3Vzc2lvbgp0b3BpY3MgcG9wIHVwIGFuZCBtYWtlIGl0IGxlc3MgbGlrZWx5
IHRoYXQgd2UgZW5kIHVwIHdpdGggYXQgbGVhc3Qgc29tZXRoaW5nLgpJIHRoaW5rIHRoZXJlJ3Mg
YSByZWFzb24gd2h5IHRoZSBkcml2ZXIgd2FzIHJlc3Rpbmcgc2luY2UgdGhlIGluaXRpYWwKYXR0
ZW1wdCAyIHlycyBhZ28uIFRoZXJlZm9yZSBJJ2QgbGlrZSB0byBrZWVwIGl0IGFzIGEgTVZQLiAK
SWYgc29tZWJvZHkgc2hvdWxkIGhhdmUgdGhlIG5lZWQgZm9yIGFkZC1vbiBmZWF0dXJlcywgdGhl
biB0aGV5IGNhbiBiZQphZGRlZCBsYXRlci4KCj4gR3J7b2V0amUsZWV0aW5nfXMsCj4gCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgR2VlcnQKPiAKCkhlaW5lcgoKPiAtLQo+IEdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcKPiAKPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cj4gd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0Lgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
