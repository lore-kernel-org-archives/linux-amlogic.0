Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A3BC05027
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Feb 2023 09:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o2lTQBfCA4wy6WAGDD2ri5TtCb3tn4OvN2fU54SVmWw=; b=inO5PVeNx3G/I3
	3a4tHC3OzBVc71un7Ko1Pk4EIKLQ0TkRGpkB5VwPBzVNgWAYGByqIVbgiDgsT5Xf7Bp9wMbernebo
	WMU21fTruAED1xjx/bIkrq2K+rJKZKVD0OmVa3sqqvMoeu9OVRMT4hDyDAD6vJAy5zTAuK1zXDFLf
	ZYMx/DKOZtmT/rzTTaR6VRhcpMwahtH8+xLFkAhzvt1cKEoUIQhF761P09GieYGzl/0AFg/ZkdCAg
	2FETMtlHfH0Tp45Fk5qPfnIiIndj7x/YhqBtxLudRgy0GfknXgqTu4O5G6twcTZF5pXYL/GR1mpZT
	UJp88M+IHLHftay3P/OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgtf-00EuaB-Us; Wed, 08 Feb 2023 09:37:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgrd-00EtcT-90
	for linux-amlogic@lists.infradead.org; Wed, 08 Feb 2023 09:35:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso956110wms.5
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Feb 2023 01:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5Tu8R0oupz/ghiHxU+IGFJ45u5bYP68xNxl3K3/IjE=;
        b=iqGdC41c/7Nav5uKJe7OFSVlN/w+wAHQedSiSAkvS2V0cWV1aa0Vz+pHyXM/Bhgw1t
         kQ+ZYwiGtNowD8cHal8ybws8mppYjq+jtUrl1+kgm2r6TSK2obKank2PdZnBZBOZ5oTn
         5SFe3xDzSSkr653gRrWicS3lePMHkFofroQSRg3NW4mizNyb1SWTxBozNHJuVB2WKl39
         pSOSO7ev/PlYUHMQ55bqc1VAek0gRkRln/clenas4STXF50e+WGhd4yVbLg/PCGaiR6m
         d6+VpLwlrYrPHGiSKfYTAU/0SyfXslc3w8xYu4ap7ns54COAm8pIh1lmLKsW2lkOHiWs
         QEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5Tu8R0oupz/ghiHxU+IGFJ45u5bYP68xNxl3K3/IjE=;
        b=S1vIR9v3x82lDoRs3KKyXtsiP8qjErvaH05TwTsqiG2ewkW4bet5haR2vSCPxFZqsv
         O8B0uiWcr01OsyOYOCfMKaN/EVGeQTAbhvHIOJf4nwUa614C07PbNON+Uc3jURYmbaKO
         sOG7Nj0uotsmk7Brg+H+5/KywXYby71kh6w513HgdHMbi7hijyINIs+rzeYP3x8KuTQ4
         au2JVwWYal0/a9NTUbEAyaB7xa6Y6jjLkMn4JM+nrAQ0Xri11kjMcBvkxkAsT9CqlRbI
         g/DhR4mXvzbR6t9Ah+3ni9Kkw+aXdqTYx2fROAStzF6hDPdWwpU45b/ob8+OSM/M4vr5
         qKwg==
X-Gm-Message-State: AO0yUKWB3hQyuFYDi/xHIlddpMIYLFhpb9Co4DGP8sreNZxZfwBjndnY
	IXREjdIi/T0spiMzBy5QtvGxmA==
X-Google-Smtp-Source: AK7set/kCIIZcHoJ4TsvPawNaB7DdeTgLnyVQKSy16xqjOEFQfYshN3+RU6iL+FYD1oxwlLAWFVWqg==
X-Received: by 2002:a05:600c:1d8b:b0:3dc:198c:dde with SMTP id p11-20020a05600c1d8b00b003dc198c0ddemr5669502wms.41.1675848927019;
        Wed, 08 Feb 2023 01:35:27 -0800 (PST)
Received: from jackdaw.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id j23-20020a05600c1c1700b003dc1a525f22sm1375051wms.25.2023.02.08.01.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 01:35:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/1] ASoC: dt-bindings: meson: covert axg audio to schema
Date: Wed,  8 Feb 2023 10:35:18 +0100
Message-Id: <20230208093520.52843-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_013541_382221_19535DD6 
X-CRM114-Status: UNSURE (   7.79  )
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

Continue conversion of AXG audio dt-binding documentation to schema

Changes since v2:
 * Drop 6 patches applied with v2
 * Drop Yaml block style indicator for multiline description

Changes since v1:
* Drop 2 patches applied with v1
* Drop node name patterns
* Fix examples indentation
* Yaml fixups requested by Krzysztof

Jerome Brunet (1):
  ASoC: dt-bindings: meson: convert axg sound card control to schema

 .../bindings/sound/amlogic,axg-sound-card.txt | 124 ------------
 .../sound/amlogic,axg-sound-card.yaml         | 183 ++++++++++++++++++
 2 files changed, 183 insertions(+), 124 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml

-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
