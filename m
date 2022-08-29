Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF2AECAAD2
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 09:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:CC:To:Subject:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oLNSINkvGG64ESLf1CKMwzExvHjItBaBum8z4qScp54=; b=XJkQphDs/y3iod4qz4Og++WrNy
	xDxfphJ4s7rM8jquc2R5RSLfcNYLXt63JZyY5d8sXhRIELOjQqFT4VxKddOpi3Ti6KwyyyinaNEIZ
	oZwqBSuca7gKEW4iFvpX5Owo59sKy3T9h1CKNCI0KLLttQmB6OKmvL9Bv4tcDkvwc7VyxM4sMWb2F
	IMSZYY+Ex+pne2SePIWyg1tTKTpo6f3+b5eRgvcEapRK38p7tqAbPX96ftK6ysVT/J+jSDigbJX2N
	vFhN5FqHH92TZscUVUKQyv0w3Ap8UZ8BWGStoMbBPHfb897sOAGs7tT8O/7q6wR/x110wEVQNaDhX
	cUuYMChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSacq-006SY4-Rm; Mon, 29 Aug 2022 09:00:09 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSWUq-004XPg-Hd; Mon, 29 Aug 2022 04:35:37 +0000
Received: from [10.28.39.83] (10.28.39.83) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 29 Aug
 2022 12:35:26 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
Subject: Re: [PATCH v2] arm64: dts: meson-s4: include meson-s4-gpio.h
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<narmstrong@baylibre.com>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Message-ID: <e0f479d3-744c-9eae-e1fb-1a617c806890@amlogic.com>
Date: Mon, 29 Aug 2022 12:35:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.28.39.83]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_213536_643029_BDDD6300 
X-CRM114-Status: UNSURE (   4.46  )
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

Hi Krzysztof,

On 2022/8/27 1:40, Krzysztof Kozlowski wrote:
> Then the header should be added when the need is implemented. Do not add
> unused headers to files.

I understand, thank you very much.

Best regards,
Huqiang


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
