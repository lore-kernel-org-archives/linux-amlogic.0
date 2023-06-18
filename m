Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFCEEB64D7
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Jun 2023 17:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tc6xa3zKEoyAn/IIxZzGtvWwK2omZC7V5SWCous07WA=; b=W49eA9vMEO7YQ2
	6+wgnfKnQiDOsF52nKT0Eoi0bHszGWkxfN0LGtoWVHftxVmOi/REFCLOoa4kgN+ZqW4ILnvtpXMom
	Rk/FMvC72eBZJezipNCPPZ+yOvxbGgNnVc+N4etHyeY0t8J8WRrodvdi5I7kV9bUakfxi5LhKVTne
	zf/dbKa9eNqitVFeLEj78DneWkJX8xKxln/qKkVvQSulr3Zab+QdLkCzngmW4GpUHzhNNjVu+lnbM
	x/cZDDiuhsfcH/F+1chYQ0yn+nJtNU35ofPK035hN6TFrlgNCJ5fGaShKCGH0FZ7MT6R8wSsIHEj7
	nekZpXOQQsiPG3hTXi6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAwLd-006OxE-1E;
	Sun, 18 Jun 2023 17:37:57 +0000
Received: from mail-yw1-f181.google.com ([209.85.128.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAwLb-006OwK-04;
	Sun, 18 Jun 2023 17:37:56 +0000
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5704ddda6dfso32490377b3.1;
        Sun, 18 Jun 2023 10:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687109873; x=1689701873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AjyowO3olSkVxM1P/M6uTj58+6YqzrML2c9g+1elEw8=;
        b=HOCj9gaCCEZqTRYPcQcQSX8TAd7l7Me+SVViTFRMkOpYd02ovMGs1SYI85WHsC43pO
         Z0mfUD7rcq+2X4lQVopQsbrsocG1W6vutHObMFzge6cFmfBlLiycZjcfRyIQI8XI180A
         Xk6aeHlFhTbK2yBKmp+pFT5hnQtJ91zfHQD5Zjgk4uuy+W4Ii5jzDIp8eJD/6mQ6OUZd
         1Y1mo9fmG1z7ZfwBoEX/ousc7LiTYTuY3/L6OO5uatVAHm5C+J8P9UhG8fKlif2bIVHx
         UklFz5fpR4AIkz5gOKMgwL+VbHHcce8pbDC+b6OhNcdtqZ9WBB1HswoJ3O840wBz70wA
         oEEQ==
X-Gm-Message-State: AC+VfDzWrAlA6gjjUzizkhxUmZ4VZt4rDo66q3R6JHEifiBxadFmOA6J
	dkJPPK9XOYmCz+k9Sz8G5hCJoFpBVodAFwzgGDU=
X-Google-Smtp-Source: ACHHUZ5u8sPekOgq4nFJMvR54JVb7Im/JeFMcU3zHPrMWrlRfiur7402ANr6lkeezUkpI7H3eKaqSA==
X-Received: by 2002:a81:6cd7:0:b0:56d:9e9:c2a1 with SMTP id h206-20020a816cd7000000b0056d09e9c2a1mr9235444ywc.16.1687109872877;
        Sun, 18 Jun 2023 10:37:52 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id s189-20020a0dd0c6000000b005732b228a83sm589998ywd.140.2023.06.18.10.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 10:37:52 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-bd729434fa0so3054832276.1;
        Sun, 18 Jun 2023 10:37:51 -0700 (PDT)
X-Received: by 2002:a25:ad1e:0:b0:bcb:3280:57fc with SMTP id
 y30-20020a25ad1e000000b00bcb328057fcmr5010633ybi.53.1687109871675; Sun, 18
 Jun 2023 10:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230615182938.18487-1-tanure@linux.com> <20230615182938.18487-5-tanure@linux.com>
 <20230615-mushroom-numeric-3a4c03f2204b@spud>
In-Reply-To: <20230615-mushroom-numeric-3a4c03f2204b@spud>
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 18 Jun 2023 18:37:40 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2ND=GJEEXdLLpEWoecN5gtZm-1i92pAgi+eQocSRUVqw@mail.gmail.com>
Message-ID: <CAJX_Q+2ND=GJEEXdLLpEWoecN5gtZm-1i92pAgi+eQocSRUVqw@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: serial: amlogic, meson-uart: support T7
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nick <nick@khadas.com>, Artem <art@khadas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_103755_059967_F8919A1C 
X-CRM114-Status: GOOD (  17.68  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gMTUsIDIwMjMgYXQgMTA6MjXigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdW4gMTUsIDIwMjMgYXQgMDc6Mjk6MzZQTSAr
MDEwMCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+ID4gQWRkIHNlcmlhbCBiaW5kaW5ncyBzdXBwb3J0
IG1lbnNvbiBUNyBTb0MgZmFtaWx5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFRhbnVy
ZSA8dGFudXJlQGxpbnV4LmNvbT4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwgfCAxICsKPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hbWxvZ2ljLG1lc29uLXVhcnQueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11
YXJ0LnlhbWwKPiA+IGluZGV4IDAxZWM0NWIzYjQwNi4uMDFiMDFmODg0MGVhIDEwMDY0NAo+ID4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hbWxvZ2ljLG1l
c29uLXVhcnQueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NlcmlhbC9hbWxvZ2ljLG1lc29uLXVhcnQueWFtbAo+ID4gQEAgLTQ2LDYgKzQ2LDcgQEAgcHJv
cGVydGllczoKPiA+ICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uOGItdWFydAo+ID4gICAgICAg
ICAgICAtIGFtbG9naWMsbWVzb24tZ3gtdWFydAo+ID4gICAgICAgICAgICAtIGFtbG9naWMsbWVz
b24tczQtdWFydAo+ID4gKyAgICAgICAgICAtIGFtbG9naWMsbWVzb24tdDctdWFydAo+Cj4gfCBk
aWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYyBiL2RyaXZlcnMvdHR5
L3NlcmlhbC9tZXNvbl91YXJ0LmMKPiB8IGluZGV4IDI1MDFkYjVhN2FhZi4uMDIwOGY5YTZiYTdl
IDEwMDY0NAo+IHwgLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+IHwgKysr
IGIvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+IHwgQEAgLTc5Niw2ICs3OTYsMTAg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbWVzb25fdWFydF9kdF9tYXRjaFtd
ID0gewo+IHwgICAgICAgICAgICAgICAgIC5jb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tczQt
dWFydCIsCj4gfCAgICAgICAgICAgICAgICAgLmRhdGEgPSAodm9pZCAqKSZtZXNvbl9nMTJhX3Vh
cnRfZGF0YSwKPiB8ICAgICAgICAgfSwKPiB8ICsgICAgICAgewo+IHwgKyAgICAgICAgICAgICAg
IC5jb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tdDctdWFydCIsCj4gfCArICAgICAgICAgICAg
ICAgLmRhdGEgPSAodm9pZCAqKSZtZXNvbl9nMTJhX3VhcnRfZGF0YSwKPiB8ICsgICAgICAgfSwK
PiB8ICAgICAgICAgeyAvKiBzZW50aW5lbCAqLyB9LAo+IHwgIH07Cj4gfCAgTU9EVUxFX0RFVklD
RV9UQUJMRShvZiwgbWVzb25fdWFydF9kdF9tYXRjaCk7Cj4KPiBZb3UncmUgYWRkaW5nIGFub3Ro
ZXIgZWxlbWVudCB0byB0aGlzIGVudW0sIGJ1dCB0aGUgZHJpdmVyIGNoYW5nZQo+IGltcGxpZXMg
Y29tcGF0aWJpbGl0eSB3aXRoIHRoZSBzNCB1YXJ0LiBTaG91bGQgeW91IG5vdCBzZXQgdGhpcyB1
cCB3aXRoCj4gZmFsbGJhY2sgY29tcGF0aWJsZXM/CgpJIHdpbGwgZHJvcCB0aGlzIHBhdGNoIGFu
ZCB1c2UgdGhlIHM0IGFuZCBnMTJhIGNvbXBhdGlibGUgc3RyaW5ncy4KCj4KPiBDaGVlcnMsCj4g
Q29ub3IuCj4KPiA+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBFdmVyeXRoaW5nLUVsc2UgcG93ZXIg
ZG9tYWluIFVBUlQgY29udHJvbGxlciBvbiBHMTJBIFNvQ3MKPiA+ICAgICAgICAgIGl0ZW1zOgo+
ID4gICAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLG1lc29uLWcxMmEtdWFydAo+ID4gLS0KPiA+
IDIuNDEuMAo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
