Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1BBC6FD18
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Apr 2023 17:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kxk5Dhp3EGmZuxhfrzLvFhtEtShdLVeZyFB0L4gt93k=; b=dEPI0GpFDgEWFt
	pK9jvl0XLvHuVc19oTVJ6AjqZW86JDn8XKGC53+lq5Jl4Izt9BDMTq3QTzVQFTEHdJDSDTzg+j/nT
	WHTxM7iELTePEMWY2+0ZaohuIDDocme/CNAN929vLi3iso2Gnst6EN+BM8agyw81T9DS7YheMIofH
	zkN4X+UiSH+G10A4DmVj4sN0GEK7RjDuO1zLpx06sG24TXGVGt0EiK52IKKzaNQSK7f7T+hyhDBw7
	xlektrP7BStcQfSZbNFjGWlHcWJS6ALtNTFRt15cg9MrFuaK9v07WIvOhggZXWVt345ke/31snkiZ
	ZisH8YiQ/6pYYWG3YNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqdkJ-00Eab7-1v;
	Sun, 23 Apr 2023 17:43:31 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqdkF-00EaZq-3C;
	Sun, 23 Apr 2023 17:43:29 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-506767f97f8so6079881a12.1;
        Sun, 23 Apr 2023 10:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682271806; x=1684863806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boPNwPXDV+qAr9JOET7iHlOkvk4+Unuh3FWe7icywd0=;
        b=Sxua/nMMnTZeEwziy+jevLbv19qaFNKXz2TPRsXtdJrhfyCsBet19/0ac60XZWaBTC
         y61gknuZFKNq8WxQTEU01KPsGEozDjwn8M1BwWGvx9/nhGTKJnUmMlzXiOdqCvZ8Zs+x
         cjGHQGs1JynN06nNmgeO1E+yq6pQtd2osGsZzBprZVbkVGI0DXmk0BYUIgLSPJSCBfrK
         NxmZrFczMxZuxRnSczImIGPZvaG4Y0vM8p8SCriVI8HxEdlXIgeuzFEPhfQQNn6HTKBL
         oBtEX4HlaRRPBvqBJ4hWIB06fx3O6ggRvN8hUa8H9wfQ7lifvWnid1OuwyORPMsvqir5
         quHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682271806; x=1684863806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=boPNwPXDV+qAr9JOET7iHlOkvk4+Unuh3FWe7icywd0=;
        b=W2iWoHnbly7MD1zsWrAYITtpEGK31SHPd8KdaNix5el4HWVxjwamzABRGeJiJNekYC
         +j4ehOORaqZiP6ZDxJxMFTyr5kAqNI2CD9RTAE+nNTw5902tc+FDIe9c93VcMYqOE24h
         LUHcv+Dmb6OQMQyFpt+ovwRNFjMGmVOFCVm3BxwQzJ2fj2TrX+r7twU0svs+aDgYunFf
         w4XZE9THT5E74EsfaNH4iPKH0ym4JHwUS+8oE6t4iJp3k88wAOK1t2q8lY/UK8STNqAD
         s/2IisEmrdrrg+CtLsge2BVDshvr0d0flqoyRP+swQLkrrliN+io1xW+LSgo66KulL/J
         NRRg==
X-Gm-Message-State: AAQBX9dp6gEd6EMslr5Le2V+Ov+eWczn9Blu29Fs/MNwEkHEcBIybK5I
	5KJZ18QZZn/WJptJIZ2YPiz7qs/8mPhlYdyRlAg=
X-Google-Smtp-Source: AKy350b+rfcZSBXFVrPMeZIZ34NYbHGitfLG40FUHBfpHAR34Fx4U50cReVePdmiqDw3D/1BLLoOO92vqLkWn/OUNj0=
X-Received: by 2002:a17:906:a101:b0:94f:558b:ed7f with SMTP id
 t1-20020a170906a10100b0094f558bed7fmr7952132ejy.18.1682271806113; Sun, 23 Apr
 2023 10:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230418111612.19479-1-ddrokosov@sberdevices.ru> <20230418111612.19479-4-ddrokosov@sberdevices.ru>
In-Reply-To: <20230418111612.19479-4-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 Apr 2023 19:43:15 +0200
Message-ID: <CAFBinCD1211x0aAjKPe5BVQDfcCMXWysH_JT8m96Vtmpq5YvfA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: usb: dwc2: add support for Amlogic A1
 SoC USB peripheral
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, mturquette@baylibre.com, 
	vkoul@kernel.org, kishon@kernel.org, hminas@synopsys.com, 
	Thinh.Nguyen@synopsys.com, yue.wang@amlogic.com, hanjie.lin@amlogic.com, 
	kernel@sberdevices.ru, rockosov@gmail.com, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-phy@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_104328_035083_D33E3B3E 
X-CRM114-Status: UNSURE (   6.91  )
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

T24gVHVlLCBBcHIgMTgsIDIwMjMgYXQgMToxNuKAr1BNIERtaXRyeSBSb2tvc292IDxkZHJva29z
b3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+Cj4gUHJvdmlkZSB0aGUgYXBwcm9wcmlhdGUgY29t
cGF0aWJsZSBzdHJpbmcgZm9yIHRoZSBEV0MyIElQIHRoYXQgaXMgZm91bmQKPiBpbnNpZGUgdGhl
IEFtbG9naWMgQTEgU29DIGFuZCB1c2VkIGluIHBlcmlwaGVyYWwgbW9kZS4KPgo+IFNpZ25lZC1v
ZmYtYnk6IERtaXRyeSBSb2tvc292IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+ClJldmlld2Vk
LWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
