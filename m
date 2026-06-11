Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958A9CD8C9D
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jun 2026 04:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcPWzJIzd3EDw9cjAp21CC/0XCujkmGYFSOtZM+5lmY=; b=pkUkt3jJeI+e3E
	m5Fa2f/jtBrs8MzBdMKMcvh+HOInnQ2+etTwq2matS3R5OnHiCpBYVr/2/x03nTjp0LOJ4fdrrOAb
	+401GLjfgQxVU6OM6UZKEsadNVdMChEBPI7uWqB5HnfvmYEhogJyZM4CPdjfgxeNKfyDgETdEi26T
	Hkp27RxrdETTXMBQDwpU0xhYrMt5744dIHKYZSDStq3iBCeMoDxFqAYUd5/zBUiqjUKK2GdHaGpm0
	9REtIF0T9Q9t+ZUpbUbhsmnbpgrg76CjTd/H715G29e7mQ4fZup7FvBISCURnXBGOPwdAq2bLFMCu
	0n0DWbIVSGmgt64Bmv+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWdW-00000008eji-1xPu;
	Thu, 11 Jun 2026 04:03:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWdU-00000008ejZ-2TRy
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jun 2026 04:03:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 65579407AF;
	Thu, 11 Jun 2026 04:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239AE1F00893;
	Thu, 11 Jun 2026 04:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781150598;
	bh=0POMQgjyxdXVN95s7YalNpvhcQv3/Hf6da9293fARXc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gj9N/9/MgjOR2UwmHLzM75G3esyJkcz/2vIG9kqr6RIv6LeQK/aE+/NWzaYsfqqQc
	 x+8ah4JhgNZhb+qMEF0YAa7tA5dQbJBIbvQb3HhAnJWBVuV0mY2axPhkffOSLcVOHJ
	 UJDTNn24qPDo0Iq6tk+gaJxp/FXeWu7iQJnIvmnlsv5qdsC/YdixYeWviDHos0J/Rb
	 TpumKvJoG/IgjhSUjzalOK/MkkrhgRp7Cykp/Ojvl/N54FMnTIKOjhMh4RyeI/eeN+
	 BpmQc1zY7dzkVzh19Ack2wgtZHdL9x9WHkDZ8yxaX5FC90Rd7tD9pTE0rz/blbB7cR
	 l/DAZBC77WD/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] rtc: meson: fix refcount leak in meson_rtc_get_bus
