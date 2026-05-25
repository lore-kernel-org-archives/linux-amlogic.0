Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B372CD5BD0
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 May 2026 12:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kv9R+1zOPzOCvUAQPTE5sue/8KL1KCmeS5VTzJ5LbYU=; b=pcTgdXb4Gfj9q1
	x/Mdho5D5cA5AKUNuwnTpP1kYakRdzjqW1NFsN+4VxM5BSHfRTkTYzLFXKShXVKHnfV0XaylDma/l
	zQH+6USqSHp0jOKlROH+7Rp0hN5Q3p/pHjmHFjEF2dxX8auqi1b20mCBmXGOBOcsmQnxemMK04hrS
	a2pX1Lg87q5XHh8OqyTtkwFj4TFfzhOt3GafDxwp/+q+WzLUA/+7jAvvFjQXoCtr6PfEyo3dvzpbo
	Y202S5P1bL3f4tXO1q3mNw3ktjsZr2RLVFk2mxmjYIxtBQOW7sxniP00Qb1HtgAe35PhZR9WElcS1
	I/R/kaLDjCyH9+6cKogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUm9-0000000HEIi-1LiY;
	Mon, 25 May 2026 12:51:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUm7-0000000HEI4-3rNI
	for linux-amlogic@lists.infradead.org;
	Mon, 25 May 2026 12:51:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 05149600BB;
	Mon, 25 May 2026 12:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887021F000E9;
	Mon, 25 May 2026 12:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779713478;
	bh=fWWauBwqRBZPDIOwC6o4G9hw9v6WyNcj684Vg6K9vIs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aH7J1sAGUvwb0wi4wv4cb3pnLDM/Qbnm4YDlAZqurKC+jCRxFC3O1HXHEVm9wiCbY
	 PWL+nDn0O1xTP6oeEG2Z2z9ZvO5Mxhi+bSwWbH6Kay48CksZqBoxAIbLoksv9/jFsn
	 9lQTxGhU1nlbtkx6y7TfYC2H/oxpVvsXELGPLRNn6AlLcej5KmXHP1smyFyhrNdkfc
	 86Wuyhzlf7/QA+tE/LXsrn5YoNLR46hYeH2o1lATEZVMW7yKaTXauFOTTx6N1EZXcW
	 3Go5TWMrp6Apc1k1xagJUPtBOrHDcuk5uGlNlC00d+e6tbWzr3DWJ0YxzkJtjogr4s
	 JXCfqv4b/OeuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/6] media: meson: vdec: Isolate error path buffer
 flush to the active queue
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260525095216.12078-6-linux.amoon@gmail.com>
References: <20260525095216.12078-6-linux.amoon@gmail.com>
Date: Mon, 25 May 2026 12:51:18 +0000
Message-Id: <20260525125118.887021F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBUaGUgZXJyb3IgcGF0aCBpbiBgdmRlY19zdGFydF9zdHJlYW1pbmcoKWAgYnlwYXNz
ZXMgdGhlIHRlYXJkb3duIGJsb2NrLCBjYXVzaW5nIHBlcm1hbmVudCBtZW1vcnkgbGVha3Mgb2Yg
aGFyZHdhcmUgY2FudmFzIElEcyBhbmQgY29kZWMgcHJpdmF0ZSBkYXRhLgotLQoKY29tbWl0IGM3
MmRhYjNjODE2ZmVhNjE3ZTQ3YWVmODVlNGNlNTI2ZmM5MTBiOGEKQXV0aG9yOiBBbmFuZCBNb29u
IDxsaW51eC5hbW9vbkBnbWFpbC5jb20+ClN1YmplY3Q6IG1lZGlhOiBtZXNvbjogdmRlYzogSXNv
bGF0ZSBlcnJvciBwYXRoIGJ1ZmZlciBmbHVzaCB0byB0aGUgYWN0aXZlIHF1ZXVlCgpXaGVuIHZk
ZWNfc3RhcnRfc3RyZWFtaW5nKCkgZmFpbHMsIHRoaXMgY29tbWl0IGxpbWl0cyBjbGVhcmluZyBi
dWZmZXJzIHRvCnRoZSBzcGVjaWZpYyBxdWV1ZSB0eXBlIHRoYXQgZmFpbGVkIHRvIGluaXRpYWxp
emUuIFRoaXMgcHJldmVudHMgdmlkZW9idWYyCmRlYWRsb2NrcyB3aGVuIHRoZSBvdGhlciBxdWV1
ZSBpcyBhbHJlYWR5IHN0cmVhbWluZyBzdWNjZXNzZnVsbHkuCgpDbG9zZXM6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDI2MDUyMTA5MDk0NC5GMzU0MDFGMDBBM0RAc210cC5rZXJuZWwu
b3JnLwpGaXhlczogM2U3ZjUxYmQ5NjA3ICgibWVkaWE6IG1lc29uOiBhZGQgdjRsMiBtMm0gdmlk
ZW8gZGVjb2RlciBkcml2ZXIiKQoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL21lZGlh
L21lc29uL3ZkZWMvdmRlYy5jIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRl
Yy5jCj4gaW5kZXggYjMxYmYwOGFmODhlNi4uOTI1NTM3YmQ0ZDBiMyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjLmMKPiArKysgYi9kcml2ZXJzL3N0
YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjLmMKPiBAQCAtMzcyLDE1ICszNzIsMTUgQEAgc3Rh
dGljIGludCB2ZGVjX3N0YXJ0X3N0cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVlICpxLCB1bnNpZ25l
ZCBpbnQgY291bnQpCj4gIAlkbWFfZnJlZV9jb2hlcmVudChzZXNzLT5jb3JlLT5kZXYsIHNlc3Mt
PnZpZmlmb19zaXplLAo+ICAJCQkgIHNlc3MtPnZpZmlmb192YWRkciwgc2Vzcy0+dmlmaWZvX3Bh
ZGRyKTsKPiAgYnVmc19kb25lOgoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzbid0IGEgYnVnIGlu
dHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0IGRvZXMgdGhlIGVycm9yIHBhdGggbGVhZGluZwp1
cCB0byB0aGlzIGxhYmVsIGNhdXNlIHBlcm1hbmVudCBtZW1vcnkgbGVha3Mgb2YgaGFyZHdhcmUg
Y2FudmFzIElEcyBhbmQKY29kZWMgcHJpdmF0ZSBkYXRhPwoKV2hlbiBpbml0aWFsaXphdGlvbiBm
YWlscyBsYXRlIGluIHZkZWNfc3RhcnRfc3RyZWFtaW5nKCksIGZvciBleGFtcGxlIGlmCmt0aHJl
YWRfcnVuKCkgZmFpbHMsIHRoZSBlcnJvciBwYXRoIGhhbmRsZXMgY2xlYW51cDoKCmVycl9jbGVh
bnVwOgogICAgaWYgKGNvZGVjX29wcyAmJiBjb2RlY19vcHMtPnN0b3AgJiYgc2Vzcy0+cHJpdikg
ewogICAgICAgIGNvZGVjX29wcy0+c3RvcChzZXNzKTsKICAgICAgICBzZXNzLT5wcml2ID0gTlVM
TDsKICAgIH0KICAgIHZkZWNfcG93ZXJvZmYoc2Vzcyk7CnZpZmlmb19mcmVlOgogICAgbXV0ZXhf
bG9jaygmY29yZS0+bG9jayk7CiAgICBjb3JlLT5jdXJfc2VzcyA9IE5VTEw7CiAgICBzZXNzLT5z
dGF0dXMgPSBTVEFUVVNfU1RPUFBFRDsKICAgIG11dGV4X3VubG9jaygmY29yZS0+bG9jayk7CgpC
eSBzZXR0aW5nIHNlc3MtPnN0YXR1cyA9IFNUQVRVU19TVE9QUEVELCB2ZGVjX3N0b3Bfc3RyZWFt
aW5nKCkgaXMKcHJldmVudGVkIGZyb20gZXhlY3V0aW5nIGl0cyB0ZWFyZG93biBibG9jayBvbiBk
ZXZpY2UgY2xvc2UuIEFzIGEgcmVzdWx0LAp2ZGVjX2ZyZWVfY2FudmFzKCkgaXMgc2tpcHBlZCwg
cGVybWFuZW50bHkgbGVha2luZyB0aGUgbGltaXRlZCBoYXJkd2FyZQpjYW52YXMgSURzIGFsbG9j
YXRlZCBkdXJpbmcgY29kZWNfb3BzLT5zdGFydCgpLgoKQWRkaXRpb25hbGx5LCBzZXR0aW5nIHNl
c3MtPnByaXYgPSBOVUxMIHdpdGhvdXQgZnJlZWluZyBpdCBwZXJtYW5lbnRseQpsZWFrcyB0aGUg
Y29kZWMgY29udGV4dCBtZW1vcnksIGJlY2F1c2UgY29kZWNfb3BzLT5zdG9wKCkgaW1wbGVtZW50
YXRpb25zCm9ubHkgZnJlZSBpbnRlcm5hbCBETUEgYnVmZmVycyBhbmQgcmVseSBvbiB2ZGVjX3N0
b3Bfc3RyZWFtaW5nKCkgdG8gZnJlZQpzZXNzLT5wcml2LgoKPiAtCXdoaWxlICgoYnVmID0gdjRs
Ml9tMm1fc3JjX2J1Zl9yZW1vdmUoc2Vzcy0+bTJtX2N0eCkpKQo+IC0JCXY0bDJfbTJtX2J1Zl9k
b25lKGJ1ZiwgVkIyX0JVRl9TVEFURV9RVUVVRUQpOwo+IC0Jd2hpbGUgKChidWYgPSB2NGwyX20y
bV9kc3RfYnVmX3JlbW92ZShzZXNzLT5tMm1fY3R4KSkpCj4gLQkJdjRsMl9tMm1fYnVmX2RvbmUo
YnVmLCBWQjJfQlVGX1NUQVRFX1FVRVVFRCk7Cj4gLQo+IC0JaWYgKHEtPnR5cGUgPT0gVjRMMl9C
VUZfVFlQRV9WSURFT19PVVRQVVRfTVBMQU5FKQo+ICsJaWYgKHEtPnR5cGUgPT0gVjRMMl9CVUZf
VFlQRV9WSURFT19PVVRQVVRfTVBMQU5FKSB7Cj4gIAkJc2Vzcy0+c3RyZWFtb25fb3V0ID0gMDsK
PiAtCWVsc2UKPiArCQl3aGlsZSAoKGJ1ZiA9IHY0bDJfbTJtX3NyY19idWZfcmVtb3ZlKHNlc3Mt
Pm0ybV9jdHgpKSkKPiArCQkJdjRsMl9tMm1fYnVmX2RvbmUoYnVmLCBWQjJfQlVGX1NUQVRFX1FV
RVVFRCk7Cj4gKwl9IGVsc2Ugewo+ICAJCXNlc3MtPnN0cmVhbW9uX2NhcCA9IDA7Cj4gKwkJd2hp
bGUgKChidWYgPSB2NGwyX20ybV9kc3RfYnVmX3JlbW92ZShzZXNzLT5tMm1fY3R4KSkpCj4gKwkJ
CXY0bDJfbTJtX2J1Zl9kb25lKGJ1ZiwgVkIyX0JVRl9TVEFURV9RVUVVRUQpOwo+ICsJfQo+ICAK
PiAgCXJldHVybiByZXQ7Cj4gIH0KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1MjUwOTUyMTYuMTIwNzgtMS1saW51eC5hbW9vbkBn
bWFpbC5jb20/cGFydD01CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
