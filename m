Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B5FC021AA
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Feb 2025 20:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1It7nmUkhBGA6XsX1zzNxWLzbX9u49hmgSVSDTz1Q8M=; b=VTxC0pqsJE/obt
	z6RHUeMfuduXoTsbVlhA/Ju6nQb9n6bSwcQYSZgH9bKNhDZ1WkzxCJkyM/9otVt97lMGJzwhQUPag
	T9TYk/g9BANBXkk2mqylo0k62KIvk/gAhbBemzwp4KWv2nSbY8NT4l8yORdcHISvm6IvOe1LHbmj+
	j0y0wHKvz3b4nEHGPR2crkcVMKGyfyxm2K5MOmCSYNilpDkd+XYnjiCKmYAnv25pA/95i1suh6tBW
	ngyV9yAvRUf5DVYWWpPtrkF6cl/2ERE0/Tm/Y2E4ut++UYw43poc6+YiLeq5tNA6FsXfZA1uK9uAR
	fR1Vg2jv55Hvb2OiVDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTwq-00000009i8r-1ZI7;
	Tue, 18 Feb 2025 20:12:04 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTIu-00000009a8k-3Tro
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Feb 2025 19:30:50 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so1288141a12.3
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Feb 2025 11:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907047; x=1740511847; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1Cool/KkGodX8Z3AKXl7cQge0BzoVtk/glY1zU+OpQ=;
        b=bCfADLDlvvrSX5cYYePwcRpaHfUvZldLRp480Re2LfDqedRZ3ksrqE9s7sTe6nKBX9
         kGFcbGzH6qw/7pL4QpfaEu7YolSc5pxMfhCrl2f9Z9HPJcTOYKgo+ICh+zHO0M89ba3T
         Oykrc7upCN9CWBYWsvw9eXWhS/bh6F9vEjU0x6qWLI8UDrsP1h4cf+iH/ZSOXJYJKJ+Q
         LfSUmWPMo26CDxsjJbirBcG2IoSh/8GnU2kkD6qDXVnYkzzDhwTSYy29e8P7DsKOMT0Y
         mc4wDfsgPo04oSS0gLPxLq4g55037uZ5GO+E0Ar1L9i/RJOYnDXeJtLsgzLTuXpKtl1y
         MMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907047; x=1740511847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1Cool/KkGodX8Z3AKXl7cQge0BzoVtk/glY1zU+OpQ=;
        b=MMsnMyHBMCo6GMzLtgyMogmQQUTWNWDnAX+0jEfzplB36UtDvSwd3D+VK36QRiE45l
         Zw+3AMgYjw1Z25B0C6iyL3zm+HXcUVRA8Y5odcaeaRStU5Q16R3nqN6bNFJqgLkarFMs
         t8ARYVgEeRS4vTE7QO2RUbSF0Jha7qWzjOkq+RQ88849ugeGvwBReKHd8uT8ZsYwo0KI
         21iGHrm1eqUHxnHPQU3iugUJm7m7yo6WiUEFtRXgdi0eXwl0Rog5UgDlumclYKv1uNhh
         6JkLLH2Wohq4lNSQoabfr3/er2T1rk0E9tTGWAPkS9JaTGZHK/p5QSi/+ZwGaTrzPy3z
         5MrA==
X-Forwarded-Encrypted: i=1; AJvYcCXe4Db3DK9G5gvuZZbsETXLvzQaRPTZNKOM6rXgPZ1VgoueMFLQfiCCSqs0Mq4EM4ufj0584AiFlEVMkJgH@lists.infradead.org
X-Gm-Message-State: AOJu0YyVPU5ap2aGYvJnNpfCZ5HYGofLyAVbsLx6gjIFQ4c+n/D0Y9Aq
	u9nTaZXEhz3NlJtWCXoipIgIRFHuoEkZ9UmxnyS6U8idb6J9haPZB4HspqjP+Dg=
