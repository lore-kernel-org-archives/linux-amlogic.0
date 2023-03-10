Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51000C6FA99
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Mar 2023 23:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+2/FQWlrSOtdU1tF9QxgKzrdqnAMi1Ffrhe85viIrs=; b=Nu7tNPS0wpfsEY
	/wbTdLIKNMkjH/vR/UH70zP4UNjxO7ZZTB9RK4obTI78aDR3hx8315Yq5WF+acr/9ekjtqZIWTTDs
	Sy78Bl3g3tV6CgeKeXxTIMNJJVfEcsGqlyVny1bvLzt3Q5DtZ3wDpyPHtb5Qvatru7xE0mHjIX3xj
	XJPE4GlhUY3dMKSgNsU0UOuX/cCPbu21hYcc9e4Ar+8nIQFonO/W86K2b4fS66fcgeSrBPROaAObJ
	b8Fjcft18qUMS4yEEADB/U+aEcJgifH+C3eQOuwjThaYi9xyp2jcGW5ZbJzqmKdiwRtTHz5/prTCW
	PmHFZcdz4y3j8qcY2yoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pamEv-00Ge8B-5k; Fri, 10 Mar 2023 23:33:33 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palEc-00GNiA-GX
	for linux-amlogic@lists.infradead.org; Fri, 10 Mar 2023 22:29:14 +0000
Received: by mail-ed1-x530.google.com with SMTP id u9so26537783edd.2
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Mar 2023 14:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TH+2UFUJbKaymij+b3WrxcVf44nTpYHKEBIPAlM6LWE=;
        b=TavnzZF5kaPHm0mujD/3h+51xHQx7ZCx8G31x/bxMt3RbfzsnQrtXpv04b4bbdXXS2
         T3YKb7NeqFFdymYQG+jvv9I0fUbqvS2izxLVgYfVePxlIpQGz/thUXh2BQxKLm8MCNAz
         sqBFEdjft3Z9ikX2JNWpwOMLLRq6YTg/BjHv6LDnqrvnSszc5MkiEHODmrYWeiqZDifx
         E4IflVpvfeyGhsWS7EafD2stGzcVrnCIPRNo7Jmd2BmAfOfGDaBZKuAbkZGVdpLJ3WYV
         /KflYWU3yCTEX4qTuYr+a/+Gk0rNerW/kEfQveIZw3hp2m88bpisRoINfGmCaE4q49A7
         f2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TH+2UFUJbKaymij+b3WrxcVf44nTpYHKEBIPAlM6LWE=;
        b=iQWCo1+GJ4KAXDh3hG0lOssFxYMXpcfO0zWH3or+SmNkNkjmozQVnwrPPWLQR9Qhur
         kJbGp8kDgY3WLJlh3xMH6eC6TaiEBWzF8VbQafJgM2nxtzdKDT1+Qrwk08HJXBRY5FTp
         s1/REmpSK2+QtePmU4uZJLXzSm9sk3PBmzHLXD7FRvZJAOJtj1V2xnv6UwlpPUpj58Sn
         zM+3jm0Ci5O+9tIodCeYQ/bqm/T6Q6+uXoWjzDqcwIFYwIeBNHWILX79+N4QHjHf2zxI
         SNkprnQ7Csuir7AciFqCWrAg0Qs/j1xOML0UUeZv/tBtR11EQe+DqsFGLcSVMca9Fijk
         9JGA==
X-Gm-Message-State: AO0yUKWNarIXi4e3jZYgh2l6bTFw9oEbghd4pfqEYXj50OAT3ndc5oS4
	ndM9mLwY7tEOZolvXvUPH4CQpg==
X-Google-Smtp-Source: AK7set9cWJOlJkNbsIRY/kVw1cHXOuGBRabzfO/YisfOBi6mPLmqHO4D5ZvGGrVNRhOqaiOFRt27aA==
X-Received: by 2002:aa7:da49:0:b0:4bf:3cdb:fb42 with SMTP id w9-20020aa7da49000000b004bf3cdbfb42mr25096957eds.6.1678487350030;
        Fri, 10 Mar 2023 14:29:10 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andi Shyti <andi@etezian.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 08/16] spi: img-spfi: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 23:28:49 +0100
Message-Id: <20230310222857.315629-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_142910_592657_9C10A2CA 
X-CRM114-Status: GOOD (  15.42  )
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

VGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIERUIHRhYmxlIHNvIHRoZSB0YWJsZSBz
aG91bGQgYmUgYWx3YXlzCnVzZWQgYW5kIHRoZSBvZl9tYXRjaF9wdHIgZG9lcyBub3QgaGF2ZSBh
bnkgc2Vuc2UgKHRoaXMgYWxzbyBhbGxvd3MgQUNQSQptYXRjaGluZyB2aWEgUFJQMDAwMSwgZXZl
biB0aG91Z2ggaXQgaXMgbm90IHJlbGV2YW50IGhlcmUpLgoKICBkcml2ZXJzL3NwaS9zcGktaW1n
LXNwZmkuYzo3NDY6MzQ6IGVycm9yOiDigJhpbWdfc3BmaV9vZl9tYXRjaOKAmSBkZWZpbmVkIGJ1
dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQoKU2lnbmVkLW9mZi1i
eTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgot
LS0KIGRyaXZlcnMvc3BpL3NwaS1pbWctc3BmaS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3Bp
LWltZy1zcGZpLmMgYi9kcml2ZXJzL3NwaS9zcGktaW1nLXNwZmkuYwppbmRleCBjNjRlNGZkM2Zk
ZjAuLmJjMzYwZTc3OTkzMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkvc3BpLWltZy1zcGZpLmMK
KysrIGIvZHJpdmVycy9zcGkvc3BpLWltZy1zcGZpLmMKQEAgLTc1Myw3ICs3NTMsNyBAQCBzdGF0
aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBpbWdfc3BmaV9kcml2ZXIgPSB7CiAJLmRyaXZlciA9
IHsKIAkJLm5hbWUgPSAiaW1nLXNwZmkiLAogCQkucG0gPSAmaW1nX3NwZmlfcG1fb3BzLAotCQku
b2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIoaW1nX3NwZmlfb2ZfbWF0Y2gpLAorCQkub2Zf
bWF0Y2hfdGFibGUgPSBpbWdfc3BmaV9vZl9tYXRjaCwKIAl9LAogCS5wcm9iZSA9IGltZ19zcGZp
X3Byb2JlLAogCS5yZW1vdmVfbmV3ID0gaW1nX3NwZmlfcmVtb3ZlLAotLSAKMi4zNC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
