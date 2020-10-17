Return-Path: <SRS0=WgVV=DY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768FFC433DF
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Oct 2020 06:09:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEF772072C
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Oct 2020 06:09:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IZSekAOv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEF772072C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bnw6MKtpjdsePTlgO0GoOMwb0yFHNs1Ud6UqdD3XPlE=; b=IZSekAOvASGpfRivTnpKpDnK4
	yXs5eyxKRFpKpgBzp3YR1dbP3PSHjJA09TO5Ck3m1o0s3oJxFgRAO8+OdVXdU7Qxn7VccIWPbgO5Z
	MCt81N0CS3NkzPOyk2T7+2eSt7xriCkqLBcDleGH/szu3hME8uh+sX26ZD2ORSLMuDrcRLFv8mPv3
	J/l0tfcHryZWj4OOkLY8JDydLBJf4+Zq3AM2liXwINtNuO87qYvjKzoKMhwYV2Zbj8+Ew5GQ+BRRY
	4c8K/3qHgSnnDz6cFu8SwoCdTtC09sU0jG33obEOpFnrGh/+AHq2lDT3eJdR+kuYaGPUBj6CdpJnm
	1qBhndJJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTfOt-00007Q-MV; Sat, 17 Oct 2020 06:09:07 +0000
Received: from asavdk4.altibox.net ([109.247.116.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTfOr-000074-9X
 for linux-amlogic@lists.infradead.org; Sat, 17 Oct 2020 06:09:06 +0000
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0F7AB8055C;
 Sat, 17 Oct 2020 08:09:00 +0200 (CEST)
Date: Sat, 17 Oct 2020 08:08:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 0/4] drm: panel: add support for TDO tl070wsh30 panel
Message-ID: <20201017060858.GA2242298@ravnborg.org>
References: <20200915121912.4347-1-narmstrong@baylibre.com>
 <9f720791-2718-205f-d101-0811a679f54e@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f720791-2718-205f-d101-0811a679f54e@baylibre.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=Gz7jjY5onqyk-6-21tUA:9
 a=CjuIK1q_8ugA:10 a=H9xpq_V2WxwA:10 a=QYH75iMubAgA:10
 a=E9Po1WZjFZOl8hwRPBS3:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201017_020905_464964_574E873A 
X-CRM114-Status: GOOD (  10.77  )
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
Cc: linux-amlogic@lists.infradead.org, thierry.reding@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil.

On Tue, Sep 29, 2020 at 11:25:17AM +0200, Neil Armstrong wrote:
> Hi Sam,
> 
> Is there anything more to change ?
Sorry for taking so long to get back to you on this.

All patches looks good and are:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I assume you will apply the patches.

	Sam

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
