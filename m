Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F57606A330
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 17:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TV97W6oc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=pah1gaaT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bmYy4O4yXzsMyk/22CMEsSk2IJzvad4MBF72imngCKs=; b=TV97W6ocIft+aCnnhkfF0dF6o+
	mcebTbBGcPS4Gtat0JY0jY/FqIftVmVwCvWxRVxwurdCQXXbHtKCvo964bA1lqEwAgc4vhh/4kY/3
	CLfbohqE8/X2vxjoUltAkHE/5+Wqp0j61k9loa9LMiQHOftYljs9qm2yX0wFId+evVFYhcSWJAnPC
	IjAJ31LtdM2YD5GsKaH9cu73lSMnOKXQPBU1ALVz5gkj7rky4DaW5ZP2NaxLcdbj6h9qCMmyrFe6J
	0/5tEDNyux8L+NdnjwlbE0uXtdohXtPxd5jjNnGAc4+YsKmLQRdjkOSEsi545p1AcOdNDlwMZyELB
	tWncWd6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeVC-00000000IB7-14JH;
	Sun, 15 Nov 2026 17:58:54 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeV9-00000000IAF-32eQ
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 17:58:52 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-67db35e7953so344365d50.0
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 09:58:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765530; cv=none;
        d=google.com; s=arc-20260327;
        b=Brq8q2TbjMuGqIuFCHQwwKgRyvjz7zvudAYm215nIbthnkZhTu+9elxrUOGOZ9NFlG
         lSnZSMe8o+3ygGYteKLR7hxZjFN7i+8LeEkufxedvrhQb66E5Tc9V5omXYBUTFxLHk7c
         9kpXUAyM86pXLhirsShAlV3rdVw4PyV09AipKuzyL+QpHuc1+1B0xjnveYk8NrG+7w7A
         kjl0MZMelNMx/FgYGBsNvozZpHLAiZ3Gmpmd+E7ce6R5SuvnDzJptZxPO0E2LY/KDyC1
         91ysLSWJzhVmOawtIiQPMQF28VzGhzpBxGDwXzphCvKbnnYDkmNPrIIRvQt3hrIeRnEu
         5ZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=;
        fh=hBWTbwyMW8wdLfPqakieyq9wi0FlZNjiGCHLB4WM83o=;
        b=eK7U1Gflx2MIwvG0rrPW6iI4DhaPYYXXIPkIHIA6uQkxToOn8B1OBnJgolgPjgmDri
         HVSZ4aLYBfpBxpCRRObzyhL7Xc5zfs6zKUYaHoDnRtkZ+/9O7mNkdWnw6ovOwpy8xpKO
         stc20gkXaM/fxyxIJHWat1Cs/fEZQg+qGf7bmQ6gAb5wMBAAtgQ2o9CjRcUcim/nSygn
         Q2/kgzOOUyL6SwVMApktQ84DJzcQhAex/uJQM8G42MWmaOSQ91oMBo0lTFcF0G6yOMzm
         aUBbDnTNZsJ0gLBDA8iqRLD+9doKuFokPb3L0FzT7Ifx3/FpVf7hi/SRNb9m5rIPfevd
         Y7uQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765530; x=1795370330; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=;
        b=pah1gaaTvV0q540jY0p3hiN+oYnDKrruUVcQ7P8XOknqjKPHALuslGTMc3xQiDZ2k9
         o+jNlru4vvTKPXawOfO4iUkBGxqhCcE119HNf944Lx84IWpVVuPt2NkTWfCEYoDyN4UB
         7Ra4w9GW0Q22ZkUToWsmE7p3w/TP/mTaKRW10q/OW6P5y2gryR91Einih0424SpeBV29
         soNytJWX1JRbe4zOSaoOWw1nDYCh2EK24vF4xEhc5t3epivb2A/X6Tv1ULYZgNp72mr+
         SSRqFRdmsTk9vrE2U+n+/oEKStNICCsAeSZO0F3JhyBekFzKDLQ3qMLaupVhUwyQek41
         JIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765530; x=1795370330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWp2aJVNli7UAjXW6hoQg5j8XmpNfGNSR1QLPhqZgnU=;
        b=AehnPxtK+1rVSAoFFORFtJC7VFzimuMD3lfZZ+e7GfL2vYbUqTLoJNJKX3pN4kaeLu
         RLKKiVGJM3pB1TKMHrltlg3ndtPLuw8Ar2BOdnYFhXuIisH5naNwbUpVO9nYExjGNGUx
         6FTGIL4BvMX4UT06eu6bHL0LJNvYgcaerMaW4oO0Itzn4hUmXXDaWIwEpoEr++EqiJZM
         ENuoe/vZiFSE3bC299YQ0QGbZFz7JGxQlHcBaXGYQnlOw6LLLzK+NiS0Ot9sbogv9Xb4
         Kv2VG/hsepBCtSYV+WFIKDtssKmagVIFUj2XfUD8lrSsrbo85uBgfaVw0kHDUgQn9OoX
         y/gg==
