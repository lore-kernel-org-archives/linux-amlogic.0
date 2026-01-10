Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE19D25023
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Jan 2026 22:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1ob4RZKi5EEGsy/gKxuRuoP6NsiPd+Eoi+Hpv/juZ0=; b=Gy+8jvIqMr4TDD
	bmuYEP9jSi7hd9glwvR5C2IYQcPK93SI5nmGzLOAhyZahR03UzH96aG9MKhqrRiQQJ5JHV44s8VQO
	u8+WzCtLVOalWqL4YMzRUWmMJX0LScPot/O2WzO0b8HDvcR+9VnJnRqMK5vY3iVB4oW3ACx0XqGEA
	tbLTCWvvqJKI5YzZs5eKZYQOMfGO6xjQ9Ec8wbZ4o9GF+fNSV6hnW2LWP6jHM2zXQUGMFI9ZnYghy
	/jeD/XoRIMFNVQ//WXXgsy+AGcAKXnaO7lDqltsEiXU/4wAa0QCYYdcJ1uY8vw69AjFmEprwP9rYl
	YufrwH0Z0vswftqAlxuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veh8y-00000003ikM-1BHD;
	Sat, 10 Jan 2026 22:09:12 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veh8v-00000003ijk-2fPI
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Jan 2026 22:09:10 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a1388cdac3so37807545ad.0
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Jan 2026 14:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768082948; x=1768687748; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjgSj6a3kunrFN67IT5JMHaUrlt+PXfCgDXfeu5dl9k=;
        b=MxZR7ihDGbmv4XtDsgIaseo7sz7tiYTcwO8sOMd49vl4i1KJ3bkOveEDvLXVr7PAk+
         gIojrMuWDdy16TYDSFZgglOfEFRUoksnkj3xCNiSgSTgyUiIgl62LSs6EOOvwSo1YS6g
         W+19I2oWKccpkkT/BsoHFVqFOo1OevZotsoVXqEeYbCjkRHnlKkjsZ14qvymx+q9EOu2
         0NqhsoZmpFMaACpCs/t05+sVHHBVsoGMFq39rNoPOlsjZ7LdPzt5gVZaTJWQ2VWPO+f9
         ILgtHHKxuKl4tr/EmvX4YrVkBTNOudqHDy0lqq86OzvdIoK0eL4TK6KKV5hWGm3b6MVc
         nVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768082948; x=1768687748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pjgSj6a3kunrFN67IT5JMHaUrlt+PXfCgDXfeu5dl9k=;
        b=dGtrkbXiEdjpbKnB3jcd3qdBs+zUI5S/gQEN6pXv1boP9w3bT6dRDn1Sij0jug17qI
         iuBXAq6W9Sf6EVXBM+K9I1H4Iff9BeCOHKOcdYzSV2lxfGAJZPhkgSSsqdtDdj1etF3D
         S66iutmSnu1v6S9+twok0FL29DVqng1cmegbZpXYT6NTY4+t4LJZjyUeGaWyi6ydaXdj
         TZxFXj8SAZl+ujazDj00uSl9ioJj7VoXC5h35QWn0McAt/C4bzTDcn6JSkeRb4W3LT3D
         A0+oiAVVCGLli8DGskaG/wLEtdFuj1W1+S/qYIBgbfyO9I3EwrXxcOjl7WjUMo+KsX2I
         xohQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3N76ncXZIMDrSLhOrvOe86QbeicWK2nUIcg8FBvAkMSdoxaxBOepwuWhvc2jdNddesXXaQ2Byica+hXLw@lists.infradead.org
X-Gm-Message-State: AOJu0YyLdE+vw56Roomi4gUVsO3AHuTlvpvY9Ij/fjWJmxepkNI4Yd7M
	y0i0FajnLU/WvkXKwYiPr8WpEpZkFLltoMtCYapB/mtW7VmoYCijDEXeedJTxN8FrkjXpgkbibd
	5xWB4HSJkd2it5n6a2DlPZe5J7szkbh0=
X-Gm-Gg: AY/fxX439j4kJeBAmQfPx3PrUX6qNZQ9cTr/CEV7IRjQVPzzlq/v2B+PD8xv1Jfm3/P
	eArV4IrJneGu8KUHpYmjuvLoEtoidTK262NSyXDx2ynQpHLkavSuwUPLtE0x5VpB39WJQ8ayzw6
	h3BODrhBr+1/79/wGe/Z7pzmkoB+8TcIdkTbZfrb/A1qRgynZS6VoY2ZrUuLHd5kXezXKkUd/iC
	ZvV3zcuxAEGIxhJcXq3d9P1AU5ZNeX0if//MKXCTGgGlIiyHjB3NFBDUSjuWMzBxwLMJcbgHK2A
	CAC9qJa3q2hZq1pvg97d8tznhCcplacoobXrSbE=
X-Google-Smtp-Source: AGHT+IEAqhyKZ4Zb9mGUXaf4V+H313p3cDSNfGR8K+R50WWW/gF491i/LIbVtoG+64AdUYGn/0TAd6Uaqs+FGGXp2Yc=
X-Received: by 2002:a17:902:e78b:b0:295:6122:5c42 with SMTP id
 d9443c01a7336-2a3ee43da5cmr117317715ad.24.1768082948085; Sat, 10 Jan 2026
 14:09:08 -0800 (PST)
MIME-Version: 1.0
References: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com> <20260108-a5-clk-v5-6-9a69fc1ef00a@amlogic.com>
In-Reply-To: <20260108-a5-clk-v5-6-9a69fc1ef00a@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 10 Jan 2026 23:08:57 +0100
X-Gm-Features: AZwV_QhAKgfsFN9tGWs1QKxT7kBr72Z-TUCf9Thx-La55n8xXLTiY8eWe0kVLVk
Message-ID: <CAFBinCCPsaywQuePJ_bxMby0MJeh2ohkXcduRy=yxr8EExJ9nw@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] arm64: dts: amlogic: A5: Add scmi-clk node
To: chuan.liu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_140909_673619_C67C7D75 
X-CRM114-Status: UNSURE (   7.65  )
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

SGksCgp0aGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpPbiBUaHUsIEphbiA4LCAyMDI2IGF0IDc6MDji
gK9BTSBDaHVhbiBMaXUgdmlhIEI0IFJlbGF5CjxkZXZudWxsK2NodWFuLmxpdS5hbWxvZ2ljLmNv
bUBrZXJuZWwub3JnPiB3cm90ZToKWy4uLl0KPiArICAgICAgIGZpcm13YXJlIHsKPiArICAgICAg
ICAgICAgICAgc2NtaSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJh
cm0sc2NtaS1zbWMiOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGFybSxzbWMtaWQgPSA8MHg4
MjAwMDBDMT47Ckp1c3QgYmVmb3JlIHlvdXIgdjUgTmVpbCBtZXJnZWQgYSBwYXRjaCB0byB1c2Ug
bG93ZXJjYXNlIGhleCBjb25zaXN0ZW50bHk6IFswXQpQbGVhc2UgdXBkYXRlIHRoaXMgaGVyZSBh
cyB3ZWxsLgoKClRoYW5rIHlvdSEKTWFydGluCgoKWzBdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
YW1sb2dpYy9jLzdiY2JlZGQ2NGVjZjU2MjQ1ODMxNDBmYWViZmRiMGUyZTJmNmI0M2UKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
