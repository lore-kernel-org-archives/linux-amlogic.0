Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55811C54EED
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 13:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GN0xLSwNuHiBKMbE923jqRFSRhHfw4PS5CWIJr9NxXk=; b=WX+1bg0uPcf4f1
	p54X2ZYYB3Qfd3vnpxxpe8VUbcbbbScxTFGdl2lJxvHog9EEuc9pQBcPyB2Huq8xr+jvW6BPmaQDC
	wP1RtIhHuuHAvrWrynQFOPbMCByhqyBvWqXLoCssQrSAnbXQ80USLxbTe9iqWP6MUcF/tZxl6UxnR
	gPfNo7lqbgryEXWvV2PIrYMeogWksXh5K+ftKoymvvy7hbgOgEert/NeyVYuWdGxCs1bW3wBS6srZ
	MtBX8dwMzc0bG394g1OXsekeC88xhMM086Sfyr5mPSyoXkcDydM7LhZKZqaHcTSUXbEuVq873DqT1
	kGDVDclnlaL0CnbWKbgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMUHS-003hTQ-0h; Mon, 30 Jan 2023 13:33:06 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMUGb-003hIq-U4
	for linux-amlogic@lists.infradead.org; Mon, 30 Jan 2023 13:32:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso3174150wms.5
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Jan 2023 05:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZVWhEHW43oX7sQlEDJILjX50KrBGQjN10LWiSk9a9KM=;
        b=hcDAnf/bYrG7Y4ETa1rysHlNhAk+wXhmO3AjLEiCzvLtdOZPkZwqBiHEBxE4mTBpgT
         eQxrp0c1Prqh4q+0TX0anwXtPWIi+zq+GObdAKBC909ecFou2bbRZLbRdSKKinfuvzB6
         AosqyTVDzbmX6wAkhXxCOi0Q6JijdGD42w3NEF68j0wDlljJxZKHbafi6K/dtJfCbGu9
         BcajvTCh/+gqvZPgUmVvZakr0Gfk+/6d73j4y/FeEtZL0CxCfTLjeMpNOY7RVyiWEwMq
         uejwAOzeyAmcbpYe2bMl2/NOTz5KIcuYa8vrMpbo0Sv9rAu2p5Q9tswHerWbBXy6VVXP
         v+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVWhEHW43oX7sQlEDJILjX50KrBGQjN10LWiSk9a9KM=;
        b=FsDYFJEHrN0fJcdmIASr1yRxXAMmdB9SbpfgQAcRE10ENMMtdy+/7eCA6rq3k/bPoq
         qs1XjTLs45+/iGj0pjhhiHFuXGyGYxyetH8de1lIwzEX9HHoRrk4Ot08b6Mz7reDzmPq
         duMQrNeuq4HqNRfCBdmvAQ8NUGuwst4IApqCUBkWaMkrHrMBx0hfmNRQ9FvyWMCdjHBa
         1cvMsv+88QATyCOv54KRYc5CPFepdsSyQpVHWKrp62p3NFdK8C3lFUxsie3shvYIBVwD
         lGdX1z3RBVHmZGTk7QarSRguHOIhlC767I8TD8ANlnRq/aVf9oqDyFIEUvA4I0GwWAmZ
         VyBw==
X-Gm-Message-State: AO0yUKWWgm1eAlUEtzD6vlLE+NigO6qk7+yzyDXPkE6K1n4oY+DlcR4B
	92GC0CxSBeq/FVQ92Dshv6UDaKOLw6MhOIyUiVw=
X-Google-Smtp-Source: AK7set9tSbrckqaVPuQ5e8am5m9vCiJFcQFPO2FvqFOYoVSvrbsMfhhjKE58/oStukfSyN3utQCBQQ==
X-Received: by 2002:a7b:c8d0:0:b0:3dc:4811:acdc with SMTP id f16-20020a7bc8d0000000b003dc4811acdcmr8261473wml.12.1675085531286;
        Mon, 30 Jan 2023 05:32:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5f17:219:cb05:7cd? ([2a01:e0a:982:cbb0:5f17:219:cb05:7cd])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600c510200b003db16770bc5sm4776923wms.6.2023.01.30.05.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 05:32:10 -0800 (PST)
Message-ID: <ec9552d8-96df-a677-ab94-9723f5c30f1c@linaro.org>
Date: Mon, 30 Jan 2023 14:32:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic Drivers updates for v6.3
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_053213_975751_9F608459 
X-CRM114-Status: GOOD (  10.09  )
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

Here's an Amlogic Drivers change for v6.3, with:
- add NNA power domain for A311D SoC
- convert meson_sm.txt to dt-schema
- mark amlogic,meson-gx-pwrc bindings as deprecated
- fix meson_sm by using NULL instead of 0

The NNA reset & NNA power domain bindings were added to an immutable branch
and merged in this driver PR and the ARM64 DR PR to satisfy build-time
dependencies.

Neil

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.3

for you to fetch changes up to fcdc53aceed413dce3ef1d0166a8e9348d5a9c94:

   firmware: meson_sm: stop using 0 as NULL pointer (2023-01-10 15:21:13 +0100)

----------------------------------------------------------------
Amlogic Drivers changes for v6.3:
- Merge of immutable bindings branch with Reset & power domain binding
- Addition of NNA power domain for A311D SoC
- meson_sm.txt  conversionto dt-schema
- mark amlogic,meson-gx-pwrc bindings as deprecated
- fix of meson_sm driver by using NULL instead of 0

----------------------------------------------------------------
Miles Chen (1):
       firmware: meson_sm: stop using 0 as NULL pointer

Neil Armstrong (3):
       Merge branch 'v6.3/bindings' of https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into HEAD
       dt-bindings: firmware: convert meson_sm.txt to dt-schema
       dt-bindings: power: amlogic,meson-gx-pwrc: mark bindings as deprecated

Tomeu Vizoso (3):
       dt-bindings: reset: meson-g12a: Add missing NNA reset
       dt-bindings: power: Add G12A NNA power domain
       soc: amlogic: meson-pwrc: Add NNA power domain for A311D

  .../bindings/firmware/amlogic,meson-gxbb-sm.yaml   | 39 ++++++++++++++++++++++
  .../bindings/firmware/meson/meson_sm.txt           | 15 ---------
  .../bindings/power/amlogic,meson-gx-pwrc.txt       |  4 +--
  drivers/firmware/meson/meson_sm.c                  |  2 +-
  drivers/soc/amlogic/meson-ee-pwrc.c                | 17 ++++++++++
  include/dt-bindings/power/meson-g12a-power.h       |  1 +
  .../dt-bindings/reset/amlogic,meson-g12a-reset.h   |  4 ++-
  7 files changed, 63 insertions(+), 19 deletions(-)
  create mode 100644 Documentation/devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml
  delete mode 100644 Documentation/devicetree/bindings/firmware/meson/meson_sm.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
