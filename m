Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCF7C36010
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Apr 2025 18:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8XoVVXDFqQSOY7CKNLIMCCmSIO05k6W7I+5CzF38aU=; b=AnbM73bKJftUw9
	n80rQ2/bVR6TL90TSAd7gPKZC9xTbagDvFXV1aPtwhitn/W+ifAZpR8DFDoRpF1U2qOEd6OxWReSQ
	jW2lqAGDsRz9XOC6tVTErm5iSMlNu1lPWbGmdMUnKhlYKi/Yns1DK6M7X5PJQiooC/GeP3Q+fjPc+
	fVoKiTZHXLrazquGP1m06e8U2PqVG482V5c8FC0IuSkc3qvhs6VSQ5NbLf4QjOe0iSzsWoPO9Vttq
	Wnl4zIVdVhlyB377llp9sPntD3BPysmSMCWwjNqoFfJcd/W70EwKZEhbqfXqJg9gJQQsqhkAnsZIE
	cWmafwWgcVWvxrX8zeGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rZP-00000001eon-1wQP;
	Mon, 07 Apr 2025 18:51:43 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pG7-000000019sp-2f6S
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Apr 2025 16:23:41 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-6fda22908d9so31148537b3.1
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Apr 2025 09:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744043019; x=1744647819; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdLI4xLdMKIk5+aH2ShC4YXmxar43nmBcEhmGz0osts=;
        b=I46ZxQYWm7syWJ9hda5WY63ox+9SU4VY7aCXCHCHW52T3n0PlEr2axhRPWLZBXmOOo
         iWgEyt4xfnYN196njxG9x6wuLH2ZT1j5sWduhERYJwHXTamCKo9kskLbgcYiWUEnq5lX
         y4abDzMKwRg/T63koFPeT/4pylQ1NYTBfp+2thqgt7eUIFNXlBaW/oOBWZUrD2eaCbfl
         P+JFZNuEuST10vYD0a3IY8eNhhHZHo6BPN5UWoSpqnrXo2PLGhbk2Q3WDUAigOE9voZw
         +97i3oHsmCww1j51R5Fk3bLH6lBTFpEnoDbu/V2CbW6MGJH59qtFT4eqdFj8TaJays4w
         nHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744043019; x=1744647819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdLI4xLdMKIk5+aH2ShC4YXmxar43nmBcEhmGz0osts=;
        b=AW4rDSbcUdwICJmOCi0OyO1eCIdPyT/tKsmWrDPTaG5qS3gcQiVoOucwsEZzF/agHl
         VIE66es9UgVzV+pxC1X5ngabDNCxfTI1b2aXwOvUwRw7g9JuEuBXa/GUADmgocTz5YLH
         FDHRCnRS99l6Vy18n923uNO4kvOZYVbXCqltScUlqoZuW8p5NPkTzc/AsNDozUkEqVGj
         rmlybNZspeydH4vV7a7XoaG94+Zv1/941I/h7cHxwrr1jzCAzq/UyFzgYd1c5vhDTRoJ
         IIgjrBCezcoXk8Xz76LzMEB+7FByG0l5miSc7paDOccl1llBg3ZumAuSFRe9tGEGzhGI
         lyPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4fD6lJHiApF/Iscoh7jEhml+BX+F8Dy4pJ5PQkinfTBIz7d609w9bTpHaHw0t59yaZFv+wPOrzWXMtWVW@lists.infradead.org
X-Gm-Message-State: AOJu0YyvhlxFWrCHVtEjD66btl4xzcQvSU3y1b0LO5DWjEhIBmLaDhqM
	/piVtEmk8gYcGtCzjIvBMqsLafMwwxx26qB3rPh70sPcNpeibGxaydfjGwYeSX6PwuyZ7aiPpg8
	7kPesnWLB+8GhRr4qFdZYIWeoIQYGtR8mtc8mkw==
X-Gm-Gg: ASbGnctT75xifOvBBj5+ULDDsxM03+X5I1CM25WSF5IjPV+NdB2JyBHHk/x9aesjDJF
	4hu1ZGdblzQK3RSbkgB4fEcK9951orYeeuWbHRlo4yaC5f6GLxU7mCEyvSoplZbGOPKuXVzYiil
	LU+1DAJ/kRB3fR4Tx7nsk5gHShfPQ=
X-Google-Smtp-Source: AGHT+IEvCyoULSP8GtunUj7XByE2xLEZApny/EX5BI9r2HNnS7M/lF2l9CVPZCF8J2YyYgCczjPfSOPcnUbnSfgNgFc=
X-Received: by 2002:a05:690c:6481:b0:702:627c:94ec with SMTP id
 00721157ae682-703e3357786mr243332367b3.35.1744043018812; Mon, 07 Apr 2025
 09:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org> <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
 <CAL_JsqKygxhcQ=PZW84sfiW7BVXKF839vfNyxS9GwAXuqmN=8g@mail.gmail.com>
