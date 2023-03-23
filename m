Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29453C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 09:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RXZVKYD5U3yLozCvReWzEtGjhW8cCbLAW/6I8I94KgY=; b=s+Ixyd19PjDMwG
	gLcqAo6pIf9DfY9rhMseREmc3VS6MFioTzI1SBwWTou7eReHnxmMxfB//XGRXq1RjbNo0RT6Xhljm
	NHFYN2yWnNVyJVvt57GBiQPfRJjAxp+MgxNCzs9cIPERHruXIkjBJqIcchoccnwzFy/g0WmRfc9hH
	0A9DietJNopJ7j7Q0p6sOPNqq1cIBR1kpAYtXf7doZd1rQ57IgNBCGOq442+CCvH5BVZ8bi4pebL4
	YjGktf4/t5RJeaMW7KNivM6nE3I6q9FuNUU0vKwuotrA89M0ENHU1/bMF28jG7l4lSXTHeMY4lKck
	gXobB4Cq9Bp2hNHrKvHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfHc6-001Vj7-1U;
	Thu, 23 Mar 2023 09:52:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfHc0-001Vhu-0b;
	Thu, 23 Mar 2023 09:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679565121; x=1711101121;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=c5AVjfNTyn5jyoWxBV5nksKULO7WagsKTvP/gGAu+pY=;
  b=agE+WBpW56k8TdbPrYLLdqpTOtkEJfBw8IzFQ//Fxr5gUDiXrwhPl5U9
   8+rKqXoaV5SPbWt5Uw+HANBbNq911il4eW0XUI1Qt/tWfesz8Y8Qf97cK
   1pvTVDDqCSW2+j423+NwHE773t+7/vTxghfYqh5xMP74r1QP9XLXnb9e9
   zRVplx0/spRCJn4MBFvSEJn12irC9FtUP1G+pwCZ4Y25fcFpQ9HoyLQPL
   XAtnd7ab3Q5nX8ZroQ+I7b83athVmirik7eRC/jpZ5MPyteJGCw2hppPc
   hNaIbjPNV4BavN625axbpNBaD/NOjUO2yPMe6fHpP9eCC6pGQKZKHS0fa
   g==;
X-IronPort-AV: E=Sophos;i="5.98,283,1673938800"; 
   d="scan'208";a="203041791"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Mar 2023 02:51:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 02:51:37 -0700
Received: from [10.12.67.87] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Mar 2023 02:51:33 -0700
Message-ID: <429849c0-1be3-2fc9-185c-9b5630304b13@microchip.com>
Date: Thu, 23 Mar 2023 10:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: i2c: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Hector Martin <marcan@marcan.st>, "Sven
 Peter" <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Michal Simek <michal.simek@xilinx.com>,
	"Peter Rosin" <peda@axentia.se>, Andy Gross <agross@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
	"Maxime Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
	<linux-arm-msm@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20230322173530.3971676-1-robh@kernel.org>
Content-Language: en-US
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230322173530.3971676-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_025200_306323_3AA75EFA 
X-CRM114-Status: UNSURE (   6.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 22/03/2023 at 18:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring<robh@kernel.org>
> ---

[..]

>   Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml  | 2 +-

for Microchip:
Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Rob, best regards,
   Nicolas

-- 
Nicolas Ferre


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
