Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32042CD11C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2024 09:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQ4wPesW/WSUFWD1tGCmjh6F7DOl0BdWsMWCxGm/o6U=; b=QL2WTLzisVog7g
	HaiouhFKuDPSpqLpghiOctnUXS6KzeocF2O9DTD+mdOxgERGLDU6R35K8h7Qn37BYn+Kh7NiQgLZ5
	E8WxMUGzDVW6rsSykO6SQbZ/POz5ZTSz2XRAWXGCP2U7iUwUSHzB3JFmaqk9Oe6Z9uVZcbq2vxb7q
	Xg4QlssTjoSV+ws8wFnsfK9wiDDI5RAsQLVey32SG3/vftzZPOxJoLTgEeh5p/PA/xBE2hAS29fzr
	zceF5E1HZFjuxn9teI+0cl4OjjGmyjt5o1lK//C0rHjo+m997RBlbrk/TTK3cuq6DgM2MPyDPb5Dt
	3CQ7y4/HVyiKSBGtPNoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruUTF-00000006CXu-2GHQ;
	Wed, 10 Apr 2024 09:42:21 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruUTB-00000006CUm-0Jc1
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Apr 2024 09:42:18 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1e2b137d666so48842955ad.2
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Apr 2024 02:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712742127; x=1713346927; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6mq+XWVQezektM76wlJCZqJNDL7tm6/6S+c5eJ1L7E=;
        b=jbusLTuVPrALjYlTTCinLgQMzZj6+0+GCuta/C9EsQL/jnVq0SCoDpNbUJHCu+Z/D2
         cu7d+ykl/H+3QvqO0ImtKl/18GgAOKcL95an+dREaKoo3B89Ihwfve6REVAx0XiiUv41
         pG9x3Yt2L1R5O8MHLcBgFowfYdZS3uVm774gCUG+t2ASiQjtf8VRq5BNdfxuzpFgpH4Y
         LB2A8sCpIplXvOOaa/r56q2SqZmcHoolCBGgSLS/UvD/ZjwSd8iFr9xUnuFQ65IFmds4
         4Ew2+lWCksCXIlywPf19UELIwqUCn43e944WzSLvGEznXqnTu4o6bMrRyq3/aYzEysAe
         7tTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712742127; x=1713346927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6mq+XWVQezektM76wlJCZqJNDL7tm6/6S+c5eJ1L7E=;
        b=Cb5ggoKBIc2lvT7DulykDYOLzXohE9MqC63+SPAgqfaomUdFQ2+saXoyIiWzGRWCHH
         9Bs3bRnD54cgEI4XEds/i9LwMSTbVXVno+UsG3wdClZgR5qd06/ycTqzQM43A037Q2UD
         zsapfPK7t83B3laUp2Og5n+aKn35abyRAO1SQSR96PCd+zOlFZeJIu4oSXaXK36LO6mW
         slk4VzIewrO/10IcuUD0FxGcjOrp55QE3KUnlzN98fU+46iwawcehY04+H5UVO8pBhF8
         JW+MnoAFAB75ykghbEHDzmQVZolDf4HSvaNwnaQZKWFoG9vDyjEc13hHT6uyAjPtix8I
         LF0g==
X-Forwarded-Encrypted: i=1; AJvYcCXyJr7pZ8l5nsMzZIoFP1jIk4bthpWHcCddA1MKJY6gpsYkH9nBD7zOGa7UqRwWPx3KqowL+jmluCSwYgNXWAvEo5hmIMF5tNyQQQV7N2SwJKU=
X-Gm-Message-State: AOJu0YzSg0+0RHZHnrdTYtCzDkDwgK06AUOsEsKo+RYYvzTK6mPqhfv5
	tsl9pUfD+4zoitGeEp6R57G3PayICteDE6SQBK5w4riyU/0+4EaMPKLfuzAtyipHDGMeifK6hef
	Zg7eceFjJxm4McZCFeec9LYlKrvQ1G6CC8HrAHA==
X-Google-Smtp-Source: AGHT+IGxW+1SQOW/hjBi7o8UbjyT2DcaFkvuNfI2f6FK1ZRsStq18tyXZyZ9KYXHh22zEmmhmUKOswcUmQ4A1Q7/6qI=
X-Received: by 2002:a17:90b:3b87:b0:2a0:4495:1f3d with SMTP id
 pc7-20020a17090b3b8700b002a044951f3dmr2595254pjb.0.1712742127619; Wed, 10 Apr
 2024 02:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
 <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-4-99ecdfdc87fc@linaro.org>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-4-99ecdfdc87fc@linaro.org>
