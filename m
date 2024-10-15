Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDADD1F9DA
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2024 21:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxAd/7KDlldFeYpLKjZrZv76Y6lWKHtcdoWYeuQYrnI=; b=FqXxTK5XlayL4l
	1aNuajZF6plUDRwR7SSsFJTssGylUM1wWTtuk0nQM1jsgle7n6Qc3HsFM/YPuRo8I/M9q8ByaUxdK
	vWwOmNlyfunyIRjB5A5ka7XqRiD8YcMcEN0TDsdG2/yYAFoEe1teCCDmltbwSD1JMwJoanxuDHtNu
	qo/nXmpUT3iFIwv/h3armFax6u7eIKBCYS/oCjoUjOTGYbxwNQQPsXjNNbgfDq78U9hteyxJzNg0b
	CqcUOprmzpiur5/SnsVx2WfL7PgsOWLTlofEdHBOziUNgQgjWCoPmR8lbHTiIPvxYJ63R5lmDzA79
	khMJmqKyi+4OK8Gnu/Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0pJr-00000009hpK-3XVG;
	Tue, 15 Oct 2024 21:43:07 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0pDD-00000009fkM-0eww;
	Tue, 15 Oct 2024 21:36:16 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20c6f492d2dso65563775ad.0;
        Tue, 15 Oct 2024 14:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1729028174; x=1729632974; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUHbc2NCTZoEqVKU7wn/lP9FbtA0R/gTWuGh32oa8nQ=;
        b=P+deSsdnVYqXrjLSCONSfXYcrc+svLdnry4tdWJsEP21isB8tZeKYQxAJyWYlyibz9
         Nl5o/3LVFx1QmMjkGYhWNegUJ8NqPo/dcCbBOrqeSs0vX3thNLiN4zOoPBdw9NWuEa8r
         SLn46g7u8okt15UJp62eZVEAHeGvOmjCkGKAueZYzAbUfNU4VpNH9qIL9r9mBdjNtUTR
         8yQAGBtIiz2nHA/qWE23+B2Kna3WMzshH6qwHeDJ/J/Sw7xFinfdOibqHHbu9FX9psak
         nk0nYCH/lZTAmlHZFkRW9lb8vjnE7c0PBPlnxQX+Jaqn/8G4pZiaenr/Bx7bs+9k23X4
         QxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729028174; x=1729632974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUHbc2NCTZoEqVKU7wn/lP9FbtA0R/gTWuGh32oa8nQ=;
        b=vxtmP/XYfPrXBm0MLm5vJ2BSIwjZ+u0Haa2kcYhLqlgtnYwOEbiL07wL+XkO3fc2Yj
         lK7wLRaJy4XmSvGnLFvs8Lih8PslTKPiyg7jq+WcAYb/ZPwpwzHxdEotwYQTHlYAyGDm
         MGtvvoqNz9EhHKs4/SK3QTEx57FMgFNPyjgovwXc411l+LzckOKFhoaEUJc1p1ybeE1y
         1QGXymI9lYC4Uhohu7OAuXUUSBW9LHavjv0Rh5YwsKTt1gi36b1E9C9eCx9Nbh5lw5o6
         lTI0VuE0Ig0r93hWbkuKzUczsKpAyfs9lphS6qw2Ch9CvOQwcx+M8wA0xNElwXY45v9s
         LQYA==
X-Forwarded-Encrypted: i=1; AJvYcCX0IAEFnsn3tGUmkGmLXGObYyREsmVJgfenW/7PrIGj57NVUBg25AtjfLnh5EV89cUgfDIo+IhptJ1feiMI@lists.infradead.org, AJvYcCX4mqoAjfB2Qyao0lRqU3hXQp+XFmwUAWg9zLUyuOAhpDWlfG5RQBH4Q6v95REtWx/EGpbVSg30JXjP9xRvqohMlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzqSUbxiPy6WP7NcwwHuyoTZflO/2WbKpFp38aTwc/nJNoK+3R
	DZiUrpmuvf2+LjfWJah8kBPlfgep7Mxpvh3dLQD76B2waJjm6r1KnEhrWjOV8Ju86xldVEjhErh
	Ov0dKfBQon4omhJvaOSP0uqSb4OISnUPe
X-Google-Smtp-Source: AGHT+IFqbNMesq/OCjTCsA5X5R9B78s0bALNeQXGiwca2lvIOVLQDgOQfJTpZTWJnaYVc8WGp678vgmB0ffwb2wprOQ=
X-Received: by 2002:a17:903:244e:b0:20b:b238:9d02 with SMTP id
 d9443c01a7336-20cbb21e84bmr225904075ad.33.1729028174053; Tue, 15 Oct 2024
 14:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20241015-topic-amlogic-arm32-upstream-bindings-fixes-pinctrl-dtbs-v1-1-c7291f17063e@linaro.org>
In-Reply-To: <20241015-topic-amlogic-arm32-upstream-bindings-fixes-pinctrl-dtbs-v1-1-c7291f17063e@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 15 Oct 2024 23:36:03 +0200
Message-ID: <CAFBinCC2cfRQcQw4BoVqmJMqWMoD4TLur_ev+Bsp5NWL=hmt+w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: amlogic: meson8/8b: remove invalid pinctrl reg
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_143615_251442_BA443B14 
X-CRM114-Status: GOOD (  10.89  )
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

VGhhbmsgeW91IE5laWwhCgpPbiBUdWUsIE9jdCAxNSwgMjAyNCBhdCAyOjI14oCvUE0gTmVpbCBB
cm1zdHJvbmcKPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gVGhlIHBpbmN0
cmwgYW9idXMvY2J1cyB3YXMgb3JpZ2luYWxseSBoZXJlIHRvIGNvbmZpZ3VyZSB0aGUKPiBHUElP
IGludGVycnVwdCwgYnV0IGl0IHdhcyBhIGJhZCBkZXNpZ24gYW5kIHdhcyBtb3ZlZCB0byBhCj4g
c2VwYXJhdGUgZ3Bpb19pbnRjIG5vZGUgYmVjYXVzZSB0aGUgR1BJTyBpbnRlcnJ1cHQgaXMgYWN0
dWFsbHkKPiBzZXBhcmF0ZSBmcm9tIHRoZSBwaW5jdHJsL2dwaW8gcmVnaXN0ZXJzLgo+Cj4gRHJv
cCB0aGlzIHJlZyBlbnRyeSwgYW5kIGZpeCBhbGwgdGhlIHJlZ2lzdGVyIG9mZnNldHMgd2l0aCBh
Cj4gcHJvcGVyIHJhbmdlIHByb3BlcnR5Lgo+Cj4gQ2M6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1h
cnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTmVpbCBB
cm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+ClJldmlld2VkLWJ5OiBNYXJ0aW4g
Qmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgphcyB3ZWxs
IGFzOgpUZXN0ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xA
Z29vZ2xlbWFpbC5jb20+ICMgT2Ryb2lkLUMxCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
