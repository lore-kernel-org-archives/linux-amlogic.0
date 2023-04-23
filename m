Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE83AC6FD18
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Apr 2023 21:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ue6tBTOqDZk6vWTeZgK3y5TD9CxrlIwd3vyXAkuDEJY=; b=IWfomDsTtRNkJe
	VR05vVh2piFGmYSL0Xz4BUVAxykHSQkteTMilsn9RqEchC462ZWDpeWvXt2c1ZNn4CYHPyvYk1O6y
	LIWwmghW6F01WTgOoal4JQwkM7Yq3SUPIdjRaeTCkQRVHwQ5otkmvEI8QXJ5YLag/Q5wQ5Y+2a1sV
	vTNgCN6yQT4G8+NpyjoZOXi4PgZFnmXKTKZXHkN/lPSXDvSG/0p+QRmECdURCVb4s60S6DUZfVf6Q
	o6SFhT6fz+a5X9e95hiw1XiGypvAQooUbCEb6rr/QPizBh5QsbwCDTGbo2KeoiMgQ3ItMxGGwDy1d
	SCbBuuAtKmB1NBpytoCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqhLB-00EmPK-0u;
	Sun, 23 Apr 2023 21:33:49 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqhL8-00EmOQ-1M;
	Sun, 23 Apr 2023 21:33:47 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-94f4b911570so526902666b.0;
        Sun, 23 Apr 2023 14:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682285625; x=1684877625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNgSRwBj8Tr3DYpRrmwOO5V4JqGMnYOEx3J0F4U/rfw=;
        b=NiwoXQLnyJthnaPUT27lxaLr1gIpjrm/rnR+ItyLNAEKVtCG/5iqjkhlqSyAzfvN9v
         JPQT5nlts8g6hRegAIOT+KAlO57VfzEB15hI7ZK7Wl2LsxQ7Pl7J6Il5ePY4qoYyd0o3
         M1qr+szsPEQuRuPh1lERLyrR38c1IsoU2yCdhRuU3EsWmgZTf23coRxPNfuBsFI2qosp
         ZLEekB7CuJSErjfEj4yQwALgIho5rhVqMF06SsPofxc4Y4MqkB5OriDMPG/ThghQLNew
         nvyIxZjLorenVO6q5VlF5DTztTPVEKRgqt6E9eYdEbUJcYK6Spbs+EACqTMXJ7P1uxdq
         5kMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682285625; x=1684877625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNgSRwBj8Tr3DYpRrmwOO5V4JqGMnYOEx3J0F4U/rfw=;
        b=gphuopM2MVduseMDQXTpSzl0xdUsD/v1FcflMrfvTZm5maLzI2DSFdceONZHmk1Jm0
         6EFw7ZyIfXpOf9KNzIxHq0wxJZBZaH+SAphnnrTTWWGFeK6EuHPTozphR0TDGjTUsxyO
         S+Lm51awtFz/uRcL+RyycBxP8tFkXiffT21OSs/1qyGbj2Toax/EiL5TYDKhYiGrBPkw
         OEaJ9B89M4k4s2FJgnUtJbhFQ5JKD1NoqQKzrdNHBU8OXWZgwDFi9SuR5R2o7sOQdNO4
         64QJC5r+z1gna4nFSYmM19I0dZWU0WKe48gtZPyQqulITEIrRgYu8i4cR9cJEQEw5Pqb
         BUIA==
X-Gm-Message-State: AAQBX9dyReGOZ1dlmZuvhnneZfFtYrFmbEAn+6hHiiarZU1N3NW4OX8I
	a4VOYhbLIZaPybqhurXVdATGpHC+Nx/Qb/eW1+U=
