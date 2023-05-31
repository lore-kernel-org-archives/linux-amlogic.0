Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369EFC77B7A
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 May 2023 09:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qq8eq+hU7OrxYIywhCkw01HbaQrPfbd/orAWAZe9pnQ=; b=JpmPhSs+csBbGw
	1e4huhqP8537zrFJXw6KZOp/KnbYiTFQKuV6WFkFcHroLH4yQiRZVTdJDrilVJgKGCyMnmdpLMiQw
	9YW6LjgJgK1cXOpneQGOfC4bid2qnWeR12hrq46ySTVqluG9dGMh3jN1sSERabDBOhZEQEp1nfsxj
	71LhDGA/blosZ1K9hDLOmUiLvp9q1udlIccfOACxN3arYFc042gPjITEeMse4Zw1wr2MTPqDnSGNO
	r7Lj3eRNqRZoTdTHGWPEP9f6rd0Jqf3XXXrzjWYFcKrx2W1ufA4BeK/0oh/gqUf4vkStsJDrcZsVD
	e+OFIpWjVwDF90FL/9uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4I1M-00GqtU-1Z;
	Wed, 31 May 2023 09:21:32 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4I1I-00Gqr2-29
	for linux-amlogic@lists.infradead.org;
	Wed, 31 May 2023 09:21:30 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-33b9a56e261so6215495ab.0
        for <linux-amlogic@lists.infradead.org>; Wed, 31 May 2023 02:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685524887; x=1688116887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqZtyuK0U15DxZmjBsyfHeiLrrKr6W4JwftADT3FJhk=;
        b=4qC36suMHU6JStzGoINSAsJQMh6mklFEHuUchbO29b+s0jEjA05FUl6zoMoZcTpZoS
         oeAvnDggv/NdN2RHO/JYaxxkKjcQoymLf3On58NMUTcsUBHLwtd14mlCoObYepeZMGa4
         28CkUtsq8b3j0z9EF0NCRn4YdLem/92uWjpocIG3rpbUd62MbyOSLDPLlAYbefN99eVN
         qkYl99/Z2FZGjA8YGrchPpbz9bF4eFTxEux1kINW7KpiemoLomj85QHY4OchO4y80p3/
         4OySMVSLs9R/36wFuR2T7//IUiL4BuyFweh4QGIvJDrI7xyZp0VqvGcTGWIuxJ0EdEv1
         nEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685524887; x=1688116887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqZtyuK0U15DxZmjBsyfHeiLrrKr6W4JwftADT3FJhk=;
        b=DgBdV0wvNfdg5i6LlIB21ErhyG28tuFIZ0tPkKK/PWbgeYihABYObucuTeMocVQWUM
         SRcWhFXZ4nZldV8R7ATWHnt5zULQCHjGXkK9HLRoK0gXHuwsVQPDeU8f/cY78BOYpEa3
         n9YLpWF+ourAsjS47qtfukXW4fLM/EZPKLSWJfOOB5eEMKh3GXyC3QX1kyI5+cv476IU
         mxWm0irmp+VQig7aQoyaj4RBOp4W4SlA+14wBC1rr7ynWrtlz7TgsE3Ff3V3Zmc6nfRU
         z4IG+GYa75r45YKQUPkdWmFJtVbvJQDqr8XuQpbvbf2pMsQG1mqUuqHuwpKEyRW/gLAK
         8nug==
X-Gm-Message-State: AC+VfDwVtkywGdx4I+wenyCCsfOghHZXpdrVaBWQD+OIcBurtB0yFhkV
	tiDki8FF+3ZHJLQI+dsPV4nb1TDv3eB2Qu4u+dqpdw==
X-Google-Smtp-Source: ACHHUZ7LyNPt0HxypRayhfIi1WaR82cDETNK2Qlv3mO6R6AEg1TP7OgHUVcQmfU3nr4LBKzkcW68vrtg/txWvI6ifcw=
X-Received: by 2002:a92:d0c3:0:b0:33b:16e9:bba5 with SMTP id
 y3-20020a92d0c3000000b0033b16e9bba5mr1903781ila.28.1685524887536; Wed, 31 May
 2023 02:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-9-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-9-56eb7a4d5b8e@linaro.org>
