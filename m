Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADA3606A31C
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2026 14:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OrquAZ97;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=JXaesICp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=elvx3kxEjUIOLMUPGdzQhCL13Sj3n2FWjEdDvIkm9Ck=; b=OrquAZ97em7D8VGQh7Hx/q1kJM
	nJi4HLgqwezUcIOOcNI8Mr3UhqVczwzNDjdT8NGdGfzQyS3xjPeZDZtYrYQsTtGojQjjUERmKXW/H
	2aISTioi6pXxNaqtGHFaslIDxFSWwTNu1gCi7zlFE7ccz1qe2tCyrFH5qF1IoUep4CnUP8FVrRUkw
	BrGU6CzQMcFhuq9MpNYs3KMiBkEvNeYGny5FrdPckZujG7unAhI8QfJ5hRdYHTtzomLiMQBK28PQw
	jyuS5f8UKFtpqO3m0/euKL1kRiOdjRVEYFtkw8CG7BjV5tYlv9XGyOmcdjxC9da9F2hLiSYDVFlCM
	4u7jIeiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTh5a-00000009B1z-1GGW;
	Wed, 18 Nov 2026 14:56:46 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTh5W-00000009B1I-2YO8;
	Wed, 18 Nov 2026 14:56:44 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jV4S43N4hzMlyX;
	Wed, 18 Nov 2026 15:56:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795013796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FYR6lAR4F/kvDycE+JdAzmdMYH84ljUk0yMV3grV5hc=;
	b=JXaesICprn2CjnyE3WbO0RBrhdYyl2dJwYp//aiyC6Noq2rjpsgib9XRUqsadUfJ9uE3w1
	dxKZ4GEUL34w4XtnHTnAwi13rpmb8PKj7zGdSXzlsiCD9G2PVmqwHjOY5oDfuAJx4L8QF5
	0RvWnV4O4slFX8sIiXhskD88hZGoP1PTC1TNbmI4I2fO4HJ85JuD/ej2kj2fPQH7XNE62x
	0oO0zKOrEQFharLAyIGSDgaYgzq1FO1uD4LaXfHJpo6hs+PckE4agQVPI8C4AJEqYYDq63
	B8rFp88zeKzw2PawoZKe1P4+8mAps2RRpoUlW0TKhNn1Kswdbm0DbAb3vpNBjA==
Message-ID: <d825fa6717dc907247cbaec6c7555eccb5676b9b.camel@mailbox.org>
Subject: Re: [PATCH] ASoC: meson: aiu-fifo: prevent sleeping when spinlock
 is held
