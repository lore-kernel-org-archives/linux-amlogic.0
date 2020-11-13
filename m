Return-Path: <SRS0=eCnW=ET=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F58C388F7
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 13:52:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 864A122240
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 13:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kIIZrX/J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cy0FIFBO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 864A122240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k9rqj37WR9Jay+krOW3Xn48BhXU7czfYcPUu4c4UkfY=; b=kIIZrX/JBjuFi37qacDE3KEig
	e/mtHiZbumX20hpa7U5Gf/t3mRiYQRWZiafpTS9Lg4XAzbZfznzWiS9R2UmXBv4FY/zq+o191uSPb
	b2f1+86XrhGi0BRMIn3yUD5d4q8IVEDugs2/JzOLORLWD0oqTr5AmFfNMWMGaP+KwNQ7TnPXGzdBo
	5ftXdwxiWQodNjV5RXeveeL4H5bHbIchEmo7dJmon9ZOkI/EX5uQAf8UHu1uaIdX2bVPH+93CG/kc
	W5GKGFqg85eUu7+kMgKgSzS5/iUUNKw0YUIkga/kkBaZf3WATxO9je7q05KEz/5uKZ0Tcu/rsfAjt
	3KBRpgmkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdZUi-0008Cq-QT; Fri, 13 Nov 2020 13:52:04 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdZSi-00078U-8M
 for linux-amlogic@lists.infradead.org; Fri, 13 Nov 2020 13:50:12 +0000
Received: by mail-wr1-x444.google.com with SMTP id d12so9947536wrr.13
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2020 05:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yt85C2+NzGAlI5emEV4T+vNOl5giBIbnEfifffD7CnE=;
 b=Cy0FIFBOqKt9Owiq+Dqg7+C23huzVDETryFyww7hngaX44EDG2i3SfAegg/ufoaL2u
 uzX5zuxtv9ViDaCFPsw8oXmaaEtTFHVWqtn6aZ7Bvype0KXwKlw2IXtMoy4hRUdSmi0C
 XlbjQlhdV0BLzWGUf1FDhesPOdHZTy0bXVpBs8gWwToqFsTfXI1NibEEdysQ8CdwzdaH
 Rb+7WADVUWE0eDtwkGg3n46j/NSuLXVSqWKAMRLw/kmi/Q/MDBAg5abRJbcVE+XvI1TD
 uoRTVC/CIqtQpSsEKCrHaagzSqer6TxrW5YMW2V4zVC1UhYE2rLoBCyGTamzEAqx53j6
 Y7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yt85C2+NzGAlI5emEV4T+vNOl5giBIbnEfifffD7CnE=;
 b=YodwX62+tPW+1zoDW0jY6Q+epYwAIoGgAGXDgwkf4HMfM7TfxEAR6T3FEZm91pXyVu
 VVMv/jkE+P0jT6mtcn+ywVcuzveXqo1tyrCuHDYtv5z0CmLyDYraDlVHPi6KGGkQB1dx
 0N6uC+snsB0jIPlyBNt0+l0edLS90yLk6oCvcd0Ls4rACFO/Z4IC4CSyfSVuwbgSBo6r
 QdYnvS6zeDCci5rvLKw12Sex/hVJrwArGXL4GPUrlqZhLmakeHZHqBXLvWJFYqambzfl
 /MSlNd2aCMoMP0na92j3E6DArSRPPNTOYPO17Dfv3boHjnGyC5IyoxCJVunuc4lyJoX4
 f/UQ==
X-Gm-Message-State: AOAM530hpe0ow05WcmJYwmTCP1WJsQ6FvNhP/NvEgSjF88/YA7/H7N6Z
 jtyRTI0daKODTPRWVzca2txi5Q==
X-Google-Smtp-Source: ABdhPJyB1aM/U0SYQBQS2sQ434uZIWEyyXQHKmq7NJg+pZgX9+e1LYtp8/RyoqCFrQV32ZTz5voxrw==
X-Received: by 2002:adf:ebcb:: with SMTP id v11mr3575994wrn.408.1605275399152; 
 Fri, 13 Nov 2020 05:49:59 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:49:58 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/40] drm/meson/meson_venc: Make local function
 'meson_venc_hdmi_get_dmt_vmode' static
Date: Fri, 13 Nov 2020 13:49:12 +0000
Message-Id: <20201113134938.4004947-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_085001_264659_E30FE6BF 
X-CRM114-Status: GOOD (  12.29  )
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
ZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX3ZlbmMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fdmVuYy5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYwppbmRl
eCBmOTNjNzI1YjZmMDJkLi41ZTIyMzZlYzE4OWZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVzb24vbWVzb25fdmVuYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92
ZW5jLmMKQEAgLTg5MCw4ICs4OTAsOCBAQCBib29sIG1lc29uX3ZlbmNfaGRtaV9zdXBwb3J0ZWRf
dmljKGludCB2aWMpCiB9CiBFWFBPUlRfU1lNQk9MX0dQTChtZXNvbl92ZW5jX2hkbWlfc3VwcG9y
dGVkX3ZpYyk7CiAKLXZvaWQgbWVzb25fdmVuY19oZG1pX2dldF9kbXRfdm1vZGUoY29uc3Qgc3Ry
dWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUsCi0JCQkJICAgdW5pb24gbWVzb25faGRtaV92ZW5j
X21vZGUgKmRtdF9tb2RlKQorc3RhdGljIHZvaWQgbWVzb25fdmVuY19oZG1pX2dldF9kbXRfdm1v
ZGUoY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUsCisJCQkJCSAgdW5pb24gbWVz
b25faGRtaV92ZW5jX21vZGUgKmRtdF9tb2RlKQogewogCW1lbXNldChkbXRfbW9kZSwgMCwgc2l6
ZW9mKCpkbXRfbW9kZSkpOwogCi0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
