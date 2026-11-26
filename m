Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3235A606A31C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f69RzkUW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KRKIoktf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lV7kfRf6qEE7pntuxpOh2X3q7/wl+csYppEMUhUUGNU=; b=f69RzkUWxqifJc/k2p1Ppp50qS
	yx6v7L/1chuzXf2ZsO/cqcvCrunKOTYh+bG4sp55KjnA3g+++veclgEZ6MqtzxAFuSJ5MM/ITF9Os
	7qprsNex6xLH8oEuvN59vAiaXXTrPqq01emWKWOsnyE06eM6sC1Fuiy+mFhzRToU/9DSUHi9iLj9X
	CKyD7WGOu26A6fV500pIA8Zf+qkjxHBkGeXHBv7FyTWQ82fqKF+JEKCO7YWqHwGQReAesilYfEF1g
	XMHX+ot4eSwnALeOIDF3soGx/K3g/S6hCkJ8ma0SflQvbwYrdhwFTEM8ekXY/+NG24T5w0hMOyd7V
	vd8vDXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfU8-0000000ENuV-3LXS;
	Thu, 26 Nov 2026 19:50:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfU7-0000000ENu7-1S0L
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:50:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 979AD60D72;
	Thu, 26 Nov 2026 19:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0EB31F000C0;
	Thu, 26 Nov 2026 19:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795722622;
	bh=0nGU2S1TqSU9SkdknDv1gl7nTTx1aS2r7KELR2cPYwA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KRKIoktf1f7o9I7i25GYuHCN/guiMCEp9x8+P1w2INzRRpiWrFYIodOc7GH96TMgy
	 FXZi8+HHzCU9F2uu5rG2hKAuq0ypmyXpb/gWv52gCxNcyfO61qjYkETaB1p7Vtk3os
	 lNFDQg3DNVKRa3t7XzK0rjFTwP4DgG+Jt3UG8K0RZ+42zXMTiwMyWUMgoUo9u21/pT
	 3jpksvTaAuW4BUE0BRehN5PcCos3DOvk3kmVW1YgETFA79BPl7on+fDpkR02pn7Sg4
	 6T8oMTdphfKbfv9VWWfsPuYEaeX74c91chKSK8epxbGjk8hESAebSxBVRSpOlPEPVZ
	 kFV8DXhL82ZWQ==
Message-ID: <sashiko-outbox-236125@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 19/25] crypto: amlogic: hasher: add one-shot digest
 path
To: "Jose Nieto" <jnieto.alaber@gmail.com>, "Corentin Labbe" <clabbe@baylibre.com>, "Herbert
 Xu" <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
