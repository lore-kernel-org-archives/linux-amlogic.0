Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2817AC982D0
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2026 08:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMGgtr9DwwQEmi5olZ2ZFT4JcmssHe1uYIpVLjEn8eE=; b=OGJ45RzAOeKUbX
	wEPv9CtXGJNjFoX792/t376tX7l2L7GGz3TAMSwPLYvmA+AT9irpTuFOHZ/mlIHLI/r5C1PqXmE9W
	VGtX2mpAOcMX0JpPXKvSZxfIhYQyOi1T6HKjDliBgIvcdO5wPQswjDsSBg0HiuQZt/E7maFmPm0EU
	3+Iue5RulY9azp32ipZcCDd47Teh7vEMDFo1nVnkLanIj6i+AuAQ/Bc226koRH3xs/UlVcTvjS6yT
	RqndPGXVklNrafhXkYMXTzr2KTsIl1UF2dZWafiTGvqd2eflCvlVC7qEt4DiyZx8RgwKkl3d8XXeC
	brfUS/f2uTAO3TAgXcUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77DE-0000000ArHZ-3EvI;
	Thu, 17 Sep 2026 08:11:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77DD-0000000ArHE-1Uzh
	for linux-amlogic@lists.infradead.org;
	Thu, 17 Sep 2026 08:11:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1172A41A10;
	Thu, 17 Sep 2026 08:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835FA1F000FF;
	Thu, 17 Sep 2026 08:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789632678;
	bh=tjCANDN9Cmup5RNH0pmtUarjfOrz4F1NfcznTrPGBKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OuPPAf/ixhkMKZtufAwleeFqsXVNLMHJFyK5RB7ugR83JjGPNyP+LML/+1+ptnVeW
	 RUusJngLCsXHfboW3jAK9VQDYhcMNQZ8hFElaZ1HKw0Pn5/Av1VJ6RDKx2KHdgsq4F
	 MHrQQBvijWAaPUCSj3lEEYcow1B/XLrll5cKply9Z/iLR+5fLn/9MEFTAqAViwovt8
	 OC5h7iN/qEkeG8VxOU09eg7KjifBWN4Pc9HV2AZDppnws7CJ7qQ+8OlIgKwFiwxCxF
	 ig/M9jcIwQuUfuw9PhBiqHkrVJAO5Lwnbyq5s44YDGX7sVygCta/ozB25wuDXeXQH0
	 zCPITHErJPRBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 3/6] mfd: khadas-mcu: Add support for VIM4 MCU
 variant
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-3-497cd543a148@aliel.fr>
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-3-497cd543a148@aliel.fr>
Date: Thu, 17 Sep 2026 08:11:18 +0000
Message-Id: <20260917081118.835FA1F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gbWZkOiBJbmNvcnJlY3Qg
d3JpdGVhYmxlIHJlZ2lzdGVycyBpbiBWSU00IHJlZ21hcCBjb25maWcKLS0KCmNvbW1pdCBmYzQ0
MzI5ZDdlZTZkMTJhMDA3NzkzMGIyNjMyZGYzNTU0ZDFlMzhmCkF1dGhvcjogUm9uYWxkIENsYXZl
YXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+CgptZmQ6IGtoYWRhcy1tY3U6IEFkZCBzdXBw
b3J0IGZvciBWSU00IE1DVSB2YXJpYW50CgpUaGlzIGNvbW1pdCBhZGRzIHN1cHBvcnQgZm9yIHRo
ZSBWSU00IE1DVSB2YXJpYW50IGJ5IHJlZmFjdG9yaW5nIHRoZQpwcm9iZSBmdW5jdGlvbiB0byB1
c2UgcGVyLXZhcmlhbnQgdmFsdWVzLiBJdCBpbnRyb2R1Y2VzIGEgZGVkaWNhdGVkIApyZWdtYXAg
Y29uZmlndXJhdGlvbiBmb3IgdGhlIFZJTTQgTUNVLCB3aXRoIGl0cyBvd24gdm9sYXRpbGUgYW5k
IAp3cml0ZWFibGUgcmVnaXN0ZXIgY2hlY2tzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQv
a2hhZGFzLW1jdS5jIGIvZHJpdmVycy9tZmQva2hhZGFzLW1jdS5jCj4gaW5kZXggMGU3NGVmZTE0
ZjM2Ny4uNGIzN2U3NGUyYjA0YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21mZC9raGFkYXMtbWN1
LmMKPiArKysgYi9kcml2ZXJzL21mZC9raGFkYXMtbWN1LmMKClsgLi4uIF0KCj4gK3N0YXRpYyBi
b29sIGtoYWRhc19tY3VfdmltNF9yZWdfd3JpdGVhYmxlKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5z
aWduZWQgaW50IHJlZykKPiArewo+ICsJc3dpdGNoIChyZWcpIHsKPiArCWNhc2UgS0hBREFTX01D
VV9WRVJTSU9OXzBfUkVHOgo+ICsJY2FzZSBLSEFEQVNfTUNVX1ZFUlNJT05fMV9SRUc6Cj4gKwlj
YXNlIEtIQURBU19NQ1VfU0hVVERPV05fTk9STUFMX1NUQVRVU19SRUc6Cj4gKwkJcmV0dXJuIGZh
bHNlOwo+ICsJZGVmYXVsdDoKPiArCQlyZXR1cm4gdHJ1ZTsKCltTZXZlcml0eTogTG93XQpEb2Vz
IHRoaXMgZnVuY3Rpb24gb21pdCBtdWx0aXBsZSBrbm93biByZWFkLW9ubHkgcmVnaXN0ZXJzIGRl
ZmluZWQgZm9yIHRoZSBNQ1UsCnN1Y2ggYXMgS0hBREFTX01DVV9NQUNfMF9SRUcgYW5kIEtIQURB
U19NQ1VfVVNJRF8wX1JFRz8KCkJlY2F1c2UgdGhpcyBzd2l0Y2ggZGVmYXVsdHMgdG8gdHJ1ZSwg
YW55IHVubGlzdGVkIHJlYWQtb25seSByZWdpc3RlciBpcwppbmNvcnJlY3RseSBtYXJrZWQgYXMg
d3JpdGVhYmxlLiBCZWNhdXNlIHRoZSByZWdtYXAgdXNlcyBSRUdDQUNIRV9NQVBMRSwKd3JpdGlu
ZyB0byBhbiBvbWl0dGVkIHJlYWQtb25seSByZWdpc3RlciB3aWxsIGluYXBwcm9wcmlhdGVseSBj
YWNoZSB0aGUgd3JpdHRlbgp2YWx1ZSBpbnN0ZWFkIG9mIGZhaWxpbmcsIHdoaWNoIGNvdWxkIHBv
aXNvbiB0aGUgY2FjaGUgZm9yIHN1YnNlcXVlbnQgcmVhZHMuCgpFdmVuIHRob3VnaCB0aGUga2hh
ZGFzLW1jdS11c2VyLW1lbSBjZWxsIGlzbid0IGluc3RhbnRpYXRlZCBmb3IgdGhlIFZJTTQgdmFy
aWFudAoobWVhbmluZyB0aGVyZSBpcyBubyBhY3RpdmUgY29kZSBwYXRoIHdyaXRpbmcgdG8gdGhl
c2UgcmVnaXN0ZXJzIGluIG5vcm1hbApwcm9kdWN0aW9uIG9wZXJhdGlvbiksIHNob3VsZCB0aGVz
ZSBrbm93biByZWFkLW9ubHkgcmVnaXN0ZXJzIGJlIGV4cGxpY2l0bHkKaGFuZGxlZCB0byBwcmV2
ZW50IGZ1dHVyZSBjYWNoaW5nIGlzc3Vlcz8KCj4gKwl9Cj4gK30KPiArCgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTE3LWFkZC1t
Y3UtZmFuLWtoYWRhcy12aW00LXYxMi0wLTQ5N2NkNTQzYTE0OEBhbGllbC5mcj9wYXJ0PTMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
