Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA219C44503
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 14:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZSmRNKyB70ewwDsnsLHUoOrTMmeq2rFo5Rb13DSlHE=; b=zpQSznotnFuI7o
	BsGDPluTcLNQR08FL9QBQdcDjCWLSy3T7E9sf3eUrffgHohxzDpk8fl7NknP+OuhqoMOvJeypp7oT
	hMKnbW5GZ9O+Rv44cTgonptDX2lWVJ7ha0HvOygJ81dvoQQuCIkJlSxEyRBUziyELr7bm1djzS643
	+ImufHFebCi+STkuMzKc3XEb6X5I/oY0+LFUs46QH3yRMAkFwLPoHV6YLskrRkGF3zj6JK/ii15F7
	ajgnj/pSBAqIrjr2GB+QEyhoPfQeH3NppOZhTqsK64gnYImhUomVj7dJrtwZdXZ1PRTixTADG/LLQ
	0Odsxp53Xk+183WHiCiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6WS-0000000F7QY-1Tsl;
	Tue, 07 Jul 2026 14:11:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6WQ-0000000F7Pi-1ynI
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 14:11:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BC94600BB;
	Tue,  7 Jul 2026 14:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE031F00A3A;
	Tue,  7 Jul 2026 14:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783433497;
	bh=bPmEwesHC2AS1HkjPhZDQwSfdjHZQo0VGS0dYxaRFDM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a4LH6Y79I6wzscYgLyuUhZcE9ZYVaPMk8Wt1y6pXLaPtI+Ki+IdqYnfzUdaul+QYX
	 K08eRdaSblR8oSa8DMpy5s6c+yM7jdDXVQO863trhbuffRq892mqHh1jwmvCJC2I5H
	 e4B2dNEZ9FWnuwSmxPrHf2gopcFpcGRNAPaw4jtSBNO+AuCyzyymzOOZYEe7ZauyEm
	 tWdIydxOTmsRn4h3smJGrEx0WdzY6CfMjIP/+H6NZsDx9RXKuqco7cK43ONbbHFYRu
	 /LGRqy9O7wb/AOAYImtooFC+P/B06itTPqyJ3G6VVSaSuuwc8CvrLG+J3po0ULyYMD
	 4RBp19Mao+NSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 2/7] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-2-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
 <20260706-qcom-sa8255p-emac-v12-2-e3ab1ecf2901@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 14:11:36 +0000
