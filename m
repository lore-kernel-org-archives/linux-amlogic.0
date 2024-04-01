Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E0ECD128A
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2024 16:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/PyeubAksygCNXD4+5CJuLgWjG0ECHZ5uuJHu++cbEw=; b=E1/aBOdeebZIe0
	PV0v1TwK3ScxN4+abDBl4wE/aCylr7hVoUong24YqVvzV/tgk0vvOYsjeHFUxTLDw6B2YhwFagu3K
	jHtLUz/PIjH0JYrkIl4gutwbu/3OuIZdE46K3VYpRebCU+udGKcQzNgFlMsv5qQ4UnAxXztupirNa
	ezHfHm1x+aIvl2C5DfLSOQvfPY4hzo7qs3Hn8Gt722p1hJFqjUH0RQ96ah7fP0KOkki+ocXszc0BW
	hkVCkHHD/m0/bDpLfzQ5s5eWPitPY2CLDbJ/YAvRN7WLFmYJC2hUZgRXBmRRhpg1Af753NOBNz+Ul
	43/ZZ9jamCUzMaVzeneQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrK7U-00000008HXr-2okW;
	Mon, 01 Apr 2024 16:02:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrJ6h-000000087CX-42qT;
	Mon, 01 Apr 2024 14:57:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6FF17CE09B3;
	Mon,  1 Apr 2024 14:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296C3C433C7;
	Mon,  1 Apr 2024 14:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711983471;
	bh=s/Kq0rz7zLu9YXogoVE0wyeYA30vKKY0Jd2nsR5FfWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gYEoLEsXkFl7p10gvrZ1Wk5QHBxQVt+EFOdrWhph1e9/qsMyGexSBW6NZ1o1ruMN0
	 alFvVY1mFnaOMYx/EiL3ikLRN1Drv0Vfv3BWicg2qPUaHmNnvFppBpgEUF+m+y1xDf
	 6WXsYJf9iLDB/hKVCqsKvFSNeHKmo0NvhZFyz4pL5ZM14W8PWzbOZYOJ87z0K5SAXG
	 SYxDA4MEMYO+pYyhOWBJ6sjaTeVNE5NUKmWwiwY485YvOM8vAw+yuYe8vAcLMBxkfC
	 +Nv/PVRxS6w8SqOhin72KVz0oV+csNZj3QCEuRPDxvG6HD/+ZBVVc0GGxU3Aa+pAt/
	 FUYPe1vdfDKvQ==
Date: Mon, 1 Apr 2024 09:57:49 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: sboyd@kernel.org, neil.armstrong@linaro.org, jbrunet@baylibre.com,
	khilman@baylibre.com, rockosov@gmail.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
	kernel@salutedevices.com, devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org, robh+dt@kernel.org,
	mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org,
	martin.blumenstingl@googlemail.com
Subject: Re: [PATCH v1 5/6] dt-bindings: clock: meson: add A1 CPU clock
 controller bindings
Message-ID: <171198346654.607486.15665713709092404506.robh@kernel.org>
References: <20240329205904.25002-1-ddrokosov@salutedevices.com>
 <20240329205904.25002-6-ddrokosov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240329205904.25002-6-ddrokosov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_075756_293443_1DDF643E 
X-CRM114-Status: UNSURE (   9.49  )
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


On Fri, 29 Mar 2024 23:58:45 +0300, Dmitry Rokosov wrote:
> Add the documentation and dt bindings for Amlogic A1 CPU clock
> controller.
> 
> This controller consists of the general 'cpu_clk' and two main parents:
> 'cpu fixed clock' and 'syspll'. The 'cpu fixed clock' is an internal
> fixed clock, while the 'syspll' serves as an external input from the A1
> PLL clock controller.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  .../bindings/clock/amlogic,a1-cpu-clkc.yaml   | 64 +++++++++++++++++++
>  .../dt-bindings/clock/amlogic,a1-cpu-clkc.h   | 19 ++++++
>  2 files changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,a1-cpu-clkc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
