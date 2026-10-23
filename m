Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAF5606A31B
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Oct 2026 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vbEi/FXA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jzuAhy+/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=th8KUC9SpTuq6FNiK0Il1UpvDxK8GIsnA78VeKDpysc=; b=vbEi/FXASaQ9vV73YALGJDgbZs
	0ahCdByik8N6mdikUjXkvyFb5JBlIdb6WKs/JoAXvcpF9kDtNhLn/03Efax6v7V5Us99cYz6dpqLI
	2tNxibYmJEguXq5p6uaD1L0hSKgPygnwix7nZjCsv2QflyH6UceKLKeAR6x/j4ne1tZjLwPmhA+4u
	zyymF3BRGCwPw9Ih8kN+megC5eifnhoKFU4UGMIzOUSpiV4eWq9/bXgsu0kv3Wpr0g6zyz4UB8Q08
	8ObRqqchknWJSNHF/fWYfdaRFAeqX+/3MDuf9ayhRwVx2FR3uUJABN7QBKkorFljb1LJ3c45eK938
	ZGiCvkmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFdd-0000000GR9J-2hBN;
	Fri, 23 Oct 2026 13:48:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFdb-0000000GR8u-3uvr
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Oct 2026 13:48:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 62D8642CEB;
	Fri, 23 Oct 2026 13:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56951F01825;
	Fri, 23 Oct 2026 13:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792763331;
	bh=MQWn9R/Sdm3duYbyKyFhG1I7K4uNuiysT7qdpbhR5Ss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jzuAhy+/LdhVme5k+4ElEyE3+af0LcLSkSe0Ym0GA1n6rPqgtftNmI6Atnut0tFBT
	 nkDzNIkbXo/yn0dwcmOlmITxJqrKILt33epzd7M9Aiat0IYApoXbot/5FzJlbzC73X
	 wRCWSevgUmjn4miJcU3xaGq8jiYL0CA8cmL+I2ERd3KdC6enPr1wpZJcYvj4m0yBzW
	 swIVSSCC22v/p5FFaK47YMIY16y4fEdWmon6yZKOhYtb/gaOC/DJLs3cwqsT+6q4rb
	 3zP+ukqGVbOYQ5ytdr6anm+Ecx47Bw3wiVB75DGaJiVMqhJMWcZLB7V7Pkl+wcIPKY
	 M6AzllWsghiIA==
Message-ID: <sashiko-outbox-182852@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/9] drm/bridge: pass down IRQ_HPD to the drivers
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261023-hpd-irq-events-v7-3-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
 <20261023-hpd-irq-events-v7-3-57a3aea3f09e@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:48:50 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHJtL29tYXA6IG1pc3Np
