Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C513C761AF
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Apr 2023 09:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lgtirPIzhstnDWqlJ0BQA27gBXkusj9swIhaDUehmlc=; b=lwLMbkWDUoX8xy
	EnakQsokxyz8BT6SW65iEtDJlvBi45QPWkqEhx+cwJTCCrLnl96OCu/HkxGrpdDgvZxJZeF46nkpU
	oRG2791CXqGaupFQste9vzfzODfWC76pZxY5P/aHf+Q61oeLHBGyDFvt/lGjmBDd6zNnpBlwLQuDt
	LH47AW+jYIU+EJXiv3A15cjp7jdpeg8jQBdLEtHBXX1mBWcsbgATKYm0krmn9JfOmPlXoNaofe33B
	mfwfdnVB52s6j3RTfAcYKb2i47zXrjsiZMlnM95QcEF88RgKqhrlFTRhdIVv3cyUIJH79/7GqA1RO
	Otf0PR5IYNEH0yzeou/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjcqs-000gBp-2u;
	Tue, 04 Apr 2023 09:21:19 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjcpY-000fys-34
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Apr 2023 09:20:11 +0000
Received: by mail-wm1-x32e.google.com with SMTP id j1-20020a05600c1c0100b003f04da00d07so453514wms.1
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Apr 2023 02:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680599993;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBpuE+KCaF7Z9YSbE9pExS8fataDemvNZ7uivPjNu7o=;
        b=nb4m3+xjm28v9RQ4jjnffLqWrBs50UJPIyypaOH+HrCxQsrWZo8gMOXNu0LfrUDeDC
         vt/3CWbJpUwIJ8cjWukgeR5hxqxS2EsyQ1QVbOyivOTvSFpKGsE0ayibZ0hJWJwFuTYT
         NHPWC5rLe3JrG2bA8V57CxkDFtO/0fuODywYxYNisSro0FxMo2HlMsBTBS5IzUyEytgr
         NhxBs8sJR3rpUoDcTIAgDyhQWj7sjUri+M4cfC7rz/Jp3VxN8GXhixsbpeyunFRkslgu
         Lh7FdAtLjZFlPC2WvE87ftYl+hPgiyuiLad6ngcQm2auxicqM2XCkoYLFJYpJ5r+5TaM
         x9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680599993;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TBpuE+KCaF7Z9YSbE9pExS8fataDemvNZ7uivPjNu7o=;
        b=kfadBQaw5fVVaIZTMoiGCd/q+AWmJ7eZKktMK3E0zkAMVF/v3Q2KwS38kaa3K501Tf
         6JqKnBb+jrmb+wqYboviVQ3EAMz2Bl8MfcFVNWDDPiXbPamGwTyi/Bov2Ki/yf0Idc4c
         /hRVPVz+RhwwIzqJ+qmQ7mMMMom5jRT0JMScdRJ7O18tEWlvR3l1JsNiUl9BgGGyeIwF
         uLKyyYxpJObTX75cpLQy/XwLRDkvdJHw/hb8FTzm2c41UEmL2bIsIWQibRS2OFvxngd2
         8KkzOj8s+xdR9lFI1QGfSfWfqBA+cEBE7nlsUHUBT6ORMm+rIMCIOcXXnNkcmnkWLc7d
         jsRA==
X-Gm-Message-State: AAQBX9cmGdNI0EGDrbjvrQYW5UEWJw6NZPHR7mUZZ4DmtRDEbiMZTT/5
	B1NzXIRwqBDn6VF8ONyS/MGqUO+gONkBp1iPKn0P5A==
X-Google-Smtp-Source: AKy350ZC6xyNgcjP8aMfKxY7ekylrliGQP+/qhOjRmVfJQ33Oker2e9FNqU8ib3ppz8WLH3lFMu9Bw==
X-Received: by 2002:a05:600c:2202:b0:3eb:f59f:6daf with SMTP id z2-20020a05600c220200b003ebf59f6dafmr1583852wml.34.1680599992987;
        Tue, 04 Apr 2023 02:19:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5136:bca8:1616:ba77? ([2a01:e0a:982:cbb0:5136:bca8:1616:ba77])
        by smtp.gmail.com with ESMTPSA id b39-20020a05600c4aa700b003ed29189777sm21469734wmp.47.2023.04.04.02.19.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 02:19:52 -0700 (PDT)
Message-ID: <eb1f32f8-822d-9cfc-fca6-9e044bf4a5ab@linaro.org>
Date: Tue, 4 Apr 2023 11:19:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM DT updates for v6.4
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_021958_369369_3961975F 
X-CRM114-Status: UNSURE (   7.86  )
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

Here's an Amlogic ARM DT changeset for v6.4, with some dt fixes in regards
to dt-bindings and changes to enable Bluetooth and WiFi on the mxiii-plus board.

Neil

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.4

for you to fetch changes up to 8446b84c894f7441f8bf4410f9638e38dcb29c49:

   ARM: dts: meson8m2: mxiii-plus: Enable Bluetooth and WiFi support (2023-03-22 11:35:32 +0100)

----------------------------------------------------------------
Amlogic ARM DT changes for v6.4:
- adjust order of some compatibles
- meson8: add the xtal_32k_out pin
- meson8: add the SDXC_A pins
- mxiii-plus: Enable Bluetooth and WiFi support

----------------------------------------------------------------
Heiner Kallweit (1):
       arm: dts: meson: adjust order of some compatibles

Martin Blumenstingl (3):
       ARM: dts: meson8: add the xtal_32k_out pin
       ARM: dts: meson8: add the SDXC_A pins
       ARM: dts: meson8m2: mxiii-plus: Enable Bluetooth and WiFi support

  arch/arm/boot/dts/meson8.dtsi             | 17 +++++++++++
  arch/arm/boot/dts/meson8b.dtsi            |  4 +--
  arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 48 ++++++++++++++++++++++++++++++-
  3 files changed, 66 insertions(+), 3 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
