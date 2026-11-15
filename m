Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F1B606A33A
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 21:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dppiOxCM;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=GEv9vjch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HdPeML9NeJbi2/ES30kvmubmX81zn5HCBCv2REe56zU=; b=dppiOxCMrT1e/wvuvisl99/DCk
	yMDpXMiieLSp+zYQSEweToWLG83VswlJAiiL3PO0uXKJo37Dt+EICzXcr0cTu6Br8eBsKOipBKsbF
	JSta4RD25YnBzoGh8ObtzPR/KzqrotQUVGstUtkbzBeFPILwiQrjuIGaAeqJX18MXuWpKVItvFUlg
	ZAUzpwCjUFdRYsa3pN8OJ6j0FyhZiPqddZxqLffd1l20BRWwmR9EshV+X+ULzb7dzWNAW3hGQvaKR
	v0ptXflZhbggqePrINjM4vPgAxMgjmNDkFM1V+rQp25ucToi6/OBDisYkPYx+GHG9LNyrOP2oYNfk
	pw7JS7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiDr-00000000ZpY-1fNq;
	Sun, 15 Nov 2026 21:57:15 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiDZ-00000000ZmU-1qil;
	Sun, 15 Nov 2026 21:57:13 +0000
Message-ID: <e526e0df-d3e8-4c6b-ab50-e9b4cc9bdd3c@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1794779809;
	bh=Wsvy++1Jhz31GNLY6mcfL2ulnfXKznpBChaXnW8X7ME=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=GEv9vjchECQHtag1czQFsuwD0vdspJK6CbtnGjHm4SsKXaQjIMKp5blcTP+3hWOmb
	 morU1X6i1QQuY6BlyafEREoxPdQ2ZcQ57pY+krO6WuGQ2vyP5i+pUlJ6WirubpYM0O
	 AFn7GDQ8CLgYTUlu1lM7iZg+A1K1SvVSS5ZzgXuE=
Date: Sun, 15 Nov 2026 22:55:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v4 0/3] Add T7 PWM bus clock support
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
References: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr>
Content-Language: en-US
In-Reply-To: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_135657_944195_EB5286DA 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/1/26 18:55, Ronald Claveau via B4 Relay wrote:
> The PWM controllers on the Amlogic S4 SoC have a system clock that
> controls access to the controller, in addition to the two input
> clocks of channels A and B. The A1,C3,T7 which fallback to S4 have
> this third clock too.
> 
> It is currently not described in the device tree, so it is neither
> referenced nor enabled by the driver.
> 

Hi Team,

Do you have any idea on how to move this series forward ?

-- 
Best regards,
Ronald

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