bmcgZXZlbnQgYXJnIGluIGhkbWk1X2JyaWRnZV9ocGRfbm90aWZ5KCkgYnJlYWtzIGJ1aWxkCi0t
Cgpjb21taXQgOGZkY2E0ZjM4MDAzYTUxZTNkMzk4YWM0MDNjYjMwMGI0MjNhMGZmYwpBdXRob3I6
IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4KCmRy
bS9icmlkZ2U6IHBhc3MgZG93biBJUlFfSFBEIHRvIHRoZSBkcml2ZXJzCgpUaGlzIGNvbW1pdCBh
ZGRzIHRoZSBlbnVtIGRybV9jb25uZWN0b3JfZHBfZXZlbnQgcGFyYW1ldGVyIHRvIHRoZQpkcm1f
YnJpZGdlX2Z1bmNzLmhwZF9ub3RpZnkgY2FsbGJhY2sgc28gdGhhdCBEaXNwbGF5UG9ydCBJUlFf
SFBEIGV2ZW50cyBjYW4KYmUgcGFzc2VkIGRvd24gdG8gYnJpZGdlIGRyaXZlcnMuCgpbIC4uLiBd
Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNC5jCj4gaW5kZXggYmQ2YzRkMmRjZGM4Ni4u
NzI5NzJhNmZlOTg5YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mv
aGRtaTQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNC5jCj4gQEAg
LTQyOSw3ICs0MjksOCBAQCBzdGF0aWMgdm9pZCBoZG1pNF9icmlkZ2VfZGlzYWJsZShzdHJ1Y3Qg
ZHJtX2JyaWRnZSAqYnJpZGdlLAo+ICAKPiAgc3RhdGljIHZvaWQgaGRtaTRfYnJpZGdlX2hwZF9u
b3RpZnkoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiAgCQkJCSAgICBzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yLAo+IC0JCQkJICAgIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMg
c3RhdHVzKQo+ICsJCQkJICAgIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgc3RhdHVzLAo+ICsJ
CQkJICAgIGVudW0gZHJtX2Nvbm5lY3Rvcl9kcF9ldmVudCBldmVudCkKPiAgewo+ICAJc3RydWN0
IG9tYXBfaGRtaSAqaGRtaSA9IGRybV9icmlkZ2VfdG9faGRtaShicmlkZ2UpOwo+ICAKPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oIGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRn
ZS5oCj4gaW5kZXggMTk4MWQyNGE3MDBkMi4uNjM4MmVmNWYxZWEyOCAxMDA2NDQKPiAtLS0gYS9p
bmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgK
PiBAQCAtNTA5LDcgKzUwOSw4IEBAIHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIHsKPiAgCSAqLwo+
ICAJdm9pZCAoKmhwZF9ub3RpZnkpKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4gIAkJCSAg
IHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4gLQkJCSAgIGVudW0gZHJtX2Nvbm5l
Y3Rvcl9zdGF0dXMgc3RhdHVzKTsKPiArCQkJICAgZW51bSBkcm1fY29ubmVjdG9yX3N0YXR1cyBz
dGF0dXMsCj4gKwkJCSAgIGVudW0gZHJtX2Nvbm5lY3Rvcl9kcF9ldmVudCBldmVudCk7CgpbU2V2
ZXJpdHk6IExvd10KRG9lcyB0aGlzIGJyZWFrIGNvbXBpbGF0aW9uIHdoZW4gQ09ORklHX09NQVA1
X0RTU19IRE1JIGlzIGVuYWJsZWQ/CgpXaGlsZSBoZG1pNF9icmlkZ2VfaHBkX25vdGlmeSgpIGlu
IGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNC5jIGlzCnVwZGF0ZWQgaGVyZSwgaGRt
aTVfYnJpZGdlX2hwZF9ub3RpZnkoKSBpbiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRt
aTUuYwpzdGlsbCByZXRhaW5zIHRoZSBvbGQgMy1hcmd1bWVudCBzaWduYXR1cmU6Cgpkcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTUuYzoKc3RhdGljIHZvaWQgaGRtaTVfYnJpZGdlX2hw
ZF9ub3RpZnkoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKCQkJCSAgICBzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yLAoJCQkJICAgIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgc3Rh
dHVzKQp7CglzdHJ1Y3Qgb21hcF9oZG1pICpoZG1pID0gZHJtX2JyaWRnZV90b19oZG1pKGJyaWRn
ZSk7CgoJaGRtaV9hdWRpb19ocGRfbm90aWZ5KGhkbWksIHN0YXR1cyk7Cn0KLi4uCnN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyBoZG1pNV9icmlkZ2VfZnVuY3MgPSB7CgkuLi4K
CS5ocGRfbm90aWZ5ID0gaGRtaTVfYnJpZGdlX2hwZF9ub3RpZnksCgkuZWRpZF9yZWFkID0gaGRt
aTVfYnJpZGdlX2VkaWRfcmVhZCwKfTsKCkFzc2lnbmluZyBoZG1pNV9icmlkZ2VfaHBkX25vdGlm
eSB0byBoZG1pNV9icmlkZ2VfZnVuY3MuaHBkX25vdGlmeSBjYXVzZXMgYW4KaW5jb21wYXRpYmxl
IHBvaW50ZXIgdHlwZSBlcnJvciBkdXJpbmcgY29tcGlsYXRpb24gd2hlbiBDT05GSUdfT01BUDVf
RFNTX0hETUkKaXMgZW5hYmxlZCwgYW5kIGFsc28gcmVzdWx0cyBpbiBhIGZ1bmN0aW9uIHNpZ25h
dHVyZSBtaXNtYXRjaCB3aGVuCmRybV9icmlkZ2VfY29ubmVjdG9yX2hwZF9ub3RpZnkoKSBpbnZv
a2VzIGJyaWRnZS0+ZnVuY3MtPmhwZF9ub3RpZnkoKS4KCkl0IGxvb2tzIGxpa2UgdGhlIGh1bmsg
dXBkYXRpbmcgaGRtaTVfYnJpZGdlX2hwZF9ub3RpZnkoKSBlbmRlZCB1cCBpbiB0aGUKc3Vic2Vx
dWVudCBjb21taXQgYzQ5YTY1NTMwMzQ4ICgiZHJtL2JyaWRnZTogcGFzcyBleHRyYSBldmVudHMg
dG8gdGhlIEhQRApjYWxsYmFjayIpLiBTaG91bGQgdGhhdCBjaGFuZ2UgYmUgbW92ZWQgaW50byB0
aGlzIGNvbW1pdCBzbyB0aGF0IHRoZSB0cmVlCnJlbWFpbnMgYmlzZWN0YWJsZT8KCi0tIApTYXNo
aWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEwMjMt
aHBkLWlycS1ldmVudHMtdjctMC01N2EzYWVhM2YwOWVAb3NzLnF1YWxjb21tLmNvbT9wYXJ0PTMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
