Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5721EC982C9
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2026 15:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T66ewRze+4v1u8aiC1m1iUkBvvR5V6LpPlLwoWdXrWw=; b=LbBZVYJDxmLxNB
	dAc6xR1TruSdMsI0vIq9L2CU1DqBWwUVrMZGmDmI5EpIuMjnItjYfbE/gRxbAfOR9Sbhv6OQTQ2Yi
	MV7+PHYwk1DNCeFXM0EpicLWIaMK+Lc1a2z9Lu/gqP+ph/IKMSWR61P7PVExLiXVssxqUu9zLqf65
	XKUWismRhH8kmtg4mvDtBRGRvzeNCOnYGwEIGoPmZNyfP+y+imckZleLz2r0oVXxe0PWtAtdu6e/S
	8AHmBS+W08US/yjE5jjAC9RLAU+jp++HPAW8iW71j6gfBd4cowhYhMcjvanaUGKDjoCcgErPUc1g1
	zsq1GY0nEew8df6Ifpjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6s1C-00000009fCt-46R4;
	Wed, 16 Sep 2026 15:57:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6s1B-00000009fCU-3bQg
	for linux-amlogic@lists.infradead.org;
	Wed, 16 Sep 2026 15:57:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 46A2F6020C;
	Wed, 16 Sep 2026 15:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1CB1F000FF;
	Wed, 16 Sep 2026 15:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789574273;
	bh=aq+nROvdH4rzDo1uL5NtNNjAm96E3mKYq/jHAusbQ4k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pfl2padV85dbFC5LksxJmwL5BmLUpFtWcjWMcZVce/d+vyASX9b//4oIpwXDyVg7D
	 nlli8vOybzUz1ARrKF0R1KRSF4OG/Byjd+s+0Vjrxqrh+moYbmfDa88ja0VSpUa4Yb
	 TTuZoa3ivo03Oc4FDDeTgWuJL3epC3SyhZwRmY2RJzQXMdQtGXyCEhvT2NQ5qW6PW+
	 q1IzdEmDJkBwnGBAL9YSKUU/+sNcf74OhF7O3ChK8Ob+cmRISG4l0FumJbSdV/riiu
	 RKRdI4zSyMsLvXc9yNtMKfUze4i+26E2U0HP3+PYYFitI+ytX7liZnb2oSUcH2xDzO
	 YvHmcxYN+cT/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] crypto/amlogic: Use devm APIs for clock management
