Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30204C636CD
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 13:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZIc5SQ1RAfbjtYC3uPYgKGHNgCMr01kjFML8um0luJk=; b=Kx7G23cZ/tw+KA
	bo4bmg45Lu6S4w5zzzGeHnfgIv/Yjz8Nrmnsfl71C3iEgGEoSE83zWtCoDo8VhDjDNiq8d+V2lZ73
	tXfMLSqWuhShEX3QGezKHDmHkqSm0HstAByZbMyIZ1YvdwTDn/iWg8XV5wMiRfGIuB6qGCpezb3u1
	9M8OHdYhDi1qMrvUT01r+d6ykaFxnwYJzfSt31kSLaMLVjxjZNRNw3g2EV5KxJwZyK3XVgGzKZplg
	mb0h3XfdKGWc0WNDxDdiZxD9RS25oa99NFtWFEUj8fTNyZrdXvmKSibdZ4XSFnH9kut2g6sXhaR/X
	DsvMiZ2h3qM5DKmd/vvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMUZM-003kxf-Mo; Mon, 30 Jan 2023 13:51:36 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMUYV-003kjB-GM
	for linux-amlogic@lists.infradead.org; Mon, 30 Jan 2023 13:50:45 +0000
Received: by mail-wm1-x331.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso5374763wms.4
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Jan 2023 05:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kPfRJdyRzBMwBkAF3aejwJ5wi37fWxKDR32t15X5N2k=;
        b=lALITlGubNV03BPM2ovUjJzYf0y7XqOTsGQqh9lANt1U4ENGQiyiUDHmmvqAGHIr0H
         TNZkTtZXqdgIQkhbLu6M+9EQxfQrNWxQJAfnd7lA7efoA/HtWkdDvJ5Ug8agYR4bjK/0
         gp3iNrClE5EbTHkg67bmC0WrSv290MEwGY9HX7dlX22KD6bS2h0emccUhD4iwxxQZeEb
         Xb5owubSXvGKv+H5n0sMSKV5bEOh6nCsLWl9GuzzYXwB9oZ2MEnZ6cmh7E8e/ABHe0DK
         fsqF1atS9ij8pgrrQOWnTHS00mim5vguzcSieZN2lqXajvO0fxaNi71wJv/wUItYmlIm
         1Q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:reply-to:content-language:cc
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kPfRJdyRzBMwBkAF3aejwJ5wi37fWxKDR32t15X5N2k=;
        b=BdIg+cNPeMogDMyqArLpm4gLwZ5iyQWOAU0Mx33pqyYXlZvJQbDkn7m7orkTvCn4mw
         cwlCIdqZVWLv9s+cZ6kJxp+FA/ebGUiX3wlTJY09M6Og1U6uS0u4lC9EselIyJyPQhZf
         5huhqw9HWL4kI3zF31lYMjByPHCB73s4E40+Z3vETe2deh1zlmCn4B+YKYm5m3W58Kzf
         S0WCD118ObjBfBE0fmv/XxUPXwtfDRXFH2Y1h6Cyl3kcJtxbrSkgpsR6TNul3RKN1R2O
         FxYA5ZBXNtz+ABSqh1311z5g2IOOgBmJIT3a9+fqoKlhwJkqRsKxRVDdSgJrVW311fm+
         hpxA==
X-Gm-Message-State: AFqh2krTynORfPmHFUi8WdbZeuG0SPDuy0bfJGrZjN+rTFEf6G3PqCwe
	G8WpM9AJV6kbNpT6d/+33p+QYBzbKOHyfMmxPOM=
X-Google-Smtp-Source: AMrXdXtCNP44PvDMUJHZeCvGRPDoMScvs4MBxav7tP5n4/QTbb3aqYaVn3FiO1h/abQU1xBddZtCXg==
X-Received: by 2002:a05:600c:3d98:b0:3d6:ecc4:6279 with SMTP id bi24-20020a05600c3d9800b003d6ecc46279mr46869944wmb.27.1675086641291;
        Mon, 30 Jan 2023 05:50:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5f17:219:cb05:7cd? ([2a01:e0a:982:cbb0:5f17:219:cb05:7cd])
        by smtp.gmail.com with ESMTPSA id o16-20020a05600c379000b003dc49e0132asm7395967wmr.1.2023.01.30.05.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 05:50:40 -0800 (PST)
Message-ID: <61700737-c226-1c07-fba7-6dca896fdab4@linaro.org>
Date: Mon, 30 Jan 2023 14:50:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM updates for v6.3
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_055043_576880_5B969ED4 
X-CRM114-Status: UNSURE (   7.88  )
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

Here's an Amlogic ARM change for v6.3, DT fixes and L2 cache addition for
Meson8 & Meson8b.

Neil

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.3

for you to fetch changes up to 5f4416849f0e2909189263ab76a1dd533f597d72:

   ARM: dts: meson8: align OPP table names with DT schema (2023-01-20 11:34:26 +0100)

----------------------------------------------------------------
Amlogic ARM mach-meson changes for v6.3:
- align OPP table names with DT schema
- meson8/8b: Add more L2 (PL310) cache properties
- align LED node names with dtschema

----------------------------------------------------------------
Krzysztof Kozlowski (2):
       ARM: dts: meson: align LED node names with dtschema
       ARM: dts: meson8: align OPP table names with DT schema

Martin Blumenstingl (2):
       ARM: dts: meson8: Add more L2 (PL310) cache properties
       ARM: dts: meson8b: Add more L2 (PL310) cache properties

  arch/arm/boot/dts/meson8-minix-neo-x8.dts | 2 +-
  arch/arm/boot/dts/meson8.dtsi             | 5 ++++-
  arch/arm/boot/dts/meson8b-ec100.dts       | 2 +-
  arch/arm/boot/dts/meson8b-odroidc1.dts    | 2 +-
  arch/arm/boot/dts/meson8b.dtsi            | 5 ++++-
  5 files changed, 11 insertions(+), 5 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