In-Reply-To: <CAL_JsqKygxhcQ=PZW84sfiW7BVXKF839vfNyxS9GwAXuqmN=8g@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:23:02 +0200
X-Gm-Features: ATxdqUG4iYRDoX1uSepWjxp_lc67AACZn0NdIUwL4_627lSdYio0uG7PYHZfOMA
Message-ID: <CAPDyKFoHQdHED0hHUR7VKin0XG6SVnYXuvPjB=Xe+1o2hpiPJA@mail.gmail.com>
Subject: Re: [PATCH 18/19] dt-bindings: arm/cpus: Add power-domains constraints
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_092339_683711_3F2C86B1 
X-CRM114-Status: GOOD (  17.66  )
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

T24gRnJpLCA0IEFwciAyMDI1IGF0IDE1OjA5LCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIEZyaSwgQXByIDQsIDIwMjUgYXQgNTozN+KAr0FNIFVsZiBIYW5zc29u
IDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIDQgQXByIDIw
MjUgYXQgMDU6MDYsIFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+
ID4gPgo+ID4gPiBUaGUgInBvd2VyLWRvbWFpbnMiIGFuZCAicG93ZXItZG9tYWlucy1uYW1lcyIg
cHJvcGVydGllcyBhcmUgbWlzc2luZyBhbnkKPiA+ID4gY29uc3RyYWludHMuIEFkZCB0aGUgY29u
c3RyYWludHMgYW5kIGRyb3AgdGhlIGdlbmVyaWMgZGVzY3JpcHRpb25zLgo+ID4gPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgo+ID4gPiAt
LS0KPiA+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vY3B1cy55YW1s
IHwgOCArKy0tLS0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vY3B1cy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9jcHVzLnlhbWwKPiA+ID4gaW5kZXggNmY3NGViZmQzOGRmLi41YmQ1ODIyZGI4
YWYgMTAwNjQ0Cj4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vY3B1cy55YW1sCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vY3B1cy55YW1sCj4gPiA+IEBAIC0zMTMsMTkgKzMxMywxNSBAQCBwcm9wZXJ0aWVzOgo+
ID4gPiAgICAgIG1heEl0ZW1zOiAxCj4gPiA+Cj4gPiA+ICAgIHBvd2VyLWRvbWFpbnM6Cj4gPiA+
IC0gICAgZGVzY3JpcHRpb246Cj4gPiA+IC0gICAgICBMaXN0IG9mIHBoYW5kbGVzIGFuZCBQTSBk
b21haW4gc3BlY2lmaWVycywgYXMgZGVmaW5lZCBieSBiaW5kaW5ncyBvZiB0aGUKPiA+ID4gLSAg
ICAgIFBNIGRvbWFpbiBwcm92aWRlciAoc2VlIGFsc28gLi4vcG93ZXJfZG9tYWluLnR4dCkuCj4g
PiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+Cj4gPiBUaGVyZSBhcmUgbW9yZSB0aGFuIG9uZSBpbiBz
b21lIGNhc2VzLiBUaGUgbW9zdCBpcyBwcm9iYWJseSB0aHJlZSwgSSB0aGluay4KPgo+IFVubGVz
cyBJIG1pc3NlZCBpdCwgdGVzdGluZyBzYXlzIG90aGVyd2lzZS4gV2hhdCB3b3VsZCB0aGUgbmFt
ZXMgYmUgaWYKPiBtb3JlIHRoYW4gMSBlbnRyeT8KCiJwc2NpIiwgInBlcmYiLCAiY3ByIiwgZXRj
CgpUaGUgInBzY2kiIGlzIGFsd2F5cyBmb3IgQ1BVIHBvd2VyIG1hbmFnZW1lbnQsIHRoZSBvdGhl
ciBpcyBmb3IgQ1BVCnBlcmZvcm1hbmNlIHNjYWxpbmcgKHdoaWNoIG1heSBiZSBtb3JlIHRoYW4g
b25lIHBvd2VyLWRvbWFpbiBpbiBzb21lCmNhc2VzKS4KCkkgd291bGQgc3VnZ2VzdCBjaGFuZ2lu
ZyB0aGlzIHRvICJtYXhJdGVtczogMyIuIFRoYXQgc2hvdWxkIGJlCnN1ZmZpY2llbnQgSSB0aGlu
ay4KCktpbmQgcmVnYXJkcwpVZmZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
