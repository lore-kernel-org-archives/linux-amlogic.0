Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817E5606A323
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2026 09:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mh6j0vRN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QVJLq56d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cUGeU/66zy1DSjSN5U5xEQPwVBw9qpl91q8Vv9vFgpM=; b=mh6j0vRNGGNpr7q9dNTqShvddZ
	9vvSLoG10NFhbhH1om8KkL331BUFi27ur/4ooVfArriI1BNjiMicXs3IeSqyq4qsEEYJLXIcldBu1
	cPnSoBlZQUnsXmBrcBIVEYhQrLOZAYhQRHHBd5rejmscjeo9P5R4Nh4ZP648ZhAtYoIJN/qDtVflW
	vhoVDJlfPz66I8dBcArzIUBCycUJ6KA3cDklFeib1bmbeQpNOhTpxHXhii2f3V8gfBjlqczANENYQ
	cpOEvkQDTjwoa/os72jZQAbRCOG3sInmJKO/wr48KQBz0P7wTthfGIW8a+XrRLEwVst58U+7pyY08
	F5PUJUjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMjl-00000008t6g-2fma;
	Thu, 29 Oct 2026 09:47:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMjk-00000008t6I-2Yj2
	for linux-amlogic@lists.infradead.org;
	Thu, 29 Oct 2026 09:47:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B895343267;
	Thu, 29 Oct 2026 09:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422AC1F01825;
	Thu, 29 Oct 2026 09:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793267275;
	bh=/mskCAFxLZ+COhVPqAHcLrZn7vGJxbkrJ1/AStDRBmw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QVJLq56d9MLEwEOOO8aOB2B3vUo+cAT20hqEu4xUTfdLWYcWAWL8xxDlMKuLbqQIX
	 D+Fqpg3ldBdejPJJm0OE5uLglHjha+aYpC8EvscVLebx9hp5zhG/ib12dQJH6sDCP3
	 Uh5oE1MWxsEhuAhfuHvJTxXLG3OBnKc+f7o0tEPd8r3B8YPLstPPSdeVFW24qsYfSL
	 J9P8L6dxccbLCPKWwpx+f9/k3ViEwtVfC/BzVENXsCBYPUdMtHRiuBc5JzxqixJMKq
	 BCIiClSP8NSKDxqzxxme8GEE/q2nVTgiSUSJBhd0xX1Twd7zOtXsLkw1mZqAMJrOIz
	 goWlzVij2nRfQ==
Message-ID: <sashiko-outbox-189068@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC RFT v2 2/3] clk: divider: add
 CLK_DIVIDER_INVALID_ZERO flag
