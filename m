Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3462C44515
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PwuESPVeFYR2gtGh328I89O2TMkxn3ZskRfppTPydko=; b=NQ5orE4x/GwldY
	MP0QvRpnGm13lNvmtoZztiP0k9aCKUYggM2OM8gEPoMh9c5Uokl8bwVjn/xidwyvTPNQDTi743sMb
	zZMPkjG53TmVw4mzWqmsPMK3DPPmeeMTXqU4mnq1cHwPIlwxHiCkEf8bgS8VTZukTGf1D0WnW+VI+
	SxwHDPpV29Sfl7dVU99syo2u81cJ3VG2I/9NbW1c3yQH8gRX2Mk82evhIbNsunJKLOhfQhxCdwfRW
	vbCzKZsiFzHomXRmmm95WLa+HWIUzVq6VyyLdkHEIfhmMjHowMKGJk7n4/gT0hZ2H/TZU8xMpMmGY
	1s57DsqTg6gzORpG6VLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqIL-00000007Gsf-33O3;
	Mon, 20 Jul 2026 15:52:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqIK-00000007GsT-30hF
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:52:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 21F4A43CE4;
	Mon, 20 Jul 2026 15:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 977A51F00A3A;
	Mon, 20 Jul 2026 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784562760;
	bh=nGdQxqcaIC04tyTye7SFtUtqtKsuT9hgPtoDK04EPgQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lgp+DB77KA0glEGY2KC3kK7SGwXXDWcymcYVLNkJX/iJPvDbZ/wjSCfHYtH9bA17q
	 RsePj2B38Hza3XWDiLs1CzU/fnLKX5bX62+fwvh06ja77yT7oJQQZi4WgZnNcziRSh
	 VU9BHGcpdQVURVCip3a40uIxVQxBDcFM40QjyPoJQPBYiP6j1ODf80N3JPqCK+XMDX
	 xR58yaP42uYK5BpHpcXXCtwzrg/sTDz8C5aYkyGtJXHFDS0xLBT5AyjFND6xAoAfep
	 b94bXG3sFn7ltkeJ/LAYihpSJB7yOeNE7aFPT0dHB/Y8bjZ1+lTlLG/ws9xZ8b3kDS
	 dXfYFDM0S5zqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/15] drm/exynos: remove dependency on DRM simple
 helpers
To: "Diogo Silva" <diogompaissilva@gmail.com>
Cc: Frank.Li@kernel.org, neil.armstrong@linaro.org, wsa+renesas@sang-engineering.com, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260720-drm_simple_encoder_init-v2-1-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
 <20260720-drm_simple_encoder_init-v2-1-5020b630668a@gmail.com>
