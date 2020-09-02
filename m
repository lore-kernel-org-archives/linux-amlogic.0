Return-Path: <SRS0=TE1J=CL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB283C433E7
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 15:38:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACB0620678
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 15:38:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0qlrEdK0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lechnology.com header.i=@lechnology.com header.b="nJKXAQ9t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACB0620678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lechnology.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ztoJiTmSZ+Ty5yhbJ1vUfy1nhxMs+0G6dUkVz/0GpfA=; b=0qlrEdK0YyRD+NkTkdc9mL1Oo
	cLy9K1tiN59qIubuzdI4wukI+yfhL0fspXseDYTXGxrLtTGXWUBjhSgz2v1mI0vtQbfCBdSYknot8
	uqNfoUBYVA5hgMDX9WeAVCOvIuS9X4/QKNZYcl0jAsihLdWrL50wQkVgehDUBvMojQnPeF4EPusUn
	SnZZ3rNKGAXFxZ5iXlIwAbqB+FvK6bX/6OJaJ4Lv7XcZyUYlIX9ELZbe4oCX3H3sWz6qAm4XxGQK7
	EQrMKJXYS3sKX4WPbS7VfoQ6UcNrcHAx9FGXiQIUhfxZRKPJ0e4IxQXSi5jq7G4Xv2YHV7uG/Ougo
	PT7aKbkYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDUpy-0005Tw-Fy; Wed, 02 Sep 2020 15:38:14 +0000
Received: from vern.gendns.com ([98.142.107.122])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDUpv-0005Kp-Fs; Wed, 02 Sep 2020 15:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yyRr2hG0sCpKaJrgcmdtUkD7ebP0o5jhSFj3BbVNnkY=; b=nJKXAQ9tTQ7ZOwHuo+uRhTe9wb
 Ku9XOzShdKOOPlPWSCEANG6GEWBUMdaJDMTYS83nlrOfDREaCBxE8jCDCuQzC2vtP07fIn7IhKM0y
 rVChBa9HHXDzqZ1z7NGh2wJFVWC/Oyn2NkEp7h9KYv5XQrm4/3IRTAmjJ5u5A5y+CLQ87HAncPx5U
 AjMFTiQhBC0XTWoSjUOcXKkuTYKlGKz4KqYRWDvgxGrv8MhfhXqQxVs8V5PGhoZWwvKbjxKEi4SW3
 LJQEAp3PFP8+Vxh6c7fIqucOie6m3qQxei1y92ea+bsnXgD2P3HlqrGFbWWw4DK9N8b8c8tU8SOiF
 JmldU8Xw==;
Received: from [2600:1700:4830:165f::19e] (port=47966)
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1kDUpB-0002MF-Ky; Wed, 02 Sep 2020 11:37:25 -0400
Subject: Re: [PATCH 09/10] clk: davinci: Add missing kerneldoc
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Sekhar Nori <nsekhar@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20200902150348.14465-1-krzk@kernel.org>
 <20200902150348.14465-9-krzk@kernel.org>
From: David Lechner <david@lechnology.com>
Message-ID: <9c273343-d3ef-a8e1-368e-366391d709ba@lechnology.com>
Date: Wed, 2 Sep 2020 10:37:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200902150348.14465-9-krzk@kernel.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_113811_615814_46831CD6 
X-CRM114-Status: UNSURE (   8.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 9/2/20 10:03 AM, Krzysztof Kozlowski wrote:
> Add missing kerneldoc to fix compile warning:
> 
>    drivers/clk/davinci/da8xx-cfgchip.c:578: warning: Function parameter or member 'dev' not described in 'da8xx_cfgchip_register_usb1_clk48'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: David Lechner <david@lechnology.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