To: "Jian Hu" <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
Date: Thu, 29 Oct 2026 09:47:54 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGNsazogZGl2aWRlcjog
dW5oYW5kbGVkIHplcm8gZGl2aXNvciBpbiBkaXZpZGVyX3JvX2RldGVybWluZV9yYXRlKCkKLS0K
CmNvbW1pdCA1ZWMzMTE4YWVlMmYwMzg1NTU1MmM1OGE0YTg1MzNlMDM1YjU2NWJjCkF1dGhvcjog
SmlhbiBIdSA8amlhbi5odUBhbWxvZ2ljLmNvbT4KCmNsazogZGl2aWRlcjogYWRkIENMS19ESVZJ
REVSX0lOVkFMSURfWkVSTyBmbGFnCgpUaGlzIGNvbW1pdCBpbnRyb2R1Y2VzIHRoZSBDTEtfRElW
SURFUl9JTlZBTElEX1pFUk8gZmxhZyBmb3IgZGl2aWRlcnMgd2hlcmUKYSB6ZXJvIGRpdmlzb3Ig
dmFsdWUgcmVwcmVzZW50cyBhbiBpbnZhbGlkIGhhcmR3YXJlIHN0YXRlIHJhdGhlciB0aGFuIGEK
cGFzcy10aHJvdWdoLiBXaGVuIHRoaXMgZmxhZyBpcyBzZXQgYW5kIHRoZSBkaXZpc29yIGV2YWx1
YXRlcyB0byB6ZXJvLApkaXZpZGVyX3JlY2FsY19yYXRlKCkgcmV0dXJucyAwIHdpdGhvdXQgZW1p
dHRpbmcgYSB3YXJuaW5nLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvY2xrLWRpdmlkZXIu
YyBiL2RyaXZlcnMvY2xrL2Nsay1kaXZpZGVyLmMKPiBpbmRleCBmNjgyMTZjNjVkM2RmLi42YzE1
MjNkMjI0NzdjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL2Nsay1kaXZpZGVyLmMKPiArKysg
Yi9kcml2ZXJzL2Nsay9jbGstZGl2aWRlci5jCj4gQEAgLTE0Myw2ICsxNDMsOSBAQCB1bnNpZ25l
ZCBsb25nIGRpdmlkZXJfcmVjYWxjX3JhdGUoc3RydWN0IGNsa19odyAqaHcsIHVuc2lnbmVkIGxv
bmcgcGFyZW50X3JhdGUsCj4gIAo+ICAJZGl2ID0gX2dldF9kaXYodGFibGUsIHZhbCwgZmxhZ3Ms
IHdpZHRoKTsKPiAgCWlmICghZGl2KSB7Cj4gKwkJaWYgKGZsYWdzICYgQ0xLX0RJVklERVJfSU5W
QUxJRF9aRVJPKQo+ICsJCQlyZXR1cm4gMDsKCltTZXZlcml0eTogSGlnaF0KU2hvdWxkIGRpdmlk
ZXJfcm9fZGV0ZXJtaW5lX3JhdGUoKSBpbiBkcml2ZXJzL2Nsay9jbGstZGl2aWRlci5jIGFsc28g
aGFuZGxlCmEgemVybyBkaXZpc29yIHdoZW4gQ0xLX0RJVklERVJfSU5WQUxJRF9aRVJPIG9yIENM
S19ESVZJREVSX0FMTE9XX1pFUk8gaXMKc2V0PwoKV2hlbiBhIHJlYWQtb25seSBkaXZpZGVyIGhh
cyBhIHJlZ2lzdGVyIHZhbHVlIHZhbCB0aGF0IG1hcHMgdG8gZGl2ID09IDAgdmlhCl9nZXRfZGl2
KCkgKGZvciBleGFtcGxlLCB3aGVuIENMS19ESVZJREVSX0lOVkFMSURfWkVSTyBpcyBjb21iaW5l
ZCB3aXRoCkNMS19ESVZJREVSX09ORV9CQVNFRCBvciBhbiB1bm1hcHBlZCB0YWJsZSBlbnRyeSBh
bG9uZ3NpZGUKQ0xLX0RJVklERVJfUkVBRF9PTkxZKSwgY2FsbGluZyBjbGtfcm91bmRfcmF0ZSgp
IG9yIGNsa19zZXRfcmF0ZSgpIGludm9rZXMKY2xrX2RpdmlkZXJfZGV0ZXJtaW5lX3JhdGUoKS0+
ZGl2aWRlcl9yb19kZXRlcm1pbmVfcmF0ZSgpOgoKZHJpdmVycy9jbGsvY2xrLWRpdmlkZXIuYzpk
aXZpZGVyX3JvX2RldGVybWluZV9yYXRlKCkgewoJaW50IGRpdjsKCglkaXYgPSBfZ2V0X2Rpdih0
YWJsZSwgdmFsLCBmbGFncywgd2lkdGgpOwoKCS8qIEV2ZW4gYSByZWFkLW9ubHkgY2xvY2sgY2Fu
IHByb3BhZ2F0ZSBhIHJhdGUgY2hhbmdlICovCglpZiAoY2xrX2h3X2dldF9mbGFncyhodykgJiBD
TEtfU0VUX1JBVEVfUEFSRU5UKSB7CgkJaWYgKCFyZXEtPmJlc3RfcGFyZW50X2h3KQoJCQlyZXR1
cm4gLUVJTlZBTDsKCgkJcmVxLT5iZXN0X3BhcmVudF9yYXRlID0gY2xrX2h3X3JvdW5kX3JhdGUo
cmVxLT5iZXN0X3BhcmVudF9odywKCQkJCQkJCSAgcmVxLT5yYXRlICogZGl2KTsKCX0KCglyZXEt
PnJhdGUgPSBESVZfUk9VTkRfVVBfVUxMKCh1NjQpcmVxLT5iZXN0X3BhcmVudF9yYXRlLCBkaXYp
OwoKCXJldHVybiAwOwp9CgpVbmxpa2UgZGl2aWRlcl9yZWNhbGNfcmF0ZSgpLCBkaXZpZGVyX3Jv
X2RldGVybWluZV9yYXRlKCkgZG9lcyBub3QgY2hlY2sgZm9yCiFkaXYgYmVmb3JlIGNhbGxpbmcg
RElWX1JPVU5EX1VQX1VMTCgpLCB3aGljaCB3aWxsIHRyaWdnZXIgYSBkaXZpc2lvbiBieSB6ZXJv
CmluIHRoZSBrZXJuZWwgd2hlbiBkaXYgaXMgMC4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEwMjktbWVzb25fcmVmYWN0b3Jfbi12
Mi0wLWZmNGFjNzRlNTI3YkBhbWxvZ2ljLmNvbT9wYXJ0PTIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
