Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6139DC77B73
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 May 2023 09:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IUUfZGUgupIooJN85cK6NmmIC/5WEFU8+MHtCHTkhdI=; b=HtMeZpYpg0RXBe
	cX6yukt82nryJzAKw/XTMh5WwkRB3Rffhqql+KWpfNtD4clRgAWOuWqZh7iwVcVikj94hImZC2U5O
	gqhu7kN7PNSLRJaw+EhOaZfWWxVSbvmaKB8dfDwsbX+X/Wbx/qvyL14yWO3mYxLbMh+g8WCVwgRWQ
	kaVtU1NeYXJR+xKOFU7S9uDdlNhBXLzzG7U9xOKFZx9Q0ku6SYiybGV/uAZ5BCrg50qfnCRVVM0Jd
	Ijg0pL3enuVxtrtJyjhm92N+c176ZcvRy752xK25V4jDsRaziAsLz4edmUNL3iCwPYiIzgJS0m34v
	sSf/uPy3usRwM0KWlWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4I3K-00GrSk-3A;
	Wed, 31 May 2023 09:23:34 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4I3I-00GrQA-18
	for linux-amlogic@lists.infradead.org;
	Wed, 31 May 2023 09:23:34 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-33c37f62e24so820835ab.3
        for <linux-amlogic@lists.infradead.org>; Wed, 31 May 2023 02:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685525009; x=1688117009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkehbS7//ferRXwM6kvo7oRNHn1QNtaSgYp/ExQ0jdM=;
        b=jwezaxfaUWtfR62wBCm6nQcQVihAO87LksVgscSu+iYR71oqCzT7dg9trN4Mcl1t3F
         pUOWJGlu+fg63SeGPua4KDd5/Km6Ky0jKMCsTTx86qjTONR/CjhiyuYvqCsFJjLwa2xa
         7QHQnbeJ3NqVDZtNJlD5zpintmktBrldJaOCReUdHGrQyDX/msTjP6WwhC2zB4bqu4pm
         K0x7sNwxF5JGH3aVWDIRb0X6yZfHbWS4Cb9uvH1MdL7gg+ZpaDbt4LcFQR0ko8AQpH2f
         AXfhvMHO1efJk+b6J7sc3al/DAvDaeZX2+sDfe84r68ln1NG8xSl2CmcJzjrS+Xzv3hx
         /ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685525009; x=1688117009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkehbS7//ferRXwM6kvo7oRNHn1QNtaSgYp/ExQ0jdM=;
        b=I9ZXFLXLPj8oPFImB2GrMotk2xENmY483wJIc/pKpGhdWWPfWCBnNRhPKi+H7Fnqdd
         ctDoTwJxi2F7QRM1goW6+JsHFc2jCvf2bHossSsIg0A6KzGPF9W9Kuq7/wXDNC6pLayj
         ZpJOPpRTeOMxkzKneTYO7iEQBLDsyvL/a3WI8lv0m3FksuySHnZr0xPaSgNoZ6fNv3Jr
         jvFmvtkBo1i83O1VA9dBZN7na46oT95HLiq/erqlbdlrAiihdMhKkS5xVry+WSmwN5cc
         M6y3msYfKTPBS631h4l+5eW4jd4L1lQfsdE53WWzCCZOuZItFBYk4UB4urPCnkmksIpl
         XK1g==
X-Gm-Message-State: AC+VfDyJh99rFRNUlw9/+DwIAXU2u1+a3XPhwQ6A78SNTO6X/mzfa4mD
	YPxV9In7zLJUO328T944x2Ngjz79Zr6J2LNqwk6BMZT1iVdsdKjlZX0=
X-Google-Smtp-Source: ACHHUZ70GbnB79GmkXTRMAGnGG/KKU1NUQSh6qgC/iLrY7CmzQsyxOazfkdFa/H20GQjdIwHhjjVzsSUdxUmKohoaIA=
X-Received: by 2002:a92:c60f:0:b0:332:e5aa:f9ab with SMTP id
 p15-20020a92c60f000000b00332e5aaf9abmr1742865ilm.11.1685525009247; Wed, 31
 May 2023 02:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-13-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-13-56eb7a4d5b8e@linaro.org>
