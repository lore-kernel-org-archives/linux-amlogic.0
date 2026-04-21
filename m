Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDDFF8924E
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2026 10:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=caLjhLLxf+hxAG3hvm4i2WhNAFIVdOrv/QBwR+0EsH0=; b=gUDviTt317LicH
	D2tMJ/ccRoZcq7LTpb9DC5bshoCCgGO9qdz8IIg2Du1v8tHOcf6nogxH+A0KloMbJ15S5QAHqVSMi
	Vrzj6wUyQspmJ4kc4j5QHKtvS6XMbMQq0TihNVK/zoK4fHTZob7jrYuKzI0xCvfZxskuqAUqfeVmz
	PuOJjbZbfPWmQwGoKu6bnyvf56NS3mvRCHYHKNutEefx2fURkRhrM0KYLlrg/HckQDVMgGPpmSPAG
	E/mcwVBUNQecfzCECws/siVrqP6fsTPhEsHb6k4g3Qe17sDonzQyXBOYzN/udavrQAouR5oCuNDHJ
	kQCxj6qG6I7bthSeYjuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8Fw-00000008PuG-1Mjs;
	Tue, 21 Apr 2026 10:23:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8Fv-00000008Pu6-0e3X;
	Tue, 21 Apr 2026 10:22:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4896360133;
	Tue, 21 Apr 2026 10:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0897DC2BCB8;
	Tue, 21 Apr 2026 10:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776766977;
	bh=bqXBqcKC49eEkO8B5+eajrBk1tibKKx3p5dCM2COELU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r9r1kmMmARzRvKWuATMNaDgHPW6GZHzvy6YD4FNmto0vGx/LgrT4GiVM5yR2ptn8B
	 Q//piKG1IOMQuCoARr5ajk8UswSRcNFLMQlvG2tSY7bOD1i67VlFVybpzl++nmLG7b
	 LMXrw8Ko7Glf3vXqNzUbegRuaeU3fZqVPlbY5yMZxpczwmM8U894LTdnR6PqOixl7h
	 0SWcOQXGVMKzOA3lny9ZSyw8MHdbETnA0WydW0odWu5l20B6ZOFGaCEalhZ7DyDvHC
	 ZO0DnIoGZUyNVVKu6NVAmJ7w7KkUkPlLUK2OHw+upL+uTNtGRUnU1vMfseqZyrJjmo
	 l/CoYFUdumO4A==
Message-ID: <6cdd0baa-fc69-44dc-9871-a96fd2f16017@kernel.org>
Date: Tue, 21 Apr 2026 12:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: amlogic: add support for X98Q
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 funderscore@postmarketos.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260420061854.5421-1-christian.koever-draxl@student.uibk.ac.at>
 <20260420061854.5421-3-christian.koever-draxl@student.uibk.ac.at>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260420061854.5421-3-christian.koever-draxl@student.uibk.ac.at>
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

T24gMjAvMDQvMjAyNiAwODoxOCwgY2hyaXN0aWFuLmtvZXZlci1kcmF4bEBzdHVkZW50LnVpYmsu
YWMuYXQgd3JvdGU6Cj4gRnJvbTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxjaHJp
c3RpYW4ua29ldmVyLWRyYXhsQHN0dWRlbnQudWliay5hYy5hdD4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNocmlzdGlhbi5rb2V2ZXItZHJheGxA
c3R1ZGVudC51aWJrLmFjLmF0Pgo+IC0tLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
TWFrZWZpbGUgICAgICAgICAgfCAgIDEgKwo+ICAuLi4vYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1z
NC1zOTA1dzIteDk4cS5kdHMgfCAyNTAgKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMjUxIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC1zOTA1dzIteDk4cS5kdHMKPiAKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlIGIvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL01ha2VmaWxlCj4gaW5kZXggMTVmOWM4MTdlNTAyLi5jNzc1MjY4NGRlYTYg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlCj4gKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlCj4gQEAgLTg1LDYgKzg1LDcg
QEAgZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLWd4bS11Z29vcy1hbTMuZHRiCj4g
IGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1neG0tdmVnYS1zOTYuZHRiCj4gIGR0
Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1neG0td2V0ZWstY29yZTIuZHRiCj4gIGR0
Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1zNC1zODA1eDItYXEyMjIuZHRiCj4gK2R0
Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1zNC1zOTA1dzIteDk4cS5kdGIKPiAgZHRi
LSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLXM0LXM5MDV5NC1raGFkYXMtdmltMXMuZHRi
Cj4gIGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1zbTEtYTk1eGYzLWFpci1nYml0
LmR0Ygo+ICBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tc20xLWE5NXhmMy1haXIu
ZHRiCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC1z
OTA1dzIteDk4cS5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQtczkw
NXcyLXg5OHEuZHRzCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAu
LjI2YzYwYTRjMmE0Mwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L2FtbG9naWMvbWVzb24tczQtczkwNXcyLXg5OHEuZHRzCj4gQEAgLTAsMCArMSwyNTAgQEAKPiAr
Cj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsgT1IgTUlUKQoKCllvdSBo
YXZlIHN0aWxsIHRoZSBzYW1lIHdhcm5pbmdzIGFzIGJlZm9yZS4gIEZpeCB0aGVtIEFMTCwgbm90
IGp1c3Qgb25lCndhcm5pbmcuIEFyZSB5b3Ugc3VyZSB5b3UgdGVzdGVkIHlvdXIgd29yayB3aXRo
IHN0YW5kYXJkIHRvb2xzPwoKUGxlYXNlIHJ1biBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgb24gdGhl
IHBhdGNoZXMgYW5kIGZpeCByZXBvcnRlZAp3YXJuaW5ncy4gQWZ0ZXIgdGhhdCwgcnVuIGFsc28g
J3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLXN0cmljdCcgb24gdGhlCnBhdGNoZXMgYW5kIChwcm9i
YWJseSkgZml4IG1vcmUgd2FybmluZ3MuIFNvbWUgd2FybmluZ3MgY2FuIGJlIGlnbm9yZWQsCmVz
cGVjaWFsbHkgZnJvbSAtLXN0cmljdCBydW4sIGJ1dCB0aGUgY29kZSBoZXJlIGxvb2tzIGxpa2Ug
aXQgbmVlZHMgYQpmaXguIEZlZWwgZnJlZSB0byBnZXQgaW4gdG91Y2ggaWYgdGhlIHdhcm5pbmcg
aXMgbm90IGNsZWFyLgoKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
