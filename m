Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754A5C6FD1E
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Mar 2023 23:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/fx7ctr8X4C8xLfuy1KsnX03BiawqxIpxW9cYQEH5e0=; b=nPojRVekDQP6RJ
	Yz7CGLwy6twkpetVc1Oby76QYHXw0s44VzfC+in3+StwHjVTY0uJrHfVDLTA5zban9/Yfs6IuA5Og
	vu+0k1Xz632upV5UjYuTRWI8QmkL6TlvBGKTl1SojFbTReqfvjgzk5v3HMf8ZK03CLBDG0onPyT3M
	5HPUP7mU94hjwLHgkNUkA9383jjLxifEx8MWLyN5dJCt4MjbCm0dyspYWgw/hXj+X88P35KiA0JXI
	dxDsXwqgMaX5vsPyvmc05iyp65T2VlMEcud+i9M2VrdZkhng2Jzg/DuPAqHen7T0Z4tSh84vNZ0/Z
	+2CyHihLOmWgR489ZVDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pamD4-00GceJ-6T; Fri, 10 Mar 2023 23:31:38 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palEV-00GNgi-N7
	for linux-amlogic@lists.infradead.org; Fri, 10 Mar 2023 22:29:05 +0000
Received: by mail-ed1-x52b.google.com with SMTP id i34so26419786eda.7
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Mar 2023 14:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fq28ODdLGdVrfwBbBqpAueEDlCBrl+e8GLAYfu+UZE=;
        b=YErFPXDcruuSCyquGlOEihSnf5WEX5TfRFUNUpk794YqO+3d2tGrz+SAukBB6cHeeY
         6f+NU1SAcvVQh206gJNQOLThJ1SeBSThVgv4zR1bXtJdov0FTIYm4pigzFzvKgXKFaCM
         O7ycG+h5VlOwwhKy3GFtQqV/qtNb0b1AcXMZV0wUHhPD7Basl1eKhl+JCDJqKZPWCnPT
         eiAullbhW79U2YRzArw66eDxZ8lqWSfLdRvprB+5f0RyrMcAqDsKHRdrQj5P5AgRZ/Kl
         lwTOuZL3qbuXuP2Vo/rSeZNkzRlTRJvk32snxMw8+KJAOonVRC+QO+iD6crmCf0gb4de
         Lk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fq28ODdLGdVrfwBbBqpAueEDlCBrl+e8GLAYfu+UZE=;
        b=BAmYqO9y3N6r+XEkckDkeV2wrY37U0d1H6XgF88Z69/tUuoFScKkNEPc3JqrYwLh/Q
         b+IEVSSeJQ3p9EBtLTyb/9OBV3hSz1omlUJIWe5RtTBcqeYQ06WYmvyv3F953IrBNH/j
         QHjHvE5YPAfptOd+54co1/VLr7duZnTp+rktY9+IDItPGIi2PpbI4gIbM1x6EiOXeEwZ
         UA3bn6ZnkW5jeMLEoB37xJEm9BUkhweXl/xTn8vZ1E735Dvd9QB8pyrQMboKoqHMlhV3
         zx92CLFgt6KOeoKXfJNE0Jhj5dOcFFqGlTkK+FC5aG/XZObBY6gNhAhRHHW5GGLtiWIo
         w3JA==
X-Gm-Message-State: AO0yUKXXEoAm/j31BaiImNWAcyyoooBfl0ZhQ/6jwUxWQliFgbmdj09T
	wBryivqpTan/Fo9tU1y7eJOeuQ==
X-Google-Smtp-Source: AK7set/MN1PmYbla+81mnyLbnX24dl5dsGO4HTEAGHBQdx8CwTY3seLWUkHX5GZDY+FpxIzcnKNvFg==
X-Received: by 2002:a05:6402:1804:b0:4fa:315a:cb55 with SMTP id g4-20020a056402180400b004fa315acb55mr597332edy.21.1678487341960;
        Fri, 10 Mar 2023 14:29:01 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:01 -0800 (PST)
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
Subject: [PATCH 02/16] spi: mtk-pmif: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 23:28:43 +0100
Message-Id: <20230310222857.315629-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_142903_775333_C2DE5D25 
X-CRM114-Status: GOOD (  15.13  )
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
biB0aG91Z2ggaXQgaXMgbm90IHJlbGV2YW50IGhlcmUpLgoKICBkcml2ZXJzL3NwbWkvc3BtaS1t
dGstcG1pZi5jOjUxNzozNDogZXJyb3I6IOKAmG10a19zcG1pX21hdGNoX3RhYmxl4oCZIGRlZmlu
ZWQgYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJsZT1dCgpTaWduZWQt
b2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+Ci0tLQogZHJpdmVycy9zcG1pL3NwbWktbXRrLXBtaWYuYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c3BtaS9zcG1pLW10ay1wbWlmLmMgYi9kcml2ZXJzL3NwbWkvc3BtaS1tdGstcG1pZi5jCmluZGV4
IGFkNTExZjJjMzMyNC4uYjg1ODM5MTdmYTExIDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwbWkvc3Bt
aS1tdGstcG1pZi5jCisrKyBiL2RyaXZlcnMvc3BtaS9zcG1pLW10ay1wbWlmLmMKQEAgLTUzMCw3
ICs1MzAsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtdGtfc3BtaV9tYXRjaF90YWJsZSk7
CiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtdGtfc3BtaV9kcml2ZXIgPSB7CiAJLmRy
aXZlcgkJPSB7CiAJCS5uYW1lCT0gInNwbWktbXRrIiwKLQkJLm9mX21hdGNoX3RhYmxlID0gb2Zf
bWF0Y2hfcHRyKG10a19zcG1pX21hdGNoX3RhYmxlKSwKKwkJLm9mX21hdGNoX3RhYmxlID0gbXRr
X3NwbWlfbWF0Y2hfdGFibGUsCiAJfSwKIAkucHJvYmUJCT0gbXRrX3NwbWlfcHJvYmUsCiAJLnJl
bW92ZQkJPSBtdGtfc3BtaV9yZW1vdmUsCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