From: Manuel Ebner <manuelebner@mailbox.org>
To: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 18 Nov 2026 15:56:32 +0100
In-Reply-To: <34e02f23-1ace-4a13-9353-b73a1464a592@baylibre.com>
References: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
	 <0140bc0b3d1078bf8851340e0cb893b2907e146a.camel@mailbox.org>
	 <34e02f23-1ace-4a13-9353-b73a1464a592@baylibre.com>
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: b463c6fe2c6dcd9de92
X-MBO-RS-META: 1twaz6xuakpuacrj8wctghpe57hhkz9j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_065643_404747_A0E9955D 
X-CRM114-Status: GOOD (  27.08  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCAyMDI2LTExLTE2IGF0IDE3OjQxICswMTAwLCBWYWxlcmlvIFNldHRpIHdyb3RlOgo+
IEhpIE1hbnVlbAo+IAo+ID4gSSBoYXZlIHJlYWQgeW91ciBwYXRjaCBhbmQgaGF2ZSBhIHF1ZXN0
aW9uLgo+IFsuLi5dCgpBY2suCgo+ID4gPiBAQCAtNDgsMTQgKzQ5LDIyIEBAIHN0YXRpYyBpbnQg
YWl1X2ZpZm9faTJzX3RyaWdnZXIoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0s
IGludCBjbWQsCj4gPiA+IMKgwqAJCQkJc3RydWN0IHNuZF9zb2NfZGFpICpkYWkpCj4gPiA+IMKg
wqB7Cj4gPiA+IMKgwqAJc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQgPSBkYWkt
PmNvbXBvbmVudDsKPiA+ID4gKwl1bnNpZ25lZCBpbnQgdmFsOwo+ID4gCj4gPiBIZXJlIGlzIHZh
bC4KPiA+IAo+ID4gPiArCWludCByZXQ7Cj4gPiA+IMKgIAo+ID4gPiDCoMKgCXN3aXRjaCAoY21k
KSB7Cj4gPiA+IMKgwqAJY2FzZSBTTkRSVl9QQ01fVFJJR0dFUl9TVEFSVDoKPiA+ID4gwqDCoAlj
YXNlIFNORFJWX1BDTV9UUklHR0VSX1JFU1VNRToKPiA+ID4gwqDCoAljYXNlIFNORFJWX1BDTV9U
UklHR0VSX1BBVVNFX1JFTEVBU0U6Cj4gPiA+IC0JCXNuZF9zb2NfY29tcG9uZW50X3dyaXRlKGNv
bXBvbmVudCwgQUlVX1JTVF9TT0ZULAo+ID4gPiAtCQkJCQlBSVVfUlNUX1NPRlRfSTJTX0ZBU1Qp
Owo+ID4gPiAtCQlzbmRfc29jX2NvbXBvbmVudF9yZWFkKGNvbXBvbmVudCwgQUlVX0kyU19TWU5D
KTsKPiA+ID4gKwkJcmV0ID0gcmVnbWFwX3dyaXRlKGNvbXBvbmVudC0+cmVnbWFwLCBBSVVfUlNU
X1NPRlQsIEFJVV9SU1RfU09GVF9JMlNfRkFTVCk7Cj4gPiA+ICsJCWlmIChyZXQgPCAwKQo+ID4g
PiArCQkJcmV0dXJuIHNuZF9zb2NfcmV0KGNvbXBvbmVudC0+ZGV2LCByZXQsCj4gPiA+ICsJCQkJ
CcKgwqAgIkZhaWxlZCB0byB3cml0ZSByZWdpc3RlciBvbiB0cmlnZ2VyIik7Cj4gPiA+ICsKPiA+
ID4gKwkJcmV0ID0gcmVnbWFwX3JlYWQoY29tcG9uZW50LT5yZWdtYXAsIEFJVV9JMlNfU1lOQywg
JnZhbCk7Cj4gPiAKPiA+IFNvIGFzIEkgdW5kZXJzdGFuZCB2YWwvJnZhbCBpcyBqdXN0IHRoZXJl
IHRvIGxpc3RlbiBhbmQgZm9yZ2V0IHdoYXQgZ2V0cyByZXR1cm5lZC4KPiA+IFRoYXQncyBraW5k
YSB3ZWlyZCwgYnV0IG5vdCBhbiBpc3N1ZS4KPiAKPiBXZWxsLCBJIHVuZGVyc3RhbmQgdGhhdCBp
dCBtaWdodCBiZSB3ZWlyZCBmcm9tIGEgc29mdHdhcmUgcG9pbnQgb2YgdmlldywgCj4gYnV0IGl0
IG1ha2VzIHNlbnNlIGZyb20gdGhlIGhhcmR3YXJlIG9uZS4gQWNjb3JkaW5nIHRvIHRoZSBtYW51
YWw6Cj4gCj4gwqDCoMKgwqAgQSByZWFkIGZyb20gdGhpcyByZWdpc3RlciBpbmRpY2F0ZXMgdGhh
dCB0aGUgbmV4dCBzYW1wbGUgdG8gYmUKPiDCoMKgwqDCoCBzZW50IG91dCBvZiB0aGUgaW50ZXJm
YWNlIHNob3VsZCBnbyBpbnRvIHRoZSBsZWZ0IGNoYW5uZWwgb2YKPiDCoMKgwqDCoCB0aGUgZGFj
Lgo+ID4gPiBAQCAtMzcsOCArMzgsMTEgQEAgc25kX3BjbV91ZnJhbWVzX3QgYWl1X2ZpZm9fcG9p
bnRlcihzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwKPiA+ID4gwqDCoAlzdHJ1
Y3QgYWl1X2ZpZm8gKmZpZm8gPSBzbmRfc29jX2RhaV9kbWFfZGF0YV9nZXRfcGxheWJhY2soZGFp
KTsKPiA+ID4gwqDCoAlzdHJ1Y3Qgc25kX3BjbV9ydW50aW1lICpydW50aW1lID0gc3Vic3RyZWFt
LT5ydW50aW1lOwo+ID4gPiDCoMKgCXVuc2lnbmVkIGludCBhZGRyOwo+ID4gCj4gPiBIZXJlIGl0
J3MgYWRkci4gSXQncyBub3QgeW91cnMsIHlvdSBqdXN0IGtlcHQgaXQuCj4gPiAKPiA+ID4gKwlp
bnQgcmV0Owo+ID4gPiDCoCAKPiA+ID4gLQlhZGRyID0gc25kX3NvY19jb21wb25lbnRfcmVhZChj
b21wb25lbnQsIGZpZm8tPm1lbV9vZmZzZXQgKyBBSVVfTUVNX1JEKTsKPiA+ID4gKwlyZXQgPSBy
ZWdtYXBfcmVhZChjb21wb25lbnQtPnJlZ21hcCwgZmlmby0+bWVtX29mZnNldCArIEFJVV9NRU1f
UkQsICZhZGRyKTsKPiA+IAo+ID4gU2ltaWxhciBhcyBhYm92ZS4gQnV0IHdoeSBpcyBhZGRyIGhl
cmUgYW5kIHZhbCBhYm92ZT8gSSB0aGluayBpdCdzIHRoZSBzYW1lIHJvbGUgaW4gcmVnbWFwX3Jl
YWQoKS4KPiA+IFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gbmFtZSBib3RoIHRoZSBzYW1lPyBJZiBp
dCBkb2VzLCBJJ20gaW4gZmF2b3Igb2YgdmFsLCBiZWNhdXNlIHRoYXQncyBpbiB0aGUKPiA+IGtl
cm5lbC1kb2Mgb2YgcmVnbWFwX3JlYWQoKS4KPiA+IAo+ID4gPiArCWlmIChyZXQgPCAwKQo+ID4g
PiArCQlyZXR1cm4gc25kX3NvY19yZXQoY29tcG9uZW50LT5kZXYsIHJldCwgIkZhaWxlZCB0byBy
ZWFkIEZJRk8gcG9pbnRlciIpOwo+ID4gPiDCoCAKPiA+ID4gwqDCoAlyZXR1cm4gYnl0ZXNfdG9f
ZnJhbWVzKHJ1bnRpbWUsIGFkZHIgLSAodW5zaWduZWQgaW50KXJ1bnRpbWUtPmRtYV9hZGRyKTsK
PiA+IEhlcmUgYWRkciBpcyB1c2VkLCBzbyBpdCdzIG5vdCBzYW1lIGFzIGFib3ZlLgo+ID4gCj4g
PiBMb29raW5nIGZvcndhcmQgdG8geW91ciBQT1YuCj4gCj4gSGVyZSBJIGxlZnQgJ2FkZHInIHRv
IG1pbmltaXplIHRoZSBudW1iZXIgb2YgY2hhbmdlcyBpbiB0aGUgcGF0Y2guCj4gTG9va2luZyBh
dCBpdCBhZ2FpbiBub3csIEknbSBtb3JlIGluIGZhdm9yIG9mIGtlZXBpbmcgaXQgYXMgJ2FkZHIn
LiBJIAo+IHVuZGVyc3RhbmQgdGhhdCB0aGUgcmVnbWFwIGRvY3VtZW50YXRpb24gdXNlcyAndmFs
JywgYnV0IGluIHRoaXMgY2FzZSB3ZSAKPiBrbm93IHRoYXQgdGhlIHJldHVybmVkIHZhbHVlIGlz
IHJlYWxseSBhbiBhZGRyZXNzIG9mIG1lbW9yeSwgbm90IGp1c3QgYSAKPiBnZW5lcmljIHZhbHVl
Lgo+IEFsc28ga2VlcGluZyB0aGUgbmFtZSBhcyBpdCBpcyBtYWtlcyB0aGUgbGFzdCBsaW5lIG9m
IHRoYXQgZnVuY3Rpb24gCj4gcmVhZGluZyBzbW9vdGhseS4KPiAKPiBIb3dldmVyIGlmIHlvdSBk
ZWVtIHRoaXMgdW5hY2NlcHRhYmxlIEkgY2FuIGNoYW5nZSBhcyB5b3UgcmVxdWVzdGVkLiAKPiBK
dXN0IGxldCBtZSBrbm93LgoKSSdtIGdvb2Qgd2l0aCAnYWRkcicsIHRoYW5rcyBmb3IgdGhlIGV4
cGxhbmF0aW9uLiAKIE1hbnVlbAoKPiAKPiBCZXN0IHJlZ2FyZHMsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
