Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B10CC282D9
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Mar 2025 18:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HZ9E/tYiSXFAfGwVx4cfk5cQiNGThrehz3hqLTFApNA=; b=BR09K8ouDMIIeu
	IJFBh4rQsDk9QmdLBIhYb9ZTbmJOFu+zFj3lJpeNttm2TfIkG2PXnmrf3YVcwmJdbvimSYH8+1fsz
	RVXtQO8UX8jIHt1LbMz9PO5ytuvjQ7ZMR+DaU9ZL3GVOnqbOmiBDt6+Lc/Y2Nu/GTDVLL+zsK2WEb
	TTT9l3ivKEzoA1+PGg+G6AwxixmHZSszh8JwKSDC6M5OpddMRqgnT+Aw/XREAY2IZPaGu0Cp8gPSo
	tfx/DueW8J0FR263UTSclQss5vaVx5n3lfwHXktQijljJImDE+p72CZQjg2SgHaobs+kmQyy2QJ5L
	CZeYaYPubhuJ2AeJfsFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXAI-00000005scU-3dIh;
	Tue, 04 Mar 2025 18:38:50 +0000
Received: from mail-ej1-f48.google.com ([209.85.218.48])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi9-00000005YCz-1JqO
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:42 +0000
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abf5f4e82caso565060666b.1
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Mar 2025 09:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107939; x=1741712739; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=;
        b=TxTakxzn4+ieuy3yrgAQY02mLpP6hHO5wb62C9klvyRR4MiONcN0W5txAb4R3LIU1S
         smWOhA3tBWoBpXxJ5zQQ06VlBa/wrzozOCWvhKzViJ3IDSFtYOxv18jBLdbNKZTEH4Eo
         e6HZm+IEjG3NBiILbhr6QfifJwl5DiO58fjW8Gea5dzIqYekFzSy1Zx+Z7qtcrmueyH4
         ourVym4BgHjte6mvd/lYilGzV2LuoXLVhq379lxgm9/eKBKU2iss+0sbpRe7FOerZUze
         eG9qVF0acWqgvxM/7Uph2lmwyKqGsny7043/ZdodY4vXJccGMnkPGN7tPvDNo2fdDUQh
         DDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107939; x=1741712739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=;
        b=MFhwDHu/tMcFlsK2Luqx8pzNrcxetrqk++q+2afbjTz+lpukamC/hqwsXI3TOVvAKJ
         9vzCnztRvJNqhFG+CoZMdJGtotShkFqUwc62gajHa4If1JWZ4h7jUEw9T+XkbmlMAhME
         aZqxcAoHZh6cHausv5xQEwawA0Rou2LLW4F5rxcuAY8VWFK7/52ZUMfGL8XGRc3Md9Ap
         HGZDDG41urc3jj2ma+tXRwEun3k+lEkMaOc5rFwPA3hLngkpfLSndDOpvexPVhrRNP3+
         qC51liM/DdCRcj86ljbflk0X0JMKx8s2uSgZjPj38j2cAEhSRbl3wdRY7CU1P6AU7/sf
         MKaA==
X-Forwarded-Encrypted: i=1; AJvYcCX9hn4lAR4SBgsgOIC1oR+chs/o/ii50sUe66Q+aYGXRGb4LTnF+79HPZcJ8xGHAwf86VHb7nrkXOP3QhzH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8k4AR+vfGpAaIPIM1pfd2m5o+8ZRWRKk2Aq+tvbhdZPrIKgDo
	5Sw6ICXbbgqXpdoOKBOcxGvCcp/KFYq48wam5wOkbUJRAh3BEY5wlft6pkbqvTc=
