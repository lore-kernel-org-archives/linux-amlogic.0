Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729A0EA4E04
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2026 13:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NG0MxBuNDsOr1KOS63GtYNHjWr7fhJqRDpv6YWN67uo=; b=WD24FCHAAu5tbP
	o52VcV4Hm1HFbzhiH0KyFdLQh9AWAmTnpbejAuGxA8UiTILGEvzMNLwiDQ4yY3mtHXYOi91J2i6wC
	9MgXwJLudg+uaUaQvk41XvfskA6Lg1Y4/IVNL1nZnTNvEx0M+e+lz3N4RLdHjbf0HqgAcwudCq7U6
	ZduJ0Kty5nS6h43FPblYmtdAP1pJrBXpxAqehdtghbaKtARH3b1ZkLCtpN18U2q4Hbjq6NWyypX/H
	Ngti3il7UvH8b0v/vQK9AflNrnVlj+clhdQB1DshRlx13l1iDiNUiTzjtbvbKKgUjlZcYmekBFxmu
	JbIYsPDWnkS/0E2VIYhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3o2-0000000DBuf-1BZF;
	Mon, 02 Mar 2026 13:59:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3nz-0000000DBuS-2Iq5;
	Mon, 02 Mar 2026 13:59:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BAA160018;
	Mon,  2 Mar 2026 13:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA973C2BC87;
	Mon,  2 Mar 2026 13:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772459966;
	bh=viU66Yyaj99zg2CuwP4OxpKVWBfUfWva6xshngJ9Jv0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZsGoKkT8vtmA9t5JzutKLMdYVu6V8t4mPz0rxKLrPB7CPrVwXo5DZuKKhm3VOMxV9
	 QLaNZh4MYEUrUOuePyKB1g3FlsYe/W1xY5tiseoorjkLCzQc/f3jicPxR9A+hEBa4x
	 5LnZ4evaLzgv5N8MHNR4Vkh3UXaQru0ksBWedZLMIxo3c0EE/B+VRBe2O151cNAGiF
	 tKecTw310DbF4bwcV8LVEc0l+dg1Wh6s/zF5JSGHyrL4Yyif4QFrNGajG3yXBiaVBD
	 3POpmrekZYBVxljx4N9q7BJMQg8U0WxkJmX57ayU3k2Bbmxg4j9cTB3efvgWIXlrdJ
	 1A2PjX3qAGU9w==
Message-ID: <49b3a87d-7ea0-4da1-871e-35ddf5d5b454@kernel.org>
Date: Mon, 2 Mar 2026 14:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] dt-bindings: iio: adc: amlogic,meson-saradc: add
 S4 compatible
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Nick Xie <nick@khadas.com>, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com, krzk+dt@kernel.org,
 jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, linux-iio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xieqinick@gmail.com
References: <20260228065840.702651-1-nick@khadas.com>
 <20260228065840.702651-2-nick@khadas.com>
 <20260228-quirky-lemon-reindeer-1045f6@quoll>
 <CAFBinCAkxO4HoN0Cw0Fc2B3KRLLJqso1p5+qjNN_E0c26VOf2g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAFBinCAkxO4HoN0Cw0Fc2B3KRLLJqso1p5+qjNN_E0c26VOf2g@mail.gmail.com>
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

