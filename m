Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9B0C74A4B
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Mar 2023 22:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryzMBqrGB5ybj+6cfZ9LKEa2Nx3i2r0n11aAJ6wsKe4=; b=ge2n/K4XUZ7hIe
	G7lPM7NS9Gcxf9pSGAMlFDbYgFnxvI/tux/MefZL2F5Y9q82UWBiJhZwQBEe5zLecJA+FduTejTFb
	8aGTT3obU83K4smTwXwuHG/rivfwoACCvLFl967rvpb1YtHMEP8jb0tbnkdorNZZ+P98LhjXSLlC9
	d/jWh6t3rVq+bMjcdO5jCGuxhzybw0Sa/3cOv/cJt/P1pvJCQuvbcxscHkKZQSHGtaUB8j1K+5brQ
	FTdSVJUudwBH9jBDNXahrbI3bY7ZuR1wLCIqdQjcOtdk6ZbI7gTh93pkEPi+aGZZocu1fgnuYHJhx
	EniUyeyWEhZcr6jTgvVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palUp-00GTXM-7O; Fri, 10 Mar 2023 22:45:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palUe-00GTRp-78
	for linux-amlogic@bombadil.infradead.org; Fri, 10 Mar 2023 22:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=G/4k4EDtHTwsGrCFmt9A01h3SrewNsUPMEHGiEs4FeY=; b=D5SE0mSexO1oiTo9y330StV7Ah
	o62PTzVAX/V047m4UcJtssAWTRT92n5Lmtl+IN6TrNqnSCErcn/r2gZj4k4CqKVylu28kbv7THztS
	fmsK1hVFRudYAXO4nq5IQnwUlwWwGpCxZgtsItVb7+sJygjwq8wc9LtmhHJ9k5q+rlSJ6G+801dEn
	Un5WZ05LHSkGw8DfTuMyI0OLbQB1Ra58yf0hPb8eC3+a6SHJ0vuD3x3PqWAuRErzWfjjG2npnKrL8
	4OipkEpoI6JXnO87MAIub85+zeDbrNuj68ExO33MP7C+j35Kq/3J/v53k3dhGa1V6NN3S5puzbNE9
	85T3E4eA==;
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1palEe-000aoW-2O
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Mar 2023 22:29:15 +0000
Received: by mail-ed1-x52a.google.com with SMTP id cw28so26493468edb.5
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Mar 2023 14:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/4k4EDtHTwsGrCFmt9A01h3SrewNsUPMEHGiEs4FeY=;
        b=TVdIMwMMrCKmZDAj8bAXcosuz/F+qKLurmGg2tk/JuU0WAeW1zZ3e/5WJFm5zshZxi
         SqKw726uNsBDbGIY2pbSJBufxH78N4ZLW50mMwf71ESTokrIR6XsO7x+je/tAR/wbxyt
         WYxUzBPA1whbkcBPF2K2TOZDDwRH3y2IRF3GPsWajArp2ggTf55DAr1Qk6EvT7FlhPYH
         4+455PnI4SeL9cFUeXrD1nv1O4nsCQkfBMd95Ge0+t3wZzK1f5SMXGVkLeHw7CQi3s+5
         GMsfdtZzfaM1HAp/g0JL3uTpA1omwZTAUUW/0ofTxY2+KChGu+++CqNGcjjsOYO2bQ12
         1obw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/4k4EDtHTwsGrCFmt9A01h3SrewNsUPMEHGiEs4FeY=;
        b=lAH/MF5gDFKz8LGnB3uQLIJBCc3qUjo66Z4ZgNoQL5rXYRqgiK4EWhMvzbiavGB/wB
         ss4zHDryMhq7FVFgPj2w5Hmxe4wfBZMRDLEtfY5vSDZ2BtUSRXn7gEqks22MArgpEl18
         cCmbi6xZseRfc+oRW78nhmfysuXjtskKp79vvLPhSWcD+V0CbvSYBn3N6UOxDgIoKRX+
         SJLmex2bdvHe0zfWQtmQo4mPvYSKkz2SDtJ/EpffZnL6Hww+UnFO2LfZI8BYZ/miqCBv
         smz9aDj12jWbxixVKf1i/PxDGPY6g3y0cMyDmiEPiUhznNoHZAyBWG14d6ji6cHBKArS
         nyUw==
X-Gm-Message-State: AO0yUKU3NIcnk2fx4auqZw3usRGkb7E+7ubUfG4HClnb4RRzccmKWnrS
	LwGIf44J9VSBCMrQ+VwXP4leKg==
X-Google-Smtp-Source: AK7set+a17yOf6VzbwUc0CZ6vTQ58vWyCjXfAH5/wUdFVgNoDsRk2++Q9bB1eIS7zKuhlPF+RpY35g==
X-Received: by 2002:a17:906:9252:b0:8b2:23fb:dfd9 with SMTP id c18-20020a170906925200b008b223fbdfd9mr27625552ejx.39.1678487352519;
        Fri, 10 Mar 2023 14:29:12 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:12 -0800 (PST)
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
Subject: [PATCH 10/16] spi: pic32: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 23:28:51 +0100
Message-Id: <20230310222857.315629-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_222913_256479_D809C55F 
X-CRM114-Status: GOOD (  15.08  )
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
biB0aG91Z2ggaXQgaXMgbm90IHJlbGV2YW50IGhlcmUpLgoKICBkcml2ZXJzL3NwaS9zcGktcGlj
MzIuYzo4NTc6MzQ6IGVycm9yOiDigJhwaWMzMl9zcGlfb2ZfbWF0Y2jigJkgZGVmaW5lZCBidXQg
bm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6
IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KLS0t
CiBkcml2ZXJzL3NwaS9zcGktcGljMzIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1waWMz
Mi5jIGIvZHJpdmVycy9zcGkvc3BpLXBpYzMyLmMKaW5kZXggNWE2NGFkMGM5NGZlLi4wNDg5NmU3
ZmYyYzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3BpL3NwaS1waWMzMi5jCisrKyBiL2RyaXZlcnMv
c3BpL3NwaS1waWMzMi5jCkBAIC04NjMsNyArODYzLDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShv
ZiwgcGljMzJfc3BpX29mX21hdGNoKTsKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHBp
YzMyX3NwaV9kcml2ZXIgPSB7CiAJLmRyaXZlciA9IHsKIAkJLm5hbWUgPSAic3BpLXBpYzMyIiwK
LQkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKHBpYzMyX3NwaV9vZl9tYXRjaCksCisJ
CS5vZl9tYXRjaF90YWJsZSA9IHBpYzMyX3NwaV9vZl9tYXRjaCwKIAl9LAogCS5wcm9iZSA9IHBp
YzMyX3NwaV9wcm9iZSwKIAkucmVtb3ZlX25ldyA9IHBpYzMyX3NwaV9yZW1vdmUsCi0tIAoyLjM0
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
