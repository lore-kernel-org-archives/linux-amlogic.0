Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCFC606A329
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 17:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aijL5WgP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Bebpf0X7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=phCBrW4rWw4r3XB4C2i45vnscA6fNHynXVaTvcgh2a4=; b=aijL5WgPh5VhzPyeeDY15tXZjI
	m2HJAZgJo7LP845mnM10KF7qGxRC8qqDraQxLCym6SKRXlC+W4iJUA7byJm0x5YWGjUyc9r/6koiU
	JsgphU2+zrM5oXl/tg2X0R00Fv4nFf00dp3kUOdaR4yScWgfc1aLloULaFhAmQWgtLlnR4DbYeTBa
	mU46R6LXyjRSZ5fGDEqe30zV/OJGMu2873RiyU/xoaLzYBDZTnxwVQpig2DfjbzUu3lcIN/WcrJQw
	BI8+nmH9oebEPr3Oe4lc+ANgWyNYuD0DQe0Lm1nGkFuvgJsuMB6q3FaKCEJtEIn1t9Jet9jjHkTKj
	wxehhEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeDu-00000000HIO-0cTk;
	Sun, 15 Nov 2026 17:41:02 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeDr-00000000HHQ-1Pxk
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 17:41:00 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-8b4bc216e9dso6157487b3.3
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 09:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794764458; cv=none;
        d=google.com; s=arc-20260327;
        b=pjh41FSo3MJprfCTbULzeKBreoS1xr+I4sy+rJNdzVoP7b4VexEXoj5KGw9pHMPaZE
         FVCsNS5qkGzLLi6kNLB1gqeSUqlSdKa0nHWp79J9KAiZeVdGxnZ7UHD/z/YYXzyFphOw
         hfq+mN46bOZVUymWTZKoS5Jg78eWa4ubT5+s9ZAk3n3zAucTN/pgFlLiICbz5zDwEYQx
         EdWdVUxKqWKPtNx0WaHkjWcqAyUOXIdksLU0r9i5buxUwdhivTWPJkqkm1p5a1xbpeEB
         hplf76YVpGZ+eRLy4+hdSxr5GolTJhzguEnpZHlVdGDKTcLojYEs0KOP+/7TuLFa394e
         LIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=;
        fh=mEpq/POWkiYRCJe+wOk/HP3eP51UZlRfgkO4KoeEi9M=;
        b=PqURXQsuISGXzL4QSJKKLUVao0OG94EU8iEi97aDTRZ3G7TBh/C11dnCwurnkaD2th
         VQYZxM2gPyIe8GtDf6pmoFy/9o9cvd5N3p78T5x4itdb4Zlq/4sWiuOs7ANBH5ffJqbK
         2Irwv2dsorOxaf5PxdRBOVYdM4mWiz+wrKsZPFov+kEpD/57UCERuAy6ut9w4uP8viIy
         n2TDh6mjUWkAKTkVsRzY3WX40AQspYcTslUtgtxXJJQMdce1QVYUNJaWeu00QlWqXuzP
         UMoT3nvH+wd4pQPeXRsSNKnTq5sqeYPdeGGJeN2SlYet2PncaeRINf2FTj0ggFGwRnqP
         v+hA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794764458; x=1795369258; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=;
        b=Bebpf0X7kgyFGzM5lm0Vcujrl8AzGCZwTiZbtQimgcNa8eT1QOSofpaHv3fUeWdGLZ
         +hD3fM23bXKX/bdBJU8CoEvslP7wqGri8ajyCNS4EJz2TPJHwF0Kpz1HrETGfAstSsLI
         zbmvjRZf8L2Bf9cO4x8ksxUxg9id7hj5M6Vc9EbD7SWaRH4VnaAxdH2z9jHgAhGmKkh+
         ni9ypzOFNfJ2XDucnqOAzURrl9DD6Hn/PvadwuP4VbEvZCFLgKDg0BZMttJNf4c8Qeyq
         Pswdyqirwp6OkMtXAdyS+ZV5NrCOeofAnfn8jNf6sognasocVCcJEn0YiCQn10yXRF0B
         A4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764458; x=1795369258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZtDJAkUGO4h7xgAUxHoKjPQ3R0J4TirtSzxxdjXhJhw=;
        b=gZf5Vi3VuG1ytMN+UWV1bYGZwi7DYYurqilZVh4WTzvU2Lo98ppU3aDW+uqpNL19FV
         4ikzIJutoJ9Hlo8fbpuXdwk2QJVzxQHmnm/h2Z3GNdKrj1EFSRmbIlsUkPKKCY3n05/j
         NlUaEEs6MNtqdV81F4hwTWjlcDewK6KnKoNkHUGycJsO9CBFDDccdc8JExExRmAC2MV7
         kwcQzCWs/TIBZyoBuqh3nVKb3JVeCc2gsmf8b7Fs+uUAGaihuZyIV7eW4zMOAkuUgR5L
         P4MHVtsAOkS71XtZWbGfBWQtlPPmQRJF8sswKVtgko4wW3JqQjgDFE4YoiXWxjcQLPVo
         dvmA==
