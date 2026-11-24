Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498ED606A692
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Nov 2026 21:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jQ68c++o;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=gAXpA0I2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AuHxZKBEKkxVMfaigVtbB5tY8KKdPVTOrkUwZ1rE1QQ=; b=jQ68c++onJNlVrwglF4Rug6Yx6
	z3YUVFZzdlwsl23W/QdLkaBlD9D3p1Y2lM73ppeCXSQ3lsnLp8Dx9zw1v3CM5ojkr/IOEUeGevQzC
	FcfqXS8O+Vd1fJefOjSgWIeaqX7QsAONpor+NINea4+DQ+fgIDxw9gtp6lz6g0Iir6ANSlXXhcelz
	GuTcC/5wvsq5SWBBLAS6iPFYtmjoPQVqPuJMVtPJXJQabBAoZS4vlIvO9WRL/NMs+xDlecRVf6cYu
	uB0FdkhG/f3+axlpptgALjCBbdNi7Qytrmy6RlosTN2748gfMGCp0NSoSkLbsrBLN3KR933VzobIr
	kwk/CBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyDz-00000007tKu-3vZW;
	Tue, 24 Nov 2026 21:38:51 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyDw-00000007tIY-0mFP
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Nov 2026 21:38:49 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-8b30cbfa628so37609037b3.0
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Nov 2026 13:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795556327; cv=none;
        d=google.com; s=arc-20260327;
        b=bp0XCeRISCyqbdO1AK5S7tBaEUC2EjQh+vhCk1trxt3U0Jkt8ZP2O+gqJmM3a7Z+jn
         jUES6eq3h55IH0Eunqt+gqIC/oAZ03A9GTzbbzbAeSQzgIqRYMBc0OWFByO68ztc0xzx
         J+kkClkA2XZC251DrGCVRClDW7npR3iHS8Y2RFLWV5Rob9eF8b2ql/n+r/zZ2qsTEXkC
         5W6CHid28rKEBy/A+MWBCseijuM9D9xeDz79rcQrNNjFrtewkMemjKjKZqsrMJbVWvRZ
         gAbuRF+aAdu+Sv3FsaRqhsejU2gjGGEfM1V7oM8fFemdJgjisgYekPfrLmD5lVJv4ScU
         JBYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=;
        fh=X1jNX6ko9ACWhtyWYF+BFmygdBDT7G1O8e+O6POUBpE=;
        b=KlIYXUXYVv1Kymx1+y+F2Vv7U9JTGDEhR5AoVy5hC7UMucxmL/0+7uXxies4azR8lf
         bp4dhijH/j1EPN7dQTcUlYDiv5JuX4TLrbHdU8cZD56cE+DP3bcVpQXjkWSpsqRypEw1
         7KGS1UsxTsiEQuNs56Tz8D2jaDuaC0dWCOnS9Ksm9vN9s8QiA2lBDk09AgUE2simun1A
         DPUDbNK5EXWav18JgCMNf3Xz3s7gTKzRwECo775c7PCKX+Qbv37XKqZtuEXOB8Rt2Pqc
         f85jjXnCUQI4fWAC8QccIBD/my4aSz2P4l86l9Tt0fBo+rHQsFd42bH1hKc/4CxFzUNJ
         se9g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795556327; x=1796161127; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=;
        b=gAXpA0I2AaIOFL+9uv8+txjCVC4OfgsECIwIl5xNYB+YjQal0Fdznyh3i/QbGDA0Uv
         79cTAsc28aNHCGX361pGFc9OJZxTi+L545SctYl+PnQlrqHklLaBKlpJEYAIPCxN/0Rp
         49q1brAYT9k8A/NQhWJYaBcc1XcP2KctdQ/1GJcQilPpjZib76UVz+ghojDuMueaNshD
         s4ylws7PGz0Y/AXzkRFFIB++iutTZdvcy1t8ar+q8/XWJOHm1ic2JEuim9zYgzAUlzEi
         JA0lwL6z0kVyTTlG+JK09ZCLAnpscnJSaS6Y53kiVTnpSo0eSst0FNoSTDJd4r/wkVHE
         P6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556327; x=1796161127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=;
        b=kjYPSxREloSUfzaUS73WzwuUe8bhAKhGRN/26Ac+qkQKtnykAj56Nu/RyJ+cVRE1w6
         ffnbj5pNJdgTMRtNdHc2YhETLinGmWwRJTdXBgkZ44prglfNloNSEJ6AVgh9k7cw9p1s
         dzFuh/SKWoXz51pbOfSVoFKnprVxPPMnrkm6ZPGVC1xvYUZ/BlF9Bjc825VB138EGfKG
         BZXAdnjBAhLrEevWQUEETnnNtRPjau6RmA61k/zrMtK9uWF/3w9YEimbTH/CWCR/LXLQ
         ELzAVnqJyDc/YLCmtfRs0LAmohi6S5XtIcGSSi9Oht5dvtX6M3jxXpCbnc9SXnR7TlU1
         sbyA==