T24gMDIvMDMvMjAyNiAxMjo1OCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBLcnp5
c3p0b2YsCj4gCj4gT24gU2F0LCBGZWIgMjgsIDIwMjYgYXQgMTI6MTjigK9QTSBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBPbiBTYXQsIEZlYiAyOCwg
MjAyNiBhdCAwMjo1ODozN1BNICswODAwLCBOaWNrIFhpZSB3cm90ZToKPj4+IEFkZCB0aGUgY29t
cGF0aWJsZSBzdHJpbmcgZm9yIHRoZSBTQVJBREMgKFN1Y2Nlc3NpdmUgQXBwcm94aW1hdGlvbgo+
Pj4gUmVnaXN0ZXIgQURDKSBJUCBibG9jayBmb3VuZCBpbiB0aGUgQW1sb2dpYyBNZXNvbiBTNCBT
b0MuCj4+Cj4+IC4uLiB3aGljaCBpcyBmdWxseSBjb21wYXRpYmxlIHdpdGggZzEyYT8KPj4KPj4g
V3JpdGUgcHJvcGVyIGV4cGxhbmF0aW9ucy4KPiBXb3VsZCB5b3UgYmUgZmluZSB3aXRoOgo+ICJU
aGVyZSBhcmUgbm8ga25vd24gZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGUgU0FSQURDIG9uIFM0IGFu
ZCB0aGUgb25lCj4gb24gRzEyQS4gSW4gdGhlIHBhc3QgZGlmZmVyZW5jZXMgYmV0d2VlbiBTQVJB
REMgb24gdGhlIGRpZmZlcmVudCBTb0NzCj4gZ2VuZXJhdGlvbnMgaGF2ZSBiZWVuIHVuY292ZXJl
ZCBsYXRlLCBtZWFuaW5nIHRoYXQgYSBkZWRpY2F0ZWQKPiBjb21wYXRpYmxlIHN0cmluZyBoYXMg
cHJvdmVuIHRvIGJlIHVzZWZ1bC4iCgpObywgbGFzdCBzZW50ZW5jZSBpcyByZWR1bmRhbnQuIFlv
dSBkbyBub3QgbmVlZCB0byBleHBsYWluIGluIHRoZSBjb21taXQKbXNnIHJ1bGVzIG9mIGJpbmRp
bmdzLCBiZWNhdXNlIHRoZXkgYXJlIG9idmlvdXMva25vd24uIFlvdSBuZWVkIHRvCmV4cGxhaW4g
dGhlIGhhcmR3YXJlLCBlLmcuIGluIHRoaXMgY2FzZSB0aGUgY29tcGF0aWJpbGl0eSBiZXR3ZWVu
IGRldmljZXMuCgo+IAo+IERvIHlvdSBhbHNvIHJlcXVpcmUgTmljayB0byBhZGQgYW1sb2dpYyxt
ZXNvbi1nMTJhLXNhcmFkYyBhcyBmYWxsYmFjawo+IGNvbXBhdGlibGUgc3RyaW5nIGZvciBhbWxv
Z2ljLG1lc29uLXM0LXNhcmFkYz8KPiAKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIFhpZSA8
bmlja0BraGFkYXMuY29tPgo+Pj4gLS0tCj4+PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaWlv
L2FkYy9hbWxvZ2ljLG1lc29uLXNhcmFkYy55YW1sICAgICAgICB8IDEgKwo+Pj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaWlvL2FkYy9hbWxvZ2ljLG1lc29uLXNhcmFkYy55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lpby9hZGMvYW1sb2dpYyxtZXNvbi1z
YXJhZGMueWFtbAo+Pj4gaW5kZXggYmI5ODI1ZTczNDZkZC4uNTQ5NmEwZGM3MTRhYSAxMDA2NDQK
Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vYWRjL2FtbG9n
aWMsbWVzb24tc2FyYWRjLnlhbWwKPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9paW8vYWRjL2FtbG9naWMsbWVzb24tc2FyYWRjLnlhbWwKPj4+IEBAIC0yNyw2ICsy
Nyw3IEBAIHByb3BlcnRpZXM6Cj4+PiAgICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tZ3ht
LXNhcmFkYwo+Pj4gICAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWF4Zy1zYXJhZGMKPj4+
ICAgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1nMTJhLXNhcmFkYwo+Pj4gKyAgICAgICAg
ICAgICAgLSBhbWxvZ2ljLG1lc29uLXM0LXNhcmFkYwo+Pgo+PiBJZiB0aGlzIGlzIGNvbXBhdGli
bGUgd2l0aCBvdGhlciBkZXZpY2UsIHlvdSBuZWVkIHByb3BlciBmYWxsYmFjay4KPj4KPj4+ICAg
ICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxtZXNvbi1zYXJhZGMKPj4KPj4gQW5kIHRoaXMgb25l
IGlzIG5vdyBraW5kIG9mIGZha2UgLSBob3cgZG9lcyB0aGlzIGRldmljZSB1c2UgaXQ/Cj4gQXMg
eW91IGhhdmUgbm90aWNlZCBsYXRlciwgaXQgaXMgY3VycmVudGx5IG5vdCB1c2VkLgo+IENhbiB5
b3UgcGxlYXNlIGNvbmZpcm0gdGhhdCBteSB1bmRlcnN0YW5kaW5nIG9mIHRoZSBuZXh0IHN0ZXBz
IGlzIGNvcnJlY3Q6Cj4gLSB5b3UncmUgZXhwZWN0aW5nIE5pY2sgdG8gb21pdCB0aGUgYW1sb2dp
YyxtZXNvbi1zYXJhZGMgZmFsbGJhY2sKPiBjb21wYXRpYmxlIHN0cmluZyBmb3IgYW1sb2dpYyxt
ZXNvbi1zNC1zYXJhZGMKCk5vdCBvbWl0IGJ1dCByZXBsYWNlIHdpdGggcHJvcGVyIGZhbGxiYWNr
IHRvIHNwZWNpZmljIGNvbXBhdGlibGUuCgo+IC0gYW5kIHlvdSB3b3VsZCBsaWtlIHRvIHNlZSBh
bWxvZ2ljLG1lc29uLXNhcmFkYyByZW1vdmVkIChmcm9tIHRoZQo+IGJpbmRpbmdzIGFuZCAuZHRz
IGZpbGVzIHRoYXQgYXJlIGFscmVhZHkgdXBzdHJlYW0pIC0gSSB3aWxsIHRha2UgY2FyZQo+IG9m
IHRoaXMgb25jZSBTNCBzdXBwb3J0IGxhbmRzIHVwc3RyZWFtCgpUaGlzIG5vLiBJdCdzIGFuIEFC
SSwgeW91IGNhbm5vdCBjaGFuZ2UgaXQuIE5vdCB3b3J0aCBpdCwgZWl0aGVyLgoKQmVzdCByZWdh
cmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
