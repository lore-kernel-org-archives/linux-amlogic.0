Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C31EEB64D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Jun 2023 20:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzPx/2x/Il9VvcHwdNUzi7qbKrX2rlhasc+O1fa+Q4s=; b=q1eVTWVk0wsFoF
	QNuLguIcjuIdNvTNtvuR0yT15sMmLqBfb5D9W3QgDowNeGLXtCfgHtGLWr3T5YmtHuTmXgF13VT06
	faRuP4y8727jPqBP6uRRUfa+9TJ4Sr1TgymZiUSNeAlvKhj1yS0HhvxXFIF9JafIRX+1YcSAXD+Ii
	7rI9wsgj/1fJ7s/k/ilt3G8+xD8IvioWoGLXNgOZWKclluu15X4o+APaggQS+GN+V5Rk2/LiPS+q9
	B0hlED/1zlG2HD2mX62hdgEnglbouW5oJjy91Df2h33K2K/PI6JVxieo30nIyOPBg+nx5hbCZ0kaM
	3DfgdVORhSVfRL46hvIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEc8v-00Ggo4-2E;
	Wed, 28 Jun 2023 20:52:01 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEc8s-00GgnG-1r;
	Wed, 28 Jun 2023 20:51:59 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-977e0fbd742so28038966b.2;
        Wed, 28 Jun 2023 13:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687985515; x=1690577515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H09su0JFKNP1Fr2cMqvDj35F61R1G5GRKDatbkayncI=;
        b=HhKl0a8N+ZKyZOg/yyWu2wih6yNx8S4yuWQkB7m/pi8Ms3UVGXqwsDDq/4qptTm4XC
         0Gt3AhtG2RA86n76l7v7J+F2Mzif/vKYYlQS6xNQl2VX2Uyq8JK1MtzB97bXsy7nRH0/
         4WVbQ4GN90ugYr/aWRQEyaugh/RBNdkGj5dvj/zrDTr5La8pf1mWzUyH5MbvcrNXMjGY
         xPbk019pAtqGRKJ0H7SGKlPeXDYyt58gVsXvmNqMRyK1OP6DeUULsKKb/9A/a5nb8ovK
         +ANHBtNdS4FRxFomULwxZKkHyeNXhE/S+SvQAcISQs036hJGYhQwy5d7zz2wGWKWDswx
         Dk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687985515; x=1690577515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H09su0JFKNP1Fr2cMqvDj35F61R1G5GRKDatbkayncI=;
        b=XWXVqExkGKC4TdQX77pBdgZP2fupPvlJvoa6fFNXZM7gex1Q9tdyPvYL9RiI6+tHml
         cBzz+8fkkoUyZ2cszz4M0DaD9TQ0kUWgI3vcAqxjuDGl+8AF7Ij2efubN20AUL94ncNi
         mLU72AFHudukOiHAGpdlkbi8/O26wECIah9CKeBPBxkzj68E0z0s1KhhNt/CSBnJL2R/
         bn1mte4HOHmieowD51wYS4IGFVBUzziw2r5/6Su8ezH8/m69Jac+arE2RdV0ldkBXXZQ
         9PmkeO5AbkSScsTIqLT/a72ly/F/B1P2uUnIIiu/DJawMlP3DPWbGPJxt6lKZKz4roLg
         bvFw==
X-Gm-Message-State: AC+VfDzcTNmFwrS0LX/r2aDJK18w4zpl9Nn3HCvy95c02AnZMmxxIsoE
	01uGRLAOpCe8wttqbo2Zm+7IaaltGYrXAtIy2TU=
X-Google-Smtp-Source: ACHHUZ6ZHBQJxCh+FwiIqR9kqXjpG7Tcm/91+2ol36od0qJFABIuiBJMSCabSpWrShyknE0rzh7IBfR2eiQrWsFTbLE=
X-Received: by 2002:a17:906:d542:b0:977:95f4:5cca with SMTP id
 cr2-20020a170906d54200b0097795f45ccamr29993727ejc.54.1687985514876; Wed, 28
 Jun 2023 13:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
 <20230607201641.20982-2-ddrokosov@sberdevices.ru> <CAFBinCAO14zcgY66UyJO9UxuCWf1N-Lsx=iYNTJL=cwXoJv__Q@mail.gmail.com>
 <20230628141839.ea7qzotr5un6f2ij@CAB-WSD-L081021>
In-Reply-To: <20230628141839.ea7qzotr5un6f2ij@CAB-WSD-L081021>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 28 Jun 2023 22:51:43 +0200
Message-ID: <CAFBinCBzmYQu-+1A8MxZ+r551Jeym29fg9ErZJkftTEdL2b=-A@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] arm64: dts: meson: a1: introduce PLL and
 Peripherals clk controllers
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, conor+dt@kernel.org, kernel@sberdevices.ru, 
	sdfw_system_team@sberdevices.ru, rockosov@gmail.com, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_135158_617342_B95117A0 
X-CRM114-Status: GOOD (  12.58  )
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

T24gV2VkLCBKdW4gMjgsIDIwMjMgYXQgNDoxOOKAr1BNIERtaXRyeSBSb2tvc292IDxkZHJva29z
b3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgpbLi4uXQo+ID4KPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgZ3Bpb19pbnRjOiBpbnRlcnJ1cHQtY29udHJvbGxlckAwNDQwIHsKPiA+IG5vdGUg
dG8gc2VsZjogYXQgc29tZSBwb2ludCB3ZSdsbCBoYXZlIHRvIHJlLW9yZGVyICZncGlvX2ludGMs
IGJ1dAo+ID4gdGhhdCdzIG91dCBvZiBzY29wZSBmb3IgdGhpcyBwYXRjaAo+Cj4gSSBoYXZlIG5v
dGljZWQgdGhhdCB0aGUgJ21lc29uLWExLmR0c2knIGZpbGUgY29udGFpbnMgdW5zb3J0ZWQgaXRl
bXMuIEFzCj4gcGFydCBvZiB0aGUgY3VycmVudCBwYXRjaCBzZXJpZXMsIEkgY2FuIHJlLW9yZGVy
IHRoZW0gdG8gaW1wcm92ZSB0aGUgZHQKPiBzdHJ1Y3R1cmUuClRoYXQgd291bGQgYmUgYXdlc29t
ZSEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
