Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E776FC43458
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 14:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoBGimBQH07lTKQNnxPuUYg9E8njczU/oChfNpsCf+Q=; b=E0RVPzstj6EZMd
	ThgO+fx306WKh8qV1UxMqxoHpGqkBrTbSsDvsoXbzE5HYngnfZhGoLSjgeNgigp22+AE8WUBHaYqg
	ziZFnIRnQ5Pqyvu4Px9lCBw6VSuvsOG4s6UrqhJPhk/8sN4YgsE8prDrIfpkUiKAnyYHwmyLISkmk
	LlzXeHSkTve9+Om3BsTzVX5NuuEQzBMAJKpEEG/B20u1IAd0sQfDnIKhinbn8AOlqad+tlc3Cr7Ol
	M5I5kmYgbgS6y0cWDYVcm1oflaX49m1Z/wE4SzL5bfDakw5ev/tSs3+8Bc4DPb7rXTu7KS0E+qQrw
	aHm3F4mxiS9+EhoieUbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6WS-0000000F7Qc-2GIp;
	Tue, 07 Jul 2026 14:11:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6WQ-0000000F7Pk-3sCo
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 14:11:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6616443617;
	Tue,  7 Jul 2026 14:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90881F00A3D;
	Tue,  7 Jul 2026 14:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783433498;
	bh=QvOkRjNNXyNBULDO3YhwROa7FJoE/Fu63a+r6ZP3gGM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=enDqMtlqswZM7ZTmdcuIHCv25Z2Hi52Wa3SWLflYMCgX9F39TJL9hMFOw3PgxYos5
	 9wBYzqcAVkiIUIODHls/QGbZAcj8h9+wYV1uGETMT1ak2iwzx3qGXlLjZKOVm1fBL+
	 FF8AxzWzzrcpDvHOyVqWUVTELGqYtxJPt7YoUbwG4LKOI89uc0nc4CleJ7Cq+vprFQ
	 2NCBwp6PoKbSY6A6pDnxpgZe5mGOEOiMNdMdwS1FTk6Jsu9Q/OVAfy4z0PVBh8+07z
	 tMHdg51Vrvm3nveYs6yDl6RERMLaI6GYPwzklR/47F9o1G7l7uvcvoE2kaQJpHpZt1
	 GAVlpAQ8aHPPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 3/7] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, imx@lists.linux.dev, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-3-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
 <20260706-qcom-sa8255p-emac-v12-3-e3ab1ecf2901@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 14:11:37 +0000
Message-Id: <20260707141137.B90881F00A3D@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIGRldmljZSB0
cmVlIGJpbmRpbmdzIGZvciBOdXZvdG9uIE1BMzVEMSBhbmQgU3BhY2VtaXQgSzMgRFdNQUMgd2Vy
ZSBub3QgdXBkYXRlZCB0byByZXN0cmljdCBgcG93ZXItZG9tYWluc2AgdG8gYG1heEl0ZW1zOiAx
YCwgY29udHJhZGljdGluZyB0aGUgY29tbWl0IG1lc3NhZ2UgY2xhaW0gYW5kIGluYWR2ZXJ0ZW50
bHkgcmVsYXhpbmcgdGhlaXIgY29uc3RyYWludHMuCi0tCgpjb21taXQgMTcyYTczNTc1ODllMmMx
MTBhY2U3ZWRmZGVjNTBkZWU0NzdjNGE4MwpBdXRob3I6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAa2VybmVsLm9yZz4KCmR0LWJpbmRpbmdzOiBuZXQ6IHFjb206IGRvY3VtZW50IHRoZSBldGhx
b3MgZGV2aWNlIGZvciBTQ01JLWJhc2VkIHN5c3RlbXMKClRoaXMgcGF0Y2ggZGVzY3JpYmVzIHRo
ZSBmaXJtd2FyZS1tYW5hZ2VkIHZhcmlhbnQgb2YgdGhlIFFDb20gRGVzaWduV2FyZSBNQUMuCkl0
IGludHJvZHVjZXMgdGhlIHFjb20sc2E4MjU1cC1ldGhxb3MgYmluZGluZyBhbmQgaW5jcmVhc2Vz
IHRoZSBwb3dlci1kb21haW5zCm1heGltdW0gdG8gMiBpbiB0aGUgdG9wLWxldmVsIHNucHMsZHdt
YWMueWFtbCBzY2hlbWEsIHdoaWxlIHVwZGF0aW5nIGV4aXN0aW5nCnJlZmVyZW5jaW5nIGJpbmRp
bmdzIHRvIGxpbWl0IHRoZWlyIHBvd2VyLWRvbWFpbnMgbWF4SXRlbXMgYmFjayB0byAxLgoKPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3
bWFjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdt
YWMueWFtbAo+IGluZGV4IDI0NDkzMTFjNmQyOGUuLmQzYWZmMWRmMzA3MGQgMTAwNjQ0Cj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwK
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMu
eWFtbApbIC4uLiBdCj4gQEAgLTE4NSw3ICsxODYsOCBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAg
ICAgLSBjb25zdDogYWhiCj4gIAo+ICAgIHBvd2VyLWRvbWFpbnM6Cj4gLSAgICBtYXhJdGVtczog
MQo+ICsgICAgbWluSXRlbXM6IDEKPiArICAgIG1heEl0ZW1zOiAyCgpbU2V2ZXJpdHk6IE1lZGl1
bV0KVGhlIGNvbW1pdCBtZXNzYWdlIHN0YXRlcyB0aGF0IGV4aXN0aW5nIGJpbmRpbmdzIHJlZmVy
ZW5jaW5nIHRoZSB0b3AtbGV2ZWwKc25wcyxkd21hYy55YW1sIHdlcmUgdXBkYXRlZCB0byBsaW1p
dCB0aGVpciBtYXhJdGVtcyBmb3IgcG93ZXItZG9tYWlucyB0byAxLgpXZXJlIE51dm90b24gTUEz
NUQxIChudXZvdG9uLG1hMzVkMS1kd21hYy55YW1sKSBhbmQgU3BhY2VtaXQgSzMKKHNwYWNlbWl0
LGszLWR3bWFjLnlhbWwpIG1pc3NlZCBkdXJpbmcgdGhpcyByZWZhY3RvcmluZz8KClNpbmNlIGJv
dGggb2YgdGhvc2Ugc2NoZW1hcyBpbmhlcml0IGZyb20gc25wcyxkd21hYy55YW1sLCB0aGV5IHdp
bGwgbm93CmluYWR2ZXJ0ZW50bHkgaW5oZXJpdCB0aGUgcmVsYXhlZCBtYXhJdGVtczogMiBjb25z
dHJhaW50LCBhbGxvd2luZyBpbnZhbGlkCmNvbmZpZ3VyYXRpb25zIHRvIHBhc3MgdmFsaWRhdGlv
bi4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjA3MDYtcWNvbS1zYTgyNTVwLWVtYWMtdjEyLTAtZTNhYjFlY2YyOTAxQG9zcy5xdWFs
Y29tbS5jb20/cGFydD0zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
