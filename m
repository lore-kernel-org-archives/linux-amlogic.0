Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C1360A2620
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2026 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uftaR8DO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UEmCllkf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7z8zqQICm6zOdclpR58fobU0i7XXS2itsv8JQU+hhuo=; b=uftaR8DODdQcjhyNmHrIRKp/qL
	r33CnWsAePct5zVBqWoZCEM6a66phKBR6ufk4hP+OTPoyh8ONOYJc60SVtEPDimAZtzVEshtqf3U2
	KpqwHpgG6itz+VtK3c7IiPBnxzdjW0nvRTz+NYqwGk3k8YJhWxVqsoLbkyVF/ArvQNo6JnM3hljPx
	KgyJOsP55nBeDgYXQvpgKT3iMVjBfIOV374LqsFBtoCndaaSJoR7iO2i5GolcmZ822rSIbU0OAY6l
	7PHh2jbxpmOcefnJNlghRxEY2C09c2JokYzq3xBC1MZ3rk3+zhieBl/lrQU9xwps7a2zELHoJN4oT
	y7v8PQ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxTx-0000000BAvH-25k1;
	Thu, 19 Nov 2026 08:27:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxTw-0000000BAuf-1Bda
	for linux-amlogic@lists.infradead.org;
	Thu, 19 Nov 2026 08:27:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B986862941;
	Thu, 19 Nov 2026 08:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365A01F000C8;
	Thu, 19 Nov 2026 08:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795076819;
	bh=2nUzOUiLl/rliKZGphpwEUHVcG97xuXQod6AGDHIk4Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UEmCllkfjEpk6drgcaxUS6JXXJnGCf3yuUosATPiiDuoFCkdVTSboi4HhsY17N4QT
	 8PONkhKmvyFFCysL/qwyUKRLYtKxrA78GKBbJgm8K/F9EalJbzXP7EQ3cqoglXQ8mn
	 I82rgE681P8OqwrObauJZQfw2LYMMCbnZgjeQrnb4f0NU0sOs28Qz8H/K9j+sfL2R1
	 nYOErvwPTbRWcxVV9WDWTn52nwsvxcYdgl6z9F7CsEnnJeS33QcoYYS+LKCaTsLHj+
	 KnIzLp7salsBCVPkEsZ2h+fE3azfitEKFfC8oQcIM5cLGyqZXvLbKkXcjRkZdtINOg
	 lObsWEL3vNG9g==
