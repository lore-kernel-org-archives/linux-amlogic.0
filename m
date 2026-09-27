Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4123C9832F
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Sep 2026 14:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHL1hgWcfnYqsxf2XZoIbqstzyG7FJ4Q3HLv5ZabV84=; b=1DPNVPtgcyQcuX
	PCFA72pX7lHhP+DqlXtXNSf6VjMU3SiufmCSqQjEXOl4SEMFO7/0ro8g9AH8mw5UxhyfpON+oUpSw
	p6OxJQj1jGA0HGWNiXcp+pvzbeGbpZa1t0pTY7PO/pZW2yYiTd2iM+BWd/5EiF4da4oeWHYteDfH3
	8FbldjwxqMdGhlD7gUCdgIfnvJggQNai0yillCu7EqKY/bWYlMGpanKEEIKqm9nF7JRj4cRPp2lB3
	5cHBl2XhnVZT1adlP5XRRTBxwAJ/828Fnn7SWiNfHWj9Wn6FbCBuPTVeCHYfhnhc41aWI26GYhwLP
	m47v6a1py+5uJRELl5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAq0V-0000000GSd5-3l8e;
	Sun, 27 Sep 2026 14:37:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAq0V-0000000GScu-09dl
	for linux-amlogic@lists.infradead.org;
	Sun, 27 Sep 2026 14:37:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BD0043516;
	Sun, 27 Sep 2026 14:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8151F000FF;
	Sun, 27 Sep 2026 14:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790519854;
	bh=JQA++aknkdABr92fqXrlam/PrSQpXROJMqNL5y/HHJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cKFqGW/5ajBYNAhBPWc7MMuKZgEZVs1BokpbSlMW0PAq5EyEXVQSSNyIf6GI3152T
	 NOzdVPAIOR9yb6Af0WqBaNrfOfXUQUTMMMOTAWOGvR1paph8X5gtBpLAdNrFec65BQ
	 NVDZ+AsoibSVCstcejqYWbGabPCccAem5bGCvb04XVyo9N3UMIPyfhPHFei8TsTC5g
	 G8KqzPgjIUfftIyhOeyWkJ6aKlF54bh2g4Bebi5g0KcR9mHg5MiQIdOFafIpFRVscj
	 mIMZ5xv23ilJoweCfbSom93ziHioAoHPZaQFC8AnINoz3hXNKyKwfWjmzpXrwabG2/
	 3IzKCr8MAA0OA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: pwm: amlogic: Add core clock for S4
 like
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260927-add-t7-sys-pwm-clk-v3-1-18d66abea4d1@aliel.fr>
References: <20260927-add-t7-sys-pwm-clk-v3-0-18d66abea4d1@aliel.fr>
 <20260927-add-t7-sys-pwm-clk-v3-1-18d66abea4d1@aliel.fr>
