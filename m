Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09058C77B73
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 May 2023 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BECGSmgiQ/2d5McHZmZf/H/k9IwkfnRxcXW4ejHP8ls=; b=I0rTH2BBAbZVFZ
	NvS95DfbMtbu0JCAuetZHTPG+eUzjhsF4hoFpABS1MLjG1+V3R66ak0iPR9lw1HomYPxpj5bYCEgk
	DjhUdWrWuRJzebAdAFt83YVHBhIfbNiJky1A62sXYJ/suiCCud9kPxjFAPhXQDjaiq3e/s3WUwSa7
	pH9rGIEwT01/ScOJy+AgJESClb+OPrcRVby34P9WWxerZb8bt2hENBk0bWGLR+jr0auMuGZ5/E5Cn
	CNSHHPsLKtFWpr0oQ3/DCkyN4wA2QpAxAja3vdqfm6R176+itX6TSz/nVtsRHqhQGj+qrx4f8LJJ/
	G5ZvHlinVXdG8l175n3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Hzh-00GqSp-34;
	Wed, 31 May 2023 09:19:49 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Hze-00GqQc-18
	for linux-amlogic@lists.infradead.org;
	Wed, 31 May 2023 09:19:48 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b038064d97so5694925ad.0
        for <linux-amlogic@lists.infradead.org>; Wed, 31 May 2023 02:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685524783; x=1688116783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/F8jIF8NqATxdAvMuHV954nGjADHoS+vIBQmhEkWOs=;
        b=g2QKglMZH/mJ1PlHw0xaAb1Atu0wvBgVAqYnuu8mReQEONCqAC+kuvmXr1GOl2K8hi
         PELXRr9/ZHFzDZ1y3TGPnhTkxyRxzi2WWpiULuLFvRre0MOUR2wmfXd4PYcyHYisgga9
         vIxf3UCExwjWT2hL5wZhyPw1/THRLmg9F35utlvE2h3bHMSJOdGF1FVhqXM8zvkuKeiA
         QDOmg7HzxXmpRYriQ+VggWvGgLlVCw55VPwJnR21xsMdQuKGIVaBL+9JKvxwHIb3unI0
         dNbqyoJWOojJolHETOZRlnmey1S+0lkpPlrlK4bJKbtj2DG0b51oWPxTwnJeIwJ9apJ4
         TZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685524783; x=1688116783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/F8jIF8NqATxdAvMuHV954nGjADHoS+vIBQmhEkWOs=;
        b=WqW+9E6ogdCf+T4nBpPyKplpW19j1cNzhGJYSI5U6pI5SCNsLlZqYszdxfgJQ45Isl
         qKcf30cPO4N028L6G1xnG8kVzVXAsq/VzRnCskxFuwKy4VDPQz+adqWRXWxuxCKOhLI4
         IpbSJvdH8Fu6l6Gmt4iOLWwRVWoZSo9kDLM3iRA5hXM1BzGQwmaQipmZTnBSduEsSWW0
         A2inLhjERphvzGErQZQSB6o70GggeEY9jSHIxHtVQIEHSKSUKVH1LupQmi2coZgWqShU
         23RuZRRCOIJc/VB1LZKgV3bzkTYHtf97qM9KS4DeZMGGyYamjMRSZtDF4Lx5e6/PlFSP
         BhJA==
X-Gm-Message-State: AC+VfDyZHvWQIB2zqeefi19Bj93IsPpV6SUPjYgdecn2DiVSjXWHVE1A
	l5CiXnErqAjC5HKOUbCWLGlYOkabQViJRxWjZF6NpA==
X-Google-Smtp-Source: ACHHUZ6Ofzg7tjk5fXnBtT7CKLOKxvtwCuBdh95OKJ7ZvI9XlppTjSg852EOtBKSeeNZAfFL9zCpUaqHc9KwNzmaA5U=
X-Received: by 2002:a17:902:e744:b0:1ac:86b5:70d9 with SMTP id
 p4-20020a170902e74400b001ac86b570d9mr14542055plf.32.1685524783362; Wed, 31
 May 2023 02:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-8-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-8-56eb7a4d5b8e@linaro.org>
