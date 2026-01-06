Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22715C47BC5
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jan 2026 08:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zeBWvlnAEzPC+ZaViqptYbZh9Kd42HexuSF+Bmm+qBg=; b=xhQhGPNByfb4c3
	UWimJi/rzrTeNuZpMxfq5h59HkAw4yM9fz7NqynvBC8hu2YPvxlxqCMEtPL7+gFAMFgqut1WgIA8C
	FkMhfPWv/aRSgTZO/qPldimwjlLFYxJnIHXn7bWXZWSwB6PzKMWNvqd1ex/1x+Ww/cICe1JP3gNnM
	yQWSPVfE4UFGMwJog65bSBgp1JzmblMLB/LA9IrFkU8BRwINYYpNbQLbKB2NR8vukln4CigsBmjsT
	LkoUV6Lj4LT3voIbNXrcMHAR3MILB9RUUCHHNOYnpIQD22HKWUw4OPi+wjj8jx/gslEx5Ettw2EzU
	9g+7q+HoYRW9S0O/mm8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2tD-0000000CehE-0OuQ;
	Tue, 06 Jan 2026 08:58:07 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2tA-0000000Cefw-26cT
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Jan 2026 08:58:05 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-29f0f875bc5so11041815ad.3
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Jan 2026 00:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767689883; x=1768294683; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G53t0O2Tt/dmLK4wV/1urjfV+TQ9DJgUnzf6yqxBeYk=;
        b=PoJy5TGGis60Nxsh+htGzmCyC2Ptz2BULtUdpcbXHz6wGQq7+vf5GMfdi/iTTXB/Hu
         yMDMs9yxXX2LNuWZs9b8WiiVuHquxTvT738MLg4MbjhyzSuebiUOzom3cnlO3ql6IIWB
         7zzHFC1/tzs3/jjnG2iAsWVkgbnpfQWg/zXFrkKw1kn2FeRzLPk3pKp9W5k2Fyz3edMn
         8TGdMWx5HHNa5Viy0d9x8YcYjh3ddB1VaSNZGDhIikm51fwnvb3VYekEqhLsHEQPPM0Q
         WYeQWEPAXz1QdZaY8aemt4YYLPWd9S90OzaS1Qfcd3qL8BptSkLOCGMIEFPNwwqxNgt6
         mHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767689883; x=1768294683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G53t0O2Tt/dmLK4wV/1urjfV+TQ9DJgUnzf6yqxBeYk=;
        b=VRIEGFyuzQrejYWJKvWwx5uCGpciyMyBlpfi4BxEK/jVJ51q1PJOolkH+Ctoujaq3/
         PvLvByedr0NRQSvPHqAowc2aHbF3qx3T2RXtI52xK2o81WYkJ/+ytOYV1AKpSvuNZviu
         pRUI87mbAaia7omwSnRCpPzpgbBRCV9VDa62NRb/Ho+/wO2UXqY1JC1C36C+/n8t9USs
         87OqYJHVcvYh5BrmyqpC1srvNZTz/6CROu8KzK93xv8RC9ZC4PlgTQNJI43N+xAH4OeB
         kraWcA/fonF8Mi+pOmHSdf+8E++08rrBvxzKkWmt4aJdTtPqKJtdVrE92n2e2DkPYatK
         VViQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp3ZZ9bkUH3GGEsNLWDOGwhXhIBSDLWNJenXBfW1fdif3uuhcoppEYTw6yoOsJMFoDQDccChkYVAEX2l4h@lists.infradead.org
X-Gm-Message-State: AOJu0Yxifzz/KbbREvRzhqbyuyfZeIFbBdhhRrbuuV+5naewccwNSyUI
	utrNlScsvl7rO7EoEJWCMDNvSoIQboM/05wQeaUww0/BsBxXnPWswlaEJWKhXSkW3Ov6/Vfxi2e
	lNKMHldnOKLgKR90nn7Q4hBlVs4xFjhE=
X-Gm-Gg: AY/fxX46BiMTQ4rvaU+ml1yox1sQo1NHfB6E+WS9pEUQ6wnURYEOgK9vQvUFQarKUvq
	6lTzrs1+mnQTvTP0IoLknw/iVaPUxIkzX3HYv7pebNsiw/23FSMbb8iWJoPlzQ/5R3jXGmaK2LN
	L2/aKZQTV6wYacJ8fKPcKhhVF3Lzup5/qWyj0RkOqmNpbPzdvKBOefFxaF6rTDkGzuU1jz9j6E4
	3yfkmEs90g4nUpfNaI1eA41Ae+3bd1+hEXxxORpTzSNiIM6FZeOp2IxUgj2L4xCfVy2gVbseqII
	RwxLRUXcd08js0xvJ9bFsZ8Ge4Y=
X-Google-Smtp-Source: AGHT+IFA6DKd4Yqb25+QMHYXfH+Jh2NRCrQLjGTa8ZM9+F0Xx1xd3Jy/OMlG71eaOtGzHsmwhgEtR9fyBW7b1Rm3bUk=
X-Received: by 2002:a17:903:1510:b0:2a0:ccb9:2f0a with SMTP id
 d9443c01a7336-2a3e2d787e6mr19166985ad.8.1767689883552; Tue, 06 Jan 2026
 00:58:03 -0800 (PST)
MIME-Version: 1.0
References: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Jan 2026 09:57:52 +0100
X-Gm-Features: AQt7F2owLdGLdqQ3XnchKp1E79BKW3iLtGUJOY0QKVFPigG-8AogrAe0KMljxw8
Message-ID: <CAFBinCAZsHfYcRO4P84E6wes9rPw07Cf0h+4zS4KkbVB8vhkUQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_005804_541750_5038612B 
X-CRM114-Status: UNSURE (   9.22  )
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

T24gVHVlLCBKYW4gNiwgMjAyNiBhdCA5OjUz4oCvQU0gQmFydG9zeiBHb2xhc3pld3NraQo8YmFy
dG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IFRoZSBHUElPIGNv
bnRyb2xsZXIgaXMgY29uZmlndXJlZCBhcyBub24tc2xlZXBpbmcgYnV0IGl0IHVzZXMgZ2VuZXJp
Ywo+IHBpbmN0cmwgaGVscGVycyB3aGljaCB1c2UgYSBtdXRleCBmb3Igc3luY2hyb25pemF0aW9u
LiBUaGlzIHdpbGwgY2F1c2UKPiBsb2NrZGVwIHNwbGF0cyB3aGVuIHVzZWQgdG9nZXRoZXIgd2l0
aCBzaGFyZWQgR1BJT3MgZ29pbmcgdGhyb3VnaCB0aGUKPiBHUElPIHNoYXJlZCBwcm94eSBkcml2
ZXIuCj4KPiBGaXhlczogNmU5YmUzYWJiNzhjICgicGluY3RybDogQWRkIGRyaXZlciBzdXBwb3J0
IGZvciBBbWxvZ2ljIFNvQ3MiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gUmVwb3J0
ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFp
bC5jb20+Cj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FGQmluQ0FjN0NP
OGdmTlFha0N1M0xma1lYdXlUZDJpUnBNUm04RUtYU0wwbXdPbkp3QG1haWwuZ21haWwuY29tLwo+
IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lA
b3NzLnF1YWxjb21tLmNvbT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRp
bi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
