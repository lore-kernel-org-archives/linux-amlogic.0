Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCAEC4321E
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 08:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAQpnVYb+coj0gfssBERh9fvTrmjxcwGFxtF0mqehtQ=; b=jZPwnEl2VpRQWN
	JWl/T/PJDrRTd1onoi8ThtOskgNpLz1+Dx4dORWA8eCBkw00zWVAahNnApYJPUT9j/LXqvmfv79Qf
	4lyk8UrTFWLhNChAv366sLwst/DgngS1lI/l8eYRzfOiWp2zN2O7Q9IshdmkfwX6Do5gRenXupnh0
	Kd9NJcZd9B52MMchSRt/qwhBKmTHPaSxw9rAqEaWyqe8mlqq0H0fsQaL7doR2Se7Y8nYZd+3bDnGb
	y1amcD3viIgrmE85Xdk9JEkgP0XE8oGtkb33Vjl46193d6VYaBwlKlluk91gR1ZhZx3IlnQitnW85
	YeTiEfJxJSnFEnKAdXSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0f8R-005xo9-Ub; Thu, 01 Dec 2022 08:41:35 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0f8K-005xeH-Iu
	for linux-amlogic@lists.infradead.org; Thu, 01 Dec 2022 08:41:30 +0000
Received: by mail-wr1-x42d.google.com with SMTP id bs21so1517894wrb.4
        for <linux-amlogic@lists.infradead.org>; Thu, 01 Dec 2022 00:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tj390YNXHrclTFputKDdp/2EzmVq492YRg9LH1oG+Bg=;
        b=tqha8Io9+MdBJBv4dq8nsAAXsY3Bwbvisj8hUvDQu1+XuwzC4CazCyU4fzCvN1Lakf
         3JtwxkNxWXGDHo68+k/4QL7V1PnqKlTGdtb1abt2NJshf+pWw1/6udK1sa4giyLzaCoR
         XKTcH/fhWjZgU/P/XyErRu6LrgDGv/jt8D2LoVdimrV2B18XG/5YkhlUrH/g/orp2DVU
         PSl6CRiSJkEpOfsVa+BbcKnXbyJOS9L1gIZIWmi3EEnt/FHwL6ppEBS0OtiqQ8/2tpaS
         BMVu2sd25L+K+SRm1sprA1ZWHsIVeBE2e8LH+IPb1dblrvUak0BMyGfUIYqg60wloqcu
         s54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tj390YNXHrclTFputKDdp/2EzmVq492YRg9LH1oG+Bg=;
        b=HHSGfZ4ucdi9TDK0vvskL1ODap2zjdd91Zt8iEEHsjTRZWHDrUruBa0hfpR0pf5Hab
         G3g9Bc3PE+mwMV2AoquBmqGp4fLIcgJcSgFzemc2d8+oybh0Gh03ZBm2XAZ6RlSWdAMJ
         L0ibQZFRcV0aNEszKGOO95OpvgHwlQ5QueIiHcUZqRCIYn5AruX3uKeSV7qKRqviEIc6
         FCsXWX2bHyBW6TtbPHR4dyE8pKhGKFoZN0JIzhda/BAXjCVUQ8jvP2OkPJa7Wh+1ewXL
         hxaJmSjtxn+Q6xdRNiQE5chm3q+CCjim8XUq62+YamXv7FYyaz8EHQ73X7Orzq4ESsju
         kGbQ==
X-Gm-Message-State: ANoB5pnL/ie6K0LNo6XkaXKwBvE/GOhObfBZaiadaM1/7KbK8y5/WwwG
	3Pa7ghSA2ACteTaOyEvRjvIKxQ==
X-Google-Smtp-Source: AA0mqf4sOShSp/Ekl0Zx52j17akSaysCwnTBmBOchLMlhHGPZEbmMtxBFFAQQrs1Tgn94ff6d4zl+Q==
X-Received: by 2002:a5d:4890:0:b0:22a:f91f:674a with SMTP id g16-20020a5d4890000000b0022af91f674amr28955065wrq.214.1669884075457;
        Thu, 01 Dec 2022 00:41:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id n5-20020adff085000000b00236c1f2cecesm4592623wro.81.2022.12.01.00.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 00:41:15 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Robert Foss <robert.foss@linaro.org>, linux-arm-kernel@lists.infradead.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liam Girdwood <lgirdwood@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <cover.1669799805.git.mazziesaccount@gmail.com>
References: <cover.1669799805.git.mazziesaccount@gmail.com>
Subject: Re: [PATCH RESEND2 v4 0/2] Use devm helpers for regulator get and enable
Message-Id: <166988407457.1972715.14336374251085655546.b4-ty@linaro.org>
Date: Thu, 01 Dec 2022 09:41:14 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_004128_635930_AD6D1F62 
X-CRM114-Status: UNSURE (   8.45  )
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

On Wed, 30 Nov 2022 11:21:51 +0200, Matti Vaittinen wrote:
> Simplify couple of drivers by using the new devm_regulator_*get_enable*()
> 
> These patches were previously part of the series:
> https://lore.kernel.org/lkml/cover.1660934107.git.mazziesaccount@gmail.com/
> "Devm helpers for regulator get and enable". I did keep the patch series
> versioning even though I changed the series name (subject of this mail)
> to "Use devm helpers for regulator get and enable". Name was changed
> because the devm helpers are already in 6.1-rc1.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] drm/bridge: sii902x: Use devm_regulator_bulk_get_enable()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ff1eae1201a46f997126297d2d3440baa2d1b9a9
[2/2] drm/meson: dw-hdmi: Use devm_regulator_*get_enable*()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=429e8706366166494314a46c82a9a9929aedbb8c

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
