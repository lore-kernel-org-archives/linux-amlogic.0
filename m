Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF32C44501
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2026 10:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fkr70g3CwC3viZEF/AG+XGJ2YfCRF+p4AIM/MUfISDs=; b=dfnI7jzS5VS5do
	fzkttg7WCvxxYVZDY8xY/nQiX6aLxAVs8MbkhDQbkdWIIfXm4RxIwsjfYDEoMg5ojXivz74Wu/8XV
	vUU4AQhiPmWXdkuZHs2OAqeJRAMHh8KwRFgce2TQVc97Qn+Fs7UR1tXgTLOFcusYiORILr8fbdRej
	BN9SAFS60JnJBftyl52sqpYEf4HhbQ9bODExanLknV1eHoEPQMrQcBLrwOm+btASl/dDB+wK7Wtke
	RUgRbcDXLDdUwUG44+qW0/4Hz6nGnR+a5s6sicTv82lKoQVW1sI6ssKPx13I1bw2CcQy6Yr86/5VI
	GAdXZdz/QEba0N/PTV4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJHm-0000000H0bF-1jQd;
	Thu, 16 Jul 2026 10:25:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJHl-0000000H0ag-1m2i
	for linux-amlogic@lists.infradead.org;
	Thu, 16 Jul 2026 10:25:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E261E40385;
	Thu, 16 Jul 2026 10:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7681F00A3A;
	Thu, 16 Jul 2026 10:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784197544;
	bh=6FNbQhstUQ+nh/zZYhBzJqN5rj6ify5dRBkfLuGx6IA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PvD+33+HmfKCjzZvasgiDI2Q3mGgMdu7eH8txSscDi9Us+vRO8qGdk8W1Vun9znXL
	 60VprATqpWRWQMZXrNmSE/b8I/SaCzMkqeQcZxJpa5yLPWUmLuZjggCdlMSntRl2xM
	 6QBO6W5+qhmvdG9uNkrm2IfMESAkwxr+8C/06USuNusy3LSQLAfRHiKlvzZjhezMiO
	 5DEXesAtgIVcfthJM2Y+yF61qOrcT5OadreS5tQ+juFOrmcXDrYNvPC2czxZSRebLu
	 8ERz+PzuUNbHi0AtdUIRlDRQxRuBNCyx/AkKx+fNMIdTWgQ5P9zS3gYyqeC2BLwt9N
	 HT1dR/r1dDVkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: meson: Keep link pointers valid on realloc
 failure