X-Forwarded-Encrypted: i=1; AL+hErF6FCG2JFlqznwZkJUddCa5iCnt+bSnWeISrrKUlZYzzADPFExb2Z2m0S3/5iGbKJyjSe/Stm2OQOymGw7a@lists.infradead.org
X-Gm-Message-State: APuU4Z8+YKtrthrrMEUAEcEiMic8pb3JlSQ6cY+DaYaU0NmIlF6hDpGn
	ysyjAadO+ZJpH4cfxubxFHhO198RzC4aFu1b+ayos5R0He9rk3fiHexoozoHWVV44HLfpIv6/6/
	ehN87FvjdcheC4g1gvvkPKIWJF4/EJdQ=
X-Gm-Gg: AYBFou2rtkiWRtK3TUig0HsS6t0zlMuaG0W2Q6OFojKSuglpcgmr3qYjMchOUBvWGs9
	de1JYgnv9Xj6Mmp/ER+bWeylg50e2RJ2Pra/hdff04R8FRsDXpCpcCuVoTKZFGtz3Ng/x9S1h8q
	MkuFEl047i+ZYaJOu3BtXym1zvyYFmefcfOXgeVaxM/fNbvyvxY2utuadkWhnwnR5rDv0Yz9/z4
	qHopNaEmeM6hjbKlMYYOaNBJ21+pxLN3NLDXfKvjUsOYzLV2rgAaKQcthcO5oADTi/eU3PCv+53
	TI/Xa4Ss0eKSEna6MAO3PeyGjo7riAjHlPupJii7JWWGBsU6fCrabzOhmCaSsiMQDU+p7WGqmfJ
	QPBfmXJAH1eaHxQR22CG4rL1z2kv50xkrWyELpfLoAuGPSUrSE6QjtcKWvUfcm+0go6hvuw==
X-Received: by 2002:a05:690c:d87:b0:8b3:4911:2dbd with SMTP id
 00721157ae682-8b4aa2f3717mr45349387b3.54.1794764457708; Sun, 15 Nov 2026
 09:40:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-2-tanure@linux.com>
In-Reply-To: <20261113121852.334604-2-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:40:46 +0100
X-Gm-Features: AclHuK_keCn1frC4iKcAHTa13eQ5wSmPdFzN8zUCJ22f34lvfbzGE6mvQz0vUGQ
Message-ID: <CAFBinCBc6=XPXCuxNLug2mRrvrA0EebNgxgxeNOKgVB7d58o1g@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] dt-bindings: net: amlogic,meson-dwmac: list the
 compatible combinations
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_094059_376861_69C7C2B5 
X-CRM114-Status: GOOD (  11.09  )
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
bnV4LmNvbT4gd3JvdGU6Cj4KPiBUaGUgY29tcGF0aWJsZSBwcm9wZXJ0eSBvbmx5IGNoZWNrcyB0
aGF0IHRoZSBmaXJzdCBlbnRyeSBpcyBhbiBBbWxvZ2ljCj4gbmFtZSBhbmQgdGhhdCAic25wcyxk
d21hYyIgb3IgInNucHMsZHdtYWMtMy43MGEiIGFwcGVhcnMgc29tZXdoZXJlIGluCj4gdGhlIGxp
c3QuIEl0IGNhbm5vdCBleHByZXNzIHdoaWNoIGZhbGxiYWNrcyBlYWNoIFNvQyB0YWtlcywgc28g
YSBTb0MKPiBidWlsdCBvbiBhIGRpZmZlcmVudCBTeW5vcHN5cyBjb3JlIGNhbm5vdCBiZSBhZGRl
ZCB3aXRob3V0IGxvb3NlbmluZwo+IHRoZSBjaGVjayBmb3IgZXZlcnkgb3RoZXIgb25lLgo+Cj4g
TGlzdCB0aGUgY29tYmluYXRpb25zIHRoZSBkZXZpY2UgdHJlZXMgdXNlOiBNZXNvbjYgZmFsbHMg
YmFjayB0bwo+ICJzbnBzLGR3bWFjIiBhbG9uZSwgdGhlIG90aGVycyBhbHNvIG5hbWUgdGhlIDMu
NzBhIGNvcmUuIFRoZSBNZXNvbjhtMgo+IHJlcG9ydHMgYSAzLjcwYSBjb3JlIHRvbywgc28gaXQg
am9pbnMgdGhhdCBsaXN0OyBpdHMgZHRzaSBnZXRzIHRoZQo+IG1pc3NpbmcgZW50cnkgaW4gYSBz
ZXBhcmF0ZSBwYXRjaC4gVGhlIGV4YW1wbGUgdXNlZCBhIHR3by1lbnRyeSBmb3JtIG5vCj4gZGV2
aWNlIHRyZWUgaGFzLCBzbyBnaXZlIGl0IHRoZSBNZXNvbiBHWEJCIGNvbWJpbmF0aW9uLgo+Cj4g
U3VnZ2VzdGVkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+
IEFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxpbnV4LmNvbT4KUmV2aWV3ZWQtYnk6
IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
