Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F322AC5CFC1
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Aug 2026 02:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZ/fj6REiJwd4qSoHCchGGPkHDtiKkA2ZVi8ZUjn5K8=; b=GJWVQuxGvS7ZlG
	fzmz3k231xPjhga9BH+gxj0yOCZlNVy7DFeMtzfS2YnbWyL67Okiq7aRdOlw6ECavCdliMNI8xLKH
	fb86pZrI2Hdl4iCbkrBuognIsuqlGaDI3duoFKu0EsGCAvF2iB8mZHqIWMer7LIQdgM5LdDN/xkO9
	rDQDjnvl0lX5Rv7g+NJkbU4IwZo1cxNXhvZDFj3N++cftSO3364vPwcVLGO3P+wJ2el8sEzdXb0M4
	EUbo1427Ey/lBdA+3gevIoApCVWQrt9iIx1W5tMc2LT1iIVAiG1fTLpgA0iidR73F8PytJNqP9USF
	7iNBrtuwznHfIACQrwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtz2f-0000000FJDE-3U6V;
	Wed, 12 Aug 2026 02:50:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtz2f-0000000FJD5-1FCV
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Aug 2026 02:50:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 61533600AE;
	Wed, 12 Aug 2026 02:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2E71F000E9;
	Wed, 12 Aug 2026 02:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786503008;
	bh=3G8bz6FArD9ag213ihkE7TWlP6mqXljmu8jO7p6LG5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d6hqhd7xplOVbI+Aj6u0kKC9ygbIOhHDtnRNBE5LnEhNj/FTHskDeRQuNC1gWmGyV
	 FWbPvaZXn1hKEtrKqkTnXj2XzXTjvetoHnM7wyhK5W4RP/WhkP/vSeorRxMVEcp4QO
	 wUl1efFoO5R9zpcyLRgPVHmjybn3oIEo1S8Pm2oSCGqcPaFqaP1J5HHSE48Zm+O/NM
	 SEWIoyGFkyjPuB+x3v6xPNGYGdxNHcf23c90DkGdSfOOsuHIKbw5iTQZvLsleP4TFh
	 UaIp6241z5YGuOx0KkAd1IREm/IPQCsFQ0pWZDiGvF2S6y1AnhlcBkX0nlZHDvDfv2
	 O4+f4REvvQ2yQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: robh@kernel.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, media-ci@linuxtv.org
In-Reply-To: <20260812-b4-s4-vdec-upstream-v7-1-3fae085861bd@amlogic.com>
References: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
 <20260812-b4-s4-vdec-upstream-v7-1-3fae085861bd@amlogic.com>
