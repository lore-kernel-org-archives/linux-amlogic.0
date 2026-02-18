Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAB2E9A02C
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Feb 2026 18:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1xfYWdh62TFeWeQC/I+xvOK/MFMOe71lqNun3i1TIE=; b=b7gHDd8hIhtieG
	Zq3Xxg7GuTgkl/v5CPyb5n9iriE0VZHG8nEh6PmfQZCmICNUESeOJ9tsNAPbRpUlYZUvG+iJ1GBIX
	NYy01NQeusxFdQO6W1oOpDqlpKFxfGkueLqswkPtxt2rIUBeqe5p2GG1/abYBA+Aps03vxccSz6PI
	YV/b6Sr/7Q8Q9VvYQZU5AfOQ4BCV5LQhxQRZWv4YWsC+VEVDY2Q19z4UV9XkcuWCBZs3k0j577FWn
	Q4E+nHqOLnDu/GIm7xcUGBCl4s1zjQt/ANY/eSV8MpzN063w3NnjWht+5xi287cYgJz94OoiSZPHV
	m7n74u92BaTu+XYvj+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsm38-0000000ADRL-1g59;
	Wed, 18 Feb 2026 18:13:22 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsm35-0000000ADQx-3Ruc
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Feb 2026 18:13:21 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-481188b7760so1296215e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Feb 2026 10:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771438398; x=1772043198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIekHAkyURnbY7ZGcdPvi5VEj7cPbPYtWFDuUCFEzTw=;
        b=xIrt9TcB8cMhphMg9zN6jeAm2Ah3oZWIfltgBKy6OWetdH6yKnmsD/owSFbjfSPMcJ
         kW/PomoVY1mOcE6t49SuPXWtvKenF/OPnHN4kVFQiRA74riu6Lk2BN9chSi+Zesv/q0w
         hlU2d/j/2MRyvmz43tl9MXRViaJ04ndXKTYf0XPsWRojew9OmmPcLJHGnCQ+h8W9ld36
         9dvZHHZKMHEqS6j2NJ6z1MZ/fHmInabe9Qq95PCMzJYv+xy4AE5imH5x+DqNiga9wiy2
         65VuV6pCh5E32f2UPK2Dqj60sUydaPZ5HJvDQKN+tegNbkagbSa5fGDn1N8/OvDWmxmN
         g/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771438398; x=1772043198;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vIekHAkyURnbY7ZGcdPvi5VEj7cPbPYtWFDuUCFEzTw=;
        b=OXAYn49ZoWl0uK2zGrN3ZWo03VjpuiGuHBBsCmF6r4Y/Vs2BeXt3tVEIKHbPVWXDPS
         lujUnrjFtBgMxXAP7pTxp5nQoCZ+ZZkinkYHNctr8aPsW9eIXfhEEFZNO2Lb7o6SwcKe
         TPsAAum5JFLnn6hzgjU0KlBYtWpYS+HJrzetzsVA0dH9q3ed46ywprNS1LqoSTNqSmKM
         Oh/brYYf+arHtyIAp1jXYtCT3zF+UD9CZ5Ley7fNUisD97ob9be5GJRsEjBM6NhPwU7U
         npva+S0k55hnRYK/3SMsUy77JeHxKv/QdqNncXqkoJU4didKyQ/Ley5rp5a7AiAm7dIS
         DTng==
X-Gm-Message-State: AOJu0Yx3CjQ9r1wlg0FjYZmfPUzb6yEO/5ZAxQ7xDnC1wv1R6Tvut1On
	lP8oN7gn26QTQIileVxPP5A0ui4mnjXvYC40zenOnfNPD/vglJ9foqgIlUmrt/2/gGQ=
X-Gm-Gg: AZuq6aKvJh609v47w6cXHWyE3qrYC3CNUBtQXic054GXfpvuGG+WfPIS8NRFNQp7Pyg
	04aEQZZ43mNvTwLNTmGc06ZhzWlC/gsMAuOO9n06inZLNHo7eUGjNb++3SnoYZMH62WPq7uyLxg
	VpIu1foqrS6IQ7Y6PXzI9j5C4tB6R3qi1YWf4HZFZXoTkXq5K2/52Hdcn8YujR5KGW4iUo8m//P
	MK7teXfcEUrAdNf6B1Mlm79CfePrgr6dulD0hRZZE3Dq7zTU/GPw832R9XHW7npCRvWwBcctqO6
	4mqm5C5w6SKEr8tS2tL4sRVvAkZIAKw+8e44ya/o53HX6Kee8Yev2e/nJWvhEFJMJ2TYHxpqtES
	3sRk3Lwtc5Lm6/BDEJ7F5F36aLXjYprtvwYW0zAOwnKpkAcC3a7le1zZ1Ysxthp25ieS5nucHxO
	4yuAYpi7AEm3iM3IdF9WM2wQ==
X-Received: by 2002:a05:600c:6215:b0:480:6852:8d94 with SMTP id 5b1f17b1804b1-48398ae8e6cmr48823635e9.27.1771438397601;
        Wed, 18 Feb 2026 10:13:17 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:cf71:8cf8:56bb:5790])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4837b68e5adsm416187875e9.9.2026.02.18.10.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:13:17 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Jian Hu <jian.hu@amlogic.com>,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: clk: meson: Add Amlogic T7 fix pll
 support
