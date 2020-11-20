Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3651C64E69
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 11:11:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 688F222201
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 11:10:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fa3AMF0s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBdHfcXK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 688F222201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1G/n6p+IKB8TU3Nwo1Dpwt4YMau+RuaA8luHccdIUxA=; b=fa3AMF0sJGuN6315udExqYg3W
	UiYMo8SHEws8luZWcVARlH6AB+Ka1NUX+w1SYqBxGdANvt5XHcFUxk8tTdQExmq9P8o58w1VYL/k1
	84Ah+Brn3NcilHYwGM4JD7yQ4vDPskMNf2k32tmBWzlcxiw4enQIbVLO+geUMfZpvoYOAcZ2uXQvT
	EClI2PREKkg1UPu3MrgK2QPTJVRMfsqoBowN08gFz0RA+gmEzRk2oyFy+PM1sQCQvM42j+WkmGFVn
	dWOVe3dEomZFt14XWX6+FD1XZPn8jllG37vxrDfIHdHE3MC3s9C+hT5AAREP5iatZzTeegUQVISPu
	vQ4Cak+Jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg4Ja-0006rk-GW; Fri, 20 Nov 2020 11:10:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg4JZ-0006rG-1z; Fri, 20 Nov 2020 11:10:53 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6830822201;
 Fri, 20 Nov 2020 11:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605870651;
 bh=yaMyGLR6+HErwF5fFCq7lMMRoVDnM2QpDVBXqkEnsds=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PBdHfcXKscivK28jgHEaCCLTplQlGEUp5fR8ZY+phVIf1SWL7ecBj3ZuQ5z0AU2rN
 UysVnyL5nosXSP94td0CLPwY4xkbwIAk2DLBWV6KsXVjXC+Rn97qv+MN9AppIYWo9r
 dyC9I5SfM/wPrYf4SvNXTN+Z0FisFqjW41Vj+u14=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kg4JU-00CEWA-Sm; Fri, 20 Nov 2020 11:10:49 +0000
MIME-Version: 1.0
Date: Fri, 20 Nov 2020 11:10:48 +0000
From: Marc Zyngier <maz@kernel.org>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: [PATCH 2/2] drm/meson: dw-hdmi: Enable the iahb clock early enough
In-Reply-To: <966e90ba-5b38-9ba5-65b3-1a17dbd51871@collabora.com>
References: <20201120094205.525228-1-maz@kernel.org>
 <20201120094205.525228-3-maz@kernel.org>
 <966e90ba-5b38-9ba5-65b3-1a17dbd51871@collabora.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <7e7ff26fdbc8540749522c23997549f6@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: guillaume.tucker@collabora.com, narmstrong@baylibre.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_061053_185391_18AFDA46 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2020-11-20 10:54, Guillaume Tucker wrote:
> On 20/11/2020 09:42, Marc Zyngier wrote:
>> Instead of moving meson_dw_hdmi_init() around which breaks existing
>> platform, let's enable the clock meson_dw_hdmi_init() depends on.
>> This means we don't have to worry about this clock being enabled or
>> not, depending on the boot-loader features.
>> 
>> Fixes: b33340e33acd ("drm/meson: dw-hdmi: Ensure that clocks are 
>> enabled before touching the TOP registers")
>> Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> 
> Although I am triaging kernelci bisections, it was initially
> found thanks to our friendly bot.  So if you're OK with this, it
> would most definitely appreciate a mention:
> 
>   Reported-by: "kernelci.org bot" <bot@kernelci.org>

Sure. Neil can add this when (and if) he applies these patches.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
