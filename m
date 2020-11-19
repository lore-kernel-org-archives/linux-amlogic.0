Return-Path: <SRS0=1amn=EZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,WEIRD_PORT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 859DFC63697
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 18:35:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05BCC22259
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2020 18:35:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RMSexCq7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsWxETeb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05BCC22259
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VUiBT4fIeQ78d6cw42T+2oSmZ0RwlNjBA5rYCSvwjUQ=; b=RMSexCq7ovEk+0zGym0kizwON
	r+skVzWRtXNihIp5EVmt0zYn5jCXQHas7EWMZk+LbWaAhUCyeAv0zNTqZmmvnBZhsJcflonz1lKGP
	/LTwPajDi03JFAh1/06VwGxx/TSjcuRrC6+bLzIyUonjGjf3hosceYd3UKVtkuVnjCrVmETsaC2xp
	a5sOxXQxrnqdnHSXIfQCtCTe77qkJycy0pZMPBJ91mX8K36PX7sgNnWzCrxsEfGkvbQxJA1CfVSoB
	lNlaATaAmloYohi+x99rtFZ9suPmWny+CyCPM8or48oM6LwtwByHkfH0QMOOY0dUOmXJcCo67B71l
	0qZ3qf6OQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfoly-0000TY-LU; Thu, 19 Nov 2020 18:35:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfolv-0000Sx-PP; Thu, 19 Nov 2020 18:35:08 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A391A22255;
 Thu, 19 Nov 2020 18:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605810906;
 bh=bJya95Z1CX+o+B+3wr8vb6PON5dqknScWdUZYecD8RY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MsWxETebIKzGKBcYQlrhF/UiDv9lka8MDJqESPfFYr1ZkyeaAtFqbYFpvvRifTpTi
 xuFCTTb4z7kiHp49CkkgbP2QlrpUvfzFF2sm33sokEQfeEX6pgqTbrN5/TDF+BsuZT
 niEt4Jjh9v4YLFrR6vrNHJbHEPJSFtBjLE7M/wJ4=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kfols-00C36C-DX; Thu, 19 Nov 2020 18:35:04 +0000
MIME-Version: 1.0
Date: Thu, 19 Nov 2020 18:35:04 +0000
From: Marc Zyngier <maz@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: next/master bisection: baseline.dmesg.emerg on meson-gxbb-p200
In-Reply-To: <1jr1op8bbc.fsf@starbuckisacylon.baylibre.com>
References: <5fb5e094.1c69fb81.a2014.2e62@mx.google.com>
 <a0bec7c4-9bec-8858-4879-52f4688d9992@collabora.com>
 <630e00e83cdd07ee5a0eaba9d3479554@kernel.org>
 <3f54de27-0fef-c5a1-8991-0a0614c90667@baylibre.com>
 <c76273f5fe483766e6a7f509f82d928a@kernel.org>
 <f59922c6-69f5-c70e-b424-0659bf91a4fd@collabora.com>
 <1jr1op8bbc.fsf@starbuckisacylon.baylibre.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <00a10c12a4eb2a9cdd9f50e88a293c3f@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jbrunet@baylibre.com, guillaume.tucker@collabora.com,
 narmstrong@baylibre.com, kernelci-results@groups.io, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 martin.blumenstingl@googlemail.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_133508_063456_F75D8B18 
