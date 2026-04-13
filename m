Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1400AEBFD21
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Apr 2026 09:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DDjeYHzUgTgnVM1P6NARlxk9wBytmwThmtnQ/FihXtA=; b=WjVry9o8UWVD7X
	gsB5hF6eFS4LFu8BIi+/jhYq+b5X0d7BS3hdpGfHIs52Py7WFQ/zzMbFlpVg1NFMgMnji/iYgE7mf
	uac4bmzKGuK9dMT8C8TzilNmGvB3R4ykNpBtpTuqukjnWf745LP5Qd9NVMJn0k6RMqezK8rfDLWaG
	QVRKelJQVYWv0iol5ukFN7IUmpSn+bAw7KS8EEYZ8urthcjP0q764z+tJ0O2I25zFDSHOMo3Ya/a5
	oK8UKV6QAaQr03G6QpDT1G62fhG5GbBf7st6Uz8BeYd26ojhkxGor8PLTDLVQVclThhWCIVwIXr7j
	P0feIl/g7euySVWA1QNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDJX-0000000FL2M-0dwC;
	Mon, 13 Apr 2026 09:10:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDJT-0000000FL1y-3Gqw;
	Mon, 13 Apr 2026 09:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5848440C7;
	Mon, 13 Apr 2026 09:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27EF9C116C6;
	Mon, 13 Apr 2026 09:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776071434;
	bh=SrSZiqxJwReULWnjaaQIC3mrh4DMqvNbscfFISsWAyg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=imUvg10Q336zJleZMGPGm/EmAzkgDRNQf1E8cZaoJDb+3Y0NIBnKQhGv3a/r9e2YE
	 IC7xUL2qUzzdJPBcF4xoPd4FYvxjDjv+TVQk8GSjH1WGT3fL3ydkNE5/p//l3TyPMI
	 4pTq7UrIrnwNX5qlvKiWzVGsKRpXgkBWzhm9cLEA2okFBFDSZGnQm9/y27NnehydoJ
	 qqpDU+BUn6KoPGUup+jRpEB1fwUB40CZYHGGS6Z2ikuFSbjQaH6nlGPUFD4vo6SYGJ
	 G050tX/owazGVhTCtC/yNYFJFSaFnVm/PJwV7SALSm1oIags9j4dJiCzdirb7pyxeI
	 FcCkmGUNzgN8Q==
Message-ID: <b0d81181-d4a4-4c03-8c26-c7f6e8cde70f@kernel.org>
Date: Mon, 13 Apr 2026 11:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: amlogic: clk-measure: Add A1 and T7 support
To: Jian Hu <jian.hu@amlogic.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20260410100329.3167482-1-jian.hu@amlogic.com>
 <20260410100329.3167482-3-jian.hu@amlogic.com>
 <9a4f69e7-838a-4992-af1d-46324e14eb48@kernel.org>
 <274d2abd-05b9-4dbd-b962-ff70044b8d07@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <274d2abd-05b9-4dbd-b962-ff70044b8d07@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_021035_858225_EB1DE23D 
X-CRM114-Status: GOOD (  17.67  )
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

