Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD516C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Feb 2022 13:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BiMr2e+tRuaCEXi1ikBb2hplEWazd/QZfYQWmSpLWCE=; b=p3IF2BN59/Y4Oq
	J5slZgnzTdX3p919o7hTJFiGS9zhQrForkwTec7td8btcVs8bDv092FUeUo+/5cV6/vNlu03VFbAO
	/Cdfwj2xj51qBewawPHulefl8lLIcLNoU5Yt5OMaR0MlmLeFlY9LwB1NB+kOSn9YenZswVqwwFndQ
	MfiFUjJmTu0ObHJjb7BfCjDK64OL6X9jIiJ5lDvjwckQbyVxxBbr8qN2LLr4f3cptnhA0f0IwSJBZ
	HsZgXiNlt7HXmB9rizSdX9JmFHIL9l28gXkWBMgQzbFYhhfuVTLA54osClViDL0v5BzjtlZyp7IL2
	I9n3UVnvQT90O04efzsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVOY-009jVp-O9; Tue, 22 Feb 2022 13:39:58 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVOM-009jUV-MB; Tue, 22 Feb 2022 13:39:48 +0000
Received: by mail-ej1-x631.google.com with SMTP id bg10so43056263ejb.4;
 Tue, 22 Feb 2022 05:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=wO4v/QlFW87aCrMs0PJAWecNmHDcvu/RVCXmt5Yo57I=;
 b=dytZ97GIYv2yp8rb1vZzuHAiylPKRgBSsdfKO1mQpzNLNQLIPzZs+pu3Fx/BiEt3q7
 WZrLeOMxorYig9DlL9JNrTWwCVlHnQ5q7RMV4/ug8NGtFsUtYXCVmOGAZA7OkrMVEFS/
 tMlOhqGCQq3W9K5EVTpHEfUZ6j4SARvBzp8TTkYFk8jI0TFD082i00Xc8cILzS+va7Q4
 g4lb39KO5S912vMorOIp0NemsFk9qQUksOOo/bjuPKh32t27qwVbbuUidXt4FAInYnLh
 Pmxaqhc+1qlgo1NbyR59VpOxgXGo0jf5HdQEYhUZsiT/KqUHjzeBYU7H4Nuij4leTeUd
 J7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=wO4v/QlFW87aCrMs0PJAWecNmHDcvu/RVCXmt5Yo57I=;
 b=x6ybmlo5VhStNVB4Yr7Fx4YpQSLsrq4K0PO2Rv1cFr+2HKL6qt/O/lsksC0Hotfvuy
 vL2yumFQmRPsGe2uVTf7Hl5+zGaL6iDa95nAWHImopTETD4UAAVeegWcFzMQPFaGZ3xJ
 aCjnKOTw0c1jQLGzOm+F9zgCjn9zhx1ruRdWmxbAYyjnoaewEmryaifjhuHK+hvBhEkX
 uoNBJCTjrx3AKaUaUSbT0F+WLDcCPz/pWXtbHPxy6AGg+LKzuzScJL4Q1sHd+6GF/sYu
 2upF+kl075upkpPpDTLcy0OcZH1UnshLOBDgiTC+p+xpE+vOS1y9jmjb4EsC78w2r23v
 Q3Uw==
X-Gm-Message-State: AOAM5320sXbnbEQisJqft2k8c7NfB4d0pWb/rtApKzuNNzmW/kLsYbqI
 k5ylEJDn1qsYu4Bbdw1cZ48=
X-Google-Smtp-Source: ABdhPJyM+HUuiKXN0cERbN/FPM9bV7YF+kgaeOKN0F6Mmx4/HqsfAGxKpjGU972rrh3JHKqHwJS3Tw==
X-Received: by 2002:a17:907:205a:b0:6cf:ced7:4e73 with SMTP id
 pg26-20020a170907205a00b006cfced74e73mr19715332ejb.536.1645537185270; 
 Tue, 22 Feb 2022 05:39:45 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:6da4:30d2:336:b924?
 (p200300ea8f4d2b006da430d20336b924.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:6da4:30d2:336:b924])
 by smtp.googlemail.com with ESMTPSA id qo24sm2923624ejb.92.2022.02.22.05.39.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 05:39:44 -0800 (PST)
Message-ID: <9e89e32f-e854-217d-3263-47e87a8fe783@gmail.com>
Date: Tue, 22 Feb 2022 14:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
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
 <288225b9-85e0-0c46-5d8b-c91f76c796e5@gmail.com>
 <f0eeb2f4-b47d-f0d8-2169-388899d1cfdf@suse.de>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 5/6] auxdisplay: add support for Titanmec TM1628 7
 segment display controller
In-Reply-To: <f0eeb2f4-b47d-f0d8-2169-388899d1cfdf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_053946_750418_DFECA9EF 
X-CRM114-Status: GOOD (  22.99  )
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

