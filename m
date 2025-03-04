Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3587EC021B8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Mar 2025 20:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6NH3s0bMi+VW7OPmeFb6QrUEAr0QrSiHcu5EZVsfw6k=; b=klNA8DR04V03s8
	2AlelzMXnZfoRt6O/dmUBu/JK+beExghRLKvEb8xJKGTEQe17ukXVD9tnf4P5Gej57RPE64K9Jrkk
	QLPIwVJGJ8vw7dhLO2S+QgF6k+LCgmtQMbthMBeXLAAVsUBd078UbU9F5ABbVrtw0gc49IvJDO62J
	/gAcAJRnzSuuldbxdS01rMFqAuSi4bgHUX6LjhIg9B4x5Q75kZUIID1X3TWcdfgCOyN9phnBr5tn8
	pu2oU+8Mp9caRucRlMASrR8yLG9KY2o/cSzKRImmDmDEzHC2lgkFSzeGhNes21X1b+gG5ct9RJz8X
	ip/1pWbj0m2nHZwDEWBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZ8B-00000006DQp-416w;
	Tue, 04 Mar 2025 20:44:47 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi1-00000005Y8W-3Huv
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:35 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5e4ce6e3b8cso2554583a12.1
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Mar 2025 09:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107931; x=1741712731; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VwGP1hOkgqyt7cuslt+mBb5Pi8swKaj/YmncchBevCs=;
        b=vHcbuQ1/KUWTMUj21D6/VxZhrO+gmlL4Gt2cqNXsHkE54CQ+eh1aDqmpKgonYvYQwQ
         1RDPsS44XVvMpP4KjstNJVn/SYJyYuCZ+xa7XDJn1YcJWWnfeXDjOGWVa+zzzhJYv5Py
         GOiwvMc3wRtlppzE8HU+Hl3JdhfBfTKL6UdifQPimyh1bS3yfOFkIwnc47KNcI05vfoe
         qRx52PPhJ9CdFUPrEn82QHvf3j5iSKnopz1ZKVh8cbdvYdT7as5DkmqXTVNhtN9/SzLC
         04uqKxztNPg4hfXIfTt74/7qkCt0vPoYc8dZmlTzrbZqlZ+gJuxh8aXwUls7V0i/GhGQ
         laIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107931; x=1741712731;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwGP1hOkgqyt7cuslt+mBb5Pi8swKaj/YmncchBevCs=;
        b=ZtdV80JYcrwTiQGw+yIwAL7vtnkbWZu/LW7LhhC1+1B6LX1j02EYoKiJ64tMXeXvds
         57Lw9mujf6VAi02V/E7zJcU2NBXTs9t7boyWcfLkCLNwIecN0atkX+C8fgWeafSTeO/g
         2XbQpxS1mqBXAbLE5LgOd0JTkkFZPkVrEmoezzcfOZGQIudQMIl7Rm2w7qB8vALAyYSY
         X8Unt0S9vqEL48d/eYoY2L0nGqcZRZvjMpIbGR1xgeyTxf3o9tJUark9ordqLKHIdcrC
         HsIHFeVP1TvZCzfwpGK+q63OkP8zDefjER+72tmuUL0KusngfYN47eyWRfLO2jNhkWjV
         wfmA==
X-Forwarded-Encrypted: i=1; AJvYcCX3/lOICjNH6v1mb2p0XZa5gQZhf/yVw6N3KTaDUuUnEHU3IpnDe/9kVkG2OFGV1OWN+vG0glLVQ6sAJq8D@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2KdM+O8WMmp0Wcdstl1S0UDENoqjPsQCt79PZtacC0Qfe+Tg4
	SQZfUmtS8NTLlTqZvAGGwVC/CkXOrurDtf4ltpZJ4U/7yNMRO79PhRaAgiWxLxk=
X-Gm-Gg: ASbGnct7rrBgQB8eUBFpxE/6x6+Lp0q+K8zdTv0pAS/rpcrls+GNPSm0n2L/1DGqcG3
	kD0b5Cwr8B5xqv4UoV+cCzTBPPg9KvHC9QuRscdaTZL1L7FngJjKG3koUivtEjjdNgMAzoLyoLz
	4sH6bJvHaXCgB305K5+9QeQM+oZ7LTvrIjMfvPD2Dr4O3U8HJjvfR3Xg5imqyX5JBDJIuBMI26D
	IZp2WkR+D2PVGSVEAwuvXmYmGHT01a5ahD7gG1A+eT2Ecw8Clg4yU77306VYhi8wlHmq+L8334l
	4dzTyah9b1xWsd44Lvd5SdoOytHB0efzwSG+9Vee3sA0gK9OtRB6cX+ivXKwBKeC2/wvMabvPlY
	xza6O6T48XyIHa/pSt0g2fEmEy2eH
