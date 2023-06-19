Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999D6EB64D9
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jun 2023 15:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sr6lqsYvZDgifeJ0qYtlQX4vTHKvRgGpVJ+H9KHP7Hc=; b=GZl/hWgD7PuH2S
	6pOUUsvl/v7udOkjcGW81TRGC62Hzz5psuQSkl1MjdGpaF9VjgkTfNMdaZ6sN5gi4pOAwBVtfwqx5
	CoJmAnesk0Ga1MZuxSSEcTZPVT0AwbARK8d52UBrzF1I6slMuz1Aqctez+CL0kpcnt7vSHPhdCaEV
	AB4PQO6TOosyh2Ow4HGutBSJTyeGlNmAhDqVwy4u23StyAUF8xQgF6RAdwgB6Zy0VAF8WvgVrkO4d
	CyjPVZ/rrO2gHUbXxC+2evGAEtIo5EjfpMsDIG9W9EusRJ4lqDZl7gE4KOCEc1P0SVmxuPwy5+QIp
	9oEZtuTu0u/vvW2p/T6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBGsi-008n3p-0B;
	Mon, 19 Jun 2023 15:33:28 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBGsf-008n37-2w;
	Mon, 19 Jun 2023 15:33:27 +0000
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-55e299e1d02so1653085eaf.1;
        Mon, 19 Jun 2023 08:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687188803; x=1689780803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xPFXYlRHAa3U0GY2gSsZaKSWcpvM3hRa94CDc3700HE=;
        b=X4biow4FLNHZ60+dGHK9KQKDNPBZadQx+H9vnbHarSkTtcGHPIokmXpNnxvKWgOCgL
         OxZ7XJqnldGjmcFtCYnHDkzj2tfCWy1IRQ9T1iJwZgCK8iHAM7QeeaZKRjr6pftIK8R3
         0gQTAmc4WZSzEZ5Br96QaFIYHzDnKeLUl+kXsFLiq+iVTVm46vdV7AIUkJGSnDR4mea1
         ZBcGvimZy4sB8/aGaAkuhLYha0L1hG8NBN7Q4JjTewfEif/5Ja4CYE/kQcMOahYmEpoo
         kLgCw5VQyfFD+cFjjFRcJL0089A9QA2ANjljSnQ98EjgZ4X9m6aVpFag5p/NhrwILrda
         6pQw==
X-Gm-Message-State: AC+VfDyYW4VVzyb7d50uj/TRQMRC929FtNXkafT95cBDo2Fh4QuWOBlW
	5YQidACt6BBl/Ts6bH6UmvfldX2XfA1sNQ==
X-Google-Smtp-Source: ACHHUZ4qw1AX0Ra0o/NKUQb+iBfCTh+seaQcigQSr35UCQIsJKuUjWj5CRG02G/2B5cwHkiHChTXAQ==
X-Received: by 2002:a4a:b642:0:b0:560:809e:93ff with SMTP id f2-20020a4ab642000000b00560809e93ffmr674925ooo.2.1687188803609;
        Mon, 19 Jun 2023 08:33:23 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id z9-20020a056830128900b006ad3ed04973sm10269657otp.8.2023.06.19.08.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 08:33:22 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-39ea511930eso2365236b6e.1;
        Mon, 19 Jun 2023 08:33:22 -0700 (PDT)
X-Received: by 2002:a05:6808:1a29:b0:39e:de09:8b96 with SMTP id
 bk41-20020a0568081a2900b0039ede098b96mr2946266oib.34.1687188801974; Mon, 19
 Jun 2023 08:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230613114904.15749-1-frank.li@vivo.com> <20230613114904.15749-11-frank.li@vivo.com>
 <91db8e7b-29fb-3c43-ac38-008ebc9b1f6b@gmail.com>
In-Reply-To: <91db8e7b-29fb-3c43-ac38-008ebc9b1f6b@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 Jun 2023 23:33:10 +0800
X-Gmail-Original-Message-ID: <CAGb2v65xzhzVp+pBsa_Z3aHtK4LOpiTbhA749doMpwSTwDtxCg@mail.gmail.com>
Message-ID: <CAGb2v65xzhzVp+pBsa_Z3aHtK4LOpiTbhA749doMpwSTwDtxCg@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] thermal/drivers/generic-adc: Register thermal
 zones as hwmon sensors
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yangtao Li <frank.li@vivo.com>, glaroque@baylibre.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, amitk@kernel.org, rui.zhang@intel.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-imx@nxp.com, thara.gopinath@gmail.com, 
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	anarsoul@gmail.com, tiny.windzz@gmail.com, jernej.skrabec@gmail.com, 
	samuel@sholland.org, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	edubezval@gmail.com, j-keerthy@ti.com, 
	angelogioacchino.delregno@collabora.com, bchihi@baylibre.com, 
	niklas.soderlund+renesas@ragnatech.se, wenst@chromium.org, 
	linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_083325_991076_E7021F71 