To: "WenTao Liang" <vulab@iscas.ac.cn>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260611035605.59906-1-vulab@iscas.ac.cn>
References: <20260611035605.59906-1-vulab@iscas.ac.cn>
Date: Thu, 11 Jun 2026 04:03:17 +0000
Message-Id: <20260611040318.239AE1F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIHBhdGNoIGF0
dGVtcHRzIHRvIGZpeCBhIG5vbi1leGlzdGVudCByZWZjb3VudCBsZWFrIGJ5IGFkZGluZyByZXNl
dF9jb250cm9sX3JlYXJtKCkgdG8gYW4gZXhjbHVzaXZlIHJlc2V0IGNvbnRyb2wgKHdoZXJlIGl0
IGlzIGEgbm8tb3ApLiBGdXJ0aGVybW9yZSwgaWYgdGhlIHJlc2V0IGNvbnRyb2wgd2VyZSBhY3R1
YWxseSBzaGFyZWQsIGFkZGluZyByZXNldF9jb250cm9sX3JlYXJtKCkgdG8gdGhlIGVycm9yIHBh
dGggd291bGQgY2F1c2UgYSBkb3VibGUtZGVjcmVtZW50IHVuZGVyZmxvdyBidWcuCi0tCgpjb21t
aXQgYzUyZGQ5OTE0MmZkOTc2NzA0YjY4MGYwNWQ1YmE5YzM1MzcwM2Q5MQpBdXRob3I6IFdlblRh
byBMaWFuZyA8dnVsYWJAaXNjYXMuYWMuY24+CgpydGM6IG1lc29uOiBmaXggcmVmY291bnQgbGVh
ayBpbiBtZXNvbl9ydGNfZ2V0X2J1cwoKVGhpcyBjb21taXQgYXR0ZW1wdHMgdG8gZml4IGEgcmVm
Y291bnQgbGVhayBieSBhZGRpbmcgcmVzZXRfY29udHJvbF9yZWFybSgpCnRvIGJvdGggdGhlIGVy
cm9yIGFuZCBzdWNjZXNzIHBhdGhzIG9mIHJlc2V0X2NvbnRyb2xfcmVzZXQoKSBpbgptZXNvbl9y
dGNfZ2V0X2J1cygpLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLW1lc29uLmMgYi9k
cml2ZXJzL3J0Yy9ydGMtbWVzb24uYwo+IGluZGV4IDIxZWNlYjllMmUxMzQuLjNjNDVjZDc2MWEx
NWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ydGMvcnRjLW1lc29uLmMKPiArKysgYi9kcml2ZXJz
L3J0Yy9ydGMtbWVzb24uYwpbIC4uLiBdCj4gQEAgLTE0Niw4ICsxNDYsMTIgQEAgc3RhdGljIGlu
dCBtZXNvbl9ydGNfZ2V0X2J1cyhzdHJ1Y3QgbWVzb25fcnRjICpydGMpCj4gIAkJZGV2X3dhcm4o
cnRjLT5kZXYsICJmYWlsZWQgdG8gZ2V0IGJ1cywgcmVzZXR0aW5nIFJUQ1xuIik7Cj4gIAo+ICAJ
CXJldCA9IHJlc2V0X2NvbnRyb2xfcmVzZXQocnRjLT5yZXNldCk7Cj4gLQkJaWYgKHJldCkKPiAr
CQlpZiAocmV0KSB7Cj4gKwkJCXJlc2V0X2NvbnRyb2xfcmVhcm0ocnRjLT5yZXNldCk7CgpbU2V2
ZXJpdHk6IE1lZGl1bV0KSXMgdGhpcyByZXNldCBjb250cm9sIGFjdHVhbGx5IHNoYXJlZD8gVGhl
IHJ0Yy0+cmVzZXQgYXBwZWFycyB0byBiZSBhY3F1aXJlZAphcyBhbiBleGNsdXNpdmUgcmVzZXQg
Y29udHJvbCwgd2hlcmUgcmVzZXRfY29udHJvbF9yZWFybSgpIGlzIGRvY3VtZW50ZWQgdG8KYmUg
YSBuby1vcCBhbmQgdHJpZ2dlcmVkX2NvdW50IGlzIG5vdCB1c2VkLgoKQWxzbywgaWYgdGhpcyB3
ZXJlIGEgc2hhcmVkIHJlc2V0IGNvbnRyb2wsIHdvdWxkIGNhbGxpbmcKcmVzZXRfY29udHJvbF9y
ZWFybSgpIG9uIHRoZSBlcnJvciBwYXRoIGNhdXNlIGEgZG91YmxlLWRlY3JlbWVudCB1bmRlcmZs
b3c/CgpUaGUgcmVzZXQgY29yZSBmcmFtZXdvcmsgYXV0b21hdGljYWxseSByb2xscyBiYWNrIHRo
ZSB0cmlnZ2VyZWRfY291bnQKaW5jcmVtZW50IGlmIHRoZSB1bmRlcmx5aW5nIGhhcmR3YXJlIHJl
c2V0IGZhaWxzLiBNYW51YWxseSBjYWxsaW5nCnJlc2V0X2NvbnRyb2xfcmVhcm0oKSBhZnRlciBh
IGZhaWx1cmUgbWlnaHQgZHJvcCB0aGUgY291bnRlciBiZWxvdyB6ZXJvCmFuZCB0cmlnZ2VyIGEg
d2FybmluZy4KCj4gIAkJCXJldHVybiByZXQ7Cj4gKwkJfQo+ICsKPiArCQlyZXNldF9jb250cm9s
X3JlYXJtKHJ0Yy0+cmVzZXQpOwo+ICAJfQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDYxMTAzNTYwNS41OTkwNi0xLXZ1bGFiQGlz
Y2FzLmFjLmNuP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