To: "Linmao Li" <lilinmao@kylinos.cn>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260716100939.1381759-1-lilinmao@kylinos.cn>
References: <20260716100939.1381759-1-lilinmao@kylinos.cn>
Date: Thu, 16 Jul 2026 10:25:44 +0000
Message-Id: <20260716102544.8B7681F00A3A@smtp.kernel.org>
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
IFtIaWdoXSBVbmJpbmRpbmcgdGhlIGRldmljZSBjYXVzZXMgYSB1c2UtYWZ0ZXItZnJlZSBiZWNh
dXNlIGBtZXNvbl9jYXJkX3JlbW92ZWAgZnJlZXMgYGNhcmQtPmRhaV9saW5rYCBtYW51YWxseSBi
ZWZvcmUgdGhlIGRldnJlcyBjYWxsYmFja3MgdW5yZWdpc3RlciB0aGUgY2FyZC4KLS0KCi0tLSBQ
YXRjaCBbMV06IFtQQVRDSF0gQVNvQzogbWVzb246IEtlZXAgbGluayBwb2ludGVycyB2YWxpZCBv
biByZWFsbG9jIGZhaWx1cmUgLS0tCmNvbW1pdCA2NzdhZDc1ZjVmYjVhNTc4Yjk4NGU3NDRmMjZk
MjRiOTYxYzg5Njg1CkF1dGhvcjogTGlubWFvIExpIDxsaWxpbm1hb0BreWxpbm9zLmNuPgoKQVNv
QzogbWVzb246IEtlZXAgbGluayBwb2ludGVycyB2YWxpZCBvbiByZWFsbG9jIGZhaWx1cmUKClRo
aXMgY29tbWl0IGZpeGVzIGEgcG90ZW50aWFsIHVzZS1hZnRlci1mcmVlIGFuZCBkb3VibGUgZnJl
ZSBpbiB0aGUgZXJyb3IKcGF0aCBvZiBtZXNvbl9jYXJkX3JlYWxsb2NhdGVfbGlua3MoKS4gSXQg
dXBkYXRlcyB0aGUgY2FyZC0+ZGFpX2xpbmsKcG9pbnRlciBpbW1lZGlhdGVseSBhZnRlciB0aGUg
Zmlyc3Qgc3VjY2Vzc2Z1bCBrcmVhbGxvYygpLCBlbnN1cmluZyB0aGUKY2xlYW51cCBwYXRoIGNh
biBzYWZlbHkgZnJlZSB0aGUgbWVtb3J5IGlmIHRoZSBzZWNvbmQga3JlYWxsb2MoKSBmYWlscy4K
Cj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9tZXNvbi9tZXNvbi1jYXJkLXV0aWxzLmMgYi9zb3Vu
ZC9zb2MvbWVzb24vbWVzb24tY2FyZC11dGlscy5jCj4gaW5kZXggY2RiNzU5YjQ2NmFkNC4uMzhj
MWIyYWUyMjdmZiAxMDA2NDQKPiAtLS0gYS9zb3VuZC9zb2MvbWVzb24vbWVzb24tY2FyZC11dGls
cy5jCj4gKysrIGIvc291bmQvc29jL21lc29uL21lc29uLWNhcmQtdXRpbHMuYwo+IEBAIC01Miwx
OSArNTIsMTggQEAgaW50IG1lc29uX2NhcmRfcmVhbGxvY2F0ZV9saW5rcyhzdHJ1Y3Qgc25kX3Nv
Y19jYXJkICpjYXJkLAo+ICAJaWYgKCFsaW5rcykKPiAgCQlnb3RvIGVycl9saW5rczsKPiAgCj4g
Kwlwcml2LT5jYXJkLmRhaV9saW5rID0gbGlua3M7Cj4gKwo+ICAJbGRhdGEgPSBrcmVhbGxvYyhw
cml2LT5saW5rX2RhdGEsCj4gIAkJCSBudW1fbGlua3MgKiBzaXplb2YoKnByaXYtPmxpbmtfZGF0
YSksCj4gIAkJCSBHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7Cj4gIAlpZiAoIWxkYXRhKQo+IC0J
CWdvdG8gZXJyX2xkYXRhOwo+ICsJCWdvdG8gZXJyX2xpbmtzOwo+ICAKPiAtCXByaXYtPmNhcmQu
ZGFpX2xpbmsgPSBsaW5rczsKPiAgCXByaXYtPmxpbmtfZGF0YSA9IGxkYXRhOwo+ICAJcHJpdi0+
Y2FyZC5udW1fbGlua3MgPSBudW1fbGlua3M7Cj4gIAlyZXR1cm4gMDsKPiAgCj4gLWVycl9sZGF0
YToKPiAtCWtmcmVlKGxpbmtzKTsKPiAgZXJyX2xpbmtzOgo+ICAJZGV2X2Vycihwcml2LT5jYXJk
LmRldiwgImZhaWxlZCB0byBhbGxvY2F0ZSBsaW5rc1xuIik7Cj4gIAlyZXR1cm4gLUVOT01FTTsK
CltTZXZlcml0eTogSGlnaF0KVGhpcyBpc24ndCBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0
Y2gsIGJ1dCBkb2VzIHVuYmluZGluZyB0aGUgZGV2aWNlCmNhdXNlIGEgdXNlLWFmdGVyLWZyZWUg
YmVjYXVzZSBtZXNvbl9jYXJkX3JlbW92ZSgpIGZyZWVzIGNhcmQtPmRhaV9saW5rCm1hbnVhbGx5
IGJlZm9yZSB0aGUgZGV2cmVzIGNhbGxiYWNrcyB1bnJlZ2lzdGVyIHRoZSBjYXJkPwoKV2hlbiB0
aGUgZHJpdmVyIGlzIHVuYm91bmQsIHRoZSBkcml2ZXIgY29yZSBjYWxscyBtZXNvbl9jYXJkX3Jl
bW92ZSgpLCB3aGljaApjYWxscyBtZXNvbl9jYXJkX2NsZWFuX3JlZmVyZW5jZXMoKSB0byBmcmVl
IHRoZSBsaW5rczoKCnNvdW5kL3NvYy9tZXNvbi9tZXNvbi1jYXJkLXV0aWxzLmM6bWVzb25fY2Fy
ZF9jbGVhbl9yZWZlcmVuY2VzKCkgewogICAgLi4uCiAgICBrZnJlZShjYXJkLT5kYWlfbGluayk7
CiAgICAuLi4KfQoKT25seSBhZnRlciAucmVtb3ZlIHJldHVybnMgZG9lcyB0aGUgZHJpdmVyIGNv
cmUgcnVuIGRldnJlcyBjYWxsYmFja3MsIHdoaWNoCmluY2x1ZGVzIHVucmVnaXN0ZXJpbmcgdGhl
IGNhcmQgdmlhIGRldm1fc25kX3NvY19yZWdpc3Rlcl9jYXJkJ3MgY2xlYW51cApoYW5kbGVyLgoK
VGhlIEFTb0MgdW5yZWdpc3RlciBwYXRoIGl0ZXJhdGVzIG92ZXIgYWxsIFBDTSBydW50aW1lcyBh
bmQgZGVyZWZlcmVuY2VzCnJ0ZC0+ZGFpX2xpbmssIHdoaWNoIHBvaW50cyBkaXJlY3RseSB0byBl
bGVtZW50cyBvZiB0aGUgYWxyZWFkeSBmcmVlZApjYXJkLT5kYWlfbGluayBhcnJheS4KCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3
MTYxMDA5MzkuMTM4MTc1OS0xLWxpbGlubWFvQGt5bGlub3MuY24/cGFydD0xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