From: Nicolas Belin <nbelin@baylibre.com>
Date: Wed, 10 Apr 2024 11:41:56 +0200
Message-ID: <CAJZgTGE10CZiHvahxDu2mf8C0JS9UgQ_x-XCH-G8Vvjfp3CUCg@mail.gmail.com>
Subject: Re: [PATCH v12 4/7] drm/meson: gate px_clk when setting rate
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_024217_177987_8A76701D 
X-CRM114-Status: GOOD (  15.07  )
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

TGUgbWVyLiAzIGF2ci4gMjAyNCDDoCAwOTo0NiwgTmVpbCBBcm1zdHJvbmcKPG5laWwuYXJtc3Ry
b25nQGxpbmFyby5vcmc+IGEgw6ljcml0IDoKPgo+IERpc2FibGUgdGhlIHB4X2NsayB3aGVuIHNl
dHRpbmcgdGhlIHJhdGUgdG8gcmVjb3ZlciBhIGZ1bGx5Cj4gY29uZmlndXJlZCBhbmQgY29ycmVj
dGx5IHJlc2V0IFZDTEsgY2xvY2sgdHJlZSBhZnRlciB0aGUgcmF0ZQo+IGlzIHNldC4KPgo+IEZp
eGVzOiA3N2Q5ZTFlNmI4NDYgKCJkcm0vbWVzb246IGFkZCBzdXBwb3J0IGZvciBNSVBJLURTSSB0
cmFuc2NlaXZlciIpCj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ry
b25nQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19t
aXBpX2RzaS5jIHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfbWlwaV9kc2ku
YyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19taXBpX2RzaS5jCj4gaW5kZXggYTZi
YzFiZGIzZDBkLi5hMTBjZmYzY2ExZmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21l
c29uL21lc29uX2R3X21pcGlfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVz
b25fZHdfbWlwaV9kc2kuYwo+IEBAIC05NSw2ICs5NSw3IEBAIHN0YXRpYyBpbnQgZHdfbWlwaV9k
c2lfcGh5X2luaXQodm9pZCAqcHJpdl9kYXRhKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0
Owo+ICAgICAgICAgfQo+Cj4gKyAgICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUobWlwaV9kc2kt
PnB4X2Nsayk7Cj4gICAgICAgICByZXQgPSBjbGtfc2V0X3JhdGUobWlwaV9kc2ktPnB4X2Nsaywg
bWlwaV9kc2ktPm1vZGUtPmNsb2NrICogMTAwMCk7Cj4KPiAgICAgICAgIGlmIChyZXQpIHsKPiBA
QCAtMTAzLDYgKzEwNCwxMiBAQCBzdGF0aWMgaW50IGR3X21pcGlfZHNpX3BoeV9pbml0KHZvaWQg
KnByaXZfZGF0YSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAgICAgICAgIH0KPgo+
ICsgICAgICAgcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKG1pcGlfZHNpLT5weF9jbGspOwo+ICsg
ICAgICAgaWYgKHJldCkgewo+ICsgICAgICAgICAgICAgICBkZXZfZXJyKG1pcGlfZHNpLT5kZXYs
ICJGYWlsZWQgdG8gZW5hYmxlIERTSSBQaXhlbCBjbG9jayAocmV0ICVkKVxuIiwgcmV0KTsKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiArICAgICAgIH0KPiArCj4gICAgICAgICBzd2l0
Y2ggKG1pcGlfZHNpLT5kc2lfZGV2aWNlLT5mb3JtYXQpIHsKPiAgICAgICAgIGNhc2UgTUlQSV9E
U0lfRk1UX1JHQjg4ODoKPiAgICAgICAgICAgICAgICAgZHBpX2RhdGFfZm9ybWF0ID0gRFBJX0NP
TE9SXzI0QklUOwo+Cj4gLS0KPiAyLjM0LjEKPgoKTG9va3MgZ29vZCB0byBtZQoKUmV2aWV3ZWQt
Ynk6IE5pY29sYXMgQmVsaW4gPG5iZWxpbkBiYXlsaWJyZS5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
