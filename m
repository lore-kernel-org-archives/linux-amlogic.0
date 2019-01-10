Return-Path: <SRS0=r/fn=PS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85968C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 13:59:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54C6A20660
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jan 2019 13:59:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LZ1TpkFY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54C6A20660
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CgOhgYE5MEpYMqAmpmmboxnWQlDmoayiZcGtZTgz2w=; b=LZ1TpkFYFe8SN3
	5zwRjtFKjdfn53DeT+SHAsGpNIPwYXQmSYhupiDA2SIbeuMr6FZXM1tHazgsZLFEnYBHLjxT2YjeU
	DpBS0t8O785OU3SRCjunseMPnZ/LSwk5Du8HN7OKsbDOA4QZX0UYNVsspbeNwPByOT4IZwTNH64Y3
	8cFYG8IZ0FxiLT9cMFKBAmRK8NCTk0Mx/xg1DtuQnGvpCo1kn7lBxAw2MPskPENIwpx3LQAvgvzed
	5fB3ba46Zc7P0P4kZDAQRpLimGKPyHCcErV4Py/rpfoh0DiDlKNJ3YuPrkPbXYs9x5XVSsJxzdLXm
	chBdHqfFUWyYFUpVGABQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gharo-0001Ze-7x; Thu, 10 Jan 2019 13:59:28 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gharl-0001ZH-5t
 for linux-amlogic@lists.infradead.org; Thu, 10 Jan 2019 13:59:27 +0000
X-Originating-IP: 88.190.179.123
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 69604C001B;
 Thu, 10 Jan 2019 13:59:11 +0000 (UTC)
