Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF10A60A5BCE
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 16:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ujB/b7XU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZceHfshw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MEx8wvpYZmI6TqxLa/GwKOYhKy/TXj8mYTyf3j481d0=; b=ujB/b7XUtsqDah/cW0JdaPOWTg
	8grehnOLzWl0vxiWifncWqmk6efOGKlbSlxHcTjeFumZnOWcyI5KrDSAgyDShM0gtJhE0+CZZu2Ab
	AumWvt1dZHxZ4qsTyt0LjaphkNulWesTtzc1xwhYvUuQ+p6kfckRY0MxCRUIiS+F0KsurYtOpK/uc
	xFG5p7caYn0RjJxmKC8vqsOMcNHpcjASDlEjPZbRI7ngYznCthQRF/fwEDYDMaBJX8kOYQp9b546S
	x6K8if9tOgGwHN61BCstpDGr7I9gFspbEnL+4Ffi/gQ5sAvZzsC20w9C8bG1qDnuGs/9V8athJzoW
	m6WsTkpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHXp-00000003BA5-2MP2;
	Tue, 03 Nov 2026 16:39:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHXl-00000003B6e-2QN5
	for linux-amlogic@bombadil.infradead.org;
	Tue, 03 Nov 2026 16:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=lM5wLY70mAhEd66eVg7LK8p6PaCJhmOslbKIqWnTrnc=; b=ZceHfshwkkUN836y9aSDYCYBoI
	wEesRMb49S6kOomKYCkh0RJKW9zPxhjtWABzvtCkMUFRuA0sEeoGFkoZjujsLxA7VTZwqW4gwtz7F
	8rkCydILr+WRCGdrFLvqY1XfVOFz9CU+G+ucM1yV8XlNBPZfLnhOulumSEgYnobZpy4oZTPNMgdkS
	2bEIvisLgCZlOX0Mhb2Wzskcg1k+wXOO9vE2XYuKzcVN3hO6/BIgSiZwuuWwQLetauzcOI71RSHCR
	blI/DGSlM6uWZfYdtLty2nRpS0U6j1C2cPNuIBYZ1gWxi1c8IFRwNR9PhrlZrDtZ4m1eQjKm0swRk
	etvIpJgQ==;
Received: from mail-pj1-f42.google.com ([209.85.216.42])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHXg-00000000iLj-2FTD
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 16:39:26 +0000
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so2771468a91.1
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 08:39:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723961; x=1794328761;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lM5wLY70mAhEd66eVg7LK8p6PaCJhmOslbKIqWnTrnc=;
        b=wEQA+RHokLem2Axza1f4tNTypQ4xyiViFMGbs1UfmQpBGDsBnKctJh1ZKyIgs+YhI+
         mrlBNkTW5GzEb3KXj8u0Zilaf3Z+fAyeTKk9HZQ67WPo442SqBuE+LLIUo9vo0gyyuyl
         2AQ3WEuMju4LVAQhScsnsfsGSSPHCe1F5oDsO9FJQ9BPSRHBFPOXYWJoyfAx3vkCEcWf
         HAgbAVPeYWWEfEFRC2dKrbxVkVxhUHte4ToS6WkESWdPAT40dquvFw1zyfngkk6pTz37
         ZrKAee2EH/oPCe3+7NuDU5M8TQ3+Kb2k2FgsphDypwF+QeoGp8QVnE5d87S2k4LRhZrR
         LvtA==
X-Forwarded-Encrypted: i=1; AKwUvBx5oyz1KqAV/8IN4UXUVMfPbGmX98Tr4REa5lYyqQDdjRvR4XjAv0lypffv2xm5AFQV/A8SOIr1Lo9pzhoU@lists.infradead.org
X-Gm-Message-State: APuU4Z8wry23ib0aVrH9vYjnpk6FnqCiLZCE2x1MBJANwGRqdivbaEaX
	ZxQ4YcFYg+RSW351yzcbslc/p9f6uBmRfgedq/vPx7EG9Y+FBwEvJWJLPcv1aoyPcecN/w==