To: "Mohamad Raizudeen" <raizudeen.kerneldev@gmail.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260916154941.7254-1-raizudeen.kerneldev@gmail.com>
References: <20260916154941.7254-1-raizudeen.kerneldev@gmail.com>
Date: Wed, 16 Sep 2026 15:57:52 +0000
Message-Id: <20260916155752.BB1CB1F000FF@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGNyeXB0bzogYW1sb2dp
YzogbWVtb3J5IGxlYWsgYW5kIFVBRiBvbiBwcm9iZSBlcnJvciBwYXRoCi0gW0xvd10gY3J5cHRv
OiBhbWxvZ2ljOiBidWlsZCBmYWlsdXJlIGR1ZSB0byBtaXNzcGVsbGVkIG1lc29uX2FsbG9jYXRl
X2NoYWlubGlzdAotLQoKY29tbWl0IDc5OGU3OGMzMTQ3M2NhNmJlOGNhOWQzODczOWY0M2I2NjUz
MzA3YjYKQXV0aG9yOiBNb2hhbWFkIFJhaXp1ZGVlbiA8cmFpenVkZWVuLmtlcm5lbGRldkBnbWFp
bC5jb20+CgpjcnlwdG8vYW1sb2dpYzogVXNlIGRldm0gQVBJcyBmb3IgY2xvY2sgbWFuYWdlbWVu
dAoKVGhpcyBjb21taXQgY29udmVydHMgdGhlIGRyaXZlciB0byB1c2UgZGV2bV9jbGtfZ2V0X2Vu
YWJsZWQgaW5zdGVhZCBvZgptYW51YWxseSBnZXR0aW5nIGFuZCBlbmFibGluZyB0aGUgY29yZSBj
bG9jay4gVGhpcyBjaGFuZ2UgYWxsb3dzIHRoZSByZW1vdmFsCm9mIG1hbnVhbCBjbGVhbnVwIGNv
ZGUgaW4gdGhlIGVycm9yIHBhdGhzIGFuZCBzaW1wbGlmaWVzIHRoZSBwcm9iZSBmdW5jdGlvbi4K
CkNsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI2MDgzMTAz
MjkuUWd4Q0NNczEtbGtwQGludGVsLmNvbS8KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3J5cHRv
L2FtbG9naWMvYW1sb2dpYy1neGwtY29yZS5jIGIvZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxv
Z2ljLWd4bC1jb3JlLmMKPiBpbmRleCAxNjljNmVlYjUxZTUxLi5kMmQyM2E0NDNjNTNmIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtY29yZS5jCj4gKysr
IGIvZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1jb3JlLmMKWyAuLi4gXQo+IEBA
IC0yNDMsMTMgKzI0MywxNyBAQCBzdGF0aWMgaW50IG1lc29uX2NyeXB0b19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJaWYgKElTX0VSUihtYy0+YmFzZSkpCj4gIAkJcmV0
dXJuIFBUUl9FUlIobWMtPmJhc2UpOwo+ICAKPiAtCW1jLT5idXNjbGsgPSBkZXZtX2Nsa19nZXQo
JnBkZXYtPmRldiwgImJsa212Iik7Cj4gKwltYy0+YnVzY2xrID0gZGV2bV9jbGtfZ2V0X2VuYWJs
ZWQoJnBkZXYtPmRldiwgImJsa212Iik7Cj4gIAlpZiAoSVNfRVJSKG1jLT5idXNjbGspKSB7Cj4g
IAkJZXJyID0gUFRSX0VSUihtYy0+YnVzY2xrKTsKPiAtCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJD
YW5ub3QgZ2V0IGNvcmUgY2xvY2sgZXJyPSVkXG4iLCBlcnIpOwo+ICsJCWRldl9lcnIoJnBkZXYt
PmRldiwgIkNhbm5vdCBnZXQvZW5hYmxlIGNvcmUgY2xvY2sgZXJyPSVkXG4iLCBlcnIpOwo+ICAJ
CXJldHVybiBlcnI7Cj4gIAl9Cj4gIAo+ICsJZXJyID0gbWVzb25fYWxsb2NhdGVfY2hhaW5saXN0
KG1jKTsKICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eCgpbU2V2ZXJpdHk6
IExvd10KSXMgdGhlcmUgYSB0eXBvIGluIHRoZSBmdW5jdGlvbiBuYW1lIG1lc29uX2FsbG9jYXRl
X2NoYWlubGlzdD8KCj4gKwlpZiAoZXJyKQo+ICsJCXJldHVybiBlcnI7Cj4gKwo+ICAJZm9yIChp
ID0gMDsgaSA8IE1BWEZMT1c7IGkrKykgewo+ICAJCW1jLT5pcnFzW2ldID0gcGxhdGZvcm1fZ2V0
X2lycShwZGV2LCBpKTsKPiAgCQlpZiAobWMtPmlycXNbaV0gPCAwKQo+ICAJCQlyZXR1cm4gbWMt
PmlycXNbaV07CgpbU2V2ZXJpdHk6IEhpZ2hdClNpbmNlIHRoZSBhbGxvY2F0aW9uIG9mIGNoYW5s
aXN0IHdhcyBtb3ZlZCBiZWZvcmUgdGhpcyBsb29wLCBpZgpwbGF0Zm9ybV9nZXRfaXJxIGZhaWxz
LCBkb2VzIHJldHVybmluZyBkaXJlY3RseSBoZXJlIGJ5cGFzcyB0aGUgY2xlYW51cCBvZgpyZXNv
dXJjZXMgYWxsb2NhdGVkIGJ5IG1lc29uX2FsbG9jYXRlX2NoYW5saXN0PwoKSWYgdGhpcyBjbGVh
bnVwIGlzIGJ5cGFzc2VkLCBjb3VsZCBpdCBjYXVzZSBhIHVzZS1hZnRlci1mcmVlIHdoZW4gb3Jw
aGFuZWQKa3RocmVhZHMgYXR0ZW1wdCB0byBhY2Nlc3MgdGhlIGRldm0tbWFuYWdlZCBlbmdpbmUg
c3RydWN0dXJlcyBhZnRlciB0aGV5IGFyZQpmcmVlZD8KCj4gIAo+ICAJCWVyciA9IGRldm1fcmVx
dWVzdF9pcnEoJnBkZXYtPmRldiwgbWMtPmlycXNbaV0sIG1lc29uX2lycV9oYW5kbGVyLCAwLAo+
ICAJCQkJICAgICAgICJneGwtY3J5cHRvIiwgbWMpOwo+ICAJCWlmIChlcnIgPCAwKQo+ICAJCQly
ZXR1cm4gZXJyOwoKW1NldmVyaXR5OiBIaWdoXQpTaW1pbGFybHksIGlmIGRldm1fcmVxdWVzdF9p
cnEgZmFpbHMsIGRvZXMgcmV0dXJuaW5nIGRpcmVjdGx5IGhlcmUgYnlwYXNzCmNsZWFudXAsIGxl
YWtpbmcgRE1BIGNvaGVyZW50IG1lbW9yeSBhbmQgbGVhdmluZyBjcnlwdG9fZW5naW5lIGt0aHJl
YWRzCnJ1bm5pbmc/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRl
di8jL3BhdGNoc2V0LzIwMjYwOTE2MTU0OTQxLjcyNTQtMS1yYWl6dWRlZW4ua2VybmVsZGV2QGdt
YWlsLmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
