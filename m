Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739E5C44539
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Jul 2026 10:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MMaLsnw4iQwxTXPnFEIDUiCkXBbzhF+ezZz//YsgEE=; b=dBioi0MqPjUQY0
	XxHuC5hUeHaxF1A3qScJWj3sLrWU5GQR4uxrClRmFESSfkJVhrn1bPKh+DfEc7stVMwv0rYP1rDiI
	q+YbO7ihE1hevuVyXhYLMRGDAKXb3vB5vrIhcdMZC2zNswt6ICyzLBHgw7+iKa953/I+Dt/tF5GJM
	SsXDC1eg64kTelWXs5t1SELfvNXfKDXleoSiRwf5CCMYv+KBO7x08y0GmJz5LcUzQaPeTO9s7qwie
	n0hBCqqVN1uNeYxiy6plq8KllOlhuDXheyjrKEyU8+GxppKxDbC8qPrvWYi8G4ul8vIyFeXgP4AGl
	MYw6+HXocZE6ldR6byRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUHc-0000000BZe5-47Q0;
	Wed, 22 Jul 2026 10:34:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUHc-0000000BZdz-09AF
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Jul 2026 10:34:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B7DA60A71;
	Wed, 22 Jul 2026 10:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D751F000E9;
	Wed, 22 Jul 2026 10:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784716475;
	bh=X+bcxNs23aUxb1JqDWGSNbvVXQAMVoqWJuWlFfRIPt4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LlGmrnaYwVGBFwO3q60ndW88vzxms208IISlsyFv6nnvQxxTFGxd8cOrb7QBCUzec
	 2WlqYDRp5eb5FytVz9eRqKIiUVHGatWqGQZYOHyhWN/8vknu5cF38zpaayq80t1Q9l
	 SRT2PcDprNYqCUxFyXd03sywHte/cQVm+hBtUwhfhil5ybcF8Uf1L1zjW+eE18glbY
	 ozUyffHWpQr37pZ91qQurkhCN3uiIXFk2+ZkINCabvhM81I+YdGgpmb36CoZSYjd7r
	 HmUI82scbN2Hlu+fPaQET9K9pI6Rs9kCZXZoU76oJZA8hzMjHozAFr8NTdtfwRQtJL
	 KgpAMV07cur/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/13] media: meson-ir-tx: Ensure clock is disabled
 on unbind
To: "Sean Young" <sean@mess.org>
Cc: media-ci@linuxtv.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <ff9948f8d30ceb0f7d2c962097798dc9ed8a1a40.1784715737.git.sean@mess.org>
References: <cover.1784715737.git.sean@mess.org>
 <ff9948f8d30ceb0f7d2c962097798dc9ed8a1a40.1784715737.git.sean@mess.org>
