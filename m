Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451DCC4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2024 08:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CEtFJ/Wgq8s12NgQPZ2+Ac7kPs8J6FJelngUi/jS418=; b=NfxeQZuJjXQwQs
	PIDS3Ern1PGEtsdrp6gKpT8Cp5FbF3meA5E0QmhILoXN+ltRvvaAeCTX9jbblqcN+UJBHljHv1eB/
	SYm/uozEZIJjuaR9HqFh0xnQn6oLjhZpHg9GgMplQWA14L76gI+s1u+4MfqdyL7w+v///0fH+fOwj
	/XUW5OV4nFwJIKSJIkNNgLjZD9KkPUIJXsThrMbnPbqfQBWtLwMVNoiP8p3iFefT1ND9IcNr+HT/I
	GQO2mPGGK4DohoZRk5ZiTjYxVqNnqXF+N3Qdt+WJnps/kfi9L7TUAj/+PEYBjr88V1Sv6Pnx+wzxr
	fnN5/5ibC38UoWQF3aCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBv8-0000000FzVm-1rB0;
	Fri, 12 Apr 2024 08:06:02 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBv4-0000000FzU9-0E0R
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Apr 2024 08:05:59 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2d718ee7344so5828731fa.2
        for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2024 01:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712909156; x=1713513956; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5lJHg5BKe+36ob4JtOUMC2azeL3dTZAz0hL3f6Nmw4=;
        b=bD/SNiLvkYg9IUGdB1L4f1rTSMhPdb7oNllGdMhIdaJUzJeOf3wSyHrakjjxNWrmgJ
         jgZtUaJw5WKZVmi0js9X95tJhUrWi2P/E6bmMuxlQ+zlak5OYPQ93hjuW03P9I7dydI4
         TJCypBvAjK81L49zwqaoEqB8akDCT2yjUnvoPcQFPxtfqk/NKRPM2tvVvpsnh8VtMmuE
         vn9NY8CMI1e39U5lTG1HGlajz4A9rW2O0V0Ln30S68MEI2+fr3zO3BitIAhIiq2aeHW4
         +mZMcEt8hIfJR9Zc0Lg/3Ojt/wkdScG2LbXLLK5P0ZfUITAARNI/vRTKlRQ0jp8sLccL
         kjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712909156; x=1713513956;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q5lJHg5BKe+36ob4JtOUMC2azeL3dTZAz0hL3f6Nmw4=;
        b=Cqn7VLKCa0edoxEJNqLpDRgTM5EThuIZw8QgzoVchjClkpv92qhHpIAImhhvNeulqU
         2uglUTIhafoEZIMIlfn/8RI2RfaIouIPRqTqp7CrHUWGg4K5Um0o0iejYyq6zvckc5Tp
         fAzwqEikxhv1pPksCrS4Fbp71Mz7oqvKBdbkeM0MwKbXaRD5dARQfNqHlvgMTnimSDHB
         10CuLvSkAza0EcHylDleWnMq2Ip4HCdHaLOjC9iuvbHeXjRWljaHaEtOwuEtnTRyepha
         McQAgpohDPTuWORwMYIPDnLhkmHjL/q/JuON01KrEyrVXhYa53Z/QUBpE+xSTn/px+cV
         HJ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXL9Ah/Vg4rcP5SZ1rNcosprX5Qb/rgePcgqDH8fSCQxFQ7A5LY5G+nf2STaeZKweMX8AHU8Os7cfR03bcgQHapV/dZdlNEWlEQa6pSdNEIH2Y=
X-Gm-Message-State: AOJu0Yx7FNSpSJZQPyMidwrI+sx88daTjfjWxEuv7s1xriZ/gSEhffj4
	ihQqRCOY+3DF2w477kynVqVETtVUHR5dJ9pmO8+7U8DLMQ0xzEzb+KvNM5OLwaM=