X-Google-Smtp-Source: AGHT+IG1qDKc0hst2zevKKhfPXC0MrEb14O70/5mMsp5hFfaUprLxoI4xNFXRR1d5hlR/z34qhDcpw==
X-Received: by 2002:a17:907:da0:b0:abf:23a7:fc6 with SMTP id a640c23a62f3a-ac1f1185263mr365511466b.16.1741107931351;
        Tue, 04 Mar 2025 09:05:31 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:30 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 00/16] a few rtc driver cleanups
Date: Tue, 04 Mar 2025 17:05:28 +0000
Message-Id: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANgyx2cC/3XMQQrCMBCF4auUWRtJxhSDK+9Rukjj2A6UpExqU
 Urubuze5f/gfTtkEqYMt2YHoY0zp1gDTw2EyceRFD9qA2psNaJTsgYVZvLxtWRlMOihNXghb6F
 eFqEnvw+u62tPnNckn0PfzG/9A21GaTVYGyjoq7PO3GeOXtI5yQh9KeULAj75TakAAAA=
X-Change-ID: 20250228-rtc-cleanups-12c0b5123ea4
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_090533_834090_384FEF75 
X-CRM114-Status: UNSURE (   8.57  )
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

SGksCgpXaGlsZSBsb29raW5nIGF0IFJUQywgSSBub3RpY2VkIHRoYXQgdmFyaW91cyBkcml2ZXJz
IGFyZSBrZWVwaW5nCnBvaW50ZXJzIHRvIGRhdGEgdGhhdCB0aGV5J3JlIG5vdCB1c2luZyB0aGVt
c2VsdmVzIHRocm91Z2hvdXQgdGhlaXIKbGlmZXRpbWUuCgpTbyBJIHRvb2sgdGhlIGxpYmVydHkg
dG8gZHJvcCB0aGVzZSBwb2ludGVycyBhbmQgdGhpcyBzZXJpZXMgaXMgdGhlCnJlc3VsdC4KClRo
ZSBsYXN0IHR3byBwYXRjaGVzIGFsc28gY29udmVydCB0d28gZHJpdmVycyB0byB1c2luZyBkZXZf
ZXJyX3Byb2JlKCksCmFzIEkgbG9va2VkIHNsaWdodGx5IGNsb3NlciBpbnRvIHRob3NlIHR3by4g
VGhleSBkb24ndCBleGFjdGx5IGZpdCB0aGUKZ2VuZXJhbCBzdWJqZWN0IG9mIHJlbW92YWwgb2Yg
dW5uZWVkZWQgcG9pbnRlcnMsIGJ1dCBJIHdhbnRlZCB0byBzaGFyZQp0aGVtIGFueXdheSwgc2lu
Y2UgdGhleSdyZSByZWFkeS4KCkRyaXZlcnMgb3RoZXIgdGhhbiBzNW0gd2VyZSBjb21waWxlLXRl
c3RlZCBvbmx5LgoKQ2hlZXJzLApBbmRyZScKClNpZ25lZC1vZmYtYnk6IEFuZHLDqSBEcmFzemlr
IDxhbmRyZS5kcmFzemlrQGxpbmFyby5vcmc+Ci0tLQpDaGFuZ2VzIGluIHYyOgotIHM1bTogZml4
IGFyZ3VtZW50cyB0byBkZXZtX2kyY19uZXdfZHVtbXlfZGV2aWNlKCkKLSBtZXJnZSB0d28gcng4
NTgxICYgc2QzMDc4IHBhdGNoZXMgaW50byBvbmUgZWFjaCAoQWxleGFuZHJlKQotIExpbmsgdG8g
djE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTAyMjgtcnRjLWNsZWFudXBzLXYxLTAt
YjQ0Y2VjMDc4NDgxQGxpbmFyby5vcmcKCi0tLQpBbmRyw6kgRHJhc3ppayAoMTYpOgogICAgICBy
dGM6IG1heDc3Njg2OiBkcm9wIG5lZWRsZXNzIHN0cnVjdCBtYXg3NzY4Nl9ydGNfaW5mbzo6cnRj
IG1lbWJlcgogICAgICBydGM6IHM1bTogZHJvcCBuZWVkbGVzcyBzdHJ1Y3QgczVtX3J0Y19pbmZv
OjppMmMgbWVtYmVyCiAgICAgIHJ0YzogYXNwZWVkOiBkcm9wIG5lZWRsZXNzIHN0cnVjdCBhc3Bl
ZWRfcnRjOjpydGNfZGV2IG1lbWJlcgogICAgICBydGM6IGRzMjQwNDogZHJvcCBuZWVkbGVzcyBz
dHJ1Y3QgZHMyNDA0OjpydGMgbWVtYmVyCiAgICAgIHJ0YzogZXA5M3h4OiBkcm9wIG5lZWRsZXNz
IHN0cnVjdCBlcDkzeHhfcnRjOjpydGMgbWVtYmVyCiAgICAgIHJ0YzogZnRydGMwMTA6IGRyb3Ag
bmVlZGxlc3Mgc3RydWN0IGZ0cnRjMDEwX3J0Yzo6cnRjX2RldiBtZW1iZXIKICAgICAgcnRjOiBt
NDh0ODY6IGRyb3AgbmVlZGxlc3Mgc3RydWN0IG00OHQ4Nl9ydGNfaW5mbzo6cnRjIG1lbWJlcgog
ICAgICBydGM6IG1lc29uOiBkcm9wIG5lZWRsZXNzIHN0cnVjdCBtZXNvbl9ydGM6OnJ0YyBtZW1i
ZXIKICAgICAgcnRjOiBtZXNvbi12cnRjOiBkcm9wIG5lZWRsZXNzIHN0cnVjdCBtZXNvbl92cnRj
X2RhdGE6OnJ0YyBtZW1iZXIKICAgICAgcnRjOiBwbDAzMDogZHJvcCBuZWVkbGVzcyBzdHJ1Y3Qg
cGwwMzBfcnRjOjpydGMgbWVtYmVyCiAgICAgIHJ0Yzogcng4NTgxOiBkcm9wIG5lZWRsZXNzIHN0
cnVjdCByeDg1ODEKICAgICAgcnRjOiBzMzUzOTBhOiBkcm9wIG5lZWRsZXNzIHN0cnVjdCBzMzUz
OTBhOjpydGMgbWVtYmVyCiAgICAgIHJ0Yzogc2QyNDA1YWw6IGRyb3AgbmVlZGxlc3Mgc3RydWN0
IHNkMjQwNWFsOjpydGMgbWVtYmVyCiAgICAgIHJ0Yzogc2QzMDc4OiBkcm9wIG5lZWRsZXNzIHN0
cnVjdCBzZDMwNzgKICAgICAgcnRjOiBtYXg3NzY4NjogdXNlIGRldl9lcnJfcHJvYmUoKSB3aGVy
ZSBhcHByb3ByaWF0ZQogICAgICBydGM6IHM1bTogY29udmVydCB0byBkZXZfZXJyX3Byb2JlKCkg
d2hlcmUgYXBwcm9wcmlhdGUKCiBkcml2ZXJzL3J0Yy9ydGMtYXNwZWVkLmMgICAgIHwgMTYgKysr
Ky0tLS0tCiBkcml2ZXJzL3J0Yy9ydGMtZHMyNDA0LmMgICAgIHwgMTQgKysrKy0tLS0KIGRyaXZl
cnMvcnRjL3J0Yy1lcDkzeHguYyAgICAgfCAxNiArKysrLS0tLS0KIGRyaXZlcnMvcnRjL3J0Yy1m
dHJ0YzAxMC5jICAgfCAxNyArKysrKy0tLS0KIGRyaXZlcnMvcnRjL3J0Yy1tNDh0ODYuYyAgICAg
fCAxNCArKysrLS0tLQogZHJpdmVycy9ydGMvcnRjLW1heDc3Njg2LmMgICB8IDM3ICsrKysrKysr
Ky0tLS0tLS0tLS0KIGRyaXZlcnMvcnRjL3J0Yy1tZXNvbi12cnRjLmMgfCAxMiArKystLS0tCiBk
cml2ZXJzL3J0Yy9ydGMtbWVzb24uYyAgICAgIHwgMTYgKysrKy0tLS0tCiBkcml2ZXJzL3J0Yy9y
dGMtcGwwMzAuYyAgICAgIHwgMTQgKysrKy0tLS0KIGRyaXZlcnMvcnRjL3J0Yy1yeDg1ODEuYyAg
ICAgfCA4NSArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJp
dmVycy9ydGMvcnRjLXMzNTM5MGEuYyAgICB8IDIyICsrKysrKy0tLS0tLQogZHJpdmVycy9ydGMv
cnRjLXM1bS5jICAgICAgICB8IDU4ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQogZHJp
dmVycy9ydGMvcnRjLXNkMjQwNWFsLmMgICB8IDE2ICsrKystLS0tLQogZHJpdmVycy9ydGMvcnRj
LXNkMzA3OC5jICAgICB8IDcxICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
MTQgZmlsZXMgY2hhbmdlZCwgMTgzIGluc2VydGlvbnMoKyksIDIyNSBkZWxldGlvbnMoLSkKLS0t
CmJhc2UtY29tbWl0OiAwMjI2ZDBjZTk4YTQ3NzkzN2VkMjk1ZmI3ZGY0Y2MzMGI0NmZjMzA0CmNo
YW5nZS1pZDogMjAyNTAyMjgtcnRjLWNsZWFudXBzLTEyYzBiNTEyM2VhNAoKQmVzdCByZWdhcmRz
LAotLSAKQW5kcsOpIERyYXN6aWsgPGFuZHJlLmRyYXN6aWtAbGluYXJvLm9yZz4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
