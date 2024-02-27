Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C137C5478C
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Feb 2024 13:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKEAr9s2czGDSXMn/CTqBnwIY8m1ZFhLeJh0YqVnBCY=; b=nNv5dIWDy6A4t6
	3iH8H9ka/+H05WBkr83rtvPWf+qlG7qRd4BFbDU1aKYwVCIweRbO5yNKoOLjtqyUQ71UK2SEbAeSm
	RCbp5PQAj3lCAL7dMEm+mZUWgDIvwdtvItAf/eK0/LpZmOt33wkLg9RMUQwKVv1am6ujs7HPg/8Ym
	GIBAJ5w3SsSU/hrgNovjXwGbcEka7NI4SAWc437TsELTbE8mOKBK26l2T/wh7Y4dIGk/zEXe9PU9l
	dW33QxexaRi+YZV5/AUQI+eBZvgVthyKcHyh8+Ip64rXWmTOfFAuv3XZasIPY9zZGhEPE/j3PR75Z
	oqzSdFIAp1HajPiniVXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rex8D-00000005JA9-0qtb;
	Tue, 27 Feb 2024 13:04:25 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rex7y-00000005J39-0tXO;
	Tue, 27 Feb 2024 13:04:12 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-59fd6684316so1791535eaf.0;
        Tue, 27 Feb 2024 05:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709039048; x=1709643848; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HptIF1yWZvMjjphHz7xj8eIlIunqnVXVXD3nCrOY+7Q=;
        b=V1aOyP/HMFnzZQZi58RH9IR7lhvJm3RWTF+Jc54PrkPD7e1cYBYxQXENQARus8d322
         tPqFe4vhGRIVcVDE/vjPFcUgOJ/IIBCc13qJwhKK9i4nMFv+m92fzlRhM7MqZ8u3Fn19
         NH1syaUnZexW7ZKkN2IAsbJiw6pkRhmHl+EEgUdgKhE1jWpqSCVQS04rVoOpcaTDvJCZ
         mWW1ngkF2d9e7S5PCWY8DWm2g60SMQOt3bWkYVDotngyJGHeMCaRyEmvmwpHqSjb0n9M
         b/xYbCsUju+5IK5zxrTmR4KzLNPuhD4lxG3LNhcPK6TzXXy/Nld///tWyVRWHCnTAPcz
         B2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709039048; x=1709643848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HptIF1yWZvMjjphHz7xj8eIlIunqnVXVXD3nCrOY+7Q=;
        b=qULX2nuJRqKwzByqGN/0ngS3uyVrxgVeA61QEzgoGfbR4QIPbe/lMrQ5D46FgP+txF
         nmthtk9mSY54RaXxZCGPrcWkAfd8IToPxWovmX0awCehcyiTBIqAnv4K8L50/ab26p1x
         g/Qe7GH6AuZm3IVyl4VQDM6RURdjNFh/c3PDKmhecwpGq5MRI2++Cu0CK5rEuzvFtgv2
         /IvaVunWIV6JU3gTu8/Gxfxm+NA9hmYBFGdNhyLeT+zKNDXy861aKKioljld6lmSBEXU
         t4xqmDaONQQZVAxz/eaNIHFho6dB67sDuqSuYad5UvETL+pp8QfX2jZ9ZuHBglDZO4EL
         jItQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6c5XSODHFbE3/hR5y5Mt5VXSfeUt8/LxLTPKg2guludLU7YhGNbodvYr0Nvz1b8i9Q03GFygBFfpZVsdtjj/GUWtzp2mq0vRhFuE6Gd2aDhfHkmSTxE7P9g0VscTVnvn84FOUxFXOqWijdaOC6RnvWoPl1+uaZw==
X-Gm-Message-State: AOJu0Yyevz1dEV01TpTL4I7UX6v1XCSXSsH2OA7ECIH7tHBuJ16qLJ7k
	AE8vTn+mpySRaCwbrwveetwk/cQHwtu3pL+hK12juQ/e6TToHIgtoNSx7w0R36MeaQEFllLWmlS
	S49p3M+L+fH1MotsTooVe/polA4A=
X-Google-Smtp-Source: AGHT+IGJ4Y6WAzCnIwhWdJgaVB3PqjPLh3CpaDhTF27xh2aL6QNM84mqgLvmeqLfQ/uaKvETFhq3YkEAD9zf35D+Dw0=
X-Received: by 2002:a4a:6f4d:0:b0:5a0:30af:6b6f with SMTP id
 i13-20020a4a6f4d000000b005a030af6b6fmr8367251oof.7.1709039047973; Tue, 27 Feb
 2024 05:04:07 -0800 (PST)
MIME-Version: 1.0
References: <20240205171930.968-1-linux.amoon@gmail.com> <20240205171930.968-4-linux.amoon@gmail.com>
 <4248e19e-5f2f-4e4f-a869-a0fec81b16bd@lexina.in> <E850AF1E-BF7E-45F7-8AF0-68B548166094@gmail.com>
