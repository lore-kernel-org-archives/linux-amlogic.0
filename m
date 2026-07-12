Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1FDC43458
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Jul 2026 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9vP1ORIHuTqWts7tQ8fXNM0Cb9bG70USdia4vasIl8=; b=cmkfQtA46XV3WY
	MSLgIqpNDh4EkbvUo2Nai0jvvj2KdaU7wk+S53aMY5rBI4sKMGFHjwJqQG8dlRwKCvDIbUA+FNGj8
	15KmbAgtVNb+mESniLf40R9jtSqLnm5prNKaN1hIkzLnQ13F0NEa4p793xXfWjTOxqB5fi0/dqDSE
	doixyuZPZTfSD6tP9pVJP+/4qCmPO2rAllSTJhc6DFLlJa9Yoe1cDcmCOKxb93Lo+Skt1bZajF6jo
	xpRs813UmG9XttHVPsT4tndBVTaPU5QyBVmzx80Rn7pJ7dFQK+JS24Vt3yjPidlyGblnKO4FT1N0A
	/DSVJhrhWRVuVIZgf6hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiuCj-00000007TZA-0zEs;
	Sun, 12 Jul 2026 13:26:45 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiuCf-00000007TYR-3cBn
	for linux-amlogic@lists.infradead.org;
	Sun, 12 Jul 2026 13:26:43 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ce7d2adef4so30910495ad.3
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2026 06:26:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783862801; cv=none;
        d=google.com; s=arc-20260327;
        b=RMF3QpkIvrC4GclF1MvRrPgbjU/u8bvML4nw2RFnGQjsbjlHI+FXzGdATZgbeyPm1F
         0nUED2W73zIBLGeFZFXF0b673GqeLq0ZRinWaBCT86KKmLTjeOCBRhc5ruvQ2uWVIm8W
         PavcauEB0Ufd3nQI6CzM6STkm/0N+6uFLy27huM4ykakDUjqMJb7uhxpaoqwf6kwqW2A
         MNiLaFwn9yOG7Wzzm0UEeo8/y/+IfrX1heFfBGDadt/P4pTYS/xnsTY70/SXfl+MWRi0
         Vpa9DWf7yjbNJUynbsxh25phxMM6dq8I4+i2jxBgfIZK4E9J6Topip3w761HJob4CoCS
         q72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=atG8XqSPZX3CxozOHpc22+hLJIPB/QF7jvdDAJ3IDBc=;
        fh=8fMAXSbCJue+5xG2Z1W0sqSdg8hu+0loWCMrTwpPvg0=;
        b=lHHSPOAgG+c+SbV3rLZ4+XxRHIau9PSM8rcwItTWsxaHVXQSP1eKSq1T3wOF8h2Pt2
         tQBWNytfLah48jymZdcsUjAg2zuMwys3AQJw6t4sJdYJL3BpN7yf6qOJvx2XcyT9bkbP
         M+qnBC9XN/f6UBbeWJdALCRmaXu4eJxStl5emIRthP+IIyyeruKFKz4uqXtgVohSnrCm
         fW/oskTshD44JBWjE7UGrCQDzqC3lgeOw2ZS2Q9CaDLpSd92V4ODLdOPZ5m1bai1pr4x
         QS1RLibye1mQGcVv8Twg9Q+hyI4A7Js0gwbiJDqwCSk7ISL+NmDcRvTFP9Z4yGj8XCR4
         Qudw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783862801; x=1784467601; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=atG8XqSPZX3CxozOHpc22+hLJIPB/QF7jvdDAJ3IDBc=;
        b=qSuZWTapbD99J5AzH5suumIYlED20UEjHwimJMxcv1pcL+yuKMqCG6s5Dh+Q5xeetG
         K6ZSFz6TpOv/oRBA946I+rD9b6tPiDYc7oRVtAXq/e3fq7/a0Bz+7h9II3OSLcD/yMkF
         SsZ604wo4FTEUxg6sql1D++vQ5kWGNnIv/XFAg+YbUpZgjtHtRQGHvFTlZ0MVvPAXexp
         mEdhELW5faDED/LGV+uWZZ/FcOTAxELF/746mP4+y/hBnKoDF5Cz4qvw86Txuf9wmuiC
         DxzgVNpWeVcc5auLoCTwq4iCPOZWu+0hHPLKMiwmuj4jZMLof803sFyeISayW+w+N1rd
         UYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783862801; x=1784467601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=atG8XqSPZX3CxozOHpc22+hLJIPB/QF7jvdDAJ3IDBc=;
        b=kM27/hZSPg3RkxkSxqglkldvATwRE9ioaMTw7fTcqmaHSCVbpuLsI9lvk+814aAZ6d
         JpO/nisYh0hufo+WtrVkwDDpCbZdxQAX1cDtzqzKXKtDfkDlkAx6T7rAYi3smmgxKeGz
         txbGrysYUc2qg2faEr7dinh+5lNaKj87goFnYYwdMsw+TRfbx/DYNeDZHsUtsqYxufEq
         CZ+238AdYACWIXEI/41K2kHYg6A09H9lWpJw61MPCY+HPHrNn+PpUNkM2DBnbjOSd8Lh
         VIj9nRkRyHJDpZoO4wuBpFXgnD7YQrq9sqiP8gyzYCpLOlSELD0qYMDo/SWCro8a8Kfb
         e1BQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCi/yGW5L2bItFhfSLhEofmHt7oi1RjatO5gFiwx5UUx72u/ZtUYV8J5r1fdsrO3pCYUeZIqz6yUAcCRPM@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi+POVRuIpuXAFOXfNvjnX0rturD8+CeJ0ngZzerwTLQqcfFs9
	x9hD8rHZatEIKnClapRYrCqI08RUZJGzsrEQBFlW6kX+3bfRVamr0gYZGyZxRYu5bW6riUpsQXl
	dfJ0ZafsXFJjPztJg+3rxKinaejfSsxg=
