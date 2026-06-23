Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DB7CDB470
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Jun 2026 20:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7EBzlfcQ8A1x0oIduoK7Gkkcr2cB3y3Cml0dWu80nA=; b=OXa6HCq8njBJMq
	h+CXlrjZQ+JH/NpfLzw1eUA2wyxSYBByaY0BRoDUqDiPwgtlfm8Fx/WD1yB4MVLZ3FdcraD2V1+I/
	3FoJ5XDufMP+T1CsnY6Q2OHnmiIqx9FofPVSXEuSh3ag20vF+BSb0p2x+o5fyGFjmerGd+cEW8Pju
	r0FNhHOSN9PMEDKHujVKv7d8Y/TtjAYq8v0NL91W6n9EJIaX0K0018RB4bVQ0kuZfklYN90QliOif
	CLurhxtM2W5eHRCwbd2FdIv7TwvEABibITFYBhTQ7ZX2Tt0lXCIFSCeDY4XWJe1E/mjlP3JG8WsgX
	EYKkNt6aOW2ix9KpZ/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7TJ-00000006pH5-0i7k;
	Tue, 23 Jun 2026 20:11:49 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7TG-00000006pGL-2vNJ
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Jun 2026 20:11:48 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-37dd266c32eso268038a91.1
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Jun 2026 13:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782245505; cv=none;
        d=google.com; s=arc-20240605;
        b=SacP+v7niGhVD35XuQ8ra8Sl3Ph4RCXUoOUWQcUkUYackygxT3hWM733lj/08zYe4o
         UP+2jpTUGECqxvaABRkWfDSKGjjHdpRGNpfhmrBZq1q0E4auzOhuujRpyoNdIMdp5Cpr
         KShYV2DYQvYlcLj+bN3i9wTIW/HKgDVd95xg2apGsK+w3sAHSIJrlru5HBNf8es3fsJj
         Jk0SO5TSJBu0jS+KhHtTgDRf3QK+ZlXjYLOGkJjLL25pdCYbVZnxeMieYgr2SkvbBKrL
         fSePtI/ef9YtyxTqwgu898hpecQkJw4b5cqomyey9/s2Dedf8m4+V98XJXQfJPUzzOaA
         VOQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=;
        fh=IFbo2LZ7bEpwKcAE2Ruir0HjYckUQH2H+JKfx/ynC/E=;
        b=OYEjNYNcdfTkrFhmS4LdmdjL3ISmiFcKYMQaLEbBzhCbsC6uhNVNxJEotmXLl+NyIv
         vWBdz2vrIHg5ga104HXfXRhI1FIxg2cnX+7dz+hQyzUp9FLr8p1j3dOSpO8nrEqFFY0J
         ejK9Jt/MQfZv1p0MdHhQTEDjYLQI5dgSY4DjRm7u/9gug4XPsSBLdZfxtjkh2+hYFwax
         MIy4iG15B4aN4XDgRUyqVXsYXzGxvqxew3yUagpqBBu1Lko5d3MvCLAkELA/v/kpE+lL
         YLpOCYXRo/oJ6p34J6g2sbfb3IWEkoAZjdjp3FsJOlK3LGtR1+g07wB5oAIMbK5RYQpv
         iXkg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1782245505; x=1782850305; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=;
        b=YEfSuNbwoUevmjLyt7Vr2+Sh6MhrQ/5vN9urd4FUcXBiRG8pAJINKSySAibmmHPWCT
         /F1izNBQqKyV1PWiz/dejlrs5yZzH6DJpjiB6WZexZpZ9tc9GLpTpDW4phf12HsotrLf
         8PYUrDZReeaDA3S7Uy/POOUvomcX2BDqkDAoacol8fbjIPb1oIDPTFck5klD6aGiL9BX
         JzaXpnxMGeV9KjWX1j31AH+1cwq2JmM8m45i46R1op/2GMqWOrDIc/v8rQNHUP1TZKyK
         c2da10JaoC4h7X/G60AUF6RbilXWWJL1JAPMDt4XvtYyCch/bXWJX6lkJOY0DTUZZDA9
         Hkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782245505; x=1782850305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=;
        b=ARoMuP8msMTEztDbHta4E3lNC4+pxBoWg8sIH6ercJ3V5RCFaYX89+TGZM+t/cp+Vs
         nEaeqH9KY8gGt96WRh2R0N7Q2ZLRjstCREu+KmTjr0oga9w7e8OVxzTiKJqgbk7l75Tl
         DiaQm7NZgpk/CzA81JTQd/yfzReI1LQ+fhxkWb2QHvS+YFHo0Ikdupv+0fSRwzlHPMZI
         m4s6foJFfpWvCw7mFRqZ1khdc7Krb/hGI7sUK8J36tog23FeKCEldP8UuN72yJibcfSA
         hcs4RtI+c0ZZ7uAm26Ab78GnQu8ubf/91gHbxXYjHARs0aFK4t1Sn8Pc4PCbUf+0gOJN
         nL5A==
