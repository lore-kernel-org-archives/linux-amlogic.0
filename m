Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9706BC761A6
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Apr 2023 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iJCNvDYJJd4tVptSznEAeMlOVsHxfuV/QzU1p1SPRn8=; b=NnA1NAVcinJuEs
	M5hRko1c/UWndOKq3L2NvDhvvfa0bO68Osi2MqrmDGaGdOFkaROEZvs6kIpK04qFQZODRs/abr0r9
	z+KRTrWwFnccvF9P/eTKSm5D3rXVQ3RmNRhJJwd3EroppVdIzTLNjhykaVcBP3aIUA3LJ1ejJD99/
	E6RpkF8lbVCussmsarlP2+Z8ADNco3NCxG0pA730VARXr+V/ovTwFEmaUT+1ioj4YpEImxyUKBO/O
	W+f/OSnX7X7J8mwPgmt6rCUTZfrNk260Cy72xywI+2ZQB297T6EgRbDoVe45QjYNnEXSRBVPCg2fK
	/QoYb7D8p6rORFMSdqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjco1-000fns-07;
	Tue, 04 Apr 2023 09:18:21 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjcnp-000fjM-1D
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Apr 2023 09:18:19 +0000
Received: by mail-wr1-x436.google.com with SMTP id i9so32040872wrp.3
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Apr 2023 02:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680599885;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QpzS8qNdlSXVjQMluisTzbchwdXKzq7DzhdFD6+hyKU=;
        b=eE8UnX0zBUXwyOIeP2DoMjW2EaEeq1OTBsZbgot3ZCn6zybYB+jGsGu2Rf1DyZjc4w
         VBmlFACJRcwo1hPMJdJNSjHtLClzT8RSz58GlDbE8tVenbKsGlWtlrOKIXPD0LmxphSX
         vddbOwAHW/OxD7F6EewtfgOKF7M9qS+DCQyYLIv8Yw4PRrycYTY8duJptDMAwOPhXGYa
         ra/m5hSuK6k4upef6QeS49x3Jt2KXWl/6vj3bgXf01/wNSancBfxgg90YfGSYIXdVrHD
         UDJ+s5Ujj5WpTq+nibn4p4ftM+IlgLHGwMCfBwHyDC5bfD8wDKwjL35njumFlGlwc8um
         Jw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680599885;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QpzS8qNdlSXVjQMluisTzbchwdXKzq7DzhdFD6+hyKU=;
        b=itGRPl/txwHLEO4y1asQbgdzcIazqwGX2ZF3avXTlzfyKr88Fya2Lcv25pKQjoKxem
         SdL+8t782u3DaxromaRy6dHRqld7vm4pEu/q5l3AbLbRljQWZnrIrCPtx38d2oz9aWtf
         0yHFD83aA5gg3YGk9baibTXoukj/leFnrRCCOXzLZGQSsqG79aycK3aBHFEdZi2CrBbq
         wqse7wjfv9xKmDxF1wgwmTXjHqiuHqEP4C1/Jwt3vZG7kcX1hdnJ6SwfDwSFb/XQwcpK
         7DMFXYuZmTSPElRNe3CQj5owY3p7Ph+whfTRHXY61dRlVXlQZOy1a0ggHy1mo3B+fKGz
         m33A==
X-Gm-Message-State: AAQBX9de+NNphjDsh8pU5gm4ywocuDrpluFgnH7NdKjYadiYVvgkg3/W
	65g7KJr78QBTX9npnsdiV0hiWA==
X-Google-Smtp-Source: AKy350Ym5aBKy5Ri/SboTD+Oqk7FT4AdoBGBIAkpe5rmvTJKYcyZuXdngw/swZVuGRbY1i3YVfb19w==
X-Received: by 2002:adf:dc8c:0:b0:2d4:53d7:ea7f with SMTP id r12-20020adfdc8c000000b002d453d7ea7fmr1182804wrj.3.1680599885499;
        Tue, 04 Apr 2023 02:18:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5136:bca8:1616:ba77? ([2a01:e0a:982:cbb0:5136:bca8:1616:ba77])
        by smtp.gmail.com with ESMTPSA id y13-20020adfdf0d000000b002d1801018e2sm11767332wrl.63.2023.04.04.02.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 02:18:05 -0700 (PDT)
Message-ID: <aebef87f-e0a3-17dd-12b7-7231ca6b0923@linaro.org>
Date: Tue, 4 Apr 2023 11:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic Drivers updates for v6.4
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_021815_707416_9DD71CED 
X-CRM114-Status: UNSURE (   9.04  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's an Amlogic Drivers changeset for v6.4, with dt-bindings
conversion & fixes, dev_err_probe() migration for pwrc & missed
populate platform devices for meson_sm driver.

Neil

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.4

for you to fetch changes up to 1b61fdfdd656b3940cff24c25c211777389174b0:

   dt-bindings: soc: amlogic: Drop unneeded quotes (2023-03-28 09:48:54 +0200)

----------------------------------------------------------------
Amlogic Drivers changes for v6.4:
- convert clk-measure.txt to dt-schema
- meson-pwrc: Use dev_err_probe()
- meson_sm: populate platform devices from sm device tree data
- dt-bindings: Drop unneeded quotes

----------------------------------------------------------------
Dmitry Rokosov (1):
       firmware: meson_sm: populate platform devices from sm device tree data

Neil Armstrong (1):
       dt-bindings: soc: amlogic: convert clk-measure.txt to dt-schema

Rob Herring (1):
       dt-bindings: soc: amlogic: Drop unneeded quotes

Ye Xingchen (1):
       soc: amlogic: meson-pwrc: Use dev_err_probe()

  .../arm/amlogic/amlogic,meson-gx-ao-secure.yaml    |  4 +--
  .../arm/amlogic/amlogic,meson-mx-secbus2.yaml      |  4 +--
  .../bindings/soc/amlogic/amlogic,canvas.yaml       |  4 +--
  .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  | 40 ++++++++++++++++++++++
  .../bindings/soc/amlogic/clk-measure.txt           | 21 ------------
  drivers/firmware/meson/meson_sm.c                  |  5 ++-
  drivers/soc/amlogic/meson-gx-pwrc-vpu.c            |  8 ++---
  7 files changed, 53 insertions(+), 33 deletions(-)
  create mode 100644 Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
  delete mode 100644 Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
