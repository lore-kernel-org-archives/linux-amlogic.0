Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8E9CD8C90
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Jun 2026 21:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9aE6lOyJvngKJanZDijQbQlFrpWPJZxaLO5wZZad8zs=; b=AlLVMs8e2ALadb
	N92zq5qE/USDOVVNZSNMdG0Hz9ZsLwvJ5DcFIf2zCeu8H9NDx4mNrLpTXDsfJBK1EVXBvtLfkZ4xf
	FQAOQxOTRmW5MRqnwdfcf/GxjCTIbtL+PKW78pY5XLPay+uNlXfWW4E4Z49ImgCiGKaUeZbfIACXp
	RCUNx8Sac5TaVOdEkFbGoerg8KpLnAr1lHWt0H7s1gAe0y0lHAG2eBKGJz+FZUv7LrlNtKOHE/Pa+
	G2Y3XebKtmzP4q3ZTxJHshQItge/JmPDz8KLk+Ihgw23Y36PQ5s3I0gOW7pqqcH7021V7xD5R7Lca
	+3gyhVEshghWhnPN+PKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWLMx-00000002X82-1cDW;
	Sun, 07 Jun 2026 21:49:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWLMv-00000002X7p-2RI7
	for linux-amlogic@lists.infradead.org;
	Sun, 07 Jun 2026 21:49:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0167C60018;
	Sun,  7 Jun 2026 21:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D601F00893;
	Sun,  7 Jun 2026 21:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780868960;
	bh=oH5bCZafM+G4vEBXBEx1ZITPaqUg1BJNd24oKWADpts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dvbsS/3VuhxLU3xOsqpN6wkxlxrgGh5MqEBG5Z88f6mZn0Cn1k37NnLCCAFpqoSER
	 evGxHq26G5X00IVAiipgQPnR/e5gyuGWfcP3B8c+wQxeI/zRKVgOQZvu6WlMYN5xKE
	 EISli4Z3xUiJRGK8F5V6GCo/kGgPQVyDDasT7gXeUO3VvWx6qL0kcAztUTqrvvONbp
	 iUQWrN4YJ+zn0su1HN0zdqZmKpBUTp34HLiQgHq62GCC9UwiF51DLrXEDlXXC6/C5u
	 FafHO5PlQhEHDTo2RXVrmLy5aP5BXPACcjzJAq3dIa9J5NA6macNP/YjsaqOxj6tn2
	 KhEtfyZL4BePw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/8] drm/bridge: pass down IRQ_HPD to the drivers
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260608-hpd-irq-events-v4-5-30b62b335487@oss.qualcomm.com>
References: <20260608-hpd-irq-events-v4-5-30b62b335487@oss.qualcomm.com>
Date: Sun, 07 Jun 2026 21:49:20 +0000
Message-Id: <20260607214920.72D601F00893@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBNb2RpZnlpbmcgY29ubmVjdG9yIEVESUQgcHJvcGVydGllcyB3aXRob3V0IGhvbGRp
bmcgYG1vZGVfY29uZmlnLm11dGV4YCBkdXJpbmcgYXN5bmNocm9ub3VzIGhvdHBsdWcgbm90aWZp
Y2F0aW9ucy4KLS0KCmNvbW1pdCA2ZTYwZTEzYmUzMDQzODZkMGE5NGY1Y2VhZGU4M2U0NDY3N2Uy
YTJhCkF1dGhvcjogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNv
bW0uY29tPgoKZHJtL2JyaWRnZTogcGFzcyBkb3duIElSUV9IUEQgdG8gdGhlIGRyaXZlcnMKClRo
ZSBEaXNwbGF5UG9ydCBzdGFuZGFyZCBkZWZpbmVzIGEgc3BlY2lhbCBraW5kIG9mIEhQRCBldmVu
dHMgY2FsbGVkIElSUV9IUEQuClRoZXNlIGV2ZW50cyBhcmUgdXNlZCB0byBub3RpZnkgRFAgU291
cmNlIGFib3V0IHRoZSBldmVudHMgb24gdGhlIFNpbmsgc2lkZS4KVGhpcyBjb21taXQgcGFzc2Vz
IGRvd24gdGhlIGV4dHJhIHN0YXR1cyB0byB0aGUgYnJpZGdlIGRyaXZlcnMgdmlhIHRoZQpocGRf
bm90aWZ5KCkgY2FsbGJhY2suCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2xvbnRpdW0tbHQ5NjExdXhjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2xvbnRpdW0tbHQ5
NjExdXhjLmMKPiBpbmRleCA5NDI3Y2MyMzU4YWUxLi44Y2IxN2JkMGUyMzg3IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDk2MTF1eGMuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvbG9udGl1bS1sdDk2MTF1eGMuYwo+IEBAIC00MjksNyArNDI5
LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZWRpZCAqbHQ5NjExdXhjX2JyaWRnZV9lZGlk
X3JlYWQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWQKPiAgCj4gIHN0YXRpYyB2b2lkIGx0OTYxMXV4
Y19icmlkZ2VfaHBkX25vdGlmeShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+ICAJCQkJCXN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4gLQkJCQkJZW51bSBkcm1fY29ubmVjdG9y
X3N0YXR1cyBzdGF0dXMpCj4gKwkJCQkJZW51bSBkcm1fY29ubmVjdG9yX3N0YXR1cyBzdGF0dXMs
Cj4gKwkJCQkJZW51bSBkcm1fY29ubmVjdG9yX3N0YXR1c19leHRyYSBleHRyYV9zdGF0dXMpCj4g
IHsKPiAgCWNvbnN0IHN0cnVjdCBkcm1fZWRpZCAqZHJtX2VkaWQ7CgpbU2V2ZXJpdHk6IEhpZ2hd
ClRoaXMgaXNuJ3QgYSBidWcgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgSSBub3RpY2Vk
IGEgcG90ZW50aWFsIGxvY2tpbmcKaXNzdWUgaGVyZSBpbiBsdDk2MTF1eGNfYnJpZGdlX2hwZF9u
b3RpZnkoKS4KClRoaXMgZnVuY3Rpb24gY2FsbHMgZHJtX2VkaWRfY29ubmVjdG9yX3VwZGF0ZSgp
LCB3aGljaCBtb2RpZmllcwpjb25uZWN0b3ItPmVkaWRfYmxvYl9wdHIuIEFjY29yZGluZyB0byBE
Uk0gZG9jdW1lbnRhdGlvbiwgZWRpZF9ibG9iX3B0ciBhY2Nlc3MKYW5kIG1vZGlmaWNhdGlvbiB2
aWEgZHJtX3Byb3BlcnR5X3JlcGxhY2VfZ2xvYmFsX2Jsb2IgbXVzdCBiZSBwcm90ZWN0ZWQgYnkK
bW9kZV9jb25maWcubXV0ZXguCgpIb3dldmVyLCB3aGVuIHRoZSBocGRfbm90aWZ5IHBpcGVsaW5l
IGlzIHRyaWdnZXJlZCBhc3luY2hyb25vdXNseSB2aWEKZHJtX2JyaWRnZV9jb25uZWN0b3JfaGFu
ZGxlX2hwZCgpIGluIGRybV9icmlkZ2VfY29ubmVjdG9yLmMsIHRoZSBjYWxsZXIKaW50ZW50aW9u
YWxseSBkcm9wcyB0aGUgbG9jayBwcmlvciB0byBleGVjdXRpbmcgdGhlIGNhbGxiYWNrczoKCmRy
bV9icmlkZ2VfY29ubmVjdG9yX2hhbmRsZV9ocGQoKSB7CiAgICAuLi4KICAgIG11dGV4X3VubG9j
aygmZGV2LT5tb2RlX2NvbmZpZy5tdXRleCk7CiAgICBkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9ocGRf
bm90aWZ5KGNvbm5lY3Rvciwgc3RhdHVzLCBleHRyYV9zdGF0dXMpOwogICAgLi4uCn0KCkNvdWxk
IHRoaXMgbGVhZCB0byBhIGRhdGEgcmFjZSBvbiBjb25uZWN0b3ItPmVkaWRfYmxvYl9wdHIgaWYg
aG90cGx1ZyBldmVudHMKb2NjdXIgY29uY3VycmVudGx5IHdpdGggdXNlcnNwYWNlIHF1ZXJpZXMg
b3IgbW9kZXNldHMsIHBvdGVudGlhbGx5IGNhdXNpbmcgYQpkb3VibGUtZnJlZSBvciB1c2UtYWZ0
ZXItZnJlZSBvZiB0aGUgYmxvYiBkYXRhPwoKWyAuLi4gXQoKLS0gClNhc2hpa28gQUkgcmV2aWV3
IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDYwOC1ocGQtaXJxLWV2ZW50
cy12NC0wLTMwYjYyYjMzNTQ4N0Bvc3MucXVhbGNvbW0uY29tP3BhcnQ9NQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