X-Forwarded-Encrypted: i=1; AHgh+RqADlkIWf2/e+gyPOFaxCj4Yoy1M7Y0CS4hChMyLbB23qnwkxj1oGxSezY0OOlTvo4rU7QScEzS6PrDILlh@lists.infradead.org
X-Gm-Message-State: AOJu0YzXPd5deOPlKqRTwwuUbtXvPSG47ySLww/Q3gOhPFtur+EBnx/8
	mslp6v4FTwql5MAsV/ZLmNFpDoG/BM0TV9yvpNCUdID3bnQ3Bh8/enNxW4jtu2btUOLoqGuokzK
	Us1aRbC1Twh3dj6WN248AyEiqIuulyGs=
X-Gm-Gg: AfdE7cl6D2+N9OneOSUQiPpvZAO58c4H7rDnU6DxTV7Xg2X8Xtc26yJtxW6k1QGVaEU
	ENb4P0DDYkFgcttFMHnZfJ3m+l/ksHWHEYxOUSgc3jjoVh2e5qlrMT0tj4dY/U27gm7gNCtNC2r
	IPJmR5imPQPehj8U3wchu6vs9y6D4pgjmfn5VqNlGvMA/G7Fi/lhPNUrZ4A4XgQeeAtBcyzAt23
	kFpyWNRBxkFFMgcVh6EU5X1mcDU76LZTFvzuNX4v1pINcG/CsmIAngxCHNIU8RjbK7lu1RGlLNb
	DzeVGrpuXL0EBTYIWV4MR+3pF6UeUQ==
X-Received: by 2002:a17:902:ebd1:b0:2c0:e2ea:6b0c with SMTP id
 d9443c01a7336-2c7e14bda22mr4283265ad.21.1782245505106; Tue, 23 Jun 2026
 13:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org> <20260619-drm-no-more-bridge-reset-v3-54-ff399263111b@kernel.org>
In-Reply-To: <20260619-drm-no-more-bridge-reset-v3-54-ff399263111b@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 23 Jun 2026 22:11:33 +0200
X-Gm-Features: AVVi8Cfq-bHIbRBMSxAeraOZBrOtibTj2Lvi8RI8pWYRXkS8hq20ZIX0g5AznWw
Message-ID: <CAFBinCDJNGCsyRWS7KeXyHh4Fo0K6NX6sUuwdYRoCRoLn=Cx5Q@mail.gmail.com>
Subject: Re: [PATCH v3 54/78] drm/meson: encoder_cvbs: Switch to atomic_create_state
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
	dri-devel@lists.freedesktop.org, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_131146_793532_749447F6 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

T24gRnJpLCBKdW4gMTksIDIwMjYgYXQgMjoyN+KAr1BNIE1heGltZSBSaXBhcmQgPG1yaXBhcmRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGUgZHJtX2JyaWRnZV9mdW5jcy5hdG9taWNfcmVzZXQg
Y2FsbGJhY2sgYW5kIGl0cwo+IGRybV9hdG9taWNfaGVscGVyX2JyaWRnZV9yZXNldCgpIGhlbHBl
ciBhcmUgZGVwcmVjYXRlZC4KPgo+IFN3aXRjaCB0byB0aGUgYXRvbWljX2NyZWF0ZV9zdGF0ZSBj
YWxsYmFjayBhbmQgaXRzCj4gZHJtX2F0b21pY19oZWxwZXJfYnJpZGdlX2NyZWF0ZV9zdGF0ZSgp
IGNvdW50ZXJwYXJ0Lgo+Cj4gUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPgo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2Vy
bmVsLm9yZz4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5z
dGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
