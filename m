Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E973C61DA4
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Mar 2023 09:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfQSP96JiX6leLtxsXL9oYpNXxJDklcdiRaUVb6vHAc=; b=uFpS8KCSnuVL+B
	WoPOVgE4f4BfuLKhQj1NXO1Toj04/Jf17sFS9vxxukruCAGU1MaW/KroYXdInbYmFZOgyQqBj/Wn+
	+4wqMGWd/rJ7uzsvfyAH8R41r8svwuxY00J4bRyl0YYSST4+ObxcMqJ35NxJ/SbY6oZDgyvTWU9wR
	gzG5rl3qs3L1A9l/G2r4dRcBiul+kNiaud/MtLe+/UUjhJu77vhqiINhPlgNfnNFDKpQ+UCsd42mL
	lLs3aMcScI18aP2gJCdKivWtr4VRyc9irRFAOl/vZOOOW1STex1ungyFJTjlB53+aDC5/Pm8wXA9Y
	1vjkC3v6zTMv4TL3a33Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcN97-00Ctkm-2E;
	Wed, 15 Mar 2023 09:10:09 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcN94-00Ctja-0X
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Mar 2023 09:10:07 +0000
Received: by mail-wr1-x433.google.com with SMTP id l12so8325063wrm.10
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Mar 2023 02:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678871402;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7puLWjaNKxxHkmZMPs3rGGP8G3q/ZvxMzkPfypERJM=;
        b=QlRTxYWiisHphqfKIOiHko2c8h2lD9GHUUhG70cOnj5Xa6lnBJOQT7eeX0h9gN/DhP
         CFn29otV1WW/SXeD4ROOefDyzekEc5wPtapJ29wWdikuBvflWWwA+yzcuXIZEtkvr8bi
         VqZTfI5qNLemmpvC6KaV2MCcIjelpnH76T2au0wI+MQaeZj8t79EBYLm7pYbWM/qgLgb
         mp2yNXpkOLJytYHQHuR7jl/jqbghO5KS2mPQFs8m88FS8NgG2HYOEE/OcveXoRNhXFV8
         v+K+oDyhZ+P2xnb21HfL56iFo3z+/f1OONJ8Mr0t1kaP5ppql3MtNaFp2gi0FsJu5D4n
         xBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678871402;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7puLWjaNKxxHkmZMPs3rGGP8G3q/ZvxMzkPfypERJM=;
        b=w/TlxtFhA/offxylwUCpbHSp2K9oE3Z5V7ywmCncTwzf8dQ9TXzLmMLWyegJfXeDke
         8cha2mqrvRwJBGinEAT61T5RC8HSM+dNNgwxKk6b5cyDJq6WjrY314IDds0Md92bTN3E
         +rgJpfSRBnrzYYoIPHRV/BSk/u0L3fMU6VZzaTYzLRP1K35tUIbQdnYmRt5PslBJCkzb
         wzccUxXQfkXTFrmQAc8DGNc05n+tUrpfeEmUOLXn6BsyxiVze36ZgCOoLHPdPCHW2YPh
         MM51RFEHoG4lKAzYgGBzoMfopu50n7w96V2ogg2N3PPjIRY9xp0/ltRV0vmqNmBgR09A
         8aiw==
X-Gm-Message-State: AO0yUKXeUAUdzOj+X88/XQZ8xxt8n83QIRkyISpxj7AbZZg/Bj9t3qUt
	0Zkd02YPlvHQegqO97TznJwHvA==
X-Google-Smtp-Source: AK7set8n83f5Svzc5S+4zKm6dyc5e2ulRKNeqSJsXmr187cK7f3EWES/FpE2heLi5ar+WKfMU+dzkA==
X-Received: by 2002:a5d:4f91:0:b0:2d0:a74a:2b15 with SMTP id d17-20020a5d4f91000000b002d0a74a2b15mr429014wru.37.1678871402112;
        Wed, 15 Mar 2023 02:10:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i2-20020a5d55c2000000b002c53f6c7599sm4017953wrw.29.2023.03.15.02.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 02:10:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
In-Reply-To: <20230309152446.104913-1-m.szyprowski@samsung.com>
References: <CGME20230309152453eucas1p28e1870593875304648243c9dead4b256@eucas1p2.samsung.com>
 <20230309152446.104913-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*()
 conversion again
Message-Id: <167887140130.2153628.1837993177267622343.b4-ty@linaro.org>
Date: Wed, 15 Mar 2023 10:10:01 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_021006_262950_E900C722 
X-CRM114-Status: UNSURE (   6.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, 09 Mar 2023 16:24:46 +0100, Marek Szyprowski wrote:
> devm_regulator_get_enable_optional() returns -ENODEV if requested
> optional regulator is not present. Adjust code for that, because in the
> 67d0a30128c9 I've incorrectly assumed that it also returns 0 when
> regulator is not present.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*() conversion again
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=4028cbf867f70a3c599c9b0c9509334c56ed97d7

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
