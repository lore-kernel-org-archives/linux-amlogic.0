Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036BBC88E64
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Sep 2026 08:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDN0zJdLTQjFSpdntGFOMUsHZPYkKGwt5RTHHJuQDSc=; b=aOoluo4occASZM
	+U693nwFLLnOiD1uaHGXbssSBcxOWaM2JGNqlWUPYeCu+nRBp79Fm82RYdw0NmsWDfLOdI6aVf4Ij
	l7BVqbbeBYrIFgUWkVHVbqdb4tnqZFsdqOkVhiSYDBN9qS04UPRxw2R0/ezFyB31yL/63XmOsM/vW
	9vENG+f0pCBtXrzKFJC/G9bwyS6v9i4WDXXSU0NDPFChGJPJnZ+OUWMKeXpIMMjb47hgdTJytYgGZ
	SMBw05ZcT1cGfoqccWGeGXbhZzHIEaueOUEJJbkndepoXU1sWQYzh2HDoMSEsZBnqBrTtu3wB2XJz
	LVn+QVMBDuiHAK+8utOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61ta-00000002hcP-1atu;
	Mon, 14 Sep 2026 08:18:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61tY-00000002hbX-2GYm
	for linux-amlogic@lists.infradead.org;
	Mon, 14 Sep 2026 08:18:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BFECF601DB;
	Mon, 14 Sep 2026 08:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12BD21F000FF;
	Mon, 14 Sep 2026 08:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789373911;
	bh=O8+G9Pfm0w/9ObqOmZ5zn/uEd7znjr7CLXiwl43func=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kLA4qhPrTwqBND/PydyTIGQmXVJ2lZGcTqKWEviINOJkI2mo+fbavRQRfTi3TWeQm
	 nWX6STo72C0htczBarYa9i8Tu3gHGA7DzZiE9IeNkjs+noKwS1tEt5BcACYaQfdcQ2
	 7+iIIhDXSof5E4yN/GvqrhpqWqOVh1kRFnLh6e1QgLQfzuaVxxHsyjhAJrhipXOYBH
	 jCLDvm16QoJxPFrX9BU1kFSHUdRhs+8An+LQTvX3FeI4SOHFdD1IYVrkNxs02yYO1Z
	 eKKexUOR5h83cerL6eDt4tR/6HzIjm7OcYeLYh6dFFLDPdmsnzPJIP17Bg/6jEmYb9
	 ONVhBoXk/mYJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260914-b4-s4-vdec-upstream-v9-3-72fdb0d71b02@amlogic.com>
References: <20260914-b4-s4-vdec-upstream-v9-0-72fdb0d71b02@amlogic.com>
 <20260914-b4-s4-vdec-upstream-v9-3-72fdb0d71b02@amlogic.com>
