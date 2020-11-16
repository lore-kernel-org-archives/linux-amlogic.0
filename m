Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11360C4742C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 17:44:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A46A620B80
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 17:44:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YV6ooola";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ch05i1vr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CpSZkmo/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A46A620B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9Kr5BpZFzohhWXgQLu8tUQsKHU09Fgs8MIRZST1NztA=; b=YV6ooolaehpQ0U/w4Qdwzt1yi
	sRTXUYVJClDivX6sMUiagfKXfEBuIyd9u7h0zoehC0mnAMMQ5YzfhKcS5YuTGM2M259YkwQr+id3/
	NAe1WRvn0lLpMDWoe6mr4XSlL9zyJCBoNZbogDBTrV3TijU69QDnKviMaKOmptDg4pRcOu19iyuVb
	t32MzBQrvMPDDklby5woeWJd4+x32N9zaFnhTcKqmh07Uq4tyIh7mwTRwQVMwtSc733haMQrewQMI
	h074xYxjvB/Tow8+72devKiPPwbdYZgQBuXnZK60SSO2+L0ZNIm5T5/Y+cK+DjG5nkr8rjkBHRe04
	7JvanwqjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keiYE-0005TW-UL; Mon, 16 Nov 2020 17:44:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keiVd-00048A-DC
 for linux-amlogic@merlin.infradead.org; Mon, 16 Nov 2020 17:41:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=SDDB7TiTj4Jx/yTpGVCS2uqUdyiewZ4Ioe8JHQpewVc=; b=Ch05i1vrlUuCsHyio2H5oPMCHw
 ROWxkzLb1e5oRKEb6Z1Fdq29fmFoKet/sWd6ZDXiTUk7ZPe/DtwnJ8Ic4PK5tImFHdfUjLBPMZ/XR
 8aQdzyghh0jyR3ZUZljsKWJ9yKlRgR2cf0/XMEVfBiYVfJpm33UCb9CKGk8C4kOr0MOUyD6UlysUc
 mU6Qkca7pYHZSLvPtC5HXtdgPIwAtM5dXYHyAbAQAePFGsb2LMEVl8cWw0ghyj+V7C0R/cEIQu6L3
 6bMCvx5IrOBaUT9ZZ8/YR9pqH0E15EId4OGkqyUabOrWnGJtGEusrQ0qn1mcIvFRcMOBWxqKBXB8m
 nhR0d7yA==;
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keiVX-0001Il-Ni
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 17:41:43 +0000
Received: by mail-wm1-x342.google.com with SMTP id 19so56098wmf.1
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2020 09:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SDDB7TiTj4Jx/yTpGVCS2uqUdyiewZ4Ioe8JHQpewVc=;
 b=CpSZkmo/j2Y34JQwmQr2gL++XO1KYPcKHx6aqjTMLngU/acwN4t98DrtpoEAR+uHeA
 LEd2aN+YIEqfjA8qJitJOl7OQDlvxN+ELOtvUyVfK6NYEUWOZlChIVs4nqcg9elGQehe
 Mlbh/kBNojHRJE8HUO/6j3KiFXWV/lY/H0EeqDJEMCmSSqc8uetWdcK7KC1SKun3LNfM
 OsAvUf3KGN8GI1Q88IWDJ4JqQ4UIzj7/9UKQN0rkBTAyNfaB9AD252Kp8BTqLX7Ree6o
 9Df3tJOHKVus3QnMsM1RqTTwVDZxjAWbtxLYFmHOymQolEp5oB4vsX1J35OYld7qBk2A
 gtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SDDB7TiTj4Jx/yTpGVCS2uqUdyiewZ4Ioe8JHQpewVc=;
 b=UmpV3LfXdCvLFrfbqWDe5xUEcngFayLWMRgbEpE3aO1KFN9HvIgbIlFF44KMxENizp
 xmoEE/t7rqwTopFqOtAIR+Yv8oR7CiVEE8MIVnkrovHN5KxKTKPTElnqMOHPi3g/ygqP
 uUQAQzbwELZeskoI0/wiiqXxRMYI+kROSAqdPNINv4FtUdZHDtLHt/MXbEm+SjIFhmei
 FggVcEgTg6xQqXAJLl3kxiej3ozvH+uyw5LFQeAzL3JSPcdOTIXfFAS4o42QRQqNSurh
 a0VPkDOM/9bMo3ROgx0DCo4rUrCNHfhUZE0u7vB+iAr02Ey+WYgaR3vawSQAv4IsUKFn
 /1og==