In-Reply-To: <20261126193241.1471372-20-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261126193241.1471372-20-jnieto.alaber@gmail.com>
Date: Thu, 26 Nov 2026 19:50:21 +0000
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwKaXNzdWVzIHRvIGNvbnNpZGVyOgotIFtNZWRpdW1dIGNyeXB0bzogYW1sb2dp
YzogdW5tYXBwZWQgcGFydGlhbF9hZGRyIERNQSBidWZmZXIgb24KICBtZXNvbl9raWNrX2hhcmR3
YXJlKCkgZXJyb3IKLSBbTWVkaXVtXSBjcnlwdG86IGFtbG9naWM6IHVucmVtb3ZlZCBkZWJ1Z2Zz
IGRpciBvbiBoYXNoZXIgaW5pdCBmYWlsdXJlCiAgaW4gbWVzb25fY3J5cHRvX3Byb2JlKCkKLS0K
CmNvbW1pdCA4YzAyNDhjNGI3YzlmZmIzNmI5Njg3NTBjZGNkNWRmY2I3YTJiMWYxCkF1dGhvcjog
Sm9zZSBOaWV0byA8am5pZXRvLmFsYWJlckBnbWFpbC5jb20+CgpjcnlwdG86IGFtbG9naWM6IGhh
c2hlcjogYWRkIG9uZS1zaG90IGRpZ2VzdCBwYXRoCgpUaGlzIGNvbW1pdCBpbXBsZW1lbnRzIHRo
ZSBhaGFzaCAtPmRpZ2VzdCBjYWxsYmFjayBmb3Igb25lLXNob3QgU0hBCnJlcXVlc3RzIGFuZCB1
bnJlZ2lzdGVycyB0aGUgaGFzaGVyIGFsZ29yaXRobXMgb24gZGV2aWNlIHJlbW92YWwuCgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2NyeXB0by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWNvcmUuYyBiL2Ry
aXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtY29yZS5jCj4gaW5kZXggM2E2YmFjMTBi
YjA0Yi4uZTc5MTc1MzY4ZDhjZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NyeXB0by9hbWxvZ2lj
L2FtbG9naWMtZ3hsLWNvcmUuYwo+ICsrKyBiL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dp
Yy1neGwtY29yZS5jCj4gQEAgLTI2OSw2ICsyNjksNyBAQCBzdGF0aWMgdm9pZCBtZXNvbl9jcnlw
dG9fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlkZWJ1Z2ZzX3JlbW92
ZV9yZWN1cnNpdmUobWMtPmRiZ2ZzX2Rpcik7Cj4gICNlbmRpZgo+ICAKPiArCW1lc29uX2hhc2hl
cl91bnJlZ2lzdGVyKG1jKTsKPiAgCW1lc29uX2NpcGhlcl91bnJlZ2lzdGVyKG1jKTsKPiAgCj4g
IAltZXNvbl9mcmVlX2NoYW5saXN0KG1jLCBtYy0+Zmxvd19jbnQgLSAxKTsKCltTZXZlcml0eTog
TWVkaXVtXQpEb2VzIG1lc29uX2NyeXB0b19wcm9iZSgpIGxlYWsgbWMtPmRiZ2ZzX2RpciB3aGVu
IG1lc29uX2hhc2hlcl9yZWdpc3RlcigpCmZhaWxzPwoKZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9h
bWxvZ2ljLWd4bC1jb3JlLmM6bWVzb25fY3J5cHRvX3Byb2JlKCkgewogICAgLi4uCglpZiAoSVNf
RU5BQkxFRChDT05GSUdfQ1JZUFRPX0RFVl9BTUxPR0lDX0dYTF9ERUJVRykpIHsKCQlzdHJ1Y3Qg
ZGVudHJ5ICpkYmdmc19kaXI7CgoJCWRiZ2ZzX2RpciA9IGRlYnVnZnNfY3JlYXRlX2RpcigiZ3hs
LWNyeXB0byIsIE5VTEwpOwoJCWRlYnVnZnNfY3JlYXRlX2ZpbGUoInN0YXRzIiwgMDQ0NCwgZGJn
ZnNfZGlyLCBtYywgJm1lc29uX2RlYnVnZnNfZm9wcyk7CiNpZmRlZiBDT05GSUdfQ1JZUFRPX0RF
Vl9BTUxPR0lDX0dYTF9ERUJVRwoJCW1jLT5kYmdmc19kaXIgPSBkYmdmc19kaXI7CiNlbmRpZgoJ
fQoKCWVyciA9IG1lc29uX2hhc2hlcl9yZWdpc3RlcihtYyk7CglpZiAoZXJyKQoJCWdvdG8gZXJy
b3JfaGFzaGVyOwoKCXJldHVybiAwOwoKZXJyb3JfaGFzaGVyOgoJbWVzb25fY2lwaGVyX3VucmVn
aXN0ZXIobWMpOwogICAgLi4uCn0KClVubGlrZSBtZXNvbl9jcnlwdG9fcmVtb3ZlKCksIHRoZSBl
cnJvcl9oYXNoZXIgdW53aW5kIHBhdGggZG9lcyBub3QgY2FsbApkZWJ1Z2ZzX3JlbW92ZV9yZWN1
cnNpdmUobWMtPmRiZ2ZzX2RpcikuICBXaGVuIHByb2JlIGZhaWxzLCBkZXZyZXMgZnJlZXMKbWMg
YW5kIGxlYXZlcyB0aGUgZGVidWdmcyBzdGF0cyBmaWxlIHdpdGggYSBkYW5nbGluZyBwcml2YXRl
IHBvaW50ZXIsCmNhdXNpbmcgYSB1c2UtYWZ0ZXItZnJlZSBpbiBtZXNvbl9kZWJ1Z2ZzX3Nob3co
KSBpZiB0aGUgZmlsZSBpcyByZWFkLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcnlwdG8vYW1s
b2dpYy9hbWxvZ2ljLWd4bC1oYXNoZXIuYyBiL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dp
Yy1neGwtaGFzaGVyLmMKPiBpbmRleCBjODM3MzllYzM0NTY2Li45NzhjZGNkOGE0ZjkxIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtaGFzaGVyLmMKPiAr
KysgYi9kcml2ZXJzL2NyeXB0by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWhhc2hlci5jClsgLi4uIF0K
PiBAQCAtMzEwLDYgKzMyOSw5IEBAIHN0YXRpYyBpbnQgbWVzb25faGFzaGVyX2RvX29uZV9yZXF1
ZXN0KHN0cnVjdCBjcnlwdG9fZW5naW5lICplbmdpbmUsIHZvaWQgKmFyZXEpCj4gIAkJaWYgKCFj
dHgudG9kbyAmJiBjdHgubmJ5dGVzKQo+ICAJCQljb250aW51ZTsKPiAgCj4gKwkJaWYgKCFjdHgu
dG9kbyAmJiByY3R4LT5maW5hbF9yZXEgJiYgcmN0eC0+cGFydGlhbF9zaXplKQo+ICsJCQljb250
aW51ZTsKPiArCj4gIAkJaWYgKCFjdHgudG9kbyAmJiAhcmN0eC0+ZmluYWxfcmVxICYmICFjdHgu
dGxvZmZzZXQpCj4gIAkJCWNvbnRpbnVlOwoKW1NldmVyaXR5OiBNZWRpdW1dCkRvZXMgbWVzb25f
aGFzaGVyX2RvX29uZV9yZXF1ZXN0KCkgbGVhayB0aGUgcmN0eC0+cGFydGlhbF9hZGRyIERNQQpt
YXBwaW5nIHdoZW4gbWVzb25fa2lja19oYXJkd2FyZSgpIGZhaWxzPwoKbWVzb25fZmlsbF9wYXJ0
aWFsX2J1ZmZlcigpIG1hcHMgcmN0eC0+cGFydGlhbCB3aXRoIGRtYV9tYXBfc2luZ2xlKCkgYW5k
CnNldHMgcmN0eC0+cGFydGlhbF9tYXBwZWQgPSB0cnVlLiAgSWYgd2FpdF9mb3JfY29tcGxldGlv
bl90aW1lb3V0KCkgdGltZXMKb3V0IGluIG1lc29uX2tpY2tfaGFyZHdhcmUoKSwgaXQgcmV0dXJu
cyBiZWZvcmUgdW5tYXBwaW5nCnJjdHgtPnBhcnRpYWxfYWRkciwgYW5kIHRoZSBmYWlsIHBhdGgg
aW4gbWVzb25faGFzaGVyX2RvX29uZV9yZXF1ZXN0KCkKb25seSB1bm1hcHMgcmVxLT5zcmMgYW5k
IGN0eC5zdGF0ZV9hZGRyOgoKZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1oYXNo
ZXIuYzptZXNvbl9raWNrX2hhcmR3YXJlKCkgewogICAgLi4uCglyZXQgPSB3YWl0X2Zvcl9jb21w
bGV0aW9uX3RpbWVvdXQoJmZsb3ctPmNvbXBsZXRlLAoJCQkJCSAgbXNlY3NfdG9famlmZmllcyg1
MDApKTsKCWlmIChyZXQgPT0gMCkgewoJCWRldl9lcnIobWMtPmRldiwgIkRNQSB0aW1lb3V0IGZv
ciBmbG93ICVkXG4iLCByY3R4LT5mbG93KTsKCQlyZXR1cm4gLUVJTlZBTDsKCX0gZWxzZSBpZiAo
cmV0IDwgMCkgewoJCWRldl9lcnIobWMtPmRldiwgIldhaXRpbmcgZm9yIERNQSBjb21wbGV0aW9u
IGlzIGZhaWxlZCAoJWQpXG4iLCByZXQpOwoJCXJldHVybiByZXQ7Cgl9CgoJaWYgKHJjdHgtPnBh
cnRpYWxfbWFwcGVkKSB7CgkJZG1hX3VubWFwX3NpbmdsZShtYy0+ZGV2LCByY3R4LT5wYXJ0aWFs
X2FkZHIsCgkJCQkgcmN0eC0+cGFydGlhbF9zaXplLAoJCQkJIERNQV9UT19ERVZJQ0UpOwogICAg
Li4uCn0KCldoZW4gYSBETUEgdGltZW91dCBvY2N1cnMgd2hpbGUgZmx1c2hpbmcgYSBwYXJ0aWFs
IGJsb2NrLApyY3R4LT5wYXJ0aWFsX2FkZHIgcmVtYWlucyBtYXBwZWQuCgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTI2MTkzMjQx
LjE0NzEzNzItMS1qbmlldG8uYWxhYmVyQGdtYWlsLmNvbT9wYXJ0PTE5CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
