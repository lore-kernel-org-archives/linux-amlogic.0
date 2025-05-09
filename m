Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83206C3ABBC
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 May 2025 17:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlWHFx7R6828io+IzBKN8rrGzgkfxC7+NzzifmHBgD4=; b=ObfSoqjkaha3qU
	BZE3uNCDnH2CylxqSDoyxoX7P03nlLb5nujldhMjVoX0v8XOAP4HCyFH6tS1nokKVkguX1W1w/6vR
	+015ome/zu0dBoZH1igTHYj9z8L2dN2iwpajwELtiv+G4sOskO5XU1QTkSObKkrlElAr5QParHh/L
	LNxHG21o7ePpm0C18g5usAVUEGPIeU6clsplh+u7Zw3SUG44fYRWlFrDZ4EcMIK+W6gHhztaSvi9Q
	QEbXhprcFswiKoWs6uxdUXvQsYFcns2Z6v73LYvA6TNCMX233oOlct6BIdIsf4jFLWKlLecKxrQse
	qDrQTZe3VT2BOEoPy5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRlQ-00000004TBW-2Iu7;
	Fri, 09 May 2025 17:44:00 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPnr-000000047Fs-3Lrw
	for linux-amlogic@lists.infradead.org;
	Fri, 09 May 2025 15:38:25 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a1f9791a4dso419490f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 09 May 2025 08:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746805102; x=1747409902; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhGArMwmGNgqoLRw4DWsBA14SdvN354OIbHqJyYkB5Y=;
        b=nT+7XXnfw/IZZFlzwahD821HdTuxph4M73dNKmEZOaartxs+qNOpUFTM1JZCQUDaI3
         tFn9jFYjAx2QOP+phOS7D2suxfafDX+NAtgMolkxjXAH+Si8j90Wl6uBm2MMDUEiRLLZ
         JjAy2T2zSZSlgEZ/rJ7XDXhPx+RPIrq1falBZkihw5Hi8Qsnnls15Wtbn8Lt4HVJIMaM
         OaZ6DuJoLMvC7eK3D9sbfdV7vk8IM7e5mb3hDwcs5Pk3N4GL0Y5o95K8ESlRQ1ERYhdq
         akdGVibJTteL+uTTBNKrAPBbwrTTvMbEUGXfppu5G2Yt3YlR+PP4jwxBn/vbzho5/jZE
         UG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805102; x=1747409902;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhGArMwmGNgqoLRw4DWsBA14SdvN354OIbHqJyYkB5Y=;
        b=L9ERJcVMHDDJUnGlr55FOmAkGdNSlPo+CmWqmOOrPTI2/LKtJaM2g8Nl08bN8zq9yc
         JE+goj0mvL7wGkZbEp/yY8SIK3CokI1kS4NEgp/8id+GrAy9BnpmSVr1Fczt0u9IZCAc
         aiS0bHJ+Y0gYiqU+uaCJrKa5GGcjctJCyQ/kfMlVAn3u9EXMmJrQDO9aQadl7R0tvEyB
         0B1Ods3vA0Unz87NMP/uHC5RrR/xrH24RIG9vU/LoBAsoq+UE+8biowkTdq4diUh4ERK
         IA60IoH0ygy+TbCFHbdtgo+jCpF5iwYrD15Ogpob+bLJ9vVviQ+bintZvbhrQNrGmm6w
         xpZA==
X-Forwarded-Encrypted: i=1; AJvYcCWNB1Zp9MRBf3VCfM9ZMkjfaPLr1SivThO4xxTnJ09qaq7UZo3HNE1T/34jNPotSXQ5H7BEt576swv3/95v@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqc03WbL1fcBFzp6SwiRsmEiDNe/iMyzMt9FsYUPz7ttEGRKw/
	lJIhBBkQR7a+hIe+mxyTB093zV8X62DW/4jiEbfFqB1WWeklM03Wf9XozcaEe9c=
X-Gm-Gg: ASbGncspkPL0CssqQF1fjGywOAcxzt8v71lauSoa6EegaBJaz+ITvISDKioGUfH+LN4
	xo4hjNFjLEz/3Ek6tQykEBClPhQ/VL9yBTby+9cdQLrJaCTl8yeKfAAHVYmIyHO6r1LS46ZO+vr
	iJkE9NoYF/JCLiohNyQJqmQMIoENealpnv7B9WI1nnWC7snUkOyI8ITu8PqBkS/bdmDK0lD2Q5Q
	STfGixBb+qVjBPROvCZZa+L91vaSWwoRd7YQCKZIuDBvMZs0UFaiZ9tEyiXv4aq2QJZ2IhXdzL2
	7WVMgGKil9TnlTytXFSfLU+7o7bFZJTugdAQaZvbKbfMbL622sXEq0zJa+VAcw==
X-Google-Smtp-Source: AGHT+IELPNVARSPPy9VWxcC1mPIuPocRVxRHDPQtOXcwVJLTnqF0Y7JWN34ll3uKvovEm327XMwanQ==
X-Received: by 2002:a05:6000:2502:b0:3a0:b941:dc24 with SMTP id ffacd0b85a97d-3a1f6429658mr3094134f8f.11.1746805102066;
        Fri, 09 May 2025 08:38:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebe4fsm3663912f8f.39.2025.05.09.08.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:38:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
References: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
Subject: Re: [PATCH v2 0/4] Board support for Fernsehfee 3.0
Message-Id: <174680510148.3108291.15356174367489186455.b4-ty@linaro.org>
Date: Fri, 09 May 2025 17:38:21 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_083823_835916_665773DE 
X-CRM114-Status: GOOD (  11.47  )
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