In-Reply-To: <E850AF1E-BF7E-45F7-8AF0-68B548166094@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 27 Feb 2024 18:33:51 +0530
Message-ID: <CANAwSgRmwXUqb-NUadgS1ENLvJQZXX9xjc4V6j+vw7jHf+dZZA@mail.gmail.com>
Subject: Re: [PATCHv1 3/5] arm64: dts: amlogic: Add cache information to the
 Amlogic G12A SoCS
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	devicetree <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	AML <linux-amlogic@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Viacheslav <adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_050410_343374_1A6E0511 
X-CRM114-Status: GOOD (  14.43  )
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

SGkgQ2hyaXN0aWFuIC8gVmlhY2hlc2xhdiwKCk9uIFR1ZSwgNiBGZWIgMjAyNCBhdCAxMzoyMywg
Q2hyaXN0aWFuIEhld2l0dAo8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4g
PiBPbiA2IEZlYiAyMDI0LCBhdCAxMTo0OOKAr2FtLCBWaWFjaGVzbGF2IDxhZGVlcEBsZXhpbmEu
aW4+IHdyb3RlOgo+ID4KPiA+IFlvdSBtaXNzZWQgdGhlIEFYRyBmYW1pbHkgd2l0aCB0aGUgQ29y
dGV4LUE1MyBDUFUuIFRoZSBkYXRhc2hlZXQgZG9lcyBub3QgcHJvdmlkZSBpbmZvcm1hdGlvbiBv
biBjYWNoZSBzaXplcy4gR2l2ZW4gdGhhdCB0aGUgQTExM1gvQTExM0QgYXJlIGVxdWlwcGVkIHdp
dGggdGhlIEFybSBDb3J0ZXgtQTUzIHByb2Nlc3NvciwgaXQgaXMgYXNzdW1lZCB0aGV5IHVzZSB0
aGUgc2FtZSBjYWNoZSBzaXplIGFzIHRoZSBTOTA1L1M5MDVYL1M5MDVYMiBtb2RlbHMuCj4KPiBH
WE0gaXMgYWxzbyBtaXNzaW5nLCBhbmQgYWxzbyB1c2luZyBBNTMgY29yZXMuCj4KPiBDaHJpc3Rp
YW4KPgoKVGhpcyBwYXRjaCBpcyB2YWxpZCBpZiB0aGUgaGFyZHdhcmUgc3VwcG9ydHMgcGVyZiBQ
TVUgZXZlbnRzLCBzZWUgYmVsb3cKSSBkb250IGhhdmUgdGhlIGhhcmR3YXJlLgoKQmVzdCB3YXkg
dG8gbGV0IHRoZSBBbWxvZ2ljIFNvQyBtZW1iZXJzIGNvbW1lbnQgb24gdGhlIENQVSAgTDEvIC9M
MiBjYWNoZSBzaXplLgpCdXQgd2l0aCB0aGUgbGFjayBvZiBwcmVmIFBNVSBldmVudHMgd2UgY2Fu
bm90IHRlc3QgdGhpcyBmZWF0dXJlLgoKYWxhcm1AYXJjaGwtbGlicmVjbSB+XSQgc3VkbyBwZXJm
IGxpc3QKCkxpc3Qgb2YgcHJlLWRlZmluZWQgZXZlbnRzICh0byBiZSB1c2VkIGluIC1lIG9yIC1N
KToKCiAgYnJhbmNoLWluc3RydWN0aW9ucyBPUiBicmFuY2hlcyAgICAgICAgICAgICAgICAgICAg
W0hhcmR3YXJlIGV2ZW50XQogIGJyYW5jaC1taXNzZXMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFtIYXJkd2FyZSBldmVudF0KICBidXMtY3ljbGVzICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBbSGFyZHdhcmUgZXZlbnRdCiAgY2FjaGUtbWlzc2Vz
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW0hhcmR3YXJlIGV2ZW50XQog
IGNhY2hlLXJlZmVyZW5jZXMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFtIYXJk
d2FyZSBldmVudF0KICBjcHUtY3ljbGVzIE9SIGN5Y2xlcyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBbSGFyZHdhcmUgZXZlbnRdCiAgaW5zdHJ1Y3Rpb25zICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgW0hhcmR3YXJlIGV2ZW50XQogIGFsaWdubWVudC1mYXVsdHMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFtTb2Z0d2FyZSBldmVudF0KICBicGYt
b3V0cHV0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbU29mdHdhcmUg
ZXZlbnRdCiAgY2dyb3VwLXN3aXRjaGVzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgW1NvZnR3YXJlIGV2ZW50XQogIGNvbnRleHQtc3dpdGNoZXMgT1IgY3MgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFtTb2Z0d2FyZSBldmVudF0KICBjcHUtY2xvY2sgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbU29mdHdhcmUgZXZlbnRdCiAgY3B1LW1pZ3Jh
dGlvbnMgT1IgbWlncmF0aW9ucyAgICAgICAgICAgICAgICAgICAgICAgW1NvZnR3YXJlIGV2ZW50
XQogIGR1bW15ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFtT
b2Z0d2FyZSBldmVudF0KICBlbXVsYXRpb24tZmF1bHRzICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBbU29mdHdhcmUgZXZlbnRdCiAgbWFqb3ItZmF1bHRzICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgW1NvZnR3YXJlIGV2ZW50XQogIG1pbm9yLWZhdWx0cyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFtTb2Z0d2FyZSBldmVudF0KICBw
YWdlLWZhdWx0cyBPUiBmYXVsdHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbU29mdHdh
cmUgZXZlbnRdCiAgdGFzay1jbG9jayAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgW1NvZnR3YXJlIGV2ZW50XQogIGR1cmF0aW9uX3RpbWUgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFtUb29sIGV2ZW50XQogIHVzZXJfdGltZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFtUb29sIGV2ZW50XQogIHN5c3RlbV90aW1lICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFtUb29sIGV2ZW50XQoKYXJtdjhf
Y29ydGV4X2E1MzoKICBMMS1kY2FjaGUtbG9hZHMgT1IgYXJtdjhfY29ydGV4X2E1My9MMS1kY2Fj
aGUtbG9hZHMvCiAgTDEtZGNhY2hlLWxvYWQtbWlzc2VzIE9SIGFybXY4X2NvcnRleF9hNTMvTDEt
ZGNhY2hlLWxvYWQtbWlzc2VzLwogIEwxLWRjYWNoZS1wcmVmZXRjaC1taXNzZXMgT1IgYXJtdjhf
Y29ydGV4X2E1My9MMS1kY2FjaGUtcHJlZmV0Y2gtbWlzc2VzLwogIEwxLWljYWNoZS1sb2FkcyBP
UiBhcm12OF9jb3J0ZXhfYTUzL0wxLWljYWNoZS1sb2Fkcy8KICBMMS1pY2FjaGUtbG9hZC1taXNz
ZXMgT1IgYXJtdjhfY29ydGV4X2E1My9MMS1pY2FjaGUtbG9hZC1taXNzZXMvCiAgZFRMQi1sb2Fk
LW1pc3NlcyBPUiBhcm12OF9jb3J0ZXhfYTUzL2RUTEItbG9hZC1taXNzZXMvCiAgaVRMQi1sb2Fk
LW1pc3NlcyBPUiBhcm12OF9jb3J0ZXhfYTUzL2lUTEItbG9hZC1taXNzZXMvCiAgYnJhbmNoLWxv
YWRzIE9SIGFybXY4X2NvcnRleF9hNTMvYnJhbmNoLWxvYWRzLwogIGJyYW5jaC1sb2FkLW1pc3Nl
cyBPUiBhcm12OF9jb3J0ZXhfYTUzL2JyYW5jaC1sb2FkLW1pc3Nlcy8KICBub2RlLWxvYWRzIE9S
IGFybXY4X2NvcnRleF9hNTMvbm9kZS1sb2Fkcy8KICBub2RlLXN0b3JlcyBPUiBhcm12OF9jb3J0
ZXhfYTUzL25vZGUtc3RvcmVzLwogIGJyX2ltbWVkX3JldGlyZWQgT1IgYXJtdjhfY29ydGV4X2E1
My9icl9pbW1lZF9yZXRpcmVkL1tLZXJuZWwgUE1VIGV2ZW50XQogIGJyX21pc19wcmVkIE9SIGFy
bXY4X2NvcnRleF9hNTMvYnJfbWlzX3ByZWQvICAgICAgIFtLZXJuZWwgUE1VIGV2ZW50XQogIGJy
X3ByZWQgT1IgYXJtdjhfY29ydGV4X2E1My9icl9wcmVkLyAgICAgICAgICAgICAgIFtLZXJuZWwg
UE1VIGV2ZW50XQogIGJ1c19hY2Nlc3MgT1IgYXJtdjhfY29ydGV4X2E1My9idXNfYWNjZXNzLyAg
ICAgICAgIFtLZXJuZWwgUE1VIGV2ZW50XQogIGJ1c19jeWNsZXMgT1IgYXJtdjhfY29ydGV4X2E1
My9idXNfY3ljbGVzLyAgICAgICAgIFtLZXJuZWwgUE1VIGV2ZW50XQogIGNpZF93cml0ZV9yZXRp
cmVkIE9SIGFybXY4X2NvcnRleF9hNTMvY2lkX3dyaXRlX3JldGlyZWQvW0tlcm5lbCBQTVUgZXZl
bnRdCiAgY3B1X2N5Y2xlcyBPUiBhcm12OF9jb3J0ZXhfYTUzL2NwdV9jeWNsZXMvICAgICAgICAg
W0tlcm5lbCBQTVUgZXZlbnRdCiAgZXhjX3JldHVybiBPUiBhcm12OF9jb3J0ZXhfYTUzL2V4Y19y
ZXR1cm4vICAgICAgICAgW0tlcm5lbCBQTVUgZXZlbnRdCgoKCgo+ID4KPiA+IEJlc3QgcmVnYXJk
cywKPiA+IC0tCj4gPiBWaWFjaGVzbGF2IEJvY2hhcm92IDxhZGVlcEBsZXhpbmEuaW4+Cj4gPgo+
ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
