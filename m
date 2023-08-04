Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83159C001DB
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Aug 2023 13:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hoDsY5wHX5gyrWiVOh5zsb+ep2WA2T0Ym2DC3FCTRSQ=; b=AIVsULTrLWU3ME
	/8ggPaiKiU3+SVm9NfhK/sWPodRfyti7wabIhjAQqkEJMdpo6dM0x7JZYe22Peic9PUrksoENnePj
	/Vv8ovXpP2SJs+vLiHkmb/YIShe7l9+pQrcj9dD8Gtb0TLtWDNjH9axW+0lYcmZPWYGVeF/S2VM6q
	WYYRjb72EKp+SMf+sXD3jRJj2GrBpmsBZ0K+aZAwW9+69KX5Kph65CFLIxJGvLWIQcEixfKpmWAHD
	Uev8cXgw3YNBcY5+SBKwlbbp+exP73EHjL46fq/vkUUWbqrfWB08jfrzxzysgzKGlJH3j7cDH6oIJ
	zgjdooGeUNNwziHRt2mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRuf7-00CTPD-1p;
	Fri, 04 Aug 2023 13:16:13 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRuf4-00CTNo-1W
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Aug 2023 13:16:11 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b9ba3d6157so33642371fa.3
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Aug 2023 06:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691154965; x=1691759765;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BqwP0XPoCGxv1DyF+/pXW97MbtedeRPSq5uwRhfwuyA=;
        b=DPOlCivjwpo+wG0cRO+q5wXSanDAa8/WFp+I4t3iZr5lqzwLrt5g+1ofeHfS0RhyFl
         zceTXXe7Nozk8pSRtyytLs6oJkdJovaYHEXsa2+KYBeHlz8tD38PYur2jd0UHQ+JvLw1
         xebk8fScggz7RpdAYlR5lLFKix/oK8QM9rTo5VqjOjmbovcqLEAcIFvil46Eks54BInd
         EUaADo7dK96I/JTTMRL1Eb7MYyG5fPdd0tLjrGTag5n1X5r6c6J1hyHmeABkvWpcGwu9
         sn+WCQTzL3lgvlp6hYdWJ6Yezkiv4T3L6o8yB1kI9kxQ+113K9EPWPTuWnuek8aZSS06
         SENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691154965; x=1691759765;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqwP0XPoCGxv1DyF+/pXW97MbtedeRPSq5uwRhfwuyA=;
        b=FRIcMnlu8JqlDcKzhY9/D+tCLofYxf3Joh3xkyUEikQ/MUSrwkqpnX9Kzk+Uj/eDGx
         N+QX+Bn2dDH3/FHXj6lO/tQwIMhMnEzIQfnVAPMqFt2yDLRwqJmtJPyWh4oYi8o8h59n
         yhbBe5rjl8dUHboeElsEMdkxHeV9gMvqG9MfTuajjj3UG0pA3UsAj0Kb9I/upVdB36F2
         027JbMhFX1eUAGnjjoBrZQ8jJJ3cDIA5HxnCXgIwWYmVy+eDPA15YBx/cSE9Q2zqx5vT
         k+8KjSRVnkSfIg0QWkioEAcv6MaveCHc8Rg9iKCsDqi4V2qU0VmsOAE14zFA0Er4rY81
         CLHw==
X-Gm-Message-State: AOJu0YywbXcqoARXdWKIttPd+JN8UQeVrNR5aryMbXuQfbByIZKK7Qli
	UQGE0lbtWgc6zd8oZNxZB/RK/7ljds0Q7C9TzLAnUA==
X-Google-Smtp-Source: AGHT+IHPND3VJLO1sWp/nInpN8wScTigvcoXLwR2LA+1uQD5hq06OqA/ChaVNWrWXsVlsFDvCaW/GQ==
X-Received: by 2002:a2e:998c:0:b0:2b7:2ea:33c3 with SMTP id w12-20020a2e998c000000b002b702ea33c3mr1804912lji.22.1691154965276;
        Fri, 04 Aug 2023 06:16:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:62a2:ed99:fec9:25cc? ([2a01:e0a:982:cbb0:62a2:ed99:fec9:25cc])
        by smtp.gmail.com with ESMTPSA id l22-20020a7bc456000000b003fc06169ab3sm6671279wmi.20.2023.08.04.06.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 06:16:04 -0700 (PDT)
Message-ID: <bbdfc9d4-6e02-a1aa-7871-b24f9da3419b@linaro.org>
Date: Fri, 4 Aug 2023 15:16:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM updates for v6.6
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_061610_515179_8D4A15EA 
X-CRM114-Status: UNSURE (   6.43  )
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

Here's an Amlogic ARM change for v6.6, Drop unused DT includes in mach-meson.

Neil

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-mach-for-v6.6

for you to fetch changes up to b5bd2ccac2d5b2830c1d59e759e5e35e50639b99:

   ARM: meson: Drop unused includes (2023-07-31 11:58:18 +0200)

----------------------------------------------------------------
Amlogic ARM mach-meson changes for v6.6:
- Drop unused DT includes in mach-meson

----------------------------------------------------------------
Rob Herring (1):
       ARM: meson: Drop unused includes

  arch/arm/mach-meson/meson.c | 1 -
  1 file changed, 1 deletion(-)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
