Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BCE606A321
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2026 22:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=koQ4LGfc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTUgPE0e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=idEdTTAWHWwU+RQ8efSGZd8Ao16HPoi33cgHQY9t05I=; b=koQ4LGfc6E/JLATVhMTaE75p0n
	OLl3iBGsHD0pqYfz2C1MeMnUa/W18ImVhp/PiJVEMz4m1+bAlwONzAmjlchJbshtk3gVfUAKPncNj
	hYtpL+iXPy8sHq5pzLxA7Fl0P4NZkT6utnAR7HTAxGS8u07dKzZNMpAoEMCz75kKNhvF+uU9ovp7a
	GdDkI7TkV5ggBl3bXpOfQQ5yeZ6VkRgmxJjYOvJz17Q2kRnOcbuUPaVY9kj2VqSCfoqEdz56bNvgX
	Ho6VT/cwhanorOchnyqj2h0n4otqVRfA06f+hrhQd4Q9gGYm6ZDpqC+y8zyIWxlOS4wIGjBasQCmZ
	ejIkdGow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGjY-00000007wUb-0Zis;
	Wed, 11 Nov 2026 22:24:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGjX-00000007wUQ-1By6
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Nov 2026 22:23:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 11F0C612E2;
	Wed, 11 Nov 2026 22:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7267A1F00A05;
	Wed, 11 Nov 2026 22:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794435837;
	bh=bZ89Jn9VIjdiavN+kLqyRgxItfyiVxGGc3kvXdqBBDI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oTUgPE0eoRJRwPRut0dTlzBGfpudzqKst4hgWYili0kK4RMHOOT9G5hNt5mMf/Oj/
	 EdFk8o3V7xilwLRYDXUC285GeQpZlH7UEpPfrC2HlBFY+yyh8iSnI3ZlQHxjfbhQdV
	 mlvst8veaMX+X8dIor+00ivRyBnbUEFEoA44FYZRsLL9qfluuxZV4lKWQ+dxOhoMto
	 +rpO/evayXnLpAvdQrZ3S7tzX5J8b8I5WgoFKuL1ZHN46ngJJkfqAnit81wZ0O8dRa
	 hGDsbyRt723E2epymWSSrfnqIr8jqo/0gdf7c6giCFsw2HlbyICl68LcayMpI8Ohyn
	 JYr5FBpXjss6w==
Message-ID: <sashiko-outbox-209783@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/10] dmaengine: amlogic: Destroy free_wq after devres
 DMA device unregistration
To: "Lee Jones" <lee@kernel.org>, linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org
Cc: vkoul@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261111215349.1983909-6-lee@kernel.org>
References: <20261111215349.1983909-1-lee@kernel.org>
 <20261111215349.1983909-6-lee@kernel.org>