Date: Thu, 10 Jan 2019 15:08:29 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Elie Roudninski <xademax@gmail.com>
Subject: Re: Kernel segmentation fault unbinding eMMC on AML-S905X-CC
Message-ID: <20190110140829.GA982@voidbox.localdomain>
References: <5c3744c0.1c69fb81.93dc1.2aff@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c3744c0.1c69fb81.93dc1.2aff@mx.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_055925_490830_E0343C1C 
X-CRM114-Status: GOOD (  11.08  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKYW4gMDksIDIwMTkgYXQgMTA6NDg6NTBQTSArMDAwMCwgRWxpZSBSb3Vkbmluc2tp
IHdyb3RlOgouLi4KCj4gWyAgNDQ0LjA2MDE2MV0gQ2FsbCB0cmFjZToKPiBbICA0NDQuMDYyNTgw
XSAgcXVldWVkX3NwaW5fbG9ja19zbG93cGF0aCsweDIyOC8weDJkMAo+IFsgIDQ0NC4wNjczMjJd
ICBtZXNvbl9tbWNfaXJxKzB4MjkwLzB4MmEwCj4gWyAgNDQ0LjA3MTAzMl0gIF9fZnJlZV9pcnEr
MHgxODQvMHgzMTgKPiBbICA0NDQuMDc0NDgwXSAgZnJlZV9pcnErMHg0MC8weDgwCj4gWyAgNDQ0
LjA3NzU4Nl0gIGRldm1faXJxX3JlbGVhc2UrMHgyNC8weDMwCj4gWyAgNDQ0LjA4MTM4Ml0gIHJl
bGVhc2Vfbm9kZXMrMHgxZTAvMHgyZTAKPiBbICA0NDQuMDg1MDg5XSAgZGV2cmVzX3JlbGVhc2Vf
YWxsKzB4NjAvMHg4OAo+IFsgIDQ0NC4wODkwNTddICBkZXZpY2VfcmVsZWFzZV9kcml2ZXJfaW50
ZXJuYWwrMHgxYzgvMHgyNDgKPiBbICA0NDQuMDk0MjMxXSAgZGV2aWNlX3JlbGVhc2VfZHJpdmVy
KzB4MjgvMHgzOAo+IFsgIDQ0NC4wOTg0NTldICB1bmJpbmRfc3RvcmUrMHhkYy8weDE0OAo+IFsg
IDQ0NC4xMDE5OTRdICBkcnZfYXR0cl9zdG9yZSsweDQwLzB4NTgKPiBbICA0NDQuMTA1NjI3XSAg
c3lzZnNfa2Zfd3JpdGUrMHg1Yy8weDc4Cj4gWyAgNDQ0LjEwOTI0MF0gIGtlcm5mc19mb3Bfd3Jp
dGUrMHhlOC8weDFlMAo+IFsgIDQ0NC4xMTMxMjZdICBfX3Zmc193cml0ZSsweDYwLzB4MTkwCj4g
WyAgNDQ0LjExNjU3MF0gIHZmc193cml0ZSsweGFjLzB4MWIwCj4gWyAgNDQ0LjExOTg0OF0gIGtz
eXNfd3JpdGUrMHg2Yy8weGQwCj4gWyAgNDQ0LjEyMzEyNV0gIF9fYXJtNjRfc3lzX3dyaXRlKzB4
MjQvMHgzMAo+IFsgIDQ0NC4xMjcwMTVdICBlbDBfc3ZjX2NvbW1vbisweDk0LzB4ZTgKPiBbICA0
NDQuMTMwNjI5XSAgZWwwX3N2Y19oYW5kbGVyKzB4MzgvMHg4MAo+IFsgIDQ0NC4xMzQzNDBdICBl
bDBfc3ZjKzB4OC8weGMKPiBbICA0NDQuMTM3MTg3XSBDb2RlOiBkMzdjMDQwMSA5MTAwMjBjMCA4
YjAxMDA0MSBmODY1ZDhlNSAoZjgyNTY4MjYpCj4gWyAgNDQ0LjE0MzIyM10gLS0tWyBlbmQgdHJh
Y2UgNjI1NDFlYzJmZmUwMjBmMiBdLS0tCj4gU2VnbWVudGF0aW9uIGZhdWx0CgouLi4KCkhlcmUg
YXJlIG15IHR3byBjZW50cyBvbiB0aGlzLgoKVGhlIGlycSB0aGF0IGlzIGJlaW5nIGZyZWVkIHdh
cyBhbGxvY2F0ZWQgdGhyb3VnaCBkZXZpY2UgbWFuYWdlbWVudAooaS5lLiB3aXRoIGRldm1fcmVx
dWVzdF90aHJlYWRlZF9pcnEoKSkuIFNvIHRoaXMgaXJxIHdpbGwgYmUgcmVsZWFzZWQKYWZ0ZXIg
bWVzb25fbW1jX3JlbW92ZSgpIGNvbXBsZXRpb24sIHRodXMgYWZ0ZXIgdGhhdCBtbWNfZnJlZV9o
b3N0KCkKaGFzIGJlZW4gY2FsbGVkLiBCZWNhdXNlIHRoaXMgaXJxIGhhcyBiZWVuIHJlZ2lzdGVy
ZWQgd2l0aCBJUlFGX1NIQVJFRAphbmQgaWYgeW91IGhhdmUgQ09ORklHX0RFQlVHX1NISVJRIChk
byB5b3UgPykgdGhlIGlycSBoYW5kbGVyIHdpbGwgYmUKY2FsbGVkIHdoaWxlIHRoZSBpcnEgaXMg
ZnJlZWQuCgpTbyBtZXNvbl9tbWNfaXJxIGNvdWxkIGJlIGNhbGxlZCBhZnRlciBtbWNfZnJlZV9o
b3N0KCkgaGFzIGZyZWVkIHRoZQptZXNvbl9ob3N0IHBvaW50ZXIgY2F1c2luZyBpdCB0byBkZXJl
ZmVyZW5jZSBhbiBpbnZhbGlkIHBvaW50ZXIuCgpTbyBpZiB5b3UgaGF2ZSBDT05GSUdfREVCVUdf
U0hJUlEgY291bGQgeW91IHBsZWFzZSB0ZXN0IHRoZSBmb2xsb3dpbmcKcGF0Y2g6CgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIDg8IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMgYi9kcml2
ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jCmluZGV4IGMyNjkwYzFhNTBmZi4uM2E5Njc5NTMx
NTIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jCisrKyBiL2Ry
aXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKQEAgLTE3OSw2ICsxNzksOCBAQCBzdHJ1Y3Qg
bWVzb25faG9zdCB7CiAJc3RydWN0IHNkX2VtbWNfZGVzYyAqZGVzY3M7CiAJZG1hX2FkZHJfdCBk
ZXNjc19kbWFfYWRkcjsKIAorCWludCBpcnE7CisKIAlib29sIHZxbW1jX2VuYWJsZWQ7CiB9Owog
CkBAIC0xMjMxLDcgKzEyMzMsNyBAQCBzdGF0aWMgaW50IG1lc29uX21tY19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0cnVjdCByZXNvdXJjZSAqcmVzOwogCXN0cnVjdCBt
ZXNvbl9ob3N0ICpob3N0OwogCXN0cnVjdCBtbWNfaG9zdCAqbW1jOwotCWludCByZXQsIGlycTsK
KwlpbnQgcmV0OwogCiAJbW1jID0gbW1jX2FsbG9jX2hvc3Qoc2l6ZW9mKHN0cnVjdCBtZXNvbl9o
b3N0KSwgJnBkZXYtPmRldik7CiAJaWYgKCFtbWMpCkBAIC0xMjc2LDggKzEyNzgsOCBAQCBzdGF0
aWMgaW50IG1lc29uX21tY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQln
b3RvIGZyZWVfaG9zdDsKIAl9CiAKLQlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwot
CWlmIChpcnEgPD0gMCkgeworCWhvc3QtPmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7
CisJaWYgKGhvc3QtPmlycSA8PSAwKSB7CiAJCWRldl9lcnIoJnBkZXYtPmRldiwgImZhaWxlZCB0
byBnZXQgaW50ZXJydXB0IHJlc291cmNlLlxuIik7CiAJCXJldCA9IC1FSU5WQUw7CiAJCWdvdG8g
ZnJlZV9ob3N0OwpAQCAtMTMzMSw5ICsxMzMzLDggQEAgc3RhdGljIGludCBtZXNvbl9tbWNfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAl3cml0ZWwoSVJRX0NSQ19FUlIgfCBJ
UlFfVElNRU9VVFMgfCBJUlFfRU5EX09GX0NIQUlOLAogCSAgICAgICBob3N0LT5yZWdzICsgU0Rf
RU1NQ19JUlFfRU4pOwogCi0JcmV0ID0gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycSgmcGRldi0+
ZGV2LCBpcnEsIG1lc29uX21tY19pcnEsCi0JCQkJCW1lc29uX21tY19pcnFfdGhyZWFkLCBJUlFG
X1NIQVJFRCwKLQkJCQkJTlVMTCwgaG9zdCk7CisJcmV0ID0gcmVxdWVzdF90aHJlYWRlZF9pcnEo
aG9zdC0+aXJxLCBtZXNvbl9tbWNfaXJxLAorCQkJbWVzb25fbW1jX2lycV90aHJlYWQsIElSUUZf
U0hBUkVELCBOVUxMLCBob3N0KTsKIAlpZiAocmV0KQogCQlnb3RvIGVycl9pbml0X2NsazsKIApA
QCAtMTM4Nyw2ICsxMzg4LDcgQEAgc3RhdGljIGludCBtZXNvbl9tbWNfcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAkvKiBkaXNhYmxlIGludGVycnVwdHMgKi8KIAl3cml0
ZWwoMCwgaG9zdC0+cmVncyArIFNEX0VNTUNfSVJRX0VOKTsKKwlmcmVlX2lycShob3N0LT5pcnEs
IGhvc3QpOwogCiAJZG1hX2ZyZWVfY29oZXJlbnQoaG9zdC0+ZGV2LCBTRF9FTU1DX0RFU0NfQlVG
X0xFTiwKIAkJCSAgaG9zdC0+ZGVzY3MsIGhvc3QtPmRlc2NzX2RtYV9hZGRyKTsKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLSA4PCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCgpUaGlzIGJhc2ljYWxseSBmcmVlZCB0aGUgaXJxIGluIHRoZSBtZXNvbl9tbWNfcmVtb3Zl
KCkgc28gdGhlCm1lc29uX21tY19pcnEoKSBpcyBjYWxsZWQgYmVmb3JlIG1tY19mcmVlX2hvc3Qo
KS4KCi0tIApSw6ltaSBQb21tYXJlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
