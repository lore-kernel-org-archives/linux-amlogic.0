Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804E1C76196
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 20:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1cuDSpgPbweciRCr7XJqwCoFkiiqffLVzG7KC+D4fY=; b=OOcqSGzhJG6/Iq
	i5jfvzEgO9NJ5v1w0jlkAiGHvUhTTNhZbFIzrHHNf7OBsehgsyK6O4Aqr2rqccZ7WwT6V6r3WVA4d
	lVXGY4ln/bXFsHbFqJJgugLo6sun7pTRFEnxirWE8oS6veYFNUrPUnD5qIDTz37x2Ijgwyq4jt66h
	nz+3fuE+DH++mHZghjkL4Ljhjw9kHSiVVYFjmaVg/rtRgSDjaPYoxpH49FBQiJ3eGhmknUQwVVCLo
	W1drasLeWcBj3moTO+xkgHrothZ8vI8bfDkJC09hW9KVt3m3ozGLT5GHnJSyPJ0HccJihfV4Z9kgG
	0SsUFBso5SgPT3Lmt8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQxW-00GgI9-2B;
	Mon, 03 Apr 2023 20:39:22 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQxS-00GgEL-3C;
	Mon, 03 Apr 2023 20:39:20 +0000
Received: by mail-ed1-x529.google.com with SMTP id h8so122364385ede.8;
        Mon, 03 Apr 2023 13:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680554354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANuyucjG7+IOsm6+PTXTUkVZpuE117uxor/udrQsrHI=;
        b=QBtct7OF544g4KW8FmyicOGj93ZjWlg8zuQv1bJbp8jcg7kZlaoTEPE+ZjM8qK1FvF
         ySiNTF5dDqmcX7CK3V3nXjfCtZyZUPhXWS0tiyg1h2mmI68eIuECf75r+pVgglVEKCkU
         kHoMUTP0p53HT7ROKBpLFzTXIvLXbS7upHKKFV+6T4zuNMqbtyJ5qYvrMPN/aHFSnads
         mcQglHoBkCSFBXGMXHZCZrQSWHcr75YnbjUa66Tunz0FV33dyy00oLs71tZiNRBidtW4
         jtGUBV/KHY62/FaxcVx0/bdUCldUHFYapDx3Da/E+rJH3/2oHbH6x+g4Go250AzETWuH
         eyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANuyucjG7+IOsm6+PTXTUkVZpuE117uxor/udrQsrHI=;
        b=h7p6ogqEYKV9lNNLFqeGaPDhvPxXGm4tVumQEpAgS9xvJ+Sy+aEczRv6UuBpwzaHap
         JdF/r0KKyOUovZ0Yv3zWU1shnO1hsBhZWuVVbr7X/K+2fs9zMqwGsMoaSohrwLl+DzyR
         Eth2Xa3+V4wsx97rzYFsjP+GoRY1c8x+Qrs1EutU4CTq7mplygtgOfBoqVrgo3ECye8w
         zDLW0P6nyclBhcsQNZqs7KgqWIPPr3Ftw6RngBG6N+sU4wjP2ctG1F7zknAiiOXh2bdL
         z1eponaCgNKqCFffpOU4FRpIV3QnTjm8gX9W35U2vgam4PUcTrG4ewE/994T+2FguQKw
         Z+qg==
X-Gm-Message-State: AAQBX9fu+roQWOJDE3HKA7PZ4c3IfluLJpKYdWvkML7aIEah83yvdbqh
	gi/olfchs+q/HKNLG3wQ9w9jLpMi6sPRSLuAEe4=
X-Google-Smtp-Source: AKy350Yxps2lCxD4+gSI3XRR+EKyXbQm+2ZcypH1MgOjQt3rpacSMedZmkVztU2IZX24o5jZNqKukzBRTVyKq2STkzU=
X-Received: by 2002:a05:6402:a47:b0:502:3e65:44f7 with SMTP id
 bt7-20020a0564020a4700b005023e6544f7mr10506548edb.3.1680554354318; Mon, 03
 Apr 2023 13:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de> <20230402143025.2524443-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230402143025.2524443-2-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 Apr 2023 22:39:03 +0200
Message-ID: <CAFBinCBX8dQo9898KkXaMaanQ9-LcFA7HHFf+XBM2-f+g8WY7Q@mail.gmail.com>
Subject: Re: [PATCH net-next 01/11] net: stmmac: Make stmmac_pltfr_remove()
 return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
	linux-amlogic@lists.infradead.org, linux-oxnas@groups.io, 
	linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_133919_027160_BD91E7E5 
X-CRM114-Status: GOOD (  10.62  )
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

T24gU3VuLCBBcHIgMiwgMjAyMyBhdCA0OjMx4oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBUaGUgZnVuY3Rpb24gcmV0dXJu
cyB6ZXJvIHVuY29uZGl0aW9uYWxseS4gQ2hhbmdlIGl0IHRvIHJldHVybiB2b2lkIGluc3RlYWQK
PiB3aGljaCBzaW1wbGlmaWVzIHNvbWUgY2FsbGVycyBhcyBlcnJvciBoYW5kaW5nIGJlY29tZXMg
dW5uZWNlc3NhcnkuCj4KPiBUaGUgZnVuY3Rpb24gaXMgYWxzbyB1c2VkIGZvciBzb21lIGRyaXZl
cnMgYXMgcmVtb3ZlIGNhbGxiYWNrLiBTd2l0Y2ggdGhlc2UKPiB0byB0aGUgLnJlbW92ZV9uZXco
KSBjYWxsYmFjay4gRm9yIHNvbWUgb3RoZXJzIG5vIGVycm9yIGNhbiBoYXBwZW4gaW4gdGhlCj4g
cmVtb3ZlIGNhbGxiYWNrIG5vdywgY29udmVydCB0aGVtIHRvIC5yZW1vdmVfbmV3KCksIHRvby4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVu
Z3V0cm9uaXguZGU+Cj4gLS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L2R3bWFjLWFuYXJpb24uYyAgICAgfCAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL2R3bWFjLWdlbmVyaWMuYyAgICAgfCAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWlteC5jICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWluZ2VuaWMuYyAgICAgfCAyICstCj4g
IGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWludGVsLXBsYXQuYyAg
fCA5ICsrKy0tLS0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21h
Yy1pcHE4MDZ4LmMgICAgIHwgMiArLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9kd21hYy1scGMxOHh4LmMgICAgIHwgMiArLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy1tZWRpYXRlay5jICAgIHwgOSArKystLS0tLS0KPiAgZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVzb24uYyAgICAgICB8IDIgKy0K
PiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVzb244Yi5jICAg
ICB8IDIgKy0KZm9yIGR3bWFjLW1lc29uIGFuZCBkd21hYy1tZXNvbjhiOgpBY2tlZC1ieTogTWFy
dGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
