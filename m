Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C376BC369DC
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 May 2025 21:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=erjAtyphwbV9W+tiB+O9gkyS/bKP1RNQZUL5wyKjPcI=; b=eGKMXVfsQiMUsY
	NIkjA15iSnU2GRDTkUGCiKxoKhn3hbcUJNeKuWYxZL9UPmq/GA1s1+pptpljZF7yk3mbLO+N5zEkM
	l8lJddtvUX94MBo3J33Cmv0Z6WvSdggTl7Eb4Dz/UtAa8B7udUwLnthI1fam9gezBGmQWrymb81kj
	gD7y8UhyLz65kMvVv4W7s1HjZfowrvcxr2Ye83QxDn4n+HwoxgWNKVXxZdAHxlDTPDsR4lzWaIeal
	btG1va91X8kW+BqEovKIFns47GsmENWIc/eAE8hmjnd+9Gun3Sq3hcj0zzrxkzrmqgXylJbiV0m0t
	aB9bvLTOx4Z0bc4/7oUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgXg-00000005xLq-1brA;
	Sun, 04 May 2025 21:06:32 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgXR-00000005xIC-3ke3;
	Sun, 04 May 2025 21:06:19 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22435603572so45044485ad.1;
        Sun, 04 May 2025 14:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746392777; x=1746997577; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7XMv7LIvPb7tqhoDTx4OKcxFQ5Z8THhrxnqY7emq7k=;
        b=MRyf4oTfLeLY4FN3RbCwx6QO4uBFvgziwS3LG0xqSH5+R6sJ6t+rQtrs05rMOskhFu
         KBOCE40Gq162vXS1BxsUvYh78na5+SDGWt+L6Dqsi3VER07iCTvWo5Ajm/R9bDFrVhQ7
         p3vcQKCpCT05Ov4VjnL7Kkb5toKvU9UHCJszV5MK2FbSckT+yxaafrfaT/cs/sQd+DnD
         3tne7RqbTXGkY1Jd60s3e1oOnJshW7h7NQfc5bmsEf+EB3vr94FCeEEmg/J4xQgnEYVa
         RiCSiJtka1JzwMtZ+8fxSCkiCvyg3esW3haKgJ2NNMOzs9nmxm3EcFixYLRWG20Mbzo7
         PkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746392777; x=1746997577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7XMv7LIvPb7tqhoDTx4OKcxFQ5Z8THhrxnqY7emq7k=;
        b=MlK74oAUtEY3r9vwdOYU25B/2z6smbGmjOwTjGNgvgtu3T8H5zKp7jJlqDjuQHpzwf
         FM3KGZSLtyH1F35t1gpE+9zv2ln8OwsQ1E2q1viP/toMljQczIlDq8zVCnKkIxgv/BPQ
         h9UT8ulkcjNqFQHJHqw7LCM48dGe3A3FUNw363QffT2hZ640LXIyPWGlygJWM4VQGTeX
         PRhbeeOXN2llP7tN0Wbifd8w+h9Qd+AF5eG7LRCujsICi/UmITNvI6BxNfwWMhR77wGQ
         s96iJK1Gk1zdTjMnUYOmfWYDc2oXCJxCCM6+nM62jAzk8iQtCzHi/XsIyJ8NTlX+lgcl
         J6hQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6nGd1N0BtcfNXVZXHnfOlPhrTuAqlc3O947P3ZrwMOVpjmDAyPD5eHQKPUPG8touql3cOoaBFPZWyJ8Kw@lists.infradead.org, AJvYcCXipTN2AGI79GUtiyJKu2neoVE22gG/SMNgOVbqbDOeV/wjZXkFMAbTNlZr1YzFTFnC6NzKmhmcjhR3KMwn/0VhFA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk1GBUDug4O3Jw/bBoAn6t071OtdSLcsSpbtDTvs+ksSyILjc5
	Q0PuU7rm8sEvqxjFbHG+79B/6qhYek3WuZbAmvZLc5TQC2f829CoeIUMGb727ZdoxcX4ry+zhBE
	r4ibFazpX1ZaHsfM4bM1qenzsM/o=
X-Gm-Gg: ASbGnctOj6qoFi4DGeIBUJtR1uYBDq9ezVwZqrUHfDk8osXEp3VKW+WG5yBIyrLaQK0
	BW9+GNPcsD43h8H3+KkaeLfTjoff+gvY7fEeYYzV+oNlkN3nfj1Wh+m1yNeI7r8FUeu4Qk0Uygt
	a9xXvRwDcq7p2HsMGiqKF3SYlX2oqNq8ZCOVsOd6ADR7szXrGaRPAMAKE=