T24gMjIuMDIuMjAyMiAxMzoxNiwgQW5kcmVhcyBGw6RyYmVyIHdyb3RlOgo+IE9uIDIyLjAyLjIy
IDEwOjQ0LCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6Cj4+IE9uIDIyLjAyLjIwMjIgMDk6MTksIEdl
ZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPj4+IEhpIEhlaW5lciwKPj4+Cj4+PiBPbiBNb24sIEZl
YiAyMSwgMjAyMiBhdCA5OjI2IFBNIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5j
b20+IHdyb3RlOgo+Pj4+IFRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciB0aGUgVGl0YW5tZWMg
VE0xNjI4IDcgc2VnbWVudCBkaXNwbGF5Cj4+Pj4gY29udHJvbGxlci4gSXQncyBiYXNlZCBvbiBw
cmV2aW91cyBSRkMgd29yayBmcm9tIEFuZHJlYXMgRsOkcmJlci4KPj4+PiBUaGUgUkZDIHZlcnNp
b24gcGxhY2VkIHRoZSBkcml2ZXIgaW4gdGhlIExFRCBzdWJzeXN0ZW0sIGJ1dCB0aGlzIHdhcwo+
Pj4+IE5BSydlZCBieSB0aGUgTEVEIG1haW50YWluZXIuIFRoZXJlZm9yZSBJIG1vdmVkIHRoZSBk
cml2ZXIgdG8KPj4+PiAvZHJpdmVycy9hdXhkaXNwbGF5IHdoYXQgc2VlbXMgbW9zdCByZWFzb25h
YmxlIHRvIG1lLgo+Pj4+Cj4+Pj4gRnVydGhlciBjaGFuZ2VzIHRvIHRoZSBSRkMgdmVyc2lvbjoK
Pj4+PiAtIERyaXZlciBjYW4gYmUgYnVpbHQgYWxzbyB3L28gTEVEIGNsYXNzIHN1cHBvcnQsIGZv
ciBkaXNwbGF5cyB0aGF0Cj4+Pj4gICBkb24ndCBoYXZlIGFueSBzeW1ib2xzIHRvIGJlIGV4cG9z
ZWQgYXMgTEVEJ3MuCj4+Pj4gLSBTaW1wbGlmaWVkIHRoZSBjb2RlIGFuZCByZXdyb3RlIGEgbG90
IG9mIGl0Lgo+Pj4+IC0gRHJpdmVyIGlzIG5vdyBraW5kIG9mIGEgTVZQLCBidXQgZnVuY3Rpb25h
bGl0eSBzaG91bGQgYmUgc3VmZmljaWVudAo+Pj4+ICAgZm9yIG1vc3QgdXNlIGNhc2VzLgo+Pj4+
IC0gVXNlIHRoZSBleGlzdGluZyA3IHNlZ21lbnQgc3VwcG9ydCBpbiB1YXBpL2xpbnV4L21hcF90
b183c2VnbWVudC5oCj4+Pj4gICBhcyBzdWdnZXN0ZWQgYnkgR2VlcnQgVXl0dGVyaG9ldmVuLgo+
Pj4+Cj4+Pj4gTm90ZTogVGhlcmUncyBhIG51bWJlciBvZiBjaGlwcyBmcm9tIG90aGVyIG1hbnVm
YWN0dXJlcnMgdGhhdCBhcmUKPj4+PiAgICAgICBhbG1vc3QgaWRlbnRpY2FsLCBlLmcuIEZENjI4
LCBTTTE2MjguIE9ubHkgZGlmZmVyZW5jZSBJIHNhdyBzbwo+Pj4+ICAgICAgIGZhciBpcyB0aGF0
IHRoZXkgcGFydGlhbGx5IHN1cHBvcnQgb3RoZXIgZGlzcGxheSBtb2Rlcy4KPj4+PiAgICAgICBU
TTE2Mjg6IDZ4MTIsIDd4MTEKPj4+PiAgICAgICBTTTE2MjhDOiA0eDEzLCA1eDEyLCA2eDExLCA3
eDEwCj4+Pj4gICAgICAgRm9yIHR5cGljYWwgZGlzcGxheXMgb24gZGV2aWNlcyB1c2luZyB0aGVz
ZSBjaGlwcyB0aGlzCj4+Pj4gICAgICAgZGlmZmVyZW5jZSBzaG91bGRuJ3QgbWF0dGVyLgo+Pj4+
Cj4+Pj4gU3VjY2Vzc2Z1bGx5IHRlc3RlZCBvbiBhIFRYMyBNaW5pIFRWIGJveCB0aGF0IGhhcyBh
biBTTTE2MjhDIGFuZCBhCj4+Pj4gZGlzcGxheSB3aXRoIDQgZGlnaXRzIGFuZCA3IHN5bWJvbHMu
Cj4+Pj4KPj4+PiBUZXN0ZWQtYnk6IENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRA
Z21haWwuY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJA
c3VzZS5kZT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFA
Z21haWwuY29tPgo+Pj4KPj4+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPj4+Cj4+Pj4gLS0tIC9k
ZXYvbnVsbAo+Pj4+ICsrKyBiL2RyaXZlcnMvYXV4ZGlzcGxheS90bTE2MjguYwo+Pj4KPj4+PiAr
c3RhdGljIGludCB0bTE2Mjhfc2hvd190ZXh0KHN0cnVjdCB0bTE2MjggKnMpCj4+Pj4gK3sKPj4+
PiArICAgICAgIHN0YXRpYyBTRUc3X0NPTlZFUlNJT05fTUFQKG1hcF9zZWc3LCBNQVBfQVNDSUk3
U0VHX0FMUEhBTlVNKTsKPj4+Cj4+PiBUaGlzIG1hcHBpbmcgY2FuIG5vdCBiZSBvdmVycmlkZGVu
IGJ5IHRoZSB1c2VyLiAgSXMgdGhlcmUgYW55Cj4+PiBzcGVjaWZpYyByZWFzb24geW91IGRpZG4n
dCBtYWtlIHRoZSBtYXBwaW5nIGNvbmZpZ3VyYWJsZSBmcm9tIHN5c2ZzLAo+Pj4gY2ZyLiBtYXBf
c2VnN197c2hvdyxzdG9yZX0oKSBpbiBpbmNsdWRlL3VhcGkvbGludXgvbWFwX3RvXzdzZWdtZW50
Lmg/Cj4+Pgo+Pgo+PiBUaGUgbW9yZSBmZWF0dXJlcyBhbiBpbml0aWFsIGRyaXZlciB2ZXJzaW9u
IGluY2x1ZGVzLCB0aGUgbW9yZSBkaXNjdXNzaW9uCj4+IHRvcGljcyBwb3AgdXAgYW5kIG1ha2Ug
aXQgbGVzcyBsaWtlbHkgdGhhdCB3ZSBlbmQgdXAgd2l0aCBhdCBsZWFzdCBzb21ldGhpbmcuCj4+
IEkgdGhpbmsgdGhlcmUncyBhIHJlYXNvbiB3aHkgdGhlIGRyaXZlciB3YXMgcmVzdGluZyBzaW5j
ZSB0aGUgaW5pdGlhbAo+PiBhdHRlbXB0IDIgeXJzIGFnby4gVGhlcmVmb3JlIEknZCBsaWtlIHRv
IGtlZXAgaXQgYXMgYSBNVlAuIAo+PiBJZiBzb21lYm9keSBzaG91bGQgaGF2ZSB0aGUgbmVlZCBm
b3IgYWRkLW9uIGZlYXR1cmVzLCB0aGVuIHRoZXkgY2FuIGJlCj4+IGFkZGVkIGxhdGVyLgo+IAo+
IEFzIEkgcG9pbnRlZCBvdXQgaW4geW91ciB2MSwgSSBkaWQgaW1wbGVtZW50IGFsbCB0aGF0IGFs
cmVhZHksIGFzIHdhcwo+IHJlcXVlc3RlZCBieSBHZWVydCBvbiBteSBSRkM6Cj4gCj4gaHR0cHM6
Ly9naXRodWIuY29tL2FmYWVyYmVyL2xpbnV4L2NvbW1pdC9iYmVjZjk1MTM0OGM3ZGU4YmE5MjJj
NmMwMDJhMDkzNjliNzE3ZDgyCj4gCkkgZG9uJ3Qgd2FudCB0byBwcm92ZSBob3cgbWFueSBBUEkn
cyBJIG1hc3RlciwgYnV0IGdpdmUgdXNlcnMgd2hhdCB0aGV5IG5lZWQuCkFuZCB0aGF0J3Mgc2lt
cGx5OgotIGNvbnRyb2wgc3ltYm9scyBmcm9tIGtlcm5lbCBvciB1c2VyIHNwYWNlIC0+IExFRCBj
bGFzcyBzeXNmcyBhdHRyaWJ1dGVzIC8gdHJpZ2dlcnMKLSB3cml0ZSB0ZXh0IChtYWlubHkgbnVt
YmVycykgdG8gZGlzcGxheSAtPiBzeXNmcyBhdHRyaWJ1dGUKQW5kIHRoaXMgd2l0aCBhIG1pbmlt
dW0gb2YgY29kZSB0byBmYWNpbGl0YXRlIG1haW50ZW5hbmNlLgpBcyBjb25maXJtZWQgYnkgQ2hy
aXN0aWFuIHRoZSBwcm9wb3NlZCB2ZXJzaW9uIGdpdmVzIGhpbSB3aGF0IGhlIG5lZWRzLgoKSWYg
dGhlcmUgc2hvdWxkIGJlIGFjdHVhbGx5IGEgZGVtYW5kIGZvciBmZWF0dXJlcyBsaWtlIGRpbW1p
bmcgY29udHJvbCwgdGhlbiBpdApjYW4gYmUgYWRkZWQgbGF0ZXIgKGUuZy4geW91IGNvdWxkIGFk
ZCBpdCBiYXNlZCBvbiB0aGUgY29kZSB5b3Ugd3JvdGUgYWxyZWFkeSkuCgo+IFJlZ2FyZHMsCj4g
QW5kcmVhcwo+IApIZWluZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
