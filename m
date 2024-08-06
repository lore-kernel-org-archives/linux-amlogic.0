Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A936DC52D71
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2024 20:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zh8iq05P2pmqQrHTC9B4p+Ps9XVw5nybsQzakRCJ6XY=; b=Iszz67tnG2R0+e
	Vi+h2bw3HKvUhZ6JaX3KsB17kpv9mBspBtZiaJ/zscZRMIIxS1Khv/SNnkWnllNXCpxpHVgnka4cF
	obTNoL5IfkMeisZ+U/KFC+9VjMdZQrx05K9R/KyMC5PmhBLIBABBxBAyqxx4OOLgRbDY80llF8ALF
	MImOknD+13wYWtzNY5qGjpGKYXaZrrZDi2OWxlwxbz8XUOl658J2X0vb+8kf2xrHD65ulwBm5exSl
	oXg6vtOjVhqQhSWhQKqLXhi/wkBoFFPvpWB7Ps4/PXxCC9RvIJZHD6graJ6e0MQN85St7A054iEFy
	VLiAQWyUYO0zKHzmpKEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbQny-00000002oMy-2rUO;
	Tue, 06 Aug 2024 20:29:14 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbQn8-00000002nw3-2wdZ
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Aug 2024 20:28:24 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1fc66fc35f2so1805165ad.0
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Aug 2024 13:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1722976101; x=1723580901; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NewxizV/QrE0bDS6mTJcWWeH0ghijd0o6ZQvUX6X8Co=;
        b=NyIuBJ8ut83TZTq9aDOLi/nx1Pak98yKImH/NDeYhlkkihcTtxWDRSVcs8UkVAjVx6
         3+gwwdhs4h50EJldxICQVIBUutNfFjJ8/KtZMtMI+NEVMnmMY+QEY+oIESqx22ra0uko
         geLh7ClgD9a3x5CNb+rdnnijyTTS2Eh+FEza8faEp7jQZ+L9UygVBbCnhS5Mv/e30nW6
         cMSZ2evdgbheGFq2B7Acb2tqRUJa46FAzak99GG7X7uR4DF85owRmtpX+LsUUQgwHrtz
         lbLvYx5FcrFd3Vme9jIu2Ay2bHUaHOA/Gg1xNaQ3demfWxdVWpA/hAaHLPFMrkn7JdBi
         /SFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722976101; x=1723580901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NewxizV/QrE0bDS6mTJcWWeH0ghijd0o6ZQvUX6X8Co=;
        b=GPzpLTEq6O9cyKDuyNn+xdGgVEsxTuK1hCReGqWtGIRi5ND+gkYAZW3PWSBKV2MtFZ
         Zha5rLeiA/i4hVW3wDCkKU/dw5Y5if6nOiOAdrfAjVr0csC+RdSsqV0+FwqlQdl4fUnx
         Q+VSnN00e/X7uYeP857vKfkWOh2eFFhhEK+oeFtuSlTK1IKBrXpR5MARhXKVSeeYQvt9
         eAWNCV0oBAQZj4T6O6Nfd3yVNF42/7qX4lPJlqYzvSt/W3u1tmIGlF+6cYJpi+J+8N5r
         xP3YQixmQJoLUHvshGoiNldEDagiCyiRF2FDK8iCgTvNCL/vh4bkZDKtnXPcP0bUQJVA
         6eCw==
X-Forwarded-Encrypted: i=1; AJvYcCVHv4Dxc3ZnirJxju0D+pAeA6e8lrB2MFdAqwNnoXiWFyjlnDjLLxh0MomdtnacZPJAHErmL4f15pDLvSyuwG4qTwuGl0vv7ltYwS/msDFZDVc=
X-Gm-Message-State: AOJu0YwjTNP9ybIH5MS3/oJGl3uTmfr/ekvJcLKzCIwBZimvlqPnF/VX
	PMhk7a/IR1uSH1wFOZMsNey8yVF0oURyabwSQsDoSoFg0+GaY3lshSsNMKS1nEYy3IA9LGwEojd
	Fwk5FLJQs0UF7vfPFT0umnQx0/ew=
X-Google-Smtp-Source: AGHT+IHJzplOe6T346XHNyXlXK1O9+ysbtzTM327nVE1L0ilozkYUPHpw1p+kyXVwiPZ5odozVxc038s2IOyIQTUyCU=
X-Received: by 2002:a17:903:1206:b0:1fc:253b:5951 with SMTP id
 d9443c01a7336-200853a50c0mr27695ad.4.1722976101123; Tue, 06 Aug 2024 13:28:21
 -0700 (PDT)
MIME-Version: 1.0
References: <20240730125023.710237-1-jbrunet@baylibre.com> <20240730125023.710237-4-jbrunet@baylibre.com>
In-Reply-To: <20240730125023.710237-4-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Aug 2024 22:28:10 +0200
Message-ID: <CAFBinCCW9bNtHLRaJNBvqLXN_vCm4mFSVhhV6OcrUb+j-0x3kg@mail.gmail.com>
Subject: Re: [PATCH 3/9] drm/meson: dw-hdmi: use generic clock helpers
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_132822_888406_5F507F18 
X-CRM114-Status: UNSURE (   9.32  )
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

T24gVHVlLCBKdWwgMzAsIDIwMjQgYXQgMjo1MOKAr1BNIEplcm9tZSBCcnVuZXQgPGpicnVuZXRA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IFRoZSBBbWxvZ2ljIEhETUkgcGh5IGRyaXZlciBpcyBu
b3QgZG9pbmcgYW55dGhpbmcgd2l0aCB0aGUgY2xvY2tzCj4gYmVzaWRlcyBlbmFibGluZyBvbiBw
cm9iZS4gQ0NGIHByb3ZpZGVzIGdlbmVyaWMgaGVscGVycyB0byBkbyB0aGF0Lgo+Cj4gVXNlIHRo
ZSBnZW5lcmljIGNsb2NrIGhlbHBlcnMgcmF0aGVyIHRoYW4gdXNpbmcgYSBjdXN0b20gb25lIHRv
IGdldCBhbmQKPiBlbmFibGUgY2xvY2tzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmVyb21lIEJydW5l
dCA8amJydW5ldEBiYXlsaWJyZS5jb20+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3Rpbmds
IDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKbm90ZSB0byBzZWxmOiBldmVu
IGlmIHdlIG5lZWQgdG8gbWFuYWdlIG9uZSBvZiB0aGUgY2xvY2tzIHNwZWNpZmljYWxseQp3ZSBj
YW4gZG8gaXQgd2l0aCBjbGtfYnVsa19kYXRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
