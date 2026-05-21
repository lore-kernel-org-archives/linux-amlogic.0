Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE05CD4F5E
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 May 2026 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHkz5m1B26oLpkh+N662KSI8QALK6X8NmfQES/AhJ7U=; b=PVp6ZVvCtCdvLs
	sy0YR4VolC9EpwIdEjToCaogGjbd3MJtTkuGqmjktN1uRa5F1/yJt7WgkphSUNrXyt4JfnMrcPOMt
	8cr/hkfE2e9dX1vBLd5vJT4FAhUo/z41QUc198OwKRAI41IAMhUBVTK7YUhZ+UlDTislEotXCWlDy
	BzFMD6m0k3/ZtAkFEz4KpuuQNny7PL0YIQge3Wuv15E2hgVfUXBrUOWtmAAVXz1d6r1WpslPbBM8U
	Z2B1oqNbuRizSX6XeOoCNx99zWgvNhMZFZZuHRNiqZBA096jCB3boKVcFQQOwz6VftURUVegNHQj8
	/LX8jLWg1UHYrLyIgogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyeq-000000076em-1nJn;
	Thu, 21 May 2026 08:21:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyep-000000076eO-0qxA
	for linux-amlogic@lists.infradead.org;
	Thu, 21 May 2026 08:21:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C7F7601F3;
	Thu, 21 May 2026 08:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3FE1F00A3B;
	Thu, 21 May 2026 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779351690;
	bh=RsTL9FOW4wrOkfMOa0WAFaXlKJyboMFZ1uHWJa5m12c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KA0mc5+SKIb1Tbp6M9FDpKHI7hyt7xhCLJ51gYspXbV2dgYWUnY7zFuEj0MDG0vNW
	 CH88QlX271eCpX065CiHu/mviFcpKwcPysfm5+t9xhq5ZvkB5vea+zBaoIn0JXl30y
	 dmzkHpc+XXJ12aANnYkd3toSE4JJiD2yPDQLJ13JEERs17eS6afzZ+Dm07rUGT4lu8
	 LxiQFcDXj10grrYNXOTtXF3QkVCDwQ4FXFNwrGqiMYv2UPlZbiTwipTFq7gblOuIdR
	 4MR75rc4cpGlFb6J6pyq5ncW2QUnz9g9g+eU2RCKDYry4UKaKxPHxXbkYtsgdbZgaU
	 5OABAdAeb0T5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
