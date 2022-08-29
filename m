Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F55ECAAD4
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 09:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:CC:To:Subject:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jnL7NBBp/a73l80ghbR3Lk29dfdfd74qiWC669kCF78=; b=r7iMOkwHnVA0geLO7AZHCMd400
	ULE9ATUKbGiUbh2174Zo0x9OIEEmLl09oeU3RM8+guk1OHD4yqvBovRMF6yvjN7vpoMTXRk3VX8PY
	UonrRp+191oTvvO7ZQQgWKotkcQLY/yXerdWonkudLyR0ZgNG4rMQJr5sd/gTxbZuPEisKYq0egUN
	dbUcG7pDr0l4SF6MCMqRFzNzatAl3FidNistOrZoo6cNndGs00MU4ZabsqwXkNife2zBFYWhhuD/W
	TeMz4aPAWSZNcxwvXXjCNwt2YeLJiWJ0jYGw2oK/9uu7d0qMOl/ki7Cz+reBSkgS2FDI5ZNTtUyo2
	cPLR31nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSacr-006SYL-ES; Mon, 29 Aug 2022 09:00:09 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSaS9-006Nzl-Pg; Mon, 29 Aug 2022 08:49:07 +0000
Received: from [10.28.39.83] (10.28.39.83) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 29 Aug
 2022 16:48:56 +0800
Message-ID: <2d7e10d2-9a74-12e7-4dc0-28a239eecee5@amlogic.com>
Date: Mon, 29 Aug 2022 16:48:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: Huqiang Qin <huqiang.qin@amlogic.com>
Subject: Re: [PATCH] arm64: dts: meson-s4: include meson-s4-gpio.h
To: Neil Armstrong <narmstrong@baylibre.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Content-Language: en-US
X-Originating-IP: [10.28.39.83]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_014905_908643_DE4E606C 
X-CRM114-Status: UNSURE (   2.82  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 29 Aug 2022 02:00:07 -0700
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On 2022/8/29 15:41, Neil Armstrong wrote:
> We understand, but since the Upstream linux codebase want to avoid dead 
> code
> as much as possible, please defer this patch when node will actually use 
> these gpio defines.

Thanks for your explanation, I know what to do.

Best regards,
Huqiang




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
