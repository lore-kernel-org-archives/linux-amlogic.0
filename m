Return-Path: <SRS0=eCnW=ET=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EFCC388F7
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 13:52:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E9952078D
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 13:52:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wfxgVYq7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="atNqYZ8k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E9952078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FWEqCSSCalALD/6Z8/9fv9WwpglW1RN2XcfSKj5noDA=; b=wfxgVYq7I6GV9EIEcbBBUw17I
	jBZe8YiVs6ay/TuV55KskayVgLjZZ2dMX65IgvRAJdaKtpk87vwa/70/Msm5Y0dDOzYvLx7KOFBOl
	mkS4FuG4KDiCO+TPVulEJ2YAjplyb1bvk1xN3Av8iuwzL87n5cnLV9SwNGwORzBtKCR631opn15uA
	ptGJf5pburGzX3uJ9v0N/R+UbllIo5HNsqYJtFnp+Cj0lMi2Kb5OMylqgBxwNyz4S3jw3mRlTJLWA
	fJet5FICXvw3QTb9OzoNW1LaaRTMTXo7j/ZZSMIwNqKc90di/UQC6naoMyqouBzozdfvLj2KnnvRv
	hXEpmM6kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdZV6-0008RO-7Z; Fri, 13 Nov 2020 13:52:28 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdZSn-0007AT-3d
 for linux-amlogic@lists.infradead.org; Fri, 13 Nov 2020 13:50:17 +0000
Received: by mail-wr1-x442.google.com with SMTP id k2so10024014wrx.2
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2020 05:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FPP0KPBE9bJ91PMqYQecftz5TXmHEXYH6/4+Sl+qsTE=;
 b=atNqYZ8kRbRqU8GNbprKEAbi23pRTlYb5L0MmlYxC7m6PmpZNGQuhqP6ASY22r5shn
 j1W43Id8OBhgGoyS3zM/JamzfB6UNXGFblqrp5WI1jIz1bxgmVD6gTxPvE+CWSipHFfK
 6n5Rryizvvc9J6mIbOwX2TP6WkS9/ZKzFI+xgT5oMcJ2rpcOtdgCpf7WOcrRH78gg+vn
 ywhJNI9DQHewqFej2ROXNGRf0ixudva9FfMawIBD5Z8MJcrzAIPrTLPNKGoydcPVKRLU
 1JJPW4cqi4cGWAkpwJmhjSGNo2ofbJA1/N6sih1n/2VAD+c9DbDFpseCcXv1ncnGQMxr
 QadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FPP0KPBE9bJ91PMqYQecftz5TXmHEXYH6/4+Sl+qsTE=;
 b=cHyPDQ8q0S1RIdewCESP4lcnLpTpSxfa5600OAZHvdXUM+A73BcgYwr8iBZUO0JvBN
 MWEHrBkir3lw5QYi+XD+HQcIYBKRpsudLCcsZ0OcgeAchxfI2Cb3xXUgcfCAIoNZehnz
 Et5iMR194id9AyNSLSMlQbh0RmyevZ9UKLwpKIpUSMczv8dEvy1C+Z0v34nrh+kvzyTG
 eGRByNl2lqtZsLtIoAYPDf+pku426fcncdxTsSnUUWQXjUWf+coQqQlznWT5invfgjvI
 AjXCniMPxmCk95k+kRkf4gMMKhOBidGBlURaSwJrbmdQWY7oQMOdmMs5nV5wDhH13MpZ
 Hppg==
X-Gm-Message-State: AOAM532sCeLa2ixi7vJhYD7orEYsGkOaK0U1GFwFpZsr71bgCfFsrZbJ
 brIMf2XG3lD8A8NsuCr8aKGoxg==
X-Google-Smtp-Source: ABdhPJwH0G0Dh1nWggTcRBgogx0/P/R+hHDVfYcBOXgPs1OuarDaHOCCcZpMJv2RIDqqw50TszH2jw==
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr3550191wrr.353.1605275402684; 
 Fri, 13 Nov 2020 05:50:02 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:50:02 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 17/40] drm/meson/meson_vclk: Make two local functions static
Date: Fri, 13 Nov 2020 13:49:15 +0000
Message-Id: <20201113134938.4004947-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_085005_294916_FAC51E4E 
X-CRM114-Status: GOOD (  12.13  )
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
aWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25f
dmNsay5jCmluZGV4IDBlYjg2OTQzYTM1ODguLjJhODIxMTllYjU4ZWQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
c29uL21lc29uX3ZjbGsuYwpAQCAtMTMxLDcgKzEzMSw3IEBAIGVudW0gewogCVZJRF9QTExfRElW
XzE1LAogfTsKIAotdm9pZCBtZXNvbl92aWRfcGxsX3NldChzdHJ1Y3QgbWVzb25fZHJtICpwcml2
LCB1bnNpZ25lZCBpbnQgZGl2KQorc3RhdGljIHZvaWQgbWVzb25fdmlkX3BsbF9zZXQoc3RydWN0
IG1lc29uX2RybSAqcHJpdiwgdW5zaWduZWQgaW50IGRpdikKIHsKIAl1bnNpZ25lZCBpbnQgc2hp
ZnRfdmFsID0gMDsKIAl1bnNpZ25lZCBpbnQgc2hpZnRfc2VsID0gMDsKQEAgLTQ4Nyw5ICs0ODcs
OSBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBwbGxfb2RfdG9fcmVnKHVuc2lnbmVkIGlu
dCBvZCkKIAlyZXR1cm4gMDsKIH0KIAotdm9pZCBtZXNvbl9oZG1pX3BsbF9zZXRfcGFyYW1zKHN0
cnVjdCBtZXNvbl9kcm0gKnByaXYsIHVuc2lnbmVkIGludCBtLAotCQkJICAgICAgIHVuc2lnbmVk
IGludCBmcmFjLCB1bnNpZ25lZCBpbnQgb2QxLAotCQkJICAgICAgIHVuc2lnbmVkIGludCBvZDIs
IHVuc2lnbmVkIGludCBvZDMpCitzdGF0aWMgdm9pZCBtZXNvbl9oZG1pX3BsbF9zZXRfcGFyYW1z
KHN0cnVjdCBtZXNvbl9kcm0gKnByaXYsIHVuc2lnbmVkIGludCBtLAorCQkJCSAgICAgIHVuc2ln
bmVkIGludCBmcmFjLCB1bnNpZ25lZCBpbnQgb2QxLAorCQkJCSAgICAgIHVuc2lnbmVkIGludCBv
ZDIsIHVuc2lnbmVkIGludCBvZDMpCiB7CiAJdW5zaWduZWQgaW50IHZhbDsKIAotLSAKMi4yNS4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