X-Gm-Gg: AYBFou0n34MD7U+DXBVk2FUCTNZo1Q+z9C+coaulOkr9icwAxrg3xWXcnBJVLYXsSQD
	j9x0NPw4SqD7Lwlwu/qJ2fwNCVPovPWilNR2pBbDo1BYbgfCErgeQVdAXOWy1pGokmDJWAFUYLO
	6ojFaONQEnwEj+zQO0vDI4ZPJz/uITQEHq/hZr10LwrPWNQcFjJy1qcmS1tN2QWue2iDZIHeJBa
	dbbeJeRF8Cq1OZZ+FVlaZHtri9+flDSpuVye9EK5SDC8IyD5wxEudGp+VOAkWrMj6DSTAVmQpAJ
	lbiYS9FOlNjmmk/oLA+AQp1cif1t517bcRkllpKAYrwGX06q1novELfO4nf0n/3UY2TW/ywtpue
	GrlM8vvmDFJ/ROwV6OYTe8O/Uo8n7/ixUQTVJ0xzFKuFZv2BEyJQ1qDaIkO0BtTKA/GegSrnLei
	afTS5Hsqlw7G6wiGYCEsim0yMRbwur40PjAqi487UKAAkyPnPwzzjCYdHc4vpCFvckOyj4qZNYF
	cwtpVj2J/5cRAha6jVB3JCCwVkubnp+eKh70Zn/YS7GCbKrgg5fEViSFpZPTd5/UF5EydjciWF3
	vVKVoiGF/9wUyzBw/zpL/v4vIOCa8uXV5RgZdE2oU9QK0N0SY3J/TVQo/ivjKRshJZyrFqZ+NI8
	BEE0hcjXemazEG3vSge0uxz2oc/R+BCkM+Ezq4sNq1dYqyxhYd5Cd16XxLoZnPrbimTFM7zil
X-Received: by 2002:a17:90b:57cb:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3ae89744ca2mr11618787a91.25.1793723961484;
        Tue, 03 Nov 2026 08:39:21 -0800 (PST)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com. [74.125.82.45])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c29e619sm5297666a91.0.2026.11.03.08.39.21
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:39:21 -0800 (PST)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-170135e43c7so2728048c88.0
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 08:39:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzm+L5vY8kiMsdRogqxwIsKqHAz4o0yDhwW77842TxXOQX+0QkSs3ei9KKPpqJBLC7Cd24F7zjIG037bwpv@lists.infradead.org
X-Received: by 2002:a05:690c:6b12:b0:8b1:2b64:6fbd with SMTP id
 00721157ae682-8b2b68290bbmr97956117b3.65.1793723494365; Tue, 03 Nov 2026
 08:31:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-5-tanure@linux.com>
 <ce7d357b-8990-49bb-94c5-5491496f3ba8@lunn.ch>
In-Reply-To: <ce7d357b-8990-49bb-94c5-5491496f3ba8@lunn.ch>
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:31:23 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+38UPjtAxz6EsxWDaWTZFz-jTQ67WKFSLGrxmOeMaOLNA@mail.gmail.com>
X-Gm-Features: AclHuK8EDS_pThzfN9kbbX2pgEiup5lgKQS3IQZ5CGTtBeqTGSuccPA6dHYQQPQ
Message-ID: <CAJX_Q+38UPjtAxz6EsxWDaWTZFz-jTQ67WKFSLGrxmOeMaOLNA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
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
X-CRM114-CacheID: sfid-20261103_163924_543212_75E8D645 
X-CRM114-Status: GOOD (  22.04  )
X-Spam-Score: 1.2 (+)
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

