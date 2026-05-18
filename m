Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2653CD4F49
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 08:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3ILNVoIKNINwyJ4DeSPrR+HXLs+9avjEbVk0FZ11JI=; b=uM4pH6kY3rfOgG
	MQAje4FwUK71hBestsCvLTGyW8BU7I+a0/+n1kleYo//FFcQWv3zeZe6hwQo35Krgx7sajXPsXEYD
	2Biu08pX9n0++Gh7CXTxT/ajcLSqz36vgdTzufknDNn1AIp4BcejyDKPoKIZ/vm3kjl83SrLxsCOF
	R4yrj6qUWpv+2tS3zMHT5//E/Lh5O0VLnCdS7RXtGAJiJ7blYToUAiffJB79EviCKjP7BITLgB9MV
	UJyFB5qs0gKzof++o7/awgFabDzugUTyE1PdQ9xdICg5NZiSeMAJaBC37h7zHpUR+ZzR0aJ3SyyJ+
	HKvJvVzZTCSrumI/hx+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtDC-0000000Ekmc-2elJ;
	Mon, 18 May 2026 08:20:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtDB-0000000Ekm8-1q8l
	for linux-amlogic@bombadil.infradead.org;
	Mon, 18 May 2026 08:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Reply-To:
	Subject:From:Sender:MIME-Version:Content-ID:Content-Description;
	bh=g4bnEDNecCM+Ga2ef92UJNFGSxnv39DrQ6YOKqkvW5U=; b=rGCuxUHt7lAuu23lABSUcqtomQ
	GJdUxJvA+8Qv0J3hQhWPfZVsmPRkczg0xZQsK5rLpYmsmYgv/I/1xH2Tf4WtsEjrxnLUV//QWL/1j
	31YGPwr4BMjWipnl7PznTDDm5ezB1sIuw8CWWnMTIaHuEq4Cq6ekkrFhJNMCki3v7mKCsTCcoDVct
	/ypv+wgsK/SkaPpj7oPUaUnf9gFxTWD3UBiKakFGw9KVKa7+LG1t38enoSmR9wsn/6+aGHT56don0
	Fe6IDWv1QaGqDCNcXkA3gq/lUMqdfEDBjC4uH1ZjFZhVBXI2DOa99UTSF3wOgb9bdo3sCRLitXjNZ
	DY74yv7A==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtD8-0000000AKwY-02FJ
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 08:20:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BD0443B57;
	Mon, 18 May 2026 08:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4229C2BCB7;
	Mon, 18 May 2026 08:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779092423;
	bh=FurP3HEQ9b9LHdO+CXg7i/LiT5Ml3ld200d24ik4tk8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=E8VzRWfIuz2gxpz/5L+hEaJsK01wu6jxOZUqeMAh7xgBX9u/1WeWq7MZaFFxUwYI3
	 jiQCtW0VjSPwmJ0WGwrKwnqx7qytSdk0o0wRDgnq7b88ESkXv6MJ91zqg+RwEu+r99
	 D8TZ0YZQxl+R5JLqQzBTtRLcQxC4pIWh0F3bKclyl3M16OpTrCA/QzkcA9BXnR+3TY
	 VwVsEt/2rfs154rYBZQV0KkfsTUWLF0aNJrchLKdiIHHO+tJsOFajcqv87QSxkgP6d
	 OL1l5rDg6WridJ1+BiUxrPKF0fRyL4WWJdQ+SDKeGCn3YcyqSJTz3aUgw69a/9RFhk
	 +/mTbP4FyUkWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] PCI: meson: Propagate devm_add_action_or_reset()
 failure
