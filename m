Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B15CC6B1A
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Oct 2026 08:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEZTkZQEQ7KIHBmfHV0TUbR3AObHTCvDwFcGaf34qic=; b=qlei72mVbNfwYJ
	Xaqs7S+RRKEid9by39wTE1eL1DmvG0AtpwOcnuhBsoxxZZ4+26Z3Caq0M+odVyq1PuD5lOWFO1L9n
	9rLQtFfy3bjEi8QfqtWmZHDjfwTE9BBhZS1kCuQyEv/u/YISCQQ7fHyuZLaxIGlqa/xzSduPe/r68
	ws9AE/ddlFWGcDPMnxORiPdWB+96HqN8qkvTiSyzCNSJTXKRE3Uo8zer4wfj9wHmmPBJV9haytSoi
	hAJG7mO+QA8TA5SXm5GRT9VvsmF4G0fqPdkKLGDNHLKDzkZl4amu4Z532nD3DRT1+zBgwYfFo8l9y
	2Xj6fEBwZcp1qrP59RLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuOw-0000000Eu5a-0ljj;
	Wed, 14 Oct 2026 08:31:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuOt-0000000Eu4s-41LG
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Oct 2026 08:31:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B31F8434CD;
	Wed, 14 Oct 2026 08:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026671F000FF;
	Wed, 14 Oct 2026 08:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791966711;
	bh=femQLxGvTMcV5afk19U6TUxPM9LkYx6+V4SrP/g64Gw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BpOmecjgRouSlbFzkaYl9WvfsZEYDOWSpsHMN546yfZe8DHx7OlKpmkDd7zhx1Oh7
	 Fu6p2siNvwPnFnwY6EitAdGOuW7UTmeExZqX5gXUCHqBngoUZDydxA274hZUyZPr+p
	 IkXIyV3dSf46shhCVUI3tqgY4qyR4FBwfE8lOuQeelXnJBmYTU/WFIZEJlOokamR1X
	 iVjFfjzypBGkjlyCaTaQbd5b3IOEj62zVQg1AfCKZXd2QimEuMx8M3ropwiXb9T/mi
	 7p7RF9fI4r2X7BrzEXrTZE3VFPwz9A5PqhjAAOLugskvsVMarf8cBU6uI6jwd3HBTd
	 yAAApEeiGLTxA==
Message-ID: <sashiko-outbox-171013@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port
 numbering
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261014082037.1774672-3-wenst@chromium.org>
References: <20261014082037.1774672-1-wenst@chromium.org>
 <20261014082037.1774672-3-wenst@chromium.org>
