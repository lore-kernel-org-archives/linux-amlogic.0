Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C72DE81E1B
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Oct 2023 17:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXQuDQ2qyRFhuapokiFaPo0d3+NcdJYxE7PgxZh+p9s=; b=T2fP6YjT2+ZNav
	fMwerh4aeBAYo223xCT/8bIG2aGPoKm4J1A0VtfV+11oHgdq91OUOeCIbhRAdvTFa54Oh1lm9lVEF
	eUrtp7lz330Hju0d26kt80nUR95soSWeMpogrhl4R0Ykcqb0BGDs13aVczTUmsCisek7aI5Pv16aB
	2C9ex0ITuKUl2fSAOk8O4/3BJAdGc4+p7dsS1mmMLlVMtesWJ5Gu6gcPrYHZjwvSn2P+6D20FlFLH
	MzFKVwbu13me9lkqckXtSiDK8yVPyoh5jakd1Jgb8G8h3ocdz3UitnlqB0jHhW+bEjmKNFtDobn27
	PP1t0/uAAtogyAq0Kzjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qop5o-006HbX-1V;
	Fri, 06 Oct 2023 17:58:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qop5k-006Hav-34
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Oct 2023 17:58:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5E62D61452;
	Fri,  6 Oct 2023 17:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C8CC433CA;
	Fri,  6 Oct 2023 17:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696615104;
	bh=wLekRGvd4kg2nVJYGE/aJQU67LExRJ4hntpmaO1oovE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKwIEItboRF6SItins8qFFnAAHtJklFR5vwfGJBRx2rKUTzl3BHrx3rxMkMkFKK/E
	 7X+65dsua7+xJO87b54GFPnfvjZlefBDuQffwPzyT6Br5SYwSULl0PY54xBibllY0E
	 JPNTBFIrIONspktehpjrrN2meMx3NbqTbzdxvt4BGDabjObcNFJJ3pgHA1nrqls7TC
	 9q4r67H7o7uPhprQK0JLzfT5JI7nBlMKHpO56gp3WfYjzs+Z++tJwGMSTfOBQcMrmL
	 jezZ167hGG0HcU2cR8taZneLuJKuCSBBfmpVP1imDxE1zjy8n6GZD1agAeFl/6uMqK
	 EXOeKaDp08RLA==
Received: (nullmailer pid 72249 invoked by uid 1000);
	Fri, 06 Oct 2023 17:58:22 -0000
Date: Fri, 6 Oct 2023 12:58:22 -0500
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Da Xue <da.xue@libretech.co>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add libretech
 cottonwood support
Message-ID: <169661510170.72194.9933533745144399283.robh@kernel.org>
References: <20231006103500.2015183-1-jbrunet@baylibre.com>
 <20231006103500.2015183-2-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231006103500.2015183-2-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_105825_032763_7341A7DD 
X-CRM114-Status: UNSURE (   7.77  )
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


On Fri, 06 Oct 2023 12:34:59 +0200, Jerome Brunet wrote:
> Add compatibles for the Libretech cottonwood board family
> 
> Co-developed-by: Da Xue <da.xue@libretech.co>
> Signed-off-by: Da Xue <da.xue@libretech.co>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
