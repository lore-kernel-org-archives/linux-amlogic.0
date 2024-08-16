Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEA2C531DC
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Aug 2024 19:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCCVN/rVaK6MJlevjmRFbKinYqD8JS8yjeEZpm/eRX0=; b=rpN65I5tFegx4P
	TrfxacY94hAb068DwM5s20r3fxgamPrbRP91I5pEa+D5c+OLRJzy0W233aOt+gcTF9J5kI8afA7hh
	Hn297ZuvK2ayTLaKUR1Vm1Hhzn5GiU34oHxJJR5VQrZmg5lBCNFw8FOEisDu8WK8R5vOYkCfGBUSB
	pM8h+dopGyeh/MQXGXh/KOVLWQKNMTbystEy4hGFsxaxdZvmR5GvYuvRg9kOPLJXVERq1Oz6kkeOe
	yumNd1dP5iNhW0om08YTNRiCp59xhFnnuRkTkpT0uFvHjDYQkUdB11P640wfWiyXhhzR6EwDb9PS2
	DxA8SdTw4FFXG/tlP2YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf33B-0000000DyKk-3AI1;
	Fri, 16 Aug 2024 19:55:53 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf338-0000000DyKJ-09Cr;
	Fri, 16 Aug 2024 19:55:52 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-201ee6b084bso19641455ad.2;
        Fri, 16 Aug 2024 12:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1723838148; x=1724442948; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGWxg1wOx8lJ4g1VL18IcZyVgXvmEtS03cqmIV5LuWw=;
        b=SIXgGYcowED+Zv74/PaPXQt2jdpfHEzSlRiWGQh3T49okdlIElaaP9vv79jAi+xNKq
         ZQUdKjswQMkpIT4VvLofRpvM/fg8zoO3xXzeET0OZ0QRBU3OEhdX9w3jKAvTOkX5S9MQ
         PDBJMRXhBzpCfcSeiXynK7WQw0EEbSllrJYIk7pAGxucFUguY5A7T/6Sc3NMmtHi6OsH
         ADgbMzFLaGlnPmJz8iI5wtCIxtgFv70AEyi17NGijtYGYZUdmbljDCwegkS7DF36fL9B
         fBR12Dz8rtcYRrpLvI+rY3yIQ4Kj6qKrmymeT/WMr0m6JQYv7NYAc4odDUzm9AH11H0+
         9aZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723838148; x=1724442948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGWxg1wOx8lJ4g1VL18IcZyVgXvmEtS03cqmIV5LuWw=;
        b=WZDGyyLK/hsZ9YpUUyWJ9PqzNc6m5kLrVDq+rwE+yyshvPGuIEXadvydIiCv4vqVuZ
         6a6dngwWHw6RCq/fmXhCeyIk2gOc63gjrRWmkrLt3heSiurRpFeOxNlqPcclqhU6Oqrp
         ke39dxcDeTXNsyfrMGGsE3McSvf+jA7Chkavyz3dPI4eyeJoLCyZtFoCTTMy0EsO3WnI
         bkdgdImT5ZBMXMwb1E+UbPdTcBnZKa/2BoDHvqtQ+oMZHauj26KhOsETy1o8cy0Qj7gA
         BoxwcvWeX1/pHU3oJP4nBXqyTjlp0L8jz7yoeD2efrjDluK2OxgqDHPVHt3I0h6q5BEI
         OulA==
X-Forwarded-Encrypted: i=1; AJvYcCXW0CCQPTVE2nYgyBRXT1eRaedz8tq16lL6y0zCS/vbQ/VwvAOHBKiM2GYv9KTDCGOfnauHYTMgiX5UWos3rU7V4rFlzBiRTWLjYbfl7x+s9NAsl2pqMB/LaJlPU81PWKI3G0VDlg8eXA6A5bBP5V4QV3mYJJj2IQ==
X-Gm-Message-State: AOJu0Yy6E+3KrlRYcu3J2riucvA0HXXFoJOLHTumo972emC2pzin7EYO
	V13BpLt33GQQBStnUfkSsUwOdJeAzMYO+hnhwAvb0S0I2+bF9dTD5qFobSRsm8wH3oT/LExuecG
	tB49f/F1xf9IhqKvJRSXy9sI/VGQ=
X-Google-Smtp-Source: AGHT+IGH6vqIACm8gz7WSIiK1hLIMfs+2kbloGFsHHYX1GswdRuWB0AyXiwovzGrueJUPrhdZoQKawfIyTwS/JlzZ5M=
X-Received: by 2002:a17:902:ce91:b0:1fd:9e6e:7c1f with SMTP id
 d9443c01a7336-20203f514a7mr51522695ad.56.1723838147914; Fri, 16 Aug 2024
 12:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240809124725.17956-1-abelova@astralinux.ru> <CAFBinCATiUnR=P9VRBxWeQhf49k6PVxK+nU95G7w94f-mR2HWQ@mail.gmail.com>
 <bb45ed80-7871-47ba-a1fd-ee71dc21a409@astralinux.ru>
