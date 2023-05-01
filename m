Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79F4C77B7C
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 May 2023 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4VQteaGlEjCWDS9lo6+l2y9GT/SQ1/pPgp3IJUWdtAI=; b=XvI/Tha2Gue3k1
	GWu/b/c9rv7M1kI4i7c8mhQIP2PPNjY2lV9x3grMe3oVUAVs9bIgbHgGtIzVyzoCBJUX006t92+kc
	9B/uP7rmG0jH5RFR9dQX+ESdSOfRcAOwutXwkZ82GN1aXRMc6KYmBG+Cg2zIvKyjcs2stW8rwUlul
	zKGySOYe9N3hYAlAy9jEoNN2/v475dTS6DH0RL5SxkRYHTQfdDt/3HvPAM3urxSFoDzHkFaom4SmB
	Ok1+o0hvE7NRoEc2f9o+xAWafnrwOzsapnEM7DcCGD+vHydHJ05Lg1oZAuO9+ShtijW3SCa5fjXfB
	GjXBN6MsAoMWr9hHHYqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptYdi-00GabR-1y;
	Mon, 01 May 2023 18:52:46 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptYdg-00Gaax-1Q;
	Mon, 01 May 2023 18:52:45 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-94f4b911570so474999166b.0;
        Mon, 01 May 2023 11:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682967162; x=1685559162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgDA23im55EDSIa5JWzE1V/HA0U8DNvg6mZYJz1fn50=;
        b=F4fPmZigF3XeUFLuE+3sDNQ25c4xoILFA5P45GqF1EyBfnu+RzjeQUcbhzUYxhXFM0
         MpNH/+WaUe64TqVw3bJRnHKhTr7PImX56TdQb4tPmplrgOTLAARxkrr9JAfUi2B5h4t8
         cgLzaQU1eBKzu65P6j87jZPsCPpfYEaFeiP/3PbCG/j6g0CPZ2CFu1tScMhwRQhHdEwE
         s3hDSAzI3gv+20Dct0YKulbdjv/bd4Tlb6QmLpgMd1JNLTu2j4yNkTNTxvSHdOhoN033
         e5vHsRPnxMCmw4VgZwYr1KyUE7B7tOG4RmpBRbZT7MhFdypRuEtQkLdmw65J9BL4kFNK
         j/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682967162; x=1685559162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgDA23im55EDSIa5JWzE1V/HA0U8DNvg6mZYJz1fn50=;
        b=iofR0+HHOihUWu4+D2Eks++CCfrrMnqfotKS7br6PRnQMMdyz+3dSEdNqpdTJ30ysh
         qi85vLukzcybGhdVOQc7b4+RSl1HMOXofPEcS5KIDuaeTttseg2WHLNfC5cmIScx9mI2
         oUqIUh4T1TBMcS7hTGqe/DFUvvxHrDpsK1YOcRJzpXKgHgNF9aNKsxk/OIyf2N+m0Jy9
         +j8dEzXYQNHsAkGqyulcsEv0Vw6VTEe12nanfd3IJB8XEOInRV7VsQurpuXrCF8uQ9Xm
         zE7ucogn3XXKk5pko0OOsBDqB2DyQV20/j0cxqNCoTfz/4yjNEE05N53S/Mh9ADnaMma
         tSdQ==
X-Gm-Message-State: AC+VfDyfxJrWAewSzK3FaWGcXZyWMslTbkBIwD0AeqCHGkh9NvH1dtb7
	3O3PQuoisnPs3XIxE8vmCg5JRrzJNeuTNGIN+Xc=
X-Google-Smtp-Source: ACHHUZ6oDPPuL0A65wQP2LLtoEmRC0zmT/D51gM6y5n0OhGbSBcUCwxV1Fy7XqeMdYrBwAO9vmZNPqKwaGswBVxlgqY=
X-Received: by 2002:a17:907:7da9:b0:8af:2a97:91d4 with SMTP id
 oz41-20020a1709077da900b008af2a9791d4mr14989285ejc.14.1682967162079; Mon, 01
 May 2023 11:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095805.15338-1-ddrokosov@sberdevices.ru> <20230426095805.15338-4-ddrokosov@sberdevices.ru>
In-Reply-To: <20230426095805.15338-4-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 1 May 2023 20:52:31 +0200
Message-ID: <CAFBinCCq5y5PbhKL+9FarxS3jMuM35JDO=O9SVxP0A=nnBUP8g@mail.gmail.com>
Subject: Re: [PATCH v14 3/6] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru, 
	rockosov@gmail.com, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_115244_482251_ADFC99C0 
X-CRM114-Status: UNSURE (   8.58  )
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

T24gV2VkLCBBcHIgMjYsIDIwMjMgYXQgMTE6NTjigK9BTSBEbWl0cnkgUm9rb3Nvdgo8ZGRyb2tv
c292QHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKPgo+IEFkZCB0aGUgZG9jdW1lbnRhdGlvbiBmb3Ig
QW1sb2dpYyBBMSBQTEwgY2xvY2sgZHJpdmVyLCBhbmQgQTEgUExMCj4gY2xvY2sgY29udHJvbGxl
ciBiaW5kaW5ncy4KPiBBbHNvIGluY2x1ZGUgbmV3IEExIGNsb2NrIGNvbnRyb2xsZXIgZHQgYmlu
ZGluZ3MgdG8gTUFJTlRBSU5FUlMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaWFuIEh1IDxqaWFuLmh1
QGFtbG9naWMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBSb2tvc292IDxkZHJva29zb3ZA
c2JlcmRldmljZXMucnU+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3Rpbmds
QGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
