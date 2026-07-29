Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CACC54F51
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2026 14:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLdTngQd8Su5Db5xHazvaWlRWT/SXCmqnWEj315P53A=; b=f70QuZDeVGaDoE
	XDekg/q/lAqcdaVPKFPVZMEsa6f/2KEJKjgsdh7B9dezkc0PpdOb9Hs7iemcUxiGyQ1v0aainY7zJ
	PlXNmm8fqQ2++Ng475Rns1gS76Iqz5E2mtTiqNE3xnMV8oxfdToMg3TE37d4JzeKwuSbqbPoCdp3t
	jGU48lhcY5IPx/T5r3MJyrJXOUk7AHjJ7Q701GFjG5IQ+zDTUIlBscEiWtxSR+E850XhANE5rECoX
	gH4dcwbthhpFTtehKpJLCArIbyggVwXKzATVSFIOLmVNdmhlgST1kAt+LbsctBzG/jA4l3XHbVxIU
	lSmYzhZMGG/i/WGPXRaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp59i-00000008FUz-2AWm;
	Wed, 29 Jul 2026 14:21:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp59h-00000008FUn-3hm8
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Jul 2026 14:21:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CF066001D;
	Wed, 29 Jul 2026 14:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DDF1F000E9;
	Wed, 29 Jul 2026 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785334868;
	bh=nNueIrEsSi3c9BAhVItDdB9b03ZyAuLnkKBHCRTmYyY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P1PGZVkEFVNuoLlJbIgq+wn/17GvotMNoKo+0A+d/Y4oXfk3qkY4XZYKjg0o/SUzB
	 4o/2FhA9jxm2LYbUIFlP+X/7m9IgxMK2TIVhA1DC9seae2UmEWostJZT/G6i/wVgcC
	 aCspKlSIxFxKsd2SzyzU7gpEbHERTlYGYG6QMgd5bWDwGYiQ3P3eI+GA18GsDDC4ed
	 a3cIxIckrdI8SkYut1nyneAPAgACo/zxuO4ujcGYYWMpmTeP7KVwitrjLP0uKycXQ3
	 xno+EELXjrzdF4bPFWLRFcK/9gzbAmNIteLdVr2jTLJFKaHVYQGfMVYhY+uo4EBFwl
	 V6vHc0Sjrb1Dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: amlogic: add support for Orbbec Zora
 P1
To: "Alberto Robazza" <robazzalberto@gmail.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729141234.65037-4-robazzalberto@gmail.com>
References: <20260729141234.65037-1-robazzalberto@gmail.com>
 <20260729141234.65037-4-robazzalberto@gmail.com>
