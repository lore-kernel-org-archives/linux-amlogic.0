Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6E1EB64DD
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 07:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9QObRoSNs9kk0GYpBmEqPhIVSO40R5/1ze57bkVlgE=; b=Z8+CfBZfZZ3amx
	c0cdiku3QHmuKfae2A63A1UsosXYwqJ6dAgjhTYmqRDMD2IMfnAihLqGsYJJ51/w+8X/Hzi94KEmM
	+956IB2H6rM1cbDmbx7W5QJgrPIEfFHCb5pfiXj9dppyihi+hkT0Zb/2I4mJhcjCfNhDGmJrCq5bf
	JN0w3i9gmTr83+V3S7kTr7U+9aGGNaz+2G2RRJJTHy/ZaHgDgu2re1tpSXSYxZgs57RAfK50qYfBa
	Oq0eY9x+vE8wmwoz4ZREK1ICVl4DXx4PNcrHbZ7TrJe3Ofa1dD1bmoQGAuensuGQtXaZUSELGgWlz
	/iwTsOYFriJpX/ttfuqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE3Wt-00CSnd-2D;
	Tue, 27 Jun 2023 07:54:27 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE3Wp-00CSlE-0x
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Jun 2023 07:54:25 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b69dcf45faso33021891fa.0
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Jun 2023 00:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687852461; x=1690444461;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/9SiAC6+9hSpeXdep9Ze7xghxn8zCBJk7xNH3HIPpA=;
        b=xH3OBdpByqpSTSDwgUUbQnCdFbZ8EGBUquiIbTgoM6ur/RxO4jzr5N7FVdLEyp9osu
         4fUg5o1kQgFd39kaSQB/v3Dt2i5+kH+XtjQrYFY2H/phUVXzEfm1YhsIZTP5BWuD6/AC
         d8Wd1CuUwipCNMSrcoEVdiV0oA82bEUcO/DWeKoMQVtlExD0oo0eqYO+EDG5OgJWsT5q
         l5gdVK4Ub+V8MQoKEiEqvq2+3rmEiIOuUolAzbjTnUgRBWqSgyoCdv8UKbyPfLgPtOaA
         E3s1bXCmPgb9Iy0Atr6leoWtgDn/a0RgdPONUCFznSOJfqB4wsYAYc3aSmK8lQQxqugZ
         5rLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687852461; x=1690444461;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/9SiAC6+9hSpeXdep9Ze7xghxn8zCBJk7xNH3HIPpA=;
        b=W6UsoOv0oSIya+o8X6cFkcJrreYPu+QpVO4+03KCLWcmXV1uksLOuJyfwFBz/UK/eM
         ZTDVrc/fOjSKx0NbLP4yA0YQFpW3HLnMx3b6vc4tDi3ZALsIy1BhwJ9evGd8oFg2RilA
         5bzFAdTmZPfSIMw4wskEivgp7x5QNclveDqX2vzSgYJ6hlAR8WkCHrShVo6/59xHtRrX
         dOYixQGpr0M32xpXas/bq7xy3S7wPMIs9bCUWEHGMYAwI3lxKZTkNhFtbNtOycZ+qLRZ
         kHT7hIxoJHmO0x0dAUKWPTgqiTHNkd4u4q9KZcNDWG3UxRS0OVag69DsT1Rc2BtsF13d
         eByA==
X-Gm-Message-State: AC+VfDzdQMu8oNZOZLX4tWTjZkJjAgTWo34ThnCEf56v8FFlb/Eu2/ip
	CkOiBtfRkTdKNhn0JvmrhqWvmg==
X-Google-Smtp-Source: ACHHUZ7bpuVEi9RLkIMrLwAHeRUB8Dq5bSdhVpr9n9MLMwiGjVZ9wyoQ3JQkv2KD/Z88PbBdz+0EsQ==
X-Received: by 2002:a2e:6e16:0:b0:2b5:950a:711c with SMTP id j22-20020a2e6e16000000b002b5950a711cmr8267099ljc.10.1687852460842;
        Tue, 27 Jun 2023 00:54:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id a1-20020a5d4561000000b0030e5a63e2dbsm9665578wrc.80.2023.06.27.00.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 00:54:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <cover.1687702042.git.adrian.larumbe@collabora.com>