SGksCgpPbiBNb24sIDI4IEFwciAyMDI1IDEyOjQ0OjI3ICswMjAwLCBKLiBOZXVzY2jDpGZlciB3
cm90ZToKPiBGZXJuc2VoZmVlWzFdICgiVFYgZmFpcnkiKSBpcyBhIGZhbWlseSBvZiBzZXQtdG9w
IGJveGVzIG1hcmtldGVkIGFzCj4gYWQtYmxvY2tpbmcgYXBwbGlhbmNlcy4gVGhpcyBwYXRjaHNl
dCBhZGRzIGJvYXJkIHN1cHBvcnQgaW4gdGhlIGZvcm0gb2YKPiBhIGRldmljZSB0cmVlIGZvciB0
aGUgdGhpcmQgZ2VuZXJhdGlvbiwgRmVybnNlaGZlZSAzLjAuCj4gCj4gWzFdOiBodHRwczovL2Zl
cm5zZWhmZWUuZGUvIChHZXJtYW4pLCBodHRwczovL3d3dy50ZWxlZmFpcnkuY29tLyAoRW5nbGlz
aCkKPiAKPiAKPiBbLi4uXQoKVGhhbmtzLCBBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FtbG9naWMvbGludXguZ2l0ICh2Ni4xNi9hcm0t
ZHQpCgpbMS80XSBkdC1iaW5kaW5nczogdmVuZG9yLXByZWZpeGVzOiBBZGQgVEMgVW50ZXJoYWx0
dW5nc2VsZWt0cm9uaWsgQUcKICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9hbWxvZ2ljL2Mv
NDBmOTgzYWEyZDgwOWI0OTM0YTI2MGM3NmI4MmU5ZmYxOWMwOWE4OApbMi80XSBkdC1iaW5kaW5n
czogYXJtOiBhbWxvZ2ljOiBBZGQgVENVIEZlcm5zZWhmZWUgMy4wIGJvYXJkCiAgICAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvYW1sb2dpYy9jL2ViN2FmMTI2OGUwMDQyZTgzNjA3OTE4MjI5Y2Q2
MmMzNjY5Y2RjYjgKWzMvNF0gQVJNOiBkdHM6IGFtbG9naWM6IEFkZCBUQ1UgRmVybnNlaGZlZSAz
LjAKICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9hbWxvZ2ljL2MvZGFjOTI4NzU3OTI4YThl
YTA2ZWFmNTY5NGQ1ZGVhZTUzYTIxNjE2ZgpbNC80XSBBUk06IGR0czogYW1sb2dpYzogbWVzb244
LWZlcm5zZWhmZWUzOiBEZXNjcmliZSByZWd1bGF0b3JzCiAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvYW1sb2dpYy9jLzJjMTg3OWE0NDAzMTVlMGIyOTJiYmZmMGZhNjNhNzNiZDhhNTJlMzQK
ClRoZXNlIGNoYW5nZXMgaGFzIGJlZW4gYXBwbGllZCBvbiB0aGUgaW50ZXJtZWRpYXRlIGdpdCB0
cmVlIFsxXS4KClRoZSB2Ni4xNi9hcm0tZHQgYnJhbmNoIHdpbGwgdGhlbiBiZSBzZW50IHZpYSBh
IGZvcm1hbCBQdWxsIFJlcXVlc3QgdG8gdGhlIExpbnV4IFNvQyBtYWludGFpbmVycwpmb3IgaW5j
bHVzaW9uIGluIHRoZWlyIGludGVybWVkaWF0ZSBnaXQgYnJhbmNoZXMgaW4gb3JkZXIgdG8gYmUg
c2VudCB0byBMaW51cyBkdXJpbmcKdGhlIG5leHQgbWVyZ2Ugd2luZG93LCBvciBzb29uZXIgaWYg
aXQncyBhIHNldCBvZiBmaXhlcy4KCkluIHRoZSBjYXNlcyBvZiBmaXhlcywgdGhvc2Ugd2lsbCBi
ZSBtZXJnZWQgaW4gdGhlIGN1cnJlbnQgcmVsZWFzZSBjYW5kaWRhdGUKa2VybmVsIGFuZCBhcyBz
b29uIHRoZXkgYXBwZWFyIG9uIHRoZSBMaW51eCBtYXN0ZXIgYnJhbmNoIHRoZXkgd2lsbCBiZQpi
YWNrcG9ydGVkIHRvIHRoZSBwcmV2aW91cyBTdGFibGUgYW5kIExvbmctU3RhYmxlIGtlcm5lbHMg
WzJdLgoKVGhlIGludGVybWVkaWF0ZSBnaXQgYnJhbmNoZXMgYXJlIG1lcmdlZCBkYWlseSBpbiB0
aGUgbGludXgtbmV4dCB0cmVlIFszXSwKcGVvcGxlIGFyZSBlbmNvdXJhZ2VkIHRlc3RpbmcgdGhl
c2UgcHJlLXJlbGVhc2Uga2VybmVscyBhbmQgcmVwb3J0IGlzc3VlcyBvbiB0aGUKcmVsZXZhbnQg
bWFpbGluZy1saXN0cy4KCklmIHByb2JsZW1zIGFyZSBkaXNjb3ZlcmVkIG9uIHRob3NlIGNoYW5n
ZXMsIHBsZWFzZSBzdWJtaXQgYSBzaWduZWQtb2ZmLWJ5IHJldmVydApwYXRjaCBmb2xsb3dlZCBi
eSBhIGNvcnJlY3RpdmUgY2hhbmdlc2V0LgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L2FtbG9naWMvbGludXguZ2l0ClsyXSBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0ClszXSBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4
LW5leHQuZ2l0CgotLSAKTmVpbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