From: Nicolas Belin <nbelin@baylibre.com>
Date: Wed, 31 May 2023 11:21:16 +0200
Message-ID: <CAJZgTGF7VJEW0-5Gctfft6r-9tFzw9oFV8hmeEqhSUrqmQ3tZg@mail.gmail.com>
Subject: Re: [PATCH v5 09/17] drm/meson: only use components with dw-hdmi
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Sam Ravnborg <sam@ravnborg.org>, "Lukas F. Hartmann" <lukas@mntre.com>, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_022128_722230_D579B861 
X-CRM114-Status: GOOD (  22.98  )
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

TGUgbWFyLiAzMCBtYWkgMjAyMyDDoCAwOTozOCwgTmVpbCBBcm1zdHJvbmcKPG5laWwuYXJtc3Ry
b25nQGxpbmFyby5vcmc+IGEgw6ljcml0IDoKPgo+IE9ubHkgRFctSERNSSBjdXJyZW50bHkgbmVl
ZHMgY29tcG9uZW50cyBzaW5jZSBpdCByZXVzZXMKPiB0aGUgZHJtLW1lc29uIGRyaXZlciBjb250
ZXh0IHRvIGFjY2VzcyBISEkgcmVnaXN0ZXJzIChzaWMpLgo+Cj4gT25jZSB0aGlzIGlzIHNvbHZl
ZCwgd2UgY2FuIGdldCByaWQgb24gY29tcG9uZW50cy4KPgo+IFVudGlsIG5vdywgbGltaXQgdGhl
IGNvbXBvbmVudHMgbWF0Y2hpbmcgdG8gdGhlIGR3LWhkbWkgY29tcGF0aWJsZXMKPiB3ZSBrbm93
IHRvIHJlcXVpcmUgdGhpcyBoYWNrLCBmb3Igb3RoZXIgYnJpZGdlcyBzaW1wbHkgdXNlIHByb2Jl
IGRlZmVyCj4gaW5zdGVhZCBhbmQgZ2V0IG92ZXIgdGhpcyBjb21wb25lbnRzIHNpdGF0aW9uLgo+
Cj4gVGhlIGJhY2sgc3RvcnkgaXMgdGhhdCB3ZSBzaW1wbHkgY2Fubm90IGF0dGFjaCBEU0kgYWRh
cHRlcnMgYnJpZGdlcwo+IGlmIHdlIHVzZSBjb21wb25lbnRzLCBvbmx5IERTSSBwYW5lbHMsIHRo
aXMgaXMgYmVjYXVzZSB3ZSBiaW5kL3VuYmluZAo+IHRoZSBEU0kgY29udHJvbGxlciBhdCBlYWNo
IGRybS1tZXNvbiBkcml2ZXIgbWFzdGVyIGJpbmQgdGVudGF0aXZlLgo+IFdpdGggdGhpcyB0aGUg
STJDIERTSSBicmlkZ2UgaXMgdW5hYmxlIHRvIGZpbmQgdGhlIERTSSBjb250cm9sbGVyCj4gaG9z
dCBhbmQgZXZlcnl0aGluZyBmYWlscyB0byBwcm9iZS4KPgo+IFRoaXMgd2lsbCBzaW1wbGlmeSBh
IGxvdCBhZGRpbmcgbmV3IG9yIG9sZGVyIEhETUkgYnJpZGdlcy4KPgo+IENjOiBNYXJ0aW4gQmx1
bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMgfCAzMCArKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDE0IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYwo+IGluZGV4IGUwNjAyNzlk
YzgwYS4uZTkzNWMwMjg2YTIwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9t
ZXNvbl9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYwo+IEBA
IC00NTEsMTAgKzQ1MSwxNyBAQCBzdGF0aWMgdm9pZCBtZXNvbl9kcnZfc2h1dGRvd24oc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAgIGRybV9hdG9taWNfaGVscGVyX3NodXRk
b3duKHByaXYtPmRybSk7Cj4gIH0KPgo+IC0vKiBQb3NzaWJsZSBjb25uZWN0b3JzIG5vZGVzIHRv
IGlnbm9yZSAqLwo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBjb25uZWN0b3Jz
X21hdGNoW10gPSB7Cj4gLSAgICAgICB7IC5jb21wYXRpYmxlID0gImNvbXBvc2l0ZS12aWRlby1j
b25uZWN0b3IiIH0sCj4gLSAgICAgICB7IC5jb21wYXRpYmxlID0gInN2aWRlby1jb25uZWN0b3Ii
IH0sCj4gKy8qCj4gKyAqIE9ubHkgZGV2aWNlcyB0byB1c2UgYXMgY29tcG9uZW50cwo+ICsgKiBU
T0ZJWDogZ2V0IHJpZCBvZiBjb21wb25lbnRzIHdoZW4gd2UgY2FuIGZpbmFsbHkKPiArICogZ2V0
IG1lc29uX2R4X2hkbWkgdG8gc3RvcCB1c2luZyB0aGUgbWVzb25fZHJtCj4gKyAqIHByaXZhdGUg
c3RydWN0dXJlIGZvciBISEkgcmVnaXN0ZXJzLgo+ICsgKi8KPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgY29tcG9uZW50c19kZXZfbWF0Y2hbXSA9IHsKPiArICAgICAgIHsgLmNv
bXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1neGJiLWR3LWhkbWkiIH0sCj4gKyAgICAgICB7IC5j
b21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tZ3hsLWR3LWhkbWkiIH0sCj4gKyAgICAgICB7IC5j
b21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tZ3htLWR3LWhkbWkiIH0sCj4gKyAgICAgICB7IC5j
b21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tZzEyYS1kdy1oZG1pIiB9LAo+ICAgICAgICAge30K
PiAgfTsKPgo+IEBAIC00NzIsMTcgKzQ3OSwxMiBAQCBzdGF0aWMgaW50IG1lc29uX2Rydl9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnRpbnVlOwo+ICAgICAgICAgICAgICAgICB9Cj4KPiAtICAgICAgICAgICAgICAgLyogSWYg
YW4gYW5hbG9nIGNvbm5lY3RvciBpcyBkZXRlY3RlZCwgY291bnQgaXQgYXMgYW4gb3V0cHV0ICov
Cj4gLSAgICAgICAgICAgICAgIGlmIChvZl9tYXRjaF9ub2RlKGNvbm5lY3RvcnNfbWF0Y2gsIHJl
bW90ZSkpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICArK2NvdW50Owo+IC0gICAgICAgICAg
ICAgICAgICAgICAgIG9mX25vZGVfcHV0KHJlbW90ZSk7Cj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgY29udGludWU7Cj4gLSAgICAgICAgICAgICAgIH0KPiAtCj4gLSAgICAgICAgICAgICAgIGRl
dl9kYmcoJnBkZXYtPmRldiwgInBhcmVudCAlcE9GIHJlbW90ZSBtYXRjaCBhZGQgJXBPRiBwYXJl
bnQgJXNcbiIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgbnAsIHJlbW90ZSwgZGV2X25hbWUo
JnBkZXYtPmRldikpOwo+ICsgICAgICAgICAgICAgICBpZiAob2ZfbWF0Y2hfbm9kZShjb21wb25l
bnRzX2Rldl9tYXRjaCwgcmVtb3RlKSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBv
bmVudF9tYXRjaF9hZGQoJnBkZXYtPmRldiwgJm1hdGNoLCBjb21wb25lbnRfY29tcGFyZV9vZiwg
cmVtb3RlKTsKPgo+IC0gICAgICAgICAgICAgICBjb21wb25lbnRfbWF0Y2hfYWRkKCZwZGV2LT5k
ZXYsICZtYXRjaCwgY29tcG9uZW50X2NvbXBhcmVfb2YsIHJlbW90ZSk7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgZGV2X2RiZygmcGRldi0+ZGV2LCAicGFyZW50ICVwT0YgcmVtb3RlIG1hdGNo
IGFkZCAlcE9GIHBhcmVudCAlc1xuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IG5wLCByZW1vdGUsIGRldl9uYW1lKCZwZGV2LT5kZXYpKTsKPiArICAgICAgICAgICAgICAgfQo+
Cj4gICAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KHJlbW90ZSk7Cj4KPgo+IC0tCj4gMi4zNC4x
Cj4KUmV2aWV3ZWQtYnk6IE5pY29sYXMgQmVsaW4gPG5iZWxpbkBiYXlsaWJyZS5jb20+ClRlc3Rl
ZC1ieTogTmljb2xhcyBCZWxpbiA8bmJlbGluQGJheWxpYnJlLmNvbT4gIyBvbiBLaGFkYXMgVklN
MyArIFRTMDUwIFBhbmVsCgpUaGFua3MsCk5pY29sYXMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
