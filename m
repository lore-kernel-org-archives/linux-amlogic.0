Return-Path: <SRS0=ofbE=5H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C154DC54FCF
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Mar 2020 19:39:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93F9D2072E
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Mar 2020 19:39:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I0a2EwQf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RpzIB6/N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93F9D2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UpvffaonROFfXk8fesdQL4AV8qwcE46d1mFq2a1VZx8=; b=I0a2EwQfEHoe3VHqSlj/OVOwK
	QCJeAOZP/GfDzSFvASfrdx9+yaccxh9FlYuv0zYpA4FINlsVUDDv/EV7LL5TTM2kN/mtjNc7ISbgs
	ZAzZw+YhyrcNThRPKd1xaomkgzPHcv4HLZJW/YQAyJuu6jXuCH9woz7GCZ3oFTAlFyvonI5q+nY+K
	Aup5YIMPGycidSGHu/XXUD3atJc2z81GuvYo6JbyOiXRKnNM1T7vX3uBTDk7GLPHKzj0WjstjeVNS
	cinASRwbwcPVVwiml3SraGfoPbpr4Js7xBbXtcdJ8LDmTF/acT+wpHiHp0l1+rjAKPXs+NDgZKPek
	/8+VFartQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jG6RR-0008Cv-G4; Sun, 22 Mar 2020 19:39:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jG6RP-0008CW-0h; Sun, 22 Mar 2020 19:39:24 +0000
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E2772070A;
 Sun, 22 Mar 2020 19:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584905962;
 bh=aGGx1nH/psZA7otCHWR4bp5UFDdxLz4Yls1e8FeqbP8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RpzIB6/NcuUVL2rRNhtd463rKUSmMi1zOKWJ7aOy89Esuu+Q+/QRp6HstMSs9FGn9
 inmSJqWLSN0wR51pFwU8rnc8CDiAcu6Tf9IE78z9qzzL87ikGPu3sKiEsitLF1ibY+
 UWYLCHX1KEqkG4cc5p3hFaSV1vRn/OTd7bOX/sVA=
Date: Sun, 22 Mar 2020 15:39:21 -0400
From: Sasha Levin <sashal@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH AUTOSEL 5.4 08/35] ASoC: meson: g12a: add tohdmitx reset
Message-ID: <20200322193921.GP4189@sasha-vm>
References: <20200316023411.1263-1-sashal@kernel.org>
 <20200316023411.1263-8-sashal@kernel.org>
 <1ja74gg0v8.fsf@starbuckisacylon.baylibre.com>
 <1jsgi0ckcc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jsgi0ckcc.fsf@starbuckisacylon.baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200322_123923_079037_C9180169 
X-CRM114-Status: UNSURE (   8.98  )
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
Cc: alsa-devel@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Mar 22, 2020 at 07:31:31PM +0100, Jerome Brunet wrote:
>
>On Mon 16 Mar 2020 at 09:28, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>> On Mon 16 Mar 2020 at 03:33, Sasha Levin <sashal@kernel.org> wrote:
>>
>>> From: Jerome Brunet <jbrunet@baylibre.com>
>>>
>>> [ Upstream commit 22946f37557e27697aabc8e4f62642bfe4a17fd8 ]
>>>
>>> Reset the g12a hdmi codec glue on probe. This ensure a sane startup state.
>>>
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>> Link: https://lore.kernel.org/r/20200221121146.1498427-1-jbrunet@baylibre.com
>>> Signed-off-by: Mark Brown <broonie@kernel.org>
>>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>>
>> Hi Sasha,
>>
>> The tohdmitx reset property is not in the amlogic g12a DT in v5.4.
>> Backporting this patch on v5.4 would break the hdmi sound, and probably
>> the related sound card since the reset is not optional.
>>
>> Could you please drop this from v5.4 stable ?
>
>Hi Sasha,
>
>I just received a notification that this patch has been applied to 5.4
>stable.
>
>As explained above, it will cause a regression.
>Could you please drop it from v5.4 stable ?

Hi Jerome,

Sorry - I've missed your previous mail. Now dropped from all trees.

-- 
Thanks,
Sasha

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
