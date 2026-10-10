Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF82CCA9ECA
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Oct 2026 22:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ach9y6tqDDHvDG1y12DreIowZQtozZhyg6xpx3dBpME=; b=e2q7dj09Rvdfmr
	7yV748ABuq/SEgNTOV2V8yE65xJPsbaNGkSzv0BZ+3qknPcoTGu0hsn6EF6s7b2Z/pUyw4mgtfvq+
	VQTlLV8LGf3Bd/j3/KEQs2njzb2rjcvB/sVMgJ71SCKZmmwGAMLeGZ9DiZGS9TxTpocF53PImLXlb
	iw0zS8gKGnKBDtCslY5OojAtpK2l+/D8Yob98LgdFDzHRbplrflGHleF9sWdVc7lDc8vrdIBE0Qrm
	h7JJ1mIohaipCubBtyKtxJ0v21LkVFkuMuwtVZ5hjtySKqmI49OlRQoIGqszlMyxiyW7+p0foAI+F
	lQRf1t8ugPZQgHd7ycpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfKb-00000008UA7-2vYV;
	Sat, 10 Oct 2026 22:14:17 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfKY-00000008U9L-2oll
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Oct 2026 22:14:16 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-677dbe051d4so650856d50.0
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Oct 2026 15:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791670453; cv=none;
        d=google.com; s=arc-20260327;
        b=TivdN4lj1wthW371ckEjikXdw1yrljfvHeDjwyBjvf6PZqsarYsTXUh7ajLl2BhnsE
         U7jonHTAE+2z1EoGRHPkLR6GOHw0+ziO5HP0sUDUFzJPp52RbeJag40vDGa3RIbNCDiP
         Z3Tfez2ji0kK5+Dns9IOQV7VTXG7vMpHoB7m41tLZSCV/htdAH/jckwXt1DcwlIibV4B
         yjUD8i/mYslESeGw2yRMy3RLm9jMELnXbb/4u1FKheE7OKX3EypLarDYTBwG65gd22A1
         VrauGr3GV1AmuNWanUQ2RIHD+GXvVys7w9+eObw+hky/nEjwRiLsjibIZ8K+3mChpmVV
         VKVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zVgQ1vCIGkE4+/FMfnHlA+BYK3hVjeRnxeI7/qrvVC0=;
        fh=rDI4WTcBpczN2DU+8Mk3Ko6dQoUMOgTpf9H3rVWB/kE=;
        b=DL7N3P8rV1n8+Tm+QQVmQewlnNtrJB+klpVLnRn9mBK3i+yFA/F2MNjqWAr16yiOHk
         ydTZgQoNrCYhPYUoVjsLtbOWgrURdrylo9ayzQZ9vYGd91lh+F1JwLVYXNvUvzt+N7Pq
         qauvaxf1GZtKGWjsoVqGBYAPx+h0atUajeJ3En+4X03C1+BU6URaAeyxblYxqXVSCXQI
         hKI5ygPQHMjwv7BS69BRCMCxoB5wpOmF2zDQdXSIJSvKcZpiqe+Lyg6jZh8kY10vOB/i
         Qdx+soOsJWS0aT/j6mVr+iPnIuEv0NYSuAzOVkhqYIlywLTjn8zF20P4q7iunQBKV22B
         nmvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791670453; x=1792275253; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zVgQ1vCIGkE4+/FMfnHlA+BYK3hVjeRnxeI7/qrvVC0=;
        b=dgWytXtz+JcscZKvcULPdQYYGao/8TiRAqtrlIvhDPXsaiTMrkmedBlg0eyBaP1jz+
         x6pfhtPRPa/fxIE2QI1O8vP7O3gRvROj3w5aZ/szorV+V0ch/MUw8yJW7SBLeHn84IGe
         pPxVCWb8EfkV0G3V4C3wm47rri0vaecW8sQw2ru7fHZi/DoVg8S25lQ2JhZB6gyt0p+o
         W4LHOzcYv+PjtW8G9EhHB3E8WZszKKKWpnE0zO+RVVIwxe06KrFbyS34IKGRzzXxrYqX
         bizCqzvqVI5ozk0jEtzQ1WxX1FzdE9iuYndZaIy6JgeTqiTf26hIh/EyOwyBqXr97VZ2
         BFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791670453; x=1792275253;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zVgQ1vCIGkE4+/FMfnHlA+BYK3hVjeRnxeI7/qrvVC0=;
        b=bHbD07Sw/ymBq3vRJBda4s21NI5mj/e5wXzuP8aeuNwLxZCDJqCcSLcxtIXF65c9w2
         3ZE//SSqok3fIly4JxIMwmGIT4uHwUDB6TPK9gKoOC0Yb+LWUpMoRCc+777ac54G4F8S
         Cz9cQ4SMuDdmFBag66hBRBbxwlbTDsf8tKg/2C2nkshltkVvM9UFrUwKV+t7vmgy9uce
         slbJmRry1cF+5yu/Wvyy4Dya1UC4wMgto7mlFeadD3JZCgt32KTYElyEo4acifHRCkL6
         rN9AvKQKh5eL/shdyLFrPGSaTCpGyG+J53vIs7TPJtP2mLZjOP7Y/9qa2sjRHUB4qDqC
         vT5g==
