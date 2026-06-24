Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736A0CDB470
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2026 07:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYUlLW3g2gFR1d9m58NnumAfe2w9lLmqqB+zNheAnVk=; b=jrF8FaqFtK7eTC
	nJpISPDYErVKsBslPuBGIAHCcduKL7QE2SK7uvOJM9RcMpACZ8cfJ9GekskV+D8Hq5To4/xlslpW/
	aos9nhythtDP4G2zywD3jfdYnfU/kN602JP2XTTDE7sygOp9rQ8bJaeJJV6AJKOfAyCFraSYrRLJD
	ilX1YcSXcz8UZhWMYIp5+doG9SdI6gX6xRPRxbQNU3/lx+LxeQLe4b2IOb7bFb0EuOZu19B6k6FiK
	wDknqmekeeg41xq2qKZ36AOi2IYBruGHeXOqAPKaSwQ78fI2QiXCeua86LO0o4Nb+lt1mhM017yAB
	LWOBsW77XIa58g+/E9Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHjt-00000007HEs-2Lce;
	Wed, 24 Jun 2026 07:09:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHjr-00000007HEU-1jaR
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jun 2026 07:09:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D48960138;
	Wed, 24 Jun 2026 07:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F75A1F000E9;
	Wed, 24 Jun 2026 07:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782284973;
	bh=iRBgFXC8y1c+3eK1Su5r67FrWr+bFF0OclIlLB/SUWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RUIeR9u5ryv9pLY3r+F7aaH52pBMQHBjYBKWu+H4UxzCkjruEJYQtIy9WKYmgF5cJ
	 4pNfd6b1hI/ePB4W48x2JMfYB475FD4RqWCYxJ9yb9nyy7rWrbGEG+L2JwCshgyhyF
	 gsMd3lnKuSvEW79xYzz3WaPnnOJEE63ebOZd3W8ARxbnVgsiSckjul9FTY6h2S1qPn
	 a+jGWciXG8b7NS0d+2NUx3z1RZZPQk89ZH5cpaIgCeA1rQPzCYYGKZKPVFSSxhSYop
	 x0oF+lfkn1czPymlV9EJwQG6faK58DQ+P7iuoarxkF6aW7TZ5lFvELcSJcGh/Uq1wF
	 AB57sYR+iv1jw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: meson: vdec: fix NULL pointer deref in
 vdec_try_fmt_common
