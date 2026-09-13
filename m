Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18040C88E56
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Sep 2026 03:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E090rwNcVMaoG+/O+6NeMaZvyXkRq4kL8EOqYoRgkk4=; b=0Zy6Sa67F2mz8n
	ilcqjBtcFYaR4Ucgdc0ZLOI8QRP+XuU5xKfkrEWFCZVz5DnJVT/KWO5WXQ2g3drC6DjwbbPoQkjrl
	M+CmadADifQRYKKRF/647TYTeIIt2BD1UWVbIYg+nWkMddkcdZkYYHiK5o3E1YkFXRNa8ehzx6yhM
	GeqKuVH9q+iDlvwYLc8X6THb9/9HAye2SCmiiGcbUHbHPff4oLr1UhbJ6gEICmkugsMGkhVl/27OT
	e4N647zHk/fzLTeyc1Gr+55Nyn4E/psPs/fugGEJFUHQQ2h/dJuTQ8QFjpsbC0Qgu+9QCSQF7UiTm
	sAemVDkMw2Jkzc+MJdIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bGQ-00000001LsW-0DI1;
	Sun, 13 Sep 2026 03:52:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bGP-00000001LsP-0S9u
	for linux-amlogic@lists.infradead.org;
	Sun, 13 Sep 2026 03:52:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FDB741A6C;
	Sun, 13 Sep 2026 03:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3592B1F000FF;
	Sun, 13 Sep 2026 03:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789271540;
	bh=1cOrmSi2NyE9JElwHhzAoGiv+iu3+GnIhqFNrKO4cuw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QMReP78NAoNenof2BnVtMMqNCIUO8s/kZFZyQlmLhcp0UrgMT7gRDvBP0ZMOsu8pi
	 xGXhzfThe7qcAsuFE2r+MJNoPrr3+TzRcBPSuNs0yE5oBLZumtSn5v/vsD0vnZk/GH
	 4E0b8NGm+E+aZZkCGjdBcnRwEJyfNx3bnpe382VjsM9Q2n5pyq4av5YoVJ4yeHatzV
	 xMhCNXC1EoBW7dXbYJ8ilXrYlWKAO7z+eww0Z9z2LEfi2zSuFs2EoW2Af0l3pzIhKj
	 31BkzRBfD6IxOw7pGMpD91kyqHhgu9ejjVHXKGa2YVc0rfjGQcEHuD1AFfovGHBoiy
	 Tla5UL1NcsXtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] tty: serial: meson: fix UART driver lifetime
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: linux-serial@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260913034148.15068-1-mhun512@gmail.com>
References: <20260913034148.15068-1-mhun512@gmail.com>
Date: Sun, 13 Sep 2026 03:52:19 +0000
Message-Id: <20260913035220.3592B1F000FF@smtp.kernel.org>
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
IFtIaWdoXSBGYWlsdXJlIHRvIG1hcCBkZXZpY2UgbWVtb3J5IGR1cmluZyBwb3J0IGNvbmZpZ3Vy
YXRpb24gY2F1c2VzIGEgbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlIGR1cmluZyBVQVJUIHN0YXJ0
dXAuCi0tCgpjb21taXQgZjE0MjE5MGUxMTVkNGEwYjk5NjlkMmRkOGJkNGQ5NDYxYzAxZjE1YQpB
dXRob3I6IE15ZW9uZ2h1biBQYWsgPG1odW41MTJAZ21haWwuY29tPgoKICAgIHR0eTogc2VyaWFs
OiBtZXNvbjogZml4IFVBUlQgZHJpdmVyIGxpZmV0aW1lCgogICAgTW92aW5nIEFtbG9naWMgVUFS
VCByZWdpc3RyYXRpb24gaW50byBwcm9iZSBsZWZ0IHRoZSBmaXJzdCBkcml2ZXIKICAgIHJlZ2lz
dHJhdGlvbiBiZWhpbmQgaWYgdWFydF9hZGRfb25lX3BvcnQoKSBmYWlsZWQuIFRyYWNrIHdoZXRo
ZXIgcHJvYmUKICAgIHJlZ2lzdGVyZWQgdGhlIGRyaXZlciBhbmQgdW5kbyBpdCB3aGVuIHBvcnQg
YWRkaXRpb24gZmFpbHMuIFNlcmlhbGl6ZQogICAgdGhlIHNoYXJlZCBsaWZlY3ljbGUgZGVjaXNp
b25zIGFnYWluc3QgcGFyYWxsZWwgcHJvYmUgYW5kIHJlbW92ZQogICAgb3BlcmF0aW9ucy4KCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMgYi9kcml2ZXJzL3R0
eS9zZXJpYWwvbWVzb25fdWFydC5jCj4gaW5kZXggYTZjYjJhNTM1ZjlkYy4uNGJkOWQ5ODI2OGI0
MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCj4gKysrIGIv
ZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwpbIC4uLiBdCj4gQEAgLTc4MSw5ICs4MDAs
MTQgQEAgc3RhdGljIGludCBtZXNvbl91YXJ0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4gIAl9Cj4gIAo+ICAJcmV0ID0gdWFydF9hZGRfb25lX3BvcnQodWFydF9kcml2ZXIs
IHBvcnQpOwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzbid0IGEgYnVnIGludHJvZHVjZWQgYnkg
dGhpcyBwYXRjaCwgYnV0IEkgbm90aWNlZCBhIHByZS1leGlzdGluZyBpc3N1ZQp3aGVyZSBmYWls
dXJlIHRvIG1hcCBkZXZpY2UgbWVtb3J5IGR1cmluZyBwb3J0IGNvbmZpZ3VyYXRpb24gY2F1c2Vz
IGEgbnVsbApwb2ludGVyIGRlcmVmZXJlbmNlIGR1cmluZyBVQVJUIHN0YXJ0dXAuCgpJZiBkZXZt
X3JlcXVlc3RfbWVtX3JlZ2lvbigpIG9yIGRldm1faW9yZW1hcCgpIGZhaWxzIGR1cmluZwptZXNv
bl91YXJ0X3JlcXVlc3RfcG9ydCgpICh3aGljaCBpcyBjYWxsZWQgdmlhIHRoZSAuY29uZmlnX3Bv
cnQgY2FsbGJhY2sKZHVyaW5nIHVhcnRfYWRkX29uZV9wb3J0KSwgdGhlIGZhaWx1cmUgaXMgc2ls
ZW50bHkgaWdub3JlZDoKCmRyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmM6bWVzb25fdWFy
dF9jb25maWdfcG9ydCgpIHsKCWlmIChmbGFncyAmIFVBUlRfQ09ORklHX1RZUEUpIHsKCQlwb3J0
LT50eXBlID0gUE9SVF9NRVNPTjsKCQltZXNvbl91YXJ0X3JlcXVlc3RfcG9ydChwb3J0KTsKCX0K
fQoKQmVjYXVzZSBwb3J0LT50eXBlIGlzIHVuY29uZGl0aW9uYWxseSBzZXQgdG8gUE9SVF9NRVNP
TiwgdGhlIHNlcmlhbCBjb3JlCmJlbGlldmVzIHRoZSBwb3J0IGlzIHN1Y2Nlc3NmdWxseSBjb25m
aWd1cmVkLiBXaGVuIHVzZXIgc3BhY2Ugc3Vic2VxdWVudGx5Cm9wZW5zIHRoZSBjb3JyZXNwb25k
aW5nIHR0eSBkZXZpY2UsIG1lc29uX3VhcnRfc3RhcnR1cCgpIGlzIGludm9rZWQgYW5kCmV4ZWN1
dGVzOgoKZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYzptZXNvbl91YXJ0X3N0YXJ0dXAo
KSB7Cgl1YXJ0X3BvcnRfbG9ja19pcnFzYXZlKHBvcnQsICZmbGFncyk7CgoJdmFsID0gcmVhZGwo
cG9ydC0+bWVtYmFzZSArIEFNTF9VQVJUX0NPTlRST0wpOwoJLi4uCn0KClNpbmNlIHBvcnQtPm1l
bWJhc2UgaXMgTlVMTCwgdGhpcyByZWFkbCgpIGNhdXNlcyBhbiBpbW1lZGlhdGUga2VybmVsIHBh
bmljIG9uCmRldmljZSBvcGVuLgoKQ291bGQgbWVzb25fdWFydF9jb25maWdfcG9ydCgpIGJlIHVw
ZGF0ZWQgdG8gb25seSBzZXQgcG9ydC0+dHlwZSBpZgptZXNvbl91YXJ0X3JlcXVlc3RfcG9ydCgp
IHN1Y2NlZWRzLCBwcmV2ZW50aW5nIHRoZSBzZXJpYWwgY29yZSBmcm9tIHVzaW5nIGFuCnVuY29u
ZmlndXJlZCBwb3J0PwoKPiAtCWlmIChyZXQpCj4gKwlpZiAocmV0KSB7Cj4gIAkJbWVzb25fcG9y
dHNbcGRldi0+aWRdID0gTlVMTDsKPiArCQlpZiAocmVnaXN0ZXJlZCkKPiArCQkJdWFydF91bnJl
Z2lzdGVyX2RyaXZlcih1YXJ0X2RyaXZlcik7Cj4gKwl9Cj4gIAo+ICtvdXRfdW5sb2NrOgo+ICsJ
bXV0ZXhfdW5sb2NrKCZtZXNvbl91YXJ0X211dGV4KTsKPiAgCXJldHVybiByZXQ7Cj4gIH0KCi0t
IApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAy
NjA5MTMwMzQxNDguMTUwNjgtMS1taHVuNTEyQGdtYWlsLmNvbT9wYXJ0PTEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