T24gTW9uLCBOb3YgMiwgMjAyNiBhdCAxOjI14oCvQU0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPiB3cm90ZToKPgo+ID4gKy8qCj4gPiArICogRGVsYXkgaGFuZGxpbmcgb2YgdGhlIFNvQ3Mg
dXAgdG8gdGhlIEcxMkEuIEl0IHJlYWRzIHBoeS1tb2RlIGFzIHRoZQo+ID4gKyAqIGxpc3Qgb2Yg
ZGVsYXlzIHRoaXMgZ2x1ZSBoYXMgdG8gYWRkLCBmYWxscyBiYWNrIHRvIGEgMm5zIFRYIGRlbGF5
IGFuZAo+ID4gKyAqIHRha2VzIHRoZSB2ZW5kb3IgZGVsYXkgcHJvcGVydGllcywgYWxsIG9mIHdo
aWNoIGV0aGVybmV0LWNvbnRyb2xsZXIueWFtbAo+ID4gKyAqIHJ1bGVzIG91dC4gVGhlIGJvYXJk
cyBpbiB0aGUgdHJlZSBkZXBlbmQgb24gaXQsIHNvIGl0IHN0YXlzLCBidXQgYSBuZXcKPiA+ICsg
KiBTb0MgbXVzdCBub3QgdXNlIGl0Lgo+ID4gKyAqLwo+ID4gIHN0YXRpYyBpbnQgbWVzb244Yl9p
bml0X3JnbWlpX2RlbGF5cyhzdHJ1Y3QgbWVzb244Yl9kd21hYyAqZHdtYWMpCj4gPiAgewo+ID4g
ICAgICAgdTMyIHR4X2RseV9jb25maWcsIHJ4X2Fkal9jb25maWcsIGNmZ19yeGNsa19kbHksIGRl
bGF5X2NvbmZpZzsKPiA+ICsgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBkd21hYy0+ZGV2
LT5vZl9ub2RlOwo+ID4gKyAgICAgdTMyIHR4X2RlbGF5X25zLCByeF9kZWxheV9wcyA9IDA7Cj4g
PiAgICAgICBpbnQgcmV0Owo+Cj4gRG9lcyB0aGlzIGNvZGUgbmVlZCB0byBjaGFuZ2U/Cj4KPiBJ
dCB3b3VsZCBiZSBiZXR0ZXIgaWYgeW91IGRpZCBub3QgbmVlZCB0byBjaGFuZ2UgdGhlIG9sZCBj
b2RlLCBzbyB5b3UKPiBkb24ndCBuZWVkIHRvIHdvcnJ5IGFib3V0IGJyZWFraW5nIG90aGVyIFNv
Q3MuIEp1c3QgZG9uJ3QgY2FsbCBpdCBmb3IKPiB0aGUgVDcsIHVzZSB5b3UgbmV3IGZ1bmN0aW9u
IGluIGl0cyBwbGFjZS4KCk9LLiBJbiB2NSB0aGUgb2xkIGNvZGUgaXMgdW50b3VjaGVkOiB0aGUg
cGFyc2luZyBzdGF5cyBpbiBwcm9iZSBhbmQKbWVzb244Yl9pbml0X3JnbWlpX2RlbGF5cygpIGlz
IGFzIGl0IHdhcy4gVGhlIFQ3IGdldHMgYSBjYWxsYmFjayBvZgppdHMgb3duLCBhbmQgdGhlIG9u
bHkgY2hhbmdlIHRvIHByb2JlIGlzIGNhbGxpbmcgdGhlIGNhbGxiYWNrIGluc3RlYWQKb2YgdGhl
IGZ1bmN0aW9uIGRpcmVjdGx5LiBUaGUgVDcga2VlcHMgaGFzX3ByZ19ldGgxX3JnbWlpX3J4X2Rl
bGF5LApzbyB0aGUgZXhpc3RpbmcgcHJvYmUgY29kZSBhbHJlYWR5IHZhbGlkYXRlcyBpdHMgUlgg
dmFsdWUuCgo+Cj4gICAgICAgICBBbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