Message-Id: <20260707141136.AAE031F00A3A@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFRoZSBgc2V0X21vZGVg
IGNhbGxiYWNrIGZhaWxzIHRvIGR5bmFtaWNhbGx5IGFwcGx5IHRoZSBuZXcgcGVyZm9ybWFuY2Ug
c3RhdGUgdG8gdGhlIFBNIGRvbWFpbiB3aGVuIHRoZSBQSFkgaXMgYWxyZWFkeSBhY3RpdmUuCi0g
W0hpZ2hdIEluY29ycmVjdCBvcmRlcmluZyBvZiBgZGV2X3BtX2dlbnBkX3NldF9wZXJmb3JtYW5j
ZV9zdGF0ZSgpYCBhcm91bmQgcnVudGltZSBQTSBmdW5jdGlvbnMgY2F1c2VzIGhhcmR3YXJlIHVu
ZGVyLXZvbHRhZ2UuCi0tCgpjb21taXQgZDYwYzA3Njc0ZmRmMzYxZDQxYTU1ZTlkMDlmYmRmMDQw
YmFlNTc5NwpBdXRob3I6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lA
b3NzLnF1YWxjb21tLmNvbT4KCnBoeTogcWNvbTogYWRkIHRoZSBTR01JSSBTZXJEZXMgUEhZIGRy
aXZlciBmb3IgU0NNSSBzeXN0ZW1zCgpUaGlzIGNvbW1pdCBpbXBsZW1lbnRzIHN1cHBvcnQgZm9y
IHRoZSBmaXJtd2FyZS1tYW5hZ2VkIFNHTUlJL1NlckRlcyBQSFkKcHJlc2VudCBvbiBRdWFsY29t
bSBwbGF0Zm9ybXMuIEl0IGludHJvZHVjZXMgYSBzZXBhcmF0ZSBkcml2ZXIgZm9yIHRoZSBTQ01J
CnN5c3RlbSB2YXJpYW50IGFzIGl0IHNoYXJlcyBhbG1vc3Qgbm8gY29kZSB3aXRoIHRoZSBITE9T
LW1hbmFnZWQgdmVyc2lvbi4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5L3F1YWxjb21tL3Bo
eS1xY29tLXNnbWlpLWV0aC1zY21pLmMgYi9kcml2ZXJzL3BoeS9xdWFsY29tbS9waHktcWNvbS1z
Z21paS1ldGgtc2NtaS5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAw
MDAwLi44ZWU2MjE4OTU1NmZlCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvcGh5L3F1
YWxjb21tL3BoeS1xY29tLXNnbWlpLWV0aC1zY21pLmMKWyAuLi4gXQo+ICtzdGF0aWMgaW50IHFj
b21fZHdtYWNfc2dtaWlfcGh5X3NjbWlfcG93ZXJfb24oc3RydWN0IHBoeSAqcGh5KQo+ICt7Cj4g
KwlzdHJ1Y3QgcWNvbV9kd21hY19zZ21paV9waHlfc2NtaSAqcHJpdiA9IHBoeV9nZXRfZHJ2ZGF0
YShwaHkpOwo+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gcGh5LT5kZXYucGFyZW50Owo+ICsJaW50
IHJldDsKPiArCj4gKwlyZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KGRldik7Cj4gKwlp
ZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gKwo+ICsJcmV0ID0gZGV2X3BtX2dlbnBkX3NldF9w
ZXJmb3JtYW5jZV9zdGF0ZShkZXYsIHByaXYtPnBlcmZfc3RhdGUpOwoKW1NldmVyaXR5OiBIaWdo
XQpTaG91bGQgZGV2X3BtX2dlbnBkX3NldF9wZXJmb3JtYW5jZV9zdGF0ZSgpIGJlIGNhbGxlZCBi
ZWZvcmUKcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpPwoKSWYgcG1fcnVudGltZV9yZXN1bWVf
YW5kX2dldCgpIHJ1bnMgZmlyc3QsIGl0IGFwcGVhcnMgdGhlIGdlbnBkIHJ1bnRpbWUKcmVzdW1l
IGhhbmRsZXIgd2lsbCBwb3dlciBvbiB0aGUgZG9tYWluIGF0IGl0cyBwcmV2aW91cyBwZXJmb3Jt
YW5jZSBzdGF0ZSAoMCkKYmVmb3JlIHRoZSBkcml2ZXIgcmFpc2VzIGl0LiBDb3VsZCB0aGlzIHN0
YXJ2ZSB0aGUgaGFyZHdhcmUgZHVyaW5nIHBvd2VyLW9uPwoKPiArCWlmIChyZXQpIHsKPiArCQlw
bV9ydW50aW1lX3B1dChkZXYpOwo+ICsJCXJldHVybiByZXQ7Cj4gKwl9Cj4gKwo+ICsJdXNsZWVw
X3JhbmdlKDUwMDAsIDEwMDAwKTsKPiArCj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGlj
IGludCBxY29tX2R3bWFjX3NnbWlpX3BoeV9zY21pX3Bvd2VyX29mZihzdHJ1Y3QgcGh5ICpwaHkp
Cj4gK3sKPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IHBoeS0+ZGV2LnBhcmVudDsKPiArCj4gKwlk
ZXZfcG1fZ2VucGRfc2V0X3BlcmZvcm1hbmNlX3N0YXRlKGRldiwgMCk7Cj4gKwlwbV9ydW50aW1l
X3B1dChkZXYpOwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIGRyb3BwaW5nIHRoZSBwZXJmb3JtYW5j
ZSBzdGF0ZSBiZWZvcmUgcHV0dGluZyB0aGUgZGV2aWNlIGNhdXNlIGEgdm9sdGFnZQpkcm9wIHdo
aWxlIHRoZSBoYXJkd2FyZSBpcyBzdGlsbCBhY3RpdmU/CgpTaW5jZSBwbV9ydW50aW1lX3B1dCgp
IGlzIGFzeW5jaHJvbm91cywgdGhlIGhhcmR3YXJlIG1pZ2h0IHN0aWxsIGJlIGFjdGl2ZWx5CnBv
d2VyZWQgd2hlbiBkZXZfcG1fZ2VucGRfc2V0X3BlcmZvcm1hbmNlX3N0YXRlKGRldiwgMCkgZHJv
cHMgdGhlIHN0YXRlLiBDb3VsZAp0aGlzIG9yZGVyaW5nIHZpb2xhdGUgaGFyZHdhcmUgdm9sdGFn
ZSByZXF1aXJlbWVudHM/Cgo+ICsKPiArCXJldHVybiAwOwo+ICt9ClsgLi4uIF0KPiArc3RhdGlj
IGludCBxY29tX2R3bWFjX3NnbWlpX3BoeV9zY21pX3NldF9tb2RlKHN0cnVjdCBwaHkgKnBoeSwg
ZW51bSBwaHlfbW9kZSBtb2RlLAo+ICsJCQkJCSAgICAgIGludCBzdWJtb2RlKQo+ICt7Cj4gKwlz
dHJ1Y3QgcWNvbV9kd21hY19zZ21paV9waHlfc2NtaSAqcHJpdiA9IHBoeV9nZXRfZHJ2ZGF0YShw
aHkpOwo+ICsJaW50IHJldDsKPiArCj4gKwlyZXQgPSBxY29tX2R3bWFjX3NnbWlpX3BoeV9zY21p
X3ZhbGlkYXRlKHBoeSwgbW9kZSwgc3VibW9kZSwgTlVMTCk7Cj4gKwlpZiAocmV0KQo+ICsJCXJl
dHVybiByZXQ7Cj4gKwo+ICsJcHJpdi0+cGVyZl9zdGF0ZSA9IChzdWJtb2RlID09IFBIWV9JTlRF
UkZBQ0VfTU9ERV8yNTAwQkFTRVgpID8KPiArCQkJICAgU1BFRURfMjUwMCA6IFNQRUVEXzEwMDA7
Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KCltTZXZlcml0eTogSGlnaF0KRG9lcyB0aGlzIGNvZGUg
bmVlZCB0byBhcHBseSB0aGUgbmV3IHBlcmZvcm1hbmNlIHN0YXRlIHRvIHRoZSBhY3RpdmUgUE0g
ZG9tYWluCmlmIHRoZSBQSFkgaXMgYWxyZWFkeSBwb3dlcmVkIG9uPwoKV2hlbiB0aGUgTUFDIGRy
aXZlciBkeW5hbWljYWxseSBjaGFuZ2VzIHRoZSBsaW5rIHNwZWVkIHdoaWxlIHRoZSBpbnRlcmZh
Y2UgaXMKdXAsIHVwZGF0aW5nIG9ubHkgcHJpdi0+cGVyZl9zdGF0ZSB3aXRob3V0IGNhbGxpbmcK
ZGV2X3BtX2dlbnBkX3NldF9wZXJmb3JtYW5jZV9zdGF0ZSgpIG1pZ2h0IGxlYXZlIHRoZSBoYXJk
d2FyZSBvcGVyYXRpbmcgYXQgYW4KaW5jb3JyZWN0IHZvbHRhZ2Ugc3RhdGUuCgotLSAKU2FzaGlr
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzA2LXFj
b20tc2E4MjU1cC1lbWFjLXYxMi0wLWUzYWIxZWNmMjkwMUBvc3MucXVhbGNvbW0uY29tP3BhcnQ9
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
