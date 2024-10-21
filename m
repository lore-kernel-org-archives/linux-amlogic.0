Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D7ED15D8C
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2024 13:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dthKSDxvg24MSMwFvvmdI/R/5PcBXR0SW9mafbSW6ac=; b=SOYemQEwPKxDNP
	hmI4/JcbgoDCRD3UYJ0R4sbbbGZXEbsOLdPydKT8pgXyIa6pdXfYiynW4MXdILIu2tZer4a5lGX6O
	Wi50fELsJhOC+jITCnO7UqeLny2n6Jrd72vmZNfXuXwdXtfbzHjphupUOS+MS5NrOJYhgbGqp6tl3
	zOAt5in/v0ecjW1tEBYtn1YG0FIJKFNCotqyo5rV0no7ymwK7wocNtSlwvw+eA3R0jE8NRn+IC7UG
	NxOUao+AtJsN6XX/c8hKNdZwUOZThDcPmWMNhILHsYfnr7/poVdari2/bs5cYuAsiY1OKTnJqnq1b
	BkNYTSZxZcl2kPxQ+hLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2s93-00000007NGm-2wwC;
	Mon, 21 Oct 2024 13:08:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2s05-00000007LLS-24S9
	for linux-amlogic@bombadil.infradead.org;
	Mon, 21 Oct 2024 12:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0W4u+QtS4UNkEr65DGOIEiZitFsgZAiIfJ/DctJiwRs=; b=QVf3jbTKhSOv+DSr4Obiyx1PeM
	jJamgC9EEHo40Lfs6mPiXBg8XhAQpVWMnk/VTtRzQvBN1tIVUQHZau7E6sN0ktAejli/vTptYamwn
	hfapOUxoBJrWQm1gbVHmzkjd4gVe2NhWbvGGm9vrf7wKKeqysGufZ8mKZxOQSFX7/xpTDD+9YkIeX
	FdnUVTdCwJb6cGU47UK9PQmpQLBnq2rr4b2oAzRWn1UZ/EX7tzSe+aNDYvm6KOA+bw/4Qa8cLp8ln
	B4oJWu8m8uJ20RjrNRwAbC/kC/2AtjYn6Y0KAuIJV74MT+dwNBzd8BkahJpQwjxMi9Yk4TTQK90fr
	ZQkvgWHA==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2s02-00000007wNT-0CtF
	for linux-amlogic@lists.infradead.org;
	Mon, 21 Oct 2024 12:59:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so14298775e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2024 05:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729515542; x=1730120342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0W4u+QtS4UNkEr65DGOIEiZitFsgZAiIfJ/DctJiwRs=;
        b=b5hRW6Ht+swzH7APiDp+5yNoexEaqiWBpr16mxjPfI5A+avjs/lnsz+Zf9CsmwOBKR
         h3Ixm95fms2cAymWywqnQo4emYEI7L1P2tCp73sbxUhsT1yw1dxXvplxyoKL0EgerwT2
         BUovIFz2QXFd2ZO8pvykMIHogoVuRbSqxHbHxjP5pIePQJWVYjKyzT5HQItFboZkwtuc
         GObCkkopq+Dns65r0IGrjNyNJFG61FUsEbxYLcLwnDGcyiH+FwbZ14EXhYZkaAyllVYs
         K04dRx9riGLRpDAYPIKMbOobRwFV3fJy1liYdMNvnS6MwUshr392hfE4GYI4/F2YWnPs
         8knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729515542; x=1730120342;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0W4u+QtS4UNkEr65DGOIEiZitFsgZAiIfJ/DctJiwRs=;
        b=C2bsa6L+TkNmiMga8Cn/FCbuDKWdwMYXw4WtxDdzDFj4DmbQFiNdSyPGsIglSOdOQC
         /yANnzbGtZXqdcg6t0yMRirp16Sq79ZU+v+5BukhyxG5xNAA+zRINX5E+KVgz3XVqZ3t
         2fcdmT127Lf/qRlzHGqWyhBsH7G6GALQ69CM5mmNCoJqk/j6QY0CCU+Na693GX4tnaQr
         YraY5w4Sx77Dh0gI66jbA4O5YWn5LZnKAIPtJc7EfYTOtA/YJp9nhZElZI7I/5OYgFQN
         zjJiDdO8cHjlulV/q27zE4/gOYcDXKT7VsSgDJ7hV2uzGOiJ9+3ZeyxOOoVOlMppE1tU
         1RUA==
X-Forwarded-Encrypted: i=1; AJvYcCVNsks823lwvVAL0clwfv+8wdwPWR+R5XzWBKLWfYg0gVXWZuWg7q4keWrgvXj/JwdsSiKpa+kl4tdHFmuf@lists.infradead.org
X-Gm-Message-State: AOJu0YxIWeHVcQWuMUlDKK4O8ajzb5CpKgpOhevAi2ILN4+0lUyOOyvQ
	u0/BrTk2asHCeOg7MaWcbg+2VAqwt339tZDdCA5/TWfnvUpzDpChFKARsfqCSDs=
X-Google-Smtp-Source: AGHT+IH04j80oL9ouXTZKR+04j2kFDZL0aYwGPdMMYjCKFcqtXA5i8kcVtQSqWhMcA827fSFGcOcew==
X-Received: by 2002:a05:600c:3151:b0:431:6060:8b22 with SMTP id 5b1f17b1804b1-43161641a62mr89150865e9.10.1729515542557;
        Mon, 21 Oct 2024 05:59:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5cc4dfsm57452995e9.45.2024.10.21.05.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:59:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
References: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
Subject: Re: (subset) [PATCH 0/5] drm: misc: few simple cleanups
Message-Id: <172951554139.1240386.5313614669791374928.b4-ty@linaro.org>
Date: Mon, 21 Oct 2024 14:59:01 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_135906_321651_A171996D 
X-CRM114-Status: UNSURE (   5.67  )
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

On Sun, 08 Sep 2024 16:21:30 +0200, Krzysztof Kozlowski wrote:
> No dependencies, trivial patches.
> 
> Best regards,
> Krzysztof
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] drm/meson: drop unused staitc dw_hdmi_dwc_write_bits
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d9c12481f980bdad9cf6fdb742e49c5b50622795
[2/5] drm/meson: constify regmap_config
      (no commit info)
[5/5] drm/bridge: ti-dlpc3433: constify regmap_config
      (no commit info)

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
