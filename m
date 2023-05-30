Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBF0C77B7A
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 19:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFMoUiL6vsaFQFn3WdN4KWU28BAP/70iX1Cnj0K9TrM=; b=n0mRq2awPUMEsg
	FQvswBOz6xTO3lN2S6wIW1U7U/AMj6yK+LM/jc/TsTSJq/aG2OrfJWoh+kfFBgcxSq0vjOIXWp6r4
	k31l2T0b9XX9DjsuYACm5dt0par8Xm8gXcW7ei6gYRExiZ/urXzrwoE47FiqqFDHcroAm3TdKFk9g
	+fYoSh/SKZLiqpms4fpQH02KE+TisCA20dsfwz+kXFaEhDbRfRjYC1Xg3ywN5BjqOB2y8kteB2LFM
	g6tHRU1fM4KAk7EfauVCg6WQTKV5QqkLKVkEizxGRVPuzWHWzpufCRC6XC7l8rjpg8Bld9x3PVxD8
	6zP74ue8Ygjb4LOz6aww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q458r-00EzTz-01;
	Tue, 30 May 2023 19:36:25 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q458o-00EzTI-1p;
	Tue, 30 May 2023 19:36:24 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f3baf04f0cso5520559e87.1;
        Tue, 30 May 2023 12:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1685475380; x=1688067380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEE5HR8KnTXDzE7qIjWjCheMHM5HqAaaQn2y8Q+rxV8=;
        b=IVNYUCmhiNFu0EgZ0lRI69pOYybAw0Roa8Zps1B2zd6CwZ7FdSroL2EOxDfml0hl2k
         qo04Uq1vSu9zxk3gbbRpCUq+kbB4EYsM4sMt9kIpzRVLpuenwvbcptbkDrlFjz12s+jq
         Scm6s+4dseL2zUnMkuF3CYBxGsMySIe2Fb7A5mFYMwNE68P9YxV/Fl9CbWB02Ef8mvKK
         ZitD/QzB1WKggCor0rhynySgN8NAXQQ+YISaEfdcnHBcfTYnBfKh+elXdbA0muZjv4WC
         WhNKhfsMy0lBtIqF9wiFwHe13B4CIBjJ2815jAkuozg8QmHhGJJdZtGzvf2u7K6N7b3l
         /Etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685475380; x=1688067380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEE5HR8KnTXDzE7qIjWjCheMHM5HqAaaQn2y8Q+rxV8=;
        b=ifwnwbriIMECwG+Fy+kPVQoVM4Q/r8Oz6zyrNBJ/9v8+iUWJKSFFo/jID6si+IUDoU
         REDXlEZN6UBR3zk812KHVa+MiTHZ84FBx7vB/fsxVqmBuvWJLm1sHtYs4GQIGvIXm7jA
         Et4eJ6DG4isr4Xvda5vvzqr98gRNEK6m5Zo7xIxIBSTAIX6/4+P7a8uaYo9bPDAAH0Lo
         VgUJydPy8He/57hgUBI+TGWJ5HCMtx37ldiSrkUfhTpuU7S+6UNxWTn0xoT/kzSNOXat
         88t7wgdO+Y9THy1TYmYgq3C0OPJtXgtJlXoWbFowsUWQJlvtYVudlOsLVu5F8GvgDhPa
         t/wA==
X-Gm-Message-State: AC+VfDw4zW9789icwt6GSGA6MHcwdyTH8VQ23y0QvSulacUIUM2qCKXQ
	GUekOp6D/u6FPLc2eSIEeTT1osXutDTpH2hfmmo=
X-Google-Smtp-Source: ACHHUZ5gc/hxHeYex2Y8Okc8JH1HtS8SizLAVO7CtDJbdkVMJw6syU7DTQmP8/PMv1wx+1QnYFOncA22xyJ5j/x0vzw=
X-Received: by 2002:ac2:4c13:0:b0:4f3:8258:5894 with SMTP id
 t19-20020ac24c13000000b004f382585894mr1358968lfq.27.1685475380186; Tue, 30
 May 2023 12:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-5-56eb7a4d5b8e@linaro.org>
 <1jv8ga445j.fsf@starbuckisacylon.baylibre.com> <c24502f9-f717-6ff9-211c-1d129ef02f24@linaro.org>