References: <cover.1687702042.git.adrian.larumbe@collabora.com>
Subject: Re: [PATCH v3 0/3] Add additional YUV420 bus format check for
 dw-meson's bridge enable
Message-Id: <168785245992.3048852.18155160209808336465.b4-ty@linaro.org>
Date: Tue, 27 Jun 2023 09:54:19 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_005423_331792_D42BEEE0 
X-CRM114-Status: UNSURE (   9.33  )
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

SGksCgpPbiBTdW4sIDI1IEp1biAyMDIzIDE1OjE3OjE0ICswMTAwLCBBZHJpw6FuIExhcnVtYmUg
d3JvdGU6Cj4gVGhpcyBpcyBhIGJlbGF0ZWQgZm9sbG93LXVwIG9uCj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvZHJpLWRldmVsLzIwMjIwNTE1MjA0NDEyLjI3MzM4MDMtMS1hZHJpYW4ubGFydW1i
ZUBjb2xsYWJvcmEuY29tCj4gCj4gQ29tbWl0IGU2N2Y2MDM3YWUxYmUzNGIyYjY4ICgiZHJtL21l
c29uOiBzcGxpdCBvdXQgZW5jb2RlciBmcm9tIG1lc29uX2R3X2hkbWkiKQo+IGJyb2tlIDRLIGRp
c3BsYXkgbW9kZXMgZm9yIG1lLCBhbmQgSSBkaXNjb3ZlcmVkIGl0IHdhcyBiZWNhdXNlIHRoZSBy
aWdodAo+IHBpeGVsIGNsb2NrIHdhc24ndCBiZWluZyBjaG9zZW4gaW4gZHdfaGRtaV9waHlfaW5p
dC4gSSBtaXNpbnRlcnByZXRlZCB0aGUKPiByZWFzb24gYXMgYSBwcm9ibGVtIGluIGZpZ3VyaW5n
IG91dCB3aGV0aGVyIHdlIHdhbnQgdG8gZW5mb3JjZSBZVVY0MjAgbW9kZSwKPiBidXQgaXQgdHVy
bmVkIG91dCB0byBiZSBhIG1pc21hdGNoIGJldHdlZW4gd2hhdCBkdy1tZXNvbiBjb2RlIGlzIGRv
aW5nIGFuZAo+IHRoZSB3YXkgdGhlIGJ1cyBmb3JtYXQgaXMgYmVpbmcgcGlja2VkIGJ5IHRoZSBk
dy1oZG1pIGJ1cyBvdXRwdXQgZm9ybWF0IGRybQo+IGhlbHBlci4KPiAKPiBbLi4uXQoKVGhhbmtz
LCBBcHBsaWVkIHRvIGh0dHBzOi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZ2l0L2RybS9kcm0t
bWlzYy5naXQgKGRybS1taXNjLW5leHQpCgpbMS8zXSBkcm0vYnJpZGdlOiBkdy1oZG1pOiBjaGFu
Z2UgWVVWNDIwIHNlbGVjdGlvbiBsb2dpYyBhdCBjbG9jayBzZXR1cAogICAgICBodHRwczovL2Nn
aXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYy9jb21taXQvP2lkPTdlZDQwZmYxZDEzNGJm
M2E0YWVmNzA2ZWVkNDc4YjkyNmYzNWI0MDQKWzIvM10gZHJtL2JyaWRnZTogZHctaGRtaTogdHJ1
bHkgZW5mb3JjZSA0MjAtb25seSBmb3JtYXRzIHdoZW4gZHJtIG1vZGUgZGVtYW5kcyBpdAogICAg
ICBodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYy9jb21taXQvP2lkPWYz
NzEwYjQyNGE5NjA3OGY0MTZlMWJlOWNmNTJiODdlYWRhYmFlNzgKWzMvM10gZHJtL2JyaWRnZTog
ZHctaGRtaTogcmVtb3ZlIGRlYWQgY29kZSBhbmQgZml4IGluZGVudGF0aW9uCiAgICAgIGh0dHBz
Oi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjL2NvbW1pdC8/aWQ9MjI5OWE4ZDEy
YzFjYmNkYzcwODYwMjc2MTVkOTkzNmE5NzBlN2Q2OAoKLS0gCk5laWwKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
