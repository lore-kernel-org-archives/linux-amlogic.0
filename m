Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FDBC4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Nov 2023 13:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7CPmm+EckXT7vaUuhlu5uvmPvFGUtTZahs/ybaVupc=; b=PjY2BR3uzaFKVM
	na7i86Bey2qDdYEpAwlYyRt5WSK8T7dSVH6dATNg4tpVXVrauhgUKrTX27hHPW14mLYWsA+uUYkUT
	9Xp7/6vReNm53+g6tZ1BeAiXETA8/drKr1lQ6a3MGaFgZp/NtS0/ky8eQxKAVhGcx9KTVNSSdSmzj
	v4o/Co1EwjbCg2AGx1GdOE4VgnY7CThv56NNj+Qi7KTdH6pjFf97c9ANa3YgNEfWkh5bNSRBm+aQv
	RkvWedgjIKf22qz1/AiKM0x6IhEtw771KCm62ldEJjgDnEbSn4ySnRdggJB2IKA1HVHuPKbfnxvyR
	YZNVxqjQ6HM+dNsgDfUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bZa-002Yax-0a;
	Mon, 27 Nov 2023 13:22:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bZW-002YY0-1n;
	Mon, 27 Nov 2023 13:22:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9FCE9611EA;
	Mon, 27 Nov 2023 13:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83171C433C9;
	Mon, 27 Nov 2023 13:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701091365;
	bh=0BLQG6JYQ067UNDJ5wfmB5ZjUGQKZe55ZiL1VEJSO78=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=payg5QeVmhoFO1Y7oc9QbOZipHt7xsfGm3HNu1qNPFnFITyBT53rddcG487o7CsNd
	 4HXMQEIWY7VFq2UQqGrsotm5PDzVToCJHFZrr6kSlXn4O+oO2uqkh0HOIDopuUJhb8
	 PUrCOf+xWMU8PwNgfO8EKlmtH8AhiqqzzHj4qmGpWuYUNNGHSUUu+bpl8hmA5Wm/4c
	 Bby45Ek3MlYijhJq+WtfQC9UXA8Ctn0z1zEsOiYn1k/CQqw8vFF/Y7ce/8nIw1vSfj
	 bIGRAWOclNGebowmrny7YIPMxVRFON9PfkY7YajyVy1lMPdgeFNa0RsPuFGi2OQ445
	 6O3SL/k9cB9Iw==
From: Vinod Koul <vkoul@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, 
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
Message-Id: <170109135706.42627.15247339910188185100.b4-ty@kernel.org>
Date: Mon, 27 Nov 2023 18:52:37 +0530
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_052246_641766_840F7279 
X-CRM114-Status: UNSURE (   7.57  )
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


On Fri, 24 Nov 2023 09:41:11 +0100, Neil Armstrong wrote:
> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
> glue on the same Amlogic SoCs.
> 
> This is a follow-up of v5  now the DRM patches are applied, the clk & DT changes
> remains for a full DSI support on G12A & SM1 platforms.
> 
> [...]

Applied, thanks!

[03/12] dt-bindings: phy: amlogic,meson-axg-mipi-pcie-analog: drop text about parent syscon and drop example
        commit: 130601d488fa06447283767e447909ce9e975e43
[04/12] dt-bindings: phy: amlogic,g12a-mipi-dphy-analog: drop unneeded reg property and example
        commit: 5f4a9a66f8a7582e90311fa8251da33a8d2111d7

Best regards,
-- 
~Vinod



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