X-Forwarded-Encrypted: i=1; AL+hErFgFXPQ4ZFiLBlgTCUoWrSaiA9atqUm5JYMDE04pfc8ezze76ggM9TBHygqoClAibBJ4+XaZk4U2dJgRFIn@lists.infradead.org
X-Gm-Message-State: APuU4Z92LgU5P3iUGcYJa0nYPmDyAN5iYjdtPhjtssvYWMC/AFed9uHg
	lBEPKgBoFV/2ZK8omCFfAzYxEMxtNsWPzfX2sg1pcEuvukv8N+AI2CXtJXnItNo9sS2eVdyM8D5
	8axmmNjpTGOQWTJ6d5b6JN4xITwRsRcA=
X-Gm-Gg: AYBFou1dElWpuTpG/vdpEfAtmm42hKcoHegpKiThfrwSXdYBC9s8H2biqQvWv176AR3
	O0ZhGQjhC8U3ykqlvE4Cyfiu63qhRj32VpNRBIUlpl9/ynfUImI7KdT4+5eepYGwQrKCcdgbtwU
	EK3Ar5uvMQdY8q0YA0/Y5e+pkgZkhqmJeVXyIPZvxyJsebrVNlL9xSMC1aiBRMMivBdD1Hh2zem
	3DPUThb3tUcCWlHE33Vt+blkrUpy7tkQ0DSFu5hkypT1Ecfv/LZnFgq+BK6ubvl6x4x3M4LQh/u
	AxVojjzFoUEyweK8dm2p9hwz6wbd2ik7r6wFLnVP/ytS5s8R9czA65+dqyGSQzPT116slaG899F
	y/CTeYodV/9mWRDvnJt0X273Q56Y2P10CSsCvbbG3UOJrGVbKCh4cVPuAo7wdTm8HnsYX4JI=
X-Received: by 2002:a05:690e:118f:b0:67d:9fef:d61a with SMTP id
 956f58d0204a3-67d9fefe1a1mr1954166d50.8.1794765530625; Sun, 15 Nov 2026
 09:58:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-6-tanure@linux.com>
In-Reply-To: <20261113121852.334604-6-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:58:40 +0100
X-Gm-Features: AclHuK_i44pvTA9IYISQzdnNKpkNilY1KX3H0SN4TaP7nH1OVG2B38AEZw9Q2Eo
Message-ID: <CAFBinCBbL0F=2Wx66Ef11gUKHdz80vYrwjniMFRzeK-uiu5-rg@mail.gmail.com>
Subject: Re: [PATCH v7 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_095851_769872_168CB7F8 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgMTMsIDIwMjYgYXQgMToxOOKAr1BNIEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxp
bnV4LmNvbT4gd3JvdGU6Cj4KPiBUaGUgU29DIGJyaW5ncyBpdHMgZXRoZXJuZXQgaW50ZXJmYWNl
IG91dCBvbiBiYW5rIFosIGJ1dCBubyBwaW4gZ3JvdXBzCj4gd2VyZSBkZXNjcmliZWQsIHNvIGEg
Ym9hcmQgaGFkIG5vIHdheSB0byBoYW5kIHRob3NlIHBpbnMgb3ZlciB0byB0aGUKPiBNQUMuCj4K
PiBEZXNjcmliZSB0aGVtIGFzIHRoZSB0d28gc2V0cyBhIGJvYXJkIGFjdHVhbGx5IG5lZWRzOiB0
aGUgbmluZSBwaW5zIHRoZQo+IGludGVyZmFjZSBhbHdheXMgdXNlcywgYW5kIHRoZSBmaXZlIGV4
dHJhIG9uZXMgUkdNSUkgYWRkcyBmb3IgaXRzIHdpZGVyCj4gZGF0YSBwYXRoLgo+Cj4gUmV2aWV3
ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+IFNpZ25l
ZC1vZmYtYnk6IEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxpbnV4LmNvbT4KUmV2aWV3ZWQtYnk6IE1h
cnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