X-Forwarded-Encrypted: i=1; AL+hErH2IQdrLCgsqZstpsUATG7mfpAO2AGOSXNVRoBSE0QtBnWUyC+1Bu5NhGZFP+BeW/nSKPMsydg7YuHWKB6V@lists.infradead.org
X-Gm-Message-State: APuU4Z+gexlaOhS+HpGLqwq7365zi6uQJkGWSb+kP+XEdbOfIH2PBXk1
	2JTGO4SoqhJgQ9sqLfuBbxAX/EIo0d3d4ME/4SPbUXSYn+MYe/4tDy/0naz/nlXh9P9fNh3UNjJ
	bMOYzQTgMyyFKjOXuvhZTGfN1nyVRCtg=
X-Gm-Gg: AZFdTZeZwxxG62ubRk3TLFQy3fTVJwaSff9Og0P1ISibOMvNc2KfI6oGszKTE/9aPcp
	4NdwI+59ssFxNKFJhi4KMFhGO4qtjjxafNStJZrbR55hbPrKE16kdRxdYJY8R1YTlFpyEhktpg2
	pQVakjMAA89pk9E6/0TuraXaCDbr5kUD43f6FNlUmnK3Zff/IksJIr6fuwuQUgrPi1rRxmr2h7F
	g+jwF4+d/QiB0yXAmAYO9diRcyL0qSFlVHKTBTtilYTIGsXc9Y9Ptoe+MK12iRnURWxSobcKMpS
	19PYeJ7BAyCRzc20O7Dw14lKvtgSFjHj1fqFO30wX5CMgybjUGTOwa99l2YjwqOlX0OFRmP6J1S
	4DbeINdDEw2vujhJM8w347ZzRGYGh16zQVkvQU1bgzF/Izx7b0ZlurSyKN8m/f1cA9v+K5g==
X-Received: by 2002:a05:690c:a89:b0:8b4:c1ef:db88 with SMTP id
 00721157ae682-8b5204dc558mr63502567b3.40.1795556326911; Tue, 24 Nov 2026
 13:38:46 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-4-tanure@linux.com>
 <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
In-Reply-To: <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:38:36 +0100
X-Gm-Features: Aa3M54pH5ipmAt51OQad9aGPrJTAjEJ236HllU0tqVNlknXoe88HjErnJUF6ArA
Message-ID: <CAFBinCD+JwU4mdgE54r0_XT8K5eMt2rjKQ9+3Pnt9V2nviH-fw@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, iav@iav.lv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_133848_232996_9423884B 
X-CRM114-Status: UNSURE (   8.61  )
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMjQsIDIwMjYgYXQgMTA6MzfigK9QTSBNYXJ0aW4gQmx1bWVuc3RpbmdsCjxt
YXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPgo+IE9uIFNhdCwgTm92
IDIxLCAyMDI2IGF0IDEwOjMx4oCvUE0gTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPiB3
cm90ZToKPiBbLi4uXQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnRfbWRp
bzogbWRpb0AxIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZWcgPSA8MT47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKPiBMdWNhcywgSWdvciAoK0NjKSBoYXMg
dGFrZW4gYSBjbG9zZXIgbG9vayBhdCB0aGUgTURJTyBtdXgsIHNlZSBbMF0KU29ycnksIEkgZm9y
Z290IHRvIENjIGhpbSA6LSgKTm93IGhlJ3MgYWN0dWFsbHkgbG9vcGVkIGluCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