In-Reply-To: <20260218105709.36253-1-linux-kernel-dev@aliel.fr> (Ronald
	Claveau's message of "Wed, 18 Feb 2026 11:57:07 +0100")
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
	<20260218105709.36253-1-linux-kernel-dev@aliel.fr>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 18 Feb 2026 19:13:15 +0100
Message-ID: <1jpl616htw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_101319_879896_25A18A28 
X-CRM114-Status: GOOD (  13.21  )
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

T24gbWVyLiAxOCBmw6l2ci4gMjAyNiBhdCAxMTo1NywgUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtl
cm5lbC1kZXZAYWxpZWwuZnI+IHdyb3RlOgoKPiBBZGQgUExMIGZvciB0aGUgY2xvY2sgY29udHJv
bGxlciBvZiB0aGUgQW1sb2dpYyBUNyBTb0MgZmFtaWx5LgoKQXNzdW1pbmcgdGhlIDMgZmlyc3Qg
cGF0Y2ggYXJlIGFjdHVhbGx5IG5lZWRlZCAoSSBkb24ndCB0aGluayB0aGV5IGFyZSkKSSB0aGlu
ayBwYXRjaCAyIGFuZCAzIHNob3VsZCBiZSBzcXVhc2hlZCB0b2dldGhlcgoKPgo+IFNpZ25lZC1v
ZmYtYnk6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgo+IC0tLQo+
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHQ3LXBsbC1jbGtjLnlhbWwg
ICAgICAgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvY2xvY2svYW1sb2dpYyx0Ny1wbGwtY2xrYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsdDctcGxsLWNsa2MueWFtbAo+IGluZGV4IDQ5YzYx
ZjY1ZGVmZi4uNmExNTk4ZTZjMzU5IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHQ3LXBsbC1jbGtjLnlhbWwKPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svYW1sb2dpYyx0Ny1wbGwtY2xrYy55
YW1sCj4gQEAgLTIzLDYgKzIzLDcgQEAgcHJvcGVydGllczoKPiAgICAgICAgLSBhbWxvZ2ljLHQ3
LW1wbGwKPiAgICAgICAgLSBhbWxvZ2ljLHQ3LWhkbWktcGxsCj4gICAgICAgIC0gYW1sb2dpYyx0
Ny1tY2xrLXBsbAo+ICsgICAgICAtIGFtbG9naWMsdDctZnBsbAo+ICAKPiAgICByZWc6Cj4gICAg
ICBtYXhJdGVtczogMQo+IEBAIC00Miw2ICs0Myw3IEBAIHByb3BlcnRpZXM6Cj4gICAgICAgIC0g
Y29uc3Q6IGluMAo+ICAgICAgICAtIGNvbnN0OiBpbjEKPiAgICAgICAgLSBjb25zdDogaW4yCj4g
KyAgICAgIC0gY29uc3Q6IHh0YWwKCkZpc2h5LiBNYXliZSBpdCB3aWxsIGdldCBtb3JlIGNsZWFy
IHdpdGggYSBtb3JlIGRldGFpbGVkIGNvbW1pdCBkZXNjcmlwdGlvbgoKPiAgICAgIG1pbkl0ZW1z
OiAxCj4gIAo+ICByZXF1aXJlZDoKPiBAQCAtNzIsMTEgKzc0LDEyIEBAIGFsbE9mOgo+ICAgICAg
ICAgICAgY29udGFpbnM6Cj4gICAgICAgICAgICAgIGVudW06Cj4gICAgICAgICAgICAgICAgLSBh
bWxvZ2ljLHQ3LWdwMC1wbGwKPiAtICAgICAgICAgICAgICAtIGFtbG9naWMsdDctZ3AxLS1wbGwK
PiArICAgICAgICAgICAgICAtIGFtbG9naWMsdDctZ3AxLXBsbAoKSW5kZWVkIHRoYXQncyBub3Qg
Z29vZCAhIGJ1dCB5b3UgbmVlZCBzcGVjaWZpYyBwYXRjaCBmb3IgdGhpcywgYW5kIEZpeGVzCnRh
Zy4gWW91IGNhbiBzZW5kIHRoaXMgc2VwYXJhdGVseS4KCj4gICAgICAgICAgICAgICAgLSBhbWxv
Z2ljLHQ3LWhpZmktcGxsCj4gICAgICAgICAgICAgICAgLSBhbWxvZ2ljLHQ3LXBjaWUtcGxsCj4g
ICAgICAgICAgICAgICAgLSBhbWxvZ2ljLHQ3LW1wbGwKPiAgICAgICAgICAgICAgICAtIGFtbG9n
aWMsdDctaGRtaS1wbGwKPiArICAgICAgICAgICAgICAtIGFtbG9naWMsdDctZnBsbAo+ICAKPiAg
ICAgIHRoZW46Cj4gICAgICAgIHByb3BlcnRpZXM6CgotLSAKSmVyb21lCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
