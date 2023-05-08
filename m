Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A017C77B7F
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 May 2023 09:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zC30O4TeUO+dc/dQh+uFAZwaVcKap5KtcS5NfEqPDT0=; b=MeitnXYHZ4Rwyn
	svKOrnF0P6V+Wk0mZ9tx7Z8deaCFgUOIy7aynCMoj3E244zioV/3KWyZ7y3ywLlDX6YCV+cMer3kF
	h+8yVpZKcHEVhAvFZ06Ab5jZmuWT5xPIBkQbCNvA6O9FHWPqKPCs4tEtdeZaOf4DFTnvHI7zn5XkY
	Rk7qRH+53WZfjBUbji83ZhwB59vEkf2vpOALiPhlCllPOZmqqu6esj5QKoRY1XCepQ7B5gTdcF03P
	U9YJSpIZcH65nTO4zsVo5E9bfyhlseUxGAdCtJP80BLqMenAzFds4WhvMrojiztuCt646v9uV9OS6
	0Mb6NNLbXQoJZxSgVXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvxA0-0005MC-0d;
	Mon, 08 May 2023 09:28:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvx9x-0005Lj-18;
	Mon, 08 May 2023 09:27:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B8F1360AF1;
	Mon,  8 May 2023 09:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF88C4339B;
	Mon,  8 May 2023 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683538076;
	bh=xjtpkJFszM9BNKzTaTVwrSPwHtleGTIEPou2QwMYpds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oLA3fa/0kDp64fOT1Hd+PK81rCvKxAgPJtioHFS6K6/gX3qgdlddUzap/83sEaE2o
	 pUeWDbV6MiWa67vSJlTSUnPW6cbvIcplh96TUwg7nrfxfGnmHABJMelSr4E4EuoMr8
	 h8IzaMoaIDwpwYIvFHta2sKD3Xi73Fj6CljsuVvJ3eGEGIQx/n3AzjnP9J6mkrNHIa
	 CLBdAAIx1DMGQahTsrjfVzN8Q7rq/Ba603mX1kvd/FMj1XXyduxpirm7tlzHIqK8Um
	 7LNIU4XXlRAguFtmYi/f0XpaxNeZP/WO/gDeTGvitzQzAW7vTVyO3Oeccj51pTUkLJ
	 Lt9um+WzS+C4g==
Date: Mon, 8 May 2023 14:57:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, mturquette@baylibre.com,
	kishon@kernel.org, hminas@synopsys.com, Thinh.Nguyen@synopsys.com,
	yue.wang@amlogic.com, hanjie.lin@amlogic.com, kernel@sberdevices.ru,
	rockosov@gmail.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 1/5] phy: amlogic: enable/disable clkin during Amlogic
 USB PHY init/exit
Message-ID: <ZFjAmCcc/35MhcuI@matsya>
References: <20230426102922.19705-1-ddrokosov@sberdevices.ru>
 <20230426102922.19705-2-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230426102922.19705-2-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_022757_446757_F781E3EB 
X-CRM114-Status: UNSURE (   9.47  )
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

On 26-04-23, 13:29, Dmitry Rokosov wrote:
> Previously, all Amlogic boards used the XTAL clock as the default board
> clock for the USB PHY input, so there was no need to enable it.
> However, with the introduction of new Amlogic SoCs like the A1 family,
> the USB PHY now uses a gated clock. Hence, it is necessary to enable
> this gated clock during the PHY initialization sequence, or disable it
> during the PHY exit, as appropriate.

Applied to phy/next, thanks

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
