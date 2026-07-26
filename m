Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97684C531C9
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jul 2026 20:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPTJppY+qGQNhDmaDsLrBC5KKYNG2Lvsv6wuMcXphOM=; b=XKWYP3q9RSqXJD
	TvICfM1oEVHk44aBJoB2zbgvTtKKpNfharpOsT+p5lAU/1AeBqSvd3D92GJvm2KKBjQGAAnGuoxd/
	AKFKcOlEGjvkZkjHwJTdFwoILy3yTWnNJnfEcVENkAsEAIgjRDV7O9Yw4xN/D9laYuGob0xNNw155
	aU8rpSHY5+osBP4ZqfzIXbmfCcjCOanhZo7Wx7BPFWyrfMmfVZGcbB+jHVfa5TpwoX0IGXHdeo2Tc
	3v0cPpyl5DtNTD/mRfey4htBtpKhcYraMjciHuVRAGFYxhHF+AnW5iVs1OsxGjKWlo6rECIXtVLaB
	6DRmaxrtVehIowPc3N6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5Qu-00000001anO-1XZU;
	Sun, 26 Jul 2026 20:26:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5Qt-00000001anE-1WUk
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Jul 2026 20:26:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6C3D60054;
	Sun, 26 Jul 2026 20:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6DF1F000E9;
	Sun, 26 Jul 2026 20:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785097605;
	bh=B1YxlU8BBhOK6tQiTrcIR71UmCeieT44RHJV42wXvEM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Re5QTsHscXaEo3zTxJRozbHVTBo5BG4n7qZ+HVNea0byAUc5JsNMPbBZlQG4LiN6Q
	 sD5s6qY2rM5fjoPgp/H0qjIiFD+lRtC2ane08vrn2tAa74d83XrjqhVdpg++P2WOke
	 0HWqC0KKJXIcwnMTUYxpCrnHo6dLdMiFBHSoDqGYL756BLYemQcy4eBgB4SYhR06FJ
	 cWlJ/dy4F67RYWniufiHOO6vg45Ey5xIveDu1PJ1UOeNXwIcm2jvbIbOCmSbrhhW9n
	 NHd3zRxqkZqRMnAPLjzKa+Y7OSbgN1iYryAbDavKfFRqs+ddyHR/ceeUDmNch7OTsD
	 4W40QiSfEgtxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: amlogic: add support for Orbbec Zora
 P1
To: "Alberto Robazza" <robazzalberto@gmail.com>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260726201647.264108-4-robazzalberto@gmail.com>
References: <20260726201647.264108-1-robazzalberto@gmail.com>
 <20260726201647.264108-4-robazzalberto@gmail.com>
