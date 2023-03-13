Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACE1C6FD19
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 09:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IYWwihHmIWQEGf131XR56M1T6i3s8Vgktaw6r7wrgLM=; b=GXOtHWGFqAngFW
	Xc640wzviu/s3RhwjsM5IrFsFMULuXfbQFdkizrSNkdJBDO7Faj5V202sKygKgXDZGWYIiPZfFQuR
	R2tYE2EEtwQ971jddVB+m2d9yZQO8HerMr4BBotlMy/x62AuB46c5d6uchqnifN2UiFvl3pVdIiEO
	zwgCP7jgh/FYtx3dvUxRNtLpBgDq+jkvpwkzP4ZGHRaZmg9IK1ujQgcx29dfIOGZpQ1sYPpteyfrg
	SJcHKS8iiZ9N25KuYJG3XQ25zuKxYG5EvmUKarJoB00yrYBmW2q6qCSE+3qWYUwRnFOmSnG/O4VCR
	ifq0CsYC+OAZhKXA5Xiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbeHt-004wsk-O6; Mon, 13 Mar 2023 09:16:14 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbeHc-004wlJ-Iz
	for linux-amlogic@lists.infradead.org; Mon, 13 Mar 2023 09:16:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so10366176wmb.5
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Mar 2023 02:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678698953;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5FHHSr/bQjBDy3HwdZXbbXCk/HhY0MHE1EY7OEHrtY=;
        b=k/eBzQaDLiI+ppbciswnLUk1/Q/nI3F0q7VKQTg1HM+YOZDTSH2mJvjZ45HvlR3WIp
         jj172mCZ/I36shWovWfENe/QWsX1LOQJLZtnQBWgrhVSohvVtx9zcEImLpEFMVAnXb7j
         J0jfU2xljLsntw1HSoQjaxkeN7LDWtONsXiIobTlDi/CLs1VrCcea5WyG4k4u03mVSSm
         Ex2voRCD7hmy761rp+oUXWFxl0HrdsM3gKo8k6a6Sz3gvRlwmVH1m8UjYOg7UwoCG1G8
         A76J/JNZYJR1bkqAdbGbkfToTnu1qwo0Wi8ZNvk+SxaUHzlVWFX9SKExm3JVsr07xi+H
         I7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678698953;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F5FHHSr/bQjBDy3HwdZXbbXCk/HhY0MHE1EY7OEHrtY=;
        b=xihPcsS1Rdi40EYKGqYvudkIVMKfGhvfCiNJpexy9UdyA8HlLByf9o8wKH8fDNSKQ/
         rmsXPMOjXPWUaXgLHw+9VrGWT2z4MotZpmpgF9+mqu7eoeuK70dokYNsexT246U4Vb2c
         aVIg3FgQVO0lLKR5RH482kA2xnma4pDutstfkH/28C3qZDeF1uZSQZh3ZhGrGtXIAVYk
         K/5CfSnprh9IfM9lFiuCeaVCCdZjEN9GoHFEo79QiuJ1HZZSDfbQLNrP0hSqV8VDCcsE
         sl49pe3LeTxmSmVJZK27RcJUbFYY6Cnu/mdtKS1lqgVhdlpmlEGIlrK8YW1PIGsFu8cV
         8jag==
X-Gm-Message-State: AO0yUKV78DvSwZMMXMReXSu2CIdfrfano4bmcp99A+vzuta5QlkK85L2
	8CG5z4O+mY1sfDLk0dm2Gq6R0Q==
X-Google-Smtp-Source: AK7set/EUlnB+P4G1PeUvV4Uifr31ytj2e78GmoiTgxXdZ8bti6uHzbihraHjlE1c26MSH5PAFq0sA==
X-Received: by 2002:a05:600c:4f50:b0:3eb:32ff:da8 with SMTP id m16-20020a05600c4f5000b003eb32ff0da8mr10038843wmq.16.1678698952887;
        Mon, 13 Mar 2023 02:15:52 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id p22-20020a05600c359600b003b47b80cec3sm9231715wmq.42.2023.03.13.02.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 02:15:52 -0700 (PDT)
References: <20230310191405.2606296-1-u.kleine-koenig@pengutronix.de>
 <CAFBinCCfqgBkHq2fFy=d+8C6nwq=wehu9nzePfwuY5ndfLMWoQ@mail.gmail.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Munehisa Kamata <kamatam@amazon.com>,
 kernel@pengutronix.de