To: "Christian Hewitt" <christianshewitt@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260624065809.2460720-1-christianshewitt@gmail.com>
References: <20260624065809.2460720-1-christianshewitt@gmail.com>
Date: Wed, 24 Jun 2026 07:09:32 +0000
Message-Id: <20260624070933.1F75A1F000E9@smtp.kernel.org>
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
IFtIaWdoXSBNaXNzaW5nIFY0TDIgcXVldWUgYnVzeSBjaGVjayBpbiB2ZGVjX3NfZm10IGFsbG93
cyBmb3JtYXQgY2hhbmdlcyBkdXJpbmcgYWN0aXZlIHN0cmVhbWluZywgbGVhZGluZyB0byB0eXBl
IGNvbmZ1c2lvbiBhbmQgbWVtb3J5IGNvcnJ1cHRpb24gaW4gdGhlIElTUi4KLS0KCmNvbW1pdCA4
YWEzM2FkYjliNzQ1YWQ3YjFhMjY3MjFjY2FmZGJlYjVmMDc2OGJiCkF1dGhvcjogQ2hyaXN0aWFu
IEhld2l0dCA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+CgptZWRpYTogbWVzb246IHZkZWM6
IGZpeCBOVUxMIHBvaW50ZXIgZGVyZWYgaW4gdmRlY190cnlfZm10X2NvbW1vbgoKVGhpcyBjb21t
aXQgZml4ZXMgYSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gdmRlY190cnlfZm10X2NvbW1v
bigpIGJ5CmZhbGxpbmcgYmFjayB0byB0aGUgZmlyc3QgZm9ybWF0IGluIHRoZSBwbGF0Zm9ybSdz
IGZvcm1hdCBhcnJheSBpbnN0ZWFkIG9mCmhhcmRjb2RpbmcgTVBFRzIuIFRoaXMgcHJldmVudHMg
Y3Jhc2hlcyBvbiBzeXN0ZW1zIHdoZXJlIE1QRUcyIHN1cHBvcnQgaGFzCmJlZW4gbG9jYWxseSBw
YXRjaGVkIG91dC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92
ZGVjL3ZkZWMuYyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYwo+IGlu
ZGV4IGEwMzlkOTI1YzBmZTUuLmMxOGJmMzUyYjE5OTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9z
dGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jCj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL21l
ZGlhL21lc29uL3ZkZWMvdmRlYy5jCgpbIC4uLiBdCgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXMg
YSBwcmUtZXhpc3RpbmcgaXNzdWUsIGJ1dCB3aGlsZSBsb29raW5nIGF0IHRoZSBmb3JtYXQgaGFu
ZGxpbmcgaW4KdGhpcyBkcml2ZXIsIEkgbm90aWNlZCBhIHBvdGVudGlhbCByYWNlIGNvbmRpdGlv
bi4KCkRvZXMgdmRlY19zX2ZtdCgpIGFsbG93IGZvcm1hdCBjaGFuZ2VzIGR1cmluZyBhY3RpdmUg
c3RyZWFtaW5nPwoKZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jOnZkZWNf
c19mbXQoKSB7CiAgICAgICAgLi4uCglpZiAoZi0+dHlwZSA9PSBWNEwyX0JVRl9UWVBFX1ZJREVP
X09VVFBVVF9NUExBTkUpCgkJc2Vzcy0+Zm10X291dCA9IGZtdF9vdXQ7CgllbHNlIGlmIChmLT50
eXBlID09IFY0TDJfQlVGX1RZUEVfVklERU9fQ0FQVFVSRV9NUExBTkUpCgkJc2Vzcy0+cGl4Zm10
X2NhcCA9IGZvcm1hdC5mbXQucGl4X21wLnBpeGVsZm9ybWF0OwogICAgICAgIC4uLgp9CgpJdCBh
cHBlYXJzIHRoZXJlIGlzIG5vIGNoZWNrIHRvIGVuc3VyZSB0aGUgVjRMMiBxdWV1ZXMgYXJlIGlk
bGUgKGUuZy4sCnZpYSB2YjJfaXNfYnVzeSgpKSBiZWZvcmUgb3ZlcndyaXRpbmcgdGhlIHNlc3Np
b24gZm9ybWF0IHBhcmFtZXRlcnMuCgpJZiBhIHVzZXJzcGFjZSBhcHBsaWNhdGlvbiBpcyBhY3Rp
dmVseSBzdHJlYW1pbmcgYW5kIGNvbmN1cnJlbnRseSBjYWxscwpWSURJT0NfU19GTVQgd2l0aCBh
IGRpZmZlcmVudCBmb3JtYXQsIGNvdWxkIHRoaXMgbGVhZCB0byB0eXBlIGNvbmZ1c2lvbgphbmQg
bWVtb3J5IGNvcnJ1cHRpb24gaW4gdGhlIGhhcmRpcnEgaGFuZGxlcj8KCmRyaXZlcnMvc3RhZ2lu
Zy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYzp2ZGVjX2lzcigpIHsKICAgICAgICAuLi4KCXJldHVy
biBzZXNzLT5mbXRfb3V0LT5jb2RlY19vcHMtPmlzcihzZXNzKTsKfQoKQmVjYXVzZSB0aGUgaGFy
ZGlycSBoYW5kbGVyIGRlcmVmZXJlbmNlcyBzZXNzLT5mbXRfb3V0IHdpdGhvdXQgbG9ja3MsCmEg
bWlkLXN0cmVhbSBmb3JtYXQgY2hhbmdlIG1pZ2h0IGNhdXNlIHRoZSBJU1Igb2YgdGhlIG5ld2x5
IHNlbGVjdGVkIGNvZGVjCnRvIGV4ZWN1dGUgb24gYSBzZXNzaW9uIHN0YXRlIChzZXNzLT5wcml2
KSBpbml0aWFsaXplZCBmb3IgdGhlIHByZXZpb3VzCmNvZGVjLgoKLS0gClNhc2hpa28gQUkgcmV2
aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDYyNDA2NTgwOS4yNDYw
NzIwLTEtY2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20/cGFydD0xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
