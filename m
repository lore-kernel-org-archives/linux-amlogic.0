Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5368C9830E
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2026 15:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5B3F6uQV91l6hi5bVCfDxAxaYeCzrkqM8U6L1vFL8Rc=; b=nMM+/Qyu7A10vC
	8Um6W2oN0Pfds++NbJg6CTkrsU6QhrJYDJ4JL8eMfguVWH/48czIVF0EbfwiO/58enESwXzm4B9d2
	9Bef5k9rRDjY5TrNEvZY+HgUnrL3ZcKcewz35Ue65NFEdRxLNqFfd7swPi3/cmzYyWveZVuMQdqP3
	rcbN9qrtHeG8Ho0CW43+vCCJvpt1ubdY5Vu4inqBCrdp1LTYD2O762VjG1QP0Ad+BSJ2xm7UIIZKC
	oUh2EYvRfFmnqYkKnsVJSxgVtoSHtNTXq/Gh2SvFJaY5K+A3vN/WXN7L5fAjssHsOsqxdoT4SGIQF
	dKg6j5eybEaQThXFtY/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lAl-0000000BMMR-3X4z;
	Thu, 24 Sep 2026 15:15:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lAk-0000000BMKd-0088
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Sep 2026 15:15:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A1B69601DE;
	Thu, 24 Sep 2026 15:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6971F000FF;
	Thu, 24 Sep 2026 15:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790262940;
	bh=JwwZRz8sSOWRBKYYcGRM4YkpiNNFFtx8DJIpCtAC0yg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zs7FvQ15l/ZK2znr4hR6MWOpLAm3Vmwa+wFo/UQ+qkXWonmFGNFUiTubXEMA3qwNG
	 FE1UcJFowrUx2t0cR1WZRS4foRCdU2qRyJccRgChM1aq64Tl6S382vBkyg5gm3vSpb
	 mMrf6i/O0ti0bTiekt5TW5nTbOcNJ5TyGEamqQtsgMSYoT3qeju+7vq2T412gXhPS8
	 xJ4KnZhLddL9wMwi2w/JPkMHulRG+fNdUYz1pOY5wbCaRs6Ik5vk58XrGvirY+2XhS
	 hvFLGqbSDnD0TEWASnH0dDbSZgW32RB0s+UzbDjqf88gJIU95lgl1OqOaKOe3gFOlH
	 DoFQ5g9w8C84g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v15 4/9] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: robh@kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, linux-sunxi@lists.linux.dev, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-4-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
 <20260923-qcom-sa8255p-emac-v15-4-e82f33720737@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:15:39 +0000
Message-Id: <20260924151539.CE6971F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHQtYmluZGluZ3M6IHVs
dHJhcmlzYyxkcDEwMDAtZ21hYzogbWlzc2luZyBwb3dlci1kb21haW5zIG1heEl0ZW1zIGNvbnN0
cmFpbnQKLS0KCmNvbW1pdCBlMzBjYzA2MjYxNzgxMTdmYmJlZWVkMzhmZmU0NTVkYjE1ZDQ5NzNi
CkF1dGhvcjogQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBrZXJuZWwub3JnPgoKZHQtYmluZGlu
Z3M6IG5ldDogcWNvbTogZG9jdW1lbnQgdGhlIGV0aHFvcyBkZXZpY2UgZm9yIFNDTUktYmFzZWQg
c3lzdGVtcwoKRGVzY3JpYmUgdGhlIGZpcm13YXJlLW1hbmFnZWQgdmFyaWFudCBvZiB0aGUgUUNv
bSBEZXNpZ25XYXJlIE1BQy4gQXMgdGhlCnByb3BlcnRpZXMgaGVyZSBkaWZmZXIgYSBsb3QgZnJv
bSB0aGUgSExPUy1tYW5hZ2VkIHZhcmlhbnQsIGxldHMgcHV0IGl0CmluIGEgc2VwYXJhdGUgZmls
ZS4gU2luY2Ugd2UgbmVlZCB0byB1cGRhdGUgdGhlIG1heGltdW0gbnVtYmVyIG9mIHBvd2VyCmRv
bWFpbnMsIGxldCdzIHVwZGF0ZSBleGlzdGluZyBiaW5kaW5ncyByZWZlcmVuY2luZyB0aGUgdG9w
LWxldmVsCnNucHMsZHdtYWMueWFtbCBhbmQgbGltaXQgdGhlaXIgbWF4SXRlbXMgZm9yIHBvd2Vy
LWRvbWFpbnMgdG8gMS4KCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwKPiBpbmRleCAwZmY5ZTMyODRhMDYxLi4xZjJlZTY4
NGRjMzkxIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9u
ZXQvc25wcyxkd21hYy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL25ldC9zbnBzLGR3bWFjLnlhbWwKClsgLi4uIF0KCj4gQEAgLTE4Niw3ICsxODcsOCBAQCBw
cm9wZXJ0aWVzOgo+ICAgICAgICAgICAgLSBlbnVtOiBbYWhiLCBzdG1tYWNldGgtb2NwXQo+ICAK
PiAgICBwb3dlci1kb21haW5zOgo+IC0gICAgbWF4SXRlbXM6IDEKPiArICAgIG1pbkl0ZW1zOiAx
Cj4gKyAgICBtYXhJdGVtczogMgo+ICAKPiAgICBtYWMtbW9kZToKPiAgICAgICRyZWY6IGV0aGVy
bmV0LWNvbnRyb2xsZXIueWFtbCMvcHJvcGVydGllcy9waHktY29ubmVjdGlvbi10eXBlCgpbU2V2
ZXJpdHk6IExvd10KRG9lcyB0aGlzIHVuaW50ZW50aW9uYWxseSByZWxheCB2YWxpZGF0aW9uIGZv
ciB0aGUgdWx0cmFyaXNjLGRwMTAwMC1nbWFjCmNvbXBhdGlibGUgc3RyaW5nPwoKVGhlIGNvbW1p
dCBtZXNzYWdlIG1lbnRpb25zIHVwZGF0aW5nIGV4aXN0aW5nIGJpbmRpbmdzIHRoYXQgcmVmZXJl
bmNlCnNucHMsZHdtYWMueWFtbCB0byBsaW1pdCBwb3dlci1kb21haW5zIG1heEl0ZW1zIHRvIDEu
IEhvd2V2ZXIsIGl0IGFwcGVhcnMKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25l
dC91bHRyYXJpc2MsZHAxMDAwLWdtYWMueWFtbCBpcyBtaXNzaW5nCmEgbG9jYWwgb3ZlcnJpZGUg
YW5kIHdpbGwgbm93IGluaGVyaXQgdGhpcyBuZXcgbWF4SXRlbXM6IDIgY29uc3RyYWludC4KClNo
b3VsZCB1bHRyYXJpc2MsZHAxMDAwLWdtYWMueWFtbCBhbHNvIGJlIHVwZGF0ZWQgdG8gbGltaXQg
bWF4SXRlbXMgdG8gMT8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28u
ZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MjMtcWNvbS1zYTgyNTVwLWVtYWMtdjE1LTAtZTgyZjMzNzIw
NzM3QG9zcy5xdWFsY29tbS5jb20/cGFydD00CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
