Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDA7C6FD19
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Mar 2023 22:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5x3luo2cuIVYdIjfgpE2To38ZmE4uBf5fHiGOr0tqc=; b=QDH4bBXTDJs70L
	/DrSELr2bKRXNzIixm64V+Pgk4iLagYAkaCjQjYnX2yPOKErmFXPJtmEBxhgYEXeTMRskRGmvj+3O
	zoD7m3kcItuNL6IoLOMW7I9UHhv6t/DV58T8oyWzqpU14PLc7/wcufW7zDK3u51FFpsOIPOYcZwnu
	gdeCPUlJ7l/TqDPYFP5tjJd34BdCmq3zPeSWsQHllA6SGe/jgXoaGmsaZ4AD6oWjYEhwOS4fAWLrE
	8oWUejqRl3H9Gp3OTtmervfhoVvQ7HHTGmZVg8zCHucMc/XGTcUQUPTwESuGK09sI7el1muCi7VW4
	h/V7Pce5XgjW44refw7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palUs-00GTZk-BL; Fri, 10 Mar 2023 22:45:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palUp-00GTRp-Me
	for linux-amlogic@bombadil.infradead.org; Fri, 10 Mar 2023 22:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=/eg1nDT/DWvLF5qBMG6NeaUBghGjrzLVFlQFnIJNFjE=; b=TeAVf+orXvTtW3eqZEIp/0G33K
	c/2paVkGKA10sR6If2VS+c1irckXLHbJGkmqojcUjC1WvhJhR4JTm9L616Ec3/eTKqBRaPyy4TWVu
	L0LMEQeDkXPVqQ2lCF3OyEXXoFBTYE77zH23+wL/ber9y4UB6vssN+O0lwSmLSF1IuG9Va4+8paKp
	ueK2k8qd93TB+j8w+mPobFouVqslQC0xWo5IYuaAcKWBdEEqNGDkUvbtjNtbmYhTobdjGDftfQbse
	PRbsnLuX/n144hXXJYn4guENy1pBjqi/ii5Wg71++8NUvH0DCtDSUrlHiVJ52qMfiarGB12fpijYO
	vDuDDDGA==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1palEe-000apm-36
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Mar 2023 22:29:17 +0000
Received: by mail-ed1-x534.google.com with SMTP id o12so26454646edb.9
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Mar 2023 14:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/eg1nDT/DWvLF5qBMG6NeaUBghGjrzLVFlQFnIJNFjE=;
        b=qaM3ve+wW6Gt6rptzeOJgI7fsp/Nf85KO2ZcgbVSiZvSdKp5Lr9KO8TDlnRG/o5Hy2
         TrgRr1jPBZGmhTO+TmX8f1piK0XT3kowYscmhQmvRScvGE8MZQdZBAsFLcZ2WF54WtRc
         0xO2YIPBIwQIHXDxIED7dRCrxLgRUUnTgunX0XIZEkmmqqnTUWtEOPRzGjHnp04BTRdI
         TssZlvrynUkkWzqMaRdxZZ/oBOMtbfo6eg1I3yZ/9Bpp3iBqBTjMxv6/p0XVZmsFxs5i
         m8j/rIeHeT9kW0DgB9tKW9eyd5uxzp0gl3HoqYAGC0GtE6t4DwGguWLoOW5e7l302rbF
         XDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/eg1nDT/DWvLF5qBMG6NeaUBghGjrzLVFlQFnIJNFjE=;
        b=mRpDuTskkTiNwfHUal14OU8MUBpQS1crfwGif8aBJl8/tJYbuXxclSqPDqknIv/7Nk
         /k6oWoiGG0pQj6lbLDVfc9MHM44r9bPsFSic+0TAjmYH09pWOPd4U76IIUBW5JWbjHWP
         NCV9guISI4Rm6WVAh24iYF5coJI4m5ZoYo519w18huKC/vHMgsKJE7bx9IEXMBWbAMLv
         rnUWjpn6FPW15WlKw3eeiAaVFa7dQORzyoqY6d5Xak2mtCYycZPEM3fykrzSX3nh+/P3
         BkMJAZyjGrfiHmSerqCHzmqKugLjYc41vGZN9fq1SMskqUK35YgrabPVnSOFQOAfm5nO
         rauQ==
X-Gm-Message-State: AO0yUKWwJ3dKP4/nb3HbEY9CuOqhLY3X437MjH7jJtNaN3kV9dT6FkZP
	p4Fc3FkEViah5U3YOTMlqlyCCA==
X-Google-Smtp-Source: AK7set9jp7Yps5gdDa4xVZKk1y8Nuy79LZJ+JZ57vzOOBv4Dpd2cWsCrZ/AoIk5/8nmVVUyC9Qydyg==
X-Received: by 2002:aa7:c489:0:b0:4af:6409:30ea with SMTP id m9-20020aa7c489000000b004af640930eamr27406591edq.19.1678487351312;
        Fri, 10 Mar 2023 14:29:11 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:11 -0800 (PST)
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
Subject: [PATCH 09/16] spi: pic32-sqi: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 23:28:50 +0100
Message-Id: <20230310222857.315629-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_222913_898852_071D10B0 
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
MzItc3FpLmM6Njk0OjM0OiBlcnJvcjog4oCYcGljMzJfc3FpX29mX2lkc+KAmSBkZWZpbmVkIGJ1
dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQoKU2lnbmVkLW9mZi1i
eTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgot
LS0KIGRyaXZlcnMvc3BpL3NwaS1waWMzMi1zcWkuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3Nw
aS1waWMzMi1zcWkuYyBiL2RyaXZlcnMvc3BpL3NwaS1waWMzMi1zcWkuYwppbmRleCA0Yzg0OTNm
MzRmY2EuLmNhODllNmQyMmZjNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkvc3BpLXBpYzMyLXNx
aS5jCisrKyBiL2RyaXZlcnMvc3BpL3NwaS1waWMzMi1zcWkuYwpAQCAtNzAwLDcgKzcwMCw3IEBA
IE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHBpYzMyX3NxaV9vZl9pZHMpOwogc3RhdGljIHN0cnVj
dCBwbGF0Zm9ybV9kcml2ZXIgcGljMzJfc3FpX2RyaXZlciA9IHsKIAkuZHJpdmVyID0gewogCQku
bmFtZSA9ICJzcWktcGljMzIiLAotCQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIocGlj
MzJfc3FpX29mX2lkcyksCisJCS5vZl9tYXRjaF90YWJsZSA9IHBpYzMyX3NxaV9vZl9pZHMsCiAJ
fSwKIAkucHJvYmUgPSBwaWMzMl9zcWlfcHJvYmUsCiAJLnJlbW92ZV9uZXcgPSBwaWMzMl9zcWlf
cmVtb3ZlLAotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