Date: Wed, 14 Oct 2026 08:31:50 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGR0LWJpbmRpbmdzOiB1
c2I6IHNucHMsZHdjMzogQUJJIGJyZWFrYWdlIGFuZCBzZW1hbnRpYyBtaXNtYXRjaCBmb3IgT0Yg
Z3JhcGggcG9ydHMKLS0KCmNvbW1pdCA4YjIxY2I5YzlmMjk0MzNjYjY5YTMxMjgyOWVlNGU0NTdm
ZTczY2E1CkF1dGhvcjogQ2hlbi1ZdSBUc2FpIDx3ZW5zdEBjaHJvbWl1bS5vcmc+CgpkdC1iaW5k
aW5nczogdXNiOiBzbnBzLGR3YzM6IEZpeCBkb3duc3RyZWFtIHBvcnQgbnVtYmVyaW5nCgpUaGUg
RFdDMyBjb250cm9sbGVyIGNhbiBvcGVyYXRlIGluIGhvc3QgbW9kZSwgYW5kIFVTQiBkb3duc3Ry
ZWFtIHBvcnRzIHN0YXJ0CmZyb20gMSwgbm90IDAuIFRoaXMgY29tbWl0IHJlY29uY2lsZXMgdGhl
IGRvd25zdHJlYW0gcG9ydCBudW1iZXJpbmcgd2l0aCB0aGUKY29tbW9uIFVTQiBob3N0IGJpbmRp
bmcgYnkgcmVudW1iZXJpbmcgcG9ydHMgMCBhbmQgMSB0byAxIGFuZCAyLCB3aGljaCBpcwpleHBs
aWNpdGx5IG5vdGVkIGFzIG5vbi1iYWNrd2FyZHMgY29tcGF0aWJsZS4KCj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Ivc25wcyxkd2MzLWNvbW1vbi55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zbnBzLGR3YzMtY29t
bW9uLnlhbWwKPiBpbmRleCA2YzBiOGI2NTM4MjQ2Li40YjYzMDRiZDJlYzE2IDEwMDY0NAo+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Ivc25wcyxkd2MzLWNvbW1v
bi55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zbnBz
LGR3YzMtY29tbW9uLnlhbWwKPiBAQCAtNDEwLDExICs0MTAsMTEgQEAgcHJvcGVydGllczoKPiAg
ICAgICAgcHJvcGVydHkgaXMgdXNlZC4KPiAgCj4gICAgICBwcm9wZXJ0aWVzOgo+IC0gICAgICBw
b3J0QDA6Cj4gKyAgICAgIHBvcnRAMToKPiAgICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55
YW1sIy9wcm9wZXJ0aWVzL3BvcnQKPiAgICAgICAgICBkZXNjcmlwdGlvbjogSGlnaCBTcGVlZCAo
SFMpIGRhdGEgYnVzLgo+ICAKPiAtICAgICAgcG9ydEAxOgo+ICsgICAgICBwb3J0QDI6Cj4gICAg
ICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0Cj4gICAgICAg
ICAgZGVzY3JpcHRpb246IFN1cGVyIFNwZWVkIChTUykgZGF0YSBidXMuCgpbU2V2ZXJpdHk6IEhp
Z2hdCkRvZXMgdGhpcyBjaGFuZ2UgYnJlYWsgQUJJIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5IGZv
ciBleGlzdGluZyBpbi10cmVlCmRldmljZSB0cmVlcz8KCkZvciBleGFtcGxlLCBleGlzdGluZyBp
bi10cmVlIGRldmljZSB0cmVlcyBsaWtlCmFyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zbTYxMTUu
ZHRzaSBhbHJlYWR5IGRlZmluZSBwb3J0QDAgZm9yIEhTIGFuZApwb3J0QDEgZm9yIFNTOgoKCQkJ
CQlwb3J0QDAgewoJCQkJCQlyZWcgPSA8MD47CgoJCQkJCQl1c2JfZHdjM19oczogZW5kcG9pbnQg
ewoJCQkJCQl9OwoJCQkJCX07CgoJCQkJCXBvcnRAMSB7CgkJCQkJCXJlZyA9IDwxPjsKCgkJCQkJ
CXVzYl9kd2MzX3NzOiBlbmRwb2ludCB7CgkJCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnVzYl9x
bXBwaHlfdXNiX3NzX2luPjsKCQkJCQkJfTsKCQkJCQl9OwoKVGhlc2UgZXhpc3RpbmcgZGV2aWNl
IHRyZWVzIHdpbGwgbm93IGZhaWwgZHRic19jaGVjayBzY2hlbWEgdmFsaWRhdGlvbgpiZWNhdXNl
IHBvcnRAMCBpcyBubyBsb25nZXIgdmFsaWQsIGFuZCBwb3J0QDEgaXMgZG9jdW1lbnRlZCBhcyBI
aWdoIFNwZWVkCndoZW4gZXhpc3RpbmcgdHJlZXMgdXNlIGl0IGZvciBTdXBlciBTcGVlZC4KCkZ1
cnRoZXJtb3JlLCB3aGVuIHRoZSBXSVAgT0YgZ3JhcGggaG9zdCBtb2RlIGNvbm5lY3Rpb25zIG1l
bnRpb25lZCBpbiB0aGUKY29tbWl0IG1lc3NhZ2UgYXJlIG1lcmdlZCwgd2lsbCBhIGZ1dHVyZSBr
ZXJuZWwgYXR0ZW1wdGluZyB0byBjb25maWd1cmUKcG9ydEAxIGFzIHRoZSBIaWdoIFNwZWVkIHBv
cnQgZnVuY3Rpb25hbGx5IGJyZWFrIFVTQiBob3N0IG1vZGUgb24gb2xkZXIKRFRCcyB0aGF0IHJv
dXRlIHBvcnRAMSB0byB0aGUgU3VwZXIgU3BlZWQgUEhZPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3
IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAxNDA4MjAzNy4xNzc0Njcy
LTEtd2Vuc3RAY2hyb21pdW0ub3JnP3BhcnQ9MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
