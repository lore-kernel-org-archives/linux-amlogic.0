Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D46C982DE
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2026 08:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5f5fZ4ZjK0JzEMMQQeS2w+D0jlup8OKC974Ic8BlB0=; b=eH3FE/MJLR9KPB
	iyfqLHAqQ1tQpifKCZrn/+QDLYaW/3C9FRLg6uBQICh4erBcDrIAgphsozxCfdGWUcxF9/S025n0t
	0vG/FJEc5HW5mdfkfq7Hpa/X84X3+GA4GJmk3Sq5qiQGLIqB4lzfudaw2bX8pEeDVXVtNTqsoEtQS
	snop/cJq5PyQJTRAq1qIX+A0wwsftiEDI/9RLTJ1WndHoHsh3Sgszh6dR2jvJeRsCzkrRY+gZIsdd
	AFcyjdvcMZATJvTMZdmP8hEMzXYL3ET2M1z+un5btO5hRxZbCmlVqlWM21PKMi67To1Yy/AcZi3f8
	L715pKniDZZUksxaDCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Z9w-00000001JVQ-1sXI;
	Mon, 21 Sep 2026 08:13:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Z9v-00000001JVA-1CN9
	for linux-amlogic@lists.infradead.org;
	Mon, 21 Sep 2026 08:13:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AC6C843B72;
	Mon, 21 Sep 2026 08:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C561F000FF;
	Mon, 21 Sep 2026 08:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789978434;
	bh=eKCFZ6M4EMEb0RxVM5oBQhZLNCEVB4QYyFA/3HKxp74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kfknk6HWp4BAgO07yCdsDBVLNb+MkKmZRM1DvZB9jcgKpGxqQLexwGHM9h+WGwQ7d
	 XFQyIWi7URJ52gucYhFi8pgKLGQv0SOjzgUSxngK2oREZb6F73zT9VWk/uzjIbhgz4
	 dfo1qJbq2lZbmX5NNgkYAaBf1LWnOU2vM5L1aI+uV7mcxrrBoTWahXiJMQdopVA2md
	 iE5FPbCR5DAto0pffUC4uLbZFqcAr44vWjXJg/jNLXqyyoJf+i8iDPuIY7p45d91qa
	 YXvLSDvgEuhsdc0u4s2/l+fs10g0BF7zmyIOilJjT8AyUyS4x99nAc1UUDnPpkJwAW
	 scz/7OaXFBIUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: net: meson-dwmac: add T7 support
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260920-t7-node-new-v1-2-e6e0840c1b0b@amlogic.com>
References: <20260920-t7-node-new-v1-0-e6e0840c1b0b@amlogic.com>
 <20260920-t7-node-new-v1-2-e6e0840c1b0b@amlogic.com>
