Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B82C52D70
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2024 20:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUSs/JklzUHVmRI/RpmHQpb3WInv13Qx9i9M/TLcqIk=; b=s8nKUMDlHC/c7F
	DMUs/CnpCSceo7Xa9uW2YffedQOBIn+2N8zDpcagFe6X6eMmVobZeW5ojzSh87OtK/eAj0Ob7ML7Z
	Odcb0dqJVvznSVOvLsa9+aBcAjGmfUTfe44bqgnBjFzLmjhSY+0fQLhXpilTnIieArooJ/NKOTIk0
	wdiLMp6n1FjldGJHJ5l3bH/v7JlInWZCefoPJt6+2U+bdb29IJmntIgGNBdRt9s7iK89k5SR8WTw6
	nQhp12ru4KHjfarL/D6VmZphfIPTcA5ahSjgDnpIwmQa30qOS8qGAGzymN7TSZvBXB/92IO5XCHmD
	u9NdMOIoKhPAmu8TlZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbQjw-00000002nXi-2zSU;
	Tue, 06 Aug 2024 20:25:04 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbQju-00000002nWp-27YT
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Aug 2024 20:25:03 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1fc52394c92so11739355ad.1
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Aug 2024 13:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1722975900; x=1723580700; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/OZFOxNdt1/7u2anSXT4uxWU90giXBBt1zgEgss+ZI=;
        b=FKsSXmdKdcQhCpMQ7bEQd0V74+ikvsvxYDPOQTRRslYAo7cUrjbpgHxqhokT5V45Lc
         5weag8XiNfiJw/QWl0bb+7yCPJHZ2ElSPt+lztEmTiHmvQayAuF5Uz1yTbVGQlmhlXG9
         eE4ufxQAmtFhY8TYjd02Lb7IJ6DqAVw6XO64zu6YjGDApbYTDlmk4hrUgD139tTMQXYe
         Mmi7cpAIsjEYCENhCl1IceDtPfQ52jzDTnmKVpYuMPMGnNdO83clngL6cQnU2h54hvD+
         auHzEQJqiqRE0DPvrSVzCi71f6xzoyIYgMXlXB3cblb1EAIuCqt3HO3O4I07TchP6fPw
         Mz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722975900; x=1723580700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/OZFOxNdt1/7u2anSXT4uxWU90giXBBt1zgEgss+ZI=;
        b=Fo8ZjAZHjrbRbxd0rM5q45Vg9ftTjrEbSWvz8fNgkeQiDPu4qf4+z5KaiDWvGKYfJN
         QaxIVzVvjKaUEFAK+oi6MPRDKMA7xTPuzn8uvOU7uyjO4RJRB+wihOUxUkTy8HDT71o/
         CgVzmhcNbShIJkK/A1vZQOsdHwHAPqvtpgvlbXHMGFnTdb+cof1yDTDzSC91LGYamuhb
         teXCwiHOdnHHH0qDd0I74VdZtfo33/+89eGBEyKeLnmBCdibYKMpU9ayA2JjFMJWKoHz
         KLs94Nib3pc//aP1XValMuXMp+O5DGrUDbqf2X3sPJclL9On3kmv1p69oYC25uvwXyHm
         rOEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI4CdX/YtGx1pp1SDXSI+WXT22+dcZX6OZqhIZEragO0iGbXcOnVXlCwfQIZ+6KHFY6tjutV9g9V5/DHB1eEYfxFMGYELjRXSpE2eL8DpnrSw=
X-Gm-Message-State: AOJu0YwQprGFirPLPUIQ15EAUkPyDCGi8GTXBusMSIc2J5rAa30M8OGj
	SCO6OY0i2JTVIwnmtrvnJ+zW7GnvXHD/+jYeUxLN02RWod4rizCyKgTmdP+yy5nO6ZP0gfv0Mg3
	lBQ/UpO8J4N6lMyjJla33KEpzxXk=
X-Google-Smtp-Source: AGHT+IFlOXea9xY5WykUEmvYYAM8wx4DwXepEDxVhNlPibwTYKIK3m/8aLtBzWoY74h9NIrpPaky4Gm7SJWyH642cHA=
X-Received: by 2002:a17:902:f681:b0:1fd:73e6:83c7 with SMTP id
 d9443c01a7336-1ff573cc797mr178847085ad.48.1722975900222; Tue, 06 Aug 2024
 13:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240730125023.710237-1-jbrunet@baylibre.com> <20240730125023.710237-3-jbrunet@baylibre.com>
In-Reply-To: <20240730125023.710237-3-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Aug 2024 22:24:49 +0200
Message-ID: <CAFBinCB6x3cs3HvrZLaL+qpF1bfuMiRO0nywJPYDa+QUj3c3=Q@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/meson: vclk: drop hdmi system clock setup
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_132502_569730_1C643804 
X-CRM114-Status: GOOD (  10.17  )
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
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IFBva2luZyB0aGUgSEhJIHN5c2NvbiBpcyBhIHdheSB0
byBzZXR1cCBjbG9ja3MgYmVoaW5kIENDRidzIGJhY2suCj4gQWxzbywgMiBkcm0gY29kZSBwYXRo
cywgdGhlIGVuY29kZXIgYW5kIHRoZSBoZG1pLXBoeSwgYXJlIHJhY2luZyB0byBkbyB0aGUKPiBz
YW1lIHNldHVwIG9mIHRoZSBIRE1JIHN5c3RlbSBjbG9jay4KPgo+IFRoaXMgY2xvY2sgaXMgdXNl
ZCBpcyB1c2VkIGJ5IHRoZSBIRE1JIHBoeSBhbmQgc2hvdWxkIG5vdCBiZSBzZXQgYnkgdGhlCj4g
ZW5jb2Rlciwgc28gZHJvcCB0aG9zZSBISEkgcG9rZXMgZnJvbSB2Y2xrLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+ClJldmlld2VkLWJ5OiBN
YXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