Subject: Re: [PATCH] pwm: meson: Explicitly set .polarity in .get_state()
Date: Mon, 13 Mar 2023 10:07:48 +0100
In-reply-to: <CAFBinCCfqgBkHq2fFy=d+8C6nwq=wehu9nzePfwuY5ndfLMWoQ@mail.gmail.com>
Message-ID: <1ja60h106q.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_021556_896062_00758E45 
X-CRM114-Status: GOOD (  14.88  )
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

Ck9uIFNhdCAxMSBNYXIgMjAyMyBhdCAyMjowMCwgTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGlu
LmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cgo+IEhpIFV3ZSwKPgo+IE9uIEZy
aSwgTWFyIDEwLCAyMDIzIGF0IDg6MTTigK9QTSBVd2UgS2xlaW5lLUvDtm5pZwo+IDx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+IFsuLi5dCj4+IFRoZXJlIGlzIGEgY29t
cGxpY2F0aW5nIGZhY3QsIHRoYXQgdGhlIC5hcHBseSgpIGNhbGxiYWNrIGZha2VzIHN1cHBvcnQK
Pj4gZm9yIGludmVyc2VkIHBvbGFyaXR5LiBUaGlzIGlzIG5vdCAoYW5kIGNhbm5vdCkgYmUgbWF0
Y2hlZCBieQo+PiAuZ2V0X3N0YXRlKCkuIEFzIGZpeGluZyB0aGlzIGlzbid0IGVhc3ksIG9ubHkg
cG9pbnQgaXQgb3V0IGluIGEgY29tbWVudAo+PiB0byBwcmV2ZW50IGF1dGhvcnMgb2Ygb3RoZXIg
ZHJpdmVycyBmcm9tIGNvcHlpbmcgdGhhdCBhcHByb2FjaC4KPiBJZiB5b3UgaGF2ZSBhbnkgc3Vn
Z2VzdGlvbnMgb24gaG93IHRvIGZpeCB0aGlzIHRoZW4gcGxlYXNlIGxldCB1cyBrbm93Lgo+IEkg
ZG9uJ3QgcmVjYWxsIGFueSBib2FyZCBuZWVkaW5nIHN1cHBvcnQgZm9yIGludmVydGVkIFBXTSAt
IGJ1dCB0aGV5Cj4gbWF5IGJlIG91dCB0aGVyZSBzb21ld2hlcmUuLi4KCkFGQUlLLCBQV00gYXJl
IGVzc2VudGlhbGx5IHVzZWQgZm9yIHRoZSBTRElPIDMyayBjbG9jayBhbmQgdm9sdGFnZQpyZWd1
bGF0b3JzLiBJIGRvbid0IHJlY2FsbCBzZWVpbmcgYW55dGhpbmcgZWxzZS4KCkl0IHNob3VsZCBi
ZSBzYWZlIHRvIGNoYW5nZSBwb2xhcml0eSBpZiBuZWNlc3NhcnksIGV4Y2VwdCBmb3IgdGhlIERW
RlMKUFdNIHJlZ3VsYXRvcnMgbWF5YmUgPyBJIGZlYXIgdGhhdCBpZiB3ZSBjaGFuZ2UgdGhlIFBX
TSBzZXR0aW5nIGl0IG1pZ2h0CnRyaWdnZXIgYSBnbGl0Y2ggb24gdGhlIHN1cHBseSBhbmQgcG9z
c2libHkgc3RhbGwgdGhlIENQVS4KClRoYXQgYmVpbmcgc2FpZCwgSSBkb24ndCB0aGluayB0aGVy
ZSBpcyBhbnkgcGFydGljdWxhciBjYXJlIHJlZ2FyZGluZwp0aGF0IHJpZ2h0IG5vdywgc28gbWF5
YmUgaXQgaXMgZmluZS4KCj4KPj4gRml4ZXM6IGMzNzViY2JhYWJkYiAoInB3bTogbWVzb246IFJl
YWQgdGhlIGZ1bGwgaGFyZHdhcmUgc3RhdGUgaW4gbWVzb25fcHdtX2dldF9zdGF0ZSgpIikKPj4g
UmVwb3J0ZWQtYnk6IE11bmVoaXNhIEthbWF0YSA8a2FtYXRhbUBhbWF6b24uY29tPgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4
LmRlPgo+IEFja2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3Rpbmds
QGdvb2dsZW1haWwuY29tPgo+Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gTWFydGluCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
