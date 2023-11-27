Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06E7C4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Nov 2023 08:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=of8BvL/w3yo++9AgsUXh4lhuaHHuQlBS6vJ7qkA+yUU=; b=pILwIOnWt4yWAj
	gNJ+pzETIr4e3dwYrwNyay6okVojK4QJbto6kvU/p1x+wD//KGNZQdwpaJjYJMIZCsf+078JsQkQZ
	aNc/o1ZjE8VVTMvm7x1v9HeUTybQvziwOWk43kc/PLwTXZ441XIz3+x6nmFkX49NlFapZz7cbxU52
	98929o3YKMzIRdbMqNPkQTum+1qBVSJWcxfeUj5bGH9R8Ku3w4oHQDxHly8zhijI/Igy2xAhkGQ+Q
	/O/q7pR4BXVI/ZmN/Pjqaz43sfQnulA+PRYCzRHKwmyPoo61Vheo5I65WvCzpC3KHEfknD1qhkGWl
	ju5TMRDrSnnDiY92j+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Wq2-001oPg-20;
	Mon, 27 Nov 2023 08:19:31 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Wpc-001oNO-0y
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Nov 2023 08:19:06 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c8880fbb33so50826651fa.0
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Nov 2023 00:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701073141; x=1701677941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2uKGv73n9zPoCLwWnUxIRJtwy7BLdOeRGasRuwlLaI=;
        b=Pfy56KSjhqGYWGQFiNZz/R7Km0AdIjjLzmJMkPr0wx3aTN1DpjgXHHGziNx4hUm7xB
         OSkbTUR5c3p39K5hXGegrRb+PKh9Z3V37XsmaJK+nQW2YZU6Us8NunOBcs/OHFqGCAHP
         mmH0z5cO5mI4QnKNa9A2ZAWNqzAM1r51Rk0Ng9Y/MP01H7Qwyipbd0NKrp3KpawSMh4G
         MGPHaewCE3tQnS+fUY43rQc++rwUYyZJBVTGraMlYNVtTce+xTcYSJn/hSVGHXPYKGNP
         6/MsDrXGGepeTCYqH+kE317w/Uy07rJDXU6N1gyi0n/UoAnRzmoh3vR2mMgUcCrtRPoq
         mw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701073141; x=1701677941;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2uKGv73n9zPoCLwWnUxIRJtwy7BLdOeRGasRuwlLaI=;
        b=tuCr3Ex4k9Nfol7eK/bdXD2FIqW8O27tLdsuMToiW/3gSZcNOoDbo+PRyUhKPXVWge
         Vtc4TnalOhKEkCg1yj7O6ezYoKUwMc3u22V9zt6Wsa0G4HLfKA+63Fk1gHdjVvM2mKN5
         /CzeGxPVJ8cNrvURSe+oNrBN9RW+dNGgAF9/8RnQFb2Erwj+oxlKaeP3NIPHjDEnKXE8
         HmFbbAOFJgQtMEmSIwucU6joOja7Wv3wq2QnXhdhkTAOrjVUgD9Lm0yBUlIorbogbZx2
         ANTfuPnxwauDNWd5Gd30un1W7JcSmmH8r5DOwT4VjMzdbpmELmni128En497LthBOReS
         tEOw==
X-Gm-Message-State: AOJu0YzNaIh746v4B3hyjid1mftTkpYaPGVNFMb4LUjpICRkfsD3HIrY
	Im5ZFw5IOebZZNUh6vwcyEW8eA==
X-Google-Smtp-Source: AGHT+IF1gTyhMEF3F7i1LRqkM6Hdwo5CzhiNmHsO3on2+Ni4UBjAsOeQokHh2iH61R/I1gEzM9biJw==
X-Received: by 2002:a2e:b5d3:0:b0:2c9:a05c:547d with SMTP id g19-20020a2eb5d3000000b002c9a05c547dmr1718714ljn.34.1701073141585;
        Mon, 27 Nov 2023 00:19:01 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b00405442edc69sm13516568wmb.14.2023.11.27.00.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 00:19:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Remi Pommarel <repk@triplefau.lt>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 "Lukas F. Hartmann" <lukas@mntre.com>
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
Subject: Re: (subset) [PATCH v9 00/12] drm/meson: add support for MIPI DSI
 Display
Message-Id: <170107314034.1083800.1585049254380328915.b4-ty@linaro.org>
Date: Mon, 27 Nov 2023 09:19:00 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_001904_368295_D3547FD9 
X-CRM114-Status: GOOD (  12.49  )
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

On Fri, 24 Nov 2023 09:41:11 +0100, Neil Armstrong wrote:
> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
> glue on the same Amlogic SoCs.
> 
> This is a follow-up of v5  now the DRM patches are applied, the clk & DT changes
> remains for a full DSI support on G12A & SM1 platforms.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.8/arm64-dt)

[02/12] dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: add example covering meson-axg-hhi-sysctrl
        https://git.kernel.org/amlogic/c/beb9c30ba4188e481991d91124c554f61a7ec121

These changes has been applied on the intermediate git tree [1].

The v6.8/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
