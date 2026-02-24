Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA41EFB81B
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Feb 2026 09:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjzuO37Be6eBIdv7aN9RFIZyVVAdASz34v5gEAJ4D+o=; b=fFfUACg1IPPV+S
	DK/U1Zji+4k36AGn4hizjB25xjNPXNjEwCgrJw1gdmWqXG2p+a4DQgO/Xe9A4F8HzFbgGy4oPv80f
	fsfKlz1yf/cMoT+SnIXAb0lPtYGe7iGYK7z7S2zeZ/IsJB7Q07KpcMeR8bsPE4h7qiLB4v/s1ThIy
	5y+LtjGLYIXVf6lXlWGaMXEZqB2pC6psI2Q0jjrIOuC5QBUw4QEK8IPxBgU/IwCK0eHzhT7fmmCSl
	eFgJOK7RLbVv/oSoqJGP/nzXaKts4OFc5tBgyKWEv1aX5MgTBfL8lZUDT8yE9BVP4lTlSW7GnyI2k
	/rCfGDVHTa1atztetVGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoGm-00000001hJU-3oz0;
	Tue, 24 Feb 2026 08:59:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoGm-00000001hJ5-0PA7
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Feb 2026 08:59:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FB2960180
	for <linux-amlogic@lists.infradead.org>; Tue, 24 Feb 2026 08:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4FB3C2BC87
	for <linux-amlogic@lists.infradead.org>; Tue, 24 Feb 2026 08:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923590;
	bh=lnhLem2XceV3pkuUOPOzNVK496IDuAS6Fz9EZZTLZDs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OGPg96sAODW7wqtA1uf+71Mk5aGsU9mJID4Vhqky/fq3t7dyRnKEejzEahlvF0kks
	 MwE2U9TbBg0plsvVss+faU5N9eS/irEtfP5XiyaQ+RuOiU86d1CLakBKi4WmtTPwVG
	 PDW8khAFXliQt0Y/o/dnjniaWha5/yarFbCzFR+aL9bmyOtPTGn5Ihj+tf2fcV3Wui
	 0PS6r6I2Uz+QbDCGgM4GPnQ5nYhAOClwQv5nmvxvqEXnasBKVvqcHiEMwDc6BOLmAb
	 5IRgSwEiFkc5KyUBLx7jdgKxgOwqwYypcymaPo7tezkrNul0u4ZK2MlfmeDIiav80p
	 mYnG7Fi2vnABg==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79427f739b0so48147717b3.3
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Feb 2026 00:59:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPcGE/9JDHfnoqx9Y+PyjcEHDbasANmjtCG0Btnya7GIqwjYRrMlKgqCxaDBxqRzSHOgfdlK8G9YJ+F51V@lists.infradead.org
X-Gm-Message-State: AOJu0YyC523hf3z/xolXZVw1Wf80L9TIABgQGvWHcZg/xWx0wcsQ/tTg
	JBgMJyAw8cw/A12sTxwt6XxRve8Ts9Kf5iHQVQleQ+m+7Tb9RxLeuddgsFSI6ebwKBtvelxPw9b
	we3m71LbkzRogdjMQPF16hxqQGjP7jk8=
X-Received: by 2002:a05:690c:4806:b0:78f:a616:7b99 with SMTP id
 00721157ae682-798290172b5mr93654927b3.49.1771923590224; Tue, 24 Feb 2026
 00:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20260219-a4-v1-1-9666d6edbe2f@gmail.com>
In-Reply-To: <20260219-a4-v1-1-9666d6edbe2f@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 09:59:39 +0100
X-Gmail-Original-Message-ID: <CAD++jLm6ybwu3coyZfOh0BwvscGBp+B+oHp5bUR5rUp80cSjHQ@mail.gmail.com>
X-Gm-Features: AaiRm53Vb4IAD6Sp1D0WlxQIdn1apde_GXyUgxJPFAFGQfJTy6x8-4GGpF2nJHQ
Message-ID: <CAD++jLm6ybwu3coyZfOh0BwvscGBp+B+oHp5bUR5rUp80cSjHQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: Fix device node reference
 leak in aml_dt_node_to_map_pinmux()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gV2VkLCBGZWIgMTgsIDIwMjYgYXQgNTo1MeKAr1BNIEZlbGl4IEd1IDx1c3RjLmd1QGdtYWls
LmNvbT4gd3JvdGU6Cgo+IFRoZSBvZl9nZXRfcGFyZW50KCkgZnVuY3Rpb24gcmV0dXJucyBhIGRl
dmljZV9ub2RlIHdpdGggYW4gaW5jcmVtZW50ZWQKPiByZWZlcmVuY2UgY291bnQuCj4KPiBVc2Ug
dGhlIF9fZnJlZShkZXZpY2Vfbm9kZSkgY2xlYW51cCBhdHRyaWJ1dGUgdG8gZW5zdXJlIG9mX25v
ZGVfcHV0KCkKPiBpcyBhdXRvbWF0aWNhbGx5IGNhbGxlZCB3aGVuIHBub2RlIGdvZXMgb3V0IG9m
IHNjb3BlLCBmaXhpbmcgYQo+IHJlZmVyZW5jZSBsZWFrLgo+Cj4gRml4ZXM6IDZlOWJlM2FiYjc4
YyAoInBpbmN0cmw6IEFkZCBkcml2ZXIgc3VwcG9ydCBmb3IgQW1sb2dpYyBTb0NzIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBGZWxpeCBHdSA8dXN0Yy5ndUBnbWFpbC5jb20+CgpQYXRjaCBhcHBsaWVkIQoK
WW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