X-Forwarded-Encrypted: i=1; AKwUvBxf+MV8unOkscH0x57g4s4ZLBTYSRmMn9TF2STKbT2PVdwdBkmKAlSmHXvHANk80NBkUCtggbGCI5V3Au0c@lists.infradead.org
X-Gm-Message-State: AFq9FYJ4Awtz11iMUcNg2SskZ0H8XArpi5QR2SPSA9YmSXgwvFG1puWU
	VMSq/ovqj2qmELouvuVUfChktQJeB7Hq8tKMaQf38NFB7Z4QTq+76sbrrE9QhZwPm6JVQqw8ylw
	wkNMLNTRuPa7QctP/AkL45/0bt1DrWto=
X-Gm-Gg: AYBFou24dhmClneX6guL8Gmf5tr9wP9GK7sYGflI7/UgdiDi34IYMhw3IGp7VK4e8zD
	uLxuu8kpREZOYE4yLcoC45pVi1l2now8yIfq3U1VPTLziD4/Y4IGumyoJHCl2z1a5S6haXsiKO9
	RKaVn0jldyzMffm+cENO0cTMlgNgFfl5WaAC+kkdwLgxg3gtFjg8UdpXDVHkDqV93M0FvME9EPA
	VzUv3grI77vpNIKBDSHnVmXtBqqUN3XTVwH9KgP8zFSsjaQcN0TAFnlO1YnoIsZOvQ3T6krZ8D6
	jc2vuUgdyjXl8IuMVpe8/nGe/f5ZYMgplfhjhD/K2AvSk8XpSJcYgJUHGtRPxl/PFkVGz0px9IF
	4FcsmXAeuHl4H
X-Received: by 2002:a05:690e:803:20b0:676:9240:d69c with SMTP id
 956f58d0204a3-67936275489mr1125092d50.91.1791670453112; Sat, 10 Oct 2026
 15:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-3-tanure@linux.com>
In-Reply-To: <20261010105900.247342-3-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:14:02 +0200
X-Gm-Features: AclHuK8gB-tkTlpSxcPTOLR3EaTkCZhRdAGo-iA2p3YlqPx-9RYK-GDsrGLBxVo
Message-ID: <CAFBinCA7rPu0obv+2aadxqkzMYKmd1+DLJgRe6y418v0QrwSSg@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_151414_741282_3D0066BB 
X-CRM114-Status: UNSURE (   8.68  )
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

SGkgTHVjYXMsCgpPbiBTYXQsIE9jdCAxMCwgMjAyNiBhdCAxMjo1OeKAr1BNIEx1Y2FzIFRhbnVy
ZSA8dGFudXJlQGxpbnV4LmNvbT4gd3JvdGU6ClsuLi5dCj4gKyAgICAgICAgIyBUaGUgVFggZGVs
YXkgaXMgYSBxdWFydGVyIG9mIHRoZSBSR01JSSBjbG9jayBwZXJpb2QgcGVyIHN0ZXAsCj4gKyAg
ICAgICAgIyB3aGljaCBpcyAybnMgYXQgMUdiaXQvcy4KPiArICAgICAgICB0eC1pbnRlcm5hbC1k
ZWxheS1wczoKPiArICAgICAgICAgIGVudW06IFswLCAyMDAwLCA0MDAwLCA2MDAwXQo+ICsgICAg
ICAgICAgZGVmYXVsdDogMApJcyAwIGEgdmFsaWQgdmFsdWU/IExldCdzIHNheSB3ZSBoYXZlOgog
ICAgcGh5LW1vZGUgPSAicmdtaWktaWQiOwogICAgdHgtaW50ZXJuYWwtZGVsYXktcHMgPSA8MD4K
ICAgIHJ4LWludGVybmFsLWRlbGF5LXBzID0gPDA+OwpBY2NvcmRpbmcgdG8gcGF0Y2ggOCB0aGlz
IG1lYW5zOiBNQUMgaXMgcmVzcG9uc2libGUgZm9yIGFkZGluZyB0aGUKZGVsYXlzIC0gYnV0IGl0
IGRvZXNuJ3QgYWRkIGFueSBkZWxheXMuCkknbSBub3Qgc3VyZSBpZiB0aGlzIHBhdGNoIChyZW1v
dmluZyAwIGZyb20gdGhlIGVudW0pIG9yIHBhdGNoIDggbmVlZCB1cGRhdGluZy4KCgpCZXN0IHJl
Z2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