X-Google-Smtp-Source: AGHT+IGaqXXqQDMlRknVDn9Zctby8wWX5plji2zTKOgGcGEZKQWoEBs0sgqxhVWS467wRkUFWIzLbw==
X-Received: by 2002:a2e:87c7:0:b0:2d6:c672:b301 with SMTP id v7-20020a2e87c7000000b002d6c672b301mr1251197ljj.50.1712909155792;
        Fri, 12 Apr 2024 01:05:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b21a:2459:7056:47f0])
        by smtp.gmail.com with ESMTPSA id a8-20020a05600c348800b00417bc4820acsm4944675wmq.0.2024.04.12.01.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 01:05:55 -0700 (PDT)
References: <20240221151154.26452-1-jbrunet@baylibre.com>
 <b6jyherdfnehu3xrg6ulkxlcfknfej6ali2om27d7rjmwncwxz@3wrtx6sv4xm7>
 <1jsf18skat.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Neil
 Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
  Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org, JunYi Zhao
 <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v5 0/5] pwm: meson: dt-bindings fixup
Date: Fri, 12 Apr 2024 10:04:22 +0200
In-reply-to: <1jsf18skat.fsf@starbuckisacylon.baylibre.com>
Message-ID: <1ja5lzovj1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_010558_117233_7825700A 
X-CRM114-Status: GOOD (  10.14  )
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

Ck9uIFNhdCAwMiBNYXIgMjAyNCBhdCAxNjo1MCwgSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXls
aWJyZS5jb20+IHdyb3RlOgoKPiBPbiBTYXQgMDIgTWFyIDIwMjQgYXQgMTE6MDQsIFV3ZSBLbGVp
bmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4+IFtb
UEdQIFNpZ25lZCBQYXJ0OlVuZGVjaWRlZF1dCj4+IEhlbGxvIEplcm9tZSwKPj4KPj4gT24gV2Vk
LCBGZWIgMjEsIDIwMjQgYXQgMDQ6MTE6NDZQTSArMDEwMCwgSmVyb21lIEJydW5ldCB3cm90ZToK
Pj4+IEplcm9tZSBCcnVuZXQgKDUpOgo+Pj4gICBkdC1iaW5kaW5nczogcHdtOiBhbWxvZ2ljOiBm
aXggczQgYmluZGluZ3MKPj4+ICAgZHQtYmluZGluZ3M6IHB3bTogYW1sb2dpYzogQWRkIGEgbmV3
IGJpbmRpbmcgZm9yIG1lc29uOCBwd20gdHlwZXMKPj4+ICAgcHdtOiBtZXNvbjogZ2VuZXJhbGl6
ZSA0IGlucHV0cyBjbG9jayBvbiBtZXNvbjggcHdtIHR5cGUKPj4+ICAgcHdtOiBtZXNvbjogZG9u
J3QgY2FycnkgaW50ZXJuYWwgY2xvY2sgZWxlbWVudHMgYXJvdW5kCj4+PiAgIHB3bTogbWVzb246
IGFkZCBnZW5lcmljIGNvbXBhdGlibGUgZm9yIG1lc29uOCB0byBzbTEKPj4KPj4gSSBhcHBsaWVk
IHBhdGNoZXMgIzEgdG8gIzMuIFRoaXMgZG9lc24ndCBtZWFuICM0IGFuZCAjNSBhcmUgYmFkLCBq
dXN0Cj4+IHRoYXQgSSBuZWVkIHNvbWUgbW9yZSB0aW1lIGZvciByZXZpZXcuCj4KPiBObyB3b3Jy
aWVzLiBUaGUgY2hhbmdlIGluIHRob3NlLCBlc3BlY2lhbGx5ICM1LCBhcmUgcHJldHR5IHNpbXBs
ZSBidXQKPiB0aGUgZGlmZiBhcmUgaW5kZWVkIGhhcmQgdG8gcmVhZCA6LwoKSGVsbG8gVXdlLAoK
SW50cm9kdWNpbmcgdGhlIHM0IHN1cHBvcnQgZGVwZW5kcyBvbiB0aGlzIHNlcmllcy4KSXMgdGhl
cmUgYW55IG5ld3MgPwoKVGhhbmtzClJlZ2FyZHMKCj4KPj4KPj4gQmVzdCByZWdhcmRzCj4+IFV3
ZQoKCi0tIApKZXJvbWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
