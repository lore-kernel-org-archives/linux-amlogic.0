Return-Path: <SRS0=3F0F=AF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21020C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2020 16:18:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E68D220738
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2020 16:18:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pVn7kbeB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kCQk2B5n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E68D220738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IbtT1NRGLxrsY332MNl5lIjhhFusNkMX/7HNE7rzy34=; b=pVn7kbeBCkIW/sNz1h3+zrpnU
	/uflHUGZWUVbFsL/Tr+K5oP2exXvLsJkit8ZJyUmRy3SmxjBptsmE+sEh16oyndEhmM0lOnK/ughN
	4e6ICq3UfRYaE+Wt8aeMxoPFsjAAxIuIRyW/Bwp2QPrUEh35yZBAZzuAStaYRlOTlcaZWt7qWxVI/
	3wMV9tihWjH/K+Gl6TBU2cKAjliI/KUqksKWI5Kf9KFbhwjLNS4UHQ0viVOBdf17GqJZVN4wB8GUt
	AfGgsncXh4nZLT5m1V24+evlcu0hR4sP3IFaF8lh+xQuAbF3biy6SSsCjzH12fSpZPXRthUXJrmDK
	8w9F5Ug2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo86Y-00041L-2Z; Wed, 24 Jun 2020 16:18:30 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo86S-0003ym-UW
 for linux-amlogic@lists.infradead.org; Wed, 24 Jun 2020 16:18:26 +0000
Received: by mail-wm1-x342.google.com with SMTP id f139so3081057wmf.5
 for <linux-amlogic@lists.infradead.org>; Wed, 24 Jun 2020 09:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ep4axTkVGVLCuhtuT35jZm6JhAHbveyPDFnU1RqKcwk=;
 b=kCQk2B5n3euUJtKQUmXdSLEj18Epwj/MT4SbLwc2X2yoiWvBfc6DwFfbX01zqCWPgw
 ZSR/JwfcZCdfMA86UwospdQbGDBXTljQVW5u4WjzFaPNEjLrqr9TXcU0CT/LDquUIpj8
 RhB6/mmO9vw52a1u9onC9yOeh7cVEFukdKAKy075lSgxV0ZX3nKRZe17g/tnuufbgq/I
 fy3Pg4wTH4t4DZVjtj3VA0LXlp71YV2gglpwEWYenGt8PvuC3maTyXTmYkdCcR0plkOh
 V/gib2puLtCIKQBDl6Em7qrvsIteftBYRGbp2+kyFlV+W7hLYAESg5m0aSHs80u7c2wo
 jCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ep4axTkVGVLCuhtuT35jZm6JhAHbveyPDFnU1RqKcwk=;
 b=quwBEtsFPeT0vp9hHRvRN73p+TrPI6IgwPsAgDGQDBEJePV4f+FlmZt4Va3XlPQjuv
 XS3yzvZo6GchBLI0wmAXeGUfAzhrLem2oedDWOMKuMLDsd2DVHctrqzMavFD09p/s9qO
 M0YniLrK61ObQ34Gs6kP5ZRyefhhnc7ggUjtRKyq4dqqmsXAa3xk/DNBF9/EGJ9lvzWg
 YI3On4Pc82wTnL6WWLFXIFrRHLNHlFyJ9D2wrZWQVSL+uDVqvp6tgGBSaGi4dPjR3WFH
 aUvoh4OoeYKMxveGRSEQlmxOKDTcDuC8ytSAyh0Um9vrSaJ2LkSfj5h09+KMhjvKxBHC
 hc/w==
X-Gm-Message-State: AOAM5301h40l7R/QZ1d0FPw2D8ufubiUbk0MUYaYULuSofKBrdrOUv3i
 Z3Qbs6vkL6mfAA06ux2MZ6ok2Q==
X-Google-Smtp-Source: ABdhPJywrZdrK8cLnjsmr7ze8a6BieFMrMQGdWM/h1IEYFHJJd7qz4Cypeu6xovAeVfEv4wDgJ5Jpg==
X-Received: by 2002:a1c:6102:: with SMTP id v2mr29243006wmb.6.1593015502060;
 Wed, 24 Jun 2020 09:18:22 -0700 (PDT)
Received: from [192.168.0.41] (lns-bzn-59-82-252-131-168.adsl.proxad.net.
 [82.252.131.168])
 by smtp.googlemail.com with ESMTPSA id q128sm8525304wma.38.2020.06.24.09.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2020 09:18:21 -0700 (PDT)
Subject: Re: [PATCH v5 1/2] thermal: add support for the MCU controlled FAN on
 Khadas boards
To: Neil Armstrong <narmstrong@baylibre.com>, lee.jones@linaro.org
References: <20200624161528.12664-1-narmstrong@baylibre.com>
 <20200624161528.12664-2-narmstrong@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <b2c3e3f2-21dd-2fe1-bed0-8576bb2ffcc8@linaro.org>
Date: Wed, 24 Jun 2020 18:18:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200624161528.12664-2-narmstrong@baylibre.com>
Content-Language: en-US
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: amit.kucheria@verdurent.com, linux-pm@vger.kernel.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>,
 linux-amlogic@lists.infradead.org, rui.zhang@intel.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjQvMDYvMjAyMCAxODoxNSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gVGhlIG5ldyBLaGFk
YXMgVklNMiBhbmQgVklNMyBib2FyZHMgY29udHJvbHMgdGhlIGNvb2xpbmcgZmFuIHZpYSB0aGUK
PiBvbi1ib2FyZCBtaWNyb2NvbnRyb2xsZXIuCj4gCj4gVGhpcyBpbXBsZW1lbnRzIHRoZSBGQU4g
Y29udHJvbCBhcyB0aGVybWFsIGRldmljZXMgYW5kIGFzIGNlbGwgb2YgdGhlIEtoYWRhcwo+IE1D
VSBNRkQgZHJpdmVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ry
b25nQGJheWxpYnJlLmNvbT4KPiBSZXZpZXdlZC1ieTogQW1pdCBLdWNoZXJpYSA8YW1pdC5rdWNo
ZXJpYUBsaW5hcm8ub3JnPgo+IC0tLQo+IEhpIERhbmllbCwKPiAKPiBJcyBpdCBvayBMZWUgYXBw
bGllcyB0aGlzIHBhdGNoIHZpYSB0aGUgTUZEIHRyZWUgc2luY2UgaXQgZGVwZW5kcyBvbgo+IHRo
ZSBsaW51eC9tZmQva2hhZGFzLW1jdS5oIGhlYWRlciA/CgpBY2tlZC1ieTogRGFuaWVsIExlemNh
bm8gPGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc+CgpbIC4uLiBdCgotLSAKPGh0dHA6Ly93d3cu
bGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0g
U29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5h
cm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIg
fAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
