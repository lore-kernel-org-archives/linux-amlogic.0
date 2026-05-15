Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFEDCD4F25
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 May 2026 15:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70EFcTo8sncxG2w0/1ROk8iZb6otPiwMibEYAoCNorI=; b=zc0pJaX+MhvyA7
	WJLg8VsPoHauKe6l2XyNek3gaOMOzY2tnQP9b1GXD0UkK0Luo0zO64WNF379eBo9Mn1vhvTj5pI9E
	bkkVAtBvyzp1FAPzxN7zPuocRsFXpZ1en7AzvGXhcTZP3vv26RLmz5YnwyV7mB0yWEzZIzTg0lK8L
	4GbyeYoTRzxE3Q//okwf1hQgcFi2zeFS9fLQXZT4x4gI38GEuKjlpjHwtgr9jBFuFefUC0q7tiQ9e
	lG2gyaUr4zAoUJlyY0IhdrDWhJyWbeCr9Vl6KTehZbgsFlGsjkq7fZ0uaGdHXvaYgm7i3rqe58n/8
	mMyZlNbXvee7sTD10Amw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuat-00000008lib-3t6N;
	Fri, 15 May 2026 15:36:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuar-00000008lhY-0N07
	for linux-amlogic@lists.infradead.org;
	Fri, 15 May 2026 15:36:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD92040C2A;
	Fri, 15 May 2026 15:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965F8C2BCB7;
	Fri, 15 May 2026 15:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778859411;
	bh=0Wa4iRVGipy/x0jLPjRFY3D849ubgsHYZI5LrwClCoY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jjLyMnANp4qwANlfTkLnVF0+G+b3GHhIAV3/vzlhHHg+/YpltSqpPTpTkZIgHa26B
	 gkXU2yh1rbeMmFfukQYnIzoEgLq8SRdEs+KoaF6ZDx68awy02CFW/qH2ROxpJ3/H4l
	 v5GxhhZ1i2DBY5gFQHAWsluwTyaqX83z9Zuj68zL/4BT41sn4CbyXEIlP1vtLmi3Qa
	 IHtKCVPC619z39FSKJl7qTsczQc0LjOgTHF3GKxCtNKFHqGPkEbd0ammFkpFoY86xd
	 7jdBlT+mRls2bnc6ncnbD3V9tni3PVCRupdGwCLNTJR62HFJlpe2dr7xIBgMIQwCWL
	 0HnDW2H9H2SQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] ASoC: meson: gx: add gx-formatter and gx-interface
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260515-reshape-aiu-as-axg-v1-1-53b457784ff3@baylibre.com>
References: <20260515-reshape-aiu-as-axg-v1-1-53b457784ff3@baylibre.com>
Date: Fri, 15 May 2026 15:36:51 +0000
Message-Id: <20260515153651.965F8C2BCB7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_083653_171586_07E5BF59 
X-CRM114-Status: GOOD (  20.97  )
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0NyaXRpY2FsXSBVbmhhbmRsZWQg
ZXJyb3IgcGF0aHMgZHVyaW5nIHdpZGdldCBwb3dlci11cCBsZWF2ZSB0aGUgZm9ybWF0dGVyIGlu
IGFuIGluY29tcGxldGUgc3RhdGUsIGNhdXNpbmcgZGV0ZXJtaW5pc3RpYyBrZXJuZWwgcGFuaWNz
IGR1cmluZyBwb3dlci1kb3duLgotIFtIaWdoXSBNaXNzaW5nIHJvbGxiYWNrIG9mIGVuYWJsZWQg
Zm9ybWF0dGVycyBpbiBgZ3hfc3RyZWFtX3N0YXJ0YCBmYWlsdXJlIHBhdGggbGVhZHMgdG8gaGFy
ZHdhcmUgc3RhdGUgbGVha3MuCi0tCgpjb21taXQgMzdmMTRjZjUyOTMzZjgwMmRhZGQ0OGZiNTBj
Mzg3NmFkMWUwZTJjNQpBdXRob3I6IFZhbGVyaW8gU2V0dGkgPHZzZXR0aUBiYXlsaWJyZS5jb20+
ClN1YmplY3Q6IEFTb0M6IG1lc29uOiBneDogYWRkIGd4LWZvcm1hdHRlciBhbmQgZ3gtaW50ZXJm
YWNlCgpUaGlzIGNvbW1pdCBhZGRzIGJhc2ljIGZvcm1hdHRlciBhbmQgaW50ZXJmYWNlIGJsb2Nr
cyB0byBzaGFwZSBJMlMgaW4gR1ggCmRldmljZXMuIEl0IGludHJvZHVjZXMgZ3hfZm9ybWF0dGVy
X2NyZWF0ZSgpIHRvIGFsbG93IGV4aXN0aW5nIEFJVSBjb2RlIHRvCnV0aWxpemUgdGhlIGZvcm1h
dHRlciB3aXRob3V0IGRldmljZXRyZWUgbW9kaWZpY2F0aW9ucy4KCj4gZGlmZiAtLWdpdCBhL3Nv
dW5kL3NvYy9tZXNvbi9neC1mb3JtYXR0ZXIuYyBiL3NvdW5kL3NvYy9tZXNvbi9neC1mb3JtYXR0
ZXIuYwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uZGI5MzU0
NmVkOTIxNwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9zb3VuZC9zb2MvbWVzb24vZ3gtZm9ybWF0
dGVyLmMKClsgLi4uIF0KCj4gK3N0YXRpYyBpbnQgZ3hfZm9ybWF0dGVyX3Bvd2VyX3VwKHN0cnVj
dCBneF9mb3JtYXR0ZXIgKmZvcm1hdHRlciwKPiArCQkJCSAgICAgIHN0cnVjdCBzbmRfc29jX2Rh
cG1fd2lkZ2V0ICp3KQo+ICt7Cj4gKwlzdHJ1Y3QgZ3hfc3RyZWFtICp0cyA9IGZvcm1hdHRlci0+
ZHJ2LT5vcHMtPmdldF9zdHJlYW0odyk7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCS8qCj4gKwkgKiBJ
ZiB3ZSBkb24ndCBnZXQgYSBzdHJlYW0gYXQgdGhpcyBzdGFnZSwgaXQgd291bGQgbWVhbiB0aGF0
IHRoZQo+ICsJICogd2lkZ2V0IGlzIHBvd2VyaW5nIHVwIGJ1dCBpcyBub3QgYXR0YWNoZWQgdG8g
YW55IGJhY2tlbmQgREFJLgo+ICsJICogSXQgc2hvdWxkIG5vdCBoYXBwZW4sIGV2ZXIgIQo+ICsJ
ICovCj4gKwlpZiAoV0FSTl9PTighdHMpKQo+ICsJCXJldHVybiAtRU5PREVWOwoKV2lsbCB0aGlz
IGNhdXNlIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGxhdGVyIGlmIHRoZSB3YXJuaW5nIHRy
aWdnZXJzPwoKU2luY2UgQVNvQyBEQVBNIGNvcmUgaWdub3JlcyBlcnJvciBjb2RlcyByZXR1cm5l
ZCBieSB3aWRnZXQgUFJFX1BNVSBldmVudHMsCnRoZSB3aWRnZXQgd2lsbCBzdGlsbCBiZSBjb25z
aWRlcmVkIHBvd2VyZWQgdXAgYW5kIHRoZSBQUkVfUE1EIGV2ZW50IHdpbGwKZXZlbnR1YWxseSBl
eGVjdXRlIHdoZW4gdGhlIHN0cmVhbSBzdG9wcy4KCklmIHRoaXMgcmV0dXJucyAtRU5PREVWIGhl
cmUsIGZvcm1hdHRlci0+c3RyZWFtIHJlbWFpbnMgTlVMTC4gV2hlbiBQUkVfUE1ECnRyaWdnZXJz
IGd4X2Zvcm1hdHRlcl9wb3dlcl9kb3duKCkgYW5kIHRoZW4gZ3hfZm9ybWF0dGVyX2RldGFjaCgp
LCB0aGUKZGV0YWNoIGZ1bmN0aW9uIHdpbGwgYXR0ZW1wdCB0byBsb2NrIHRzLT5sb2NrIHdoZXJl
IHRzIGlzIE5VTEwuCgo+ICsKPiArCWZvcm1hdHRlci0+c3RyZWFtID0gdHM7Cj4gKwlyZXQgPSBn
eF9mb3JtYXR0ZXJfYXR0YWNoKGZvcm1hdHRlcik7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiBy
ZXQ7CgpDb3VsZCB0aGlzIGVycm9yIHBhdGggYWxzbyBsZWFkIHRvIGEgY3Jhc2ggZHVyaW5nIHRo
ZSBQUkVfUE1EIHRlYXJkb3duPwoKSWYgZ3hfZm9ybWF0dGVyX2F0dGFjaCgpIGZhaWxzLCBpdCBz
a2lwcyBhZGRpbmcgZm9ybWF0dGVyLT5saXN0IHRvIHRoZQpzdHJlYW0ncyBmb3JtYXR0ZXJfbGlz
dC4gTGF0ZXIsIHdoZW4gdGhlIHN0cmVhbSBzdG9wcyBhbmQgUFJFX1BNRCBpcyBpbnZva2VkLApn
eF9mb3JtYXR0ZXJfZGV0YWNoKCkgdW5jb25kaXRpb25hbGx5IGNhbGxzIGxpc3RfZGVsKCZmb3Jt
YXR0ZXItPmxpc3QpLgoKU2luY2UgdGhlIGxpc3Qgd2FzIG5ldmVyIGluaXRpYWxpemVkIHdpdGgg
SU5JVF9MSVNUX0hFQUQoKSBvciBhZGRlZCB0byB0aGUKbGlzdCwgY2FsbGluZyBsaXN0X2RlbCgp
IG9uIGl0IHdpbGwgZGVyZWZlcmVuY2UgdW5pbml0aWFsaXplZCBwb2ludGVycy4KCj4gKwo+ICsJ
cmV0dXJuIDA7Cj4gK30KClsgLi4uIF0KCj4gK2ludCBneF9zdHJlYW1fc3RhcnQoc3RydWN0IGd4
X3N0cmVhbSAqdHMpCj4gK3sKPiArCXN0cnVjdCBneF9mb3JtYXR0ZXIgKmZvcm1hdHRlcjsKPiAr
CWludCByZXQgPSAwOwo+ICsKPiArCW11dGV4X2xvY2soJnRzLT5sb2NrKTsKPiArCj4gKwkvKiBT
dGFydCBhbGwgdGhlIGZvcm1hdHRlcnMgYXR0YWNoZWQgdG8gdGhlIHN0cmVhbSAqLwo+ICsJbGlz
dF9mb3JfZWFjaF9lbnRyeShmb3JtYXR0ZXIsICZ0cy0+Zm9ybWF0dGVyX2xpc3QsIGxpc3QpIHsK
PiArCQlyZXQgPSBneF9mb3JtYXR0ZXJfZW5hYmxlKGZvcm1hdHRlcik7Cj4gKwkJaWYgKHJldCkg
ewo+ICsJCQlwcl9lcnIoImZhaWxlZCB0byBzdGFydCB0ZG0gc3RyZWFtXG4iKTsKPiArCQkJZ290
byBvdXQ7CgpEbyB3ZSBuZWVkIHRvIGRpc2FibGUgdGhlIGZvcm1hdHRlcnMgdGhhdCB3ZXJlIGFs
cmVhZHkgc3VjY2Vzc2Z1bGx5IGVuYWJsZWQKaW4gcHJldmlvdXMgaXRlcmF0aW9ucyBvZiB0aGlz
IGxvb3AgYmVmb3JlIHJldHVybmluZz8KClRoZSBBTFNBIGNvcmUgZG9lcyBub3QgYXV0b21hdGlj
YWxseSBpbnZva2UgdGhlIFNUT1AgdHJpZ2dlciB3aGVuIGEgU1RBUlQKdHJpZ2dlciBmYWlscy4g
UmV0dXJuaW5nIGFuIGVycm9yIGhlcmUgd2l0aG91dCByb2xsaW5nIGJhY2sgdGhlIGVhcmxpZXIK
Zm9ybWF0dGVycyBjb3VsZCBsZWF2ZSB0aGUgaGFyZHdhcmUgY2xvY2tzIGFuZCByZWdpc3RlcnMg
cGVybWFuZW50bHkgZW5hYmxlZCwKcmVzdWx0aW5nIGluIGxlYWtlZCByZXNvdXJjZXMuCgo+ICsJ
CX0KPiArCX0KPiArCj4gKwl0cy0+cmVhZHkgPSB0cnVlOwo+ICsKPiArb3V0Ogo+ICsJbXV0ZXhf
dW5sb2NrKCZ0cy0+bG9jayk7Cj4gKwlyZXR1cm4gcmV0Owo+ICt9CgotLSAKU2FzaGlrbyBBSSBy
ZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNTE1LXJlc2hhcGUt
YWl1LWFzLWF4Zy12MS0wLTUzYjQ1Nzc4NGZmM0BiYXlsaWJyZS5jb20/cGFydD0xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