To: "Xianwei Zhao via B4 Relay" <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-amlogic-dma-v8-1-86cc2ce94142@amlogic.com>
References: <20260521-amlogic-dma-v8-1-86cc2ce94142@amlogic.com>
Date: Thu, 21 May 2026 08:21:29 +0000
Message-Id: <20260521082129.9F3FE1F00A3B@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIG1hY3JvcyBETUFf
VFggYW5kIERNQV9SWCBhcmUgZGVmaW5lZCBpbiBhIGdsb2JhbCBoZWFkZXIgd2l0aG91dCBhbnkg
dmVuZG9yIG9yIHN1YnN5c3RlbSBwcmVmaXguCi0gW0xvd10gVGhlIGJpbmRpbmcgc3BlY2lmaWVz
IGAjZG1hLWNlbGxzOiBjb25zdDogMmAgYnV0IGZhaWxzIHRvIGRvY3VtZW50IHRoZSBzZW1hbnRp
Y3Mgb2YgdGhlIHR3byBjZWxscy4KLS0KCmNvbW1pdCA3YTAyYzdlNjE0NTA1MDIyMWQ3N2Q3YTQ3
NDVlZTRkNGU2NTExNjNiCkF1dGhvcjogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dp
Yy5jb20+CgpkdC1iaW5kaW5nczogZG1hOiBBZGQgQW1sb2dpYyBBOSBTb0MgRE1BCgpUaGlzIGNv
bW1pdCBhZGRzIGRldmljZSB0cmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIEFtbG9n
aWMgQTkgU29DCmdlbmVyYWwtcHVycG9zZSBETUEgY29udHJvbGxlci4gSXQgYWxzbyBpbnRyb2R1
Y2VzIGEgbmV3IGR0LWJpbmRpbmdzIGhlYWRlcgpmaWxlIHdpdGggcHJvcGVydHkgdmFsdWVzIGZv
ciB0aGUgRE1BIHRyYW5zZmVyIGRpcmVjdGlvbnMuCgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAuLmVmZDdiMjYwMmMzMzYKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rt
YS9hbWxvZ2ljLGE5LWRtYS55YW1sClsgLi4uIF0KPiArcHJvcGVydGllczoKPiArICBjb21wYXRp
YmxlOgo+ICsgICAgY29uc3Q6IGFtbG9naWMsYTktZG1hClsgLi4uIF0KPiArICBjbG9jay1uYW1l
czoKPiArICAgIGNvbnN0OiBzeXMKPiArCj4gKyAgJyNkbWEtY2VsbHMnOgo+ICsgICAgY29uc3Q6
IDIKCltTZXZlcml0eTogTG93XQpTaG91bGQgdGhpcyBpbmNsdWRlIGEgZGVzY3JpcHRpb24gZXhw
bGFpbmluZyB3aGF0IHRoZSB0d28gY2VsbHMgcmVwcmVzZW50PwoKVXN1YWxseSBiaW5kaW5ncyB3
aXRoIG11bHRpcGxlIGNlbGxzIGRvY3VtZW50IHRoZSBzZW1hbnRpY3Mgb2YgZWFjaCBjZWxsCihl
LmcuLCBmaXJzdCBjZWxsIGZvciB0aGUgcmVxdWVzdCBsaW5lLCBzZWNvbmQgZm9yIHRyYW5zZmVy
IGRpcmVjdGlvbikgc28KY2xpZW50cyBrbm93IGhvdyB0byBjb25zdHJ1Y3QgdGhlaXIgZG1hcyBz
cGVjaWZpZXIuCgpbIC4uLiBdCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvZG1h
L2FtbG9naWMsYTktZG1hLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRt
YS5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwLi5jNTljMmZk
NGI5NTYxCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvZG1hL2Ft
bG9naWMsYTktZG1hLmgKPiBAQCAtMCwwICsxLDggQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IChHUEwtMi4wIE9SIE1JVCkgKi8KPiArCj4gKyNpZm5kZWYgX19EVF9CSU5ESU5HU19E
TUFfQU1MT0dJQ19ETUFfSF9fCj4gKyNkZWZpbmUgX19EVF9CSU5ESU5HU19ETUFfQU1MT0dJQ19E
TUFfSF9fCj4gKwo+ICsjZGVmaW5lIERNQV9UWAkJCTAKPiArI2RlZmluZSBETUFfUlgJCQkxCgpb
U2V2ZXJpdHk6IExvd10KV291bGQgaXQgYmUgc2FmZXIgdG8gYWRkIGEgdmVuZG9yIG9yIGRldmlj
ZSBwcmVmaXggdG8gdGhlc2UgbWFjcm9zPwoKU2luY2UgdGhpcyBoZWFkZXIgaXMgZ2xvYmFsbHkg
YWNjZXNzaWJsZSBhbmQgY2FuIGJlIGluY2x1ZGVkIGluIGJvdGggZGV2aWNlCnRyZWUgc291cmNl
cyBhbmQgZHJpdmVyIGNvZGUsIGdlbmVyaWMgbmFtZXMgbGlrZSBETUFfVFggYW5kIERNQV9SWCBt
aWdodApjYXVzZSBtYWNybyByZWRlZmluaXRpb24gY29uZmxpY3RzIHdpdGggb3RoZXIga2VybmVs
IGNvbXBvbmVudHMuIEFkZGluZyBhCnByZWZpeCBsaWtlIEFNTE9HSUNfQTlfIHdvdWxkIGF2b2lk
IHRoaXMuCgo+ICsjZW5kaWYgLyogX19EVF9CSU5ESU5HU19ETUFfQU1MT0dJQ19ETUFfSF9fICov
CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYwNTIxLWFtbG9naWMtZG1hLXY4LTAtODZjYzJjZTk0MTQyQGFtbG9naWMuY29tP3BhcnQ9
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
