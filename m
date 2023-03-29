Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60F1C6FD18
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Mar 2023 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dLs5yzynJc16vnZi2xC/GBT+cwnEZ3Ov+x/s0OeeCFo=; b=kNZEPrO0c67LdZ
	GWZM/ZIX0pVRksYaCo2rgmVmy0c/wxv9bhR7KKh5+71l3z+K1n/eTHSbXqMbE53Fyavoj6LiMaMwc
	C6sVJqfi1ICO6QO3NiKfMKlagdx4m4Aeqpxm47pxGjhlOdD+3G5B9Cuncg7I2yDyzitOeCy1sMwls
	cmLsNXextH3KwbN3/9VK+TurIV+F7hrco6alLVNCkUsWdkZbCkU1+rYAMFUozqv26gaNtasSUsDjd
	6NSrsdU2aAZBwQ0bQnjgusQgvc4IDe8vzrGvN5hmlT260nJ2nLnzJSQTHJWxXm/qzUrjEyOulf2r8
	OXfZ9pyzHpohushGUe2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phUpZ-000B4T-0Z;
	Wed, 29 Mar 2023 12:23:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phUpU-000B2i-27
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Mar 2023 12:23:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id u1so8770121wmn.5
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Mar 2023 05:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680092580;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZHfKG+E4efNoQwXPSxPG/5jUC3noBlzcf9wCRGCH2gM=;
        b=bp1MUtMwcoBxDMNX8aLUxJJngqz5fWMuKR3N3V2MLtL8Of6MRaDnd3+sq1Mhbazok6
         FurA6nZm1pcDNi5INwJYkAmzlwJp/0eArNBpHBHecpdD0c322miaa+e6fXEruc0QgSUf
         OmsP3w35b/u8c0tdmGPkSk05G5sAnk8uEZ3LDN6RI+a8k3RKfgr71/CCKhQ35oplFM3+
         SPDIhaFLOpkfuW07cjJ8DBtXWLRLBEahmP+g1JQ4Omn78mU9u8Qqssr+lcRwZOTNK1XW
         ExI2rM/cRy8M1nouV37DWDQd4BPkwJCpnAspaG0eNuQ0Q58JZf8irlMjU09wd4XmKfPC
         7QDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680092580;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHfKG+E4efNoQwXPSxPG/5jUC3noBlzcf9wCRGCH2gM=;
        b=NUSIH6U9e+saATOW3iiJr0lTKC6qvAVxIwaLK9R/g/8+gFbWOGDtdfHBLlS/PNBWla
         PB9L+agyyW+nQGrN08NFRKWp+nfWXYVjygUCQWBNj3Us3bzjOGWY8GamGqfGlAqhF2bi
         GCCi0ILkKHUWItlplEV5Ww0F9s8jT66rHo1Y3te660Npm2R+zMj7rCJEdXtbrEdygia9
         +n6W6ELhWbJLpR/8h4z+5XczGSme6SqZaWjoEMFrzXwB0QUsLzBCmUwXoDbtF5dxwO0w
         S3OXhuPl7KwQj87WZl+q9e1wdaZGaVP/lAgoQsMPbo1s4hieMOchimldtEsN5cIYYpPT
         +4sQ==
X-Gm-Message-State: AAQBX9dmMao+kJ9WMwybr3jsqiUgDYXdIOqmDj/wJy9D3c7h7+9CJkvC
	aV1xRszK06qiEmJPf0e3kJuyswPZVz/tyvhGNEQpRg==
X-Google-Smtp-Source: AKy350Zf3iXeyV8HWlp0DqmYv47pev44UJE5kdHcyWJcctFoflQHm2VPhrLHRasu7gsCmvQXXwpf4g==
X-Received: by 2002:a05:600c:204f:b0:3ee:6d88:774a with SMTP id p15-20020a05600c204f00b003ee6d88774amr1400047wmg.14.1680092579919;
        Wed, 29 Mar 2023 05:22:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:72a8:b5f3:7fb:fd29? ([2a01:e0a:982:cbb0:72a8:b5f3:7fb:fd29])
        by smtp.gmail.com with ESMTPSA id iw13-20020a05600c54cd00b003ef6988e54csm2149166wmb.15.2023.03.29.05.22.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 05:22:59 -0700 (PDT)
Message-ID: <db5fcdb4-60e8-95e6-06b5-1ac474ecabe3@linaro.org>
Date: Wed, 29 Mar 2023 14:22:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic fixes for v6.3-rc
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_052304_691074_BA274BA8 
X-CRM114-Status: UNSURE (   9.30  )
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

Here's a set of changes to solve a conflict between the DMC memory space already
filled with a node and the Amlogic memory bandwidth perf HW that was using the whole
DMC memory space. The patches fixes the DMC nodes definition and changes the base
offset in the perf driver.

Will acked me to take the perf driver fix through my tree.

Thanks.
Neil

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-fixes-v6.3-rc

for you to fetch changes up to f9d323e7c1724270d747657051099826744e91e7:

   perf/amlogic: adjust register offsets (2023-03-27 17:31:22 +0200)

----------------------------------------------------------------
Amlogic fixes for v6.3-rc:
- fix conflicts between DMC memory space and Amlogic perf driver

----------------------------------------------------------------
Marc Gonzalez (3):
       arm64: dts: meson-g12-common: specify full DMC range
       arm64: dts: meson-g12-common: resolve conflict between canvas & pmu
       perf/amlogic: adjust register offsets

  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 15 +++++-----
  drivers/perf/amlogic/meson_g12_ddr_pmu.c          | 34 +++++++++++------------
  2 files changed, 24 insertions(+), 25 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
