Return-Path: <SRS0=9eFL=AY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F47C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 14:50:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03FCB2065F
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 14:50:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WYYnvSzw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZmtW2ht4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03FCB2065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y56kJ+qWLOblMec+id+H0h/b0ib52qFl8+4upwIHerk=; b=WYYnvSzwFe7NNelwkvcqE+LPp
	f+FXntT4l/B9RIGi/GMyL1gCuyxIqOCunG+UR1K6UXza4Lp42C8LOzf/GdVYb6r/B/hhyyzoctDzM
	kQ3V2dqiGbVE9rk0M/Z1iCSScvz16vXsaacgOfLMdchtK8I4fV+uvH+EQw8+9X/msLYiiiiFXkSw8
	6s9drI9IM0uSM37FlwgCt2eyHHlvNdOgXR6u9bJIARdQ0Dn+TD6HrGqRNR/ajiDceBd/SqI/ZVTtl
	XTiYHXWCbomgLUwuXrZFePNkGXRo4I0yTERvG8BVturJU/JOuLIOmcWpTqR9WFe3CO66zdExb+a9g
	iJvY+0xbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juzmO-0006gt-D2; Mon, 13 Jul 2020 14:50:04 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juzmJ-0006eE-ET
 for linux-amlogic@lists.infradead.org; Mon, 13 Jul 2020 14:50:02 +0000
Received: by mail-wr1-x442.google.com with SMTP id z2so16886246wrp.2
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2020 07:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nkDu4+NF/Jy0nw1npPjBWOEwj+80cykTcSKL8zkEyoE=;
 b=ZmtW2ht4WqM7YXMQqyxHw3ZRWguzPgBqFC2JKAMqnldEWEsJAUcbwc2bmoKXuvKdhB
 ohLnx6dHRciOiJRTxfPCFjCrEU+2qXEPZTQjSGaojFkCaf6eucv0LMOlOH5ybPM6rBxY
 tDPXuEMK7uUVfDp3zwVJ2KxMPq7Hr81fGJ9+9pNX7BcxMW5GNb707zAllgt9brug1YNA
 C5iAFICTeYYWHDJz2rbibn+U9WTtjaFxewwzqY+I7CTq4Iw2/NIsi2sAK7h9pWrxK98S
 7uCOBoC0BEbMzYAIM8CRkDzn8+axiDVRtayVn3F4BqiORSe8IAY5nVQWBQKD31MV3mWw
 wsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nkDu4+NF/Jy0nw1npPjBWOEwj+80cykTcSKL8zkEyoE=;
 b=RcjFOFnf+SGMvw5+pLA0fE3gTXah1D8BOhOSrKx6uDmS1fVh7kdXVJY7out+iMgIgE
 GOG75QjqHeSBE6/wWLVTbbmCVv0l6UWI7l9eSpwqzMryKia5gy74TEwcpxcs/FdrAL65
 FwGWO3SZ1nSKVGSvHLeqTXc/mGp6slz5Gpct4YjnXIwtMYaO2dgw5Eoqpgm2Rqi/ECmu
 TR1CZrLvLHz3ZpOsRBNPCrri0SziTa3OgIwwmYjLqjykvyyHpEAylTuyhkmWQ8b14cbF
 nB/H2X0l9ZaghP6HwyZlM5dRV2yQvfnp78NIEXZ/NkclB1V+HYcQUnYOYWX5w2l37VqL
 pbtQ==
X-Gm-Message-State: AOAM533iBuedVp2ePs1m6qKse3H+vi835QTcu0E51uthOyoWtHR9wpPh
 8PaVXoX5ObketFGQO+8l5sbM6P4XgKA=
X-Google-Smtp-Source: ABdhPJwWZnEQwNy0uHw6fz+gVKKB5MdRFqRoRee91JUrZWtXKOGQ/CMQO9b8C5u1UFocGLb+2c0OYw==
X-Received: by 2002:adf:ec42:: with SMTP id w2mr80843478wrn.269.1594651798432; 
 Mon, 13 Jul 2020 07:49:58 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
 by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 07:49:57 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linus.walleij@linaro.org
Subject: [PATCH 23/25] pinctrl: meson: pinctrl-meson-a1: Remove unused const
 variable 'i2c_slave_groups'
Date: Mon, 13 Jul 2020 15:49:28 +0100
Message-Id: <20200713144930.1034632-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_105000_418258_14B947F7 
X-CRM114-Status: UNSURE (   8.05  )
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
Cc: Qianggui Song <qianggui.song@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SXQgaGFzIG5ldmVyIGJlZW4gdXNlZC4KCkZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBi
dWlsZCB3YXJuaW5nKHMpOgoKIGRyaXZlcnMvcGluY3RybC9tZXNvbi9waW5jdHJsLW1lc29uLWEx
LmM6NzQ5OjI3OiB3YXJuaW5nOiDigJhpMmNfc2xhdmVfZ3JvdXBz4oCZIGRlZmluZWQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiA3NDkgfCBzdGF0aWMgY29uc3QgY2hh
ciBjb25zdCBpMmNfc2xhdmVfZ3JvdXBzW10gPSB7CiB8IF5+fn5+fn5+fn5+fn5+fn4KCkNjOiBL
ZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPgpDYzogUWlhbmdndWkgU29uZyA8cWlh
bmdndWkuc29uZ0BhbWxvZ2ljLmNvbT4KQ2M6IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0K
IGRyaXZlcnMvcGluY3RybC9tZXNvbi9waW5jdHJsLW1lc29uLWExLmMgfCA1IC0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwv
bWVzb24vcGluY3RybC1tZXNvbi1hMS5jIGIvZHJpdmVycy9waW5jdHJsL21lc29uL3BpbmN0cmwt
bWVzb24tYTEuYwppbmRleCAwYmNlYzAzZjM0NGFhLi44YWJmNzUwZWFjN2VlIDEwMDY0NAotLS0g
YS9kcml2ZXJzL3BpbmN0cmwvbWVzb24vcGluY3RybC1tZXNvbi1hMS5jCisrKyBiL2RyaXZlcnMv
cGluY3RybC9tZXNvbi9waW5jdHJsLW1lc29uLWExLmMKQEAgLTc0NiwxMSArNzQ2LDYgQEAgc3Rh
dGljIGNvbnN0IGNoYXIgKiBjb25zdCBpMmMzX2dyb3Vwc1tdID0gewogCSJpMmMzX3Nja194Iiwg
ImkyYzNfc2RhX3giLCAiaTJjM19zY2tfZiIsICJpMmMzX3NkYV9mIiwKIH07CiAKLXN0YXRpYyBj
b25zdCBjaGFyICogY29uc3QgaTJjX3NsYXZlX2dyb3Vwc1tdID0gewotCSJpMmNfc2xhdmVfc2Rh
X2EiLCAiaTJjX3NsYXZlX3Nja19hIiwKLQkiaTJjX3NsYXZlX3NkYV9mIiwgImkyY19zbGF2ZV9z
Y2tfZiIsCi19OwotCiBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHNwaV9hX2dyb3Vwc1tdID0g
ewogCSJzcGlfYV9tb3NpX3gyIiwgInNwaV9hX3NzMF94MyIsICJzcGlfYV9zY2xrX3g0IiwgInNw
aV9hX21pc29feDUiLAogCSJzcGlfYV9tb3NpX3g3IiwgInNwaV9hX21pc29feDgiLCAic3BpX2Ff
c3MwX3g5IiwgInNwaV9hX3NjbGtfeDEwIiwKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
