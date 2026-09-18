Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058EBC982DA
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2026 11:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PEfqzWN6bl1CtNicD8gelq9YqslOfR9U0Y+/+CdPs8=; b=qFYVv18dEoPasA
	5DtegQUTOPypm3LO7ebCcx/zDW+FK5nfvYzV5iKHf03ngI8aYx9EMw3yj3ZSht0L0B5R0WHDKSxQ4
	3Z9/HRB9M6lGiOAvMypE9C8V9HNn20C8vDAavafy/Ski4gOdTFAyNxlqrpAdaXjKn/wk4haEbDFRu
	bG4cMxt2whzTyEvR3+t6OgXBdL7rDR6wrED9o7Kf3jrH5AItQdZxkm4VTFrzznEz1KuuH+ufqOZtz
	lqNXAqzmuWd2yb6sADasiOqhOYP4d64kqvuQJpV2UhjaCaJt/7xtA7BIVmF9gnwcqGo8Rf6Xfr7lp
	MDAnmNh3WJa58htg/zSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WZ0-0000000ECa2-1FKZ;
	Fri, 18 Sep 2026 11:15:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WYy-0000000ECZh-1Q99
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Sep 2026 11:15:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C1D30434F6;
	Fri, 18 Sep 2026 11:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBC51F000FF;
	Fri, 18 Sep 2026 11:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789730127;
	bh=rJwh9wIQJmUSTwVWTDeIQdR6Zv83X+1IAZ1JAqNg3Xo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lsDQcdcSk2EpL/+pHrZ9AF4iiS67hTRS7cIxy3aD2eA4mNbvA1qRnzmOg5tnB8rxP
	 wXQjYPC+63veFtBvBEVyvNH6qrrkQeuUCK1rhXs3e4o7rx6BXwk0JEgF6Kb4Df2NvP
	 AccEHWAFkaSxNzgSAX9us5UQl2VtlURSlVHA8ywlRLqnbhqz+oUTdzm1d1MJbA29XF
	 6tQSrIfqhklFwbQzCXKBjwflVPHxhfC6U1gMaTqvK26/yhUBg2eWSDHiFoOFYOQ0hx
	 v4Ew3XAzlXYkSpFSQaBuQA0aXQV+dw1U4rKscLcqbNjy6ND8NwtB2XT0AiIXqtfd5j
	 13k3TkZcc3CgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] crypto: amlogic: Fix IRQ handler return value and
 fallthrough logic
