Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C57E77198
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2025 20:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C58VQQ/Btg6roRDD6GzFvj7Up/RISFMrSNxo3ZMNzuE=; b=nZHD8TtBu3Oo9Z
	ezhsRjZ761gQoasOjz8WQ2l7y8LgeBg6tp54hHEy5IRNa6nvxA8mmU71pOmZmO+qCjVcmMza13C0c
	xykPlhCFAwX6aSE701v3Ednkjqkq0614AfoyOroseTUYV7uGwSidhrjgOEuRYuYfIGz+wwCZMjJF+
	Cv/qUH+o4kgidAeo4ZsJ8SnIlK9JONMJg50+IhTzlEtl7dZJ4F4lN3OaEUPlE4HhAY/Py9SiQLYYb
	RzZUpmdgDn8pr9U2UVIea2/4k75jZ+DlkNjPKC16FLMqTyjwCMizyJrHYw7Wzaet3ehR+HVfOJY8G
	HTRcXe1ME+Fw6H+9SFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVGLj-00000006GQR-0Nf3;
	Tue, 07 Jan 2025 20:38:51 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVGKV-00000006GDP-3ErQ;
	Tue, 07 Jan 2025 20:37:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2167141dfa1so3100225ad.1;
        Tue, 07 Jan 2025 12:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736282254; x=1736887054; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1H/J3xaLiB+SOTacWZ1CrgmLpcpSfI8SMqoIoJuoKI=;
        b=iF/j12b5NooTA7UDTnd0x7fBdak8GfeqGnT+CXQ48fnLl1F2GqN5QqCMef73QCd/LY
         wNqes31Nmc4C8HD7xbsfrt3hWDnjHz3/UAQktvziu1vKINs+14vriR9deGqEhFoQuOES
         Ix0WMXteke4pppSTrzswG3u2Woi5HYAU/jRflw7SQgck8MPtgIbledwSqXtBDYKBiDV0
         CxHw4DlBwrU1B+vRZWejWY8UeEIHIJdsJ5EQaj9FHAmHx53SqO413PIEYY6CeaZpjBhV
         h1JTuJRtzQN039FhbyLT5sdTA/eLVaAyNywniTzXSrscf3OYqBJxJX+kyg5Iy1Th0ioe
         ZUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736282254; x=1736887054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1H/J3xaLiB+SOTacWZ1CrgmLpcpSfI8SMqoIoJuoKI=;
        b=n8G4mDcTcMuzhMUggmCLFD0WyGwPuBFVTV3EIsPY0pZ76ggwV7c6jJNqMqzasiQFCw
         RgFKKo55leTNkLhU1MAbpOW0wolOBXRnUvlrcmYZSS/FNGkcaSeSQoSeeZgGdrWzMxFm
         mTvDB/5tyLORpBs5Xoulmlj1UDiJMspyQ2oPWisXEe2aesoPgtv4I3uMjoDgBYodT8yQ
         mpRFx7Wn7S4G835MlvI4SdGUX5cI39NpUaGYOOKkyjqThRhbvACoB6ARZkxio5SiCcFN
         +JR4vgc1XlVIw/T8V+YXEqtIElDpy/rLjhkSRwtALdN5jjZP6/SP508EJBALs04dRSvl
         hpoA==
X-Forwarded-Encrypted: i=1; AJvYcCU5L+zPyuWKdXwQ5UXmGVCuBkHSsoaUoLtagRHQ2lYukyorJ2IiaB4GSYmsAqYceGzQxTi0jDJvpbGTjRyXLScz9A==@lists.infradead.org, AJvYcCWjeeWIQ1LTG5CaFRkr9Jubv93IgCipWM0DwEtflTQS0ma95WkJbS2RgMPeXiwqpSBRCWRZWYiK5gr+4kOJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxils9UaMpuNN0c/tUis8V51oCa2nk/h4qJRSvOXJWq2WFR0aBC
	GVXCz8HUopmH7AG01KkaoHSrvf21HWeP7JE7X2PFfNpM/fqgVw8Pi5YWo+nubVFsYHeEGanZdfJ
	sV20iihzYWpIdvyk2S2/9Y73eedE=
X-Gm-Gg: ASbGncsgpso01obfmoEc7eQ60HWwu8R+osWzLt7lc8NOx45adtxtNpTe6Ta1IZr44pS
	W4B8TyY6YRMR99hf0bNTI4FXjF9IFofKBPOD4ZlyppvKjo/fKmt+3
X-Google-Smtp-Source: AGHT+IFpy/zEv8gV0glc3e85eskiQiRjVRs6FkoV/+B0RRM/Pns1lF2tiJiK6t7vuZVqLlK8YkI/dPy0Q3JwAvn8b/M=
X-Received: by 2002:a17:903:41c6:b0:215:758c:52e8 with SMTP id
 d9443c01a7336-21a83c148abmr6677255ad.12.1736282254604; Tue, 07 Jan 2025
 12:37:34 -0800 (PST)
MIME-Version: 1.0
References: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jan 2025 21:37:23 +0100
X-Gm-Features: AbW1kvYyTE4JPE8j-clACseuWPbFM0gz7gQf2hau2axwDVbwPBqu3atU2f_bDWs
Message-ID: <CAFBinCCwASspnr2u94K=SqTaheS00zwJVjoHOO67-qgw8hNbcg@mail.gmail.com>
Subject: Re: [PATCH net-next] dt-bindings: net: Correct indentation and style
 in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Kalle Valo <kvalo@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Dario Binacchi <dariobin@libero.it>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Frank Li <Frank.Li@nxp.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-wireless@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_123735_815878_A86060C2 
X-CRM114-Status: GOOD (  10.39  )
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

T24gVHVlLCBKYW4gNywgMjAyNSBhdCAxOjU24oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQo8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IERUUyBleGFtcGxlIGluIHRo
ZSBiaW5kaW5ncyBzaG91bGQgYmUgaW5kZW50ZWQgd2l0aCAyLSBvciA0LXNwYWNlcyBhbmQKPiBh
bGlnbmVkIHdpdGggb3BlbmluZyAnLSB8Jywgc28gY29ycmVjdCBhbnkgZGlmZmVyZW5jZXMgbGlr
ZSAzLXNwYWNlcyBvcgo+IG1peHR1cmVzIDItIGFuZCA0LXNwYWNlcyBpbiBvbmUgYmluZGluZy4K
Pgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBoZXJlLCBidXQgc2F2ZXMgc29tZSBjb21tZW50cyBk
dXJpbmcgcmV2aWV3cyBvZgo+IG5ldyBwYXRjaGVzIGJ1aWx0IG9uIGV4aXN0aW5nIGNvZGUuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tp
QGxpbmFyby5vcmc+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9uZXQvYW1sb2dpYyxtZXNvbi1kd21h
Yy55YW1sICAgICB8IDE0ICstLQpGb3IgYW1sb2dpYyxtZXNvbi1kd21hYy55YW1sOgpSZXZpZXdl
ZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWls
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
