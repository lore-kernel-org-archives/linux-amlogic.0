Return-Path: <SRS0=aM1E=EK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61071C388F7
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Nov 2020 13:56:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBEAC2067C
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Nov 2020 13:56:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uwrEjwQz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TpYxmLYU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBEAC2067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k8jr1Qe/vudK52HC5xv+zViPA4yoC71+5Gmy5/hLv+E=; b=uwrEjwQzW+B8EgfRf0aDL8ypHg
	s2QDki/5pERjefjTun7Aql7MJ3ViknNthwAWQFg5VkUqq1qQNP6Ca/bjVJ6cv3qA2CdYQk32GQuch
	OwsQfyYSV8GXxOdjUvC6tP2dlhdK/U6kNMOJaCzWl5xnYbFgh8CNl9hsRLFyRs2pHuFs74yU/Oaoz
	/jS0gkdxFTjr97bQIKZkMpBWYjeq7qAOm7+UWRSmsb9kzQUtHHOJhOOoV4iSAyY0gS+q2XQz2Nju4
	6s5iVV8Dm+Z50zJjfSdiEKNEi5Dm0jj3nE7NmymaCwVqk4YvtI8IuWyiRtmsdcIeUN/psoaY9Gn40
	tW749FVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaJHF-0007ZJ-3M; Wed, 04 Nov 2020 13:56:41 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaJHA-0007Wo-7y
 for linux-amlogic@lists.infradead.org; Wed, 04 Nov 2020 13:56:37 +0000
Received: by mail-wr1-x441.google.com with SMTP id w1so22183275wrm.4
 for <linux-amlogic@lists.infradead.org>; Wed, 04 Nov 2020 05:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cPcVTlt4PtaJnqwyX4xYXu+/IKdY0k4HutlOclbS1nM=;
 b=TpYxmLYUqj9kx/e2FrI3x6kcSiKrlec6frSs+K3eiHy3VmnVi0HQfgHxG6NWpWbsA6
 XhTgoDvF/L7nwXGyEVueEzefc3H+SRhG3isD4mYaMoMV7EZtdqWVArpSAFEu8n0gC9ph
 yfWRUaJ9rGVLmabTL800X5KMWkLJzlKGUPcfBe+PhHIxsTZ81JT4mqSX4vL1rC5TQbwz
 fO9Z5h12ty2qt7ZhF5O80HQnJdYG0r6mcGza1FNXTqPwh1Uq3H//cxcHIpbCyvcGhRb6
 fPfHPgQzsC4fABXlk6BSwl0xJGZ58fzz4WfhNNU5wgY0ofKdVsILqrgP9/KtLciwxtiL
 4cVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cPcVTlt4PtaJnqwyX4xYXu+/IKdY0k4HutlOclbS1nM=;
 b=eiLFDwH5oH7Hutc3LXaKreT3gWlK1eQ0S7xdUIkX/zMPyrAJNvUgcDLaB8aNzMCewU
 0LhAPftaoH2MCCpjLzWPBLyNvNIzpjVHomOz+TLUlnod45o9NEd0gOi7rnbR6JgMyeX2
 MCYED5TOUd7SMHmuhyE7FmloafY0IbcYua646qiRd7ziPxf0OomGCkPryIphXb/rTkrR
 OET1ntHI7gPdWgTi8SEXQ8t8nA4E5xI5SrjDhAzYCT/Tatv5oR/jyL0cDZDvCZohdckD
 f/0wXZDnw9S3Dl+JayUSmQS6BwNNeOsIsbliR4JlWGA4CBDRM68RK5X8IWvUwqojx40m
 TgGw==
X-Gm-Message-State: AOAM531VACZl6RGieG6f3kKEcWZkBN2clSx2XKPkcv+nSCCfuqWroXDD
 8ny0c+FUwHgff+fO/PHUrywPDIbh5uuCYVop
X-Google-Smtp-Source: ABdhPJwvKQsxeRuBiwVrrkyRPkASRDW6ZeGl2wGnPIA5bbuqYWpqKhHX6b4SMTQc2+uyYV2IvVQ8Xw==
X-Received: by 2002:adf:ef48:: with SMTP id c8mr32201219wrp.399.1604498194931; 
 Wed, 04 Nov 2020 05:56:34 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:61b2:b9fb:eeb7:b9f7])
 by smtp.gmail.com with ESMTPSA id n9sm2285234wmd.4.2020.11.04.05.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 05:56:34 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	repk@triplefau.lt
Subject: [PATCH v3 0/3] phy: amlogic: add MIPI DSI function to analog
 MIPI+PCIe PHY
Date: Wed,  4 Nov 2020 14:56:28 +0100
Message-Id: <20201104135631.1550125-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_085636_291972_97DE0504 
X-CRM114-Status: GOOD (  10.70  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The AXG Analog MIPI-DSI PHY also provides functions to the PCIe PHY,
thus we need to have inclusive support for both interfaces at runtime.

This fixes the regmap get from parent node, removes cell param
to select a mode and implement runtime configuration & power on/off
for both functions since they are not exclusive.

Changes since v2 at [2]:
- Add DT review tags
- Rebase on 5.10-rc1

Changes since v1 at [1]:
- added description to binding as requested parent
- updated commit log of patch 1
- also update example of patch 1

[1] https://lkml.kernel.org/r/20200907073402.26674-1-narmstrong@baylibre.com
[2] https://lkml.kernel.org/r/20200915130339.11079-1-narmstrong@baylibre.com

Neil Armstrong (3):
  dt-bindings: phy: amlogic,meson-axg-mipi-pcie-analog: remove reg
    attribute
  dt-bindings: phy: amlogic,meson-axg-mipi-pcie-analog: remove phy cell
    parameter
  phy: amlogic: phy-meson-axg-mipi-pcie-analog: add support for MIPI DSI
    analog

 .../amlogic,meson-axg-mipi-pcie-analog.yaml   |  21 +-
 drivers/phy/amlogic/Kconfig                   |   1 +
 .../amlogic/phy-meson-axg-mipi-pcie-analog.c  | 204 ++++++++++++------
 3 files changed, 149 insertions(+), 77 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
