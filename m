Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E927606A31A
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Oct 2026 13:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hncpxgfo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PSLYybxi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0/Z6QeMxwrhCLXshd6vpm5wIuQJgivi2f9Ljvu/gnDY=; b=hncpxgfoo05k1NH6eyEELQTKMf
	zNAYVNAnZDDCMDFEWS9WDBN450qmB05CjsVqcgTcWl1UWDLC/XRZhNH/bSkvhzX/BpVr92jBtUghM
	7bNRLyZpqnsylnzKLVpLtOFIZNQCYUpN1p8oGlUb60pZcLh4ld3U4h6AeaXAsz49d5gVna9cq1g3z
	XgpzaBR9o6tJIemxO1GZrg+WLPu0WstjBaubtnYXx8ECX9fd0pBcZ8ic3/rvRhWpCJUuJK1PPyp7g
	WL+pruwvt79ExD1qaj7sC9oRdenSDlq+awRgEw5/goWCUwCtff+ysxdtCNsRXULdV7kdtuOG5u7f2
	E1cBVFAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFe2-0000000GRFx-3y0f;
	Fri, 23 Oct 2026 13:49:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFe1-0000000GRFN-2y57
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Oct 2026 13:49:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 21FD740A7D;
	Fri, 23 Oct 2026 13:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03D11F01828;
	Fri, 23 Oct 2026 13:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792763357;
	bh=J5jLfRgfnru1f4M7HoIviw9jPxy8kFRXF0YNC8/6MY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PSLYybxiSnX2XIw1BFiB6WDnlAN5VaCR9EuyW/3jTSvjvew/o7UuLgHMxkxzqaNvx
	 nne7wobIlNsoiXs6RC22errueIbEOJCOhO51HLdXHXJ9CooqLXGX5tOCiLR7uSlKal
	 w5t7iH4+proFiBY8sVJxJaV9jd6F8xp2OVxG+K/fEku8q7Jom+tFKfrLUAA+Vgakfe
	 MnSmIQ0lZCfz1QcCWNrzzcDxGLsdzQvr9fNq4U4r3IMhE2UjIUNbAtREivaQv6ucEk
	 b42JRIFmPdNu7CWbG0Iml2dfk1vYiyKbPpfqvT9e79ucw8k7N4kGCiahmwS7Rv9czp
	 TNEIHTuDREyuQ==