X-CRM114-Status: GOOD (  24.02  )
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
Cc: kernelci-results@groups.io, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2020-11-19 18:13, Jerome Brunet wrote:
> On Thu 19 Nov 2020 at 19:04, Guillaume Tucker
> <guillaume.tucker@collabora.com> wrote:
> 
>> Hi Marc,
>> 
>> On 19/11/2020 11:58, Marc Zyngier wrote:
>>> On 2020-11-19 10:26, Neil Armstrong wrote:
>>>> On 19/11/2020 11:20, Marc Zyngier wrote:
>>>>> On 2020-11-19 08:50, Guillaume Tucker wrote:
>>>>>> Please see the automated bisection report below about some kernel
>>>>>> errors on meson-gxbb-p200.
>>>>>> 
>>>>>> Reports aren't automatically sent to the public while we're
>>>>>> trialing new bisection features on kernelci.org, however this one
>>>>>> looks valid.
>>>>>> 
>>>>>> The bisection started with next-20201118 but the errors are still
>>>>>> present in next-20201119.  Details for this regression:
>>>>>> 
>>>>>>   https://kernelci.org/test/case/id/5fb6196bfd0127fd68d8d902/
>>>>>> 
>>>>>> The first error is:
>>>>>> 
>>>>>>   [   14.757489] Internal error: synchronous external abort: 
>>>>>> 96000210
>>>>>> [#1] PREEMPT SMP
>>>>> 
>>>>> Looks like yet another clock ordering setup. I guess different 
>>>>> Amlogic
>>>>> platforms have slightly different ordering requirements.
>>>>> 
>>>>> Neil, do you have any idea of which platform requires which 
>>>>> ordering?
>>>>> The variability in DT and platforms is pretty difficult to follow 
>>>>> (and
>>>>> I don't think I have such board around).
>>>> 
>>>> The requirements should be the same, here the init was done before 
>>>> calling
>>>> dw_hdmi_probe to be sure the clocks and internals resets were 
>>>> deasserted.
>>>> But since you boot from u-boot already enabling these, it's already 
>>>> active.
>>>> 
>>>> The solution would be to revert and do some check in 
>>>> meson_dw_hdmi_init() to
>>>> check if already enabled and do nothing.
>>> 
>>> A better fix seems to be this, which makes it explicit that there is
>>> a dependency between some of the registers accessed from 
>>> meson_dw_hdmi_init()
>>> and the iahb clock.
>>> 
>>> Guillaume, can you give this a go on your failing box?
>> 
>> I confirm it solves the problem.  Please add this to your fix
>> patch if it's OK with you:
>> 
>>   Reported-by: "kernelci.org bot" <bot@kernelci.org>
>>   Tested-by: Guillaume Tucker <guillaume.tucker@collabora.com>
>> 
>> 
>> For the record, it passed all the tests when applied on top of
>> the "bad" revision found by the bisection:
>> 
>>   
>> http://lava.baylibre.com:10080/scheduler/alljobs?search=v5.10-rc3-1021-gb8668a2e5ea1
>> 
>> and the exact same test on the "bad" revision without the fix
>> consistently showed the error:
>> 
>>   http://lava.baylibre.com:10080/scheduler/job/374176
>> 
>> 
>> Thanks,
>> Guillaume
>> 
>> 
>>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c 
>>> b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>>> index 7f8eea494147..52af8ba94311 100644
>>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>>> @@ -146,6 +146,7 @@ struct meson_dw_hdmi {
>>>      struct reset_control *hdmitx_ctrl;
>>>      struct reset_control *hdmitx_phy;
>>>      struct clk *hdmi_pclk;
>>> +    struct clk *iahb_clk;
>>>      struct clk *venci_clk;
>>>      struct regulator *hdmi_supply;
>>>      u32 irq_stat;
>>> @@ -1033,6 +1034,13 @@ static int meson_dw_hdmi_bind(struct device 
>>> *dev, struct device *master,
>>>      }
>>>      clk_prepare_enable(meson_dw_hdmi->hdmi_pclk);
>>> 
>>> +    meson_dw_hdmi->iahb_clk = devm_clk_get(dev, "iahb");
>>> +    if (IS_ERR(meson_dw_hdmi->iahb_clk)) {
>>> +        dev_err(dev, "Unable to get iahb clk\n");
>>> +        return PTR_ERR(meson_dw_hdmi->iahb_clk);
>>> +    }
>>> +    clk_prepare_enable(meson_dw_hdmi->iahb_clk);
> 
> If you guys are going ahead with this fix, this call to
> clk_prepare_enable() needs to be balanced with clk_disable_unprepare() 
> somehow

Yup, good point.

Although this driver *never* disables any clock it enables, and leaves 
it
to the main DW driver, which I guess makes it leak references.

So all 3 clocks need fixing.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
