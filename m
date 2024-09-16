Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE323C3ABB2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 09:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QEYJ4bZgdm3BMaazQtZjpt9W9Mt0VrlVpv65/GDmFHo=; b=hsAQyQSiUuyiJr
	rAyXTH7j14JcVyEPa47z2hq08fjjHQdc+u/+zqy5ZiSzAwF1WR6enU4n6IAdpSyhbDP+PBD8QEMIR
	OM99To45MMDN2EHcA9Qp/kYJ1o1+oGmMW8ifdxAj2LLktJxp94i4Bm1lqKFJUSb8OL4sdCmZOL6WM
	nsA3O0rXBS+caHHX2g4IjxQaRP17RymPd2NFJJCZuWcWR8Vm873sXM4E8IjZSZqv5Cbpdao0AuOO/
	vQ/I6dCGJ87qdREh4adt1wv0umoOSsGSu3vhMOUwy2EZtbb5p7STV78YG1crfepqv/mRJgPy8gILc
	viErtvhVabLerkuFfewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq8Gu-00000003bVt-0sms;
	Mon, 16 Sep 2024 09:43:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq8Gr-00000003bV9-2evK
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 09:43:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 641CC5C5708;
	Mon, 16 Sep 2024 09:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAD8C4CEC4;
	Mon, 16 Sep 2024 09:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726479828;
	bh=uSLjVMOFtjZ6RN5n2oEbfcv69+hcDB7RedYfY0m4J3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VPvHXqk/f8+eUm3LxYMPvdkcxy7SbCr6raEVx58xFF5uuoMAdjmOor+HmP+kpR4uQ
	 S5rJi/E+pDizyB24Sdqd/VhkL5bvN1P+oLHkU8SJ/0aT+NBngwKxvyuycU3vsfBLOI
	 2uq9egVifX2vRvfqUMgQjXf/q5X5nkrVAbo6nznPKKYl3KTUe7rcw3XOKZtFqzkeHQ
	 GiUm7lkvEPgLkW8s6O0NhV/I1p5gP4rVYHoq1zRGODBIHW1/dANXaFqHzhrM4Qoz5V
	 itDaOFF18Ft9W6Cj3+D73zeznIMWEsbAScczDZYMyfk/MvxqcTnqFt6AHCXvkdkUcY
	 ON0dvyU0QobXQ==
Date: Mon, 16 Sep 2024 11:43:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Yiting Deng <yiting.deng@amlogic.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: rtc: Add Amlogic A4 and A5 RTC
Message-ID: <u5dtpbnnfrjwf5nmpxfug4fd5argwdu5oi4cogu2wiexkw3l5p@qxjxu52w3pea>
References: <20240910-rtc-v3-0-1fa077a69a20@amlogic.com>
 <20240910-rtc-v3-1-1fa077a69a20@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240910-rtc-v3-1-1fa077a69a20@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_024349_735244_AA36F68E 
X-CRM114-Status: GOOD (  15.84  )
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

On Tue, Sep 10, 2024 at 06:14:18PM +0800, Xianwei Zhao wrote:
> From: Yiting Deng <yiting.deng@amlogic.com>
> 
> Add documentation describing the Amlogic A4(A113L2) and A5(A113X2) RTC.
> 
> Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../devicetree/bindings/rtc/amlogic,a4-rtc.yaml    | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
> new file mode 100644
> index 000000000000..eee994753a12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2024 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/amlogic,a4-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic A4 and A5 RTC
> +
> +maintainers:
> +  - Yiting Deng <yiting.deng@amlogic.com>
> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,a4-rtc
> +      - amlogic,a5-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: RTC clock source, available 24M or 32K crystal
> +          oscillator source. when using 24M, need to divide 24M into 32K.
> +      - description: RTC module accesses the clock of the apb bus.
> +
> +  clock-names:
> +    items:
> +      - const: osc
> +      - const: sys
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

If there is going to be a new version, keep the same order as in
properties: section.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