X-Gm-Message-State: AOAM533qNS+l6F2CxJNaDp7a0/04wQqCkz4P26xliAG5eEP9JMnD3RJ6
 W33QFndNVTVmCdzD3qFNZoqZcg==
X-Google-Smtp-Source: ABdhPJxPbxCum/XYvUgQugDBX75aEbB+JJYQEqSRBMPO4F/I/vRzV1yTYp53NsEEXN/uJBkrtTjG5Q==
X-Received: by 2002:a1c:1fcc:: with SMTP id
 f195mr10459841wmf.121.1605548498820; 
 Mon, 16 Nov 2020 09:41:38 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:38 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/42] drm/meson/meson_vclk: Make two local functions static
Date: Mon, 16 Nov 2020 17:40:44 +0000
Message-Id: <20201116174112.1833368-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_174139_939497_7908B585 
X-CRM114-Status: GOOD (  10.44  )
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
cy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYzoxMzQ6Njogd2FybmluZzogbm8gcHJldmlvdXMg
cHJvdG90eXBlIGZvciDigJhtZXNvbl92aWRfcGxsX3NldOKAmSBbLVdtaXNzaW5nLXByb3RvdHlw
ZXNdCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5jOjQ5MDo2OiB3YXJuaW5nOiBu
byBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmG1lc29uX2hkbWlfcGxsX3NldF9wYXJhbXPigJkg
Wy1XbWlzc2luZy1wcm90b3R5cGVzXQoKQ2M6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJh
eWxpYnJlLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXls
aWJyZS5jb20+CkNjOiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KQ2M6IE1h
cnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CkNj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpT
aWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgpSZXZpZXdlZC1i
eTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNs
ay5jCmluZGV4IDBlYjg2OTQzYTM1ODguLjJhODIxMTllYjU4ZWQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29u
L21lc29uX3ZjbGsuYwpAQCAtMTMxLDcgKzEzMSw3IEBAIGVudW0gewogCVZJRF9QTExfRElWXzE1
LAogfTsKIAotdm9pZCBtZXNvbl92aWRfcGxsX3NldChzdHJ1Y3QgbWVzb25fZHJtICpwcml2LCB1
bnNpZ25lZCBpbnQgZGl2KQorc3RhdGljIHZvaWQgbWVzb25fdmlkX3BsbF9zZXQoc3RydWN0IG1l
c29uX2RybSAqcHJpdiwgdW5zaWduZWQgaW50IGRpdikKIHsKIAl1bnNpZ25lZCBpbnQgc2hpZnRf
dmFsID0gMDsKIAl1bnNpZ25lZCBpbnQgc2hpZnRfc2VsID0gMDsKQEAgLTQ4Nyw5ICs0ODcsOSBA
QCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBwbGxfb2RfdG9fcmVnKHVuc2lnbmVkIGludCBv
ZCkKIAlyZXR1cm4gMDsKIH0KIAotdm9pZCBtZXNvbl9oZG1pX3BsbF9zZXRfcGFyYW1zKHN0cnVj
dCBtZXNvbl9kcm0gKnByaXYsIHVuc2lnbmVkIGludCBtLAotCQkJICAgICAgIHVuc2lnbmVkIGlu
dCBmcmFjLCB1bnNpZ25lZCBpbnQgb2QxLAotCQkJICAgICAgIHVuc2lnbmVkIGludCBvZDIsIHVu
c2lnbmVkIGludCBvZDMpCitzdGF0aWMgdm9pZCBtZXNvbl9oZG1pX3BsbF9zZXRfcGFyYW1zKHN0
cnVjdCBtZXNvbl9kcm0gKnByaXYsIHVuc2lnbmVkIGludCBtLAorCQkJCSAgICAgIHVuc2lnbmVk
IGludCBmcmFjLCB1bnNpZ25lZCBpbnQgb2QxLAorCQkJCSAgICAgIHVuc2lnbmVkIGludCBvZDIs
IHVuc2lnbmVkIGludCBvZDMpCiB7CiAJdW5zaWduZWQgaW50IHZhbDsKIAotLSAKMi4yNS4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