Date: Wed, 29 Jul 2026 14:21:07 +0000
Message-Id: <20260729142108.65DDF1F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIEhhcmR3YXJlIHBpbiBj
b25mbGljdCBvbiBHUElPWF8xNiwgd2hpY2ggaXMgc2ltdWx0YW5lb3VzbHkgYXNzaWduZWQgYXMg
YW4gU0RJTyByZXNldCBHUElPIGFuZCBhIFBXTV9FIGNsb2NrIG91dHB1dC4KLSBbTG93XSBUaGUg
b3ZlcnJpZGRlbiAnbGVkLWJsdWUnIG5vZGUgZmFpbHMgdG8gZGVsZXRlIHRoZSBpbmhlcml0ZWQg
J2xhYmVsJyBwcm9wZXJ0eSwgY2F1c2luZyB0aGUgTEVEIHN5c2ZzIGRldmljZSBuYW1lIHRvIGlu
Y29ycmVjdGx5IHJlbWFpbiAnbjI6Ymx1ZScgYW5kIGlnbm9yaW5nIHRoZSBuZXcgJ2NvbG9yJyBh
bmQgJ2Z1bmN0aW9uJyBwcm9wZXJ0aWVzLgotLQoKLS0tIFBhdGNoIFszXTogW1BBVENIIHY0IDMv
M10gYXJtNjQ6IGR0czogYW1sb2dpYzogYWRkIHN1cHBvcnQgZm9yIE9yYmJlYyBab3JhIFAxIC0t
LQpjb21taXQgNDJkZDNlY2JjODlhMWU0MmFhYmJmZDVhYTg2YjgwY2Y0ZDVjYjE4MQpBdXRob3I6
IEFsYmVydG8gUm9iYXp6YSA8cm9iYXp6YWxiZXJ0b0BnbWFpbC5jb20+Cgphcm02NDogZHRzOiBh
bWxvZ2ljOiBhZGQgc3VwcG9ydCBmb3IgT3JiYmVjIFpvcmEgUDEKClRoZSBPcmJiZWMgWm9yYSBQ
MSBpcyBhbiBBMzExRCBib2FyZCBtb2RkZWQgZnJvbSB0aGUgT0RST0lELU4yLiBUaGlzIGNvbW1p
dAphZGRzIGEgbmV3IGRldmljZSB0cmVlIHRoYXQgYnVpbGRzIG9uIG1lc29uLWcxMmItYTMxMWQu
ZHRzaSBhbmQKbWVzb24tZzEyYi1vZHJvaWQtbjIuZHRzaSwgYWRkaW5nIGJvYXJkLXNwZWNpZmlj
IEdQSU8gd2lyaW5nIGZvciBXaS1GaS9CVAphbmQgbW9kaWZ5aW5nIHRoZSBMRUQgY29uZmlndXJh
dGlvbi4KCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1n
MTJiLXpvcmEtcDEuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmIt
em9yYS1wMS5kdHMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAu
LjZlNjk2ZGRiY2FmZWEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljL21lc29uLWcxMmItem9yYS1wMS5kdHMKClsgLi4uIF0KCj4gKwlsZWRzIHsKPiAr
CQkvKiBTdGF0dXMgbGVkIG9uIFpvcmEgaXMgYWN0dWFsbHkgZ3JlZW4sIHNhbWUgcGluIGFzIE4y
LCBidXQgcmV2ZXJzZWQgcG9sYXJpdHkgKi8KPiArCQlsZWQtYmx1ZSB7Cj4gKwkJCWZ1bmN0aW9u
ID0gTEVEX0ZVTkNUSU9OX1NUQVRVUzsKPiArCQkJY29sb3IgPSA8TEVEX0NPTE9SX0lEX0dSRUVO
PjsKPiArCQkJZ3Bpb3MgPSA8JmdwaW9fYW8gR1BJT0FPXzExIEdQSU9fQUNUSVZFX0xPVz47Cgpb
U2V2ZXJpdHk6IExvd10KV2lsbCB0aGUgTEVEIHN1YnN5c3RlbSBpZ25vcmUgdGhlIG5ldyBjb2xv
ciBhbmQgZnVuY3Rpb24gcHJvcGVydGllcyBoZXJlPwoKU2luY2UgdGhpcyBub2RlIG92ZXJyaWRl
cyBsZWQtYmx1ZSBmcm9tIHRoZSBiYXNlIG1lc29uLWcxMmItb2Ryb2lkLW4yLmR0c2kKKHdoaWNo
IHNldHMgbGFiZWwgPSAibjI6Ymx1ZSIpLCBub3QgZXhwbGljaXRseSByZW1vdmluZyB0aGUgbGFi
ZWwgd2l0aAovZGVsZXRlLXByb3BlcnR5LyBsYWJlbDsgbWVhbnMgdGhlIG9yaWdpbmFsIGxhYmVs
IGlzIGluaGVyaXRlZC4KCkluIGxlZF9wYXJzZV9md25vZGVfcHJvcHMoKSwgaWYgYSBsYWJlbCBp
cyBwcmVzZW50LCBpdCB1c2VzIHRoYXQgZXhjbHVzaXZlbHkKZm9yIHRoZSBzeXNmcyBuYW1lIGFu
ZCBpZ25vcmVzIHRoZSBjb2xvciBhbmQgZnVuY3Rpb24gcHJvcGVydGllcy4KCj4gKwkJfTsKPiAr
CX07Cj4gKwo+ICsJc2Rpb19wd3JzZXE6IHNkaW8tcHdyc2VxIHsKPiArCQljb21wYXRpYmxlID0g
Im1tYy1wd3JzZXEtc2ltcGxlIjsKPiArCQlyZXNldC1ncGlvcyA9IDwmZ3BpbyBHUElPWF8xNiBH
UElPX0FDVElWRV9MT1c+Owo+ICsJCWNsb2NrcyA9IDwmY2xvY2tfMzI3Njg+Owo+ICsJCWNsb2Nr
LW5hbWVzID0gImV4dF9jbG9jayI7Cj4gKwl9OwoKWyAuLi4gXQoKPiArJnB3bV9lZiB7Cj4gKwlz
dGF0dXMgPSAib2theSI7Cj4gKwlwaW5jdHJsLTAgPSA8JnB3bV9lX3BpbnM+OwoKW1NldmVyaXR5
OiBIaWdoXQpEb2VzIHRoaXMgY3JlYXRlIGEgaGFyZHdhcmUgcGluIGNvbmZsaWN0IG9uIEdQSU9Y
XzE2PwoKVGhlIHNkaW9fcHdyc2VxIG5vZGUgZXhwbGljaXRseSByZXF1ZXN0cyBHUElPWF8xNiBh
cyBhIHJlc2V0IEdQSU8uIEF0IHRoZQpzYW1lIHRpbWUsIHB3bV9lZiBjbGFpbXMgcHdtX2VfcGlu
cy4gT24gQW1sb2dpYyBHMTJBL0cxMkIgcGxhdGZvcm1zLCB0aGUKcHdtX2VfcGlucyBncm91cCBt
YXBzIGRpcmVjdGx5IHRvIEdQSU9YXzE2LgoKVGhpcyBsb29rcyBsaWtlIHRoZSBleGFjdCBzYW1l
IHBpbiBpcyByZXF1ZXN0ZWQgZm9yIHR3byBpbmNvbXBhdGlibGUgcm9sZXMsCndoaWNoIG1pZ2h0
IGNvbmZsaWN0IGJldHdlZW4gdGhlIEdQSU8gYW5kIHBpbmN0cmwgc3Vic3lzdGVtcyBhbmQgcHJl
dmVudCB0aGUKV2ktRmkgbW9kdWxlIGZyb20gd29ya2luZy4KCj4gKwlwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiOwo+ICt9Owo+ICsKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MjkxNDEyMzQuNjUwMzctMS1yb2JhenphbGJlcnRv
QGdtYWlsLmNvbT9wYXJ0PTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
