Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC2FC6FA99
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Mar 2023 22:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lp8PSq42OlkfBwc5uYKS2eVwSllzL7//rGPKWslmrpA=; b=cm/yV3J37dSzru
	tyFnZ0B+0C2YxtB+AflgaV1246T03Wb53GdANOxAKVRPnEGD0f6XLImmjZI+xmrXOkYLSzHv/7Qfa
	io7vIwTfF0S9/03OjqvEzAHsQMPVl/IPfNV5/qNz4bgVw5Bk8uLn1xFKmUACJDesW9UCpnYTsu4hX
	iW34LRPV2g+qi3JOrU4j/d3ZTmTwC5k7D3yh8DBS/fbIvnnYm6eUwWin+4YG10b3E9GGxprXEeFLx
	abAF7cGErWZ137ctl1iMwiU6G6Z/p/DZvpquZ6sIbEHCb0WhV80SZhMTVtANbX6NXLI4APDYM1Zbu
	L4LAE9Ci9wLzlhV4jXZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palYW-00GVaF-Rc; Fri, 10 Mar 2023 22:49:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palWe-00GUbD-Fi
	for linux-amlogic@bombadil.infradead.org; Fri, 10 Mar 2023 22:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=M3WdhQD5rAXvneo2z5R6lNFWc2ZYKuwan4rS9Bakw0M=; b=AtCwkXEpQpj40DxKiLHZrPcU2T
	PVAhWubAaRdm+jiI3LfH0x49tlrahWLQ+PYSOP6ONkmf4VFSJNWsOs/1NJg1ikmFI+KBO8+LjfJUd
	eU3N0o8+ADl3z5K5CdnldTlNzf+Y6pahzohC+J5BKlzJ6wBvpjmUF5RcfkwFMI1gkGPL/pEJJD4Rd
	smnk3JmQUZUhXnISuGJqtPoqg9QF9xuGRlSNrChys7Z4byiRllFJBUFv93WL4qS7iDcDF7BKs+as1
	4gVhXCgxIeq1Y8Cw+5dqCc2Tsw/dgqh79AfC6sFXXlJ7YUwMayuvKsOSNlKADPWZjbFnPk7YpUEqY
	0Lpnr9tg==;
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1palEl-000asR-2i
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Mar 2023 22:29:25 +0000
Received: by mail-ed1-x52b.google.com with SMTP id k10so26371861edk.13
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Mar 2023 14:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3WdhQD5rAXvneo2z5R6lNFWc2ZYKuwan4rS9Bakw0M=;
        b=FH0mRWxSv3dhvkjeAGdGWC3XJUniNQrv9dUJ0DlkmSHDBsR1cMKPip4P5qxshWquPT
         o30zH/P6OAMsiqd3b0gJ9NO9k37kxCWE+3g5o0qJuGCMqEhIOhBWbVB55yR9EIYjwikl
         MUi7ljpJcIO9BHqSC8yhPoVOk7jtPv7Jy5AuYh0rPtyhy+iFBBXeYwq2rREH8uUGRdYS
         /P4xnqadCBAt+jcFiqqZPyh2zUeyHC2ZbAOtBHuovmw213/b91juyL9shSC7qo/JEzMk
         8aInCsXVd2L2IU6uBunWkv86D74zDz99X+zHVkraLs4W584lOZl9HtWsQzBPfqK2Xq7Q
         dqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3WdhQD5rAXvneo2z5R6lNFWc2ZYKuwan4rS9Bakw0M=;
        b=Sj+FljS2YSqkpqXEIlxwmFtRunwRlgibzQxvtoTAX2M9WkXiVAQDPKdve2SPjjgHOJ
         A0ZXeXjRqIkH9flT8kFh+LD3cEK17KWxcns8fsKE05lUsh3tpNuKJGGxIfEefKc/1AIj
         qmre+ovQTIwDH7i7MXz1fYKc1DuZTZoWy1SNwhZYzLCwTleCoVj/c8Hk9JLgYk4K6jwf
         BNMC1r3FFt4vvNvc7x4lmJSs0YTda76H4G6iwTUXZQ2wK78QgxY2vtlyDKX/wrzr8V/S
         VAhykQHVIbu9cOFU+LzZjy8bQ/m1FpaK9Jyj7Y6g/2K91c5qRe+relMCC8RCw9bGWBgb
         oWCw==
X-Gm-Message-State: AO0yUKVQUY7Pon9I/wAuQSVlwh5Gk88OsjQr24hj5D8hiu/0GhyhrYZq
	k2fbtWXSFW+VWiIsZhrmSQZFCQ==
X-Google-Smtp-Source: AK7set/aeDYIEUgYw5BDy72ya0/wLgG/2r8MQ4JILKTIDWdyXnTsT8LTeyXPCHZ13QKftG5RxlCVrQ==
X-Received: by 2002:a17:906:4e15:b0:883:3299:91c8 with SMTP id z21-20020a1709064e1500b00883329991c8mr26654805eju.55.1678487357988;
        Fri, 10 Mar 2023 14:29:17 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:17 -0800 (PST)
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
Subject: [PATCH 14/16] spi: sh-msiof: Mark OF related data as maybe unused
Date: Fri, 10 Mar 2023 23:28:55 +0100
Message-Id: <20230310222857.315629-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_222919_914591_4415A36F 
X-CRM114-Status: GOOD (  13.18  )
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

VGhlIGRyaXZlciBjYW4gYmUgY29tcGlsZSB0ZXN0ZWQgd2l0aCAhQ09ORklHX09GIG1ha2luZyBj
ZXJ0YWluIGRhdGEKdW51c2VkOgoKICBkcml2ZXJzL3NwaS9zcGktc2gtbXNpb2YuYzoxMDc2OjM0
OiBlcnJvcjog4oCYc2hfbXNpb2ZfbWF0Y2jigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJy
b3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3ps
b3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL3NwaS9z
cGktc2gtbXNpb2YuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1zaC1tc2lvZi5jIGIvZHJp
dmVycy9zcGkvc3BpLXNoLW1zaW9mLmMKaW5kZXggZDgyOGEzYjM3MGI4Li40MTJhYTE4ODJlNWQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3BpL3NwaS1zaC1tc2lvZi5jCisrKyBiL2RyaXZlcnMvc3Bp
L3NwaS1zaC1tc2lvZi5jCkBAIC0xMDczLDcgKzEwNzMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHNoX21zaW9mX2NoaXBkYXRhIHJjYXJfZ2VuM19kYXRhID0gewogCS5taW5fZGl2X3BvdyA9IDEs
CiB9OwogCi1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzaF9tc2lvZl9tYXRjaFtd
ID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc2hfbXNpb2ZfbWF0Y2hbXSBf
X21heWJlX3VudXNlZCA9IHsKIAl7IC5jb21wYXRpYmxlID0gInJlbmVzYXMsc2gtbW9iaWxlLW1z
aW9mIiwgLmRhdGEgPSAmc2hfZGF0YSB9LAogCXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxtc2lv
Zi1yOGE3NzQzIiwgICAuZGF0YSA9ICZyY2FyX2dlbjJfZGF0YSB9LAogCXsgLmNvbXBhdGlibGUg
PSAicmVuZXNhcyxtc2lvZi1yOGE3NzQ1IiwgICAuZGF0YSA9ICZyY2FyX2dlbjJfZGF0YSB9LAot
LSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
