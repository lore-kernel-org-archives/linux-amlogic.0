Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF81AC71159
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Jun 2025 00:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oiCOVXq8H++RyPB4mOgO5eblfyCIGHGJ4edTwN59e84=; b=xlGz8XBb3K4sCy
	wW+bAVfR+0l56C60/DxsZax2hgcHN+D956DitK+nloQ2ahE8X3uEIRtoy4f3u/BYSzeYQxUMNVw0j
	reCRF7Vx0Su2CnSbeDY+4Tpi1uNDYPigtYwXnJwgQdnna37n3BKnpQK5gvtKPiYRMQyeBO7y8YQOe
	cp19wXDdhVGUf9T5c/83S+0BFlMnXSiRBwzZNKTfaC/8vXD8f2QW1LjTqXHGQkRsPjsyVk6CTCETz
	WSQ2VpI8HW0zmyuuBhy6061fj38yJtFxC4hQWqNMvpH2ys1b1htBJeo8fbwhwGbkV7/9amiBRjMzl
	NgcjLn7JBXYfMNPx5WnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRK9O-00000005t9U-1YKq;
	Tue, 17 Jun 2025 00:26:06 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJxk-00000005rxF-3PoJ
	for linux-amlogic@lists.infradead.org;
	Tue, 17 Jun 2025 00:14:06 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-73972a54919so4415240b3a.3
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Jun 2025 17:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750119243; x=1750724043; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xPzkNisft+m84N4JYez02rZP6098OOb7aM1R5PhuhU=;
        b=EPIa2oTyGwKGjQdw/ugysVyPW5g5xRLBlNnrnSzdhQ2anV4B2SuPO11hSEv2AvwYjJ
         nxT8OrOhWrDIVNgrg84pJs8NS+NSjWYqOx7B5ciqUieJbM64xU71Mkd1MuG/gM9Cwkzi
         3M5oZF1YUpKcpaZ5i65OmE1EwHKY3Y47fC0Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750119243; x=1750724043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xPzkNisft+m84N4JYez02rZP6098OOb7aM1R5PhuhU=;
        b=FxQbzXmAt9iFVw1E6jtWOTDVq5DTa7YfHPoNPuaepBo8KZtBGbqK7JB2sHPsICxRqI
         CSXr3Za4liYqEL0Mo41lX3uJXUJGe9Q+mW7HNvFHke1+tUrWRtP/njK4ZNe8l6JNjAOd
         mSBd1EKR4mTEjcSlLnhqzNjHiagQH/Ht64sJudiYAJdlRNmpg/vvxW2CarDUMUdH1aCm
         cgyrJ+0cQAjXdgL8QtqBpWyTnt4rNWjxg/09wXHU+A65b9j3HusxyxngKCtL9GZfVdFn
         Vj7o4s9TWW//UR1b9dt7IUrcFOPzR/jUk7zPfIfHBOiGJ1xnMuxl1e0Mt5ZwUTBMHOwH
         rTBg==
X-Forwarded-Encrypted: i=1; AJvYcCWQOhP9LCZ4ftjE8Wpbw7u664/HtFVRFPQCwuvM/EKEilKdocNT9M868UcrP2Av/VZ4M6+u0ycUSlxLC5Za@lists.infradead.org
X-Gm-Message-State: AOJu0YwJu693fVDMRIBnpUfacWxAZ5OolkEwYNXJ8+ToCNhGVLvc1brQ
	MfntEHnZK9ANM2xQ/RlSFIzdEZyf/9fWGuKXLuksnsfOctCO+9y1r4GOm0sIr1rCC1ou80TYipB
	AhTk=
X-Gm-Gg: ASbGnculPt8fRH4vVNx7wnWlOJqBu2+OwQw+9DfWxUzcdYdXbkXNdN7AU8zT0A2XvXN
	Lx67SfId91d7r2L4Gg880YEMbNZbdmNPJahNoEZh3Jtqz5ugvQx0P4jT9xJZeg0qmMSqaNoGlwr
	ezeaxNczBzEB2t0amyah4RavKSFeFh2Jh43tzCb2BOBzAhkDcr6quArHge/UpszT36qPWSpLhLj
	ju96bocyfZm8wMCdPgP6wJuROujoqfVXmzfmEhE9GDrzp5WeZZoO+p2qLPnT+Uhyt81rZ65eaq7
	W3a+qBAnuibrQyaB/tiLbNcTu45fIjx99xLQFTdAFkxdyOJeW/oOK+nijhgEFzEX8SPx76bf/mY
	LaQH1t+6WXw9J8rkcSBLDwnj3aQ==
X-Google-Smtp-Source: AGHT+IHwu/CYOeqZUMFB92vNplWom5YjkOqkC7WRMyLb3vHHBAQMJs96UAztDqJ5M4VB4JKKPCRvMQ==
X-Received: by 2002:a05:6a00:4f95:b0:736:339b:8296 with SMTP id d2e1a72fcca58-7489d03aa58mr16245636b3a.18.1750119243176;
        Mon, 16 Jun 2025 17:14:03 -0700 (PDT)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccfcsm7486231b3a.4.2025.06.16.17.14.02
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 17:14:03 -0700 (PDT)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-31223a4cddeso3739217a91.1
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Jun 2025 17:14:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUb1ZkltW4fEzFWakMXTG81drXYy9CbgKB38FGrdzk1u5/mcS51mdLyDfFpgeB7HC4XNUQQRAHryeQ8fGFR@lists.infradead.org
X-Received: by 2002:a17:90a:da8f:b0:311:ae39:3dad with SMTP id
 98e67ed59e1d1-313f1d05b32mr18262369a91.30.1750119242065; Mon, 16 Jun 2025
 17:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
 <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
 <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com> <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
