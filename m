Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E09C55167
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2026 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g4RStF/yyNATPi9R4ULZ/gnYmYTaJ7L+JRz5Pq4VpgE=; b=Uh26+BJZYUmYHm
	mYdOhXiVTJ6UXfu3vhbw3BPbAVhGa911R73fdqvuFN+t7ycA0o1gUbBcbf1Hb88InrGJvP0vVu4wf
	jHmGNy+Hgl9uDTE6N9lXe1wq6ZHJk631VTadknsjrp0Ky/XjPmNo7ygAoYB5w2neGK+DbBeD4TvMS
	r17Tp0iaWhzoCEd5WwVTuO61MlkeLTPGA9sFI25u3sOxj4qlAjCfA7Qq2HuJVDzIRamSFpL9Ah/He
	dbLHBGkCgcwyiEx7yhMv2NNmni3Q9waZSRFcp+MEvCSHWSqmsSFPMZIKeQMBnmzXY+RtcN/InIqYP
	UKkU/6UgPFwxy6GQCxBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjPZ-0000000CAgA-3SLU;
	Fri, 31 Jul 2026 09:20:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjPY-0000000CAg2-0Vt5
	for linux-amlogic@lists.infradead.org;
	Fri, 31 Jul 2026 09:20:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE0D9434FA;
	Fri, 31 Jul 2026 09:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331981F000E9;
	Fri, 31 Jul 2026 09:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489611;
	bh=f02xA1VOWhh4l04v2UrSR6HiO+WdAgJSKe1Cz90pXH8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WDKOz0ibesHO4rFUJUc5C38TFqZQ2sWD5UoV1YxVpDtBaTDh4hxpFFLYz6TLgtxfP
	 JUJ1lk9Z8C6YM25nj+E5H/4YhMZPUtWa7Z2gy+5hy3cMQBT9BB/VbSlqvM0Det2mcW
	 LEHJVWv29bnO+zHkF2wmeTJpCht7aKUl3hiU9lAbEtwHj4y7SdabPaRa3YuoppCghd
	 pu8lM1PVuIG9gSg5so1bVNbjUjP1B3AnFP27lsm1NASs9Fo8/4bkUJTEBVd6TwrwAU
	 0bR4oXcn1v1irXBW75ZfcVBS+Cf8PHLAfZyZmaOtmZtmD+TsmfqfOaQQQ4H39Y5maf
	 FxLVo9UOaqWzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] spi: amlogic: spisg: Fix the incorrect keep_ss
 of the last descriptor
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: conor+dt@kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260731-a9-spisg-v3-3-a15da3f70029@amlogic.com>
References: <20260731-a9-spisg-v3-0-a15da3f70029@amlogic.com>
 <20260731-a9-spisg-v3-3-a15da3f70029@amlogic.com>