Date: Wed, 12 Aug 2026 02:50:07 +0000
Message-Id: <20260812025007.AA2E71F000E9@smtp.kernel.org>
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
MyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtIaWdoXSBU
aGUgYFNNX0xPQURfVklERU9fRldgIGNvbW1hbmQgaXMgYWRkZWQgdG8gdGhlIGVudW0gYnV0IGxh
Y2tzIHRoZSByZXF1aXJlZCBTTUMgSUQgbWFwcGluZyBpbiB0aGUgc2VjdXJlIG1vbml0b3IgY29t
bWFuZCB0YWJsZSwgbWFraW5nIGl0IGVudGlyZWx5IHVudXNhYmxlLgoKUHJlLWV4aXN0aW5nIGlz
c3VlczoKLSBbSGlnaF0gTWlzc2luZyBzeW5jaHJvbml6YXRpb24gaW4gYG1lc29uX3NtX2NhbGxf
cmVhZGAgYW5kIGBtZXNvbl9zbV9jYWxsX3dyaXRlYCBsZWFkcyB0byBzaGFyZWQgbWVtb3J5IGNv
cnJ1cHRpb24gYW5kIHJhY2UgY29uZGl0aW9ucy4KLSBbSGlnaF0gT2JqZWN0IGxpZmV0aW1lIG1p
c21hbmFnZW1lbnQgaW4gYG1lc29uX3NtX2dldGAgcmV0dXJucyBhIGRhbmdsaW5nIHBvaW50ZXIu
Ci0tCgotLS0gUGF0Y2ggWzFdOiBbUEFUQ0ggdjcgMS82XSBmaXJtd2FyZTogbWVzb246IHNtOiB2
aWRlbyBmaXJtd2FyZSBsb2FkaW5nIHZpYSBzZWN1cmUgbW9uaXRvciAtLS0KY29tbWl0IGVlMGQ5
YTg4NGJlMTc3YmU2OWYxNTBiNzdiMWYzNTAzYzMyOGVkZmEKQXV0aG9yOiBaaGVudGFvIEd1byA8
emhlbnRhby5ndW9AYW1sb2dpYy5jb20+CgpmaXJtd2FyZTogbWVzb246IHNtOiB2aWRlbyBmaXJt
d2FyZSBsb2FkaW5nIHZpYSBzZWN1cmUgbW9uaXRvcgoKQWRkIFNNX0xPQURfVklERU9fRlcgdG8g
dGhlIHNlY3VyZSBtb25pdG9yIGNvbW1hbmQgZW51bSB0byBhbGxvdyBkZWNvZGVyCmRyaXZlcnMg
dG8gbG9hZCBmaXJtd2FyZSB0aHJvdWdoIHRoZSBtZXNvbl9zbSBpbnRlcmZhY2UuCgo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmggYi9pbmNsdWRl
L2xpbnV4L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmgKPiBpbmRleCAzZWJjMmJkOWE5NzYwLi4z
YjkwYjQ5ZDA1NTI5IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvZmlybXdhcmUvbWVzb24v
bWVzb25fc20uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvZmlybXdhcmUvbWVzb24vbWVzb25fc20u
aAo+IEBAIC0xNSw2ICsxNSw3IEBAIGVudW0gewo+ICAJU01fVEhFUk1BTF9DQUxJQl9SRUFELAo+
ICAJU01fQTFfUFdSQ19TRVQsCj4gIAlTTV9BMV9QV1JDX0dFVCwKPiArCVNNX0xPQURfVklERU9f
RlcsCgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyBuZXcgY29tbWFuZCBhbHNvIG5lZWQgYW4g
U01DIElEIG1hcHBpbmcgaW4gdGhlIGd4YmJfY2hpcCBjb21tYW5kCnRhYmxlIGluIGRyaXZlcnMv
ZmlybXdhcmUvbWVzb24vbWVzb25fc20uYz8KCklmIGRyaXZlcnMgYXR0ZW1wdCB0byBjYWxsIG1l
c29uX3NtX2NhbGwoKSB3aXRoIFNNX0xPQURfVklERU9fRlcsIGl0IGxvb2tzCmxpa2UgbWVzb25f
c21fZ2V0X2NtZCgpIG1pZ2h0IHJldHVybiAwIGJlY2F1c2UgdGhlIGNvbW1hbmQgaXMgbm90IG1h
cHBlZCwKY2F1c2luZyBtZXNvbl9zbV9jYWxsKCkgdG8gcmV0dXJuIC1FSU5WQUw6Cgpkcml2ZXJz
L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmM6bWVzb25fc21fY2FsbCgpIHsKICAgIC4uLgogICAg
Y21kID0gbWVzb25fc21fZ2V0X2NtZChmdy0+Y2hpcCwgY21kX2luZGV4KTsKICAgIGlmICghY21k
KQogICAgICAgIHJldHVybiAtRUlOVkFMOwogICAgLi4uCn0KCltTZXZlcml0eTogSGlnaF0KVGhp
cyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IHdpbGwgZHJpdmVycyBsb2FkaW5nIHZpZGVv
IGZpcm13YXJlCmNvbmN1cnJlbnRseSB0aHJvdWdoIHRoaXMgaW50ZXJmYWNlIGVuY291bnRlciBk
YXRhIGNvcnJ1cHRpb24/CgpMb29raW5nIGF0IGRyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25f
c20uYywgbWVzb25fc21fY2FsbF93cml0ZSgpIGNvcGllcwpkYXRhIHRvIHRoZSBnbG9iYWxseSBz
aGFyZWQgbWVtb3J5IHJlZ2lvbiBhbmQgaW52b2tlcyB0aGUgU01DIHdpdGhvdXQgYW55CmxvY2tp
bmc6Cgpkcml2ZXJzL2Zpcm13YXJlL21lc29uL21lc29uX3NtLmM6bWVzb25fc21fY2FsbF93cml0
ZSgpIHsKICAgIC4uLgogICAgbWVtY3B5KGZ3LT5zbV9zaG1lbV9pbl9iYXNlLCBidWZmZXIsIHNp
emUpOwogICAgaWYgKG1lc29uX3NtX2NhbGwoZncsIGNtZF9pbmRleCwgJndyaXR0ZW4sIGFyZzAs
IGFyZzEsIC4uLikgPCAwKQogICAgICAgIHJldHVybiAtRUlOVkFMOwogICAgLi4uCn0KCkEgc2lt
aWxhciBsYWNrIG9mIHN5bmNocm9uaXphdGlvbiBleGlzdHMgaW4gbWVzb25fc21fY2FsbF9yZWFk
KCkuIENvdWxkCm11bHRpcGxlIGtlcm5lbCB0aHJlYWRzIGV4ZWN1dGluZyB0aGVzZSBmdW5jdGlv
bnMgY2xvYmJlciBlYWNoIG90aGVyJ3MgZGF0YQptaWQtb3BlcmF0aW9uPwoKW1NldmVyaXR5OiBI
aWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgaXMgdGhlcmUgYW4gb2JqZWN0
IGxpZmV0aW1lIG1pc21hbmFnZW1lbnQKaXNzdWUgZm9yIGRyaXZlcnMgb2J0YWluaW5nIHRoZSBt
ZXNvbl9zbSBjb250ZXh0IHRvIG1ha2UgdGhlc2UgZmlybXdhcmUKY2FsbHM/CgpJbiBkcml2ZXJz
L2Zpcm13YXJlL21lc29uL21lc29uX3NtLmMsIG1lc29uX3NtX2dldCgpIHJldHJpZXZlcyB0aGUg
ZncKc3RydWN0dXJlIGJ1dCBkcm9wcyB0aGUgZGV2aWNlIHJlZmVyZW5jZSBiZWZvcmUgcmV0dXJu
aW5nIGl0OgoKZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jOm1lc29uX3NtX2dldCgp
IHsKICAgIC4uLgogICAgZncgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKICAgIHB1dF9k
ZXZpY2UoJnBkZXYtPmRldik7CiAgICByZXR1cm4gZnc7Cn0KCklmIHRoZSBtZXNvbi1zbSBkZXZp
Y2UgaXMgdW5ib3VuZCB2aWEgc3lzZnMsIGRldnJlcyBjbGVhbnVwIGZyZWVzIGZ3LApsZWF2aW5n
IGNvbnN1bWVyIGRyaXZlcnMgd2l0aCBhIGRhbmdsaW5nIHBvaW50ZXIgdGhhdCB3aWxsIGJlIGRl
cmVmZXJlbmNlZApkdXJpbmcgc3Vic2VxdWVudCBvcGVyYXRpb25zLiBEb2VzIHRoaXMgcmVxdWly
ZSBhIGZpeD8KCj4gIH07Cj4gIAo+ICBzdHJ1Y3QgbWVzb25fc21fZmlybXdhcmU7CgotLSAKU2Fz
aGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODEy
LWI0LXM0LXZkZWMtdXBzdHJlYW0tdjctMC0zZmFlMDg1ODYxYmRAYW1sb2dpYy5jb20/cGFydD0x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
