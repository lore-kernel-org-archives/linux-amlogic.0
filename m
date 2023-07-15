Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F055EEB64DA
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jul 2023 02:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lfquSakKXVe33OVnUPE2XC5Oh/j4IJU/Ia8GDsDjz8Y=; b=YMCrW2uVvjV51N
	YvlxlN2+46C8/W+0+AN2lrMtFVOocugbK99AW2AXVW1LiYqjE4CnFzJMPaH1VbCLD37gMBkoRypcu
	/B1b0WQJbvqWneTOLhOtYABX8y+iSJmdnarrPSLMYL/KTGVCuqHy0Vxe1JO7HE4jfKmHYvankiGog
	l/6LMddeuZ4mu+JohHYoxrV9QR2jfTpoA5LnWzbSjncSmFLY8buVRXIwW7w5snRDb/BKTiVmyXTMm
	pLGYM1AbHwr4LJ8UnIG4oJivj80YiRdbDFe0dLnuhZYoaR9VnKLFWmInYO5GiLK2eIc/nPkMWm9kQ
	4wGn5cLSICpoSNPxuE5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKVJl-007k2r-08;
	Sat, 15 Jul 2023 02:47:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKVJi-007k1t-13;
	Sat, 15 Jul 2023 02:47:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C906161E19;
	Sat, 15 Jul 2023 02:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05EEFC433C7;
	Sat, 15 Jul 2023 02:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689389249;
	bh=u85/vf6ROEFLRTj+zJXTL4S/kz2IqkicsRjV13SwxbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WeNH8yJolg21n1tVQQVHUeBZAnvLt6lrhqi08lI7fnAAQSpaWSlFUJQif62xNnTPj
	 rrsDErxyeXnYu73dOKHYseuMrj8N9hG1qyJTIBsBvlX2/Im8veciZfCPtMLW4dALYI
	 CAV1v1GrGepq0lVv87YbScJrHJrUesjWgTXaq8M7UkPSwXJ9TWu0HkVDz8EyTWNkBS
	 0s7xU3JIn/rO+Qy5ARWQq8bYv8Bv5qwj0FvFnlrw3fAmblw9eAnkB5MISm2wOdylED
	 7G7V484ng2piTFbUhovkSFl4wjOKHbjIL90Q40UCUFPW2SHaBzVIcDNlsXv67oilAC
	 9XJRavlfgd6qw==
Received: (nullmailer pid 876115 invoked by uid 1000);
	Sat, 15 Jul 2023 02:47:27 -0000
Date: Fri, 14 Jul 2023 20:47:27 -0600
From: Rob Herring <robh@kernel.org>
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: neil.armstrong@linaro.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, brgl@bgdev.pl, andy@kernel.org, linus.walleij@linaro.org, linux-amlogic@lists.infradead.org, khilman@baylibre.com, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, martin.blumenstingl@googlemail.com, jbrunet@baylibre.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V3 1/2] dt-bindings: pinctrl: Add compatibles for Amlogic
 C3 SoCs
Message-ID: <20230715024727.GC872287-robh@kernel.org>
References: <20230714122441.3098337-1-huqiang.qin@amlogic.com>
 <20230714122441.3098337-2-huqiang.qin@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230714122441.3098337-2-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_194730_405245_CF9509C7 
X-CRM114-Status: GOOD (  10.56  )
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


On Fri, 14 Jul 2023 20:24:40 +0800, Huqiang Qin wrote:
> Add a new compatible name for Amlogic C3 pin controller, and add
> a new dt-binding header file which document the detail pin names.
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> ---
> 
> V1 -> V2:
>   Unchanged.
> V2 -> V3:
>   Updated commit message, and compatible are sorted alphabetically.
> 
>  .../pinctrl/amlogic,meson-pinctrl-a1.yaml     |  1 +
>  include/dt-bindings/gpio/amlogic-c3-gpio.h    | 72 +++++++++++++++++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 include/dt-bindings/gpio/amlogic-c3-gpio.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
