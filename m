Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F88C3DA45
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jul 2024 23:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6OAfMsqQgsv2tSAMmZPt9ih/EwaNv1cjKHh3uXutIpI=; b=wWZXvKU1PAjWni
	EGmmMR8CSvozTzvGOtnrlJ0f4JQFiQmtSpVo5ey0B1UxChkDdk6G5qAzbIb1LSOdB0xYsnDLXCvSy
	/uN2zYtf8TOxud2zw8SuR3qystL900dsffVPTRCXVMKwO8qhnydPJ12Pg2z9GiQJJLEtlmZ1Htwzz
	sS3I+rhoM06KmPTSqaVn/QXOG/8K4xdA0biFy2MPLlrebIIC1sEuFvB9PGeI2TbtIbPhB4ZpR7B3e
	QxiX2A3ZYFo3QOvBPsG4c7MDDDMqIpfw3D7IovL6/ybKXWBKk8G8AVHH2KYeivuF9PHndU78waVM3
	pKTR4crrK8p3iA5RK4Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS3gh-0000000Fsdp-1iG8;
	Thu, 11 Jul 2024 23:58:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS3gW-0000000Fsbn-059w;
	Thu, 11 Jul 2024 23:58:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3664CCE19B3;
	Thu, 11 Jul 2024 23:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8BBC116B1;
	Thu, 11 Jul 2024 23:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720742325;
	bh=ktsn/j9zoy17I5McpCAkdJifL+uddoJ55SLYw0XUFqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sl9OEyLbt8GPnUbgcKiLQ9sRjF3DLxyCtjs7yZ2E9G788UcU7+IaHGXo+PL2A52f6
	 e1FOW6F0kVfKJdQBoqthVj94pK57Yg3uRVurQoYDWJM5l8Am1RIapu2QpZF7ZjeMfP
	 ouEOtt7kJE57+tYupql2WOu+9c39tbBO6wC2AB85KOcPvVbqepz0rLKzKhZsRIpqT3
	 5AUNklHXG4hR1MK3Fs3nokhNg5daNoAxgeTsMycvRBJXDvDzCwdQUwb9uqMSns0u6D
	 2JBtth3uFht/OlSBseKFwqQbB726SiNuB0n03IhCghVmXJzQHsN+KCAKsPzrYO+ykP
	 YUnEe53zsv1vw==
Date: Fri, 12 Jul 2024 01:58:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, glaroque@baylibre.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com, b.galvani@gmail.com, 
	mmkurbanov@sberdevices.ru, linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@salutedevices.com
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: amlogic,meson6-i2c: add
 optional power-domains
Message-ID: <ca2zfkqajyco5bfjyr4xde67hypcn3gl4s4vlvlte6uljpnw44@6eqhqmodul67>
References: <20240710223214.2348418-1-gnstark@salutedevices.com>
 <20240710223214.2348418-2-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240710223214.2348418-2-gnstark@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_165848_263304_FF4D6268 
X-CRM114-Status: UNSURE (   7.88  )
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

Hi George,

On Thu, Jul 11, 2024 at 01:32:12AM GMT, George Stark wrote:
> On newer SoCs, the I2C hardware can require a power domain to operate.
> Since the same compatible is used for older and newer SoCs make
> power-domains property optional.
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Just this one pushed to i2c/i2c-host.

Thanks,
Andi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
