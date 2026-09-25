Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0030C9830D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2026 05:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQCgWxfQUA7jxoGv4wzmGuDlMRfzoYbyRYu/W7hZF+U=; b=aUMJBaYtzpavt9
	j2PqQ9t3G5is77Sc8jpA195ZFZ1QVJFs9tdIfhU2OKE07O81PKRS+z8dfEn5wfRx/DyCXaxfUf73K
	w6Ro2HMkotbK7+YzfINQ9TgMT7VDe27fjzB1Vlr3771NxPZpiwDbYNcFsHQc3dhC2TJh15fuR0tq5
	BEeXRgKyXfnWwZT2day75+OfbJ8s3/uYjnHn3QfOs8emToXAam7PE1c7pGt4s6Jn4L5ouIlH60QbQ
	W40Vv7t5rbcMA6YjbaxXQfW5XQCGNa16oBu0R5zS4cau2t7KCKNp8VCcVSFRfzG/Xy8mY1+HmZqcG
	hFMuY7pKTJBM3Y+wtyoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9yqO-0000000Ciy5-0AsS;
	Fri, 25 Sep 2026 05:51:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9yqM-0000000Cixu-47gh
	for linux-amlogic@lists.infradead.org;
	Fri, 25 Sep 2026 05:51:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B34C96022E;
	Fri, 25 Sep 2026 05:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD501F000FF;
	Fri, 25 Sep 2026 05:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790315493;
	bh=o6f1R33iMlCjn/EcSH+CvOdvqypALTh44XpAzIQfSEA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oA8bdEu0TYHiAZXmseaC4WWnEAgu+VXeOXsAABkPPOH1Olle/sJwCk8k5YCxvkR53
	 TLANJ2tuXsSwsB7K42dykEe0WJnrs/yG+k8BNejRFOL12dLoT/0qWyC+yX0S1Dwzbg
	 uSGL9pcsjc+G9uCos6I3dSz52BN7Xqk+HyspzzrsKtdOdO3diDXYQzlHXPaZiyByIP
	 ABsVrYKGY6EiFqNXKObHKwT+UvNkVoVmClwM7ZYOhkZd1PPwGx+GNvaS5zg6Kk6RXe
	 5+SjQvxaEMlY29tb2oFitj/hSQVLZscEtYHnBoo4Z2v9izjWdSG1hUX65cfHsKP/yU
	 5WcC4JZDVSCQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: amlogic: add T7 peripheral nodes
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260924-t7-node-new-v2-3-319d3c19b4b2@amlogic.com>
References: <20260924-t7-node-new-v2-0-319d3c19b4b2@amlogic.com>
 <20260924-t7-node-new-v2-3-319d3c19b4b2@amlogic.com>