X-Gm-Gg: ASbGncvY0QQ5VgKdd1azNP5Cxmv0Dx+2ukAQji+FGszLNAxgc1LfvUCSWNdLm1rrebj
	/dkoCt4HEDUUxhWK2W+btfUORFWxNos6aMUu9iow6bLL9gbmwYwsAvtQiOjMQOEzQr6XYtOivU7
	viR7rgwBKIvIA5wsj+RJm4KdzmJKzLA9Ear3vRB+FJl2+6BvMy145qtRRTsrG5vbMib9ZqeXW+5
	aEiAc2r2utFN8MxIzqmMwyO0TwXNnMk1fzRUqFu+BpBWT2wkiwLi0CFwpyi8ruZWXej+BlK08Jq
	xtGyJ+V0lNIjZ8fmdyrPTlRxngCW
X-Google-Smtp-Source: AGHT+IFuCiWjYik1tkYGoQgh4ZsFo8lmztzxBCjOpVHi8VmVD4pqRZa3rFXJofCtONyce7E+IyRCXQ==
X-Received: by 2002:a05:6402:4609:b0:5de:525c:53cb with SMTP id 4fb4d7f45d1cf-5e036043d74mr14749201a12.6.1739907047405;
        Tue, 18 Feb 2025 11:30:47 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:46 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:50 +0100
Subject: [PATCH v4 5/8] clk: eyeq: use the auxiliary device creation helper
MIME-Version: 1.0
Message-Id: <20250218-aux-device-create-helper-v4-5-c3d7dfdea2e6@baylibre.com>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3080; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=911xKOJApKviZC+11zfPOxyXIb2TukqSX6c3EVx5nkQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/TCjdli34EttLxXtExpNQaPhDVC9bRlZCzA
 Z9Pj+ToqrKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7Tf0wAKCRDm/A8cN/La
 halfD/4t/Q1MfjlL6VZuSiHTSQPRAa2QAwtLrhbOZWIEknOslrn3QFObs5s6ZPqryvP12HbeHpB
 ZqtOFjUqe/ieQB3ITOsZJaewTPwytAAIwK3CgywZ6JOUxa+9g7HGTKvG3uOOJmkRIffzZmr3L8R
 NZ5pFyDvvdDjI5pECZrNMk4VPJkwSAIgH5iZfiqrRun1haUOJoglpQY8Y8EADKhayv8tRAynR4l
 qDsiwIJrdtBE25fKHWyOZDOE8tpQxMsEt2TrH5ebbZtAEtr/gH6YfiiTUbuz37DxeauQ6mj6ehD
 XTEhxGJYCgV8aSKkCalZcuRKharsqxXA2evtvPHKpQvKOyIZ8EgbBeEOQ7dOeXKjzhWOM5XtsqE
 aMUycH4kRdaTgn4jHRICD4dLzYS3dXyYx3r7rGFlO7duZ/8KxdlzdluJ5loozQhR7O5ANEzTyHJ
 oRWP1Otit21XBW620IoAkxL8DF+P4i2UVjNzAOmtxgzut6dBQb1gzAm06Dpb4EJtFyAnO8mdI/H
 TIGsc8Ti47aBOluK+kO9s5wUA2fZ3WFLXDsN2BGvN4+teT6is420M3bHdw3I0/vCDlh1nH3plyg
 XifkLcQIVqvbW2dYXxE/b7rFiZ7Tza9okUXIhyKDFxmZAvQJKCF+0Z0Tgq8zioD1LftOLwSybaY
 ndwZJujpyaFfb8g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_113048_863922_79111AC8 
X-CRM114-Status: GOOD (  14.78  )
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