X-Gm-Gg: ASbGncuy08LsNJql3v68buwBu7ZgRVXMN0FltCTYv0PLziT+FdgF4u414MNGARRcwvP
	DIA2c4c4csYBAukpsedH+6ksRMokitUNFuVwNCAcXyg0usco6DITK4iNx8Ayy9S0RtW2O9qcyzS
	HclgmADH3aIJZwYrA4ZXscotg/y8Ii4msTkJQjrx2QJLyjSO6mmvytaLUlg16TabMJoR+17kiV4
	dTwSFSfY01XHHu1KJ0pGzxe4yQ3MTli8F86pHEX2URMIg/wX4KB1TqQ0HXWEWOsoIsr27AOXnkp
	dy3Af3r55Z8N2LdKSqJb6mR7KcuCsyfF/6BF2/eAFGnosiNrqcsGD+kZrx71/0aaInBksX9XZK8
	VN4miZYr1Ea4zPFBbaX0PbezhYwwr
X-Google-Smtp-Source: AGHT+IEZqUVJFopMcdCw0Fa6138jis8STGfKBc9DN3g8sZLmJaNDRTq42x6nu+WBoJl/BXVMQfaxGw==
X-Received: by 2002:a17:907:97d5:b0:aba:246b:3954 with SMTP id a640c23a62f3a-abf268263f9mr1810089466b.47.1741107939344;
        Tue, 04 Mar 2025 09:05:39 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:38 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:40 +0000
Subject: [PATCH v2 12/16] rtc: s35390a: drop needless struct s35390a::rtc
 member
MIME-Version: 1.0
Message-Id: <20250304-rtc-cleanups-v2-12-d4689a71668c@linaro.org>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_090541_353697_49481923 
X-CRM114-Status: GOOD (  14.97  )
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