Date: Fri, 31 Jul 2026 09:20:10 +0000
Message-Id: <20260731092011.331981F000E9@smtp.kernel.org>
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
IFtIaWdoXSBUaGUgRE1BIGRlc2NyaXB0b3JzIGFyZSBkZWZpbmVkIHVzaW5nIG5hdGl2ZSBpbnRl
Z2VyIHR5cGVzIGFuZCBsYWNrIGVuZGlhbm5lc3MgY29udmVyc2lvbnMuCi0tCgotLS0gUGF0Y2gg
WzNdOiBbUEFUQ0ggdjMgMy80XSBzcGk6IGFtbG9naWM6IHNwaXNnOiBGaXggdGhlIGluY29ycmVj
dCBrZWVwX3NzIG9mIHRoZSBsYXN0IGRlc2NyaXB0b3IgLS0tCmNvbW1pdCBiOWQ2ZjA3ZTc5ZGNk
MWU5YzViNzNkZThiZTY5MDQ5NDVlZjlkOTdiCkF1dGhvcjogU3VubnkgTHVvIDxzdW5ueS5sdW9A
YW1sb2dpYy5jb20+CgpzcGk6IGFtbG9naWM6IHNwaXNnOiBGaXggdGhlIGluY29ycmVjdCBrZWVw
X3NzIG9mIHRoZSBsYXN0IGRlc2NyaXB0b3IKClRoaXMgY29tbWl0IGZpeGVzIGFuIGlzc3VlIHdo
ZXJlIENGR19LRUVQX1NTIHdhcyB1bmNvbmRpdGlvbmFsbHkKY2xlYXJlZCBvbiB0aGUgbGFzdCBk
ZXNjcmlwdG9yLCBjYXVzaW5nIHRoZSBjc19jaGFuZ2Ugc2V0dGluZyB0byBiZQppZ25vcmVkIGZv
ciB0aGUgZmluYWwgdHJhbnNmZXIuIEl0IHJlY29yZHMgdGhlIGNzX2NoYW5nZSB2YWx1ZSBhbmQK
YXBwbGllcyBpdCBjb3JyZWN0bHksIGV2ZW4gd2hlbiBhIG51bGwgZGVzY3JpcHRvciBpcyBpbnNl
cnRlZCBmb3IKY3MtaG9sZCBkZWxheS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1h
bWxvZ2ljLXNwaXNnLmMgYi9kcml2ZXJzL3NwaS9zcGktYW1sb2dpYy1zcGlzZy5jCj4gaW5kZXgg
YTYxMjM5NzVhMzdjZi4uMmQ2NmYwMGRjY2Q0NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NwaS9z
cGktYW1sb2dpYy1zcGlzZy5jCj4gKysrIGIvZHJpdmVycy9zcGkvc3BpLWFtbG9naWMtc3Bpc2cu
YwpbIC4uLiBdCj4gQEAgLTUzOSwxMyArNTQyLDE3IEBAIHN0YXRpYyBpbnQgYW1sX3NwaXNnX3Ry
YW5zZmVyX29uZV9tZXNzYWdlKHN0cnVjdCBzcGlfY29udHJvbGxlciAqY3RsciwKPiAgCQkJCSAg
ICAgICB4ZmVyLT5lZmZlY3RpdmVfc3BlZWRfaHopOwo+ICAJfQo+ICAKPiAtCWlmIChjc19ob2xk
X2luX3NjbGspCj4gKwlpZiAoY3NfaG9sZF9pbl9zY2xrKSB7Cj4gIAkJLyogYWRkaXRpb25hbCBu
dWxsLWRlc2NyaXB0b3IgdG8gYWNoaWV2ZSB0aGUgY3MtaG9sZCBkZWxheSAqLwo+ICAJCWFtbF9z
cGlzZ19zZXR1cF9udWxsX2Rlc2Moc3Bpc2csIGRlc2MsIGNzX2hvbGRfaW5fc2Nsayk7Cj4gLQll
bHNlCj4gIAkJZGVzYy0tOwo+ICsJCWRlc2MtPmNmZ19idXMgfD0gRklFTERfUFJFUChDRkdfS0VF
UF9TUywgMSk7Cj4gKwkJZGVzYysrOwo+ICsJfSBlbHNlIHsKPiArCQlkZXNjLS07Cj4gKwl9Cj4g
IAo+IC0JZGVzYy0+Y2ZnX2J1cyB8PSBGSUVMRF9QUkVQKENGR19LRUVQX1NTLCAwKTsKPiArCUZJ
RUxEX01PRElGWShDRkdfS0VFUF9TUywgJmRlc2MtPmNmZ19idXMsIGxhc3RfeGZlcl9rZWVwX3Nz
KTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IHNp
bmNlIHRoaXMgY29kZSBtb2RpZmllcyBhIGhhcmR3YXJlLWZhY2luZwpETUEgZGVzY3JpcHRvciBp
biBhbWxfc3Bpc2dfdHJhbnNmZXJfb25lX21lc3NhZ2UoKSwgd2lsbCB0aGVzZSBuYXRpdmUgaW50
ZWdlcgphc3NpZ25tZW50cyBjYXVzZSBmYWlsdXJlcyBvbiBiaWctZW5kaWFuIGFyY2hpdGVjdHVy
ZXM/CgpMb29raW5nIGF0IGRyaXZlcnMvc3BpL3NwaS1hbWxvZ2ljLXNwaXNnLmMsIHN0cnVjdCBz
cGlzZ19kZXNjcmlwdG9yIGRlZmluZXMKdGhlc2UgZmllbGRzIHVzaW5nIG5hdGl2ZSBpbnRlZ2Vy
IHR5cGVzOgoKc3RydWN0IHNwaXNnX2Rlc2NyaXB0b3IgewoJdTMyCQkJCWNmZ19zdGFydDsKCXUz
MgkJCQljZmdfYnVzOwoJdTY0CQkJCXR4X3BhZGRyOwoJdTY0CQkJCXJ4X3BhZGRyOwp9OwoKQW5k
IG5hdGl2ZSB2YWx1ZXMgYXJlIGRpcmVjdGx5IGFzc2lnbmVkIHRvIHRoZW0gd2l0aG91dCBlbmRp
YW5uZXNzIGNvbnZlcnNpb24sCnN1Y2ggYXMgZGVzYy0+dHhfcGFkZHIgPSBwYWRkciBpbiBhbWxf
c3Bpc2dfc2V0dXBfdHJhbnNmZXIoKSwgb3IgdmlhCkZJRUxEX1BSRVAoKSBhbmQgRklFTERfTU9E
SUZZKCkgaGVyZS4KCk9uIGJpZy1lbmRpYW4gQ1BVIGNvbmZpZ3VyYXRpb25zLCB3b24ndCB0aGUg
aGFyZHdhcmUgcmVjZWl2ZSBieXRlLXN3YXBwZWQKdmFsdWVzIGZvciBwaHlzaWNhbCBhZGRyZXNz
ZXMgYW5kIGNvbmZpZ3VyYXRpb24gZmllbGRzLCBwb3RlbnRpYWxseSBsZWFkaW5nCnRvIERNQSBm
YXVsdHMgb3IgbWVtb3J5IGNvcnJ1cHRpb24/IFNob3VsZCB0aGVzZSBoYXJkd2FyZSBkZXNjcmlw
dG9ycyBiZQpkZWZpbmVkIHdpdGggZXhwbGljaXQgZW5kaWFuIHR5cGVzIChsaWtlIF9fbGUzMiBh
bmQgX19sZTY0KSBhbmQgdXBkYXRlZAp1c2luZyBjb252ZXJzaW9ucyBsaWtlIGNwdV90b19sZTMy
KCk/Cgo+ICAJZGVzYy0+Y2ZnX3N0YXJ0IHw9IEZJRUxEX1BSRVAoQ0ZHX0VPQywgMSk7Cj4gIAo+
ICAJLyogc29tZSB0b2xlcmFuY2VzICovCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzMxLWE5LXNwaXNnLXYzLTAtYTE1ZGEzZjcw
MDI5QGFtbG9naWMuY29tP3BhcnQ9MwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
