Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C026ACEDDA1
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Nov 2025 14:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M1YiYNMRaJmB2Ih9gKlkyCkjJnMI9mYtKPReReDxRGo=; b=fHyZQ8vksZRhu2
	rBsurzYgnPz4GDOwLPwD2BDNooAYy1lCKnpTLNqp6c4wcQyS6f0TnejTNa5G31OCF8B8AwGfUA46X
	2qaM64g6p9S0gds7Xz5gk0tIXZCNBWQvntde9eWIqsvH/6Tyz5baPWbWQopN1oa/oWDizYjQcPaT+
	k5rslgqMyaJCLXQD+DJSoLvR0xcuFkKN59ic4VWQVSbGPwGDKiqi6Kj9IakccnDZqPP1ahkk22OLw
	j7dkhY5IgluNBleLPO01h9iZUG8jikTczOs6t/aIyUrU7ES3BwSnGCYJ+IJ/EZ5akQQ2I30UHvY19
	hLc/LMGL81Hnll6e04OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLN2r-00000000a8L-2xWv;
	Tue, 18 Nov 2025 14:51:01 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLN2p-00000000a75-009a
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Nov 2025 14:51:00 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b735ce67d1dso716880366b.3
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Nov 2025 06:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763477457; x=1764082257; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ODEp5g3hoBFXtgMG8yLHQj2oAfrtxXSdzqfcf/5l9M=;
        b=ndhfh3AWJWDq+lspUr6U9esyr7AdUeKtEwwTegCDyAykktriuWX46N9HnWdy6Xa/Cu
         4j2H+0TxLkoG1pfeBHJMDEy87TDOy6zGGyeR5ZMB6Ilmrr07rlN2tMZPVRzYuKFZ66so
         1kVVX3FM0BYKWAzuG6jHuwz0s2WtR6c3gCXxwixCg6mMR1ZfYdyVfLEwLuRkoiAyeZgh
         0DA6kM650bP+VnxuyYTz1L+MSpNqNj4QaWkVjrjyUjwDUUIodemOnan9kU53cHR2rC+c
         q+DbM+R+y8W5aC9210yPI03jEpq6m/1mUI8AmVyE8t4XamrKwrQALtZUE1Xf4uqtbV2A
         xXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763477457; x=1764082257;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ODEp5g3hoBFXtgMG8yLHQj2oAfrtxXSdzqfcf/5l9M=;
        b=vMAIYIh+WUQewILy6E5dP24Eq6AQctpYaV/B+sm93byhs2/1IbfwHjrC1jQ1Y3RXvd
         ZFSTwZlncyqR8NPZ6kKvN+6JeLwir9th+2C01WNOoJ4UZQK65zx72p2zW2WIHphkNK6z
         999bKpuSR4L/RlozGLgg0PUXwApvdWKzyAtn+HMZfLK9+CpAFmJajYMjpSr2bM0RaODo
         zWDkdjIgo4FCMxTxL8jS3JzfDvh1jY9dLMmdoWAt08m8nSrQO6UVm7LIm0MXc19rvLoj
         V87NW+lTMvrJ3lIHbbCgYa+/vhZeeym/ywxGv3ChE5HYxFOQ8XSEnkB3K0RGvjECbl1q
         4YQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlU6reEZNssm6HG4CUZ5unjmk6zZoWOSuwwoyLbjtiFsmHkSTBDvkX8CeDJQF9MCT1EcP2C4ngCiBYfban@lists.infradead.org
X-Gm-Message-State: AOJu0YwPmF+ggDhgET1BZDFYlHqrX9cFiXNJbYtuUPJgpAgufFKxpzHw
	DtBRhkd6+kKSI4dZ2Nl3ZacN1U4c8bAQCGZ8fcSGKBuMM2qtbg888nc19Yu+Zkic
