Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34E0C77B7A
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jun 2023 14:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E16KWoiMxPleWxA16cFxWLRSdf9fOGujWUFMhp1Wvw8=; b=xDONhSFjnPq6XA
	hgD04FNpJ00TP3/9nwHQmNuuFAvgyMFgkZIWQn06ZVxvtx45aHHGeEO0m+eTBpO+1aX3cpESGfPtg
	WZrlZ8HC9GzjVFZWtxIr7jtcof/1GFJCu6/ACXj14i8nFpwtBpR5OgXygmHEBfIpX5oxlR2sioeRm
	+Ib5fdVbH7+GALAhgtQWXTcx9bZR8Hm+vIS2Na2HzSS+GteRwBX0RnNVPmhGvhYxwDoEfybhZeao9
	mvPG/tDAKf8gOt/tqJqFWFHd1E8uLjbB1d9RLJXuxeZ6cSzyRrFgX2lT89wXsV0P9k8+KYgadP2ig
	QK2uUhwKzNaD/HTUIlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4j2q-003nSt-2Q;
	Thu, 01 Jun 2023 14:12:52 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4j2n-003nRW-1a
	for linux-amlogic@lists.infradead.org;
	Thu, 01 Jun 2023 14:12:51 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f603d4bc5bso8780355e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 01 Jun 2023 07:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685628768; x=1688220768;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blRDmP8zwUxnWYu3O2q7G8SVs+SLeK3eRrnyEq5ozP4=;
        b=qdN3sFmE0bkWjRKWetOAT0HHLZIxe86o4BV9VjIYHiUK3XPu2S8gc0aoVmeWcrs4cy
         agjoc2/Hh7uBRXSKUK6reJT3RUJmkZAEwpys5HDX5bJr6n6VJa7oPa+LItSY9540le1v
         c5xeuCTZ1QVljMhR3nmnMXrrL0arqyhLw8IIxDSf/EhE6ILbEj1sEW03f3QystUPuj5Z
         bDEUctCPLc84Ov0ke0ettWxLK3yjWZ3RCAHD2zRdmVaAybo0NiXe5TLVYrUVI645Qq06
         9BbZlfyjNk5aeQp4Zj1+EaGkNAjjCWOgccsS3/JaCUwjXDNUT+G0TrhVnq5XV5ORs7dF
         6+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685628768; x=1688220768;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blRDmP8zwUxnWYu3O2q7G8SVs+SLeK3eRrnyEq5ozP4=;
        b=HRUwTJjsSJxwdW1m35V8eVtK7+wIe+CavUOs+kK8s6Q1I5k89gY4A5/cog5zAsCDv8
         fcOGBudvMX3WWKceIoRZQNlsvDbtJLpqzOUSAvLChgSXbwBq+hf8YUHYmsMcUXK/0Hbc
         +RFhVLhSuV7KxOqbPJNHTT623qYdxRZOAzb55/QAp/iTpA16uT/53WNeB3g6UEmQ1Ikm
         v4xRQn8wf1b53L6Q5fmJCy3ny2bJ0tk4sfcRV1XD52qJ51E7jG9FjREfMq7I4l/5J9KO
         xGkMa3VmWombRXxMc2xXqFpYg6V4ktcX4s9Yc9MOdw1cEU92hECmyg2uW8uBOB37htzT
         f2nw==
X-Gm-Message-State: AC+VfDyzn2BdFzuuMKIR9BGKlr6VC578yZRkVd38TD29m1XlntYP/bWQ
	x1B40Yvd8zoF0a0dDRtaTS7Rbw==
X-Google-Smtp-Source: ACHHUZ6/ivQPA2lY433i2n8DT8ybJaluMhJNQm/WfFkDzmtsk8A31ifylaUb4N2I4BWnvbWtYj/ztw==
X-Received: by 2002:adf:f244:0:b0:2f6:bf04:c8cc with SMTP id b4-20020adff244000000b002f6bf04c8ccmr2034350wrp.55.1685628767960;
        Thu, 01 Jun 2023 07:12:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id p12-20020adfcc8c000000b0030adfa48e1esm10629591wrj.29.2023.06.01.07.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 07:12:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: "Lukas F. Hartmann" <lukas@mntre.com>, 
 Nicolas Belin <nbelin@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 Rob Herring <robh@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
Subject: Re: (subset) [PATCH v5 00/17] drm/meson: add support for MIPI DSI
 Display
Message-Id: <168562876692.86739.7052062833690353953.b4-ty@linaro.org>
Date: Thu, 01 Jun 2023 16:12:46 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_071249_550179_255FD0A2 
X-CRM114-Status: UNSURE (   9.82  )
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

On Tue, 30 May 2023 09:38:01 +0200, Neil Armstrong wrote:
> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
> glue on the same Amlogic SoCs.
> 
> This adds support for the glue managing the transceiver, mimicing the init flow provided
> by Amlogic to setup the ENCL encoder, the glue, the transceiver, the digital D-PHY and the
> Analog PHY in the proper way.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[06/17] dt-bindings: display: add Amlogic MIPI DSI Host Controller bindings
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0628f2341e96213c9f2d074853b255f65acd3795
[07/17] dt-bindings: display: meson-vpu: add third DPI output port
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=25b3b35cd51ef0d98165666d250a51f39db6a1fc
[08/17] drm/meson: fix unbind path if HDMI fails to bind
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6a044642988b5f8285f3173b8e88784bef2bc306
[09/17] drm/meson: only use components with dw-hdmi
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=44e16166e0e9b94d8bcdf55fc0e5fcceca1154f0
[10/17] drm/meson: venc: add ENCL encoder setup for MIPI-DSI output
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=51fc01a03442cce5e4c21375a1ceb2e4ec93c833
[11/17] drm/meson: add DSI encoder
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=42dcf15f901c8222352da31d622b4ee844068f42
[12/17] drm/meson: add support for MIPI-DSI transceiver
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=77d9e1e6b8468f701ab024a060aa9c0339356870
[13/17] drm/panel: khadas-ts050: update timings to achieve 60Hz refresh rate
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=29c6df0d942454cb43334cf0e36de068f4124b94

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