Date: Mon, 20 Jul 2026 15:52:39 +0000
Message-Id: <20260720155239.977A51F00A3A@smtp.kernel.org>
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
IFtIaWdoXSBUaGlzIHByb2JsZW0gd2Fzbid0IGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCwgYnV0
IHRoZSBEUCBBVVggY2hhbm5lbCBhbmQgcmVzb3VyY2VzIHJlZ2lzdGVyZWQgYnkgYW5hbG9naXhf
ZHBfYmluZCgpIGFyZSBsZWFrZWQgaWYgZHJtX2JyaWRnZV9jb25uZWN0b3JfaW5pdCgpIGZhaWxz
LCBsZWFkaW5nIHRvIGEgVXNlLUFmdGVyLUZyZWUgKFVBRikuCi0tCgotLS0gUGF0Y2ggWzFdOiBb
UEFUQ0ggdjIgMDEvMTVdIGRybS9leHlub3M6IHJlbW92ZSBkZXBlbmRlbmN5IG9uIERSTSBzaW1w
bGUgaGVscGVycyAtLS0KY29tbWl0IGM0MDNmZGQ4MzhiNGRhYmJkYTE0MzEyZWI0NDljYjk3YTc1
NjY0NjIKQXV0aG9yOiBEaW9nbyBTaWx2YSA8ZGlvZ29tcGFpc3NpbHZhQGdtYWlsLmNvbT4KU3Vi
amVjdDogZHJtL2V4eW5vczogcmVtb3ZlIGRlcGVuZGVuY3kgb24gRFJNIHNpbXBsZSBoZWxwZXJz
CgpUaGUgc2ltcGxlIEtNUyBoZWxwZXJzIGFyZSBkZXByZWNhdGVkIGJlY2F1c2UgdGhleSBvbmx5
IGFkZCBhbgppbnRlcm1lZGlhdGUgbGF5ZXIgYmV0d2VlbiBkcml2ZXJzIGFuZCBhdG9taWMgbW9k
ZXNldHRpbmcuIE9wZW4tY29kZQpkcm1fc2ltcGxlX2VuY29kZXJfaW5pdCgpIGJ5IGNhbGxpbmcg
ZHJtX2VuY29kZXJfaW5pdCgpIGRpcmVjdGx5IGFuZApwcm92aWRpbmcgZHJpdmVyLWxvY2FsIGRy
bV9lbmNvZGVyX2Z1bmNzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RwLmMKPiBpbmRleCBi
ODA1NDAzMjgxNTA0Li45NTczODIyMjM5NTZhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcC5jCgpbIC4uLiBdCgo+IEBAIC05NSw3ICs5OSwxMiBAQCBzdGF0aWMgaW50IGV4eW5vc19k
cF9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpk
YXRhKQo+ICAKPiAgCWRwLT5kcm1fZGV2ID0gZHJtX2RldjsKPiAgCj4gLQlkcm1fc2ltcGxlX2Vu
Y29kZXJfaW5pdChkcm1fZGV2LCBlbmNvZGVyLCBEUk1fTU9ERV9FTkNPREVSX1RNRFMpOwo+ICsJ
cmV0ID0gZHJtX2VuY29kZXJfaW5pdChkcm1fZGV2LCBlbmNvZGVyLCAmZXh5bm9zX2RwX2VuY29k
ZXJfZnVuY3MsCj4gKwkJCSAgICAgICBEUk1fTU9ERV9FTkNPREVSX1RNRFMsIE5VTEwpOwo+ICsJ
aWYgKHJldCkgewo+ICsJCWRybV9lcnIoZHJtX2RldiwgIkZhaWxlZCB0byBpbml0aWFsaXplIGVu
Y29kZXJcbiIpOwo+ICsJCXJldHVybiByZXQ7Cj4gKwl9Cj4gIAo+ICAJZHJtX2VuY29kZXJfaGVs
cGVyX2FkZChlbmNvZGVyLCAmZXh5bm9zX2RwX2VuY29kZXJfaGVscGVyX2Z1bmNzKTsKCltTZXZl
cml0eTogSGlnaF0KVGhpcyBpc24ndCBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1
dCBsb29raW5nIGZ1cnRoZXIgZG93biBpbgpleHlub3NfZHBfYmluZCgpLCBpZiBkcm1fYnJpZGdl
X2Nvbm5lY3Rvcl9pbml0KCkgZmFpbHMsIGRvZXMgdGhpcyBjb2RlIGxlYWsKdGhlIERQIEFVWCBj
aGFyYWN0ZXIgZGV2aWNlIGFuZCByZXNvdXJjZXMgcmVnaXN0ZXJlZCBieSBhbmFsb2dpeF9kcF9i
aW5kKCk/CgpDdXJyZW50bHksIGlmIHRoZSBicmlkZ2UgY29ubmVjdG9yIGluaXQgZmFpbHM6CgoJ
Y29ubmVjdG9yID0gZHJtX2JyaWRnZV9jb25uZWN0b3JfaW5pdChkcC0+ZHJtX2RldiwgZHAtPnBs
YXRfZGF0YS5lbmNvZGVyKTsKCWlmIChJU19FUlIoY29ubmVjdG9yKSkgewoJCXJldCA9IFBUUl9F
UlIoY29ubmVjdG9yKTsKCQlkZXZfZXJyKGRwLT5kZXYsICJGYWlsZWQgdG8gaW5pdGlhbGl6ZSBi
cmlkZ2VfY29ubmVjdG9yXG4iKTsKCQlyZXR1cm4gcmV0OwoJfQoKVGhlIGVycm9yIHBhdGggcmV0
dXJucyBkaXJlY3RseSB3aXRob3V0IGNhbGxpbmcgYW5hbG9naXhfZHBfdW5iaW5kKCkgdG8gcm9s
bApiYWNrIHRoZSBlYXJsaWVyIHN1Y2Nlc3Mgb2YgYW5hbG9naXhfZHBfYmluZCgpLgoKU2luY2Ug
dGhlIGNvbXBvbmVudCBiaW5kIGZhaWxzLCB0aGUgbWFzdGVyIERSTSBiaW5kIHdpbGwgYWxzbyBm
YWlsLCBhbmQgdGhlCmNvbXBvbmVudCdzIHVuYmluZCBob29rIChleHlub3NfZHBfdW5iaW5kKCkp
IGlzIG5ldmVyIGludm9rZWQuCgpXaGVuIHRoZSBkZXZyZXMgZnJhbWV3b3JrIGxhdGVyIGZyZWVz
IHRoZSBzdHJ1Y3QgYW5hbG9naXhfZHBfZGV2aWNlLCBjb3VsZAp0aGUgc3RpbGwtcmVnaXN0ZXJl
ZCAvZGV2L2RybV9kcF9hdXhOIGNoYXJhY3RlciBkZXZpY2UgY2F1c2UgYQpVc2UtQWZ0ZXItRnJl
ZSBpZiBhY2Nlc3NlZCBmcm9tIHVzZXJzcGFjZT8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MjAtZHJtX3NpbXBsZV9lbmNvZGVy
X2luaXQtdjItMC01MDIwYjYzMDY2OGFAZ21haWwuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
