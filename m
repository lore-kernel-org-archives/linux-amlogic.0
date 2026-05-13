Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D80CD4F21
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2026 23:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ob/ElD2fVAprEupY3SGEQAfaR02/102/2WvzZeuxFXE=; b=f7BwgFfnFopNJA
	4rArkgtcJ6goQoWclgiGOJAdrvpcGIw2gkJk8sArZJI7Njwb1JN5i54sOeGL8T4h8YEx1U2SvhFB7
	1m4xjp9P6lHBTYA1ulLcaqQMjX4sDvgiZaIfL8ZMHQj5ADSz8nRftRSRa5LhKAovb/mPKmrFLYnYT
	Gvg0QdrSM4XT98WsMpKc40dJkRVI8kFAb+DCoc/MIps2a1RG+f73n0ee/2pHtlj/slxcG+HYvCd/z
	lBLda4DTQA8JGA9z+VMKyHPDdXmCtk7PEggVvzjCWqs9wEq+OXoeSk6TAXKYkZLEJHB+rQ3NM9Z8E
	Hekngj4L7qDAD/NO7Dbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJM9-000000045f2-3b5p;
	Wed, 13 May 2026 23:51:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJM8-000000045eq-13oE
	for linux-amlogic@lists.infradead.org;
	Wed, 13 May 2026 23:51:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CD2660052;
	Wed, 13 May 2026 23:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9413BC19425;
	Wed, 13 May 2026 23:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778716269;
	bh=bJsu9fX/vKAyQ8XrHacGwoL80Qg1d2eIjE1CZlHvNnc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Y4Vw9Ok9NZVDO0pPpZ0PBmDbJIIv/U/kVNtvHRW0P1egZxlQ+/gvlxvBMSEvh4/GX
	 GQJ2evluDruvXjiA8Q5ryBcG0VyT1h05JFcZVBDr8xVydLNMJnMD8eNXmwSlHlKBFE
	 OVAPNOdjq3MrGVqMvVSZ2b0xK8htBCTWbzj8VJyyDZ5LtuDWjVw1fhEtlfl59jarmL
	 01Jhcx8zHUBPmiJr6IbBPvw02v3KTWmwBoV9xS0elyvbIlU5tikRSs1fHtUX1Hrsnh
	 VC6YOr/H8NDrFOg1jo3jFbgk/tcSfpkyQFCe4rDhfsRpc/6sKjgX8UI+7qUjOXVYkJ
	 vpem0i8CpV5Vg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: t7: khadas-vim4: add
 PWM-driven status LED
To: "Ronald Claveau via B4 Relay" <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260512-add-kvim4-sysled-v1-2-7178719a43e7@aliel.fr>
References: <20260512-add-kvim4-sysled-v1-2-7178719a43e7@aliel.fr>
Date: Wed, 13 May 2026 23:51:08 +0000
Message-Id: <20260513235109.9413BC19425@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIGNoaWxkIG5vZGUg
b2YgYHB3bS1sZWRzYCBpcyBuYW1lZCBgc3RhdHVzYCwgd2hpY2ggdmlvbGF0ZXMgdGhlIERUIHNj
aGVtYSBiaW5kaW5ncyBmb3IgUFdNIExFRHMuCi0tCgpjb21taXQgNGQxZjJiNzNjYjhhNTk4NDg4
ZGEyMWJhYWE4ZDg4MjgwNDg3ZTZmNgpBdXRob3I6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJu
ZWwtZGV2QGFsaWVsLmZyPgoKYXJtNjQ6IGR0czogYW1sb2dpYzogdDc6IGtoYWRhcy12aW00OiBh
ZGQgUFdNLWRyaXZlbiBzdGF0dXMgTEVECgpUaGlzIGNvbW1pdCBhZGRzIGEgbmV3IHB3bS1sZWRz
IG5vZGUgd2l0aCBhIGhlYXJ0YmVhdCB0cmlnZ2VyIHRvIHRoZSBWSU00CmJvYXJkIGRldmljZXRy
ZWUuIEl0IGFsc28gZW5hYmxlcyB0aGUgcHdtX2FvX2NkIGNvbnRyb2xsZXIgYW5kIHJlb3JkZXJz
IHRoZQp4dGFsLWNsayBub2RlLgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00LmR0cyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNC5kdHMKPiBpbmRleCA2
OWQ2MTE4YmE1N2U3Li5jNDE1MjVhMzRiNzIxIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNC5kdHMKPiArKysgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQu
ZHRzClsgLi4uIF0KPiBAQCAtNjAsNiArNTMsMTYgQEAgZGNfaW46IHJlZ3VsYXRvci1kYy1pbiB7
Cj4gIAkJcmVndWxhdG9yLWFsd2F5cy1vbjsKPiAgCX07Cj4gIAo+ICsJcHdtLWxlZHMgewo+ICsJ
CWNvbXBhdGlibGUgPSAicHdtLWxlZHMiOwo+ICsKPiArCQlzdGF0dXMgewoKV2lsbCB0aGlzIGNo
aWxkIG5vZGUgbmFtZSB0cmlnZ2VyIGEgZGV2aWNldHJlZSBzY2hlbWEgdmFsaWRhdGlvbiB3YXJu
aW5nPwoKVGhlIFBXTSBMRURzIGRldmljZSB0cmVlIGJpbmRpbmcgc2NoZW1hIHJlc3RyaWN0cyBj
aGlsZCBub2RlIG5hbWVzIHVzaW5nIGEKcGF0dGVybiBwcm9wZXJ0eS4gSXQgZXhwZWN0cyBjaGls
ZCBub2RlcyB0byBtYXRjaCB0aGUgcmVndWxhciBleHByZXNzaW9uCl5sZWQoLVswLTlhLWZdKyk/
JC4KClNpbmNlIHRoaXMgbm9kZSBpcyBuYW1lZCBzdGF0dXMsIHdpbGwgZHRic19jaGVjayB0cmVh
dCBpdCBhcyBhbiBpbnZhbGlkCmFkZGl0aW9uYWwgbm9kZT8KCj4gKwkJCWxpbnV4LGRlZmF1bHQt
dHJpZ2dlcj0iaGVhcnRiZWF0IjsKPiArCQkJbWF4LWJyaWdodG5lc3MgPSA8MjU1PjsKPiArCQkJ
cHdtcyA9IDwmcHdtX2FvX2NkIDAgMzAwNDAgMD47Cj4gKwkJfTsKPiArCX07CgotLSAKU2FzaGlr
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNTEyLWFk
ZC1rdmltNC1zeXNsZWQtdjEtMC03MTc4NzE5YTQzZTdAYWxpZWwuZnI/cGFydD0yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
