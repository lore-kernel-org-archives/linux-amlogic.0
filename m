Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1175C55174
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Aug 2026 08:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtrVEXwBKHYzt6n3wS3bYw4Mkd1414p/tBBQlrb8Dyk=; b=AkI89dfyGXqC6v
	332IG5A98pmSq8IfJYbv+12aPn9zJIRmldkq0aON5IxO6/S4e+vi41ZGbysfEaDflQWxxNtkbmLnT
	wdtasrrocr/0FpCK73qHkVEMvpFh0XNCdP0tmKtTY1/EHAIwida+udKKU4E8x3Tf0WM4LisHikG2C
	7s6D6hjuSCDmshmkMufnuTzZUEiYfyuCmV9OnawAn1V5FBt5OwZn2XpmS9undqbnxzxWYet8CpNfu
	nzCJlxIBfAnoxmOe4oAFXhQ92XD1uzyf8yHKF4TzG/B8eStru4Gk8JLMZLmznmMTzw0210csnp1yq
	Nc5rkfHXZ0zGtoLFO4CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWqL-00000003W9N-2kvU;
	Wed, 05 Aug 2026 08:19:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWqJ-00000003W8P-3uAx
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Aug 2026 08:19:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3011C43F94;
	Wed,  5 Aug 2026 08:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272991F00A3A;
	Wed,  5 Aug 2026 08:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785917954;
	bh=8vewiNrkoIDQtorfLbzBBsxYkJScQqv+bz/olHZPmig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XRVktW5BOIOHyUpcx0YeJcGxLxInvIm57q2bckybM1IVvF/4fW96ReNsC0y3b8U1/
	 ad9PQ4crURZS9ASjX4Tl2WOBrHdF6xPkKo5tAeJBjMDoe3M9phNcFgILrlHPBH2vKb
	 TcHY7jvIDMcnuwEd6XW4r03tYlaJ9yMB383TNSyCV6ZBsTqDO6ZKKhfZVuvG8mT6jt
	 nP2yp+TgEgcVgpH1yIjAm/RmdxHJ2ZdlxhSgyOcTxerA2WM2hQMX/XzeodplJ9oLpw
	 EENrbjKezu8EfT7Wzb/tFFWKaQu7YAuamphxTPM8yho4PXtXCYqjboNU7Vrsfw4/d9
	 paI5be7QEjK2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/6] mfd: khadas-mcu: Add support for VIM4 MCU
 variant
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-add-mcu-fan-khadas-vim4-v9-3-75df78710b9e@aliel.fr>
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-3-75df78710b9e@aliel.fr>
Date: Wed, 05 Aug 2026 08:19:12 +0000
Message-Id: <20260805081913.272991F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFRoZSBkcml2ZXIgdW5j
b25kaXRpb25hbGx5IGZhaWxzIHRvIHByb2JlIG9uIGdlbmVyaWMgS2hhZGFzIE1DVSBib2FyZHMg
KFZJTTEvVklNMi9WSU0zKSBkdWUgdG8gYSBOVUxMIHBvaW50ZXIgY2hlY2sgb24gdmFsaWQgbWF0
Y2ggZGF0YS4KLS0KCi0tLSBQYXRjaCBbM106IFtQQVRDSCB2OSAzLzZdIG1mZDoga2hhZGFzLW1j
dTogQWRkIHN1cHBvcnQgZm9yIFZJTTQgTUNVIHZhcmlhbnQgLS0tCmNvbW1pdCBlYWI0MThkYWMx
YjVlOTRiZDI5N2IwYTE0ZTkyZTg3YjIwNjNkYzliCkF1dGhvcjogUm9uYWxkIENsYXZlYXUgPGxp
bnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+CgptZmQ6IGtoYWRhcy1tY3U6IEFkZCBzdXBwb3J0IGZv
ciBWSU00IE1DVSB2YXJpYW50CgpUaGlzIHBhdGNoIHJlZmFjdG9ycyB0aGUgcHJvYmUgZnVuY3Rp
b24gdG8gdXNlIHBlci12YXJpYW50IHZhbHVlcyBpbnN0ZWFkIG9mCmhhcmRjb2RlZCBnbG9iYWxz
LiBJdCBhZGRzIGRlZGljYXRlZCByZWdtYXAgY29uZmlndXJhdGlvbiwgZmFuIGNvbnRyb2wgcmVn
aXN0ZXIsCmFuZCBkdXR5LWN5Y2xlIGxldmVscyBmb3IgdGhlIFZJTTQgTUNVIHZhcmlhbnQuIEEg
bmV3IGNvbXBhdGlibGUgc3RyaW5nCiJraGFkYXMsdmltNC1tY3UiIGlzIGludHJvZHVjZWQgZm9y
IHRoaXMgbmV3IGRldmljZS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL2toYWRhcy1tY3Uu
YyBiL2RyaXZlcnMvbWZkL2toYWRhcy1tY3UuYwo+IGluZGV4IDBlNzRlZmUxNGYzNjcuLjRjYjMw
NWFjOTE1ZTEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZmQva2hhZGFzLW1jdS5jCj4gKysrIGIv
ZHJpdmVycy9tZmQva2hhZGFzLW1jdS5jClsgLi4uIF0KPiBAQCAtNzUsNDcgKzc1LDEzOCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcga2hhZGFzX21jdV9yZWdtYXBfY29uZmln
ID0gewpbIC4uLiBdCj4gIHN0YXRpYyBpbnQga2hhZGFzX21jdV9wcm9iZShzdHJ1Y3QgaTJjX2Ns
aWVudCAqY2xpZW50KQo+ICB7Cj4gKwljb25zdCBzdHJ1Y3QgbWZkX2NlbGwgKmNlbGxzLCAqZmFu
X2NlbGxzOwo+ICsJY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcgKnJlZ21hcF9jZmc7Cj4gIAlz
dHJ1Y3QgZGV2aWNlICpkZXYgPSAmY2xpZW50LT5kZXY7Cj4gKwlpbnQgbmNlbGxzLCBuZmFuX2Nl
bGxzLCByZXQ7Cj4gIAlzdHJ1Y3Qga2hhZGFzX21jdSAqZGRhdGE7Cj4gLQlpbnQgcmV0Owo+ICsJ
Y29uc3Qgdm9pZCAqbWF0Y2g7Cj4gIAo+ICAJZGRhdGEgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXpl
b2YoKmRkYXRhKSwgR0ZQX0tFUk5FTCk7Cj4gIAlpZiAoIWRkYXRhKQo+ICAJCXJldHVybiAtRU5P
TUVNOwo+ICAKPiArCW1hdGNoID0gaTJjX2dldF9tYXRjaF9kYXRhKGNsaWVudCk7Cj4gKwlpZiAo
IW1hdGNoKQo+ICsJCXJldHVybiAtRU5PREVWOwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMg
Y29kZSBpbmFkdmVydGVudGx5IGJyZWFrIHRoZSBwcm9iZSBmb3IgZ2VuZXJpYyBLaGFkYXMgTUNV
IGJvYXJkcwooVklNMS9WSU0yL1ZJTTMpPwoKQmVjYXVzZSBLSEFEQVNfTUNVX0dFTkVSSUMgZXZh
bHVhdGVzIHRvIDAgaW4gaXRzIGVudW0sIGkyY19nZXRfbWF0Y2hfZGF0YSgpIHdpbGwKcmV0dXJu
IGEgTlVMTCBwb2ludGVyIHdoZW4gbWF0Y2hpbmcgImtoYWRhcyxtY3UiIGluIGtoYWRhc19tY3Vf
cHJvYmUoKSBpbgpkcml2ZXJzL21mZC9raGFkYXMtbWN1LmMuIFRoaXMgd2lsbCBjYXVzZSB0aGUg
Y2hlY2sgaGVyZSB0byBldmFsdWF0ZSB0byB0cnVlIGFuZAp1bmNvbmRpdGlvbmFsbHkgYWJvcnQg
dGhlIHByb2JlIHdpdGggLUVOT0RFVi4KClsgLi4uIF0KPiBAQCAtMTIzLDcgKzIxNCw4IEBAIHN0
YXRpYyBpbnQga2hhZGFzX21jdV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQo+ICAK
PiAgI2lmZGVmIENPTkZJR19PRgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBr
aGFkYXNfbWN1X29mX21hdGNoW10gPSB7Cj4gLQl7IC5jb21wYXRpYmxlID0gImtoYWRhcyxtY3Ui
LCB9LAo+ICsJeyAuY29tcGF0aWJsZSA9ICJraGFkYXMsbWN1IiwgLmRhdGEgPSAodm9pZCAqKUtI
QURBU19NQ1VfR0VORVJJQyB9LAo+ICsJeyAuY29tcGF0aWJsZSA9ICJraGFkYXMsdmltNC1tY3Ui
LCAuZGF0YSA9ICh2b2lkICopS0hBREFTX01DVV9WSU00IH0sCj4gIAl7fSwKPiAgfTsKPiAgTU9E
VUxFX0RFVklDRV9UQUJMRShvZiwga2hhZGFzX21jdV9vZl9tYXRjaCk7CgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODA1LWFkZC1t
Y3UtZmFuLWtoYWRhcy12aW00LXY5LTAtNzVkZjc4NzEwYjllQGFsaWVsLmZyP3BhcnQ9MwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
