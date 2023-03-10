Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8662BC76186
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Mar 2023 23:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPxCZ+FBOSA9MXIMwBzUf+8QQ4KtZ8nYRDXmZfwo3+I=; b=cV0yioxWh1U+bn
	b0tsS8gvAKh2pdcNeG0lNHWczqJdev3JvIx1Kbg2sDYyB4Xat+sds0QlqAmhK3NEQOlFZ6ltrpXm/
	Ve8/jZeDyKoZ6w4w3lWZ/OgP2GSIkuQBQs7nY2HKYszzKwYKlRyL1Y0/+8xhfwtHMbV8UJTJGkd9p
	Zmd/FpMzxdC9HE2G6ZZsENYHJS/2l9m/IBRk/65PqFvVX0kpPIZsiA1T2Pzcg3Oc182Kp36oStvTv
	dQ9E24Sb82J56/Lt8f3kvzwfTy2nhwLcYlJs3kRH0qZKXSB5B1q2vXnis3ealbUV2zHPLC3KEm8kC
	Xe/ClpRJfALjVXRtOx4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pamD4-00GceS-Ej; Fri, 10 Mar 2023 23:31:38 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palEW-00GNiA-IK
	for linux-amlogic@lists.infradead.org; Fri, 10 Mar 2023 22:29:05 +0000
Received: by mail-ed1-x530.google.com with SMTP id u9so26536976edd.2
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Mar 2023 14:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76/EJUTO15RzyW4Bq3aXjUUXSFzqS7eUnx+uuY+qlw4=;
        b=QY+FHC9r4+RzAXwp4hRMO7dX5kmQsDXfU75lOdEZEw/5sR6fWA7KyEW89bZ4QaKtiA
         5nMcH4WM7F79MtlVuGFWbq4njYJHE3nin7z1x5/Y62sE1/FUd9ROnyj6/etq6mfce0GT
         UxU44MXgwq+ozgNLDyH6wRr5FmUGNNLw+fwUCP8Q1mITsJ2iI7TiO14GMnI+kmZQvO2b
         /b7APHAP+iaFIBAZnYZwOMDVAnlxbRZkxoOpLaGVakb3bbfVJBUjdnbU/ryWER1uX1My
         K7WeYQ3YEjmvpVGLlt61EcqGbwxZ69eWbT1wLS4zIXYURTaaJtMwwLqRjWPfF3WNdTDp
         ZZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76/EJUTO15RzyW4Bq3aXjUUXSFzqS7eUnx+uuY+qlw4=;
        b=sSG8ckykLJ5bS6dC82qlMmWK07vxldTvtwadvDapahwuqWTeOxvje/BJ7JnG/s8+S+
         vTRzAlVgBY2CquuWJY+IKhSQG30+RTua8+tU3WlJe0vj62UUajc/Z63hbo6Mp7lGUbMY
         aTFKOlhChLGhVkFID4xDIDsD8D5NlRsoR8/jcI4VwGfPvYho3UChVrvG7KaVbikfJiwo
         jJvqP3l7bOgGBBatzZNZzUVKm+NvNlgiD11nIhk6hA15QGEeaENtP7WCIoWAKtNu8xko
         zRXvYWDbh9NclGAaDNtdlpiDkMOcv6SIG45h7U+kY9/BygXcuKtCxcB+hZZ1sCKZiSte
         /jAA==
X-Gm-Message-State: AO0yUKWn5/pbQLnmFun8lw1HTj1ahZ8fGVaRUR8X9oOKANBARfNld+p2
	0G9pNXmjReJgHHMfm8KGhtsH6g==
X-Google-Smtp-Source: AK7set9xqAwgrRfSWZTYjl4H4cCqoLWPjOPJyHkzao/CGH+3TLt7ijPQdvoiK9ldcAApOqBUnsuWUA==
X-Received: by 2002:a05:6402:3d2:b0:4ac:bde4:ff14 with SMTP id t18-20020a05640203d200b004acbde4ff14mr25348254edw.42.1678487343369;
        Fri, 10 Mar 2023 14:29:03 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:02 -0800 (PST)
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
Subject: [PATCH 03/16] spi: meson-spicc: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 23:28:44 +0100
Message-Id: <20230310222857.315629-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_142904_624674_4DE639DB 
X-CRM114-Status: GOOD (  15.35  )
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
b24tc3BpY2MuYzo5NDk6MzQ6IGVycm9yOiDigJhtZXNvbl9zcGljY19vZl9tYXRjaOKAmSBkZWZp
bmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQoKU2lnbmVk
LW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8u
b3JnPgotLS0KIGRyaXZlcnMvc3BpL3NwaS1tZXNvbi1zcGljYy5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zcGkvc3BpLW1lc29uLXNwaWNjLmMgYi9kcml2ZXJzL3NwaS9zcGktbWVzb24tc3BpY2MuYwpp
bmRleCBiOWY4MTI4MzdjZDYuLjJlOWNiYzUwN2UyNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkv
c3BpLW1lc29uLXNwaWNjLmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLW1lc29uLXNwaWNjLmMKQEAg
LTk2OCw3ICs5NjgsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtZXNvbl9zcGlj
Y19kcml2ZXIgPSB7CiAJLnJlbW92ZV9uZXcgPSBtZXNvbl9zcGljY19yZW1vdmUsCiAJLmRyaXZl
ciAgPSB7CiAJCS5uYW1lID0gIm1lc29uLXNwaWNjIiwKLQkJLm9mX21hdGNoX3RhYmxlID0gb2Zf
bWF0Y2hfcHRyKG1lc29uX3NwaWNjX29mX21hdGNoKSwKKwkJLm9mX21hdGNoX3RhYmxlID0gbWVz
b25fc3BpY2Nfb2ZfbWF0Y2gsCiAJfSwKIH07CiAKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