Message-ID: <sashiko-outbox-222669@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc3: meson: g12a: disable vbus on removal
To: "Wang Haoran" <wanghr2026@mail.zgclab.edu.cn>
Cc: linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <1795076109480-15-f562c8e5@mail.zgclab.edu.cn>
References: <1795076109480-15-f562c8e5@mail.zgclab.edu.cn>
Date: Thu, 19 Nov 2026 08:26:58 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gdXNiOiBkd2MzOiBtZXNv
bi1nMTJhOiB1bmJhbGFuY2VkIHZidXMgZGlzYWJsZSBpbgogIGR3YzNfbWVzb25fZzEyYV9yZW1v
dmUoKQpJdCBhbHNvIG5vdGljZWQgMSByZWxhdGVkIHByZS1leGlzdGluZyBpc3N1ZSB0aGlzIHBh
dGNoIGRvZXMgbm90CmludHJvZHVjZToKLSBbSGlnaF0gdXNiOiBkd2MzOiBtZXNvbi1nMTJhOiB1
bmNsb2NrZWQgYWNjZXNzIGluCiAgZHdjM19tZXNvbl9nMTJhX2lycV90aHJlYWQoKSBbMV0KLS0K
CmNvbW1pdCBjNjFjNDA1Y2E0M2U1YjBkOTc2YmUxMTc3ODQwMjdlOGM5Y2UxMzBkCkF1dGhvcjog
V2FuZyBIYW9yYW4gPHdhbmdocjIwMjZAbWFpbC56Z2NsYWIuZWR1LmNuPgoKdXNiOiBkd2MzOiBt
ZXNvbjogZzEyYTogZGlzYWJsZSB2YnVzIG9uIHJlbW92YWwKClRoaXMgY29tbWl0IGRpc2FibGVz
IHRoZSB2YnVzIHJlZ3VsYXRvciBpbiBkd2MzX21lc29uX2cxMmFfcmVtb3ZlKCkgdG8KYmFsYW5j
ZSB0aGUgcmVndWxhdG9yX2VuYWJsZSgpIGNhbGwgaW4gZHdjM19tZXNvbl9nMTJhX3Byb2JlKCku
Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtbWVzb24tZzEyYS5jIGIvZHJp
dmVycy91c2IvZHdjMy9kd2MzLW1lc29uLWcxMmEuYwo+IGluZGV4IGNhMDdlODEzZmQ2NGYuLjRk
NjhiNTA3MjJlNzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLW1lc29uLWcx
MmEuYwo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1tZXNvbi1nMTJhLmMKPiBAQCAtODQ3
LDYgKzg0Nyw5IEBAIHN0YXRpYyB2b2lkIGR3YzNfbWVzb25fZzEyYV9yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiAgCQlwaHlfZXhpdChwcml2LT5waHlzW2ldKTsKPiAgCX0K
PiAgCj4gKwlpZiAocHJpdi0+dmJ1cykKPiArCQlyZWd1bGF0b3JfZGlzYWJsZShwcml2LT52YnVz
KTsKCltTZXZlcml0eTogTWVkaXVtXQpDYW4gdGhpcyBjYXVzZSBhbiB1bmJhbGFuY2VkIHJlZ3Vs
YXRvcl9kaXNhYmxlKCkgb24gcHJpdi0+dmJ1cyB3aGVuIHRoZQpjb250cm9sbGVyIGlzIHJlbW92
ZWQgd2hpbGUgaW4gZGV2aWNlIG1vZGU/CgpXaGVuIGR3YzNfbWVzb25fZzEyYV9vdGdfbW9kZV9z
ZXQoKSBzd2l0Y2hlcyB0byBQSFlfTU9ERV9VU0JfREVWSUNFLCBpdAphbHJlYWR5IGRpc2FibGVz
IHByaXYtPnZidXM6Cgpkcml2ZXJzL3VzYi9kd2MzL2R3YzMtbWVzb24tZzEyYS5jOmR3YzNfbWVz
b25fZzEyYV9vdGdfbW9kZV9zZXQoKSB7CiAgICAuLi4KCWlmIChwcml2LT52YnVzKSB7CgkJaWYg
KG1vZGUgPT0gUEhZX01PREVfVVNCX0RFVklDRSkKCQkJcmV0ID0gcmVndWxhdG9yX2Rpc2FibGUo
cHJpdi0+dmJ1cyk7CgkJZWxzZQoJCQlyZXQgPSByZWd1bGF0b3JfZW5hYmxlKHByaXYtPnZidXMp
OwoJCWlmIChyZXQpCgkJCXJldHVybiByZXQ7Cgl9CgoJcHJpdi0+b3RnX3BoeV9tb2RlID0gbW9k
ZTsKICAgIC4uLgp9CgpTaG91bGQgdGhpcyBjaGVjayBwcml2LT5vdGdfcGh5X21vZGUgPT0gUEhZ
X01PREVfVVNCX0hPU1QgYmVmb3JlIGNhbGxpbmcKcmVndWxhdG9yX2Rpc2FibGUocHJpdi0+dmJ1
cyksIG1hdGNoaW5nIGR3YzNfbWVzb25fZzEyYV9zdXNwZW5kKCk/Cgo+ICsKPiAgCXBtX3J1bnRp
bWVfZGlzYWJsZShkZXYpOwo+ICAJcG1fcnVudGltZV9wdXRfbm9pZGxlKGRldik7Cj4gIAlwbV9y
dW50aW1lX3NldF9zdXNwZW5kZWQoZGV2KTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBwcm9ibGVt
IHdhc24ndCBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBjYW4KZHdjM19tZXNvbl9nMTJh
X2lycV90aHJlYWQoKSByZWFkIHVuY2xvY2tlZCByZWdpc3RlcnMgZHVyaW5nIGRyaXZlciByZW1v
dmFsClsxXT8KClRoZSBPVEcgaW50ZXJydXB0IGlzIHJlcXVlc3RlZCB2aWEgZGV2bV9yZXF1ZXN0
X3RocmVhZGVkX2lycSgpLCBzbyBpdCBzdGF5cwplbmFibGVkIHVudGlsIGRldnJlcyBjbGVhbnVw
IHJ1bnMgYWZ0ZXIgZHdjM19tZXNvbl9nMTJhX3JlbW92ZSgpIHJldHVybnMsCndoaWxlIGR3YzNf
bWVzb25fZzEyYV9yZW1vdmUoKSBkaXNhYmxlcyB0aGUgY2xvY2tzIHZpYQpjbGtfYnVsa19kaXNh
YmxlX3VucHJlcGFyZSgpIGJlZm9yZSByZXR1cm5pbmc6CgpDUFUwICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBDUFUxCmR3YzNfbWVzb25fZzEyYV9yZW1vdmUoKQogIC4uLgogIGNsa19i
dWxrX2Rpc2FibGVfdW5wcmVwYXJlKCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZHdjM19tZXNvbl9nMTJhX2lycV90aHJlYWQoKQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGR3YzNfbWVzb25fZzEyYV9nZXRfaWQoKQogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmVnbWFwX3JlYWQocHJpdi0+dXNiX2dsdWVfcmVnbWFwLCAu
Li4pCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwtLSB1bmNsb2Nr
ZWQgcmVnaXN0ZXIgYWNjZXNzCmRldnJlc19yZWxlYXNlX2FsbCgpCgpJZiBhbiBPVEcgaW50ZXJy
dXB0IGZpcmVzIGluIHRoYXQgd2luZG93LCByZWFkaW5nIHByaXYtPnVzYl9nbHVlX3JlZ21hcCB3
aXRoCnRoZSBjbG9ja3MgZGlzYWJsZWQgdHJpZ2dlcnMgYW4gYXN5bmNocm9ub3VzIGV4dGVybmFs
IGFib3J0LgoKWzFdIGh0dHBzOi8vc2FzaGlrby5kZXYvIy9idWcvbGludXgtOTAxZDhmNzUtYjgw
ZS00M2Q3LWI1MGQtMWRjMTc1NWNlNGY1CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzE3OTUwNzYxMDk0ODAtMTUtZjU2MmM4ZTVAbWFpbC56
Z2NsYWIuZWR1LmNuP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
