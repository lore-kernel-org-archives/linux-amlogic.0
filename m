Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399CEC433E2
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 00:02:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 887A8208DB
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 00:02:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GyGUZmqC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxw/TupX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 887A8208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qyR46V58e/bJ/vUemO7B5n+/u0/qTyyxaVdlxcj2+G4=; b=GyGUZmqCprw3oSobGW1/yT01f
	cr6QCrcpZXYTHwGJQTAjNsuaGGPXt9hXXf3+wWmI/pBeNLY9T0cfF91JWQIdfCSZu8eRrW4ZZusig
	1+M8SGh1IoTFowe1e2TuxEttF1IlSB19lT1XrG4E2iEYnNVa/gDgAdoJcwk5wbv4O99Fndym4zCfz
	75bda9gnsvekfhA98lllHLPsZiIgo+ExgQ2hF2vFE0uK0pJVshp+rogtpQPBmJnvEHvm/GLs6vAtM
	cS1DoBAdmoIdHHKvk3VjeCWwHN/v064TABcIGbaq2pnyMeL3CmgzJpCr+kyojZBBDoXhAZZuUUFtn
	1hmO9x7ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHyQ5-00056a-Pl; Tue, 15 Sep 2020 00:02:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHyQ3-00056A-7U; Tue, 15 Sep 2020 00:01:59 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5A9720829;
 Tue, 15 Sep 2020 00:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600128118;
 bh=aDtVpbNbbuicIiX3Coqdnk0nSk8LgHP0iQgY2aJiAKg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=jxw/TupX0o/bxM+BFImHj3AYgjkwRrhgfN4QNxrlO0/2vP3Y2+qTlBqKSsT/mGNt+
 Nn2TvfgA1BdnQGrLZiqOBBH2ULH7qVuChk6hhqYaTkE0meClo06iCZOLwzTp0H0C1r
 8Ko8S1tUiav57sb8GyidbjFjEt0WJXhohKvcYwCA=
MIME-Version: 1.0
In-Reply-To: <20200911153441.GA18190@kozik-lap>
References: <20200902150348.14465-1-krzk@kernel.org>
 <20200902163558.GA4137028@piout.net> <20200911153441.GA18190@kozik-lap>
Subject: Re: [PATCH 01/10] clk: at91: Drop unused at91sam9g45_pcr_layout
From: Stephen Boyd <sboyd@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 14 Sep 2020 17:01:56 -0700
Message-ID: <160012811662.4188128.10109140799333292326@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_200159_353919_E308CF29 
X-CRM114-Status: GOOD (  15.33  )
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
Cc: linux-arm-msm@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, David Lechner <david@lechnology.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Ripard <mripard@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-amlogic@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Krzysztof Kozlowski (2020-09-11 08:34:41)
> On Wed, Sep 02, 2020 at 06:35:58PM +0200, Alexandre Belloni wrote:
> > On 02/09/2020 17:03:39+0200, Krzysztof Kozlowski wrote:
> > > The at91sam9g45_pcr_layout is not used so drop it to fix build warning:
> > > 
> > >   drivers/clk/at91/at91sam9g45.c:49:36: warning:
> > >     'at91sam9g45_pcr_layout' defined but not used [-Wunused-const-variable=]
> > > 
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > 
> > > ---
> > >  drivers/clk/at91/at91sam9g45.c | 7 -------
> > >  1 file changed, 7 deletions(-)
> > > 
> 
> Hi Stephen,
> 
> If the dev_err_probe() waits/skips/goes to /dev/null, then how about the
> fixes in the series? This patch and few other?

Yes if dev_err_probe() is superseded by Rob's work then the fixes should
be fine to pick up. Can you resend the fixes?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