X-Gm-Gg: ASbGnctUDa14WKvKDe67MwMNAHdYbJZn8bjS2aanonTeXAHvkbumF1vDpm/odJgJ9PU
	km7wxH97rnbBqs+mpjA7AfwINDgLw3XvPvgPf4E7VZsCQOsccek86RyLLY7MOMBbBEUsBUKpiRo
	ZgKrcHxQJacqvZVx5vNiGgPGk8f6UAiISImIJ67rx6nHvRwj7Q+oXAerGqyg9/6lOaKsctr/S1I
	ag0sN1YZKbC5e4EsG5XSEMg71Z5ezopwkvnu19Tjk2M2MRhM8ZrWDMaLIZb2DKy4hyFOIgs4nZ2
	vI7JvgZVv2pBW45HU62cnqJqbrMPIYT5nKxl5euci7+2e8bYaIlMiyqE51K6hyH4HaerdbWUeJy
	YNroYMFbFO8udkXYF34w9aZG7KtBtxPiiyNG+/bpKHeHOqbtOvpNbTRxyE3xBJP1Y0nPloms8E+
	MAeQ1cCgmmfqmVsBaRWvOIgzudePx0v/Mrik/rVs3LLUyaQ+6NEXon5P8GQqztEOIaMlj3LQjGs
	0A=
X-Google-Smtp-Source: AGHT+IEbPgDVza8qfJZo3JEw3mI76xfM7nycUKDaL0NKUdHMgMx7hzlIugTLL9c0WovJWHk2SHXoCA==
X-Received: by 2002:a17:907:5c9:b0:b73:5b9a:47c7 with SMTP id a640c23a62f3a-b736795d4aemr1818872166b.51.1763477456662;
        Tue, 18 Nov 2025 06:50:56 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd809absm1372003166b.44.2025.11.18.06.50.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Nov 2025 06:50:56 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
Date: Tue, 18 Nov 2025 15:50:43 +0100
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
To: ao.xu@amlogic.com
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_065059_047979_9D0C42C5 
X-CRM114-Status: GOOD (  13.12  )
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

QW8sCgpJcyB0aGVyZSBhbnkgY2hhbmNlIHRvIGdldCB0aGlzIHM0IGRybSBoZG1pIHNlcmllcyBm
b3IgY3VycmVudCA2LjE4PwoKKGkgdHJpZWQgYmFja3BvcnQgdGhpcyBzZXJpZXMgdG8gNi4xOCBi
dXQgaGF2ZSBzb21lIGlzc3VlcyB3aXRoIHJlcGFyZW50IHZwdV8wX3NlbCB0byBzeXNjbGtfYl9z
ZWwpCiAgIAoKCj4gV2lhZG9tb8WbxIcgbmFwaXNhbmEgcHJ6ZXogQW8gWHUgdmlhIEI0IFJlbGF5
IDxkZXZudWxsK2FvLnh1LmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHcgZG5pdSAxMCBzdHkgMjAy
NSwgbyBnb2R6LiAwNjozOToKPiAKPiBGcm9tOiBBbyBYdSA8YW8ueHVAYW1sb2dpYy5jb20+Cj4g
Cj4gQWRkIGRldmljZXRyZWUgZG9jdW1lbnQgZm9yIFM0IEhETUkgY29udHJvbGxlcgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFvIFh1IDxhby54dUBhbWxvZ2ljLmNvbT4KPiAtLS0KPiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29uLWR3LWhkbWkueWFt
bCB8IDEgKwo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hbWxvZ2ljLG1lc29u
LWR3LWhkbWkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2FtbG9naWMsbWVzb24tZHctaGRtaS55YW1sCj4gaW5kZXggODRkNjhiOGNmY2NjODZmZDg3YTZh
MGZkMmI3MGFmMTJlNTFlYjhhNC4uNmUwYTgzNjllZWU5MTVmYWI1NWFmMjRkNDUwYTZjNDBlMDhk
ZWYzOCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9hbWxvZ2ljLG1lc29uLWR3LWhkbWkueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2FtbG9naWMsbWVzb24tZHctaGRtaS55YW1sCj4gQEAg
LTU1LDYgKzU1LDcgQEAgcHJvcGVydGllczoKPiAgICAgICAgICAgLSBjb25zdDogYW1sb2dpYyxt
ZXNvbi1neC1kdy1oZG1pCj4gICAgICAgLSBlbnVtOgo+ICAgICAgICAgICAtIGFtbG9naWMsbWVz
b24tZzEyYS1kdy1oZG1pICMgRzEyQSAoUzkwNVgyLCBTOTA1WTIsIFM5MDVEMikKPiArICAgICAg
ICAgIC0gYW1sb2dpYyxtZXNvbi1zNC1kdy1oZG1pICMgUzQgKFM5MDVZNCkKPiAKPiAgIHJlZzoK
PiAgICAgbWF4SXRlbXM6IDEKPiAKPiAtLSAKPiAyLjQzLjAKPiAKPiAKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0Cj4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
