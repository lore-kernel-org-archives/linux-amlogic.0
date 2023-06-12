Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9622CC7EE23
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jun 2023 11:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XmBZ+ObBgUItWOK+L4P2e2HY5hIOIrhkiJEYaxrTzs=; b=sALxYZL/hbOaar
	A4wkld+FuuCcUIibVVR3xhp9zzSR+2zTpEf9pvPUzzfOh+Ht3k82QSRLcDJ/+lttDXmVB5lUjiQ5O
	Iyn93w0w177dwDm3/SsRWomE/cLhSPiAJk4gf2DtIap4rdbvtyi+9hZLRlEXH2hVM/zWkRoEOWbaf
	2auieIinK/DOfA1OTTlKUA3NiWzAmo8JgS5fQgjjUP7gaQDyqDkPtmoq5ZvSUV5L82oIPPg5E2dXz
	GoiVguWy+gHkXlXYV+zilMiWyRICtFHXFqt8KKnMw5wA2pe1km7lOeLEGhBhYVfBEQqkX5niqP4Ki
	Cgxh7sYq4kMlxVmWnutw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8fed-003kuD-0V;
	Mon, 12 Jun 2023 11:24:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8feX-003kpw-2h
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Jun 2023 11:24:07 +0000
Received: from localhost.localdomain (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: alarumbe)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C3CBE66003AF;
	Mon, 12 Jun 2023 12:24:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686569040;
	bh=1yMYjJpUmHOhxy9R4rRNyrik2fSSdpVqcKiFzvtx4yk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZY+cawUmLKjtJrnrlP4lrAs0A9eXlotbQBkBnrc5TuTaNc9ywRIDI8ujyxjQZEBZj
	 BEzJX+d/bFlExAP4lUAsP3XQ6sI88Y4FsatNgJbn5WOSO4QZnzKMSB9JR5jfOD9dFn
	 7oJxCGKrCYZ7RCuyIKbmEQn4fTiF+Eb5bnsnq5/lcZRszQZK9a0ci4D7qvbaP6EXHi
	 /Xk4k3cuMdTIm3aDuem3bXbiq/JDDPZ7K155BKbwLFVylFWuCBM4N75UByyipJl6wK
	 ZaiG3e1uLXY7c+sAGMraRFdnf1gl88aXSMNUI/jjwGQB4VZ7Mh0ElP/hAmoL2QZ6H0
	 7twRHJftb2W5w==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: narmstrong@baylibre.com,
	khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	rfoss@kernel.org,
	andrzej.hajda@intel.com
Cc: adrian.larumbe@collabora.com,
	kernel@collabora.com