In-Reply-To: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Jun 2025 17:13:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOucHSqgGE_OfW9MAeLbwqtk1emCiByxJw-LpQnCbDww@mail.gmail.com>
X-Gm-Features: AX0GCFs2ZyAAIENHNjz3BASVq2N7KuTDsUG8ACNS6wvc-Dx4zSZzUpIgLa-Czmw
Message-ID: <CAD=FV=UOucHSqgGE_OfW9MAeLbwqtk1emCiByxJw-LpQnCbDww@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_171404_888069_BC29F850 
X-CRM114-Status: GOOD (  27.16  )
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

SGksCgpPbiBNb24sIEp1biA5LCAyMDI1IGF0IDg6NDPigK9BTSBEb3VnIEFuZGVyc29uIDxkaWFu
ZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBNb24sIEp1biA5LCAyMDI1
IGF0IDY6MDLigK9BTSBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gT24gVHVlIDI1IEZlYiAyMDI1IGF0IDA4OjA0LCBEb3VnIEFuZGVyc29uIDxkaWFu
ZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4KPiA+ID4gSGksCj4gPiA+Cj4gPiA+IE9uIFR1
ZSwgRmViIDE4LCAyMDI1IGF0IDExOjMw4oCvQU0gSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXls
aWJyZS5jb20+IHdyb3RlOgo+ID4gPj4KPiA+ID4+IFRoZSBhdXhpbGlhcnkgZGV2aWNlIGNyZWF0
aW9uIG9mIHRoaXMgZHJpdmVyIGlzIHNpbXBsZSBlbm91Z2ggdG8KPiA+ID4+IHVzZSB0aGUgYXZh
aWxhYmxlIGF1eGlsaWFyeSBkZXZpY2UgY3JlYXRpb24gaGVscGVyLgo+ID4gPj4KPiA+ID4+IFVz
ZSBpdCBhbmQgcmVtb3ZlIHNvbWUgYm9pbGVycGxhdGUgY29kZS4KPiA+ID4+Cj4gPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KPiA+ID4+IC0t
LQo+ID4gPj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgfCA0OSArKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDQyIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBSZXZpZXdlZC1ieTog
RG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+ID4gPgo+ID4gPiBJJ2xs
IHNub296ZSB0aGlzIGZvciBhIGJ1bmNoIG9mIHdlZWtzIGFuZCBjaGVjayBiYWNrIHRvIHNlZSBp
ZiB0aGlzCj4gPiA+IGNhbiBiZSBsYW5kZWQgaW4gZHJtLW1pc2MtbmV4dCBldmVyeSBvbmNlIGlu
IGEgd2hpbGUuIElmIHlvdSBub3RpY2UKPiA+ID4gdGhhdCBkcm0tbWlzYy1uZXh0IGhhcyB0aGUg
bmVjZXNzYXJ5IHBhdGNoZXMgYmVmb3JlIEkgZG8gdGhlbiBmZWVsCj4gPiA+IGZyZWUgdG8gcG9r
ZSBtZSBhbmQgSSdsbCBjb21taXQgaXQuCj4gPgo+ID4gSGkgRG91ZywKPiA+Cj4gPiBGWUksIHRo
aXMgaXMgc2FmZSB0byB0YWtlIHdpdGggdjYuMTYtcmMxLgo+ID4gUGxlYXNlIGxldCBrbm93IGlu
IGNhc2UgeW91IHByZWZlciBhIHJlc2VuZC4KPgo+IFRoYW5rcyBmb3IgdGhlIHJlbWluZGVyLiBV
bmZvcnR1bmF0ZWx5LCBJIHN0aWxsIG5lZWQgdG8gd2FpdC4gVGhpcwo+IHBhdGNoIHdpbGwgbmVl
ZCB0byBsYW5kIHRocm91Z2ggZHJtLW1pc2MtbmV4dCBhbmQgdGhhdCBkb2Vzbid0IGhhdmUKPiB2
Ni4xNi1yYzEgeWV0Lgo+Cj4gaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1p
c2MvCj4KPiAuLi5wcmVzdW1hYmx5IHY2LjE2LXJjMSB3aWxsIGdldCBtZXJnZWQgaW4gYmVmb3Jl
IHRvbyBtdWNoIGxvbmdlci4KPiBJJ2xsIHRyeSB0byBrZWVwIGFuIGV5ZSBvbiBpdC4KClB1c2hl
ZCB0byBkcm0tbWlzYy1uZXh0OgoKWzMvOF0gZHJtL2JyaWRnZTogdGktc242NWRzaTg2OiB1c2Ug
dGhlIGF1eGlsaWFyeSBkZXZpY2UKICAgICAgY29tbWl0OiA2NTI2YjAyZTEwMjA5NjA4NDY0ZjI2
NDVhZjU5YjJjYzk1NWI1YTE5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
