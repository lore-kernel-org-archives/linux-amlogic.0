Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF54F43699
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2026 12:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YbIuEbL+42J7BWbto/FPYyYv562zz8BcWOsW5cRk4tU=; b=SbsBytO758CkST
	dCCkPghi6lTeXO+o5wLNRN4+eAC/DOaCjaF8SvmeYh4WEmOENL7Flr2fIRLASPnwUd6sfqVfkaKb4
	HzZnjv2sJFhrJNrhu1otIVUI5MUpC11N/LLpjPu4C0/C9wRLiUj9/k61Qc4E+v/9tAw01ZmMG2ArN
	/4wKVXeNV4+1UQo5YEX7LFMDQgIZ1Ts0qSfOf5misWqB2fs8Ja0tRgCPshbFmB29yUYU94gaPhKNX
	hfcHYuo9q2NgWEYU/F+9JSBNVex3pPP3TeSS/yMeaQhBvp+J6Pwk0Ps41f0VR1UUFDcVjOm2bql7Q
	2yoAThQ6lKxEh2Qb4CEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDi9G-000000041yX-2EPz;
	Fri, 17 Apr 2026 12:18:14 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDi9D-000000041xM-47HU
	for linux-amlogic@lists.infradead.org;
	Fri, 17 Apr 2026 12:18:13 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-953a5defbbdso363689241.1
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Apr 2026 05:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776428290; cv=none;
        d=google.com; s=arc-20240605;
        b=ii/JVLrrAkt+Bk8VFt7mwGfMiK5u3+hTmpSlzy+7xMOg1/jv9BDqKBpoG5/5vEwBfo
         phMnnDtwAptmjS7jc7MI1qr6LlcQoPPpXQR/mK4SYfLXBSvWJRrzC3FUKxM4C2v2ngKJ
         2uTB1anur2rvC3+U8Pp4KAbV3pqRXUbXDNhFW4zd0AOaBimKN09fhHB+FLOtW0QEHrSd
         wZWWVNWVCRoZ3FwPWbw2IEXN7vRO+2kHrvOi5Kxus92AnORSSYsAVWYl59PVS/tv5w+x
         GZa1J+I1bBVrk+DhxFxJkEaSwCb77AlBwvN0zWtPiv/yCNkfnMg6cAQ8bjEC60WyhDRW
         4OKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cDMhKxQZOBW41kLl446l1EJd+PVPbWKyXfIiDzkTED4=;
        fh=6wAYm/27P9p3XaEUzEmlveltFYWW52ATOt3MMaajfCQ=;
        b=OLQostGlRQXBjdxH0I7jIAfq3kcRI95+wfAdAdG8+CdH1I+Ad+zoSxHNLTVAWbdy3r
         KMA+grDPG4UeY9YRr3KFp4xhDqqh7Efe0DRZrwOGqKVDnMER0ZdUJQJsH2ryVR0L5QJk
         MCqsjLmOxNyIim/eRGQ0XcPAq6OOBxuKJcnzDiAqkHk6OMlJ5C5u+iigj3VtaddvhbTK
         AO4Uvs7mYz9rCHrWmtkyDyv6nsNIkRyAsHDBwmvQTEykZ/g5hX4xHGKMLdqKYDIaz+C+
         1SMz30GpygeInmqo6gBG93PEOgpMDGWEUgsNXp5/9ivFDsCxTExsvN3pM7FX0lwDbAfd
         nzvw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776428290; x=1777033090; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDMhKxQZOBW41kLl446l1EJd+PVPbWKyXfIiDzkTED4=;
        b=QL3KvrsUEGvosDAZhGvg6haNaFBHpxXylQ9MQxM641NnNzjvESeg91oJqA0svEQMrS
         bN37C564LCksChzUAzN5T7T9mUUNAF3MyZ4ckuNsQdao8os3/kTCW05wephrR8iKyYnB
         /ax+FGRIFWgJu4LPlO3weadL0uJmiU85VtCXYfRpXAkN2/7f/b2SQKEIDMxKkPjTG8OD
         FxxNDeheON9ZAzHPJHV8ncXb0ZJRoUUw2hmTTuDAVLaB6Nnne8859d3RmQAal7NWZrsc
         9Ek9B4zcr84NOg+VXPus/801vtMZR5rolpJZFCyfm6wWA8ExazjV/74OR4pb5tiDm8CU
         jhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776428290; x=1777033090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cDMhKxQZOBW41kLl446l1EJd+PVPbWKyXfIiDzkTED4=;
        b=MdvfMFng/UxrH3tpPQ4HkqTP30txPlWsb/LMGlZ8nHf0KTUTFHyI1BaqprVin4nkWK
         EqAS0gBH4axeqnMEG9sRc4wfN7bO90bcT5wm1mrlqlb+qwArHRkORdrB0IxwzLcQ7jk0
         flmTZgg7xNADL5i36a+X5yscsPFhzkt3cs2YWtK1C40oGVs3LaN2m95/E16nI8RINkHt
         7eqQImtLaQWp5/+sf4w3x0GnY8saFDYney3Qus91TGk00BM5YHb3JHdqCnuHCkXQA+PZ
         FD6oAuEz5ULe/PQLZn08e9DWxgPyIsVmANhpla5kU56yOE6fA3WvEdcyHWMgpRHGgYoB
         BoeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+baAz/UO4ffd6j9lr6g9ABwzrLlu6VutohsMlW3hL8GgMlYxeQ75l/XnOfJEdHvG1zS2EAefwFVvqe+51/@lists.infradead.org