Date: Sun, 26 Jul 2026 20:26:44 +0000
Message-Id: <20260726202645.3B6DF1F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFBpbiBtdWx0aXBsZXhp
bmcgY29uZmxpY3Qgb24gR1BJT1hfMTYgYmV0d2VlbiB0aGUgV2ktRmkgU0RJTyBwb3dlciBzZXF1
ZW5jZSByZXNldCBhbmQgdGhlIDMyLjc2OGtIeiBQV00gY2xvY2suCi0tCgotLS0gUGF0Y2ggWzNd
OiBbUEFUQ0ggdjIgMy8zXSBhcm02NDogZHRzOiBhbWxvZ2ljOiBhZGQgc3VwcG9ydCBmb3IgT3Ji
YmVjIFpvcmEgUDEgLS0tCmNvbW1pdCA0YzI1YzIyYjU5ZWY1NGEzYjA4ZDAyYWFiODQ4ZDZmNmFh
NmFmMWVmCkF1dGhvcjogQWxiZXJ0byBSb2JhenphIDxyb2JhenphbGJlcnRvQGdtYWlsLmNvbT4K
CmFybTY0OiBkdHM6IGFtbG9naWM6IGFkZCBzdXBwb3J0IGZvciBPcmJiZWMgWm9yYSBQMQoKVGhp
cyBjb21taXQgYWRkcyBkZXZpY2UgdHJlZSBzdXBwb3J0IGZvciB0aGUgT3JiYmVjIFpvcmEgUDEg
Ym9hcmQsIGFuIEEzMTFECmJhc2VkIGRldmljZS4gSXQgYnVpbGRzIHVwb24gdGhlIE9EUk9JRC1O
MiBkZXZpY2UgdHJlZSwgYWRkaW5nIHNwZWNpZmljIEdQSU8Kd2lyaW5nIGZvciBXaS1GaSBhbmQg
Qmx1ZXRvb3RoIG92ZXIgU0RJTyBhbmQgVUFSVF9BLiBJdCBhbHNvIGluY2x1ZGVzIHRoZQpib2Fy
ZCdzIGNvbXBhdGlibGUgc3RyaW5nIGFuZCBMRUQgY29uZmlndXJhdGlvbnMuCgo+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi16b3JhLXAxLmR0cyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLXpvcmEtcDEuZHRzCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItem9yYS1wMS5kdHMKWyAuLi4gXQo+ICsJc2Rpb19wd3Jz
ZXE6IHNkaW8tcHdyc2VxIHsKPiArCQljb21wYXRpYmxlID0gIm1tYy1wd3JzZXEtc2ltcGxlIjsK
PiArCQlyZXNldC1ncGlvcyA9IDwmZ3BpbyBHUElPWF8xNiBHUElPX0FDVElWRV9MT1c+Owo+ICsJ
CWNsb2NrcyA9IDwmd2lmaTMyaz47Cj4gKwkJY2xvY2stbmFtZXMgPSAiZXh0X2Nsb2NrIjsKPiAr
CX07Cj4gKwo+ICsJd2lmaTMyazogd2lmaTMyayB7Cj4gKwkJY29tcGF0aWJsZSA9ICJwd20tY2xv
Y2siOwo+ICsJCSNjbG9jay1jZWxscyA9IDwwPjsKPiArCQljbG9jay1mcmVxdWVuY3kgPSA8MzI3
Njg+Owo+ICsJCXB3bXMgPSA8JnB3bV9lZiAwIDMwNTE4IDA+Owo+ICsJfTsKWyAuLi4gXQo+ICsm
cHdtX2VmIHsKPiArCXN0YXR1cyA9ICJva2F5IjsKPiArCXBpbmN0cmwtMCA9IDwmcHdtX2VfcGlu
cz47CgpbU2V2ZXJpdHk6IEhpZ2hdCldpbGwgdGhpcyBjcmVhdGUgYSBwaW4gbXVsdGlwbGV4aW5n
IGNvbmZsaWN0IG9uIEdQSU9YXzE2PwoKVGhlIHNkaW9fcHdyc2VxIG5vZGUgY2xhaW1zIEdQSU9Y
XzE2IGFzIGEgc3RhbmRhcmQgR1BJTyBmb3IgdGhlIHJlc2V0LWdwaW9zCmxpbmUuIEhvd2V2ZXIs
IHRoZSBwd21fZWYgbm9kZSByZXF1ZXN0cyB0aGUgcHdtX2VfcGlucyBwaW5jdHJsIGdyb3VwLiBP
biB0aGUKQW1sb2dpYyBHMTJCIHBsYXRmb3JtLCBwd21fZV9waW5zIG1hcHMgZXhhY3RseSB0byBH
UElPWF8xNi4KClNpbmNlIGEgc2luZ2xlIHBoeXNpY2FsIHBpbiBjYW5ub3QgY29uY3VycmVudGx5
IG91dHB1dCBhIDMya0h6IFBXTSBjbG9jayBzaWduYWwKYW5kIGZ1bmN0aW9uIGFzIGEgc3RhdGlj
IEdQSU8gcmVzZXQgc2lnbmFsIGZvciB0aGUgV2ktRmkgbW9kdWxlLCB3aWxsIHRoZQpwaW5jdHJs
IHN1YnN5c3RlbSBmYWlsIG9uZSBvZiB0aGUgcmVxdWVzdHMgYW5kIHByZXZlbnQgdGhlIFdpLUZp
IG1vZHVsZSBmcm9tCmluaXRpYWxpemluZz8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRw
czovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MjYyMDE2NDcuMjY0MTA4LTEtcm9iYXp6
YWxiZXJ0b0BnbWFpbC5jb20/cGFydD0zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