Message-ID: <sashiko-outbox-182853@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/9] drm/bridge: pass extra events to the HPD
 callback
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261023-hpd-irq-events-v7-4-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
 <20261023-hpd-irq-events-v7-4-57a3aea3f09e@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:49:16 +0000
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHJtL2JyaWRnZTogbWlz
cGxhY2VkIGhkbWk1X2JyaWRnZV9ocGRfbm90aWZ5KCkgaHVuayBicmVha3MgYmlzZWN0aW9uCi0t
Cgpjb21taXQgYzQ5YTY1NTMwMzQ4Y2FlZjE0OTNjYWUzN2NlYWRiNTU5OWUyNzMzZQpBdXRob3I6
IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4KCmRy
bS9icmlkZ2U6IHBhc3MgZXh0cmEgZXZlbnRzIHRvIHRoZSBIUEQgY2FsbGJhY2sKClRoaXMgY29t
bWl0IGludHJvZHVjZXMgZHJtX2JyaWRnZV9ocGRfbm90aWZ5X2V4dHJhKCkgYW5kIHVwZGF0ZXMg
dGhlIEhQRApjYWxsYmFjayBzaWduYXR1cmUgcmVnaXN0ZXJlZCB2aWEgZHJtX2JyaWRnZV9ocGRf
ZW5hYmxlKCkgdG8gcGFzcyBleHRyYQpEaXNwbGF5UG9ydCBzaW5rIGV2ZW50cyB0byB1bmRlcmx5
aW5nIGRyaXZlcnMuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mv
aGRtaTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNS5jCj4gaW5kZXggYzU0
MmJhNmNlN2QzMi4uYTIxZjkzNTU1OTRjYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9kc3MvaGRtaTUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9o
ZG1pNS5jCj4gQEAgLTQyNyw3ICs0MjcsOCBAQCBzdGF0aWMgdm9pZCBoZG1pNV9icmlkZ2VfZGlz
YWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+ICAKPiAgc3RhdGljIHZvaWQgaGRtaTVf
YnJpZGdlX2hwZF9ub3RpZnkoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiAgCQkJCSAgICBz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAo+IC0JCQkJICAgIGVudW0gZHJtX2Nvbm5l
Y3Rvcl9zdGF0dXMgc3RhdHVzKQo+ICsJCQkJICAgIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMg
c3RhdHVzLAo+ICsJCQkJICAgIGVudW0gZHJtX2Nvbm5lY3Rvcl9kcF9ldmVudCBldmVudCkKPiAg
ewo+ICAJc3RydWN0IG9tYXBfaGRtaSAqaGRtaSA9IGRybV9icmlkZ2VfdG9faGRtaShicmlkZ2Up
Owo+ICAKCltTZXZlcml0eTogTG93XQpTaG91bGQgdGhpcyBjaGFuZ2UgdG8gaGRtaTVfYnJpZGdl
X2hwZF9ub3RpZnkoKSBpbgpkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTUuYyBiZSBz
cXVhc2hlZCBpbnRvIHRoZSBwcmVjZWRpbmcgY29tbWl0CjhmZGNhNGYzODAwMyAoImRybS9icmlk
Z2U6IHBhc3MgZG93biBJUlFfSFBEIHRvIHRoZSBkcml2ZXJzIikgaW5zdGVhZD8KCmhkbWk1X2Jy
aWRnZV9ocGRfbm90aWZ5KCkgaXMgYXNzaWduZWQgdG8gc3RydWN0IGRybV9icmlkZ2VfZnVuY3Mu
aHBkX25vdGlmeQppbiBoZG1pNV9icmlkZ2VfZnVuY3MgcmF0aGVyIHRoYW4gcGFzc2VkIHRvIGRy
bV9icmlkZ2VfaHBkX2VuYWJsZSgpOgoKZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk1
LmM6CnN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyBoZG1pNV9icmlkZ2VfZnVu
Y3MgPSB7CgkuLi4KCS5ocGRfbm90aWZ5ID0gaGRtaTVfYnJpZGdlX2hwZF9ub3RpZnksCn07CgpC
ZWNhdXNlIHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzLmhwZF9ub3RpZnkgaW4gaW5jbHVkZS9kcm0v
ZHJtX2JyaWRnZS5oIHdhcwp1cGRhdGVkIHRvIHRha2UgdGhlIGVudW0gZHJtX2Nvbm5lY3Rvcl9k
cF9ldmVudCBwYXJhbWV0ZXIgaW4gY29tbWl0CjhmZGNhNGYzODAwMyAoYWxvbmdzaWRlIGhkbWk0
X2JyaWRnZV9ocGRfbm90aWZ5KCkpLCBsZWF2aW5nIHRoZQpoZG1pNV9icmlkZ2VfaHBkX25vdGlm
eSgpIHVwZGF0ZSB1bnRpbCB0aGlzIGNvbW1pdCBjYXVzZXMgYW4gaW5jb21wYXRpYmxlCmZ1bmN0
aW9uIHBvaW50ZXIgdHlwZSBidWlsZCBmYWlsdXJlIGF0IGNvbW1pdCA4ZmRjYTRmMzgwMDMgd2hl
biBidWlsZGluZwpkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTUuYywgYnJlYWtpbmcg
YmlzZWN0aW9uLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYv
Iy9wYXRjaHNldC8yMDI2MTAyMy1ocGQtaXJxLWV2ZW50cy12Ny0wLTU3YTNhZWEzZjA5ZUBvc3Mu
cXVhbGNvbW0uY29tP3BhcnQ9NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
