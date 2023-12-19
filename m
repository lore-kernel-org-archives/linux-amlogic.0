Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E82EC41535
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Dec 2023 18:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nkYWGEUrgmQ49DoRc0NHH1OWTr/1ZdwhjxFUaJgcGdA=; b=IbQPxfaveedIyZ
	Zd/s9ShEHQyU2LPiKhCNXERpS+H0kb9N8YTb0L2jdB3PCnswKmx+BEyZxOI/Rk46YAhbN10nMcJzn
	/K0axzNRTRpRh64H3oF9MuqIaUroS7tJgBvlzs+mE9fvTMzwbIUuH3Z2TL2Sw3zFU1tZTWDoLrDbm
	mS3QdzMS94zlREiJzYeYFh58TPCK+pw7qcLJJXuZUEHHogSEWjRycJU0EvnAi4LIh6mSMi1B7TfZu
	imtEtbeUGutx1qNc/s5r5WxQb7DSeAKEQYdZmKi/CEfB0r+7OpTVSG0RYDa9m4Bb170aBTGNsYctt
	kMyOEF5H7kMeF92kDcpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeNe-00F6B6-2o;
	Tue, 19 Dec 2023 17:59:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeNc-00F6A1-1S
	for linux-amlogic@lists.infradead.org;
	Tue, 19 Dec 2023 17:59:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40d3102a2d9so1395455e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 19 Dec 2023 09:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703008783; x=1703613583; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tqHXsUzuWClKVHdDcXRwOKbkdcrm5H9v6SELG5butfI=;
        b=p4tFcLZk6XJS4mZ5fAKyw99KkjbesiD6JJr5XRdd4+a9EkATULKd7MWEiaO33o7FLG
         webXpmUlV+HBWo2FFyZu6RND+kES5J2XM2H1LMj4pQ7/5AVIB6kyNBH3A7ntP6MbO7PZ
         v2KMYDmeXzi52uEarauaZOr9/ZMAuOR9adDqEI+B4H28pGMRSdYtlLaR62wVmlylPzOL
         CwjzNAy7CEI9wtHXioKa/m/P9RobRGtXdMCSfGIC+5pEahgzi3W093zw9EnwUz5fHAl4
         3aDSzaFCdhC/UIQZKKYbdIIwXK4oIN2Cv2ncb76ZJPoMNb5V4xhSPvF5K9MT7J2kjorV
         d78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703008783; x=1703613583;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tqHXsUzuWClKVHdDcXRwOKbkdcrm5H9v6SELG5butfI=;
        b=FF4qlTWv1o2H2t/hLrUZhvAGioIjxphaSPZYu+nwQ3ierHcaJFZD7goZFYbYcaLsn1
         rnxvYhfHK1YaB8Q/Fzeu47xAiOeqfA9hsvuntWu+/FKFOjqq0/iNgx31D6Syg7rcdD9x
         A57oT7zuVF18uOaluuGR3KjM6WVPfI3SmYAxSWmNYckOZUdt4rUrPbhusCmaSvVM9f12
         TReQujFHsY0Qr1K+4+QVjxkM5mn1p3v7IAGJAhv49VYkknrIiElMCi+qw2KcBLpUnBHn
         m2A/gY0cEqQuDwzEzXKfdMYnaQUl9y+okt1gBajew1bu1qKhBiBpmPkWXhor5SpBac9i
         q1wg==
X-Gm-Message-State: AOJu0YwaRR4vq0n34g65pfSoXS2hyQBNZ/JWJtyJEXm6f1IlzgpqlR+U
	crcFyHOPId1HLE86zwUIlEEFhQ==
X-Google-Smtp-Source: AGHT+IHTbL5R+BKsfjLA4+IL6EQF0An0d3vy+3YBRu4MG01xcYYLuWQyJRn7wEhHU1ArwUxfMgj3Vg==
X-Received: by 2002:a05:600c:1c1a:b0:40b:5e1c:af27 with SMTP id j26-20020a05600c1c1a00b0040b5e1caf27mr10072010wms.45.1703008782679;
        Tue, 19 Dec 2023 09:59:42 -0800 (PST)
Received: from [192.168.10.46] ([37.170.14.102])
        by smtp.googlemail.com with ESMTPSA id m39-20020a05600c3b2700b0040d23cea7bcsm1320165wms.1.2023.12.19.09.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 09:59:42 -0800 (PST)
Message-ID: <ffe8605b-3e71-4726-993b-8a5873263989@linaro.org>
Date: Tue, 19 Dec 2023 18:59:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] thermal: amlogic: Two cleanups
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel@pengutronix.de
References: <20231116112633.668826-1-u.kleine-koenig@pengutronix.de>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20231116112633.668826-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_095944_490628_75B3B79E 
X-CRM114-Status: UNSURE (   8.80  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTYvMTEvMjAyMyAxMjoyNiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gd2hpbGUgcmViYXNpbmcgbXkgcGF0Y2ggc3RhY2sgdG8gdjYuNy1yYzEgSSBzcG90dGVkIHRo
ZXNlIHR3byBwYXRjaAo+IG9wcG9ydHVuaXRpZXMgZm9yIHRoZSBhbWxvZ2ljIHRoZXJtYWwgZHJp
dmVyLgo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+IAo+IFV3ZSBLbGVpbmUtS8O2bmlnICgyKToK
PiAgICB0aGVybWFsOiBhbWxvZ2ljOiBNYWtlIGFtbG9naWNfdGhlcm1hbF9kaXNhYmxlKCkgcmV0
dXJuIHZvaWQKPiAgICB0aGVybWFsOiBhbWxvZ2ljOiBVc2UgREVGSU5FX1NJTVBMRV9ERVZfUE1f
T1BTIGZvciBQTSBmdW5jdGlvbnMKPiAKPiAgIGRyaXZlcnMvdGhlcm1hbC9hbWxvZ2ljX3RoZXJt
YWwuYyB8IDE5ICsrKysrKysrKystLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+IAo+IGJhc2UtY29tbWl0OiBmMzE4MTdjYmNmNDhk
MTkxZmFlZTdjZWJmYjU5MTk3ZDIwNDhjZDY0CgpBcHBsaWVkLCB0aGFua3MKCi0tIAo8aHR0cDov
L3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9y
IEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2Vz
L0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdp
dHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