Date: Mon, 21 Sep 2026 08:13:53 +0000
Message-Id: <20260921081354.37C561F000FF@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZHQtYmluZGluZ3M6
IG5ldDogbWVzb24tZHdtYWM6IG1pc3NpbmcgdDctZHdtYWMgaW4gc2VsZWN0IGJsb2NrCi0gW01l
ZGl1bV0gZHQtYmluZGluZ3M6IG5ldDogbWVzb24tZHdtYWM6IG1pc3NpbmcgdDctZHdtYWMgaW4g
Z2VuZXJhdGlvbmFsIGNvbnN0cmFpbnRzCi0tCgpjb21taXQgY2YyYmQxNmM1MTg4YTBkNmQyYTBl
MmZkZjkxZGQ1MGViZmE2OTViOApBdXRob3I6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFt
bG9naWMuY29tPgoKZHQtYmluZGluZ3M6IG5ldDogbWVzb24tZHdtYWM6IGFkZCBUNyBzdXBwb3J0
CgpBZGRzIHRoZSBUNyBjb21wYXRpYmxlIHN0cmluZyB0byB0aGUgTWVzb24gRFdNQUMgYmluZGlu
ZyBhbmQgYWRkcyBhCmNvbmRpdGlvbmFsIHNjaGVtYSBjaGVjayB0byBlbmZvcmNlIHRoZSBjb3Jy
ZWN0IGNvbXBhdGlibGUgY29tYmluYXRpb24uCgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvYW1sb2dpYyxtZXNvbi1kd21hYy55YW1s
Cj4gaW5kZXggNWM5MTcxNmQxZjIxZS4uZjc1YTI3NWUyZDc1OSAxMDA2NDQKPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFt
bAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvYW1sb2dpYyxt
ZXNvbi1kd21hYy55YW1sCj4gQEAgLTI4LDYgKzI4LDE4IEBAIHNlbGVjdDoKCltTZXZlcml0eTog
TWVkaXVtXQpTaG91bGQgYW1sb2dpYyx0Ny1kd21hYyBiZSBhZGRlZCB0byB0aGUgc2VsZWN0IGJs
b2NrPwoKSWYgYSBub2RlIGlzIGFkZGVkIHdpdGggY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHQ3LWR3
bWFjIjssIGl0IGFwcGVhcnMgdGhlCmR0LXZhbGlkYXRvciB3aWxsIHNraXAgdGhpcyBzY2hlbWEg
ZW50aXJlbHkgaWYgdGhlIHN0cmluZyBpcyBub3QgZXhwbGljaXRseQpsaXN0ZWQgaW4gdGhlIHNl
bGVjdCBwcm9wZXJ0aWVzLiBUaGlzIHdvdWxkIGJ5cGFzcyB0aGUgbmV3IGFsbE9mLmlmIHJ1bGVz
CmFkZGVkIGJlbG93LgoKPiAgCj4gIGFsbE9mOgo+ICAgIC0gJHJlZjogc25wcyxkd21hYy55YW1s
Iwo+ICsgIC0gaWY6Cj4gKyAgICAgIHByb3BlcnRpZXM6Cj4gKyAgICAgICAgY29tcGF0aWJsZToK
PiArICAgICAgICAgIGNvbnRhaW5zOgo+ICsgICAgICAgICAgICBjb25zdDogYW1sb2dpYyx0Ny1k
d21hYwo+ICsgICAgdGhlbjoKPiArICAgICAgcHJvcGVydGllczoKPiArICAgICAgICBjb21wYXRp
YmxlOgo+ICsgICAgICAgICAgaXRlbXM6Cj4gKyAgICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMs
dDctZHdtYWMKPiArICAgICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxtZXNvbi1heGctZHdtYWMK
PiArICAgICAgICAgICAgLSBjb25zdDogc25wcyxkd21hYy00LjAwCgpbIC4uLiBdCgo+IEBAIC0x
MzksOCArMTUxLDEwIEBAIHByb3BlcnRpZXM6Cj4gICAgICAgICAgICAtIGFtbG9naWMsbWVzb24t
Z3hiYi1kd21hYwo+ICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWF4Zy1kd21hYwo+ICAgICAg
ICAgICAgLSBhbWxvZ2ljLG1lc29uLWcxMmEtZHdtYWMKPiArICAgICAgICAgIC0gYW1sb2dpYyx0
Ny1kd21hYwoKW1NldmVyaXR5OiBNZWRpdW1dCkRvZXMgdGhpcyBuZXcgY29tcGF0aWJsZSBzdHJp
bmcgYWxzbyBuZWVkIHRvIGJlIGFkZGVkIHRvIHRoZSBleGlzdGluZwphbGxPZi5pZiBibG9ja3Mg
dGhhdCBjaGVjayBmb3IgYW1sb2dpYyxtZXNvbi1heGctZHdtYWM/CgpTaW5jZSBUNyB1c2VzIEFY
RyBhcyBhIGZhbGxiYWNrLCBpdCBzaGFyZXMgaXRzIGhhcmR3YXJlIGNvbnN0cmFpbnRzIGxpa2UK
Y2xvY2tzIGFuZCByeC1pbnRlcm5hbC1kZWxheS1wcy4gQnkgb21pdHRpbmcgYW1sb2dpYyx0Ny1k
d21hYyBmcm9tIHRob3NlCmV4aXN0aW5nIGNvbmRpdGlvbmFsIGJsb2NrcywgdGhlIHNjaGVtYSBp
bXBsaWNpdGx5IHJlbGllcyBvbiB0aGUgZmFsbGJhY2sKc3RyaW5nIHRvIHRyaWdnZXIgdmFsaWRh
dGlvbi4gQSBtaXNzaW5nIGZhbGxiYWNrIHN0cmluZyBpbiBhIGRldmljZSB0cmVlCndvdWxkIGJ5
cGFzcyB0aGVzZSBnZW5lcmF0aW9uYWwgY29uc3RyYWludHMuCgo+ICAgICAgY29udGFpbnM6Cj4g
ICAgICAgIGVudW06Cj4gKyAgICAgICAgLSBzbnBzLGR3bWFjLTQuMDAKPiAgICAgICAgICAtIHNu
cHMsZHdtYWMtMy43MGEKPiAgICAgICAgICAtIHNucHMsZHdtYWMKCi0tIApTYXNoaWtvIEFJIHJl
dmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MjAtdDctbm9kZS1u
ZXctdjEtMC1lNmUwODQwYzFiMGJAYW1sb2dpYy5jb20/cGFydD0yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
