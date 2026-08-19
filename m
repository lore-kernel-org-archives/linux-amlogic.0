Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A7FC5B572
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Aug 2026 07:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5cuuRkFIjcUfI507A0kak+3O33DBaXCmAjmPnyw49Q=; b=05VaocxcegNaOd
	kqN1NOPfNojAp9jWCEagTYC2nin86/ELvO9c5y2EKXqJZkjQdn8SH/8aRq/+SbYwHi8hLbVrsWyE9
	FxkNz/GVzVsxNhh5tiOXwe302RQV69PhFPYY7EQCaQVoePRyCJLvJTJ9RO7F3RUcQ0EyVdMkHotVK
	h9QHDLIj8weNJJaxvqjZPzfGMPcna4dHhKFfOU/rb0BN6jeqjOvXuS7JwzbWbha2ksEQU3ZA3qp7O
	PnRCYueIVKL6TZeLpo9Qket6EMkqNQvyS304CrsBEiin7Dk6hKD1EIvkhaspxjBuQrV7rsylIPlYA
	nR/3lTIZxX0ZZP/b+M1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaji-00000009CBy-2Bwd;
	Wed, 19 Aug 2026 07:29:22 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwajf-00000009CB6-1w89
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Aug 2026 07:29:21 +0000
Message-ID: <0ca5c247-18b4-4711-83c9-f0fa6570404d@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1787124553;
	bh=Mu+7LLfVGJEa7egrQJ85+es5WpyywoehYqfJDmwmG9c=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Bp/jOf1oKfFdpCH+Zeh00mSopBGHf2Lkn66R1D49WVY/1pwnLxLS4klyg//FH2iFs
	 D/bZw5GLQdcpBxJD8UVbO5qIW2o4zAQolSp4zmZUthYoDWmFafdoHQC3jQf466cZFd
	 q/dHXar5lC5Jr9XeqYYKX/o4v8PckUa1GauWTTSo=
Date: Wed, 19 Aug 2026 09:29:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v9 3/6] mfd: khadas-mcu: Add support for VIM4 MCU variant
To: Lee Jones <lee@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org,
 mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-3-75df78710b9e@aliel.fr>
 <20260805081913.272991F00A3A@smtp.kernel.org>
 <20260812120007.GO1072730@google.com>
Content-Language: en-US
In-Reply-To: <20260812120007.GO1072730@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_002919_797385_04F2D2D9 
X-CRM114-Status: GOOD (  17.01  )
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