Date: Fri, 25 Sep 2026 05:51:32 +0000
Message-Id: <20260925055133.0FD501F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHRzOiB1c2VsZXNzIHJl
Z3VsYXRvciBwcm9wZXJ0aWVzIHdpdGhvdXQgZ3BpbwotLQoKY29tbWl0IDYxYTQ0ZDEzN2U5MzQ3
NGUwNGE3MGQwZWE0ODFiNTcwYjhlNjEzMWMKQXV0aG9yOiBYaWFud2VpIFpoYW8gPHhpYW53ZWku
emhhb0BhbWxvZ2ljLmNvbT4KCmFybTY0OiBkdHM6IGFtbG9naWM6IGFkZCBUNyBwZXJpcGhlcmFs
IG5vZGVzCgpUaGlzIHBhdGNoIGFkZHMgZGV2aWNlIHRyZWUgZGVzY3JpcHRpb25zIGZvciB0aGUg
cGVyaXBoZXJhbHMgb24gdGhlIEFtbG9naWMKVDcgU29DIGFuZCB0aGUgVDcgQTMxMUQyIEFONDAw
IGJvYXJkLiBJdCBpbnRyb2R1Y2VzIHN1cHBvcnQgZm9yIHRoZSBUNwpFdGhlcm5ldCBjb250cm9s
bGVyLCBTUEkgY29udHJvbGxlcnMsIEkyQyBjb250cm9sbGVycywgVUFSVHMsIHBpbmN0cmwgZ3Jv
dXBzLApyZWd1bGF0b3JzLCBhbmQgcmVzZXJ2ZWQgbWVtb3J5LgoKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWFuNDAwLmR0cyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1hbjQwMC5kdHMKPiBp
bmRleCBjYTc1MzZmNzcyZmYxLi41MGRmOTYxZmJhNzViIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1hbjQwMC5kdHMKPiArKysgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDItYW40MDAuZHRzCj4g
QEAgLTI0LDEyICsyNCwxNTkgQEAgbWVtb3J5QDAgewoKWyAuLi4gXQoKPiArCXZkZHFscF8wdjY6
IHJlZ3VsYXRvci12ZGRxbHAtMHY2IHsKPiArCQl2aW4tc3VwcGx5ID0gPCZkY19pbj47Cj4gKwkJ
Y29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwo+ICsJCXJlZ3VsYXRvci1uYW1lID0gIlZE
RFFMUF8wVjYiOwo+ICsJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDYwMDAwMD47Cj4gKwkJ
cmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8NjAwMDAwPjsKPiArCQlzdGFydHVwLWRlbGF5LXVz
ID0gPDcwMDAwPjsKPiArCQllbmFibGUtYWN0aXZlLWhpZ2g7Cj4gKwkJcmVndWxhdG9yLWJvb3Qt
b247Cj4gKwkJcmVndWxhdG9yLWFsd2F5cy1vbjsKPiArCX07CgpbU2V2ZXJpdHk6IExvd10KSXMg
aXQgaW50ZW50aW9uYWwgdG8gaW5jbHVkZSBlbmFibGUtYWN0aXZlLWhpZ2ggYW5kIHN0YXJ0dXAt
ZGVsYXktdXMKcHJvcGVydGllcyBmb3IgdmRkcWxwXzB2NiB3aXRob3V0IGRlZmluaW5nIGEgY29u
dHJvbCBncGlvPwoKV2l0aG91dCBhIGdwaW8gZGVmaW5lZCwgdGhlIHJlZ3VsYXRvciBjb3JlIGhh
cyBubyBtZWNoYW5pc20gdG8gdG9nZ2xlIHRoZQpyZWd1bGF0b3IsIG1lYW5pbmcgZW5hYmxlLWFj
dGl2ZS1oaWdoIGhhcyBubyBlZmZlY3QuIFRoaXMgYXBwZWFycyB0byBiZSBhCmRldmljZSB0cmVl
IHNjaGVtYSB2aW9sYXRpb24sIGFsdGhvdWdoIGl0IGRvZXMgbm90IGNhdXNlIGEgZmFpbHVyZSBz
aW5jZSB0aGUKcmVndWxhdG9yIGlzIG1hcmtlZCByZWd1bGF0b3ItYWx3YXlzLW9uLgoKPiArCj4g
Kwl2ZGRfZGRyOiByZWd1bGF0b3ItdmRkLWRkciB7Cj4gKwkJdmluLXN1cHBseSA9IDwmZGNfaW4+
Owo+ICsJCWNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKPiArCQlyZWd1bGF0b3ItbmFt
ZSA9ICJWRERfRERSIjsKPiArCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDw4MDAwMDA+Owo+
ICsJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDgwMDAwMD47Cj4gKwkJc3RhcnR1cC1kZWxh
eS11cyA9IDw3MDAwMD47Cj4gKwkJZW5hYmxlLWFjdGl2ZS1oaWdoOwo+ICsJCXJlZ3VsYXRvci1i
b290LW9uOwo+ICsJCXJlZ3VsYXRvci1hbHdheXMtb247Cj4gKwl9OwoKW1NldmVyaXR5OiBMb3dd
CkRvZXMgdmRkX2RkciBhbHNvIG5lZWQgYSBjb250cm9sIGdwaW8/CgpMaWtlIHZkZHFscF8wdjYg
YWJvdmUsIGl0IHNwZWNpZmllcyBlbmFibGUtYWN0aXZlLWhpZ2ggYW5kIHN0YXJ0dXAtZGVsYXkt
dXMKYnV0IGxhY2tzIGEgZ3BpbyBwcm9wZXJ0eS4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MjQtdDctbm9kZS1uZXctdjItMC0z
MTlkM2MxOWI0YjJAYW1sb2dpYy5jb20/cGFydD0zCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