Date: Wed, 22 Jul 2026 10:34:34 +0000
Message-Id: <20260722103434.B3D751F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBUaGlzIHByb2JsZW0gd2Fzbid0IGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0
IHRoZSBlcnJvciBjb2RlIGZyb20gYGRldm1fY2xrX2dldF9lbmFibGVkKClgIGlzIHVuY29uZGl0
aW9uYWxseSBtYXNrZWQgd2l0aCBgLUVOT0RFVmAsIHdoaWNoIGJyZWFrcyBwcm9iZSBkZWZlcnJh
bC4KLSBbSGlnaF0gVGhpcyBwcm9ibGVtIHdhc24ndCBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gs
IGJ1dCB0aGUgZXJyb3IgcmV0dXJuIGZyb20gYHBsYXRmb3JtX2dldF9pcnEoKWAgaXMgbWFza2Vk
IGJ5IHJldHVybmluZyBgLUVOT0RFVmAsIGJyZWFraW5nIHByb2JlIGRlZmVycmFsLgotLQoKLS0t
IFBhdGNoIFs3XTogW1BBVENIIHYzIDA3LzEzXSBtZWRpYTogbWVzb24taXItdHg6IEVuc3VyZSBj
bG9jayBpcyBkaXNhYmxlZCBvbiB1bmJpbmQgLS0tCmNvbW1pdCA5MDIzNjJkNTZkZThlNTUwZDhh
MTZmZWY1MDUzYzE3MjAzOWFhMmFiCkF1dGhvcjogU2VhbiBZb3VuZyA8c2VhbkBtZXNzLm9yZz4K
U3ViamVjdDogbWVkaWE6IG1lc29uLWlyLXR4OiBFbnN1cmUgY2xvY2sgaXMgZGlzYWJsZWQgb24g
dW5iaW5kCgpUaGlzIGNvbW1pdCByZXBsYWNlcyB0aGUgbWFudWFsIGRldm1fY2xrX2dldCBhbmQg
Y2xrX3ByZXBhcmVfZW5hYmxlIGNhbGxzCndpdGggZGV2bV9jbGtfZ2V0X2VuYWJsZWQuIFRoaXMg
ZW5zdXJlcyB0aGF0IHRoZSBjbG9jayBpcyBwcm9wZXJseQpkaXNhYmxlZCB3aGVuIHRoZSBkcml2
ZXIgaXMgdW5ib3VuZC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcmMvbWVzb24taXIt
dHguYyBiL2RyaXZlcnMvbWVkaWEvcmMvbWVzb24taXItdHguYwo+IGluZGV4IGZkZWQyYzI1NmYy
YTYuLmU3YmIxMDdlNmE4NDMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1p
ci10eC5jCj4gKysrIGIvZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1pci10eC5jCj4gQEAgLTI4OCw4
ICsyODgsOCBAQCBzdGF0aWMgaW50IG1lc29uX2lydHhfbW9kX2Nsb2NrX3Byb2JlKHN0cnVjdCBt
ZXNvbl9pcnR4ICppciwKPiAgCWlmICghbnApCj4gIAkJcmV0dXJuIC1FTk9ERVY7Cj4gIAo+IC0J
Y2xvY2sgPSBkZXZtX2Nsa19nZXQoaXItPmRldiwgInh0YWwiKTsKPiAtCWlmIChJU19FUlIoY2xv
Y2spIHx8IGNsa19wcmVwYXJlX2VuYWJsZShjbG9jaykpCj4gKwljbG9jayA9IGRldm1fY2xrX2dl
dF9lbmFibGVkKGlyLT5kZXYsICJ4dGFsIik7Cj4gKwlpZiAoSVNfRVJSKGNsb2NrKSkKPiAgCQly
ZXR1cm4gLUVOT0RFVjsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBp
c3N1ZSwgYnV0IGRvZXMgZHJvcHBpbmcgdGhlIGFjdHVhbCBlcnJvciBjb2RlIGZyb20KZGV2bV9j
bGtfZ2V0X2VuYWJsZWQoKSBhbmQgcmV0dXJuaW5nIC1FTk9ERVYgYnJlYWsgcHJvYmUgZGVmZXJy
YWw/CgpJZiB0aGUgY2xvY2sgcHJvdmlkZXIgaXNuJ3QgcmVhZHksIGRldm1fY2xrX2dldF9lbmFi
bGVkKCkgcmV0dXJucwotRVBST0JFX0RFRkVSLCB3aGljaCBnZXRzIG1hc2tlZCBoZXJlLiBTaG91
bGQgdGhpcyByZXR1cm4gUFRSX0VSUihjbG9jaykKaW5zdGVhZD8KClsgLi4uIF0KCldoaWxlIHJl
dmlld2luZyB0aGlzIGZpbGUsIEkgYWxzbyBub3RpY2VkIGFub3RoZXIgcHJlLWV4aXN0aW5nIGlz
c3VlIGluCnRoZSBzYW1lIGRyaXZlcjoKCmRyaXZlcnMvbWVkaWEvcmMvbWVzb24taXItdHguYzpt
ZXNvbl9pcnR4X3Byb2JlKCkgewogICAgLi4uCiAgICBpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBk
ZXYsIDApOwogICAgaWYgKGlycSA8IDApCiAgICAgICAgcmV0dXJuIC1FTk9ERVY7CiAgICAuLi4K
fQoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzbid0IGEgYnVnIGludHJvZHVjZWQgYnkgdGhpcyBw
YXRjaCwgYnV0IHdvdWxkIHJldHVybmluZyBhIGhhcmRjb2RlZAotRU5PREVWIGhlcmUgYnJlYWsg
cHJvYmUgZGVmZXJyYWwgaWYgdGhlIGludGVycnVwdCBjb250cm9sbGVyIGlzIG5vdCB5ZXQKcmVh
ZHk/CgpXaGVuIHBsYXRmb3JtX2dldF9pcnEoKSByZXR1cm5zIC1FUFJPQkVfREVGRVIsIGl0IHNl
ZW1zIHRoZSBjb2RlIGN1cnJlbnRseQpkaXNjYXJkcyBpdC4gV291bGQgcmV0dXJuaW5nIHRoZSBh
Y3R1YWwgZXJyb3IgY29kZSBiZSBtb3JlIGFwcHJvcHJpYXRlPwoKLS0gClNhc2hpa28gQUkgcmV2
aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC9jb3Zlci4xNzg0NzE1NzM3Lmdp
dC5zZWFuQG1lc3Mub3JnP3BhcnQ9NwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
