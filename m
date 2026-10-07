Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388C0CA6002
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 22:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vIM9aP7b2cbSCfc60cwYpAEvHpHcShffeqbjexEDuw=; b=nfarS2H48riPBJ
	ha2tllkSxI7bzo9Ef031hdZiBL1REp/oLxuuMHa55UzYyL4vCMwGGtKMU4ILYzLvvLpkA4hOt4OMY
	P5JXXS0ApH3tYUpXVg1xcIifW7A0OU1K8UAXEM0wUwNYAuFt3T6EpljmmqEIqchgfLnbR/c33WtKd
	0EOZMuUqJ9gol7Q4hFiVnCjwQmS9GeIYa+WBVV6muKGBv2xyQCv43vsZ6jGwF5mwW/IiI1OSUfps+
	hXyyrmCxUAV4sOanNh2tnwxJ4K6w9TJADOv9nJODNcRPTawZ7r6POrY0yUc3QDTeTr6RmuEZ2zpWL
	5z7X/JIU0KKxto41Friw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZll-00000003ETZ-1DWI;
	Wed, 07 Oct 2026 22:05:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZlj-00000003ETF-1KJA
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Oct 2026 22:05:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BE95460A53;
	Wed,  7 Oct 2026 22:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5860A1F000FF;
	Wed,  7 Oct 2026 22:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791410746;
	bh=+yNlKTAwNGExkJulTzTAIDDhdTmwGJEAZ+Of7g9uazw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P00TKY66wBgcEzaWccC6Oi3xm14gScuy3AuArXAgyOsq8aeQrxlJbMsrQbvUG/Rie
	 UZrpl/9IYNDWN2nw4YEPrRkWYuZylQMIHGNtP5RAts9u/pqtyweDAkQ+Ki/6B3HQ0r
	 ggdBBQB3cytxr7f4H9h6YzPZrKdUoLc+GDazpWFRON+I3FHL/vmOQIG2ELD2yhM/Jk
	 SrBlBiiodflGPkKcgJ6uqUz3znP8ciLnnGMhaEsFm+vxWvN1NJipcCOpJyzyMOXrVp
	 DS56a+f5MlVeg+wxSuBne2cBHHWfBNHTSBQJxmidpSVsBvKeuXbO63WMqcjucyRBwM
	 M/691biqnNS0Q==
Message-ID: <sashiko-outbox-163403@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] irqchip/meson-gpio: Allow the GPIO interrupts to wake
 the system
