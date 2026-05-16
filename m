Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C89ECD4F3C
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 May 2026 19:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1FgDf8XmE7SJyLizuDy6iOReNNtHdQjaBl7hkjIV9wY=; b=MOLE/FhJeFt0aD
	eQOFk2Rb7z84i/AfuIl6oVprpSxPa6X39ImzUolqhrt9b1k3VI7LU+HHIi/i9U/2v+zFr/kQDic9F
	3DIKpRTxxZe75xpW3Q2rH4qMfMWdBu0ivil3RIU5yJFfmgAeW5/krObhy6W7/8vHv93yOWZg1JmvC
	vE3BjTKTW+dEy2YtED2Pe3m6WaOCB7NJkX95Yj25UcG3gjUhMqGue1qDUMZj2oA7Dwz9waQSkoaTG
	iZqkeB1N1BpO7FjRGpLL6yx1U+LRGLHAvuwiIM0VhEhxqlZ2h40mwABhvVzv09s44ZMbDeeF85cbT
	74VKY3/H6CaBEjGIxwfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKj6-0000000BNRM-3P7b;
	Sat, 16 May 2026 19:31:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKj5-0000000BNR4-18YS
	for linux-amlogic@bombadil.infradead.org;
	Sat, 16 May 2026 19:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Reply-To:
	Subject:From:Sender:MIME-Version:Content-ID:Content-Description;
	bh=NixUhPVEx4+FEdHqOQXP5P0XFP8BV9ZYO02Brf7hImA=; b=jAsagN0oL2khC3Cso1Fht3J0PQ
	OmdH/czDMVbcjFL5rtFCh+VOFq4fuJ5rKnbg4N5xoYAkEi6YP0KlEY2Y2NgfKVxLoeCcdRyfOEwSM
	Dny0biuuk+pzCwycyzRswCmFmvUMOHvoi4D3Uz2FDsBYA+RI14/49huG7d3AhzGT5ZyGM0dc51HQ6
	SageckGz52MoIC/BCunObH30R6bhLgj2HMInGgwGQ5mdP7gm5hyX4ZzQ7gZpYyXJhepm6MrlCWrs9
	DhimNL6+WuedrcghF3NiBtVuGw5FTBI+L/IgSOPJAvplhHFtuyVUVle0eIw2vSpjJdP28WzR0M88P
	aBB6F2FA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKj1-00000007gos-2b39
	for linux-amlogic@lists.infradead.org;
	Sat, 16 May 2026 19:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C5DD840740;
	Sat, 16 May 2026 19:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69570C19425;
	Sat, 16 May 2026 19:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778959859;
	bh=qa4Kx8AigUFqG+escYqdRdXu8yHs7QJV/56q/8UC7UM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=XYavl+NjWkcLvA3ehzo3B/xIsnzZwGWuuWZIpnHyQL46iRKRiRfFtdyNG5eJytnM9
	 DMviyVDLQ85LPm0i3ei7Qx9Jd1c8rO1O72/8C43+V1PdaMnnKeNuIF5b7x7U8qo6Qr
	 a28d6avznVmsNwEwmssGxaiW+he+DdI/5Q31WSGPHcR9dDkmKHzJStdoHAM6rdIgWi
	 QfqNK/g1uNA/8Yg5KX3xm5+UDU3JQTeYnj5oWs2//6Nu64rLVJ85IdNlhFLpBHmIyL
	 mim4XEaamS9ASSGabwokexVibx5G3w3rMrbvSTzdwsh1bG69fqE8e5AGxfhtljGeup
	 dVY2zJMdHF5UA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 15/22] drm: bridge: dw_hdmi: Declare bridge CEC
 notifier support
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev, linux-sunxi@lists.linux.dev
In-Reply-To: <20260516183838.2024991-16-jonas@kwiboo.se>
References: <20260516183838.2024991-16-jonas@kwiboo.se>
Date: Sat, 16 May 2026 19:30:58 +0000
Message-Id: <20260516193059.69570C19425@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_203104_188581_763E39C7 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIGRyaXZlciB1
bmNvbmRpdGlvbmFsbHkgYWR2ZXJ0aXNlcyBDRUMgbm90aWZpZXIgc3VwcG9ydCBldmVuIGlmIHRo
ZSBDRUMgcGxhdGZvcm0gZGV2aWNlIGZhaWxzIHRvIHJlZ2lzdGVyLgotLQoKY29tbWl0IDI4YTkw
YmNmOGQ3ODYxZWU3MTI0ODk5Yjg4NzQ1Y2MwYzg5MmYzOTAKQXV0aG9yOiBKb25hcyBLYXJsbWFu
IDxqb25hc0Brd2lib28uc2U+Cgpkcm06IGJyaWRnZTogZHdfaGRtaTogRGVjbGFyZSBicmlkZ2Ug
Q0VDIG5vdGlmaWVyIHN1cHBvcnQKClRoaXMgY29tbWl0IHVwZGF0ZXMgdGhlIGJyaWRnZSB0byBh
ZHZlcnRpc2UgQ0VDIG5vdGlmaWVyIHN1cHBvcnQsCmluc3RydWN0aW5nIHRoZSBicmlkZ2UgY29u
bmVjdG9yIHRvIHVzZSBnZW5lcmljIENFQyBub3RpZmllciBoZWxwZXJzLgoKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IGluZGV4IDM2NDljY2Y4ZDk5NGUuLjE0
MDJiMzk2M2FlMTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhk
bWkuYwo+IEBAIC0zNTM3LDYgKzM1MzcsOSBAQCBzdHJ1Y3QgZHdfaGRtaSAqZHdfaGRtaV9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+ICAJCXBkZXZpbmZvLmRtYV9tYXNrID0g
MDsKPiAgCj4gIAkJaGRtaS0+Y2VjID0gcGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVyX2Z1bGwoJnBk
ZXZpbmZvKTsKPiArCj4gKwkJaGRtaS0+YnJpZGdlLm9wcyB8PSBEUk1fQlJJREdFX09QX0hETUlf
Q0VDX05PVElGSUVSOwo+ICsJCWhkbWktPmJyaWRnZS5oZG1pX2NlY19kZXYgPSBoZG1pLT5kZXY7
CgpJZiBwbGF0Zm9ybV9kZXZpY2VfcmVnaXN0ZXJfZnVsbCgpIGZhaWxzIGFuZCByZXR1cm5zIGFu
IGVycm9yIHBvaW50ZXIsCnNob3VsZCB3ZSBzdGlsbCBhZHZlcnRpc2UgQ0VDIG5vdGlmaWVyIHN1
cHBvcnQ/CgpJdCBsb29rcyBsaWtlIERSTV9CUklER0VfT1BfSERNSV9DRUNfTk9USUZJRVIgYW5k
IGhkbWlfY2VjX2RldiBhcmUgc2V0CnVuY29uZGl0aW9uYWxseSBoZXJlLiBJZiB0aGUgQ0VDIGRl
dmljZSByZWdpc3RyYXRpb24gZmFpbHMsIGNvdWxkIHRoaXMKY2F1c2UgdGhlIERSTSBicmlkZ2Ug
Y29ubmVjdG9yIGluaXRpYWxpemF0aW9uIHRvIHVubmVjZXNzYXJpbHkgYWxsb2NhdGUKYW5kIHJl
Z2lzdGVyIGEgQ0VDIG5vdGlmaWVyIGZvciBhIGhhcmR3YXJlIGFkYXB0ZXIgdGhhdCBkaWQgbm90
IHByb2JlPwoKPiAgCX0KPiAgCj4gIAlkcm1fYnJpZGdlX2FkZCgmaGRtaS0+YnJpZGdlKTsKCi0t
IApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAy
NjA1MTYxODM4MzguMjAyNDk5MS0xLWpvbmFzQGt3aWJvby5zZT9wYXJ0PTE1CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
