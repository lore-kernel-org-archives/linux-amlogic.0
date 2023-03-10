Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A3AC6FD19
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Mar 2023 22:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6KXkhU2Ej0zIUxvgLSbUECHlBFUTgU83aFTqLuaYUo=; b=eb6C1bDtAorcgi
	4mmKEr7+0J7SafYLHoCn/ZDkm/ScHiWoiD1nlQEK7Ma+Px8LbkB3jC1ALkDDAKDFDeZenbxpHL46+
	bvugME4zlutBgSmQFVgqYamuUzhMBDL65zYAV3kqRXxqCZfrkKmVpZBP+G1yAE4JoiyZVCOsn3b1R
	htK2c6bXzR+X5TQ6xxTo09Z1NLM02Lhwuz43F5LOCWtPCw1tcZkRnOpgjEXxQ0vv0SYcbc7UOIGtI
	UeY4NO/qLkDevyoto0PGKWDXGlST3v3mGCB9am//HJtb7c92T5A1sOAa+NsAy5PzONsXOmISuL3pm
	jhPnU025Aa6Mu53VNcWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palX2-00GUm6-PG; Fri, 10 Mar 2023 22:48:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palVj-00GU6H-9k
	for linux-amlogic@bombadil.infradead.org; Fri, 10 Mar 2023 22:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=ADHlp/biBCVZeifGXqje13pwL1TD/yH+Vs4GNRSOSmk=; b=Y3gwWJJhganOm7UkfATlzSlIWy
	2cL1mHMHxLFQBHUG/wDw1Mj7PzlyFuWUDoJjhwiOx61+s3BiHHkIud8EHqWJ8P60NZjlLE8465brm
	vKCB4L6AaqFOy7mJldPzK0Vw+FHZTMbOdhelC911Z+bgAxUG9mCeX7TelRpPDkRkcIbIw4yjk2dyT
	QALZ6YTSX5976xMIW5sOJxcNJN2bnB8qhimUvxPfScMPmTOFALzPznMhnEbqgfBwrZSpX1YrU3BMw
	8h0IqWCkPWh1boFbiDe+e+aN4AipYgLF0VsBoHY/MRtaTrOv0nBpAVTanIFtQngx6HWz2na1UzsKh
	Ov7DbsbA==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1palEZ-000aoV-0x
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Mar 2023 22:29:11 +0000
Received: by mail-ed1-x531.google.com with SMTP id u9so26537182edd.2
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Mar 2023 14:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADHlp/biBCVZeifGXqje13pwL1TD/yH+Vs4GNRSOSmk=;
        b=gOjP1UUs30lsqxRQ45sMLZli5wdZwOUprEKASjWMuOlyLzQDeiBSD2Hq3tIo+JrpKI
         AArmC+ZLrunGz5fN3pTsr9FDr1XBx+iXT2ewlMt4mqhfD1/xs0oPen4jvt8byPCJmURq
         oPDOovgdqKMczeymwr2b7yNBm6QACG+fmkmSzHtc+G9+qsU4Ol1bCgf42TFMSBv5mo0z
         2prH2dORIW8Fj83FHmH5UmMl5Hv7Q0/N53UmQ05E2Zvih2Taqzkpmw+w+q7nolMec0/h
         +ntxOzSypN9XSEK03IgE8Bm20Ofus/MK+h5mh+VvTIfDF5G5gnoSvhCZL49djmgt7RwL
         IDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADHlp/biBCVZeifGXqje13pwL1TD/yH+Vs4GNRSOSmk=;
        b=wmNxrRjcdCnKP35BQrwglgDy95X8kFytesLNNxgUTMNkThd2p63D+PQ6pRj+GjnnKC
         eJ0HWcCUoUuh7on+e55eBD5avRKDLDz8hwmgjcn8qUfiyc0EhrUOQPSuoBS+RCT0/Qfb
         ledxE5sm2GMpFEi8o4uxqUydFIb9afEHQnz8xBVmNMcdckIkDQHqy7d/o+wH9f0D4me6
         lKl8rgvPd9INEJHALOJ1G4qxV0mqgelxKYnHvKKE5jOJNupZnA8W4ykGl/jfO6FWcRUS
         6GBoxeB9i2fd//RmKwCTQi1+G96cJlzRDvaaMoEaKhWjpejuJMb3Xv73ObMFdU15iIfO
         frjw==
X-Gm-Message-State: AO0yUKUP3aw5D8QJEMCuBY/YDUC+35fZqPgMuQ+N/2XcdbVkks42XovE
	TfjXmxaGql3FffM8jl1ufsjs7g==
X-Google-Smtp-Source: AK7set8jBrx8YyuYtrKMeUiH9xfKEhHMLTU3KB16tvrIfpqUWe0eJHY4hKaNb7RoSr0Tp0Ya9mPiGA==
X-Received: by 2002:a17:907:cf48:b0:8e0:4baf:59bb with SMTP id uv8-20020a170907cf4800b008e04baf59bbmr28471712ejc.22.1678487345059;
        Fri, 10 Mar 2023 14:29:05 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:04 -0800 (PST)
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
Subject: [PATCH 04/16] spi: meson-spifc: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 23:28:45 +0100
Message-Id: <20230310222857.315629-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_222909_141705_2A1144C0 
X-CRM114-Status: GOOD (  15.29  )
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
biB0aG91Z2ggaXQgaXMgbm90IHJlbGV2YW50IGhlcmUpLgoKICBkcml2ZXJzL3NwaS9zcGktbWVz
b24tc3BpZmMuYzo0MzQ6MzQ6IGVycm9yOiDigJhtZXNvbl9zcGlmY19kdF9tYXRjaOKAmSBkZWZp
bmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQoKU2lnbmVk
LW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8u
b3JnPgotLS0KIGRyaXZlcnMvc3BpL3NwaS1tZXNvbi1zcGlmYy5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zcGkvc3BpLW1lc29uLXNwaWZjLmMgYi9kcml2ZXJzL3NwaS9zcGktbWVzb24tc3BpZmMuYwpp
bmRleCAwNjYyNmY0MDZmNjguLmFmODMyZmJiZjI1OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkv
c3BpLW1lc29uLXNwaWZjLmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLW1lc29uLXNwaWZjLmMKQEAg
LTQ0Myw3ICs0NDMsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtZXNvbl9zcGlm
Y19kcml2ZXIgPSB7CiAJLnJlbW92ZV9uZXcgPSBtZXNvbl9zcGlmY19yZW1vdmUsCiAJLmRyaXZl
cgk9IHsKIAkJLm5hbWUJCT0gIm1lc29uLXNwaWZjIiwKLQkJLm9mX21hdGNoX3RhYmxlCT0gb2Zf
bWF0Y2hfcHRyKG1lc29uX3NwaWZjX2R0X21hdGNoKSwKKwkJLm9mX21hdGNoX3RhYmxlCT0gbWVz
b25fc3BpZmNfZHRfbWF0Y2gsCiAJCS5wbQkJPSAmbWVzb25fc3BpZmNfcG1fb3BzLAogCX0sCiB9
OwotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
