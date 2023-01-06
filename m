Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8215AC3DA7A
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Jan 2023 08:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uMESsOUdprtxHU0uVf89aAPNB2pbaYI1kysDIylP/eU=; b=cDE9NnmskEdIkG
	q9IraJ3xR6wOy1LI55hQxrqehfx6nXtUSW/5pS7PZh6bV7fixAs4s3zjtVo1k6OjZUsTiy0qZnap0
	6Fg4ZWUS/lHEGfJVTCVhWKvoKtDWn7hRODWgOgQp0gaikiqwdk8YUdEp+vcwLQX653b8bDdhlP9WV
	tATiiARaPkeRdphWSDgWa2AezLnhqXmQgd8dHr3HbaFB3LAJtADabbR4hZXYm3+IX9mX9ktGwewVF
	unf4Y/cK5Dwmc0SMaHkfbbhxVp/j6uxBVD2+PvkZ/5FUk/lK98QiNmwMyEHw95GGop9N8RG2S7XmH
	2tlevuy2DfUcegjMaL1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDhqG-006W1K-F0; Fri, 06 Jan 2023 08:12:44 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDhq3-006Vxg-S0
	for linux-amlogic@lists.infradead.org; Fri, 06 Jan 2023 08:12:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id ja17so547955wmb.3
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Jan 2023 00:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GyfJFZdIdRh2RsiYptrx5CNUd4d9thwSYOnDDNRq4ac=;
        b=QbXT+24yt8nEeOm0EF1IRu5b7CIQIFHS4PUlvHMQM0VYS0Z0T2pC5sqNPGEiN56jqq
         jRKQL1lnyNNlFTwoxsJWrNJ6UDN3wGhA/XWAqvzETE8KS0cl3vP0W0qkd0VkEoR5xfp9
         Q9h6uaLV9W12L2jVLlSPpSXvO1/jmyeOINlqRMDnWnwvDOVGGMQyKpI/BNZzG9wlFXW0
         1Y3MNJjZAuPvhBhXmalfuuXsBmeW212mfkzgakOX+nULKenaRgrYeuN3Kn4FL81/v5f2
         aI4sV1RJxJ9wCQgPVsMalUwEAGZHtJpMrV/illsAGJyodCETn6yXJEWI++BLuol0tHZF
         vvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GyfJFZdIdRh2RsiYptrx5CNUd4d9thwSYOnDDNRq4ac=;
        b=O2ACYkpCW3HS0/hhjLavc8UqNukgnLvaAAl2KxjMDvRbIwQqyRei21culG2BH9/HdT
         vg2tzSrzD4+Y/HzUFtlEk09Um11vXdcP2xvS9kX61c9Ue2T4GorWqiOmt8DP2WPBoIey
         5kC8TLodiE2zkZ7J0PBiMtNNxG8Zz9KOrcAg+y3TY7b/X66AymjX8x6HD3KzchZuGCsQ
         3tyAkNrNxtKPv0yysoGjdgnF69au/2hLg7IDiIhwNBt6++Pg9udlwSvhlbXF3wibGfAv
         ZlHGHi/9dSLLV3m2U/8swK8VCCHz/YYdsUHcafECwvOaw3QHbIKsK6JNU6sFhLhv/W9i
         ofvw==
X-Gm-Message-State: AFqh2kr5Np4PXTRc9EPM8o3NScx48/Pe+HXn5hac7I6/bYbAIuixhtWl
	FohoHdqu9/r94IJpmEpzPrnsPELP78BvQFdY
X-Google-Smtp-Source: AMrXdXs+7AhCAtGKN3vokaxcoula6Zun3EwFm23Nv2khgIVWsTKJES4Z+Fvpg/IJXBOyIU7AokfuGg==
X-Received: by 2002:a05:600c:798:b0:3d3:5737:3b0f with SMTP id z24-20020a05600c079800b003d357373b0fmr47485848wmo.36.1672992749604;
        Fri, 06 Jan 2023 00:12:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a0ba:a5f3:d9f1:7e25? ([2a01:e0a:982:cbb0:a0ba:a5f3:d9f1:7e25])
        by smtp.gmail.com with ESMTPSA id o9-20020a05600c510900b003c6f8d30e40sm6034506wms.31.2023.01.06.00.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 00:12:29 -0800 (PST)
Message-ID: <7915c3f8-57bc-25e2-0314-c78af7a79d6a@linaro.org>
Date: Fri, 6 Jan 2023 09:12:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic fixes for v6.2-rc
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_001233_362309_999A562B 
X-CRM114-Status: UNSURE (   6.18  )
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

Here's a DT revert for v6.2-rc1 which fixes USB on Odroid-HC4, having both USB2 PHYs
enabled is necessary to have functional USB on Amlogic SoCs, even if one port is unused.

Neil

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-fixes-v6.2-rc

for you to fetch changes up to c45219cba101f32853d011da2ba46a1b2338dc4c:

   Revert "arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0" (2023-01-06 09:02:40 +0100)

----------------------------------------------------------------
Amlogic fixes for v6.2-rc:
- Revert "arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0" which breaks whole USB on Odroid-HC4

----------------------------------------------------------------
Pierre-Olivier Mercier (1):
       Revert "arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0"

  arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 8 ++------
  1 file changed, 2 insertions(+), 6 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