X-Google-Smtp-Source: AKy350bZYEUBkC2DvaA+vOp7bq8BsQKFWmr2op371BzTw808Y9PCcEvGRAg2v/kDmw1DIIy+HbmDrx+hwEegsRm8N+8=
X-Received: by 2002:a17:907:2097:b0:94f:4b90:3057 with SMTP id
 pv23-20020a170907209700b0094f4b903057mr7670837ejb.55.1682285624558; Sun, 23
 Apr 2023 14:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230417065005.24967-1-yu.tu@amlogic.com>
In-Reply-To: <20230417065005.24967-1-yu.tu@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 Apr 2023 23:33:33 +0200
Message-ID: <CAFBinCCEK0T0fKTc4p2X2rwKD2gG4PN8kKom+YWj9Dk4iK+Scg@mail.gmail.com>
Subject: Re: [PATCH V7 0/4] Add S4 SoC PLL and Peripheral clock controller
To: Yu Tu <yu.tu@amlogic.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	kelvin.zhang@amlogic.com, qi.duan@amlogic.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_143346_464537_45FE8916 
X-CRM114-Status: UNSURE (   9.74  )
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

SGVsbG8sCgpPbiBNb24sIEFwciAxNywgMjAyMyBhdCA4OjUw4oCvQU0gWXUgVHUgPHl1LnR1QGFt
bG9naWMuY29tPiB3cm90ZToKPgo+IDEuIEFkZCBTNCBTb0MgUExMIGFuZCBQZXJpcGhlcmFsIGNs
b2NrIGNvbnRyb2xsZXIgZHQtYmluZGluZ3MuCj4gMi4gQWRkIFBMTCBhbmQgUGVyaXBoZXJhbCBj
bG9jayBjb250cm9sbGVyIGRyaXZlciBmb3IgUzQgU09DLgo+Cj4gWXUgVHUgKDQpOgo+ICAgZHQt
YmluZGluZ3M6IGNsb2NrOiBkb2N1bWVudCBBbWxvZ2ljIFM0IFNvQyBQTEwgY2xvY2sgY29udHJv
bGxlcgo+ICAgZHQtYmluZGluZ3M6IGNsb2NrOiBkb2N1bWVudCBBbWxvZ2ljIFM0IFNvQyBwZXJp
cGhlcmFscyBjbG9jawo+ICAgICBjb250cm9sbGVyCj4gICBjbGs6IG1lc29uOiBTNDogYWRkIHN1
cHBvcnQgZm9yIEFtbG9naWMgUzQgU29DIFBMTCBjbG9jayBkcml2ZXIKPiAgIGNsazogbWVzb246
IHM0OiBhZGQgc3VwcG9ydCBmb3IgQW1sb2dpYyBTNCBTb0MgcGVyaXBoZXJhbCBjbG9jawo+ICAg
ICBjb250cm9sbGVyCj4KPiBWNiAtPiBWNzogQ2hhbmdlIHNlbmQgcGF0Y2ggc2VyaWVzIGFzIHdl
bGwgY2hhbmdlIGZvcm1hdCBhbmQgY2xvY2sgZmxhZ3MKPiBzdWdnZXN0ZWQgYnkgSmVyb21lLiBD
aGFuZ2UgZHQtYmluZGluZ3Mgc3VnZ2VzdGVkIGJ5IEtyenlzenRvZi4KSmVyb21lIGN1cnJlbnRs
eSBoYXMgdmVyeSBsaW1pdGVkIHRpbWUgc28gSSdsbCBiZSB0cnlpbmcgdG8gY29udGludWUKd2l0
aCB0aGUgY29kZS1yZXZpZXcuClVuZm9ydHVuYXRlbHkgSSBhbSBydW5uaW5nIG91dCBvZiB0aW1l
IGZvciB0b2RheSwgc28gcGxlYXNlIGdpdmUgbWUgYQpmZXcgbW9yZSBkYXlzIHRvIHJldmlldyB5
b3VyIHBhdGNoZXMuCgoKVGhhbmtzIGZvdXIgeW91ciBwYXRpZW5jZSEKQmVzdCByZWdhcmRzLApN
YXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