X-Gm-Message-State: AOJu0YxM/K/YCEz06wply4aX4FKsB0AKDZskLGgdcxN5nM68cZZSzJTT
	A9FOMyk8QdFyGiLRNtn8/YblkQsmSfwJ5k7khryo7+KhGWX4S2+O2REVlWkkXuvIFcH4OYfdfC0
	3ZurgLCbsvRyBU3fSUbYaDd71OUVrh+U=
X-Gm-Gg: AeBDietRWzCGhXPMVymJvic6wczSGzNFcpDqdP7SIAvlFJkm8NTDNMJhh1TPzZ1HSj3
	7DMfQ4zAtSOgWuTAjCgini1hFWxeJFHP4Y/Y4pv8SK22kLADjsvBgYsUVqhNDCXxjJ+IPUWLCMj
	9RoNhYzZZmkLarC3EjYRyo2VZQxkvR0HtbMnmOMFkfE2eia3dd4ozWrQJxVS08gZ6n56whrfxrv
	Xra2Q/BsJ8w6QcvmQxi9IMBMPYGwQ0ALOdJScFah7XX16a/8cmOc10Q7xfCp0fQZY+pvs23TqdN
	c1Tt+Cny3Lp31Y7VcA==
X-Received: by 2002:a67:e703:0:b0:602:afbc:ae78 with SMTP id
 ada2fe7eead31-616fb89ea6emr791230137.2.1776428289898; Fri, 17 Apr 2026
 05:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com> <20260416-hpd-irq-events-v1-6-1ab1f1cfb2b2@oss.qualcomm.com>
In-Reply-To: <20260416-hpd-irq-events-v1-6-1ab1f1cfb2b2@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 17 Apr 2026 20:17:26 +0800
X-Gm-Features: AQROBzDTVswzyUjJ6xkXYjkzbvzXgr8nk22CVU17PBSoxKtVUOrPnYmdya4d4B0
Message-ID: <CAH2e8h4rLZB3E8Rdwy_LtfwtwAKZCOgL18fRFVqGBx32Cm2N2Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Nikita Travkin <nikita@trvn.ru>, 
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_051812_051920_0EE90A63 
X-CRM114-Status: UNSURE (   7.66  )
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

T24gVGh1LCBBcHIgMTYsIDIwMjYgYXQgNzoyMuKAr0FNIERtaXRyeSBCYXJ5c2hrb3YKPGRtaXRy
eS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBQYXNzIElSUV9IUEQgZXZl
bnRzIHRvIHRoZSBIUEQgYnJpZGdlLCBsZXR0aW5nIHRob3NlIHRvIGJlIGRlbGl2ZXJlZCB0bwo+
IHRoZSBEaXNwbGF5UG9ydCBkcml2ZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgQmFyeXNo
a292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+CgpSZXZpZXdlZC1ieTogUGVu
Z3l1IEx1byA8bWl0bHRsYXRsdGxAZ21haWwuY29tPgoKQmVzdCB3aXNoZXMsClBlbmd5dQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