In-Reply-To: <bb45ed80-7871-47ba-a1fd-ee71dc21a409@astralinux.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 16 Aug 2024 21:55:37 +0200
Message-ID: <CAFBinCCW6E46+cMUC0M+n_4d7A6AhoJkQT=EHBxOD5wjn9O1hw@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: add check to prevent dereference of NULL
To: Anastasia Belova <abelova@astralinux.ru>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	lvc-project@linuxtesting.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_125550_097893_C976BE45 
X-CRM114-Status: GOOD (  16.15  )
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

SGVsbG8gQW5hc3Rhc2lhLAoKT24gTW9uLCBBdWcgMTIsIDIwMjQgYXQgMTE6MzLigK9BTSBBbmFz
dGFzaWEgQmVsb3ZhIDxhYmVsb3ZhQGFzdHJhbGludXgucnU+IHdyb3RlOgpbLi4uXQo+ID4gQXMg
YW4gYWx0ZXJuYXRpdmUgdG8geW91ciBzdWdnZXN0ZWQgYXBwcm9hY2g6IGNvdWxkIHlvdSBwbGVh
c2UgbG9vawo+ID4gaW50byB3aGV0aGVyIGRldm1fZHJtX2Rldl9hbGxvYygpIGlzIGEgc3VpdGFi
bGUgcmVwbGFjZW1lbnQgKGlmIG5vdDoKPiA+IGp1c3QgZXhwbGFpbiB3aHkgLSB0aGVuIHRoaXMg
cGF0Y2ggaXMgZ29vZCB0byBiZSBtZXJnZWQpPwo+Cj4gSWYgSSB1bmRlcnN0b29kIGNvcnJlY3Rs
eSwgZGV2bV9kcm1fZGV2X2FsbG9jIGFsbG93cyB0byBkZWxldGUgZHJtX2Rldl9wdXQKPiBmcm9t
IGVycm9yIHBhdGggaW4gbWVzb25fZHJ2X2JpbmRfbWFzdGVyIGFuZCBpbiBtZXNvbl9kcnZfdW5i
aW5kLgpDb3JyZWN0LCB0aGF0J3MgdGhlIGlkZWEuCgo+IFRoZW4gdGhlIHByb3Bvc2VkIGNoZWNr
IG1heSBiZSBvbW1pdGVkIGFuZCBmdW5jdGlvbiBtYXkganVzdCByZXR1cm4KPiBpbnN0ZWFkIG9m
IGp1bXBpbmcgdG8gZnJlZV9kcm0uClRoYXQncyByaWdodAoKPiBBbmQgd291bGQgaXQgYmUgYmV0
dGVyIHRvIHJlbmFtZSBmcmVlX2RybSB0byByZW1vdmVfZW5jb2RlcnM/ClRoYXQgZnJlZV9kcm0g
bGFiZWwgaXMgdmVyeSBjb25mdXNpbmcgYW55d2F5cy4KVGhlIHNob3J0IGFuc3dlciBpczogeWVz
ClRoZSBsb25nZXIgYW5zd2VyIGlzOiB3ZSdsbCBuZWVkIHRvIHdvcmsgb24gdGhlIHJlbW92YWwg
b3JkZXIgYWdhaW46Ci0gZW5jb2RlcnMgYXJlIHByb2JlZCAqYWZ0ZXIqIGFmYmNkCi0gcmVtb3Zh
bCBzaG91bGQgaGFwcGVuIGluIG9wcG9zaXRlIG9yZGVyIG9mIHByb2JlLCBzbyBlbmNvZGVycyBz
aG91bGQKYmUgZnJlZWQgKmJlZm9yZSogYWZiY2QKLSBob3dldmVyLCB0aGlzIG9yZGVyIGlzIG5v
dCBpbXBsZW1lbnRlZAoKVGhlcmUncyBubyBoYXJtIGZvciB5b3UgdG8gcmVuYW1lIHRoZSBsYWJl
bCBub3cuIEl0IGp1c3QgbWVhbnMgdGhhdCB3ZQpuZWVkIHRvIGRvIHNvbWUgbW9yZSBjbGVhbnVw
cy4KCkxvb2tpbmcgZm9yd2FyZCB0byB2MiBvZiB0aGUgcGF0Y2ghCgoKQmVzdCByZWdhcmRzLApN
YXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