Subject: [PATCH v2 1/3] drm/meson: dw-hdmi: change YUV420 selection logic at clock setup
Date: Mon, 12 Jun 2023 12:23:52 +0100
Message-Id: <20230612112354.4034489-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230612112354.4034489-1-adrian.larumbe@collabora.com>
References: <20230612112354.4034489-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_042406_070869_5A643DF5 
X-CRM114-Status: GOOD (  11.62  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

UmlnaHQgbm93IGNsb2NraW5nIHZhbHVlIHNlbGVjdGlvbiBjb2RlIGlzIHByaW9yaXRpc2luZyBS
R0IsIFlVVjQ0NCBtb2RlcwpvdmVyIFlVVjQyMCBmb3IgSERNSTIgc2lua3MuIEhvd2V2ZXIsIGJl
Y2F1c2Ugb2YgdGhlIGJ1cyBmb3JtYXQgc2VsZWN0aW9uCnByb2NlZHVyZSBpbiBkdy1oZG1pLCBm
b3IgSERNSTIgc2lua3MgWVVWNDIwIGlzIHRoZSBmb3JtYXQgdGhhdCB3aWxsIGFsd2F5cwpiZSBw
aWNrZWQgZHVyaW5nIHRoZSBkcm0gYnJpZGdlIGNoYWluIGNoZWNrIHN0YWdlLgoKTGF0ZXIgb24g
ZHdfaGRtaV9zZXR1cCB3aWxsIGNvbmZpZ3VyZSBhIGNvbG91ciBzcGFjZSBiYXNlZCBvbiB0aGUg
YnVzCmZvcm1hdCB0aGF0IGRvZXNuJ3QgbWF0Y2ggdGhlIHBpeGVsIHZhbHVlIHdlIGhhZCBjYWxj
dWxhdGVkIGFzIGRlc2NyaWJlZAphYm92ZS4KCkZpeCBpdCBieSBicmluZ2luZyBiYWNrIGR3LWhk
bWkgYnVzIGZvcm1hdCBjaGVjayB3aGVuIHBpY2tpbmcgdGhlIHJpZ2h0CnBpeGVsIGNsb2NrLgoK
U2lnbmVkLW9mZi1ieTogQWRyacOhbiBMYXJ1bWJlIDxhZHJpYW4ubGFydW1iZUBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgNiAr
KysrKysKIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgICAgIHwgNCArKy0t
CiBpbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oICAgICAgICAgICAgICB8IDIgKysKIDMgZmls
ZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCmluZGV4IDNiNDBlMGZkY2E1Yy4uZTZhNDU2
YjcyNjEwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhk
bWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwpAQCAt
MzM0Niw2ICszMzQ2LDEyIEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9wYXJzZV9kdChzdHJ1Y3QgZHdf
aGRtaSAqaGRtaSkKIAlyZXR1cm4gMDsKIH0KIAorYm9vbCBkd19oZG1pX2J1c19mbXRfaXNfNDIw
KHN0cnVjdCBkd19oZG1pICpoZG1pKQoreworCXJldHVybiBoZG1pX2J1c19mbXRfaXNfeXV2NDIw
KGhkbWktPmhkbWlfZGF0YS5lbmNfb3V0X2J1c19mb3JtYXQpOworfQorRVhQT1JUX1NZTUJPTF9H
UEwoZHdfaGRtaV9idXNfZm10X2lzXzQyMCk7CisKIHN0cnVjdCBkd19oZG1pICpkd19oZG1pX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCiAJCQkgICAgICBjb25zdCBzdHJ1Y3Qg
ZHdfaGRtaV9wbGF0X2RhdGEgKnBsYXRfZGF0YSkKIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25f
ZHdfaGRtaS5jCmluZGV4IDNkMDQ2ODc4Y2U2Yy4uYjQ5YmIwZDg2ZWZlIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKQEAgLTM3OSw4ICszNzksOCBAQCBzdGF0aWMgaW50IGR3
X2hkbWlfcGh5X2luaXQoc3RydWN0IGR3X2hkbWkgKmhkbWksIHZvaWQgKmRhdGEsCiAJCQkgbW9k
ZS0+Y2xvY2sgPiAzNDAwMDAgPyA0MCA6IDEwKTsKIAogCWlmIChkcm1fbW9kZV9pc180MjBfb25s
eShkaXNwbGF5LCBtb2RlKSB8fAotCSAgICAoIWlzX2hkbWkyX3NpbmsgJiYKLQkgICAgIGRybV9t
b2RlX2lzXzQyMF9hbHNvKGRpc3BsYXksIG1vZGUpKSkKKwkgICAgKCFpc19oZG1pMl9zaW5rICYm
IGRybV9tb2RlX2lzXzQyMF9hbHNvKGRpc3BsYXksIG1vZGUpKSB8fAorCSAgICBkd19oZG1pX2J1
c19mbXRfaXNfNDIwKGhkbWkpKQogCQltb2RlX2lzXzQyMCA9IHRydWU7CiAKIAkvKiBFbmFibGUg
Y2xvY2tzICovCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oIGIvaW5j
bHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaAppbmRleCBmNjY4ZTc1ZmJhYmUuLjZhNDZiYWEwNzM3
YyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaAorKysgYi9pbmNsdWRl
L2RybS9icmlkZ2UvZHdfaGRtaS5oCkBAIC0yMDYsNCArMjA2LDYgQEAgdm9pZCBkd19oZG1pX3Bo
eV91cGRhdGVfaHBkKHN0cnVjdCBkd19oZG1pICpoZG1pLCB2b2lkICpkYXRhLAogCQkJICAgIGJv
b2wgZm9yY2UsIGJvb2wgZGlzYWJsZWQsIGJvb2wgcnhzZW5zZSk7CiB2b2lkIGR3X2hkbWlfcGh5
X3NldHVwX2hwZChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwgdm9pZCAqZGF0YSk7CiAKK2Jvb2wgZHdf
aGRtaV9idXNfZm10X2lzXzQyMChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSk7CisKICNlbmRpZiAvKiBf
X0lNWF9IRE1JX0hfXyAqLwotLSAKMi40MC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