VGhlIG1lbW9yeSBwb2ludGVkIHRvIGJ5IHRoZSA6OnJ0YyBtZW1iZXIgaXMgbWFuYWdlZCB2aWEg
ZGV2cmVzLCBhbmQKbm8gY29kZSBpbiB0aGlzIGRyaXZlciB1c2VzIGl0IHBhc3QgX3Byb2JlKCku
CgpXZSBjYW4gZHJvcCBpdCBmcm9tIHRoZSBzdHJ1Y3R1cmUgYW5kIGp1c3QgdXNlIGEgbG9jYWwg
dGVtcG9yYXJ5CnZhcmlhYmxlLCByZWR1Y2luZyBydW50aW1lIG1lbW9yeSBjb25zdW1wdGlvbiBi
eSBhIGZldyBieXRlcy4KClNpZ25lZC1vZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxhbmRyZS5kcmFz
emlrQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ydGMvcnRjLXMzNTM5MGEuYyB8IDIyICsrKysr
KysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtczM1MzkwYS5jIGIvZHJp
dmVycy9ydGMvcnRjLXMzNTM5MGEuYwppbmRleCBlM2RjMTg4ODJmNDE0NDVjNDFmYmVhNTZlZGJk
NWM4Njk1MTQ4ODBjLi4zNDA4ZDJhYjI3NDE5NGUzOWNkZTM4YTgzNTY3ZDM3YmQ1M2Y2NjMyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3J0Yy9ydGMtczM1MzkwYS5jCisrKyBiL2RyaXZlcnMvcnRjL3J0
Yy1zMzUzOTBhLmMKQEAgLTYzLDcgKzYzLDYgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgczM1
MzkwYV9vZl9tYXRjaCk7CiAKIHN0cnVjdCBzMzUzOTBhIHsKIAlzdHJ1Y3QgaTJjX2NsaWVudCAq
Y2xpZW50WzhdOwotCXN0cnVjdCBydGNfZGV2aWNlICpydGM7CiAJaW50IHR3ZW50eWZvdXJob3Vy
OwogfTsKIApAQCAtNDIyLDYgKzQyMSw3IEBAIHN0YXRpYyBpbnQgczM1MzkwYV9wcm9iZShzdHJ1
Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogCWludCBlcnIsIGVycl9yZWFkOwogCXVuc2lnbmVkIGlu
dCBpOwogCXN0cnVjdCBzMzUzOTBhICpzMzUzOTBhOworCXN0cnVjdCBydGNfZGV2aWNlICpydGM7
CiAJY2hhciBidWYsIHN0YXR1czE7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gJmNsaWVudC0+ZGV2
OwogCkBAIC00NDcsOSArNDQ3LDkgQEAgc3RhdGljIGludCBzMzUzOTBhX3Byb2JlKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQpCiAJCX0KIAl9CiAKLQlzMzUzOTBhLT5ydGMgPSBkZXZtX3J0Y19h
bGxvY2F0ZV9kZXZpY2UoZGV2KTsKLQlpZiAoSVNfRVJSKHMzNTM5MGEtPnJ0YykpCi0JCXJldHVy
biBQVFJfRVJSKHMzNTM5MGEtPnJ0Yyk7CisJcnRjID0gZGV2bV9ydGNfYWxsb2NhdGVfZGV2aWNl
KGRldik7CisJaWYgKElTX0VSUihydGMpKQorCQlyZXR1cm4gUFRSX0VSUihydGMpOwogCiAJZXJy
X3JlYWQgPSBzMzUzOTBhX3JlYWRfc3RhdHVzKHMzNTM5MGEsICZzdGF0dXMxKTsKIAlpZiAoZXJy
X3JlYWQgPCAwKSB7CkBAIC00ODAsMTcgKzQ4MCwxNyBAQCBzdGF0aWMgaW50IHMzNTM5MGFfcHJv
YmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKIAogCWRldmljZV9zZXRfd2FrZXVwX2NhcGFi
bGUoZGV2LCAxKTsKIAotCXMzNTM5MGEtPnJ0Yy0+b3BzID0gJnMzNTM5MGFfcnRjX29wczsKLQlz
MzUzOTBhLT5ydGMtPnJhbmdlX21pbiA9IFJUQ19USU1FU1RBTVBfQkVHSU5fMjAwMDsKLQlzMzUz
OTBhLT5ydGMtPnJhbmdlX21heCA9IFJUQ19USU1FU1RBTVBfRU5EXzIwOTk7CisJcnRjLT5vcHMg
PSAmczM1MzkwYV9ydGNfb3BzOworCXJ0Yy0+cmFuZ2VfbWluID0gUlRDX1RJTUVTVEFNUF9CRUdJ
Tl8yMDAwOworCXJ0Yy0+cmFuZ2VfbWF4ID0gUlRDX1RJTUVTVEFNUF9FTkRfMjA5OTsKIAotCXNl
dF9iaXQoUlRDX0ZFQVRVUkVfQUxBUk1fUkVTX01JTlVURSwgczM1MzkwYS0+cnRjLT5mZWF0dXJl
cyk7Ci0JY2xlYXJfYml0KFJUQ19GRUFUVVJFX1VQREFURV9JTlRFUlJVUFQsIHMzNTM5MGEtPnJ0
Yy0+ZmVhdHVyZXMgKTsKKwlzZXRfYml0KFJUQ19GRUFUVVJFX0FMQVJNX1JFU19NSU5VVEUsIHJ0
Yy0+ZmVhdHVyZXMpOworCWNsZWFyX2JpdChSVENfRkVBVFVSRV9VUERBVEVfSU5URVJSVVBULCBy
dGMtPmZlYXR1cmVzKTsKIAogCWlmIChzdGF0dXMxICYgUzM1MzkwQV9GTEFHX0lOVDIpCi0JCXJ0
Y191cGRhdGVfaXJxKHMzNTM5MGEtPnJ0YywgMSwgUlRDX0FGKTsKKwkJcnRjX3VwZGF0ZV9pcnEo
cnRjLCAxLCBSVENfQUYpOwogCi0JcmV0dXJuIGRldm1fcnRjX3JlZ2lzdGVyX2RldmljZShzMzUz
OTBhLT5ydGMpOworCXJldHVybiBkZXZtX3J0Y19yZWdpc3Rlcl9kZXZpY2UocnRjKTsKIH0KIAog
c3RhdGljIHN0cnVjdCBpMmNfZHJpdmVyIHMzNTM5MGFfZHJpdmVyID0gewoKLS0gCjIuNDguMS43
MTEuZzJmZWFiYWIyNWEtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
