Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84010C2D0A3
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 17:44:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18F3320B80
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 17:44:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wnqsDurH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="g7kkA55k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YVgEUmjS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18F3320B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hjj4jgVrESku213DyrAQXmDkAJJuw5BRZ/7fJEAU4/g=; b=wnqsDurHW5UZxT3tm9elXoXsl
	ceD3hpevl03ummr2IGOxHMV+j0YTty6GJXB4mUHeIFbMS/Yhz/hz7fxXaM6r45M3XD4fsNnHozk4s
	d0gJDlzzA5Qolk9d4aHw2eTT4PYdj2umF7psXPRSvKo1mA1t04IRHrltGg8OfJWgPWqxlcr02cTpp
	6ITokFx95U0s6zOhqTBoPr59rA3QbNZ+tZmbY6hGk+l3Ju5B2HukR496O5BQ1IwOdnxwA0eJVKB/G
	97XPl10AVfMepaavbL35JjbFFoUbN/kHhEz91FePa2JYZl5Fq2MfB/xNVr1e7vzQdDhxnh4CSdNVL
	d3dQTrPhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keiYI-0005XL-PU; Mon, 16 Nov 2020 17:44:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keiVe-00048A-Bq
 for linux-amlogic@merlin.infradead.org; Mon, 16 Nov 2020 17:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=i5j9nO6ToQvZzh6GJLxxL5NsV6KcH6bI4EH07Iu89H8=; b=g7kkA55kO5qeeQPqUpJ5zJkXCY
 4Pb0tAYcveT2nH1xzKYtHV5xgPszp32YitOk+42w0LFqIrCd/D1y4qmrgZEyuDZiB9VCkfe01uubF
 nWs+uTNnFqwCn150MZ4uC97NDrs8PKHH7UcluNVKgDWCpCXpajEV2SvisOIvlwuZZ5AIHWi53/Hgx
 4o7KmZXIkLgzauVh9o9ENBmlpRmnQcuwFUS9VaWJdfCDg7n9BnTBDCtYLjyNXLjhDHkBoDSpo0mAf
 BMddtvNalDCo0sfpJGJCB/m6V7qoBYDFvEa3HqSPMwI6KsVhUN42fwPmSDFiUe5rjyoss7gnG60Ov
 +erEgw8A==;
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keiVX-0001Hi-0a
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 17:41:42 +0000
Received: by mail-wr1-x441.google.com with SMTP id u12so12442325wrt.0
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2020 09:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i5j9nO6ToQvZzh6GJLxxL5NsV6KcH6bI4EH07Iu89H8=;
 b=YVgEUmjSraSC4YQk46p6uPgedVESFPJ3UsJO7Tu4f7fuWARoplJS6YC3o97e91JkZv
 cBJvp40l0dgXRQaLlTpEuC2Q0uQjxFAwNIn+7nMhNDcFl9mgKct6xkqQsfkHOtazXz+2
 0vtjIjV1rLHuQlghb40vINrSHBkLUdnkRlbaH3ZaQRgQRO3OPNBtpNrxK6JPR7CTnpxq
 tdZwoh0efmPizM+AxDTig/MH+rwvLAxSZ445H6Y9Te1xq5aiCAH4ok1RxdGRQKkSivx2
 HbtPLYE+ge6oxVRG/WTMb8LBqTG8kvBwxC8wW8p0HVl4kN8Y7Tn8G1Id1wAgUtBe/mLD
 s0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i5j9nO6ToQvZzh6GJLxxL5NsV6KcH6bI4EH07Iu89H8=;
 b=QUrxA8A0TFmWYLaxG0m0nd1YPVa77487TUrpUsow5sn/FyEFy/f6wwmacgRsBEvUFk
 OCfl/QUnvSYCLQUtQ5CJ+/btya7bETX58zLZ79LI1+7cNC+XjL8xV/GVeKxywOiPJx5e
 bBTUTKeBEzQRhug5PciQDbZum4XpM3NNBkMxxFkUcd2idUlA61GsLryGr4tu6PRcMB8e
 Zovg3S6Bg8p27EaMRKzgJrm/rWcVgxv25BRW8zUkRrsGTUE8xf2vdO3Tc3Y2Af8+tl0q
 azfoKJ8YwI42ovBtVSCIefRlLEt5NHeMCWPrc8pYSSbvZa5cWXUy3HzAvdiGCkN/T78f
 Cv9w==
X-Gm-Message-State: AOAM533rrm15ELo726mHTA3+Fqv21eGuFzCejX6WPJt7QPwfRJ9TR4M0
 hEVIUZnuRUvh8K83yvoYnROEOw==
X-Google-Smtp-Source: ABdhPJzrDkYQrEjZLrNb+YUFl0cr5yDvtdbI8mt3oNtaaL8k2XZ9HKXWkCH/mgSrQlJyfuBrthO8LA==
X-Received: by 2002:a5d:6992:: with SMTP id g18mr20417522wru.362.1605548497365; 
 Mon, 16 Nov 2020 09:41:37 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:36 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/42] drm/meson/meson_venc: Make local function
 'meson_venc_hdmi_get_dmt_vmode' static
Date: Mon, 16 Nov 2020 17:40:43 +0000
Message-Id: <20201116174112.1833368-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_174139_376688_7A4210A5 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYzo4OTM6Njogd2FybmluZzogbm8gcHJldmlvdXMg
cHJvdG90eXBlIGZvciDigJhtZXNvbl92ZW5jX2hkbWlfZ2V0X2RtdF92bW9kZeKAmSBbLVdtaXNz
aW5nLXByb3RvdHlwZXNdCgpDYzogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUu
Y29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNv
bT4KQ2M6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgpDYzogTWFydGluIEJs
dW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnClNpZ25lZC1v
ZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+ClJldmlld2VkLWJ5OiBOZWls
IEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX3ZlbmMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24v
bWVzb25fdmVuYy5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYwppbmRleCBm
OTNjNzI1YjZmMDJkLi41ZTIyMzZlYzE4OWZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fdmVuYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5j
LmMKQEAgLTg5MCw4ICs4OTAsOCBAQCBib29sIG1lc29uX3ZlbmNfaGRtaV9zdXBwb3J0ZWRfdmlj
KGludCB2aWMpCiB9CiBFWFBPUlRfU1lNQk9MX0dQTChtZXNvbl92ZW5jX2hkbWlfc3VwcG9ydGVk
X3ZpYyk7CiAKLXZvaWQgbWVzb25fdmVuY19oZG1pX2dldF9kbXRfdm1vZGUoY29uc3Qgc3RydWN0
IGRybV9kaXNwbGF5X21vZGUgKm1vZGUsCi0JCQkJICAgdW5pb24gbWVzb25faGRtaV92ZW5jX21v
ZGUgKmRtdF9tb2RlKQorc3RhdGljIHZvaWQgbWVzb25fdmVuY19oZG1pX2dldF9kbXRfdm1vZGUo
Y29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUsCisJCQkJCSAgdW5pb24gbWVzb25f
aGRtaV92ZW5jX21vZGUgKmRtdF9tb2RlKQogewogCW1lbXNldChkbXRfbW9kZSwgMCwgc2l6ZW9m
KCpkbXRfbW9kZSkpOwogCi0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