From: Nicolas Belin <nbelin@baylibre.com>
Date: Wed, 31 May 2023 11:23:17 +0200
Message-ID: <CAJZgTGExa-Bx3uxEYr3KLEs84-GGR-=siY2UM+Z2kE9cJSUOcA@mail.gmail.com>
Subject: Re: [PATCH v5 13/17] drm/panel: khadas-ts050: update timings to
 achieve 60Hz refresh rate
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
X-CRM114-CacheID: sfid-20230531_022332_390699_F91E0814 
X-CRM114-Status: GOOD (  14.24  )
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
b25nQGxpbmFyby5vcmc+IGEgw6ljcml0IDoKPgo+IFRoaXMgdXBkYXRlcyB0aGUgcGFuZWwgdGlt
aW5ncyB0byBhY2hpZXZlIGEgY2xlYW4gNjBIeiByZWZyZXNoIHJhdGUuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLWtoYWRhcy10czA1MC5jIHwgMTYgKysrKysrKyst
LS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1raGFkYXMtdHMw
NTAuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1raGFkYXMtdHMwNTAuYwo+IGluZGV4
IDFhYjFlYmUzMDg4Mi4uYjk0MmEwMTYyMjc0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1raGFkYXMtdHMwNTAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1raGFkYXMtdHMwNTAuYwo+IEBAIC01NjgsNyArNTY4LDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBraGFkYXNfdHMwNTBfcGFuZWxfY21kIGluaXRfY29kZVtdID0gewo+ICAgICAgICAg
ezB4ZmIsIDB4MDF9LAo+ICAgICAgICAgLyogU2VsZWN0IENNRDEgKi8KPiAgICAgICAgIHsweGZm
LCAweDAwfSwKPiAtICAgICAgIHsweGQzLCAweDA1fSwgLyogUkdCTUlQSUNUUkw6IFZTWU5DIGJh
Y2sgcG9yY2ggPSA1ICovCj4gKyAgICAgICB7MHhkMywgMHgyMn0sIC8qIFJHQk1JUElDVFJMOiBW
U1lOQyBiYWNrIHBvcmNoID0gMzQgKi8KPiAgICAgICAgIHsweGQ0LCAweDA0fSwgLyogUkdCTUlQ
SUNUUkw6IFZTWU5DIGZyb250IHBvcmNoID0gNCAqLwo+ICB9Owo+Cj4gQEAgLTcxNywxNSArNzE3
LDE1IEBAIHN0YXRpYyBpbnQga2hhZGFzX3RzMDUwX3BhbmVsX2Rpc2FibGUoc3RydWN0IGRybV9w
YW5lbCAqcGFuZWwpCj4gIH0KPgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21v
ZGUgZGVmYXVsdF9tb2RlID0gewo+IC0gICAgICAgLmNsb2NrID0gMTIwMDAwLAo+IC0gICAgICAg
LmhkaXNwbGF5ID0gMTA4OCwKPiAtICAgICAgIC5oc3luY19zdGFydCA9IDEwODggKyAxMDQsCj4g
LSAgICAgICAuaHN5bmNfZW5kID0gMTA4OCArIDEwNCArIDQsCj4gLSAgICAgICAuaHRvdGFsID0g
MTA4OCArIDEwNCArIDQgKyAxMjcsCj4gKyAgICAgICAuY2xvY2sgPSAxNjAwMDAsCj4gKyAgICAg
ICAuaGRpc3BsYXkgPSAxMDgwLAo+ICsgICAgICAgLmhzeW5jX3N0YXJ0ID0gMTA4MCArIDExNywK
PiArICAgICAgIC5oc3luY19lbmQgPSAxMDgwICsgMTE3ICsgNSwKPiArICAgICAgIC5odG90YWwg
PSAxMDgwICsgMTE3ICsgNSArIDE2MCwKPiAgICAgICAgIC52ZGlzcGxheSA9IDE5MjAsCj4gICAg
ICAgICAudnN5bmNfc3RhcnQgPSAxOTIwICsgNCwKPiAtICAgICAgIC52c3luY19lbmQgPSAxOTIw
ICsgNCArIDIsCj4gLSAgICAgICAudnRvdGFsID0gMTkyMCArIDQgKyAyICsgMywKPiArICAgICAg
IC52c3luY19lbmQgPSAxOTIwICsgNCArIDMsCj4gKyAgICAgICAudnRvdGFsID0gMTkyMCArIDQg
KyAzICsgMzEsCj4gICAgICAgICAuZmxhZ3MgPSBEUk1fTU9ERV9GTEFHX05IU1lOQyB8IERSTV9N
T0RFX0ZMQUdfTlZTWU5DLAo+ICB9Owo+Cj4KPiAtLQo+IDIuMzQuMQo+ClJldmlld2VkLWJ5OiBO
aWNvbGFzIEJlbGluIDxuYmVsaW5AYmF5bGlicmUuY29tPgpUZXN0ZWQtYnk6IE5pY29sYXMgQmVs
aW4gPG5iZWxpbkBiYXlsaWJyZS5jb20+ICMgb24gS2hhZGFzIFZJTTMgKyBUUzA1MCBQYW5lbAoK
VGhhbmtzLApOaWNvbGFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
