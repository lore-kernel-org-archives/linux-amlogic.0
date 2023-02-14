Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C88C05027
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Feb 2023 21:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=piR2TncliNtDDRqQboX9ewYa2qigAUUPtGjbIFmnwNY=; b=bi7LrL6qwjCtvo
	qiXTcElufzVtTa3v64kyU6DNmddKAWT0xyVoadPEw6CXfG1SGaPJ3LlUlIL2iu/nci7g/r6OtAyKs
	funBzu7DclG0a/N128DrYRUDki077CD7a4K/t9tSLxR+18VvmoBugiZXdPo6s1QSn8TBMEBG5ynYN
	+bJTofeDOGz/ajofOrZZl3nSUAX0hOBNXY95FFYkJYQZM9so7ZYIeimX2xqTGRgDyWIQprkI9g7S9
	9g4M9sz+FamjHXTKRyh2F2br/ZJJ4Uzegiwm5Qc6Eg6IRVGXptvJp3HQahIpbRKBzO19KVMj4ulXj
	oBDwSe62bdHpz2icXRBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS34e-003drA-L8; Tue, 14 Feb 2023 21:42:52 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS319-003cJr-KJ; Tue, 14 Feb 2023 21:39:18 +0000
Received: by mail-ej1-x62e.google.com with SMTP id ml19so43624133ejb.0;
        Tue, 14 Feb 2023 13:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEXEnkugIFdL0Ne4cj0ASOooSzM+NebkL2xQfGimV1I=;
        b=LOGQQmlrrtyslhxCZq7FxaENf1OLt7gXmBHDXGo2rOO++aHdPrlQs8Zb4MaQZHCggG
         cGlLOghXahi6skESYI3e9yInWsHBjzSk4h3KPI4tKb3ov0UWbRwy56iSX49jO55ambs4
         Zo4NOWnoxHZW//xdFQiNYHdCibsGaJdXQhp6sVsSuNSMBb85PXIS/V/TRjN25sQiCtuH
         bTFfOSkMJKL7JvEZvQVLy1EhrS1vjvBUbHcN6qQRTv6QSYaNK0Px38hWS/15+C91Zutk
         Aov/JJwRXUXeK8EzenMt5RYDvNsLeAqGxggll+5cQYF/ePpAISZG7IoK/UniflPiRtwS
         utEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tEXEnkugIFdL0Ne4cj0ASOooSzM+NebkL2xQfGimV1I=;
        b=6phOPbNj/xxlnQD6XN1xro+CI39kBgeBxpiByxF9wGs51hsYZIYXbs4agMaZo5/Wot
         EPBqj6Mn/57CsD6s73BsM1lwdy4OmPLOvSeVQcYW4L4VwF/wweGZJci4+imjgLQlIsQZ
         GXrLjpWyzjWOOhthiJYIWk9H4qWHHzxbz56KvTI62os+9EtvTYsXphA6XP2jl2CFvTFo
         BdJgSI49Cu4PmzzT3ld3oFh7exeJ1fZEMxAmRnDLKmic0ZmweHFcSj9PbKMMV59+hytk
         V9Ys/Eovs/zM9Vkio9o7i332MdQNB3Ym09SnqqTs78oA4AZgbQyVwbdYP2Chc8GEgYMD
         Z23A==
X-Gm-Message-State: AO0yUKXDb1G3W9kzlIiL7uPqqxgpMx091kfheVRJ+EQgOfKhdbBjbu6y
	6AJ+RtPVLGnU4RoDtr4d0BY=
X-Google-Smtp-Source: AK7set/mSD5r81hS62kdH25mU5YugY0DJUWnsLzPYW7DbBkWHEPacBx+dzCRnQ/WPf9ol8uI4vqYfw==
X-Received: by 2002:a17:906:3c17:b0:8b1:3d04:7b9a with SMTP id h23-20020a1709063c1700b008b13d047b9amr319027ejg.38.1676410751985;
        Tue, 14 Feb 2023 13:39:11 -0800 (PST)
Received: from ?IPV6:2a01:c22:7234:f800:b56b:f43d:948c:eede? (dynamic-2a01-0c22-7234-f800-b56b-f43d-948c-eede.c22.pool.telefonica.de. [2a01:c22:7234:f800:b56b:f43d:948c:eede])
        by smtp.googlemail.com with ESMTPSA id gl11-20020a170906e0cb00b0084d381d0528sm8678168ejb.180.2023.02.14.13.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 13:39:11 -0800 (PST)
Message-ID: <15df9ef0-9b73-ca5a-d3cf-0585cd135bc5@gmail.com>
Date: Tue, 14 Feb 2023 22:39:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 0/3] mmc: support setting card detect interrupt from
 drivers and use it in meson-gx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_133915_780120_77137025 
X-CRM114-Status: UNSURE (   9.10  )
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

On certain platforms like Amlogic Meson gpiod_to_irq() isn't supported
due to the design of gpio / interrupt controller. Therefore provide an
option for drivers to pass the card detect interrupt number
(retrieved e.g. from device tree) to mmc core.

v2:
- use another mechanism for passing and storing the cd interrupt
- add patch 2

Heiner Kallweit (3):
  mmc: core: support setting card detect interrupt from drivers
  dt-bindings: mmc: meson-gx: support specifying cd interrupt
  mmc: meson-gx: support platform interrupt as card detect interrupt

 .../bindings/mmc/amlogic,meson-gx-mmc.yaml      |  2 +-
 drivers/mmc/core/slot-gpio.c                    | 17 ++++++++++++++++-
 drivers/mmc/host/meson-gx-mmc.c                 |  5 ++++-
 include/linux/mmc/slot-gpio.h                   |  1 +
 4 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
