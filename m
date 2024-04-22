Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D96AC4345F
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2024 08:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nodwk+R2wv58+IpKzD8Nbj2H1C8nK3t1NW5Ku+xCI/s=; b=EicId4tgLAggfE
	0FNFRaXiAv3Kx4hZ3dk/nw/gNmBDxJBqXoTPYGLvi3GZglDq3rKRU/OmaML39mO+6qZ0ZHKPZ4Ou7
	arqflTo5QJ5lRVnDi4XlDCYfM3EzUV5IdRL1bC4ljXoQOt9mFVIbRTeo6zplAwjUr1qZCCwXP+rzC
	45n/NBtymDlXj33GsNtaRYRFKwic/v3p4zSusTEUireUWuTQ8SPyC7oYKjE8qJNdOdz6eoCL0bjE5
	TChPubY8T/q8qURJgNE54w+vAmE8Lz4nsoInJ7h6iazd99/krNelYFWM2KBSlwG4Di+E9NKTte3tl
	gWANfB5WN5nkWR3sp7mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryonr-0000000Cabq-45Np;
	Mon, 22 Apr 2024 08:13:31 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryono-0000000CaY2-49wM
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Apr 2024 08:13:30 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-41a5b68eceeso3720975e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Apr 2024 01:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713773606; x=1714378406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJA4a5dlfNiF/Mn+2ESih5PJW4UfTetDxjsJggty4nU=;
        b=YKLI4OKKH2zMTQU+IZVKNJAHUuiDK5wqcyvyU3AWo00B+faVJh8GkWCXUwPIrvbLu/
         tlog3bxUfrrC9X485mfESS0m7IfebY6/4EFoSvQMJ3SWDo7UTk/6Cg/UOkpKY7HbJ6UH
         TtCN4I1s23AoDwFjIFh0L+ZjCtYLK1WPAAyaYYU7EYBWjq8WGryJuQpSebz8FMG+bGsa
         t7u8+GredUaKnRbOG5rwOJwaKwTB7Ky8BjCk2MbfC3XIncsKWpn9VGc1d1GXqVxJId4g
         Mf5ZAqr5EYivhhEh0Amd21RmJCGQFZgwBSGZgfPwsu5qh4IHoq0EojOpM2cZkGotfnz3
         LL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713773606; x=1714378406;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJA4a5dlfNiF/Mn+2ESih5PJW4UfTetDxjsJggty4nU=;
        b=cnAyluCA8yEZKOdXKY2vMHPFEL7o1NJlWvR/YAIEUiik+mQDNXzan+goXqVb8jHGLr
         q6y/4LK5UCQ1Fp0WdHNuGgMN8+JgW+faS1JJTEJdHpQwbrDKLac4rTulYZLA5z3QGXV8
         0YCo28Uz5a1+cKij7oNafLOuRDvbZ4E1/iOME8vclcnnYN2rYj/+M4NgNcqOXczd8QVB
         2AHKkMv04kixZs3KOquzZlJDsHNJAql9JcXrlNcsLlLrbNM605qi9fCsB+Tp5hnPQyeO
         ieg9Tl0OW3m3J1S7tmJ2RUCxCE3YuT5gU5vo9mjxS230U9wubMKDMqywUJ9P/pPiCfRi
         YmaA==
X-Forwarded-Encrypted: i=1; AJvYcCXMqgC6JA8uoU9sxvAwlH7veKpvS01DQ/BSDaDay3JfmBO4tVAblZr0VfP9E4rxs+Bb+r+uxiVPLZ2XJIuBNALXgblW+XWHe80J4iKx5FreImY=
X-Gm-Message-State: AOJu0YzWwmmSakk7OMy4CVmlhLv3mHba/1bnp+l5epx0MzO+4gf7cTEo
	78sIVA1+OhXpt6Q84uMxsDPsqgLpteZrEICXETbPwc4e6QNQpdy1DU7L7J7ws6w=
X-Google-Smtp-Source: AGHT+IF4cU+n70iM9aZ/bhIOf7ej4TQDcYHB1Zobb6c1Ifw1HLzoA9501M1WkvFgE4TgcpsQDdtYTQ==
X-Received: by 2002:a05:600c:b85:b0:41a:5de5:85f2 with SMTP id fl5-20020a05600c0b8500b0041a5de585f2mr1356294wmb.39.1713773605856;
        Mon, 22 Apr 2024 01:13:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c35c700b0041638a085d3sm19437504wmq.15.2024.04.22.01.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 01:13:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 Jacobe Zang <jacobe.zang@wesion.com>
Cc: nick@khadas.com, linux-amlogic@lists.infradead.org, 
 quic_jesszhan@quicinc.com, sam@ravnborg.org, thierry.reding@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240419014852.715125-1-jacobe.zang@wesion.com>
References: <20240419014852.715125-1-jacobe.zang@wesion.com>
Subject: Re: [PATCH v3 0/2] drm/panel: add Khadas TS050 V2 panel support
Message-Id: <171377360500.3418456.9021702656512233742.b4-ty@linaro.org>
Date: Mon, 22 Apr 2024 10:13:25 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_011329_093855_8AA64DF2 
X-CRM114-Status: UNSURE (   6.30  )
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

On Fri, 19 Apr 2024 09:48:50 +0800, Jacobe Zang wrote:
> Khadas has update its TS050 panel, the only different between the newer and
> older is timing squence. In patches, add new TS050 panel named "ts050v2" as
> make it compatible with the old one.
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: panel-simple-dsi: add Khadas TS050 V2 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0546e01d5a0269f02b4aa227f44b30a5a5558792
[2/2] drm/panel: add Khadas TS050 V2 panel support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/26f9339212db569310d4b0ef4284efcbb462a86f

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