T24gMTMvMDQvMjAyNiAxMDoyMSwgSmlhbiBIdSB3cm90ZToKPiAKPiBPbiA0LzEyLzIwMjYgNTo1
NSBQTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+
Cj4+IE9uIDEwLzA0LzIwMjYgMTI6MDMsIEppYW4gSHUgd3JvdGU6Cj4+PiBBZGQgc3VwcG9ydCBm
b3IgdGhlIEExIGFuZCBUNyBTb0MgZmFtaWx5IGluIGFtbG9naWMgY2xrIG1lYXN1cmUuCj4+Pgo+
Pj4gU2lnbmVkLW9mZi1ieTogSmlhbiBIdSA8amlhbi5odUBhbWxvZ2ljLmNvbT4KPj4+IC0tLQo+
Pj4gICBkcml2ZXJzL3NvYy9hbWxvZ2ljL21lc29uLWNsay1tZWFzdXJlLmMgfCAyNzIgKysrKysr
KysrKysrKysrKysrKysrKysrCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyNzIgaW5zZXJ0aW9ucygr
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9hbWxvZ2ljL21lc29uLWNsay1tZWFz
dXJlLmMgYi9kcml2ZXJzL3NvYy9hbWxvZ2ljL21lc29uLWNsay1tZWFzdXJlLmMKPj4+IGluZGV4
IGQ4NjJlMzBhMjQ0ZS4uMDgzNTI0NjcxYjc2IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9zb2Mv
YW1sb2dpYy9tZXNvbi1jbGstbWVhc3VyZS5jCj4+PiArKysgYi9kcml2ZXJzL3NvYy9hbWxvZ2lj
L21lc29uLWNsay1tZWFzdXJlLmMKPj4+IEBAIC03ODcsNiArNzg3LDI1OCBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IG1lc29uX21zcl9pZCBjbGtfbXNyX3M0W10gPSB7Cj4+Pgo+Pj4gICB9Owo+Pj4K
Pj4+ICtzdGF0aWMgc3RydWN0IG1lc29uX21zcl9pZCBjbGtfbXNyX2ExW10gPSB7Cj4+IEFuZCBl
eGlzdGluZyBjb2RlIHVzZXMgd2hhdCBzb3J0IG9mIGFycmF5PyBTZWVtcyB5b3Ugc2VuZCB1cyBv
YnNvbGV0ZSBvcgo+PiBkb3duc3RyZWFtIGNvZGUuCj4gCj4gCj4gVGhhbmtzIGZvciB5b3VyIHJl
dmlldy4KPiAKPiAKPiBJIGhhdmUgY2hlY2tlZCB0aGUgcHJldmlvdXMgQW1sb2dpYyBTb0MncyBj
b21taXRzLsKgU3VjaCBhcyBBbWxvZ2ljIEFYRywgCj4gRzEyQSwgQzMsIFM0Lgo+IAo+IFRoZSBj
bGtfbXNyX3h4IGVudHJ5IGlzIGFkZGVkIGFmdGVyIGxhc3QgU29DJ3MgYXJyYXksIHNvcnRlZCBi
eSAKPiBzdWJtaXNzaW4gZGF0ZSByYXRoZXIgdGhhbiBhbHBoYWJldGljYWwgb3JkZXIuCj4gCj4g
U28gSSBwbGFjZSBBMSBhbmQgVDcgYWZ0ZXIgUzQgYWNjb3JkaW5nbHkuCj4gCj4gCj4gVGhlIEEx
IGNsb2NrIGNvbnRyb2xsZXIgZHJpdmVyIHdhcyBhbHJlYWR5IHN1cHBvcnRlZCBpbiAKPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA1MjMxMzUzNTEuMTkxMzMtNy1kZHJva29zb3ZA
c2JlcmRldmljZXMucnUvCj4gCj4gSXQgaXMgYWxzbyBwcmVzZW50IGluIHRoZSBtYWlubGluZSBr
ZXJuZWw6IAo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvY2xrL21lc29uL0tjb25maWcjbjExMwo+
IAo+IAo+IFRoaXMgY2xvY2sgbWVhc3VyZSBJUCBpcyB1c2VkIHRvIG1lYXN1cmUgdGhlIGludGVy
bmFsIGNsb2NrIHBhdGhzIAo+IGZyZXF1ZW5jaWVzLMKgIGFuZCBBMSBjbG9jayBjb250cm9sbGVy
IGRyaXZlciB3YXMgc3VwcG9ydGVkLgo+IAo+IFNpbmNlIHRoZSBjb3JyZXNwb25kaW5nIGNsb2Nr
IG1lYXN1cmUgZHJpdmVyIGRvZXMgbm90IHN1cHBvcnQgQTEgeWV0LCBTbyAKPiBhZGQgQTEgY2xr
IG1zciBoZXJlLgoKTm8sIHdoYXQgcXVhbGlmaWVycyBvciBrZXl3b3JkcyBhcmUgdXNlZCBmb3Ig
ZXhpc3RpbmcgYXJyYXlzPyBJT1csCnBsZWFzZSBpbnZlc3RpZ2F0ZSBhbmQgdW5kZXJzdGFuZCB3
aHkgeW91IGFyZSBkb2luZyB0aGlzIHZlcnkgZGlmZmVyZW50CnRoYW4gZXhpc3RpbmcgY29kZS4g
TWF5YmUgYmVjYXVzZSB5b3Ugc2VudCB1cyBkb3duc3RyZWFtLCBzbyB5b3UKcmVwbGljYXRlZCBh
bGwgb3RoZXIgZG93bnN0cmVhbSBpc3N1ZXMuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