X-Google-Smtp-Source: AGHT+IH+MEVsPdqEqxaolEpzZxyQFPKcfV4Aif9uF/lMz5vcLwENh3usDnJAXYsU/xVN5tXD/rnnCYtU/paPqSYdvtk=
X-Received: by 2002:a17:903:1b6b:b0:221:7e36:b13e with SMTP id
 d9443c01a7336-22e1e8e702dmr87722535ad.12.1746392776924; Sun, 04 May 2025
 14:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250429190724.330883-1-richard120310@gmail.com> <d5a8e781-6936-4c83-83d1-92daa2da8ca2@wanadoo.fr>
In-Reply-To: <d5a8e781-6936-4c83-83d1-92daa2da8ca2@wanadoo.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 4 May 2025 23:06:06 +0200
X-Gm-Features: ATxdqUEZVaon0qrNN_2-3htZD6nCAzznTNUIlmtX8rkJYKBTJ9BhwXmOhJS40AA
Message-ID: <CAFBinCCL6OQrbQ_UY_nhnbodN2TquuKPk9unhp3YjpR5u=EXag@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: Cast mode->clock to unsigned long long
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: I Hsin Cheng <richard120310@gmail.com>, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, khilman@baylibre.com, 
	jbrunet@baylibre.com, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_140617_933964_5F706FE5 
X-CRM114-Status: GOOD (  14.32  )
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

T24gVHVlLCBBcHIgMjksIDIwMjUgYXQgMTE6MDDigK9QTSBDaHJpc3RvcGhlIEpBSUxMRVQKPGNo
cmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPiB3cm90ZToKPgo+IExlIDI5LzA0LzIwMjUgw6Ag
MjE6MDcsIEkgSHNpbiBDaGVuZyBhIMOpY3JpdCA6Cj4gPiBDb3Zlcml0eSBzY2FuIHJlcG9ydGVk
IHRoZSB1c2FnZSBvZiAibW9kZS0+Y2xvY2sgKiAxMDAwIiBtYXkgbGVhZCB0bwo+ID4gaW50ZWdl
ciBvdmVyZmxvdy4gQ2FzdCB0aGUgdHlwZSBvZiAibW9kZS0+Y2xvY2siIHRvICJ1bnNpZ25lZCBs
b25nIGxvbmciCj4gPiB3aGVuIHV0aWxpemluZyBpdCB0byBhdm9pZCBwb3RlbnRpYWwgaW50ZWdl
ciBvdmVyZmxvdyBpc3N1ZS4KPiA+Cj4gPiBMaW5rOiBodHRwczovL3NjYW41LnNjYW4uY292ZXJp
dHkuY29tLyMvcHJvamVjdC12aWV3LzEwMDc0LzEwMDYzP3NlbGVjdGVkSXNzdWU9MTY0Njc1OQo+
ID4gU2lnbmVkLW9mZi1ieTogSSBIc2luIENoZW5nIDxyaWNoYXJkMTIwMzEwQGdtYWlsLmNvbT4K
PiA+IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9oZG1pLmMg
fCA0ICsrLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Vu
Y29kZXJfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfaGRtaS5j
Cj4gPiBpbmRleCA3NzUyZDhhYzg1ZjAuLmZlM2QzZmY3YzQzMiAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9lbmNvZGVyX2hkbWkuYwo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfaGRtaS5jCj4gPiBAQCAtNzUsNyArNzUsNyBA
QCBzdGF0aWMgdm9pZCBtZXNvbl9lbmNvZGVyX2hkbWlfc2V0X3ZjbGsoc3RydWN0IG1lc29uX2Vu
Y29kZXJfaGRtaSAqZW5jb2Rlcl9oZG1pLAo+ID4gICAgICAgdW5zaWduZWQgbG9uZyBsb25nIHZl
bmNfZnJlcTsKPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgbG9uZyBoZG1pX2ZyZXE7Cj4gPgo+ID4g
LSAgICAgdmNsa19mcmVxID0gbW9kZS0+Y2xvY2sgKiAxMDAwOwo+ID4gKyAgICAgdmNsa19mcmVx
ID0gKHVuc2lnbmVkIGxvbmcgbG9uZykgbW9kZS0+Y2xvY2sgKiAxMDAwOwo+Cj4gSGksCj4KPiBt
YXliZSwgdXNpbmcgMTAwMFVMTCBpbnN0ZWFkIHdvdWxkIGRvIHRoZSBzYW1lLCBidXQgd291bGQg
YmUgbGVzcyB2ZXJib3NlPwpBZ3JlZWQsIHRoYXQgd291bGQgbWFrZSB0aGUgY29kZSBtb3JlIHNp
bWlsYXIgdG8gZHJtX2hkbWlfY29tcHV0ZV9tb2RlX2Nsb2NrKCkuClRoZSBnb2FsIGlzIHRvIHN3
aXRjaCB0byBkcm1faGRtaV9jb21wdXRlX21vZGVfY2xvY2soKSBtaWQtdGVybSBhbnl3YXlzLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