Date: Sun, 27 Sep 2026 14:37:33 +0000
Message-Id: <20260927143733.DA8151F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZHQtYmluZGluZ3M6
IHB3bS1hbWxvZ2ljOiBtaXNzaW5nIG1pbkl0ZW1zIGFsbG93cyB2YWxpZGF0aW9uIGJ5cGFzcwot
LQoKY29tbWl0IDM1OWUxMjJlYWMxNWRmNTcwODE3YmE1OTBiOTFmODk1ODUyMmEwMzgKQXV0aG9y
OiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KCmR0LWJpbmRpbmdz
OiBwd206IGFtbG9naWM6IEFkZCBjb3JlIGNsb2NrIGZvciBTNCBsaWtlCiAgICAKVGhpcyBjb21t
aXQgYWRkcyBhIHRoaXJkIHN5c3RlbSBjb3JlIGNsb2NrIHRvIHRoZSBBbWxvZ2ljIFBXTSBjb250
cm9sbGVyIApiaW5kaW5ncyBmb3IgUzQgYW5kIHJlbGF0ZWQgZGV2aWNlcy4gSXQgdXBkYXRlcyB0
aGUgY29uZGl0aW9uYWxzIGZvciB0aGUgClM0IGNvbXBhdGlibGUgc3RyaW5nIHRvIHJlcXVpcmUg
dGhyZWUgY2xvY2tzIGluc3RlYWQgb2YgdHdvLCBhbmQgdXBkYXRlcyAKdGhlIGV4YW1wbGVzIHRv
IG1hdGNoLgoKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3B3bS9wd20tYW1sb2dpYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3B3bS9wd20tYW1sb2dpYy55YW1sCj4gaW5kZXggYzMzN2Q4NWRhNDBmMS4uZTljZDVmMWZkZjI2
NCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3B3
bS1hbWxvZ2ljLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cHdtL3B3bS1hbWxvZ2ljLnlhbWwKClsgLi4uIF0KCj4gQEAgLTE0Myw5ICsxNDMsMTUgQEAgYWxs
T2Y6Cj4gICAgICAgICAgICBpdGVtczoKPiAgICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjogaW5w
dXQgY2xvY2sgb2YgUFdNIGNoYW5uZWwgQQo+ICAgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBp
bnB1dCBjbG9jayBvZiBQV00gY2hhbm5lbCBCCj4gLSAgICAgICAgY2xvY2stbmFtZXM6IGZhbHNl
Cj4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IGdhdGUgY2xvY2sgZm9yIHRoZSBQV00gY29u
dHJvbGxlcgoKW1NldmVyaXR5OiBNZWRpdW1dCldpbGwgZHQtc2NoZW1hIHN1Y2Nlc3NmdWxseSBl
bmZvcmNlIHRoZSBtaW5pbXVtIDMgaXRlbXMgcmVxdWlyZW1lbnQgaW50ZW5kZWQgCmJ5IHRoZSBj
b21taXQgbWVzc2FnZT8KCkJlY2F1c2UgdGhlIGdsb2JhbCBgY2xvY2tzYCBwcm9wZXJ0eSBkZWZp
bml0aW9uIGhhcyBgbWluSXRlbXM6IDFgIGFuZCBKU09OIApTY2hlbWEncyBgaXRlbXNgIGtleXdv
cmQgb25seSB2YWxpZGF0ZXMgZWxlbWVudHMgdGhhdCBhcmUgYWN0dWFsbHkgcHJlc2VudCwgYSAK
ZGV2aWNlIHRyZWUgbm9kZSB3aXRoIGBjb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tczQtcHdt
ImAgYW5kIG9ubHkgMSBvciAyIApjbG9ja3Mgd2lsbCBzaWxlbnRseSBwYXNzIHZhbGlkYXRpb24u
CgpEb2VzIHRoaXMgYmxvY2sgbmVlZCBhbiBleHBsaWNpdCBgbWluSXRlbXM6IDNgPwoKPiArICAg
ICAgICBjbG9jay1uYW1lczoKPiArICAgICAgICAgIGl0ZW1zOgo+ICsgICAgICAgICAgICAtIGNv
bnN0OiBjaGFubmVsLWEKPiArICAgICAgICAgICAgLSBjb25zdDogY2hhbm5lbC1iCj4gKyAgICAg
ICAgICAgIC0gY29uc3Q6IGNvcmUKCltTZXZlcml0eTogTWVkaXVtXQpEb2VzIHRoaXMgYWxzbyBy
ZXF1aXJlIGBtaW5JdGVtczogM2A/CgpTdXBwbHlpbmcganVzdCAiY2hhbm5lbC1hIiBhbmQgImNo
YW5uZWwtYiIgd2lsbCBzdGlsbCB2YWxpZGF0ZSBzdWNjZXNzZnVsbHkgCndpdGhvdXQgYSBgbWlu
SXRlbXNgIGNvbnN0cmFpbnQgaGVyZS4KCj4gICAgICAgIHJlcXVpcmVkOgo+ICAgICAgICAgIC0g
Y2xvY2tzCj4gKyAgICAgICAgLSBjbG9jay1uYW1lcwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3
IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkyNy1hZGQtdDctc3lzLXB3bS1j
bGstdjMtMC0xOGQ2NmFiZWE0ZDFAYWxpZWwuZnI/cGFydD0xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
