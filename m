Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834DEC61DA4
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Mar 2023 21:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vyxAGyauFI3rJQ+0JZ8AcZcPN7HjpQR9vzR7l8OiBQA=; b=jF4UPH0/vzXB4/
	564anQKG213doRYu2TZzKo0Yr1dFOLITCyc5podVUquHQVi1dpJKcK3eIVm2p8wyidJepmQbiKjZ7
	4EyYBnJCfVzDWte78JS59xiEdnpamEd3OZtql4mk/j4kGZRWm6pK+/V1jKXT3H4aWYIdmphawnyxc
	gX1uXR1gHatWyYc5hjs41ym0wMyzZ2gvDvKG6NvvEZyVQakTDVBeO1zN60kpmePwzDBua6RwbRufo
	2Rm8vuiy+P864x0QdH7jludWXHgk5RwpMDpwE3jIDzqnYyZZ6gMUcoPo/iHor5ym0EKi+smpuyU0R
	T69SkzeHTwpg7QF4P6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYvkk-00AelW-HE; Sun, 05 Mar 2023 21:18:46 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYvka-00AejV-A2; Sun, 05 Mar 2023 21:18:37 +0000
Received: by mail-ed1-x531.google.com with SMTP id k10so7023829edk.13;
        Sun, 05 Mar 2023 13:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+UGEp44lDSINJyqpqG71JeEypCQNtRsdKYQXFnqkL4=;
        b=lT9xwEkq7iQhGBCipX/lvCbHUENMLgsOjiyL/an1A4GLGir8G6m2//UlA4bkrY3iNj
         tcTSeX/ReDeGWSmFyE5TJwqVHYtwdSoEE5X4Svf02LVmQkbeyWrPodJW8qoKWedeZoAi
         31ygT0AVQHcbzVRYOIh4J69GVpu7H+S1mKXCgV1ma6cfWkhNCqBLLU//KvS12ruxZd2u
         tuGCycrhZJ0LV/s2mgX+1vGGRIUeQvf5kXd+CGQ2eQFfRH0GfJHHGgfht5RXe0tJaaDQ
         0sR+ZB0wYLZJpXUp1xKhwiI+4bz4ydE8LVIMtzFdogXaO9EE4tyT0DV2m1Gja7Tk8utX
         qk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+UGEp44lDSINJyqpqG71JeEypCQNtRsdKYQXFnqkL4=;
        b=KxYhy9EOTr8nGnZ12ODDWTMgYXXnNsDVRez7zEQuBUUToDGnSGuS/AWPE0ghaL5cQl
         nBlI+emWaMjMkU6hhBgmfURr/jtbiW8yKVFE0EUVwM2CIlRieXXquO9BxfmE+SmHmAgv
         anyM6pVEfd8coeEJww0pawa/2XMmD17TmLeury5rmkuMCYEZvMz5mmtmhyskp/vHSYhP
         vPE/0yg7M966LzDDelQvUYabg0V9n9y5uuU2c+Unsm6VvUcx5CAUEYRY34Z6xZDE1Ose
         zHrnJ/yT7ac8HsugOJYJNlnRCEaGyKhrWi00A0iw/p484isadxpihFsZTNiEanmiFKhG
         TGSA==
X-Gm-Message-State: AO0yUKUl4uyXz4EeqsXwBxLXzVQVyTzEsSTXiD2w+9onxKJRr/kZuWs8
	5rjU7YeFWe3pU30MgWhu8pIOrMwLqnmZer68jLw=
X-Google-Smtp-Source: AK7set/w0HYMJbBg6VqQIu9Z0GHYir9TOzo2E0vsBl63rRk3GEnb3MYHjR6P355iGs5o3x5CBmdCAOkEWUNluVgG+h4=
X-Received: by 2002:a50:ce19:0:b0:4bc:2776:5b61 with SMTP id
 y25-20020a50ce19000000b004bc27765b61mr4642074edi.6.1678051114973; Sun, 05 Mar
 2023 13:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20230305134512.1596572-1-christianshewitt@gmail.com> <20230305134512.1596572-3-christianshewitt@gmail.com>
In-Reply-To: <20230305134512.1596572-3-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 5 Mar 2023 22:18:24 +0100
Message-ID: <CAFBinCBUYoCSvfnqZSiUR6roEyNqgsfEnU6pvVCVgGrFtbEXmg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: meson: add support for BananaPi M2S variants
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_131836_366758_20E6E4B0 
X-CRM114-Status: UNSURE (   8.41  )
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

T24gU3VuLCBNYXIgNSwgMjAyMyBhdCAyOjQ14oCvUE0gQ2hyaXN0aWFuIEhld2l0dAo8Y2hyaXN0
aWFuc2hld2l0dEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQmFuYW5hUGkgTTJTIHNoaXBzIGluIEFt
bG9naWMgUzkyMlggYW5kIEEzMTFEIHZhcmlhbnRzIHdpdGggdGhlCj4gZm9sbG93aW5nIGNvbW1v
biBzcGVjaWZpY2F0aW9uczoKPgo+IC0gMTZHQiBlTU1DCj4gLSBIRE1JIDIuMWEgdmlkZW8KPiAt
IDJ4IDEwLzEwMC8xMDAwIEJhc2UtVCBFdGhlcm5ldCAoMXggUlRMODIxMUYsIDF4IFJUTDgxMUgp
Cj4gLSAyeCBVU0IgMi4wIHBvcnRzCj4gLSAyeCBTdGF0dXMgTEVEJ3MgKGdyZWVuL2JsdWUpCj4g
LSAxeCBQb3dlci9SZXNldCBidXR0b24KPiAtIDF4IG1pY3JvIFNEIGNhcmQgc2xvdAo+IC0gNDAt
cGluIEdQSU8gaGVhZGVyCj4gLSBQV00gZmFuIGhlYWRlcgo+IC0gVUFSVCBoZWFkZXIKPgo+IFRo
ZSBTOTkyWCB2YXJpYW50IGhhczoKPiAtIDJHQiBMUEREUjQgUkFNCj4KPiBUaGUgQTMxMUQgdmFy
aWFudCBoYXM6Cj4KPiAtIDRHQiBMUEREUjQgUkFNCj4gLSBOUFUgKDUuMCBUT1BTKQo+IC0gTUlQ
SSBEU0kgaGVhZGVyCj4gLSBNSVBJIENTSSBoZWFkZXIKPgo+IEFuIG9wdGlvbmFsIFJUTDg4MjJD
UyBTRElPIFdpRmkvQlQgbWV6emFuaW5lIGlzIGF2YWlsYWJsZSBmb3IKPiBib3RoIGJvYXJkIHZh
cmlhbnRzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEhld2l0dCA8Y2hyaXN0aWFuc2hl
d2l0dEBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