To: "Mohamad Raizudeen" <raizudeen.kerneldev@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260918110504.7207-1-raizudeen.kerneldev@gmail.com>
References: <20260918110504.7207-1-raizudeen.kerneldev@gmail.com>
Date: Fri, 18 Sep 2026 11:15:27 +0000
Message-Id: <20260918111527.6FBC51F000FF@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gY3J5cHRvOiBhbWxv
Z2ljOiB1bmRvY3VtZW50ZWQgdW5yZWxhdGVkIGNoYW5nZXMgc3F1YXNoZWQgaW50byBwYXRjaAot
IFtMb3ddIGNyeXB0bzogYW1sb2dpYzogaW5lZmZpY2llbnQgcHJvYmUgcmVzb3VyY2UgYWxsb2Nh
dGlvbiBvcmRlcgotLQoKY29tbWl0IDY3ZWVhZTUyOWNlZjYwZjkxZDJjMzg1ZDljZWMyZDA2MGFh
YmY5YWMKQXV0aG9yOiBNb2hhbWFkIFJhaXp1ZGVlbiA8cmFpenVkZWVuLmtlcm5lbGRldkBnbWFp
bC5jb20+CgpjcnlwdG86IGFtbG9naWM6IEZpeCBJUlEgaGFuZGxlciByZXR1cm4gdmFsdWUgYW5k
IGZhbGx0aHJvdWdoIGxvZ2ljCgpUaGlzIGNvbW1pdCBmaXhlcyB0aGUgSVJRIGhhbmRsZXIgaW4g
dGhlIGFtbG9naWMgY3J5cHRvIGRyaXZlciBieSByZXR1cm5pbmcKaW1tZWRpYXRlbHkgYW5kIHBy
b3ZpZGluZyBJUlFfTk9ORSB3aGVuIHRoZSBzdGF0dXMgcmVnaXN0ZXIgaXMgZW1wdHkgdG8gYXZv
aWQKbWFza2luZyBzcHVyaW91cyBpbnRlcnJ1cHRzLiBJdCBhbHNvIHVzZXMgcmF0ZWxpbWl0ZWQg
ZXJyb3IgbG9nZ2luZyB0bwpwcmV2ZW50IGNvbnNvbGUgbG9ja3Vwcy4KCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtY29yZS5jIGIvZHJpdmVycy9jcnlw
dG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1jb3JlLmMKPiBpbmRleCAxNjljNmVlYjUxZTUxLi5kNWQ4
NDUyNGMxMTA0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY3J5cHRvL2FtbG9naWMvYW1sb2dpYy1n
eGwtY29yZS5jCj4gKysrIGIvZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1jb3Jl
LmMKWyAuLi4gXQo+IEBAIC0yNDMsMzQgKzI0NCwzMCBAQCBzdGF0aWMgaW50IG1lc29uX2NyeXB0
b19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJaWYgKElTX0VSUihtYy0+
YmFzZSkpCj4gIAkJcmV0dXJuIFBUUl9FUlIobWMtPmJhc2UpOwo+ICAKPiAtCW1jLT5idXNjbGsg
PSBkZXZtX2Nsa19nZXQoJnBkZXYtPmRldiwgImJsa212Iik7Cj4gKwltYy0+YnVzY2xrID0gZGV2
bV9jbGtfZ2V0X2VuYWJsZWQoJnBkZXYtPmRldiwgImJsa212Iik7CgpbU2V2ZXJpdHk6IE1lZGl1
bV0KVGhlIGNvbW1pdCBtZXNzYWdlIGNsYWltcyB0byBvbmx5IGZpeCB0aGUgSVJRIGhhbmRsZXIg
cmV0dXJuIHZhbHVlIGFuZApmYWxsdGhyb3VnaCBsb2dpYywgYnV0IGlzIHRoaXMgY2hhbmdlIHRv
IHVzZSBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpIHJlbGF0ZWQ/CgpUaGUgY2hhbmdlbG9nIG1lbnRp
b25zIHRoYXQgb3RoZXIgcHJlLWV4aXN0aW5nIGlzc3VlcyB3ZXJlIG1lYW50IGZvciBhCnNlcGFy
YXRlIHBhdGNoLiBXYXMgdGhpcyBjaGFuZ2UsIGFsb25nIHdpdGggdGhlIGNoYW5uZWwgbGlzdCBh
bGxvY2F0aW9uCnJlb3JkZXJpbmcgYmVsb3csIHNxdWFzaGVkIGludG8gdGhpcyBwYXRjaCBhY2Np
ZGVudGFsbHk/Cgo+ICAJaWYgKElTX0VSUihtYy0+YnVzY2xrKSkgewo+ICAJCWVyciA9IFBUUl9F
UlIobWMtPmJ1c2Nsayk7Cj4gLQkJZGV2X2VycigmcGRldi0+ZGV2LCAiQ2Fubm90IGdldCBjb3Jl
IGNsb2NrIGVycj0lZFxuIiwgZXJyKTsKPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJDYW5ub3Qg
Z2V0L2VuYWJsZSBjb3JlIGNsb2NrIGVycj0lZFxuIiwgZXJyKTsKPiAgCQlyZXR1cm4gZXJyOwo+
ICAJfQo+ICAKPiArCWVyciA9IG1lc29uX2FsbG9jYXRlX2NoYW5saXN0KG1jKTsKPiArCWlmIChl
cnIpCj4gKwkJcmV0dXJuIGVycjsKPiArCj4gIAlmb3IgKGkgPSAwOyBpIDwgTUFYRkxPVzsgaSsr
KSB7Cj4gIAkJbWMtPmlycXNbaV0gPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIGkpOwoKW1NldmVy
aXR5OiBMb3ddCklzIHRoaXMgb3JkZXIgb2YgaW5pdGlhbGl6YXRpb24gZWZmaWNpZW50IHdoZW4g
ZGVhbGluZyB3aXRoIHByb2JlIGRlZmVycmFscz8KClRoZSBwYXRjaCBtb3ZlcyB0aGUgbWVzb25f
YWxsb2NhdGVfY2hhbmxpc3QoKSBjYWxsIGJlZm9yZSB0aGUgbG9vcCB0aGF0IGNhbGxzCnBsYXRm
b3JtX2dldF9pcnEoKS4gVGhlIGFsbG9jYXRpb24gZnVuY3Rpb24gcGVyZm9ybXMgaGVhdnkgYWxs
b2NhdGlvbnMgbGlrZSBETUEKbWVtb3J5IGFuZCBjcnlwdG8gZW5naW5lcy4KCklmIHBsYXRmb3Jt
X2dldF9pcnEoKSByZXR1cm5zIC1FUFJPQkVfREVGRVIsIHRoZXNlIGhlYXZ5IHJlc291cmNlcyB3
aWxsIGJlCmFsbG9jYXRlZCBhbmQgaW1tZWRpYXRlbHkgZGVzdHJveWVkLgoKV291bGQgaXQgYmUg
YmV0dGVyIHRvIGtlZXAgdGhlIElSUSBsb29rdXBzIGJlZm9yZSB0aGUgY2hhbm5lbCBsaXN0IGFs
bG9jYXRpb24KdG8gYXZvaWQgdW5uZWNlc3NhcnkgcHJvYmUgZGVmZXJyYWwgb3ZlcmhlYWQsIHdo
aWxlIGxlYXZpbmcgZGV2bV9yZXF1ZXN0X2lycSgpCmFmdGVyIHRoZSBhbGxvY2F0aW9uIHRvIHBy
ZXZlbnQgdGhlIE5VTEwgZGVyZWZlcmVuY2UgcmFjZT8KCj4gLQkJaWYgKG1jLT5pcnFzW2ldIDwg
MCkKPiAtCQkJcmV0dXJuIG1jLT5pcnFzW2ldOwo+ICsJCWlmIChtYy0+aXJxc1tpXSA8IDApIHsK
PiArCQkJZXJyID0gbWMtPmlycXNbaV07Cj4gKwkJCWdvdG8gZXJyb3JfY2hhbmxpc3Q7Cj4gKwkJ
fQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MDkxODExMDUwNC43MjA3LTEtcmFpenVkZWVuLmtlcm5lbGRldkBnbWFpbC5jb20/cGFy
dD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