To: "Shuvam Pandey" <shuvampandey1@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org
In-Reply-To: <177909148011.9588.6639767953842842291@gmail.com>
References: <177909148011.9588.6639767953842842291@gmail.com>
Date: Mon, 18 May 2026 08:20:22 +0000
Message-Id: <20260518082022.F4229C2BCB7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_092026_567615_F8447789 
X-CRM114-Status: GOOD (  13.11  )
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIE1pc3NpbmcgYC5yZW1v
dmVgIGNhbGxiYWNrIG9yIGAuc3VwcHJlc3NfYmluZF9hdHRycyA9IHRydWVgIGxlYXZlcyBQQ0kg
c3Vic3lzdGVtIGFuZCBQSFkgYWN0aXZlIGFmdGVyIGRyaXZlciB1bmJpbmQuCi0tCgpjb21taXQg
ZmRlOWUxY2Q5ZDA1NzMwZjcyYjA3NGZhOGVkZjNhMTIzM2QxMTM4NApBdXRob3I6IFNodXZhbSBQ
YW5kZXkgPHNodXZhbXBhbmRleTFAZ21haWwuY29tPgoKUENJOiBtZXNvbjogUHJvcGFnYXRlIGRl
dm1fYWRkX2FjdGlvbl9vcl9yZXNldCgpIGZhaWx1cmUKClRoaXMgY29tbWl0IHVwZGF0ZXMgbWVz
b25fcGNpZV9wcm9iZV9jbG9jaygpIHRvIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUKb2YgZGV2bV9h
ZGRfYWN0aW9uX29yX3Jlc2V0KCkuIElmIGl0IGZhaWxzLCB0aGUgZXJyb3IgaXMgcmV0dXJuZWQg
c28KdGhhdCB0aGUgcHJvYmUgZXJyb3IgcGF0aCBjYW4gdW53aW5kIG5vcm1hbGx5LgoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLW1lc29uLmMgYi9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbWVzb24uYwo+IGluZGV4IDA2OTQwODRmNjEyYjcuLjhk
NDk1YmNjM2E0MWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
LW1lc29uLmMKPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbWVzb24uYwo+
IEBAIC0yMDQsNyArMjA0LDkgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgY2xrICptZXNvbl9wY2ll
X3Byb2JlX2Nsb2NrKHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgCQlyZXR1cm4gRVJSX1BUUihyZXQp
Owo+ICAJfQo+ICAKPiAtCWRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIG1lc29uX3BjaWVf
ZGlzYWJsZV9jbG9jaywgY2xrKTsKPiArCXJldCA9IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChk
ZXYsIG1lc29uX3BjaWVfZGlzYWJsZV9jbG9jaywgY2xrKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0
dXJuIEVSUl9QVFIocmV0KTsKClRoaXMgaXNuJ3QgYSBidWcgaW50cm9kdWNlZCBieSB0aGlzIHBh
dGNoLCBidXQgY291bGQgdGhpcyBkcml2ZXIgYmUgdW5ib3VuZAp2aWEgc3lzZnMsIHRyaWdnZXJp
bmcgYSB1c2UtYWZ0ZXItZnJlZT8KClRoZSBtZXNvbl9wY2llX3Byb2JlKCkgZnVuY3Rpb24gcmVn
aXN0ZXJzIHRoZSBQQ0kgaG9zdCBjb250cm9sbGVyIHZpYQpkd19wY2llX2hvc3RfaW5pdCgmcGNp
LT5wcCkgYW5kIHBvd2VycyBvbiB0aGUgUEhZIHZpYSBtZXNvbl9wY2llX3Bvd2VyX29uKCkuCgpI
b3dldmVyLCB0aGUgZHJpdmVyIGRvZXMgbm90IGltcGxlbWVudCBhIC5yZW1vdmUgY2FsbGJhY2sg
dG8gY2FsbApkd19wY2llX2hvc3RfZGVpbml0KCkgYW5kIG1lc29uX3BjaWVfcG93ZXJfb2ZmKCks
IG5vciBkb2VzIGl0IHNldAouc3VwcHJlc3NfYmluZF9hdHRycyA9IHRydWUgaW4gaXRzIHBsYXRm
b3JtX2RyaXZlciBzdHJ1Y3QuCgpJZiB0aGUgZHJpdmVyIGlzIHVuYm91bmQgdmlhIC9zeXMvYnVz
L3BsYXRmb3JtL2RyaXZlcnMvbWVzb24tcGNpZS91bmJpbmQsCnRoZSBkZXZpY2UgY29yZSB3aWxs
IHRyaWdnZXIgZGV2cmVzIGNsZWFudXAuIFRoaXMgZnJlZXMgdGhlIG1wIHN0cnVjdHVyZSwKdW5t
YXBzIElPIG1lbW9yeSwgZGlzYWJsZXMgY2xvY2tzLCBhbmQgcmVsZWFzZXMgcmVzZXRzLgoKQmVj
YXVzZSB0aGUgUENJIHN1YnN5c3RlbSBpcyBuZXZlciBleHBsaWNpdGx5IHVucmVnaXN0ZXJlZCB2
aWEKZHdfcGNpZV9ob3N0X2RlaW5pdCgpLCB0aGUgUENJIGNvcmUgcmV0YWlucyByZWZlcmVuY2Vz
IHRvIHRoZSBkZXN0cm95ZWQgcm9vdApidXMgYW5kIGZyZWVkIHN0cnVjdHVyZXMuCgpDYW4gYSBz
dWJzZXF1ZW50IGFjY2VzcyBieSB0aGUgUENJIHN1YnN5c3RlbSBvciB1c2Vyc3BhY2UgY2F1c2Ug
YQp1c2UtYWZ0ZXItZnJlZSBhbmQgc3lzdGVtIGNyYXNoPwoKQWRkaXRpb25hbGx5LCB0aGUgUEhZ
IGlzIGxlZnQgcGVybWFuZW50bHkgcG93ZXJlZCBvbiB3aXRob3V0IGl0cyByZXF1aXJlZApjbG9j
a3MuIFNob3VsZCB0aGUgZHJpdmVyIGVpdGhlciBpbXBsZW1lbnQgYSBwcm9wZXIgdGVhcmRvd24g
aW4gYSAucmVtb3ZlCmhvb2sgb3IgcHJldmVudCB1bmJpbmRpbmcgYnkgc2V0dGluZyAuc3VwcHJl
c3NfYmluZF9hdHRycyA9IHRydWU/Cgo+ICAKPiAgCXJldHVybiBjbGs7Cj4gIH0KCi0tIApTYXNo
aWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMTc3OTA5MTQ4
MDExLjk1ODguNjYzOTc2Nzk1Mzg0Mjg0MjI5MUBnbWFpbC5jb20/cGFydD0xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