X-CRM114-Status: GOOD (  17.94  )
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMTksIDIwMjMgYXQgMTE6MTfigK9QTSBNYXR0aGlhcyBCcnVnZ2VyCjxtYXR0
aGlhcy5iZ2dAZ21haWwuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAxMy8wNi8yMDIzIDEzOjQ5LCBZ
YW5ndGFvIExpIHdyb3RlOgo+ID4gRnJvbTogQ2hlbi1ZdSBUc2FpIDx3ZW5zdEBjaHJvbWl1bS5v
cmc+Cj4gPgo+ID4gUmVnaXN0ZXIgdGhlcm1hbCB6b25lcyBhcyBod21vbiBzZW5zb3JzIHRvIGxl
dCB1c2Vyc3BhY2UgcmVhZAo+ID4gdGVtcGVyYXR1cmVzIHVzaW5nIHN0YW5kYXJkIGh3bW9uIGlu
dGVyZmFjZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnN0QGNocm9t
aXVtLm9yZz4KPiA+IFtZYW5ndGFvIGNoYW5nZSB0byB1c2UgZGV2X3dhcm4gYW5kIHJlbW92ZSBy
ZXR1cm5dCj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW5ndGFvIExpIDxmcmFuay5saUB2aXZvLmNvbT4K
PiA+IC0tLQo+ID4gICBkcml2ZXJzL3RoZXJtYWwvdGhlcm1hbC1nZW5lcmljLWFkYy5jIHwgNSAr
KysrKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdGhlcm1hbC90aGVybWFsLWdlbmVyaWMtYWRjLmMgYi9kcml2ZXJzL3Ro
ZXJtYWwvdGhlcm1hbC1nZW5lcmljLWFkYy5jCj4gPiBpbmRleCAwMTdiMGNlNTIxMjIuLjk1MzFi
YzJmMmNlNyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdGhlcm1hbC90aGVybWFsLWdlbmVyaWMt
YWRjLmMKPiA+ICsrKyBiL2RyaXZlcnMvdGhlcm1hbC90aGVybWFsLWdlbmVyaWMtYWRjLmMKPiA+
IEBAIC0xMyw2ICsxMyw4IEBACj4gPiAgICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gPiAgICNp
bmNsdWRlIDxsaW51eC90aGVybWFsLmg+Cj4gPgo+ID4gKyNpbmNsdWRlICJ0aGVybWFsX2h3bW9u
LmgiCj4gPiArCj4gPiAgIHN0cnVjdCBnYWRjX3RoZXJtYWxfaW5mbyB7Cj4gPiAgICAgICBzdHJ1
Y3QgZGV2aWNlICpkZXY7Cj4gPiAgICAgICBzdHJ1Y3QgdGhlcm1hbF96b25lX2RldmljZSAqdHpf
ZGV2Owo+ID4gQEAgLTE1Myw2ICsxNTUsOSBAQCBzdGF0aWMgaW50IGdhZGNfdGhlcm1hbF9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gICAgICAgICAgICAgICByZXR1cm4g
cmV0Owo+ID4gICAgICAgfQo+ID4KPiA+ICsgICAgIGlmIChkZXZtX3RoZXJtYWxfYWRkX2h3bW9u
X3N5c2ZzKCZwZGV2LT5kZXYsIGd0aS0+dHpfZGV2KSkKPiA+ICsgICAgICAgICAgICAgZGV2X3dh
cm4oJnBkZXYtPmRldiwgIkZhaWxlZCB0byBhZGQgaHdtb24gc3lzZnMgYXR0cmlidXRlc1xuIik7
Cj4KPiBJc24ndCB0aGF0IGFscmVhZHkgZG9uZSBieSBwYXRjaCAxLzEyPwoKSSB0aGluayBwYXRj
aCAxMiBzaG91bGQganVzdCBiZSBzcXVhc2hlZCBpbj8KCj4gUmVnYXJkcywKPiBNYXR0aGlhcwo+
Cj4gPiArCj4gPiAgICAgICByZXR1cm4gMDsKPiA+ICAgfQo+ID4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