To: "Igor Velkov" <iav@iav.lv>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261008-meson-gpio-wake-v1-1-b0af1598d469@iav.lv>
References: <20261008-meson-gpio-wake-v1-1-b0af1598d469@iav.lv>
Date: Wed, 07 Oct 2026 22:05:46 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gaXJxY2hpcC9tZXNv
bi1ncGlvOiBtaXNzaW5nIElSUUNISVBfTUFTS19PTl9TVVNQRU5EIGNhdXNlcyBzcHVyaW91cyB3
YWtldXBzCi0tCgpjb21taXQgNWNlNWE5ZjM1NmQ4ODJmNWJjNDQzMmMwMDA5YmU3ZmQwYWRiYjBm
ZApBdXRob3I6IElnb3IgVmVsa292IDxpYXZAaWF2Lmx2PgoKaXJxY2hpcC9tZXNvbi1ncGlvOiBB
bGxvdyB0aGUgR1BJTyBpbnRlcnJ1cHRzIHRvIHdha2UgdGhlIHN5c3RlbQoKVGhpcyBjb21taXQg
YWRkcyB0aGUgSVJRQ0hJUF9TS0lQX1NFVF9XQUtFIGZsYWcgdG8gbWVzb25fZ3Bpb19pcnFfY2hp
cC4KVGhpcyBhbGxvd3MgZW5hYmxlX2lycV93YWtlKCkgdG8gc3VjY2VlZCBhbmQgR1BJTyBpbnRl
cnJ1cHRzIHRvIHdha2UgdGhlCnN5c3RlbSBmcm9tIHN1c3BlbmQuCgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2lycWNoaXAvaXJxLW1lc29uLWdwaW8uYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtbWVz
b24tZ3Bpby5jCj4gaW5kZXggOTFhOWMzMzdmZTZkOS4uZTAzMjllZjVlNGEyMSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLW1lc29uLWdwaW8uYwo+ICsrKyBiL2RyaXZlcnMvaXJx
Y2hpcC9pcnEtbWVzb24tZ3Bpby5jCj4gQEAgLTUzOCw3ICs1MzgsNyBAQCBzdGF0aWMgc3RydWN0
IGlycV9jaGlwIG1lc29uX2dwaW9faXJxX2NoaXAgPSB7Cj4gICNpZmRlZiBDT05GSUdfU01QCj4g
IAkuaXJxX3NldF9hZmZpbml0eQk9IGlycV9jaGlwX3NldF9hZmZpbml0eV9wYXJlbnQsCj4gICNl
bmRpZgo+IC0JLmZsYWdzCQkJPSBJUlFDSElQX1NFVF9UWVBFX01BU0tFRCwKPiArCS5mbGFncwkJ
CT0gSVJRQ0hJUF9TRVRfVFlQRV9NQVNLRUQgfCBJUlFDSElQX1NLSVBfU0VUX1dBS0UsCgpbU2V2
ZXJpdHk6IE1lZGl1bV0KU2luY2UgdGhpcyBwYXRjaCBtb2RpZmllcyBtZXNvbl9ncGlvX2lycV9j
aGlwLmZsYWdzIHRvIGZpeCBzdXNwZW5kIHdha2V1cApiZWhhdmlvciwgc2hvdWxkIGl0IGFsc28g
YWRkIElSUUNISVBfTUFTS19PTl9TVVNQRU5EIHRvIHByb3Blcmx5IG1hc2sKbm9uLXdha2V1cCBp
bnRlcnJ1cHRzIGF0IHRoZSBHSUMgbGV2ZWw/CgpEdXJpbmcgc3lzdGVtIHN1c3BlbmQsIHN1c3Bl
bmRfZGV2aWNlX2lycSgpIGNoZWNrcyB0aGUgdG9wLWxldmVsIGlycWNoaXAncwpmbGFncyBmb3Ig
SVJRQ0hJUF9NQVNLX09OX1NVU1BFTkQuIEJlY2F1c2UgbWVzb25fZ3Bpb19pcnFfY2hpcCBsYWNr
cyB0aGlzCmZsYWcsIG5vbi13YWtldXAgaW50ZXJydXB0cyBhcmUgb25seSBsYXppbHkgZGlzYWJs
ZWQgYnV0IG5vdCBleHBsaWNpdGx5Cm1hc2tlZCBhdCB0aGUgaGFyZHdhcmUgbGV2ZWwuCgpTaW5j
ZSBtZXNvbl9ncGlvX2lycV9jaGlwIGRlbGVnYXRlcyBtYXNraW5nIGRpcmVjdGx5IHRvIGl0cyBH
SUMgcGFyZW50LCBhbmQKdGhlIEdJQyByZXF1aXJlcyBleHBsaWNpdCBtYXNraW5nIHRvIHByZXZl
bnQgd2FrZXVwcywgd2lsbCB0aGUgdW5tYXNrZWQKbm9uLXdha2V1cCBpbnRlcnJ1cHRzIHJlbWFp
biBlbmFibGVkIGluIHRoZSBHSUMgYW5kIHNwdXJpb3VzbHkgd2FrZSB0aGUgQ1BVCmZyb20gc3Vz
cGVuZD8KCj4gIH07Cj4gIAo+ICBzdGF0aWMgaW50IG1lc29uX2dwaW9faXJxX2RvbWFpbl90cmFu
c2xhdGUoc3RydWN0IGlycV9kb21haW4gKmRvbWFpbiwKCi0tIApTYXNoaWtvIEFJIHJldmlldyDC
tyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEwMDgtbWVzb24tZ3Bpby13YWtl
LXYxLTEtYjBhZjE1OThkNDY5QGlhdi5sdj9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