X-Gm-Gg: AfdE7ckbVu9kWgZQOYYzt5HM7bd/wdACuTRU+RzEF/w0ZH5OVi14iUptLmkW5XQg5IP
	Llgyp+0zXT7sJgpeZjTiouNkG9wfHLViE9i7y/Abd4hvd0LLCk9zaXZSD4MdvcLKhEe9uSoF2An
	GnX2MTosNFT2c0PEk3dghFRKWGbL2ejLHwjO/bmnR1kvj67u6pzcDuQiUGO6prxryT/PSq9Fa/g
	jwykodfzE7VqQKwWoE9vqGnTrvPxmeK/kK3lbh6tGZxql3oNGvF5wLi6wqN/AAEU7euicDigjCH
	6tBE06X9vm3j+nfQtPYdrQreIEnfOA==
X-Received: by 2002:a17:903:2bcc:b0:2cc:77f3:a934 with SMTP id
 d9443c01a7336-2ce9f174650mr52007555ad.46.1783862800932; Sun, 12 Jul 2026
 06:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783673420.git.sean@mess.org> <2d7772d678d1815276c2d409d68ae4f4673d09aa.1783673420.git.sean@mess.org>
In-Reply-To: <2d7772d678d1815276c2d409d68ae4f4673d09aa.1783673420.git.sean@mess.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Jul 2026 15:26:30 +0200
X-Gm-Features: AUfX_myC7hx4fjS4-JwPMLgRui-DB58_FebfMXfpkFKB1CdDAdfGxwKF54CFOC4
Message-ID: <CAFBinCAPxkEfuY8orhd=R-6+2-uxWmEDJAaZmnKjJnzf_kQqUQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] media: meson-ir-tx: Ensure clock is disabled on unbind
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Viktor Prutyanov <viktor.prutyanov@phystech.edu>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_062641_903252_02345E77 
X-CRM114-Status: UNSURE (   8.49  )
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

T24gRnJpLCBKdWwgMTAsIDIwMjYgYXQgMTA6NTPigK9BTSBTZWFuIFlvdW5nIDxzZWFuQG1lc3Mu
b3JnPiB3cm90ZToKPgo+IGNsa19wcmVwYXJlX2VuYWJsZWQoKSBuZWVkcyBhIGNhbGwgdG8gY2xr
X2Rpc2FibGVfcHJlcGFyZSgpIG9uCj4gZHJpdmVyIHVuYmluZC4gTWFrZSBpdCBkZXZtIG1hbmFn
ZWQuCj4KPiBGaXhlczogNDliZTFjNzhkNTc1ICgibWVkaWE6IHJjOiBpbnRyb2R1Y2UgTWVzb24g
SVIgVFggZHJpdmVyIikKPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIFlvdW5nIDxzZWFuQG1lc3Mub3Jn
PgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBn
b29nbGVtYWlsLmNvbT4KClRoZSBhZGRpdGlvbmFsIGVycm9yIHRoYXQgc2FzaGlrbyByZXBvcnRl
ZCB3aWxsIG5lZWQgdG8gYmUgZml4ZWQgdG9vLgpMZXQncyBkbyB0aGF0IGluIGEgc2VwYXJhdGUg
cGF0Y2ggdGhvdWdoIHRvIGtlZXAgdGhpbmdzIHNpbXBsZS4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