Date: Wed, 11 Nov 2026 22:23:57 +0000
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
bm8gbmV3IGlzc3VlcwppbiB0aGlzIHBhdGNoLCBidXQgbm90aWNlZCAxIHJlbGF0ZWQgcHJlLWV4
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbTWVkaXVtXSBkbWFlbmdpbmU6
IGFtbG9naWM6IG1pc3NpbmcgcGxhdGZvcm1fZ2V0X2lycSgpIGVycm9yIGNoZWNrIGluCiAgYW1s
X2RtYV9wcm9iZSgpIFsxXQotLQoKY29tbWl0IDJiZGU4M2QwY2VlOTY2YjE1MDY5MDg5OWVlOGFm
MTVkMGZiOTEzMzAKQXV0aG9yOiBMZWUgSm9uZXMgPGxlZUBrZXJuZWwub3JnPgoKZG1hZW5naW5l
OiBhbWxvZ2ljOiBEZXN0cm95IGZyZWVfd3EgYWZ0ZXIgZGV2cmVzIERNQSBkZXZpY2UgdW5yZWdp
c3RyYXRpb24KClRoaXMgY29tbWl0IHN3aXRjaGVzIGFtbF9kbWEtPmZyZWVfd3EgdG8gZGV2bV9h
bGxvY19vcmRlcmVkX3dvcmtxdWV1ZSgpIHNvCnRoYXQgdGhlIHdvcmtxdWV1ZSBpcyBjbGVhbmVk
IHVwIG9uIHByb2JlIGZhaWx1cmUgYW5kIGRlc3Ryb3llZCBhZnRlcgpkZXZyZXMgdW5yZWdpc3Rl
cnMgdGhlIERNQSBkZXZpY2Ugb24gcmVtb3ZhbC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1h
L2FtbG9naWMtZG1hLmMgYi9kcml2ZXJzL2RtYS9hbWxvZ2ljLWRtYS5jCj4gaW5kZXggNjg0MTIx
ZDEzZmNhYi4uNzkxYmQ4Mjc0M2QzMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS9hbWxvZ2lj
LWRtYS5jCj4gKysrIGIvZHJpdmVycy9kbWEvYW1sb2dpYy1kbWEuYwo+IEBAIC02MjAsNyArNjIw
LDcgQEAgc3RhdGljIGludCBhbWxfZG1hX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4gIAlpZiAoIWFtbF9kbWEpCj4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gIAo+IC0JYW1sX2Rt
YS0+ZnJlZV93cSA9IGFsbG9jX29yZGVyZWRfd29ya3F1ZXVlKCJhbWxfZG1hX2ZyZWUiLCAwKTsK
PiArCWFtbF9kbWEtPmZyZWVfd3EgPSBkZXZtX2FsbG9jX29yZGVyZWRfd29ya3F1ZXVlKCZwZGV2
LT5kZXYsICJhbWxfZG1hX2ZyZWUiLCAwKTsKPiAgCWlmICghYW1sX2RtYS0+ZnJlZV93cSkKPiAg
CQlyZXR1cm4gLUVOT01FTTsKPiAgCgpbU2V2ZXJpdHk6IE1lZGl1bV0KVGhpcyBwcm9ibGVtIHdh
c24ndCBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBzaG91bGQgYW1sX2RtYV9wcm9iZSgp
CmNoZWNrIGFtbF9kbWEtPmlycSBmb3IgZXJyb3JzIGFmdGVyIGNhbGxpbmcgcGxhdGZvcm1fZ2V0
X2lycSgpIFsxXT8KCmRyaXZlcnMvZG1hL2FtbG9naWMtZG1hLmM6YW1sX2RtYV9wcm9iZSgpIHsK
ICAgIC4uLgoJYW1sX2RtYS0+aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKICAgIC4u
LgoJcmV0ID0gZGV2bV9yZXF1ZXN0X2lycSgmcGRldi0+ZGV2LCBhbWxfZG1hLT5pcnEsIGFtbF9k
bWFfaW50ZXJydXB0X2hhbmRsZXIsCgkJCSAgICAgICAwLCBkZXZfbmFtZSgmcGRldi0+ZGV2KSwg
YW1sX2RtYSk7Cn0KCklmIHBsYXRmb3JtX2dldF9pcnEoKSByZXR1cm5zIGEgbmVnYXRpdmUgZXJy
b3IgY29kZSBzdWNoIGFzIC1FUFJPQkVfREVGRVIsCnBhc3NpbmcgYW1sX2RtYS0+aXJxIHRvIGRl
dm1fcmVxdWVzdF9pcnEoKSBjb252ZXJ0cyBpdCB0byBhIGxhcmdlIHVuc2lnbmVkCklSUSBudW1i
ZXIgdGhhdCBmYWlscyB3aXRoIC1FSU5WQUwsIHR1cm5pbmcgcHJvYmUgZGVmZXJyYWwgaW50byBh
CnBlcm1hbmVudCBwcm9iZSBmYWlsdXJlLgoKWzFdIGh0dHBzOi8vc2FzaGlrby5kZXYvIy9idWcv
bGludXgtYmVjMTU3NmEtNjZmMi00MzI4LThjMDEtMDgzNmMwZjYzZDJhCgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTExMjE1MzQ5
LjE5ODM5MDktMS1sZWVAa2VybmVsLm9yZz9wYXJ0PTUKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