VGhlIGF1eGlsaWFyeSBkZXZpY2UgY3JlYXRpb24gb2YgdGhpcyBkcml2ZXIgaXMgc2ltcGxlIGVu
b3VnaCB0bwp1c2UgdGhlIGF2YWlsYWJsZSBhdXhpbGlhcnkgZGV2aWNlIGNyZWF0aW9uIGhlbHBl
ci4KClVzZSBpdCBhbmQgcmVtb3ZlIHNvbWUgYm9pbGVycGxhdGUgY29kZS4KClRlc3RlZC1ieTog
VGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4gICMgT24gTW9iaWxleWUgRXll
UTUKU2lnbmVkLW9mZi1ieTogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Ci0t
LQogZHJpdmVycy9jbGsvY2xrLWV5ZXEuYyB8IDU3ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgNDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvY2xrLWV5ZXEuYyBi
L2RyaXZlcnMvY2xrL2Nsay1leWVxLmMKaW5kZXggNjQwYzI1Nzg4NDg3ZjhjZjZmYjQ0MzFlZDZm
YjYxMmNmMDk5ZjExNC4uNDA5NGYzNGFmMDViNDg4NTQ1Y2M4NzA0M2ZiMzM1Mjk2ODUxNWE3OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9jbGsvY2xrLWV5ZXEuYworKysgYi9kcml2ZXJzL2Nsay9jbGst
ZXllcS5jCkBAIC0zMjIsMzggKzMyMiwxOCBAQCBzdGF0aWMgdm9pZCBlcWNfcHJvYmVfaW5pdF9m
aXhlZF9mYWN0b3JzKHN0cnVjdCBkZXZpY2UgKmRldiwKIAl9CiB9CiAKLXN0YXRpYyB2b2lkIGVx
Y19hdXhkZXZfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYpCi17Ci0Jc3RydWN0IGF1eGlsaWFy
eV9kZXZpY2UgKmFkZXYgPSB0b19hdXhpbGlhcnlfZGV2KGRldik7Ci0KLQlrZnJlZShhZGV2KTsK
LX0KLQotc3RhdGljIGludCBlcWNfYXV4ZGV2X2NyZWF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHZv
aWQgX19pb21lbSAqYmFzZSwKLQkJCSAgICAgY29uc3QgY2hhciAqbmFtZSwgdTMyIGlkKQorc3Rh
dGljIHZvaWQgZXFjX2F1eGRldl9jcmVhdGVfb3B0aW9uYWwoc3RydWN0IGRldmljZSAqZGV2LCB2
b2lkIF9faW9tZW0gKmJhc2UsCisJCQkJICAgICAgIGNvbnN0IGNoYXIgKm5hbWUpCiB7CiAJc3Ry
dWN0IGF1eGlsaWFyeV9kZXZpY2UgKmFkZXY7Ci0JaW50IHJldDsKLQotCWFkZXYgPSBremFsbG9j
KHNpemVvZigqYWRldiksIEdGUF9LRVJORUwpOwotCWlmICghYWRldikKLQkJcmV0dXJuIC1FTk9N
RU07Ci0KLQlhZGV2LT5uYW1lID0gbmFtZTsKLQlhZGV2LT5kZXYucGFyZW50ID0gZGV2OwotCWFk
ZXYtPmRldi5wbGF0Zm9ybV9kYXRhID0gKHZvaWQgX19mb3JjZSAqKWJhc2U7Ci0JYWRldi0+ZGV2
LnJlbGVhc2UgPSBlcWNfYXV4ZGV2X3JlbGVhc2U7Ci0JYWRldi0+aWQgPSBpZDsKIAotCXJldCA9
IGF1eGlsaWFyeV9kZXZpY2VfaW5pdChhZGV2KTsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0Owot
Ci0JcmV0ID0gYXV4aWxpYXJ5X2RldmljZV9hZGQoYWRldik7Ci0JaWYgKHJldCkKLQkJYXV4aWxp
YXJ5X2RldmljZV91bmluaXQoYWRldik7Ci0KLQlyZXR1cm4gcmV0OworCWlmIChuYW1lKSB7CisJ
CWFkZXYgPSBkZXZtX2F1eGlsaWFyeV9kZXZpY2VfY3JlYXRlKGRldiwgbmFtZSwKKwkJCQkJCSAg
ICAodm9pZCBfX2ZvcmNlICopYmFzZSk7CisJCWlmICghYWRldikKKwkJCWRldl93YXJuKGRldiwg
ImZhaWxlZCBjcmVhdGluZyBhdXhpbGlhcnkgZGV2aWNlICVzLiVzXG4iLAorCQkJCSBLQlVJTERf
TU9ETkFNRSwgbmFtZSk7CisJfQogfQogCiBzdGF0aWMgaW50IGVxY19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQpAQCAtMzY1LDcgKzM0NSw2IEBAIHN0YXRpYyBpbnQgZXFjX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJdW5zaWduZWQgaW50IGksIGNsa19j
b3VudDsKIAlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsKIAl2b2lkIF9faW9tZW0gKmJhc2U7Ci0JaW50
IHJldDsKIAogCWRhdGEgPSBkZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKIAlpZiAoIWRhdGEp
CkBAIC0zNzksMjEgKzM1OCw5IEBAIHN0YXRpYyBpbnQgZXFjX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiAJaWYgKCFiYXNlKQogCQlyZXR1cm4gLUVOT01FTTsKIAotCS8qIElu
aXQgb3B0aW9uYWwgcmVzZXQgYXV4aWxpYXJ5IGRldmljZS4gKi8KLQlpZiAoZGF0YS0+cmVzZXRf
YXV4ZGV2X25hbWUpIHsKLQkJcmV0ID0gZXFjX2F1eGRldl9jcmVhdGUoZGV2LCBiYXNlLCBkYXRh
LT5yZXNldF9hdXhkZXZfbmFtZSwgMCk7Ci0JCWlmIChyZXQpCi0JCQlkZXZfd2FybihkZXYsICJm
YWlsZWQgY3JlYXRpbmcgYXV4aWxpYXJ5IGRldmljZSAlcy4lczogJWRcbiIsCi0JCQkJIEtCVUlM
RF9NT0ROQU1FLCBkYXRhLT5yZXNldF9hdXhkZXZfbmFtZSwgcmV0KTsKLQl9Ci0KLQkvKiBJbml0
IG9wdGlvbmFsIHBpbmN0cmwgYXV4aWxpYXJ5IGRldmljZS4gKi8KLQlpZiAoZGF0YS0+cGluY3Ry
bF9hdXhkZXZfbmFtZSkgewotCQlyZXQgPSBlcWNfYXV4ZGV2X2NyZWF0ZShkZXYsIGJhc2UsIGRh
dGEtPnBpbmN0cmxfYXV4ZGV2X25hbWUsIDApOwotCQlpZiAocmV0KQotCQkJZGV2X3dhcm4oZGV2
LCAiZmFpbGVkIGNyZWF0aW5nIGF1eGlsaWFyeSBkZXZpY2UgJXMuJXM6ICVkXG4iLAotCQkJCSBL
QlVJTERfTU9ETkFNRSwgZGF0YS0+cGluY3RybF9hdXhkZXZfbmFtZSwgcmV0KTsKLQl9CisJLyog
SW5pdCBvcHRpb25hbCBhdXhpbGlhcnkgZGV2aWNlcy4gKi8KKwllcWNfYXV4ZGV2X2NyZWF0ZV9v
cHRpb25hbChkZXYsIGJhc2UsIGRhdGEtPnJlc2V0X2F1eGRldl9uYW1lKTsKKwllcWNfYXV4ZGV2
X2NyZWF0ZV9vcHRpb25hbChkZXYsIGJhc2UsIGRhdGEtPnBpbmN0cmxfYXV4ZGV2X25hbWUpOwog
CiAJaWYgKGRhdGEtPnBsbF9jb3VudCArIGRhdGEtPmRpdl9jb3VudCArIGRhdGEtPmZpeGVkX2Zh
Y3Rvcl9jb3VudCA9PSAwKQogCQlyZXR1cm4gMDsgLyogWmVybyBjbG9ja3MsIHdlIGFyZSBkb25l
LiAqLwoKLS0gCjIuNDcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