From: Nicolas Belin <nbelin@baylibre.com>
Date: Wed, 31 May 2023 11:19:32 +0200
Message-ID: <CAJZgTGEQ3B5M9BtDfUdyMiH+VQkWcFHU2fOJgE_1=a4E1bxMTA@mail.gmail.com>
Subject: Re: [PATCH v5 08/17] drm/meson: fix unbind path if HDMI fails to bind
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
X-CRM114-CacheID: sfid-20230531_021946_406714_3C341128 
X-CRM114-Status: GOOD (  17.79  )
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
b25nQGxpbmFyby5vcmc+IGEgw6ljcml0IDoKPgo+IElmIHRoZSBjYXNlIHRoZSBIRE1JIGNvbnRy
b2xsZXIgZmFpbHMgdG8gYmluZCwgd2UgdHJ5IHRvIHVuYmluZAo+IGFsbCBjb21wb25lbnRzIGJl
Zm9yZSBjYWxsaW5nIGRybV9kZXZfcHV0KCkgd2hpY2ggbWFrZXMgZHJtX2JyaWRnZV9kZXRhY2go
KQo+IGNyYXNoIGJlY2F1c2UgdW5iaW5kaW5nIHRoZSBIRE1JIGNvbnRyb2xsZXIgZnJlZXMgdGhl
IGJyaWRnZSBtZW1vcnkuCj4KPiBUaGUgc29sdXRpb24gaXMgdGhlIHVuYmluZCBhbGwgY29tcG9u
ZW50cyBhdCB0aGUgZW5kIGxpa2UgaW4gdGhlIHJlbW92ZQo+IHBhdGguCj4KPiBTaWduZWQtb2Zm
LWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jIHwgMjMgKysrKysrKysrKysrKystLS0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jCj4gaW5kZXggY2E2ZDFlNTllNWQ5Li5lMDYw
Mjc5ZGM4MGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jCj4gQEAgLTMxNiwzMiAr
MzE2LDM0IEBAIHN0YXRpYyBpbnQgbWVzb25fZHJ2X2JpbmRfbWFzdGVyKHN0cnVjdCBkZXZpY2Ug
KmRldiwgYm9vbCBoYXNfY29tcG9uZW50cykKPiAgICAgICAgICAgICAgICAgZ290byBleGl0X2Fm
YmNkOwo+Cj4gICAgICAgICBpZiAoaGFzX2NvbXBvbmVudHMpIHsKPiAtICAgICAgICAgICAgICAg
cmV0ID0gY29tcG9uZW50X2JpbmRfYWxsKGRybS0+ZGV2LCBkcm0pOwo+ICsgICAgICAgICAgICAg
ICByZXQgPSBjb21wb25lbnRfYmluZF9hbGwoZGV2LCBkcm0pOwo+ICAgICAgICAgICAgICAgICBp
ZiAocmV0KSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2Vycihkcm0tPmRldiwgIkNv
dWxkbid0IGJpbmQgYWxsIGNvbXBvbmVudHNcbiIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAg
IC8qIERvIG5vdCB0cnkgdG8gdW5iaW5kICovCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaGFz
X2NvbXBvbmVudHMgPSBmYWxzZTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGV4aXRf
YWZiY2Q7Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPgo+ICAgICAgICAgcmV0ID0g
bWVzb25fZW5jb2Rlcl9oZG1pX2luaXQocHJpdik7Cj4gICAgICAgICBpZiAocmV0KQo+IC0gICAg
ICAgICAgICAgICBnb3RvIHVuYmluZF9hbGw7Cj4gKyAgICAgICAgICAgICAgIGdvdG8gZXhpdF9h
ZmJjZDsKPgo+ICAgICAgICAgcmV0ID0gbWVzb25fcGxhbmVfY3JlYXRlKHByaXYpOwo+ICAgICAg
ICAgaWYgKHJldCkKPiAtICAgICAgICAgICAgICAgZ290byB1bmJpbmRfYWxsOwo+ICsgICAgICAg
ICAgICAgICBnb3RvIGV4aXRfYWZiY2Q7Cj4KPiAgICAgICAgIHJldCA9IG1lc29uX292ZXJsYXlf
Y3JlYXRlKHByaXYpOwo+ICAgICAgICAgaWYgKHJldCkKPiAtICAgICAgICAgICAgICAgZ290byB1
bmJpbmRfYWxsOwo+ICsgICAgICAgICAgICAgICBnb3RvIGV4aXRfYWZiY2Q7Cj4KPiAgICAgICAg
IHJldCA9IG1lc29uX2NydGNfY3JlYXRlKHByaXYpOwo+ICAgICAgICAgaWYgKHJldCkKPiAtICAg
ICAgICAgICAgICAgZ290byB1bmJpbmRfYWxsOwo+ICsgICAgICAgICAgICAgICBnb3RvIGV4aXRf
YWZiY2Q7Cj4KPiAgICAgICAgIHJldCA9IHJlcXVlc3RfaXJxKHByaXYtPnZzeW5jX2lycSwgbWVz
b25faXJxLCAwLCBkcm0tPmRyaXZlci0+bmFtZSwgZHJtKTsKPiAgICAgICAgIGlmIChyZXQpCj4g
LSAgICAgICAgICAgICAgIGdvdG8gdW5iaW5kX2FsbDsKPiArICAgICAgICAgICAgICAgZ290byBl
eGl0X2FmYmNkOwo+Cj4gICAgICAgICBkcm1fbW9kZV9jb25maWdfcmVzZXQoZHJtKTsKPgo+IEBA
IC0zNTksMTUgKzM2MSwxOCBAQCBzdGF0aWMgaW50IG1lc29uX2Rydl9iaW5kX21hc3RlcihzdHJ1
Y3QgZGV2aWNlICpkZXYsIGJvb2wgaGFzX2NvbXBvbmVudHMpCj4KPiAgdW5pbnN0YWxsX2lycToK
PiAgICAgICAgIGZyZWVfaXJxKHByaXYtPnZzeW5jX2lycSwgZHJtKTsKPiAtdW5iaW5kX2FsbDoK
PiAtICAgICAgIGlmIChoYXNfY29tcG9uZW50cykKPiAtICAgICAgICAgICAgICAgY29tcG9uZW50
X3VuYmluZF9hbGwoZHJtLT5kZXYsIGRybSk7Cj4gIGV4aXRfYWZiY2Q6Cj4gICAgICAgICBpZiAo
cHJpdi0+YWZiY2Qub3BzKQo+ICAgICAgICAgICAgICAgICBwcml2LT5hZmJjZC5vcHMtPmV4aXQo
cHJpdik7Cj4gIGZyZWVfZHJtOgo+ICAgICAgICAgZHJtX2Rldl9wdXQoZHJtKTsKPgo+ICsgICAg
ICAgbWVzb25fZW5jb2Rlcl9oZG1pX3JlbW92ZShwcml2KTsKPiArICAgICAgIG1lc29uX2VuY29k
ZXJfY3Zic19yZW1vdmUocHJpdik7Cj4gKwo+ICsgICAgICAgaWYgKGhhc19jb21wb25lbnRzKQo+
ICsgICAgICAgICAgICAgICBjb21wb25lbnRfdW5iaW5kX2FsbChkZXYsIGRybSk7Cj4gKwo+ICAg
ICAgICAgcmV0dXJuIHJldDsKPiAgfQo+Cj4KPiAtLQo+IDIuMzQuMQo+CgpXb3JrcyBmaW5lIG9u
IGEgS2hhZGFzIFZJTTMgdXNpbmcgYSBUUzA1MCBwYW5lbCwKVGhhbmtzCgpSZXZpZXdlZC1ieTog
Tmljb2xhcyBCZWxpbiA8bmJlbGluQGJheWxpYnJlLmNvbT4KVGVzdGVkLWJ5OiBOaWNvbGFzIEJl
bGluIDxuYmVsaW5AYmF5bGlicmUuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