In-Reply-To: <c24502f9-f717-6ff9-211c-1d129ef02f24@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 30 May 2023 21:36:09 +0200
Message-ID: <CAFBinCD4nZPp4JKpGARBkWL5pKVHJ0GSLTvy3S_q9mF=1d37Kg@mail.gmail.com>
Subject: Re: [PATCH v5 05/17] clk: meson: g12a: make VCLK2 and ENCL clock path
 configurable by CCF
To: neil.armstrong@linaro.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Sam Ravnborg <sam@ravnborg.org>, "Lukas F. Hartmann" <lukas@mntre.com>, Nicolas Belin <nbelin@baylibre.com>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-phy@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_123622_624650_F2CF583C 
X-CRM114-Status: GOOD (  19.10  )
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

SGkgTmVpbCwKCk9uIFR1ZSwgTWF5IDMwLCAyMDIzIGF0IDU6NTfigK9QTSBOZWlsIEFybXN0cm9u
Zwo8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6ClsuLi5dCj4gPj4gVGhlIG1pcGlf
ZHNpX3B4Y2xrX2RpdiBpcyBzZXQgYXMgUk8gaW4gb3JkZXIgdG8gdXNlIHRoZSBzYW1lIEdQMAo+
ID4+IGZvciBtaXBpX2RzaV9weGNsayBhbmQgdmNsazJfaW5wdXQuCj4gPgo+ID4gSSBkb24ndCB0
aGluayBub3RpZmllcnMgaXMgdGhlIGFwcHJvcHJpYXRlIGFwcHJvYWNoIGhlcmUuCj4gPiBXaGVu
ZXZlciB0aGVyZSBpcyBjbG9jayBjaGFuZ2UgdGhlIG1vdGlmaWVycyB3b3VsZCB0cmlnZ2VyIGFu
IG9mZi9vbiBvZgo+ID4gdGhlIGNsb2NrLCByZWdhcmRsZXNzIG9mIHRoZSBjbG9jayB1c2FnZSBv
ciBzdGF0ZS4KPiA+IElmIHlvdSBoYXZlIHNldmVyYWwgY29uc3VtbWVycyBvbiB0aGlzIHZjbGsy
LCB0aGlzIHdvdWxkCj4gPiBjYXVzZSBnbGl0Y2hlcyBhbmQgbWF5YmUgdGhpcyBpcyBub3QgZGVz
aXJhYmxlLgo+ID4KPiA+IEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIGhhbmRsZSB0aGUg
ZW5hYmxlIGFuZCByZXNldCB3aXRoIGEKPiA+IHNwZWNpZmljIGdhdGUgZHJpdmVyLCBpbiBwcmVw
YXJlKCkgb3IgZW5hYmxlKCksIGFuZCB0aGUgZ2l2ZSB0aGUgY2xvY2sKPiA+IENMS19TRVRfUkFU
RV9HQVRFIGZsYWcuCj4gPgo+ID4gVGhpcyB3b3VsZCByZXF1aXJlIHRoZSBjbG9jayB0byBiZSBw
cm9wZXJseSB0dXJuIG9mZiBiZWZvcmUgY2hhbmdpbmcgdGhlCj4gPiByYXRlLgo+Cj4gU3VyZSwg
d2lsbCBzZWUgaG93IHRvIHN3aXRjaCB0byB0aGF0LCBzZWVtIE1hcnRpbiBkaWQgdGhhbiBvbiBN
ZXNvbjguCllvdSBjYW4gc3RhcnQgaGVyZTogWzBdCkl0IG1heSBub3QgYmUgdGhlIG5pY2VzdCBs
b2dpYyBidXQgc28gZmFyIGl0IHdvcmtzIChmb3IgbWUpLgoKUGxlYXNlIG5vdGUgdGhhdCBJIGRv
bid0IG1peCBiZXR3ZWVuIENDRiBhbmQgZGlyZWN0IHJlZ2lzdGVyIElPIGNsb2NrIGhhbmRsaW5n
OgpGb3IgdGhlIG9sZCBTb0NzIEknbSByZWx5aW5nIG9ubHkgb24gQ0NGIHRvIG1hbmFnZSB0aGUg
Y2xvY2tzLgoKCkJlc3QgcmVnYXJkcywKTWFydGluCgoKWzBdIGh0dHBzOi8vZ2l0aHViLmNvbS94
ZGFya2xpZ2h0L2xpbnV4L2Jsb2IvbWVzb24tbXgtaW50ZWdyYXRpb24tNi4zLTIwMjMwNDEwL2Ry
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMjTDExNzctTDExNzkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
