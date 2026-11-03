Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B7D606A326
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 16:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TCaYmMKF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fzgOcz4Hh4GNqIovJIv5kjrlcXfYy8QRxFAUOrb3X74=; b=TCaYmMKFBtmjtEbeYt6VXZThxj
	6ZkFPP4krkKL14BaSgPwrD5A1XKXR70O4Pu/Apjsijlvyj5AhWw2vyC23N0pfgjVkGptRng0/m2uQ
	4ah1rPUDlrrYWAVbML1wsFsFkMVQ285hnsemxLIFMe7wrgi0/KXoyE3SP5gZt5YCIqOItb7IRle+y
	KJvUVkR+4cgsTHktuYNyAMH8lRtGOIrynJPWxlYtR0EFca/EYsXvA5sTs8P4NKXO0IxXqU4qUyGws
	xBjteqNEMQoo/U48XoeBnI9y/wSsyVHaj8r8OgcnQivjl/O83JNkFqLOkpPRsBaCJen7t0Tw8uMSm
	T7voga4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHPI-000000038DT-36ik;
	Tue, 03 Nov 2026 16:30:44 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHPH-000000038CW-0vPd
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 16:30:44 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ac525c1f05so41853037b3.1
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 08:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723442; x=1794328242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIKLXmDhQNqLB4Y+YR2V9D04+lvxRqYL6EpEyVAWUjQ=;
        b=cqC5/Y7EOqCU+s+b5gZU8nNWEwu0mS8Pp3kPOGLAYjPNvUpR0wznxiCIR4axG+RVsx
         uuAMwwQntOLaZVdVcNvadsuTUkSnSyXl50A45phshn0yeVN++7+w54/d9uaqAUMDUjHI
         Gj8C91X3s+3bfvgV1BG5ct0Q8wYGz6JEjN1AxdFe1nBfnxHe/2zKOw57YGLw/uPO+nLk
         py5iG2k0SyiSUIMbOmfezPzgKnjlCSRMhf9ZM4AfnvHhWzlJBxaqeDxjHvCCCbMn/BOy
         ULgR2sZ/rdCgaZxONgR4+VR395R8zWWkkkED/4CzpIULibQdfgT2tw6X745sFTRLSgHe
         Y5EA==
X-Forwarded-Encrypted: i=1; AKwUvBwPn9OgCseV6mLiPGNFhsI21H5+t9CtZzMEyLhHu1YwPyuWTY9GbLx4C66WJoYfcYH6bVq5ScfyNtX2DRYs@lists.infradead.org
X-Gm-Message-State: APuU4Z9rw8Vub5A4YIblmRStKfZhdhZzEKpP0VZ2yUMZUbWsxp4o3hL/
	n9gdgtuebK6IMcKmG525bTTNuougtZkuzS4//ti0EESLTzdnG4OYvugMrxhcM3lH6JM=
X-Gm-Gg: AYBFou3p0f0XDRHInGoUNkfnptScy1Ipiz0ipzUejHzvovpzTaePNQgwAkEP6tTWAoq
	N07BfiIbONK4N4PGHManCR6eqG8tK28Hp/kdALhjkpf3xOXZ4A6R8oUD7q8ltFovAWa/oXNn73h
	EXoOC1Q9SUlAKCoFTIsfL6M/h90bdRvMruG+HbdRjavdQlYgLVnrrAuwor0lnLHLREp9YXzcpya
	E3dlZzqdmD2vJ9ojshq+td/Gc5Z+v+76RN/JO7kXRGHgMX3oClxIEod7UE5ze12mItWjkbuHT18
	I9RQ9IzVopwgtWpjBRizQIrdbPF2NWikwTGZZGlvm660eiiVmTUB+TN7ZjMcIk2zLJts/f3YBIo
	ObcF75ztDlyj9MJ8RBhGtIR4HEjtDULcg6bTdBCuNaNEqvJY+LbExllY52z7LLn8+dnQKUtenDM
	nm938oeQm2217gLQOCmP3YJQDPN7YlFW9Rwe8SotQtfrMHRa3by9u/Pf+KyaWDRtO7sVBHkZOX4
	/aDo+qFUIHl9GNlNHOV/WEhTHo7pHL062p8Ey1unMXBA2ruqUonxs6l5eluGBw/6+c1sqwSk+mh
	BDtpumPuKrlyZRl1xw3ehXhGYY+jGkn6zasD/Och4EepFQq11U3rKbHGd6HHt69KVwhwATZYF+i
	rs3ns036Oz5+PickiVvW0
X-Received: by 2002:a05:690c:660d:b0:8b1:2b0b:eaee with SMTP id 00721157ae682-8b2b66c4c88mr96176047b3.20.1793723441738;
        Tue, 03 Nov 2026 08:30:41 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3098d3ceasm152567b3.13.2026.11.03.08.30.38
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:30:39 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b06c0794cfso40632417b3.0
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 08:30:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwMOKA8yBcHWpDRgGHsaX5OWoIs7Y9eI0sdddvuPugmDh4yViYkpy55SNGzWQFaTSyU3hFSE5E1RYw0h3OC@lists.infradead.org
X-Received: by 2002:a05:690c:91:b0:8b3:2b8:856 with SMTP id
 00721157ae682-8b302b80a2emr8226867b3.68.1793723438403; Tue, 03 Nov 2026
 08:30:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-4-tanure@linux.com>
 <c7d703f1-57fa-42cc-82fc-3e0aab05b71a@lunn.ch>
In-Reply-To: <c7d703f1-57fa-42cc-82fc-3e0aab05b71a@lunn.ch>
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:30:27 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+1=3ZRLX7B0UG+R5G74S6tVECPJV-MWcYfbU6nh=EOaug@mail.gmail.com>
X-Gm-Features: AclHuK--tXPcmW4jBK-98mKvizjMAJUNc7lOR6WXsrVb58UVKvwxXzerIoleZek
Message-ID: <CAJX_Q+1=3ZRLX7B0UG+R5G74S6tVECPJV-MWcYfbU6nh=EOaug@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] net: stmmac: dwmac-meson8b: add support for the
 Amlogic T7
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083043_259883_5AAD1E8A 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.8 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBOb3YgMiwgMjAyNiBhdCAxOjU34oCvQU0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPiB3cm90ZToKPgo+ID4gV2l0aG91dCB0aGF0IGdhdGUgdGhlIGNvbnRyb2xsZXIgY2Fubm90
IGRvIERNQSBhdCBhbGwsIHNvIGl0IGlzCj4gPiByZXF1aXJlZCByYXRoZXIgdGhhbiBvcHRpb25h
bDogYSBjbGVhciBwcm9iZSBmYWlsdXJlIGJlYXRzIGFuCj4gPiB1bmRpYWdub3NhYmxlIGhhbmcg
bGF0ZXIuCj4KPiBEb2VzIHRoZSBEVCBiaW5kaW5nIG1hcmsgaXQgYXMgcmVxdWlyZWQ/Clllcy4g
VGhlIFQ3IGJsb2NrIGluIHBhdGNoIDIgbGlzdHMgdGhlIGZpdmUgY2xvY2tzIGFzIGFuICJpdGVt
cyIgbGlzdAp3aXRob3V0IG1pbkl0ZW1zLCBzbyBhbGwgZml2ZSwgcGlwZWxpbmUgaW5jbHVkZWQs
IGFyZSByZXF1aXJlZC4KPgo+ICAgICAgQW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
