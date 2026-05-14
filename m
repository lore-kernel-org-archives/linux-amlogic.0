Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4652CD37AC
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 May 2026 04:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HfTowD0TxGS3UTROh+1oveJF7P6RycLzQ3MO+iOMu0k=; b=uBo79gj9bVwDWh
	gbMo27qNHNosGYBfM3ejPavy+V1prZQijrFXzlmmxXUH1EXJCVmT1MQqq/uuPDRSjZRHVrDm2WBo7
	etzwCprLXWr9bMTQlCnsReKAcZugM2TW6nwW3sBwdybydaLpCG1Xx5gzuI3pMvALoVcbRG7skMAI2
	noBg4G1k7LxnG+nEzmxvjRe6kcd51dsjSfbsJI/Kc4+TnRwnaBB46+V3vbigZmU98CovWoSbKqlVr
	kpsqTtEi/Pnt7vO5ZhYQ3yRxzPYqp0ZSqZ093EVfF7s3AlyuBKNvmd9+CqKfjaeEeDzE9DRdVMyM6
	pbZgETgiz/o/OwXl9pZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNNK9-00000004VPs-1qJQ;
	Thu, 14 May 2026 04:05:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNNK6-00000004VPO-19YT
	for linux-amlogic@lists.infradead.org;
	Thu, 14 May 2026 04:05:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C41A2442F7;
	Thu, 14 May 2026 04:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF16C2BCB7;
	Thu, 14 May 2026 04:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778731520;
	bh=Pq6GcboP2d7eR1Q9seH0i7Hx6J56CwxChCqzDR1v7vU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UXSpg9bMr9b+LxyiKmuGgbKrvcJHVbPAzSMznl37ggmjUvdq/zAnLPZM0mBk0T7kV
	 OOQyOAFkcBJAW3AbC0sN70tThgprpCe6jeZ4ZtSbxgoZ4vSzWKtwemKztHakQml8zG
	 WvBPYSko6CNec1WYKRu8q5yX2qFpjhU48sSgKXqpauiXOxgYXLdiv077poq9ymS0oG
	 qTJNCmTsD9DTC3xJj498I9+xWtQd5EdLCTXyR8hzLOgLgpgvwrDMAM0/xpV4htCLnW
	 nbok7PIzhgCNxLV53yMhtJImPCxGufDY3d96WKkoz7D4bl8N8dIWC0Hb9rmLxKoutp
	 42kuAB/ey/2TA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: amlogic: t7: khadas-vim4: add
 PWM-driven status LED
To: "Ronald Claveau via B4 Relay" <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260513-add-kvim4-sysled-v2-3-3ec9779e8875@aliel.fr>
References: <20260513-add-kvim4-sysled-v2-3-3ec9779e8875@aliel.fr>
Date: Thu, 14 May 2026 04:05:19 +0000
Message-Id: <20260514040520.5FF16C2BCB7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_210522_335682_63E5DAA5 
X-CRM114-Status: GOOD (  10.19  )
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIHN1Ym5vZGUgZm9y
IHRoZSBMRUQgdW5kZXIgYHB3bS1sZWRzYCBpcyBuYW1lZCBgc3RhdHVzYCwgd2hpY2ggdmlvbGF0
ZXMgdGhlIGBsZWRzLXB3bWAgZGV2aWNlIHRyZWUgYmluZGluZyBzY2hlbWEuCi0tCgpjb21taXQg
ZmE3OTEzYjE0MGFmM2U3ZDY0YzIyYjEwOWQxNzY1ZjUwNDE4MGFkMApBdXRob3I6IFJvbmFsZCBD
bGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgoKYXJtNjQ6IGR0czogYW1sb2dpYzog
dDc6IGtoYWRhcy12aW00OiBhZGQgUFdNLWRyaXZlbiBzdGF0dXMgTEVECgpUaGlzIGNvbW1pdCBl
bmFibGVzIHRoZSBwd21fYW9fY2QgY29udHJvbGxlciBhbmQgYWRkcyBhIHB3bS1sZWRzIG5vZGUg
d2l0aCBhCmhlYXJ0YmVhdCB0cmlnZ2VyIHRvIGV4cG9zZSB0aGUgc3RhdHVzIExFRCBvbiB0aGUg
VklNNCBib2FyZC4KCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9h
bWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNC5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Ft
bG9naWMvYW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzCj4gLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00LmR0cwo+ICsr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMt
dmltNC5kdHMKPiBAQCAtNTMsNiArNTMsMTYgQEAgZGNfaW46IHJlZ3VsYXRvci1kYy1pbiB7Cj4g
IAkJcmVndWxhdG9yLWFsd2F5cy1vbjsKPiAgCX07Cj4gIAo+ICsJcHdtLWxlZHMgewo+ICsJCWNv
bXBhdGlibGUgPSAicHdtLWxlZHMiOwo+ICsKPiArCQlzdGF0dXMgewoKRG9lcyB0aGlzIHN1Ym5v
ZGUgbmFtZSB0cmlnZ2VyIGEgZGV2aWNlIHRyZWUgc2NoZW1hIHZhbGlkYXRpb24gZXJyb3I/CgpU
aGUgbGVkcy1wd20gYmluZGluZyBzY2hlbWEgaW4KRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2xlZHMvbGVkcy1wd20ueWFtbCBzcGVjaWZpZXMKYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlIGFuZCBleHBlY3RzIGNoaWxkIG5vZGUgbmFtZXMgdG8gbWF0Y2ggdGhlCnJlZ3VsYXIg
ZXhwcmVzc2lvbiBebGVkKC1bMC05YS1mXSspPyQuCgpVc2luZyBzdGF0dXMgYXMgYSBub2RlIG5h
bWUgaXMgYWxzbyBjb25mdXNpbmcgc2luY2UgaXQgaXMgY29tbW9ubHkgdXNlZCBhcyBhCnN0YW5k
YXJkIGRldmljZSB0cmVlIHByb3BlcnR5LgoKU2hvdWxkIHRoaXMgYmUgcmVuYW1lZCB0byBzb21l
dGhpbmcgbGlrZSBsZWQtc3RhdHVzIG9yIGxlZC0wIHRvIGNvbXBseSB3aXRoCnRoZSBzY2hlbWE/
Cgo+ICsJCQlsaW51eCxkZWZhdWx0LXRyaWdnZXI9ImhlYXJ0YmVhdCI7Cj4gKwkJCW1heC1icmln
aHRuZXNzID0gPDI1NT47Cj4gKwkJCXB3bXMgPSA8JnB3bV9hb19jZCAwIDMwMDQwIDA+Owo+ICsJ
CX07Cj4gKwl9OwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYv
Iy9wYXRjaHNldC8yMDI2MDUxMy1hZGQta3ZpbTQtc3lzbGVkLXYyLTAtM2VjOTc3OWU4ODc1QGFs
aWVsLmZyP3BhcnQ9MwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