Date: Mon, 14 Sep 2026 08:18:30 +0000
Message-Id: <20260914081831.12BD21F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gSW5jb21wbGV0ZSBz
Y2hlbWEgdmFsaWRhdGlvbiBjb25zdHJhaW50cyBmb3IgYGludGVycnVwdHNgIGFuZCBgaW50ZXJy
dXB0LW5hbWVzYAotLQoKY29tbWl0IDc4M2NjOWNiYTljOTM4ODk2YmE4YzZjZmM1ZGMwY2E1Njg2
ZDg1ZmIKQXV0aG9yOiBaaGVudGFvIEd1byA8emhlbnRhby5ndW9AYW1sb2dpYy5jb20+CgptZWRp
YTogZHQtYmluZGluZ3M6IEFkZCBBbWxvZ2ljIFY0TDIgdmlkZW8gZGVjb2RlcgoKRGVzY3JpYmUg
dGhlIGluaXRpYWwgc3VwcG9ydCBmb3IgdGhlIFY0TDIgc3RhdGVsZXNzIHZpZGVvIGRlY29kZXIg
ZHJpdmVyCnVzZWQgd2l0aCB0aGUgQW1sb2dpYyBTNCAoUzgwNVgyKSBwbGF0Zm9ybS4KCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hbWxvZ2lj
LHM0LXZkZWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9h
bWxvZ2ljLHM0LXZkZWMueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMDAwMC4uZDM1MGIzZTY4YTM4OQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvYW1sb2dpYyxzNC12ZGVjLnlhbWwKCj4gWyAu
Li4gXQoKPiArICByZWctbmFtZXM6Cj4gKyAgICBpdGVtczoKPiArICAgICAgLSBjb25zdDogZG9z
Cj4gKyAgICAgIC0gY29uc3Q6IGRtYwo+ICsKPiArICBpbnRlcnJ1cHRzOgo+ICsgICAgbWF4SXRl
bXM6IDIKCltTZXZlcml0eTogTWVkaXVtXQpEb2VzIHRoZSBpbnRlcnJ1cHRzIHByb3BlcnR5IGFs
c28gbmVlZCBtaW5JdGVtczogMj8gU2luY2UgbWF4SXRlbXM6IDIKaW1wbGljaXRseSBhbGxvd3Mg
bWluSXRlbXM6IDEsIHRoZSBzY2hlbWEgYWxsb3dzIGEgc2luZ2xlIGludGVycnVwdC4KCkhvd2V2
ZXIsIHRoZSBkcml2ZXIgZXhwbGljaXRseSByZXF1ZXN0cyBpbmRleCAxLiBBIGRldmljZSB0cmVl
IHdpdGggYSBzaW5nbGUKaW50ZXJydXB0IHdpbGwgcGFzcyBzY2hlbWEgdmFsaWRhdGlvbiBidXQg
Y2F1c2UgZHJpdmVyIGluaXRpYWxpemF0aW9uIHRvIGZhaWwKYXQgcnVudGltZS4KCj4gKwo+ICsg
IGludGVycnVwdC1uYW1lczoKPiArICAgIGl0ZW1zOgo+ICsgICAgICAtIGNvbnN0OiBjb3JlX2h2
ZGVjCj4gKyAgICAgIC0gY29uc3Q6IGNvcmVfdmRlYwoKPiBbIC4uLiBdCgo+ICtyZXF1aXJlZDoK
PiArICAtIGNvbXBhdGlibGUKPiArICAtIHJlZwo+ICsgIC0gcmVnLW5hbWVzCj4gKyAgLSBpbnRl
cnJ1cHRzCj4gKyAgLSBjbG9ja3MKPiArICAtIGNsb2NrLW5hbWVzCj4gKyAgLSBwb3dlci1kb21h
aW5zCj4gKyAgLSBwb3dlci1kb21haW4tbmFtZXMKPiArICAtIHJlc2V0cwo+ICsgIC0gYW1sb2dp
YyxjYW52YXMKPiArICAtIGFtbG9naWMsc2VjdXJlLW1vbml0b3IKCltTZXZlcml0eTogTWVkaXVt
XQpJcyBpbnRlcnJ1cHQtbmFtZXMgaW50ZW50aW9uYWxseSBvbWl0dGVkIGZyb20gdGhlIHJlcXVp
cmVkIGxpc3Q/CgpPdGhlciBwcm9wZXJ0aWVzIGxpa2UgcmVnLW5hbWVzIGFuZCBjbG9jay1uYW1l
cyBhcmUgcmVxdWlyZWQuIE9taXR0aW5nCmludGVycnVwdC1uYW1lcyBtYWtlcyBpdCBvcHRpb25h
bCwgd2hpY2ggZmFpbHMgdG8gZW5mb3JjZSBleHBsaWNpdCBoYXJkd2FyZQpkZXNjcmlwdGlvbiBm
b3IgbXVsdGlwbGUgaW50ZXJydXB0cy4KCj4gKwo+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFs
c2UKPiArCj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KPiArICAgICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9jbG9jay9hbWxvZ2ljLHM0LXBsbC1jbGtjLmg+Cj4gKyAgICAjaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wZXJpcGhlcmFscy1jbGtjLmg+Cj4gKyAgICAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvcG93ZXIvbWVzb24tczQtcG93ZXIuaD4KPiArICAgICNpbmNsdWRlIDxk
dC1iaW5kaW5ncy9yZXNldC9hbWxvZ2ljLG1lc29uLXM0LXJlc2V0Lmg+Cj4gKyAgICB2aWRlby1j
b2RlY0BmZTMyMDAwMCB7Cj4gKyAgICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxzNC12ZGVjIjsK
PiArICAgICAgcmVnID0gPDB4ZmUzMjAwMDAgMHgxMDAwMD4sCj4gKyAgICAgICAgICAgIDwweGZl
MDM2MDAwIDB4MjA+Owo+ICsgICAgICByZWctbmFtZXMgPSAiZG9zIiwKPiArICAgICAgICAgICAg
ICAgICAgImRtYyI7Cj4gKyAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA5MSBJUlFfVFlQRV9F
REdFX1JJU0lORz4sCj4gKyAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSA5MiBJUlFfVFlQRV9F
REdFX1JJU0lORz47Cj4gKyAgICAgIGNsb2NrcyA9IDwmY2xrY19wZXJpcGhzIENMS0lEX0RPUz4s
Cj4gKyAgICAgICAgICAgICAgIDwmY2xrY19wZXJpcGhzIENMS0lEX1ZERUNfU0VMPiwKPiArICAg
ICAgICAgICAgICAgPCZjbGtjX3BlcmlwaHMgQ0xLSURfSEVWQ0ZfU0VMPjsKCltTZXZlcml0eTog
TWVkaXVtXQpTaG91bGQgaW50ZXJydXB0LW5hbWVzIGJlIGluY2x1ZGVkIGluIHRoaXMgZXhhbXBs
ZT8gT21pdHRpbmcgaXQgcHJvdmlkZXMKYW4gaW5jb21wbGV0ZSB0ZW1wbGF0ZSBmb3IgZGV2aWNl
IHRyZWUgYXV0aG9ycy4KCj4gKyAgICAgIGNsb2NrLW5hbWVzID0gImRvcyIsCj4gKyAgICAgICAg
ICAgICAgICAgICAgImNvcmVfdiIsCj4gKyAgICAgICAgICAgICAgICAgICAgImNvcmVfaCI7Cj4g
KyAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnB3cmMgUFdSQ19TNF9ET1NfVkRFQ19JRD4sCj4gKyAg
ICAgICAgICAgICAgICAgICAgICA8JnB3cmMgUFdSQ19TNF9ET1NfSEVWQ19JRD47Cj4gKyAgICAg
IHBvd2VyLWRvbWFpbi1uYW1lcyA9ICJkb3NfdiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJkb3NfaCI7Cj4gKyAgICAgIHJlc2V0cyA9IDwmcmVzZXQgUkVTRVRfRE9TPjsKPiArICAg
ICAgYW1sb2dpYyxjYW52YXMgPSA8JmNhbnZhcz47Cj4gKyAgICAgIGFtbG9naWMsc2VjdXJlLW1v
bml0b3IgPSA8JnNtPjsKPiArICAgIH07CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTE0LWI0LXM0LXZkZWMtdXBzdHJlYW0tdjkt
MC03MmZkYjBkNzFiMDJAYW1sb2dpYy5jb20/cGFydD0zCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
