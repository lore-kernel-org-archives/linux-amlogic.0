Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADDDC61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 08:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/x9RQgpr88lYAKJy/oxdsdjibpSsFU4L/pXEabtZRI=; b=iSkaOHc2zb0/WK
	y53olCScsJTb2zm3HQCEQaOQQwRTLU3tTZnRNf26e3L2azSEx0G6IuwhlJZlwBK3NL+P592e0F+kZ
	znU1DQr81Ffnm7TxoZrDDTJGM6MDrboEkXEVSwOeM3/rXGXnLi/uzWcXbw1DPmXwVrCayklkkJi6t
	3t+bd/2qJ4fqlaHi3v8fTTtC9NqZfWW+qefZJZaFiFWvmgLDdZUuY4fKt/gCh3RQIt75qFmY7fE40
	CgAODo3op8mR9DAq0VuS1xF1ZfF99ZyYnkqez98z/oyn94xorkO4sk9U8l7yMHVI4ypoAyMCJPkUj
	g/cc9LiOBMg8ivIDKTAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6U7-00ByDf-6K; Mon, 06 Mar 2023 08:46:19 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6Tq-00By3N-30
	for linux-amlogic@lists.infradead.org; Mon, 06 Mar 2023 08:46:04 +0000
Received: by mail-wr1-x42a.google.com with SMTP id l1so7896501wry.12
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 00:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678092358;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGgblINf1oSUrHE7vG5UT+0t4KWItuliO8YSeFEQXWY=;
        b=iOJyqICbzCSAVKWpCfc6JpA9YbSYbxHXP4R5jAPaCHCsvueoKbxUQMlYCWgeLcrbge
         Hncqgks31sxch5hNeBQqK7AENqtXDM8PGlZ6cTh5f86NaLzbFiqGx4WSupKawRwdp6E2
         f8ODmJ9eqUvR9KcceYLmgQz+4kdBCnjeNtq8Pj2ANL44gtk/vn07L4AESDHjmP5tuf6k
         0UKHXzk3KhV2mjSzwr9B+s8L7CkUKxmRrJCCeuyriS+00MWf7nCScqtTnrGZUU4Tebs2
         kxXFmIBLzAkg3p36h37mkHUvEwyIlIw3C1/VsQkbr/ALxDPLFn6quZUHHuZZWCKu9XWP
         vsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678092358;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGgblINf1oSUrHE7vG5UT+0t4KWItuliO8YSeFEQXWY=;
        b=tDq7AUmwboQR+jkkcDILkV6PF3sPLvGu6Wn5jO1D04AyceRyZ+61aoFyKw95fsnF4x
         01F6/BF8GdVEMPzw4fpbNRXgrmCoWxfKj7uu6xBoNwVtIuvW4VAQHS1PYd1cnrkhVLc4
         JFrmoeie518A9q4GEswEFuj9Puj8IZrf+u85hx1VieQVt1aaHp/tSKBkYBRsmiApFAh/
         0XMIq2O7RGoOKMR8mEsnYOVRywLJGZ2FAHVnHn3PX0M8wV3LpnA/FjM2fWqBZPtnZwQV
         f7S/HcHZvOmbhPV/poDcc+ZC0KlVAKsOKmMWizo1iFwZ6bPU7WwS/t7+N/+nvPciE0wU
         YBmg==
X-Gm-Message-State: AO0yUKVCViIkb91LcLQhTYFqfUZI0MFbi1gzF6vQ3oxzoGxzTYLAAaTG
	T+zg7HfPlAG7OTjv4pZRDZ6Uyg==
X-Google-Smtp-Source: AK7set/Gb8DdX2nE0tkhozoqEePJKzDSd7X/y8H/U/U9bI2QOtXMyKO3rmaLpFPIItSL5DQyJNdN7A==
X-Received: by 2002:a5d:5407:0:b0:2c6:676c:4af with SMTP id g7-20020a5d5407000000b002c6676c04afmr5664040wrv.36.1678092358179;
        Mon, 06 Mar 2023 00:45:58 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id h18-20020a5d4312000000b002c7107ce17fsm9345093wrq.3.2023.03.06.00.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 00:45:57 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Da Xue <da@lessconfused.com>, Carlo Caione <ccaione@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230210-relax_dmt_limits-v2-1-318913f08121@baylibre.com>
References: <20230210-relax_dmt_limits-v2-1-318913f08121@baylibre.com>
Subject: Re: [PATCH v2] drm/meson/meson_venc: Relax the supported mode
 checks
Message-Id: <167809235742.23820.6915365420027351819.b4-ty@linaro.org>
Date: Mon, 06 Mar 2023 09:45:57 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_004602_250408_A45615D7 
X-CRM114-Status: UNSURE (   6.43  )
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

On Mon, 13 Feb 2023 10:32:09 +0100, Carlo Caione wrote:
> Relax a bit the supported modes list by including also 480x1920 and
> 400x1280. This was actually tested on real hardware and it works
> correctly.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

[1/1] drm/meson/meson_venc: Relax the supported mode checks
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bf458e5b139894234444e4f88500616a8398b719

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