T24gOC8xMi8yNiAyOjAwIFBNLCBMZWUgSm9uZXMgd3JvdGU6Cj4gT24gV2VkLCAwNSBBdWcgMjAy
Niwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToKPiAKPj4gVGhhbmsgeW91IGZvciB5b3Vy
IGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNzdWUo
cykgdG8gY29uc2lkZXI6Cj4+IC0gW0hpZ2hdIFRoZSBkcml2ZXIgdW5jb25kaXRpb25hbGx5IGZh
aWxzIHRvIHByb2JlIG9uIGdlbmVyaWMgS2hhZGFzIE1DVSBib2FyZHMgKFZJTTEvVklNMi9WSU0z
KSBkdWUgdG8gYSBOVUxMIHBvaW50ZXIgY2hlY2sgb24gdmFsaWQgbWF0Y2ggZGF0YS4KPiAKPiBQ
bGVhc2UgcmV2aWV3LCBleHBsYWluIG9yIGZpeCB0aGUgU2FzaGlrbyByZXZpZXcocykuCj4gCj4g
SWYgdGhpcyBpcyBhIHNldCwgdGhpcyByZXF1ZXN0IGluY2x1ZGVzIHRoZSBvdGhlciBwYXRjaGVz
IHRvby4KPiAKClllcyBJIHdpbGwgY2hlY2sgYWxsIHRob3NlIHJldmlld3MuCgo+PiAtLQo+Pgo+
PiAtLS0gUGF0Y2ggWzNdOiBbUEFUQ0ggdjkgMy82XSBtZmQ6IGtoYWRhcy1tY3U6IEFkZCBzdXBw
b3J0IGZvciBWSU00IE1DVSB2YXJpYW50IC0tLQo+PiBjb21taXQgZWFiNDE4ZGFjMWI1ZTk0YmQy
OTdiMGExNGU5MmU4N2IyMDYzZGM5Ygo+PiBBdXRob3I6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1r
ZXJuZWwtZGV2QGFsaWVsLmZyPgo+Pgo+PiBtZmQ6IGtoYWRhcy1tY3U6IEFkZCBzdXBwb3J0IGZv
ciBWSU00IE1DVSB2YXJpYW50Cj4+Cj4+IFRoaXMgcGF0Y2ggcmVmYWN0b3JzIHRoZSBwcm9iZSBm
dW5jdGlvbiB0byB1c2UgcGVyLXZhcmlhbnQgdmFsdWVzIGluc3RlYWQgb2YKPj4gaGFyZGNvZGVk
IGdsb2JhbHMuIEl0IGFkZHMgZGVkaWNhdGVkIHJlZ21hcCBjb25maWd1cmF0aW9uLCBmYW4gY29u
dHJvbCByZWdpc3RlciwKPj4gYW5kIGR1dHktY3ljbGUgbGV2ZWxzIGZvciB0aGUgVklNNCBNQ1Ug
dmFyaWFudC4gQSBuZXcgY29tcGF0aWJsZSBzdHJpbmcKPj4gImtoYWRhcyx2aW00LW1jdSIgaXMg
aW50cm9kdWNlZCBmb3IgdGhpcyBuZXcgZGV2aWNlLgo+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWZkL2toYWRhcy1tY3UuYyBiL2RyaXZlcnMvbWZkL2toYWRhcy1tY3UuYwo+Pj4gaW5kZXgg
MGU3NGVmZTE0ZjM2Ny4uNGNiMzA1YWM5MTVlMSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbWZk
L2toYWRhcy1tY3UuYwo+Pj4gKysrIGIvZHJpdmVycy9tZmQva2hhZGFzLW1jdS5jCj4+IFsgLi4u
IF0KPj4+IEBAIC03NSw0NyArNzUsMTM4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnbWFwX2Nv
bmZpZyBraGFkYXNfbWN1X3JlZ21hcF9jb25maWcgPSB7Cj4+IFsgLi4uIF0KPj4+ICBzdGF0aWMg
aW50IGtoYWRhc19tY3VfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKPj4+ICB7Cj4+
PiArCWNvbnN0IHN0cnVjdCBtZmRfY2VsbCAqY2VsbHMsICpmYW5fY2VsbHM7Cj4+PiArCWNvbnN0
IHN0cnVjdCByZWdtYXBfY29uZmlnICpyZWdtYXBfY2ZnOwo+Pj4gIAlzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSAmY2xpZW50LT5kZXY7Cj4+PiArCWludCBuY2VsbHMsIG5mYW5fY2VsbHMsIHJldDsKPj4+
ICAJc3RydWN0IGtoYWRhc19tY3UgKmRkYXRhOwo+Pj4gLQlpbnQgcmV0Owo+Pj4gKwljb25zdCB2
b2lkICptYXRjaDsKPj4+ICAKPj4+ICAJZGRhdGEgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2Yo
KmRkYXRhKSwgR0ZQX0tFUk5FTCk7Cj4+PiAgCWlmICghZGRhdGEpCj4+PiAgCQlyZXR1cm4gLUVO
T01FTTsKPj4+ICAKPj4+ICsJbWF0Y2ggPSBpMmNfZ2V0X21hdGNoX2RhdGEoY2xpZW50KTsKPj4+
ICsJaWYgKCFtYXRjaCkKPj4+ICsJCXJldHVybiAtRU5PREVWOwo+Pgo+PiBbU2V2ZXJpdHk6IEhp
Z2hdCj4+IERvZXMgdGhpcyBjb2RlIGluYWR2ZXJ0ZW50bHkgYnJlYWsgdGhlIHByb2JlIGZvciBn
ZW5lcmljIEtoYWRhcyBNQ1UgYm9hcmRzCj4+IChWSU0xL1ZJTTIvVklNMyk/Cj4+Cj4+IEJlY2F1
c2UgS0hBREFTX01DVV9HRU5FUklDIGV2YWx1YXRlcyB0byAwIGluIGl0cyBlbnVtLCBpMmNfZ2V0
X21hdGNoX2RhdGEoKSB3aWxsCj4+IHJldHVybiBhIE5VTEwgcG9pbnRlciB3aGVuIG1hdGNoaW5n
ICJraGFkYXMsbWN1IiBpbiBraGFkYXNfbWN1X3Byb2JlKCkgaW4KPj4gZHJpdmVycy9tZmQva2hh
ZGFzLW1jdS5jLiBUaGlzIHdpbGwgY2F1c2UgdGhlIGNoZWNrIGhlcmUgdG8gZXZhbHVhdGUgdG8g
dHJ1ZSBhbmQKPj4gdW5jb25kaXRpb25hbGx5IGFib3J0IHRoZSBwcm9iZSB3aXRoIC1FTk9ERVYu
Cj4+Cj4+IFsgLi4uIF0KPj4+IEBAIC0xMjMsNyArMjE0LDggQEAgc3RhdGljIGludCBraGFkYXNf
bWN1X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCj4+PiAgCj4+PiAgI2lmZGVmIENP
TkZJR19PRgo+Pj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGtoYWRhc19tY3Vf
b2ZfbWF0Y2hbXSA9IHsKPj4+IC0JeyAuY29tcGF0aWJsZSA9ICJraGFkYXMsbWN1IiwgfSwKPj4+
ICsJeyAuY29tcGF0aWJsZSA9ICJraGFkYXMsbWN1IiwgLmRhdGEgPSAodm9pZCAqKUtIQURBU19N
Q1VfR0VORVJJQyB9LAo+Pj4gKwl7IC5jb21wYXRpYmxlID0gImtoYWRhcyx2aW00LW1jdSIsIC5k
YXRhID0gKHZvaWQgKilLSEFEQVNfTUNVX1ZJTTQgfSwKPj4+ICAJe30sCj4+PiAgfTsKPj4+ICBN
T0RVTEVfREVWSUNFX1RBQkxFKG9mLCBraGFkYXNfbWN1X29mX21hdGNoKTsKPj4KPj4gLS0gCj4+
IFNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2
MDgwNS1hZGQtbWN1LWZhbi1raGFkYXMtdmltNC12OS0wLTc1ZGY3ODcxMGI5ZUBhbGllbC5mcj9w
YXJ0PTMKPiAKCgotLSAKQmVzdCByZWdhcmRzLApSb25hbGQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
