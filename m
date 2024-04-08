Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49672C67861
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 17:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+49AXypG9JXuUxmjFBo/ZIellzk0Oxw8yfej23BNtew=; b=YWzlr3yadG9cEK
	TYYgcL2eJBgZ24AUjfQ8LcEnKaOiSAvK7W9iwnv6wPg1nmUqW20WSExPIt7iz7BZGZsTZFq1lLsuY
	otbsZiPU6DxppPGQxdRA7Aa++qZiMl14CLumgdCXgC1ETr233EcDddFLlTF/SgbDfja++4Okfk5zj
	qPWnBimNWdrHqLV9e+V4GjzC7XNKDtqor5FZrLAOVouUTcru+5m4OrOC8D69Z/xsQtwq8uHx14iEa
	rEpLdBNoRwtameGhDxOj5ejwzeuIlvlDU2AG6W5sJc16gKcvkKcrWZ44cuhqr9Q3/B/aImBSQn7ID
	GVMIVpxS8SqmZiLbWUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsiV-0000000GKsE-2pxq;
	Mon, 08 Apr 2024 17:23:35 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsiT-0000000GKq6-04zN
	for linux-amlogic@lists.infradead.org;
	Mon, 08 Apr 2024 17:23:34 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e0b889901bso38190905ad.1
        for <linux-amlogic@lists.infradead.org>; Mon, 08 Apr 2024 10:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1712597011; x=1713201811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcVvRxxiaBcNW1+BR+h2UM8V37g0SRXH6IHzE1cH1Nw=;
        b=BpYehexaVXFR/OejFIsOECJnnp2+GLPd7jmpvZjXURaZBxKiOVEKa3oZiFGnVFGeF8
         6qSJTuUcmIfRbBGleNAUEI7xb40pmHyQT5NiRLYzntPnf9ARaJYHFTq8o0xKl/J3DLOD
         mrMXi6BURuaeQZucZJpNO+lzT9jOuJMd0/9zjodB88uU8vgAASdspsQli/iGQSJ+NFB8
         QCGmHF3IBxeqkV24Ov/1Lt+Wg79gyj51sy8Rldoeypz5Y0Ohe4t8KBe7U+HOTiL5w+bQ
         rPrn/Et5oj1sNxxVYy9CfKNGGroEyfywpMRO6qEuzRtoIX8YYtdgWPMHTUnAovzizUEt
         autA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712597011; x=1713201811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcVvRxxiaBcNW1+BR+h2UM8V37g0SRXH6IHzE1cH1Nw=;
        b=CuUvE5sV51A2QpiP+N2HFy8+gy0/jcOnkPg8NcY4SSvdyOm1qQEXsgQq7X5tOXEaxb
         i3gvstbjlTiC9nqQoSRHU3ESB/MQjRhSiEXmz8/whnDggW5J80UIcPgfs/slTxx5kFjt
         aLVa3xqHJueBm+53CLrr2iM2uPibBifdzma6BchmAhBnqj14NLP646/eau0yUt44hIjE
         xFUkxUIGUN6isuWPwNwdGvPLuYhlfPzw4YYV3dQmQpeePczMGyxw3Tb2PH6cG4l5JBhF
         g1YugZWhnRaSkBq9Rys//aaDiHkfwfwx9wsHEd6vaeHKEcwfTtjEm/pDY2ck/S5yZYRJ
         TzQg==
X-Forwarded-Encrypted: i=1; AJvYcCWagevI8ritQ0H+CJuGZ2jpcfm3F8qW4UCifoRflxx32CyW8GnSjGr4A0ke1vbYGAXnnpd6dvs6+y8jaT5DqNJKCL/tAwIFYVbCANpJsl342pc=
X-Gm-Message-State: AOJu0YwNChuc+/Pm81zBSA5a8QulqQ0PoVrUTsWvAHnsZvtog30fP9sE
	5m+2tcp5liX03DaOqYv5eGb1huUxuKm0wVmcxVghotI88VGP6dQI62rjn651KRH2uLCQbEda1F9
	lZ4AJ+Ds3P2I7pYom8PKAaPrkRM8=
X-Google-Smtp-Source: AGHT+IEuD5VAsrctZyUhSrQr4NgorCa6Lo18i8ORNmwHs0DLeNdSDuNNfzokMKvD131mITGtLGHOS0fNgbI5jK2I3UA=
X-Received: by 2002:a17:902:f68c:b0:1e2:23b9:ead3 with SMTP id
 l12-20020a170902f68c00b001e223b9ead3mr9321827plg.24.1712597010885; Mon, 08
 Apr 2024 10:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com> <20240408170426.9285-20-ville.syrjala@linux.intel.com>
In-Reply-To: <20240408170426.9285-20-ville.syrjala@linux.intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 8 Apr 2024 19:23:18 +0200
Message-ID: <CAFBinCAE_6RWikgpgBxhkq2pMyMiSSn2kYRKoG0+xfGtdRQiGQ@mail.gmail.com>
Subject: Re: [PATCH 19/21] drm/meson: Allow build with COMPILE_TEST=y
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_102333_182481_3C763535 
X-CRM114-Status: GOOD (  15.71  )
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

T24gTW9uLCBBcHIgOCwgMjAyNCBhdCA3OjA14oCvUE0gVmlsbGUgU3lyamFsYQo8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+IEFsbG93IG1lc29uIHRvIGJlIGJ1aWx0
IHdpdGggQ09NUElMRV9URVNUPXkgZm9yIGdyZWF0ZXIKPiBjb3ZlcmFnZS4gQnVpbGRzIGZpbmUg
b24geDg2L3g4Nl82NCBhdCBsZWFzdC4KPgo+IENjOiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1z
dHJvbmdAbGluYXJvLm9yZz4KPiBDYzogbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KVGhhbmsgeW91IGZvciBzcG90dGluZyB0aGlzIFZpbGxlIQoKPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL21lc29uL0tjb25maWcgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZXNvbi9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL0tjb25maWcKPiBpbmRleCA1
NTIwYjllM2YwMTAuLmQ4ZjY3YmQ5Yzc1NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVzb24vS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9LY29uZmlnCj4gQEAg
LTEsNyArMSw3IEBACj4gICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+
ICBjb25maWcgRFJNX01FU09OCj4gICAgICAgICB0cmlzdGF0ZSAiRFJNIFN1cHBvcnQgZm9yIEFt
bG9naWMgTWVzb24gRGlzcGxheSBDb250cm9sbGVyIgo+IC0gICAgICAgZGVwZW5kcyBvbiBEUk0g
JiYgT0YgJiYgKEFSTSB8fCBBUk02NCkKPiArICAgICAgIGRlcGVuZHMgb24gRFJNICYmIE9GICYm
IChBUk0gfHwgQVJNNjQgfHwgQ09NUElMRV9URVNUKQpOZWlsLCBJIHdvbmRlciBpZiB3ZSBzaG91
bGQganVzdCBoYXZlICJkZXBlbmRzIG9uIERSTSAmJiBPRiIgaGVyZSBhcwp0aGUgbmV4dCBsaW5l
IGFscmVhZHkgaGFzOgo+ICAgICAgICAgZGVwZW5kcyBvbiBBUkNIX01FU09OIHx8IENPTVBJTEVf
VEVTVApBUkNIX01FU09OIGlzIG9ubHkgZGVmaW5lZCBmb3IgQVJNIGFuZCBBUk02NAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
