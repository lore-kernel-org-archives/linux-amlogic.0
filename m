Return-Path: <SRS0=WwkR=X4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45AC1C10F14
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Oct 2019 18:16:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FD4120830
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Oct 2019 18:16:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cOH1FVQY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2gRfkDNa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FD4120830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIMJKKkOkLUvtxFvZBmA30x82NzxIoq8fZASxZwJOF8=; b=cOH1FVQYnsAPx9
	6RJTesjyxVGTOLW4hIZ6xDt4XrFZJyT2AXVKg5dt4t6uk22WgyEBC5lpNtAWfwTeseo59w4DLmx/Y
	ZiMjHGYmKvnSlQjr2iL4MvjCz5RG1CXHrtjOdl57GTiJErpmEG+r2hlWEQcNNH6QHzoyI2tJHU9cs
	rXeLJ37Z1OQVvwdbEKPmsSHx9mOA5NL2dTwFiBxNtM6zgK7kDoN/vfO3iQj+YUnJXx6QyEXtprjKF
	wF13vnT4MHtNL2a2uajHozRRDyllkxO2r81LOr7mVIJ4XeR6NVTd/OmNbKt+YEK2xmC4seUFb5Qj5
	l0W8G1jPcxU+o2xCbA+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iG5e0-0004tN-5c; Thu, 03 Oct 2019 18:16:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iG5dw-0004se-U7; Thu, 03 Oct 2019 18:16:02 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D6F22070B;
 Thu,  3 Oct 2019 18:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570126560;
 bh=nY0LFXVk/SNSsj/nGuYEk8lLimBHZ/kip/5QktLE30M=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
 b=2gRfkDNay4GQ8GVL40xt/FVRFNW/T6303w/jbXj7QQJVtdz7LzvfbC54mYR4mS8r6
 KQrbne3Qg2j5ZURd8qpfR/Rh1gEJ2uKXn/h1RYTKEuhbn9SwE6Q8jFz72JIOLIqf2W
 RxAgIOfeWXuJqXwwCg4HHAy4gJrGQtAqfIWHrd38=
MIME-Version: 1.0
In-Reply-To: <20191002164047.14499-1-krzk@kernel.org>
References: <20191002164047.14499-1-krzk@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: pwm: Convert PWM bindings to
 json-schema
User-Agent: alot/0.8.1
Date: Thu, 03 Oct 2019 11:15:59 -0700
Message-Id: <20191003181600.7D6F22070B@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_111600_990143_AEBC3E4C 
X-CRM114-Status: UNSURE (   7.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Krzysztof Kozlowski (2019-10-02 09:40:46)
> Convert generic PWM bindings to DT schema format using json-schema.  The
> consumer bindings are split to separate file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v2:
> 1. Change also pwm-sprd.txt
> 
> Changes since v1:
> 1. Indent example with four spaces (more readable),
> 2. Change pattern for pwm nodes,
> 3. Remove $ref from #cells.
> ---
>  .../devicetree/bindings/clock/pwm-clock.txt   |  2 +-

Acked-by: Stephen Boyd <sboyd@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
